<?php

namespace App\Enums;

enum TicketStatus: int
{
    case CLOSED = 0;
    case OPEN = 1;
    case ANSWERED = 2;

    public function text(): string
    {
        return match ($this) {
            self::CLOSED => __('global.closed'),
            self::OPEN => __('global.open'),
            self::ANSWERED => __('global.answered')
        };
    }

    public function textWithBadge(): string
    {
        return match ($this) {
            self::CLOSED => '<span class="badge bg-danger">'.$this->text().'</span>',
            self::OPEN => '<span class="badge bg-success">'.$this->text().'</span>',
            self::ANSWERED => '<span class="badge bg-warning">'.$this->text().'</span>'
        };
    }
}
