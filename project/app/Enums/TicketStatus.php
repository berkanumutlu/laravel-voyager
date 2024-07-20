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
            self::CLOSED => 'Closed',
            self::OPEN => 'Open',
            self::ANSWERED => 'Answered'
        };
    }

    public function textWithBadge(): string
    {
        return match ($this) {
            self::CLOSED => '<span class="badge bg-danger">Closed</span>',
            self::OPEN => '<span class="badge bg-success">Open</span>',
            self::ANSWERED => '<span class="badge bg-warning">Answered</span>'
        };
    }
}
