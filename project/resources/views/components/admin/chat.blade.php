<div class="main-layout">
    <main class="main main-visible">
        <div class="chats">
            <div class="chat-body">
                <!-- Chat Header Start-->
                <div class="chat-header">
                    <!-- Chat participant's Name -->
                    <div class="media chat-name align-items-center text-truncate">
                        <div class="avatar avatar-online d-none d-sm-inline-block mr-3">
                            @php
                                $user_avatar = !empty($user->avatar) ? Voyager::image($user->avatar) : $defaultAvatar;
                            @endphp
                            <img src="{{ $user_avatar }}" alt="">
                        </div>
                        <div class="media-body align-self-center ">
                            <h6 class="text-truncate mb-0">{{ !empty($user->name) ? ucwords($user->name) : '' }}</h6>
                            <small class="text-muted">{{ $user->email ?? '' }}</small>
                        </div>
                    </div>

                    <!-- Chat Options -->
                    <ul class="nav flex-nowrap">
                        <li class="nav-item list-inline-item d-none d-sm-block mr-1">
                            <a class="nav-link text-muted pt-2 pb-2 px-1" data-toggle="collapse"
                               data-target="#searchCollapse"
                               href="javascript:;" aria-expanded="false">
                                <!-- Default :: Inline SVG -->
                                <svg class="hw-20" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                </svg>

                                <!-- Alternate :: External File link -->
                                <!-- <img src="./../../assets/media/heroicons/outline/search.svg" alt="" class="injectable hw-20"> -->
                            </a>
                        </li>
                        <li class="nav-item list-inline-item d-none mr-1">
                            <a class="nav-link text-muted pt-2 pb-2 px-1" href="#" title="Add People">
                                <!-- Default :: Inline SVG -->
                                <svg class="hw-20" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                                </svg>

                                <!-- Alternate :: External File link -->
                                <!-- <img src="./../../assets/media/heroicons/outline/phone.svg" alt="" class="injectable hw-20"> -->
                            </a>
                        </li>
                        <li class="nav-item list-inline-item d-none d-sm-block mr-0">
                            <div class="dropdown pt-2 pb-2">
                                <a class="nav-link text-muted pt-2 pb-2 px-1" href="#" role="button" title="Details"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <!-- Default :: Inline SVG -->
                                    <svg class="hw-20" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                    </svg>

                                    <!-- Alternate :: External File link -->
                                    <!-- <img src="./../../assets/media/heroicons/outline/dots-vertical.svg" alt="" class="injectable hw-20"> -->
                                </a>

                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item align-items-center d-flex" href="#"
                                       data-chat-info-toggle="">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/information-circle.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>View Info</span>
                                    </a>

                                    <a class="dropdown-item align-items-center d-flex" href="#">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.923 3.663 12 4.109 12 5v14c0 .891-1.077 1.337-1.707.707L5.586 15z"
                                                  clip-rule="evenodd"></path>
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M17 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/volume-off.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Mute Notifications</span>
                                    </a>
                                    <a class="dropdown-item align-items-center d-flex" href="#">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/photograph.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Wallpaper</span>
                                    </a>
                                    <a class="dropdown-item align-items-center d-flex" href="#">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/archive.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Archive</span>
                                    </a>
                                    <a class="dropdown-item align-items-center d-flex" href="#">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/trash.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Delete</span>
                                    </a>
                                    <a class="dropdown-item align-items-center d-flex text-danger" href="#">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/ban.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Block</span>
                                    </a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item list-inline-item d-sm-none mr-0">
                            <div class="dropdown pt-2 pb-2">
                                <a class="nav-link text-muted pt-2 pb-2 px-1" href="#" role="button" title="Details"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <!-- Default :: Inline SVG -->
                                    <svg class="hw-20" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                    </svg>

                                    <!-- Alternate :: External File link -->
                                    <!-- <img src="./../../assets/media/heroicons/outline/dots-vertical.svg" alt="" class="injectable hw-20"> -->
                                </a>

                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item align-items-center d-flex" href="#">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/phone.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Call</span>
                                    </a>
                                    <a class="dropdown-item align-items-center d-flex" href="#" data-toggle="collapse"
                                       data-target="#searchCollapse" aria-expanded="false">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/search.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Search</span>
                                    </a>

                                    <a class="dropdown-item align-items-center d-flex" href="#"
                                       data-chat-info-toggle="">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/information-circle.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>View Info</span>
                                    </a>

                                    <a class="dropdown-item align-items-center d-flex" href="#">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.923 3.663 12 4.109 12 5v14c0 .891-1.077 1.337-1.707.707L5.586 15z"
                                                  clip-rule="evenodd"></path>
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M17 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/volume-off.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Mute Notifications</span>
                                    </a>
                                    <a class="dropdown-item align-items-center d-flex" href="#">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/photograph.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Wallpaper</span>
                                    </a>
                                    <a class="dropdown-item align-items-center d-flex" href="#">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/archive.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Archive</span>
                                    </a>
                                    <a class="dropdown-item align-items-center d-flex" href="#">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/trash.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Delete</span>
                                    </a>
                                    <a class="dropdown-item align-items-center d-flex text-danger" href="#">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img src="./../../assets/media/heroicons/outline/ban.svg" alt="" class="injectable hw-20 mr-2"> -->
                                        <span>Block</span>
                                    </a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- Chat Header End-->

                <!-- Search Start -->
                <div class="collapse border-bottom px-3" id="searchCollapse">
                    <div class="container-xl py-2 px-0 px-md-3">
                        <div class="input-group bg-light ">
                            <input type="text" class="form-control form-control-md border-right-0 transparent-bg pr-0"
                                   placeholder="Search">
                            <div class="input-group-append">
                                    <span class="input-group-text transparent-bg border-left-0">
                                        <!-- Default :: Inline SVG -->
                                        <svg class="hw-20 text-muted" fill="none" viewBox="0 0 24 24"
                                             stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                        </svg>

                                        <!-- Alternate :: External File link -->
                                        <!-- <img class="injectable hw-20" src="./../../assets/media/heroicons/outline/search.svg" alt="Search icon"> -->
                                    </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Search End -->

                <!-- Chat Content Start-->
                <div class="chat-content p-2" id="messageBody">
                    <div class="container">
                        @if(!empty($messageList))
                            @foreach($messageList as $message)
                                <div class="message-day">
                                    <div class="message-divider sticky-top pb-2" data-label="{{ $message->day }}">
                                        &nbsp;
                                    </div>
                                    @foreach($message->messages as $message_item)
                                        @php($self = $message_item->sender->id == Auth::user()->id)
                                        <div class="message {{ $self ? 'self' : '' }}">
                                            <div class="message-wrapper">
                                                <div class="message-content">
                                                    <span>{{ $message_item->message }}</span>
                                                </div>
                                            </div>
                                            <div class="message-options">
                                                <div class="avatar avatar-sm">
                                                    <img alt=""
                                                         src="{{ !empty($message_item->sender->avatar) ? Voyager::image($message_item->sender->avatar) : $defaultAvatar }}">
                                                </div>
                                                <span class="message-date">{{ $message_item->hour }}</span>
                                                @if(!empty($message_item->updated_at))
                                                    <span class="message-status">Edited</span>
                                                @endif
                                                <div class="dropdown">
                                                    <a class="text-muted" href="#" data-toggle="dropdown"
                                                       aria-haspopup="true"
                                                       aria-expanded="false">
                                                        <svg class="hw-18" fill="none" viewBox="0 0 24 24"
                                                             stroke="currentColor">
                                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                                  stroke-width="2"
                                                                  d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                                        </svg>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-top">
                                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                                            <svg class="hw-18 mr-2" fill="none" viewBox="0 0 24 24"
                                                                 stroke="currentColor">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                      stroke-width="2"
                                                                      d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"></path>
                                                            </svg>
                                                            <span>Copy</span>
                                                        </a>
                                                        @if($self)
                                                            <a class="dropdown-item d-flex align-items-center" href="#">
                                                                <svg class="hw-18 mr-2" fill="none" viewBox="0 0 24 24"
                                                                     stroke="currentColor">
                                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                                          stroke-width="2"
                                                                          d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                                                </svg>
                                                                <span>Edit</span>
                                                            </a>
                                                        @endif
                                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                                            <svg class="hw-18 mr-2" fill="none" viewBox="0 0 24 24"
                                                                 stroke="currentColor">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                      stroke-width="2"
                                                                      d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6"></path>
                                                            </svg>
                                                            <span>Reply</span>
                                                        </a>
                                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                                            <svg class="hw-18 rotate-y mr-2" fill="none"
                                                                 viewBox="0 0 24 24"
                                                                 stroke="currentColor">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                      stroke-width="2"
                                                                      d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6"></path>
                                                            </svg>
                                                            <span>Forward</span>
                                                        </a>
                                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                                            <svg class="hw-18 mr-2" fill="none" viewBox="0 0 24 24"
                                                                 stroke="currentColor">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                      stroke-width="2"
                                                                      d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z"></path>
                                                            </svg>
                                                            <span>Favourite</span>
                                                        </a>
                                                        <a class="dropdown-item d-flex align-items-center text-danger"
                                                           href="#">
                                                            <svg class="hw-18 mr-2" fill="none" viewBox="0 0 24 24"
                                                                 stroke="currentColor">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                      stroke-width="2"
                                                                      d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                                            </svg>
                                                            <span>Delete</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            @endforeach
                        @endif
                    </div>
                    <!-- Scroll to finish -->
                    <div class="chat-finished" id="chat-finished"></div>
                </div>
                <!-- Chat Content End-->

                <!-- Chat Footer Start-->
                <div class="chat-footer">
                    <div class="attachment">
                        <div class="dropdown">
                            <button class="btn btn-secondary btn-icon btn-minimal" type="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <svg class="hw-20" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>

                                <!-- <img class="injectable hw-20" src="./../../assets/media/heroicons/outline/plus-circle.svg" alt=""> -->
                            </button>
                            <div class="dropdown-menu dropdown-menu-top">
                                <a class="dropdown-item" href="#">
                                    <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                    </svg>
                                    <!-- <img class="injectable hw-20 mr-2" src="./../../assets/media/heroicons/outline/photograph.svg" alt=""> -->
                                    <span>Gallery</span>
                                </a>
                                <a class="dropdown-item" href="#">
                                    <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M15.536 8.464a5 5 0 010 7.072m2.828-9.9a9 9 0 010 12.728M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.923 3.663 12 4.109 12 5v14c0 .891-1.077 1.337-1.707.707L5.586 15z"></path>
                                    </svg>

                                    <!-- <img class="injectable hw-20 mr-2" src="./../../assets/media/heroicons/outline/volume-up.svg" alt=""> -->
                                    <span>Audio</span>
                                </a>
                                <a class="dropdown-item" href="#">
                                    <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M7 21h10a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0012.586 3H7a2 2 0 00-2 2v14a2 2 0 002 2z"></path>
                                    </svg>

                                    <!-- <img class="injectable hw-20 mr-2" src="./../../assets/media/heroicons/outline/document.svg" alt=""> -->
                                    <span>Document</span>
                                </a>
                                <a class="dropdown-item" href="#">
                                    <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                    </svg>

                                    <!-- <img class="injectable hw-20 mr-2" src="./../../assets/media/heroicons/outline/user.svg" alt=""> -->
                                    <span>Contact</span>
                                </a>
                                <a class="dropdown-item" href="#">
                                    <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                    </svg>

                                    <!-- <img class="injectable hw-20 mr-2" src="./../../assets/media/heroicons/outline/location-marker.svg" alt=""> -->
                                    <span>Location</span>
                                </a>
                                <a class="dropdown-item" href="#">
                                    <svg class="hw-20 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M16 8v8m-4-5v5m-4-2v2m-2 4h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                    </svg>

                                    <!-- <img class="injectable hw-20 mr-2" src="./../../assets/media/heroicons/outline/chart-square-bar.svg" alt=""> -->
                                    <span>Poll</span>
                                </a>
                            </div>
                        </div>
                    </div>

                    <textarea class="form-control emojionearea-form-control" id="messageInput" rows="1"
                              placeholder="Type your message here..." style="display: none;"></textarea>
                    <div class="btn btn-primary btn-icon send-icon rounded-circle text-light mb-1" role="button">
                        <svg class="hw-24" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M14 5l7 7m0 0l-7 7m7-7H3"></path>
                        </svg>
                        <!-- <img src="./../../assets/media/heroicons/outline/arrow-right.svg" alt="" class="injectable"> -->
                    </div>
                </div>
                <!-- Chat Footer End-->
            </div>
        </div>
    </main>
</div>

@pushonce("css")
    {{--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css">--}}
    <link rel="stylesheet" href="{{ asset('assets/plugins/emojionearea/emojionearea.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/admin/css/chat.min.css') }}">
@endpushonce

@pushonce("javascript")
    <script src="{{ asset('assets/plugins/magnific-popup/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/svg-inject/svg-inject.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/modal-steps/modal-steps.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/emojionearea/emojionearea.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/chat.js') }}"></script>
@endpushonce
