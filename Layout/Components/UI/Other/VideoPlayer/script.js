/**
 * @fileoverview Скрипт управления видеоплеером с поддержкой локальных и внешних видео
 * @requires DOM
 * @author Your Name
 */

document.addEventListener('DOMContentLoaded', () => {
    const videoPlayers = document.querySelectorAll('.video-player');
    const viewsCounted = new Set();

    /**
     * Получает уникальный идентификатор видео
     * @param {HTMLElement} videoBlock - Блок видеоплеера
     * @returns {string|null} URL видео или null, если видео не найдено
     */
    const getVideoIdentifier = (videoBlock) => {
        const iframe = videoBlock.querySelector('iframe');
        const video = videoBlock.querySelector('video');

        if (iframe) {
            return iframe.src;
        }
        if (video) {
            const source = video.querySelector('source');
            return source ? source.src : video.src;
        }
        return null;
    };

    /**
     * Останавливает все видео на странице
     */
    const pauseAllVideos = () => {
        videoPlayers.forEach(videoBlock => {
            const video = videoBlock.querySelector('video');
            if (video && !video.paused) {
                video.pause();
                const videoButtonPlay = videoBlock.querySelector('.video-player__play-button');
                videoButtonPlay.style.display = 'block';
            }
        });
    };

    /**
     * Отправляет информацию о просмотре видео на сервер
     * @param {HTMLElement} videoPlayer - Блок видеоплейера
     * @returns {Promise<void>}
     */
    async function countView(videoPlayer) {
        try {
            const videoIdentifier = getVideoIdentifier(videoPlayer);
            if (!videoIdentifier) {
                return;
            }

            const isExternal = videoPlayer.querySelector('iframe') !== null;

            const data = {
                videoUrl: videoIdentifier,
                type: isExternal ? 'external' : 'local',
                timestamp: new Date().toISOString(),
                pagePath: window.location.pathname,
                pageTitle: document.title,
            };

            const message = `Видео`;

            const encodedMessage = encodeURIComponent(message);

            await fetch(`/views/?filename=${encodedMessage}`);

        } catch (error) {
        }
    }

    /**
     * Проверяет, находится ли элемент в видимой области экрана
     * @param {HTMLElement} el - Проверяемый элемент
     * @returns {boolean} true, если элемент видим
     */
    function isElementInViewport(el) {
        const rect = el.getBoundingClientRect();
        return (
            rect.top >= 0 &&
            rect.left >= 0 &&
            rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
            rect.right <= (window.innerWidth || document.documentElement.clientWidth)
        );
    }

    videoPlayers.forEach(videoBlock => {
        const videoIdentifier = getVideoIdentifier(videoBlock);
        const isExternalVideo = videoBlock.querySelector('iframe') !== null;

        if (isExternalVideo) {
            // Обработка внешнего видео (iframe)
            const iframe = videoBlock.querySelector('iframe');
            let viewCountStarted = false;

            const checkInterval = setInterval(() => {
                if (!viewCountStarted && isElementInViewport(iframe)) {
                    setTimeout(() => {
                        if (isElementInViewport(iframe) && !viewsCounted.has(videoIdentifier)) {
                            countView(videoBlock);
                            viewsCounted.add(videoIdentifier);
                            clearInterval(checkInterval);
                        }
                    }, 5000);
                    viewCountStarted = true;
                }
            }, 1000);

        } else {
            // Обработка локального видео
            const videoButtonPlay = videoBlock.querySelector('.video-player__play-button');
            const video = videoBlock.querySelector('.video-player__content');
            let isPlaying = false;

            /**
             * Переключает отображение элементов управления
             * @param {boolean} show - Показывать ли элементы управления
             */
            const toggleControls = (show) => {
                video.controls = show;
                videoButtonPlay.style.display = show ? 'none' : 'block';
            };

            /**
             * Запускает воспроизведение видео
             */
            const playVideo = () => {
                video.play();
                isPlaying = true;
                toggleControls(true);

                // Останавливаем все другие экземпляры того же видео
                videoPlayers.forEach(otherBlock => {
                    if (otherBlock !== videoBlock && getVideoIdentifier(otherBlock) === videoIdentifier) {
                        const otherVideo = otherBlock.querySelector('video');
                        const otherButton = otherBlock.querySelector('.video-player__play-button');
                        if (otherVideo) {
                            otherVideo.pause();
                            if (otherButton) {
                                otherButton.style.display = 'block';
                            }
                        }
                    }
                });
            };

            /**
             * Останавливает воспроизведение видео
             */
            const pauseVideo = () => {
                video.pause();
                isPlaying = false;
                toggleControls(false);
            };

            // Подсчет просмотров для локальных видео
            video.addEventListener('timeupdate', () => {
                if (!viewsCounted.has(videoIdentifier) && video.currentTime > 1) {
                    countView(videoBlock);
                    viewsCounted.add(videoIdentifier);
                }
            });

            // Обработчик воспроизведения
            video.addEventListener('play', () => {
                isPlaying = true;
                toggleControls(true);
            });

            // Обработчик паузы
            video.addEventListener('pause', () => {
                if (!video.seeking) {
                    isPlaying = false;
                    toggleControls(false);
                }
            });

            // Обработчик окончания видео
            video.addEventListener('ended', () => {
                isPlaying = false;
                toggleControls(false);
            });

            // Обработчик кнопки воспроизведения
            videoButtonPlay.addEventListener('click', (event) => {
                event.stopPropagation();
                playVideo();
            });

            // Обработчик нажатия на видео
            video.addEventListener('click', (event) => {
                // Проверяем, было ли нажатие на элементы управления
                if (event.target === video) {
                    if (!isPlaying) {
                        playVideo();
                    }
                    event.preventDefault();
                }
            });

            // Обработчик касания для мобильных устройств
            let touchStartTime;
            video.addEventListener('touchstart', (event) => {
                touchStartTime = Date.now();
            });

            video.addEventListener('touchend', (event) => {
                const touchDuration = Date.now() - touchStartTime;
                // Если касание было коротким и не на элементах управления
                if (touchDuration < 200 && event.target === video) {
                    if (!isPlaying) {
                        playVideo();
                    }
                    event.preventDefault();
                }
            });
        }
    });
});