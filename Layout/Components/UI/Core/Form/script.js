document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelectorAll('.js--form-feedback');

    if (!form) return;

    const submitBtn = Array.from(form).map(element => element.querySelector('[type="submit"]'));

    const validators = Array.from(form).map((element) => [
        new PhoneValidator(element, '.text-input__field[name="phone"]'),
    ]);

    form.forEach((element) => element.addEventListener('submit', async e => {
        e.preventDefault();

        if (!validators) {
            console.warn('Validation failed');
            return;
        }

        toggleLoading(submitBtn, true);

        const fd = new FormData(element);

        try {
            const res = await fetch('/form/', {method: 'POST', body: fd});
            const data = await res.json();

            modalManager.open(data.success ? 'success-modal' : 'error-modal');
        } catch {
            modalManager.open('error-modal');
        } finally {
            toggleLoading(submitBtn, false);
        }
    }));

    function toggleLoading(button, isLoading) {
        button.disabled = isLoading;
    }
})