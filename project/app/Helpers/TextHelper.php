<?php

if (!function_exists('format_date')) {
    /**
     * @param  \Carbon\Carbon  $date
     * @param  string  $type
     * @param  bool  $timestamp
     * @return bool|int|string
     */
    function format_date(\Carbon\Carbon $date, string $type = 'full', bool $timestamp = false): bool|int|string
    {
        if ($timestamp) {
            return $date->getTimestamp();
        }
        if ($type == 'time') {
            return \Carbon\Carbon::parse($date)->format('H:i');
        }
        if ($type == 'time-second') {
            return \Carbon\Carbon::parse($date)->format('H:i:s');
        }
        if ($type == 'date') {
            return \Carbon\Carbon::parse($date)->format('d.m.Y');
        }
        if ($type == 'date-text') {
            return \Carbon\Carbon::parse($date)->format('d M Y');
        }
        if ($type == 'date-text-with-hour') {
            return \Carbon\Carbon::parse($date)->format('F j, Y, g:i a');
        }
        if ($type == 'full') {
            return \Carbon\Carbon::parse($date)->format('d.m.Y H:i');
        }
        return $date;
    }
}
