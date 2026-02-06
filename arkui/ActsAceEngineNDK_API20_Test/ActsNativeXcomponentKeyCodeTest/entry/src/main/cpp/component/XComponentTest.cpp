/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "component/XComponent.h"
#include <arkui/native_key_event.h>

namespace ArkUICapiTest {

static XComponent g_columnComponent = XComponent(ARKUI_NODE_COLUMN);
static XComponent* g_xComponent = new XComponent(ARKUI_NODE_XCOMPONENT);
static int32_t g_keyCode = -2;
static std::unordered_map<OH_NativeXComponent_KeyCode, int32_t> g_nativeKeyCode = {
    { KEY_UNKNOWN, -1 },
    { KEY_FN, 0 },
    { KEY_HOME, 1 },
    { KEY_BACK, 2 },
    { KEY_MEDIA_PLAY_PAUSE, 10 },
    { KEY_MEDIA_STOP, 11 },
    { KEY_MEDIA_NEXT, 12 },
    { KEY_MEDIA_PREVIOUS, 13 },
    { KEY_MEDIA_REWIND, 14 },
    { KEY_MEDIA_FAST_FORWARD, 15 },
    { KEY_VOLUME_UP, 16 },
    { KEY_VOLUME_DOWN, 17 },
    { KEY_POWER, 18 },
    { KEY_CAMERA, 19 },
    { KEY_VOLUME_MUTE, 22 },
    { KEY_MUTE, 23 },
    { KEY_BRIGHTNESS_UP, 40 },
    { KEY_BRIGHTNESS_DOWN, 41 },
    { KEY_0, 2000 },
    { KEY_1, 2001 },
    { KEY_2, 2002 },
    { KEY_3, 2003 },
    { KEY_4, 2004 },
    { KEY_5, 2005 },
    { KEY_6, 2006 },
    { KEY_7, 2007 },
    { KEY_8, 2008 },
    { KEY_9, 2009 },
    { KEY_STAR, 2010 },
    { KEY_POUND, 2011 },
    { KEY_DPAD_UP, 2012 },
    { KEY_DPAD_DOWN, 2013 },
    { KEY_DPAD_LEFT, 2014 },
    { KEY_DPAD_RIGHT, 2015 },
    { KEY_DPAD_CENTER, 2016 },
    { KEY_A, 2017 },
    { KEY_B, 2018 },
    { KEY_C, 2019 },
    { KEY_D, 2020 },
    { KEY_E, 2021 },
    { KEY_F, 2022 },
    { KEY_G, 2023 },
    { KEY_H, 2024 },
    { KEY_I, 2025 },
    { KEY_J, 2026 },
    { KEY_K, 2027 },
    { KEY_L, 2028 },
    { KEY_M, 2029 },
    { KEY_N, 2030 },
    { KEY_O, 2031 },
    { KEY_P, 2032 },
    { KEY_Q, 2033 },
    { KEY_R, 2034 },
    { KEY_S, 2035 },
    { KEY_T, 2036 },
    { KEY_U, 2037 },
    { KEY_V, 2038 },
    { KEY_W, 2039 },
    { KEY_X, 2040 },
    { KEY_Y, 2041 },
    { KEY_Z, 2042 },
    { KEY_COMMA, 2043 },
    { KEY_PERIOD, 2044 },
    { KEY_ALT_LEFT, 2045 },
    { KEY_ALT_RIGHT, 2046 },
    { KEY_SHIFT_LEFT, 2047 },
    { KEY_SHIFT_RIGHT, 2048 },
    { KEY_TAB, 2049 },
    { KEY_SPACE, 2050 },
    { KEY_SYM, 2051 },
    { KEY_EXPLORER, 2052 },
    { KEY_ENVELOPE, 2053 },
    { KEY_ENTER, 2054 },
    { KEY_DEL, 2055 },
    { KEY_GRAVE, 2056 },
    { KEY_MINUS, 2057 },
    { KEY_EQUALS, 2058 },
    { KEY_LEFT_BRACKET, 2059 },
    { KEY_RIGHT_BRACKET, 2060 },
    { KEY_BACKSLASH, 2061 },
    { KEY_SEMICOLON, 2062 },
    { KEY_APOSTROPHE, 2063 },
    { KEY_SLASH, 2064 },
    { KEY_AT, 2065 },
    { KEY_PLUS, 2066 },
    { KEY_MENU, 2067 },
    { KEY_PAGE_UP, 2068 },
    { KEY_PAGE_DOWN, 2069 },
    { KEY_ESCAPE, 2070 },
    { KEY_FORWARD_DEL, 2071 },
    { KEY_CTRL_LEFT, 2072 },
    { KEY_CTRL_RIGHT, 2073 },
    { KEY_CAPS_LOCK, 2074 },
    { KEY_SCROLL_LOCK, 2075 },
    { KEY_META_LEFT, 2076 },
    { KEY_META_RIGHT, 2077 },
    { KEY_FUNCTION, 2078 },
    { KEY_SYSRQ, 2079 },
    { KEY_BREAK, 2080 },
    { KEY_MOVE_HOME, 2081 },
    { KEY_MOVE_END, 2082 },
    { KEY_INSERT, 2083 },
    { KEY_FORWARD, 2084 },
    { KEY_MEDIA_PLAY, 2085 },
    { KEY_MEDIA_PAUSE, 2086 },
    { KEY_MEDIA_CLOSE, 2087 },
    { KEY_MEDIA_EJECT, 2088 },
    { KEY_MEDIA_RECORD, 2089 },
    { KEY_F1, 2090 },
    { KEY_F2, 2091 },
    { KEY_F3, 2092 },
    { KEY_F4, 2093 },
    { KEY_F5, 2094 },
    { KEY_F6, 2095 },
    { KEY_F7, 2096 },
    { KEY_F8, 2097 },
    { KEY_F9, 2098 },
    { KEY_F10, 2099 },
    { KEY_F11, 2100 },
    { KEY_F12, 2101 },
    { KEY_NUM_LOCK, 2102 },
    { KEY_NUMPAD_0, 2103 },
    { KEY_NUMPAD_1, 2104 },
    { KEY_NUMPAD_2, 2105 },
    { KEY_NUMPAD_3, 2106 },
    { KEY_NUMPAD_4, 2107 },
    { KEY_NUMPAD_5, 2108 },
    { KEY_NUMPAD_6, 2109 },
    { KEY_NUMPAD_7, 2110 },
    { KEY_NUMPAD_8, 2111 },
    { KEY_NUMPAD_9, 2112 },
    { KEY_NUMPAD_DIVIDE, 2113 },
    { KEY_NUMPAD_MULTIPLY, 2114 },
    { KEY_NUMPAD_SUBTRACT, 2115 },
    { KEY_NUMPAD_ADD, 2116 },
    { KEY_NUMPAD_DOT, 2117 },
    { KEY_NUMPAD_COMMA, 2118 },
    { KEY_NUMPAD_ENTER, 2119 },
    { KEY_NUMPAD_EQUALS, 2120 },
    { KEY_NUMPAD_LEFT_PAREN, 2121 },
    { KEY_NUMPAD_RIGHT_PAREN, 2122 },
    { KEY_VIRTUAL_MULTITASK, 2210 },
    { KEY_SLEEP, 2600 },
    { KEY_ZENKAKU_HANKAKU, 2601 },
    { KEY_102ND, 2602 },
    { KEY_RO, 2603 },
    { KEY_KATAKANA, 2604 },
    { KEY_HIRAGANA, 2605 },
    { KEY_HENKAN, 2606 },
    { KEY_KATAKANA_HIRAGANA, 2607 },
    { KEY_MUHENKAN, 2608 },
    { KEY_LINEFEED, 2609 },
    { KEY_MACRO, 2610 },
    { KEY_NUMPAD_PLUSMINUS, 2611 },
    { KEY_SCALE, 2612 },
    { KEY_HANGUEL, 2613 },
    { KEY_HANJA, 2614 },
    { KEY_YEN, 2615 },
    { KEY_STOP, 2616 },
    { KEY_AGAIN, 2617 },
    { KEY_PROPS, 2618 },
    { KEY_UNDO, 2619 },
    { KEY_COPY, 2620 },
    { KEY_OPEN, 2621 },
    { KEY_PASTE, 2622 },
    { KEY_FIND, 2623 },
    { KEY_CUT, 2624 },
    { KEY_HELP, 2625 },
    { KEY_CALC, 2626 },
    { KEY_FILE, 2627 },
    { KEY_BOOKMARKS, 2628 },
    { KEY_NEXT, 2629 },
    { KEY_PLAYPAUSE, 2630 },
    { KEY_PREVIOUS, 2631 },
    { KEY_STOPCD, 2632 },
    { KEY_CONFIG, 2634 },
    { KEY_REFRESH, 2635 },
    { KEY_EXIT, 2636 },
    { KEY_EDIT, 2637 },
    { KEY_SCROLLUP, 2638 },
    { KEY_SCROLLDOWN, 2639 },
    { KEY_NEW, 2640 },
    { KEY_REDO, 2641 },
    { KEY_CLOSE, 2642 },
    { KEY_PLAY, 2643 },
    { KEY_BASSBOOST, 2644 },
    { KEY_PRINT, 2645 },
    { KEY_CHAT, 2646 },
    { KEY_FINANCE, 2647 },
    { KEY_CANCEL, 2648 },
    { KEY_KBDILLUM_TOGGLE, 2649 },
    { KEY_KBDILLUM_DOWN, 2650 },
    { KEY_KBDILLUM_UP, 2651 },
    { KEY_SEND, 2652 },
    { KEY_REPLY, 2653 },
    { KEY_FORWARDMAIL, 2654 },
    { KEY_SAVE, 2655 },
    { KEY_DOCUMENTS, 2656 },
    { KEY_VIDEO_NEXT, 2657 },
    { KEY_VIDEO_PREV, 2658 },
    { KEY_BRIGHTNESS_CYCLE, 2659 },
    { KEY_BRIGHTNESS_ZERO, 2660 },
    { KEY_DISPLAY_OFF, 2661 },
    { KEY_BTN_MISC, 2662 },
    { KEY_GOTO, 2663 },
    { KEY_INFO, 2664 },
    { KEY_PROGRAM, 2665 },
    { KEY_PVR, 2666 },
    { KEY_SUBTITLE, 2667 },
    { KEY_FULL_SCREEN, 2668 },
    { KEY_KEYBOARD, 2669 },
    { KEY_ASPECT_RATIO, 2670 },
    { KEY_PC, 2671 },
    { KEY_TV, 2672 },
    { KEY_TV2, 2673 },
    { KEY_VCR, 2674 },
    { KEY_VCR2, 2675 },
    { KEY_SAT, 2676 },
    { KEY_CD, 2677 },
    { KEY_TAPE, 2678 },
    { KEY_TUNER, 2679 },
    { KEY_PLAYER, 2680 },
    { KEY_DVD, 2681 },
    { KEY_AUDIO, 2682 },
    { KEY_VIDEO, 2683 },
    { KEY_MEMO, 2684 },
    { KEY_CALENDAR, 2685 },
    { KEY_RED, 2686 },
    { KEY_GREEN, 2687 },
    { KEY_YELLOW, 2688 },
    { KEY_BLUE, 2689 },
    { KEY_CHANNELUP, 2690 },
    { KEY_CHANNELDOWN, 2691 },
    { KEY_LAST, 2692 },
    { KEY_RESTART, 2693 },
    { KEY_SLOW, 2694 },
    { KEY_SHUFFLE, 2695 },
    { KEY_VIDEOPHONE, 2696 },
    { KEY_GAMES, 2697 },
    { KEY_ZOOMIN, 2698 },
    { KEY_ZOOMOUT, 2699 },
    { KEY_ZOOMRESET, 2700 },
    { KEY_WORDPROCESSOR, 2701 },
    { KEY_EDITOR, 2702 },
    { KEY_SPREADSHEET, 2703 },
    { KEY_GRAPHICSEDITOR, 2704 },
    { KEY_PRESENTATION, 2705 },
    { KEY_DATABASE, 2706 },
    { KEY_NEWS, 2707 },
    { KEY_VOICEMAIL, 2708 },
    { KEY_ADDRESSBOOK, 2709 },
    { KEY_MESSENGER, 2710 },
    { KEY_BRIGHTNESS_TOGGLE, 2711 },
    { KEY_SPELLCHECK, 2712 },
    { KEY_COFFEE, 2713 },
    { KEY_MEDIA_REPEAT, 2714 },
    { KEY_IMAGES, 2715 },
    { KEY_BUTTONCONFIG, 2716 },
    { KEY_TASKMANAGER, 2717 },
    { KEY_JOURNAL, 2718 },
    { KEY_CONTROLPANEL, 2719 },
    { KEY_APPSELECT, 2720 },
    { KEY_SCREENSAVER, 2721 },
    { KEY_ASSISTANT, 2722 },
    { KEY_KBD_LAYOUT_NEXT, 2723 },
    { KEY_BRIGHTNESS_MIN, 2724 },
    { KEY_BRIGHTNESS_MAX, 2725 },
    { KEY_KBDINPUTASSIST_PREV, 2726 },
    { KEY_KBDINPUTASSIST_NEXT, 2727 },
    { KEY_KBDINPUTASSIST_PREVGROUP, 2728 },
    { KEY_KBDINPUTASSIST_NEXTGROUP, 2729 },
    { KEY_KBDINPUTASSIST_ACCEPT, 2730 },
    { KEY_KBDINPUTASSIST_CANCEL, 2731 },
    { KEY_FRONT, 2800 },
    { KEY_SETUP, 2801 },
    { KEY_WAKEUP, 2802 },
    { KEY_SENDFILE, 2803 },
    { KEY_DELETEFILE, 2804 },
    { KEY_XFER, 2805 },
    { KEY_PROG1, 2806 },
    { KEY_PROG2, 2807 },
    { KEY_MSDOS, 2808 },
    { KEY_SCREENLOCK, 2809 },
    { KEY_DIRECTION_ROTATE_DISPLAY, 2810 },
    { KEY_CYCLEWINDOWS, 2811 },
    { KEY_COMPUTER, 2812 },
    { KEY_EJECTCLOSECD, 2813 },
    { KEY_ISO, 2814 },
    { KEY_MOVE, 2815 },
    { KEY_F13, 2816 },
    { KEY_F14, 2817 },
    { KEY_F15, 2818 },
    { KEY_F16, 2819 },
    { KEY_F17, 2820 },
    { KEY_F18, 2821 },
    { KEY_F19, 2822 },
    { KEY_F20, 2823 },
    { KEY_F21, 2824 },
    { KEY_F22, 2825 },
    { KEY_F23, 2826 },
    { KEY_F24, 2827 },
    { KEY_PROG3, 2828 },
    { KEY_PROG4, 2829 },
    { KEY_DASHBOARD, 2830 },
    { KEY_SUSPEND, 2831 },
    { KEY_HP, 2832 },
    { KEY_SOUND, 2833 },
    { KEY_QUESTION, 2834 },
    { KEY_CONNECT, 2836 },
    { KEY_SPORT, 2837 },
    { KEY_SHOP, 2838 },
    { KEY_ALTERASE, 2839 },
    { KEY_SWITCHVIDEOMODE, 2841 },
    { KEY_BATTERY, 2842 },
    { KEY_BLUETOOTH, 2843 },
    { KEY_WLAN, 2844 },
    { KEY_UWB, 2845 },
    { KEY_WWAN_WIMAX, 2846 },
    { KEY_RFKILL, 2847 },
    { KEY_CHANNEL, 3001 },
    { KEY_BTN_0, 3100 },
    { KEY_BTN_1, 3101 },
    { KEY_BTN_2, 3102 },
    { KEY_BTN_3, 3103 },
    { KEY_BTN_4, 3104 },
    { KEY_BTN_5, 3105 },
    { KEY_BTN_6, 3106 },
    { KEY_BTN_7, 3107 },
    { KEY_BTN_8, 3108 },
    { KEY_BTN_9, 3109 },
};
static std::unordered_map<ArkUI_KeyCode, int32_t> g_arkuiKeyCode = {
    { ARKUI_KEYCODE_UNKNOWN, -1 },
    { ARKUI_KEYCODE_FN, 0 },
    { ARKUI_KEYCODE_VOLUME_UP, 16 },
    { ARKUI_KEYCODE_VOLUME_DOWN, 17 },
    { ARKUI_KEYCODE_POWER, 18 },
    { ARKUI_KEYCODE_CAMERA, 19 },
    { ARKUI_KEYCODE_VOLUME_MUTE, 22 },
    { ARKUI_KEYCODE_MUTE, 23 },
    { ARKUI_KEYCODE_BRIGHTNESS_UP, 40 },
    { ARKUI_KEYCODE_BRIGHTNESS_DOWN, 41 },
    { ARKUI_KEYCODE_0, 2000 },
    { ARKUI_KEYCODE_1, 2001 },
    { ARKUI_KEYCODE_2, 2002 },
    { ARKUI_KEYCODE_3, 2003 },
    { ARKUI_KEYCODE_4, 2004 },
    { ARKUI_KEYCODE_5, 2005 },
    { ARKUI_KEYCODE_6, 2006 },
    { ARKUI_KEYCODE_7, 2007 },
    { ARKUI_KEYCODE_8, 2008 },
    { ARKUI_KEYCODE_9, 2009 },
    { ARKUI_KEYCODE_STAR, 2010 },
    { ARKUI_KEYCODE_POUND, 2011 },
    { ARKUI_KEYCODE_DPAD_UP, 2012 },
    { ARKUI_KEYCODE_DPAD_DOWN, 2013 },
    { ARKUI_KEYCODE_DPAD_LEFT, 2014 },
    { ARKUI_KEYCODE_DPAD_RIGHT, 2015 },
    { ARKUI_KEYCODE_DPAD_CENTER, 2016 },
    { ARKUI_KEYCODE_A, 2017 },
    { ARKUI_KEYCODE_B, 2018 },
    { ARKUI_KEYCODE_C, 2019 },
    { ARKUI_KEYCODE_D, 2020 },
    { ARKUI_KEYCODE_E, 2021 },
    { ARKUI_KEYCODE_F, 2022 },
    { ARKUI_KEYCODE_G, 2023 },
    { ARKUI_KEYCODE_H, 2024 },
    { ARKUI_KEYCODE_I, 2025 },
    { ARKUI_KEYCODE_J, 2026 },
    { ARKUI_KEYCODE_K, 2027 },
    { ARKUI_KEYCODE_L, 2028 },
    { ARKUI_KEYCODE_M, 2029 },
    { ARKUI_KEYCODE_N, 2030 },
    { ARKUI_KEYCODE_O, 2031 },
    { ARKUI_KEYCODE_P, 2032 },
    { ARKUI_KEYCODE_Q, 2033 },
    { ARKUI_KEYCODE_R, 2034 },
    { ARKUI_KEYCODE_S, 2035 },
    { ARKUI_KEYCODE_T, 2036 },
    { ARKUI_KEYCODE_U, 2037 },
    { ARKUI_KEYCODE_V, 2038 },
    { ARKUI_KEYCODE_W, 2039 },
    { ARKUI_KEYCODE_X, 2040 },
    { ARKUI_KEYCODE_Y, 2041 },
    { ARKUI_KEYCODE_Z, 2042 },
    { ARKUI_KEYCODE_COMMA, 2043 },
    { ARKUI_KEYCODE_PERIOD, 2044 },
    { ARKUI_KEYCODE_ALT_LEFT, 2045 },
    { ARKUI_KEYCODE_ALT_RIGHT, 2046 },
    { ARKUI_KEYCODE_SHIFT_LEFT, 2047 },
    { ARKUI_KEYCODE_SHIFT_RIGHT, 2048 },
    { ARKUI_KEYCODE_TAB, 2049 },
    { ARKUI_KEYCODE_SPACE, 2050 },
    { ARKUI_KEYCODE_SYM, 2051 },
    { ARKUI_KEYCODE_EXPLORER, 2052 },
    { ARKUI_KEYCODE_ENVELOPE, 2053 },
    { ARKUI_KEYCODE_ENTER, 2054 },
    { ARKUI_KEYCODE_DEL, 2055 },
    { ARKUI_KEYCODE_GRAVE, 2056 },
    { ARKUI_KEYCODE_MINUS, 2057 },
    { ARKUI_KEYCODE_EQUALS, 2058 },
    { ARKUI_KEYCODE_LEFT_BRACKET, 2059 },
    { ARKUI_KEYCODE_RIGHT_BRACKET, 2060 },
    { ARKUI_KEYCODE_BACKSLASH, 2061 },
    { ARKUI_KEYCODE_SEMICOLON, 2062 },
    { ARKUI_KEYCODE_APOSTROPHE, 2063 },
    { ARKUI_KEYCODE_SLASH, 2064 },
    { ARKUI_KEYCODE_AT, 2065 },
    { ARKUI_KEYCODE_PLUS, 2066 },
    { ARKUI_KEYCODE_MENU, 2067 },
    { ARKUI_KEYCODE_PAGE_UP, 2068 },
    { ARKUI_KEYCODE_PAGE_DOWN, 2069 },
    { ARKUI_KEYCODE_ESCAPE, 2070 },
    { ARKUI_KEYCODE_FORWARD_DEL, 2071 },
    { ARKUI_KEYCODE_CTRL_LEFT, 2072 },
    { ARKUI_KEYCODE_CTRL_RIGHT, 2073 },
    { ARKUI_KEYCODE_CAPS_LOCK, 2074 },
    { ARKUI_KEYCODE_SCROLL_LOCK, 2075 },
    { ARKUI_KEYCODE_META_LEFT, 2076 },
    { ARKUI_KEYCODE_META_RIGHT, 2077 },
    { ARKUI_KEYCODE_FUNCTION, 2078 },
    { ARKUI_KEYCODE_SYSRQ, 2079 },
    { ARKUI_KEYCODE_BREAK, 2080 },
    { ARKUI_KEYCODE_MOVE_HOME, 2081 },
    { ARKUI_KEYCODE_MOVE_END, 2082 },
    { ARKUI_KEYCODE_INSERT, 2083 },
    { ARKUI_KEYCODE_FORWARD, 2084 },
    { ARKUI_KEYCODE_MEDIA_PLAY, 2085 },
    { ARKUI_KEYCODE_MEDIA_PAUSE, 2086 },
    { ARKUI_KEYCODE_MEDIA_CLOSE, 2087 },
    { ARKUI_KEYCODE_MEDIA_EJECT, 2088 },
    { ARKUI_KEYCODE_MEDIA_RECORD, 2089 },
    { ARKUI_KEYCODE_F1, 2090 },
    { ARKUI_KEYCODE_F2, 2091 },
    { ARKUI_KEYCODE_F3, 2092 },
    { ARKUI_KEYCODE_F4, 2093 },
    { ARKUI_KEYCODE_F5, 2094 },
    { ARKUI_KEYCODE_F6, 2095 },
    { ARKUI_KEYCODE_F7, 2096 },
    { ARKUI_KEYCODE_F8, 2097 },
    { ARKUI_KEYCODE_F9, 2098 },
    { ARKUI_KEYCODE_F10, 2099 },
    { ARKUI_KEYCODE_F11, 2100 },
    { ARKUI_KEYCODE_F12, 2101 },
    { ARKUI_KEYCODE_NUM_LOCK, 2102 },
    { ARKUI_KEYCODE_NUMPAD_0, 2103 },
    { ARKUI_KEYCODE_NUMPAD_1, 2104 },
    { ARKUI_KEYCODE_NUMPAD_2, 2105 },
    { ARKUI_KEYCODE_NUMPAD_3, 2106 },
    { ARKUI_KEYCODE_NUMPAD_4, 2107 },
    { ARKUI_KEYCODE_NUMPAD_5, 2108 },
    { ARKUI_KEYCODE_NUMPAD_6, 2109 },
    { ARKUI_KEYCODE_NUMPAD_7, 2110 },
    { ARKUI_KEYCODE_NUMPAD_8, 2111 },
    { ARKUI_KEYCODE_NUMPAD_9, 2112 },
    { ARKUI_KEYCODE_NUMPAD_DIVIDE, 2113 },
    { ARKUI_KEYCODE_NUMPAD_MULTIPLY, 2114 },
    { ARKUI_KEYCODE_NUMPAD_SUBTRACT, 2115 },
    { ARKUI_KEYCODE_NUMPAD_ADD, 2116 },
    { ARKUI_KEYCODE_NUMPAD_DOT, 2117 },
    { ARKUI_KEYCODE_NUMPAD_COMMA, 2118 },
    { ARKUI_KEYCODE_NUMPAD_ENTER, 2119 },
    { ARKUI_KEYCODE_NUMPAD_EQUALS, 2120 },
    { ARKUI_KEYCODE_NUMPAD_LEFT_PAREN, 2121 },
    { ARKUI_KEYCODE_NUMPAD_RIGHT_PAREN, 2122 },
    { ARKUI_KEYCODE_BUTTON_A, 2301 },
    { ARKUI_KEYCODE_BUTTON_B, 2302 },
    { ARKUI_KEYCODE_BUTTON_X, 2304 },
    { ARKUI_KEYCODE_BUTTON_Y, 2305 },
    { ARKUI_KEYCODE_BUTTON_L1, 2307 },
    { ARKUI_KEYCODE_BUTTON_R1, 2308 },
    { ARKUI_KEYCODE_BUTTON_L2, 2309 },
    { ARKUI_KEYCODE_BUTTON_R2, 2310 },
    { ARKUI_KEYCODE_BUTTON_SELECT, 2311 },
    { ARKUI_KEYCODE_BUTTON_START, 2312 },
    { ARKUI_KEYCODE_BUTTON_MODE, 2313 },
    { ARKUI_KEYCODE_BUTTON_THUMBL, 2314 },
    { ARKUI_KEYCODE_BUTTON_THUMBR, 2315 },
};

napi_value CreateNativeNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    g_columnComponent.SetPercentWidth(PARAM_0_POINT_6);
    g_columnComponent.SetPercentHeight(PARAM_0_POINT_6);
    g_columnComponent.SetBackgroundColor(0xffff0000);
    g_xComponent->SetXComponentType(ARKUI_XCOMPONENT_TYPE_SURFACE);
    g_xComponent->SetXComponentId("TestXComponent");
    g_xComponent->SetPercentWidth(PARAM_1);
    g_xComponent->SetPercentHeight(PARAM_1);
    g_xComponent->SetId("NativeXComponentKeyTest");
    g_xComponent->SetFocusable(true);
    g_xComponent->SetFocusDefault(true);
    g_xComponent->PrintXComponentInfo();
    g_xComponent->RegisterOnKey(std::function<void (ArkUI_NodeEvent *)> (OnKeyEvent));
    std::shared_ptr<Component> ptr = std::make_shared<XComponent>(*g_xComponent);
    g_columnComponent.AddChild(ptr);
    int32_t ret = OH_ArkUI_NodeContent_SetUserData(nodeContentHandle_, &g_xComponent);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "setUserData failed error=%{public}d", ret);
    }
    ret = OH_ArkUI_NodeContent_AddNode(nodeContentHandle_, g_columnComponent.GetComponent());
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeAttach", "setUserData failed error=%{public}d", ret);
    return nullptr;
}

napi_value CreateArkUINode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    g_columnComponent.SetPercentWidth(PARAM_0_POINT_6);
    g_columnComponent.SetPercentHeight(PARAM_0_POINT_6);
    g_columnComponent.SetBackgroundColor(0xffff0000);
    g_xComponent->SetXComponentType(ARKUI_XCOMPONENT_TYPE_SURFACE);
    g_xComponent->SetXComponentId("TestXComponent");
    g_xComponent->SetPercentWidth(PARAM_1);
    g_xComponent->SetPercentHeight(PARAM_1);
    g_xComponent->SetId("NativeXComponentKeyTest");
    g_xComponent->SetFocusable(true);
    g_xComponent->SetFocusDefault(true);
    g_xComponent->PrintXComponentInfo();
    g_xComponent->GetNodeApi()->addNodeEventReceiver(g_xComponent->GetComponent(), OnUIKeyEvent);
    g_xComponent->GetNodeApi()->registerNodeEvent(g_xComponent->GetComponent(), NODE_ON_KEY_EVENT, PARAM_0,
                                                  g_xComponent->GetXComponent());
    std::shared_ptr<Component> ptr = std::make_shared<XComponent>(*g_xComponent);
    g_columnComponent.AddChild(ptr);
    int32_t ret = OH_ArkUI_NodeContent_SetUserData(nodeContentHandle_, &g_xComponent);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "setUserData failed error=%{public}d", ret);
    }
    ret = OH_ArkUI_NodeContent_AddNode(nodeContentHandle_, g_columnComponent.GetComponent());
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeAttach", "setUserData failed error=%{public}d", ret);
    return nullptr;
}

void XComponent::SetXComponentType(ArkUI_XComponentType type)
{
    ArkUI_NumberValue value[] = {0};
    value[0].i32 = type;
    ArkUI_AttributeItem item = {value, 1};
    _nodeAPI->setAttribute(_component, NODE_XCOMPONENT_TYPE, &item);
}

void XComponent::SetXComponentId(char* id)
{
    ArkUI_NumberValue value[] = {0};
    ArkUI_AttributeItem item = {value, 1, id};
    _nodeAPI->setAttribute(_component, NODE_XCOMPONENT_ID, &item);
}

void XComponent::SetXComponentSurfaceSize(uint32_t width, uint32_t height)
{
    ArkUI_NumberValue value[] = {{.u32 = width}, {.u32 = height}};
    ArkUI_AttributeItem item = {value, 2};
    _nodeAPI->setAttribute(_component, NODE_XCOMPONENT_SURFACE_SIZE, &item);
}

void XComponent::PrintXComponentInfo()
{
    auto *nativeXComponent = OH_NativeXComponent_GetNativeXComponent(_component);
    if (!nativeXComponent) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetNativeXComponent error");
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PluginManager", "GetNativeXComponent success");
    auto typeRet = _nodeAPI->getAttribute(_component, NODE_XCOMPONENT_TYPE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PluginManager", "xcomponent type: %{public}d",
                 typeRet->value[0].i32);
    auto idRet = _nodeAPI->getAttribute(_component, NODE_XCOMPONENT_ID);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PluginManager", "xcomponent id: %{public}s",
                 idRet->string);
}

void OnFocusEvent(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OnFocusEvent", "OnFocusEvent");
    return;
}

void OnBlurEvent(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OnFocusEvent", "OnTouchInterceptCallback");
    return;
}

void NativeKeyCode2Str(OH_NativeXComponent_KeyCode keyCode)
{
    if (g_nativeKeyCode.count(keyCode) != 0) {
        g_keyCode = keyCode;
    }
}

void ArkUIKeyCode2Str(ArkUI_KeyCode keyCode)
{
    if (g_arkuiKeyCode.count(keyCode) != 0) {
        g_keyCode = keyCode;
    }
}

void OnKeyEvent(ArkUI_NodeEvent* event)
{
    OH_NativeXComponent_KeyCode keyCode = OH_NativeXComponent_KeyCode(-2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OnKeyEvent",
                 "OH_NativeXComponent_KeyCode keyCode: %{public}d", keyCode);
    OH_NativeXComponent_KeyEvent* keyEvent;
    OH_NativeXComponent* triggerObject = static_cast<OH_NativeXComponent*>(OH_ArkUI_NodeEvent_GetUserData(event));
    // 对比XComopnet指针确定是否为目标组件触发
    if (triggerObject == g_xComponent->GetXComponent()) {
        OH_NativeXComponent_GetKeyEvent(triggerObject, &keyEvent);
        OH_NativeXComponent_GetKeyEventCode(keyEvent, &keyCode);
        NativeKeyCode2Str(keyCode);
    }
}

void OnUIKeyEvent(ArkUI_NodeEvent* event)
{
    ArkUI_UIInputEvent* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    if (OH_ArkUI_UIInputEvent_GetType(uiInputEvent) == ARKUI_UIINPUTEVENT_TYPE_KEY) {
        ArkUI_KeyCode keyCode = ArkUI_KeyCode(PARAM_NEGATIVE_2);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OnUIKeyEvent",
                     "OH_ArkUI_KeyEvent_GetKeyCode keyCode: %{public}d", keyCode);
        keyCode = ArkUI_KeyCode(OH_ArkUI_KeyEvent_GetKeyCode(uiInputEvent));
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OnUIKeyEvent",
                     "OH_ArkUI_KeyEvent_GetKeyCode keyCode: %{public}d", keyCode);
        if (keyCode != PARAM_NEGATIVE_2) {
            ArkUIKeyCode2Str(keyCode);
        }
    }
}

napi_value GetKeyCodeResult(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OnKeyResult",
                 "OH_NativeXComponent_KeyCode keyCode: %{public}d", g_keyCode);
    if (g_keyCode != PARAM_NEGATIVE_2) {
        napi_create_int32(env, g_keyCode, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    return retValue;
}

}
