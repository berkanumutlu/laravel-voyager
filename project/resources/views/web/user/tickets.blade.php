@extends("layouts.web")
@section("style")

@endsection
@section("content")
    <div class="user-tickets-page">
        <div class="container container-page">
            @if($records->count() > 0)
                <div class="table-responsive table-card" style="min-height: 500px">
                    <table class="table text-nowrap mb-0 table-centered table-hover">
                        <thead class="table-light">
                        <tr>
                            <th class="pe-0">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="checkAll">
                                    <label class="form-check-label" for="checkAll"></label>
                                </div>
                            </th>
                            <th class="ps-1">Code</th>
                            <th>Department</th>
                            <th>Subject</th>
                            <th>Authorized</th>
                            <th>Status</th>
                            <th>Created Date</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($records as $item)
                            <tr>
                                <td class="pe-0">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" value=""
                                               id="itemCheckBox-{{ $item->id }}">
                                        <label class="form-check-label" for="itemCheckBox-{{ $item->id }}"></label>
                                    </div>
                                </td>
                                <td class="ps-1">
                                    <a href="{{ $item->url }}">#{{ $item->code }}</a>
                                </td>
                                <td>{{ $item->department }}</td>
                                <td>{{ $item->subject }}</td>
                                <td>{{ $item->receiverId?->name }}</td>
                                <td>{!! $item->status_text ?? $item->status !!}</td>
                                <td>{{ $item->created_at_text ?? $item->created_at }}</td>
                                <td>
                                    <div class="dropdown">
                                        <a class="btn btn-icon btn-sm btn-ghost rounded-circle" href="#" role="button"
                                           data-bs-toggle="dropdown" aria-expanded="false">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                 viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                 stroke-linecap="round" stroke-linejoin="round"
                                                 class="feather feather-more-vertical icon-xs">
                                                <circle cx="12" cy="12" r="1"></circle>
                                                <circle cx="12" cy="5" r="1"></circle>
                                                <circle cx="12" cy="19" r="1"></circle>
                                            </svg>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a class="dropdown-item d-flex align-items-center" href="#">Action</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                    Another action</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                    Something else here</a>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            @endif
        </div>
    </div>
@endsection
@section("scripts")

@endsection
