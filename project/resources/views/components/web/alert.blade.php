@php
    $alert_class = $alertClass ?? '';
    if ($errors->any()) {
        $alert_class .= ' alert-danger';
    }
    if (session('success')) {
        $alert_class .= ' alert-success';
    }
@endphp
<div class="alert {{ $alert_class }}" {!! $errors->any() || session('success') ? '' : 'style="display:none"' !!}>
    @if($errors->any())
        <ul class="list-group list-unstyled {{ $ulClass ?? '' }}">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    @endif
    @if(session('success'))
        @if(is_string(session('success')))
            {!! session('success') !!}
        @elseif(is_array(session('success')))
            <ul class="list-group list-unstyled {{ $ulClass ?? '' }}">
                @foreach (session('success') as $item)
                    <li>{{ $item }}</li>
                @endforeach
            </ul>
        @endif
    @endif
</div>
