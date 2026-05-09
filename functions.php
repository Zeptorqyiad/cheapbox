<?php
/*
 * Simplex Framework core functions
 * Loaded automatically from the bootstrap
 */

use Composer\InstalledVersions;
use Simflex\Core\Buffer;
use Simflex\Core\DB;

/**
 * Get environment variable
 * @param string $name
 * @param mixed|null $defaultValue
 * @return mixed|null
 */
function env(string $name, mixed $defaultValue = null): mixed
{
    return array_key_exists($name, $_ENV) ? $_ENV[$name] : $defaultValue;
}

/**
 * Remove DOCUMENT_ROOT from the path
 * @param string $path Path to process
 * @return string Processed path
 */
function removeRoot(string $path): string
{
    return str_replace(SF_ROOT_PATH, '', $path);
}

/**
 * Get asset path
 * @param string $path Relative path to the asset
 * @param bool $siteOnly If set to true, returns only site assets
 * @return string Full path to the asset
 */
function asset(string $path, bool $siteOnly = false): string
{
    if (!$siteOnly && SF_LOCATION == SF_LOCATION_ADMIN) {
        return removeRoot(SF_CORE_ROOT_PATH) . '/Admin/theme/new/' . $path;
    }

    return '/assets/' . $path;
}

/**
 * Get full URL
 * @param string $path Path to the resource
 * @param array $get GET parameters
 * @return string Full URL
 */
function url(string $path, array $get = []): string
{
    $q = http_build_query($get);
    return ('http' . ($_SERVER['HTTPS'] ? 's' : '')) . '://' . $_SERVER['HTTP_HOST'] . $path . ($q ? ('?' . $q) : '');
}

/**
 * Get Simflex version
 * @return string Simflex version
 */
function getSimflexVersion(): string
{
    return Buffer::getOrSet('version', function () {
        if (!InstalledVersions::isInstalled('growtask/simflex')) {
            return 'N/A';
        }

        return InstalledVersions::getPrettyVersion('growtask/simflex');
    });
}

/**
 * Renders an SVG icon reference from a sprite file
 * @param string $iconName Name of the icon to reference
 * @param string $className Optional CSS classes to apply
 * @return string The SVG HTML with sprite reference
 */
function renderIcon(string $iconName, string $className = ''): string {
    return sprintf(
        '<svg class="%s" aria-hidden="true"><use href="/assets/icons/icons.svg#icon-%s"></use></svg>',
        htmlspecialchars($className),
        htmlspecialchars($iconName)
    );
}

/**
 * Generates HTML attribute string from array of key-value pairs
 * @param array<string,mixed> $attributes Key-value pairs of HTML attributes
 * @return string Generated HTML attribute string with escaped values
 */
function buildAttrs(array $attributes = []): string
{
    if (empty($attributes)) {
        return '';
    }

    return implode(' ', array_map(
        fn($key, $value) => sprintf('%s="%s"', $key, htmlspecialchars($value, ENT_QUOTES, 'UTF-8')),
        array_keys($attributes),
        $attributes
    ));
}

/**
 * Transform current path to add target page number, and retain other GET parameters
 * @param int $page Target page
 * @param int $maxPage Max page nr
 * @return string New URL
 */
function paginate(int $page, int $maxPage = PHP_INT_MAX, string $name = 'page'): string
{
    // fallback
    if ($page < 0 || $page > $maxPage) {
        return '';
    }

    $request = \Simflex\Core\Container::getRequest();

    $extra = [];
    if ($page) {
        $extra[$name] = $page;
    }

    return url($request->getPath() . '?' . $request->buildQuery($extra, [$name]));
}

function getServiceOptions(string $categoryName): array
{
    $options = [];

    $categoryId = DB::result(
        "SELECT category_id FROM service_category WHERE name = ?",
        'category_id',
        [$categoryName]
    );

    if (!$categoryId) {
        return [];
    }

    // === Услуги из service_big === //
    $sbIds = DB::arr(
        "SELECT sb_id FROM service_p2c_big WHERE category_id = ?",
        'sb_id',
        [$categoryId]
    );

    foreach ($sbIds as $sbId) {
        $service = DB::assoc(
            "SELECT name, path, short, color, icon, npp FROM service_big WHERE sb_id = ? AND is_active = 1",
            false,
            false,
            [$sbId]
        );

        if (!empty($service)) {
            $s = $service[0];
            if (!empty($s['name']) && !empty($s['path'])) {
                $options[] = [
                    'npp' => $s['npp'],
                    'text' => $s['name'],
                    'link' => $s['path'],
                    'short' => $s['short'],
                    'color' => $s['color'],
                    'icon' => $s['icon'],
                ];
            }
        }
    }

    // === Услуги из service_small  === //
    $smallIds = DB::arr(
        "SELECT service_small_id FROM service_p2c_small WHERE category_id = ?",
        'service_small_id',
        [$categoryId]
    );

    foreach ($smallIds as $smallId) {
        $service = DB::assoc(
            "SELECT name, path, short, color, icon, npp FROM service_small WHERE service_small_id = ? AND is_active = 1",
            false,
            false,
            [$smallId]
        );

        if (!empty($service)) {
            $s = $service[0];
            if (!empty($s['name']) && !empty($s['path'])) {
                $options[] = [
                    'npp' => $s['npp'],
                    'text' => $s['name'],
                    'link' => $s['path'],
                    'short' => $s['short'],
                    'color' => $s['color'],
                    'icon' => $s['icon'],
                ];
            }
        }
    }

    usort($options, function($a, $b) {
        return ($a['npp'] ?? 999) <=> ($b['npp'] ?? 999);
    });

    return $options;
}

/**
 * Возвращает константу цвета из ServiceExampleCardColor на основе строки.
 * @param string $colorStr Строковое значение цвета ('main', 'red' и т.д.)
 * @return App\Layout\Components\Cards\ServiceExampleCard\ServiceExampleCardColor Константа цвета
 */
function getServiceCardColor(string $colorStr): App\Layout\Components\Cards\ServiceExampleCard\ServiceExampleCardColor
{
    $colorMap = [
        'main' => App\Layout\Components\Cards\ServiceExampleCard\ServiceExampleCardColor::Main,
        'red' => App\Layout\Components\Cards\ServiceExampleCard\ServiceExampleCardColor::Red,
        'green' => App\Layout\Components\Cards\ServiceExampleCard\ServiceExampleCardColor::Green,
        'blue' => App\Layout\Components\Cards\ServiceExampleCard\ServiceExampleCardColor::Blue,
    ];

    return $colorMap[strtolower($colorStr)] ?? App\Layout\Components\Cards\ServiceExampleCard\ServiceExampleCardColor::Main;
}