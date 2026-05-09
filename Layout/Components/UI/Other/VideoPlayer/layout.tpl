<?php
/** @var array $data */

$file = $data['src'];
$fileType = pathinfo($file, PATHINFO_EXTENSION);

$videoId = App\Layout\Components\UI\Other\VideoPlayer\Layout::generateVideoId($data['src'], $data['link']);

if (!function_exists('escapeAttr')) {
    function escapeAttr($attr): string
    {
        return htmlspecialchars($attr, ENT_QUOTES, 'UTF-8');
    }
}
?>

<?php if ($data['src'] || $data['link'] || $data['poster']): ?>
    <div class="video-player <?php echo $data['cn'] ?>"
         data-video-id="<?php echo $videoId ?>">
        <div class="video-player__container">
            <?php if (!$data['link']): ?>
                <video playsinline
                       <?php foreach ($data['attrs'] as $key): ?>
                            <?= escapeAttr($key) ?>
                       <?php endforeach; ?>
                       class="video-player__content"
                       poster="<?= $data['poster'] ?>">
                    <source src="<?= $file ?>" type="video/<?= $fileType ?>">
                    Ваш браузер не поддерживает видео.
                </video>

                <button class="video-player__play-button">
                    <div class="video-player__play-button-container">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                            <path d="M7 4.98756C7 4.0164 7 3.53081 7.20249 3.26314C7.37889 3.02995 7.64852 2.88565 7.9404 2.86823C8.27544 2.84822 8.67946 3.11757 9.48752 3.65628L20.0031 10.6667C20.6708 11.1118 21.0046 11.3343 21.1209 11.6149C21.2227 11.8601 21.2227 12.1357 21.1209 12.381C21.0046 12.6615 20.6708 12.8841 20.0031 13.3292L9.48752 20.3396C8.67946 20.8783 8.27544 21.1476 7.9404 21.1276C7.64852 21.1102 7.37889 20.9659 7.20249 20.7327C7 20.465 7 19.9795 7 19.0083V4.98756Z" fill="white" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                </button>
            <?php else: ?>
                <iframe loading="lazy"
                        class="video-player__content"
                        src="<?= $data['link'] ?>"
                        frameborder="0"
                        allow="encrypted-media; fullscreen; picture-in-picture"
                        data-src="<?= $data['link'] ?>">
                </iframe>
            <?php endif; ?>
        </div>
    </div>
<?php endif; ?>