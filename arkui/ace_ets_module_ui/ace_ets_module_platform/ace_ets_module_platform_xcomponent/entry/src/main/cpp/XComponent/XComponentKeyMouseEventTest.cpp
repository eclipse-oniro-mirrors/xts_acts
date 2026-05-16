/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "XComponentKeyMouseEventTest.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <hilog/log.h>
#include <string>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include "../common/common.h"

namespace NativeXComponentSample {
std::string indicatorStateString = "";
std::string keyStateString = "";
std::string mouseStateString = "";
std::unordered_map<int, std::string> keyStrings = {
    {-1, "UNKNOWN"},
    {0, "FN"},
    {1, "HOME"},
    {2, "BACK"},
    {10, "MEDIA_PLAY_PAUSE"},
    {11, "MEDIA_STOP"},
    {12, "MEDIA_NEXT"},
    {13, "MEDIA_PREVIOUS"},
    {14, "MEDIA_REWIND"},
    {15, "MEDIA_FAST_FORWARD"},
    {16, "VOLUME_UP"},
    {17, "VOLUME_DOWN"},
    {18, "POWER"},
    {19, "CAMERA"},
    {22, "VOLUME_MUTE"},
    {23, "MUTE"},
    {40, "BRIGHTNESS_UP"},
    {41, "BRIGHTNESS_DOWN"},
    {2000, "0"},
    {2001, "1"},
    {2002, "2"},
    {2003, "3"},
    {2004, "4"},
    {2005, "5"},
    {2006, "6"},
    {2007, "7"},
    {2008, "8"},
    {2009, "9"},
    {2010, "STAR"},
    {2011, "POUND"},
    {2012, "DPAD_UP"},
    {2013, "DPAD_DOWN"},
    {2014, "DPAD_LEFT"},
    {2015, "DPAD_RIGHT"},
    {2016, "DPAD_CENTER"},
    {2017, "A"},
    {2018, "B"},
    {2019, "C"},
    {2020, "D"},
    {2021, "E"},
    {2022, "F"},
    {2023, "G"},
    {2024, "H"},
    {2025, "I"},
    {2026, "J"},
    {2027, "K"},
    {2028, "L"},
    {2029, "M"},
    {2030, "N"},
    {2031, "O"},
    {2032, "P"},
    {2033, "Q"},
    {2034, "R"},
    {2035, "S"},
    {2036, "T"},
    {2037, "U"},
    {2038, "V"},
    {2039, "W"},
    {2040, "X"},
    {2041, "Y"},
    {2042, "Z"},
    {2043, "COMMA"},
    {2044, "PERIOD"},
    {2045, "ALT_LEFT"},
    {2046, "ALT_RIGHT"},
    {2047, "SHIFT_LEFT"},
    {2048, "SHIFT_RIGHT"},
    {2049, "TAB"},
    {2050, "SPACE"},
    {2051, "SYM"},
    {2052, "EXPLORER"},
    {2053, "ENVELOPE"},
    {2054, "ENTER"},
    {2055, "DEL"},
    {2056, "GRAVE"},
    {2057, "MINUS"},
    {2058, "EQUALS"},
    {2059, "LEFT_BRACKET"},
    {2060, "RIGHT_BRACKET"},
    {2061, "BACKSLASH"},
    {2062, "SEMICOLON"},
    {2063, "APOSTROPHE"},
    {2064, "SLASH"},
    {2065, "AT"},
    {2066, "PLUS"},
    {2067, "MENU"},
    {2068, "PAGE_UP"},
    {2069, "PAGE_DOWN"},
    {2070, "ESCAPE"},
    {2071, "FORWARD_DEL"},
    {2072, "CTRL_LEFT"},
    {2073, "CTRL_RIGHT"},
    {2074, "CAPS_LOCK"},
    {2075, "SCROLL_LOCK"},
    {2076, "META_LEFT"},
    {2077, "META_RIGHT"},
    {2078, "FUNCTION"},
    {2079, "SYSRQ"},
    {2080, "BREAK"},
    {2081, "MOVE_HOME"},
    {2082, "MOVE_END"},
    {2083, "INSERT"},
    {2084, "FORWARD"},
    {2085, "MEDIA_PLAY"},
    {2086, "MEDIA_PAUSE"},
    {2087, "MEDIA_CLOSE"},
    {2088, "MEDIA_EJECT"},
    {2089, "MEDIA_RECORD"},
    {2090, "F1"},
    {2091, "F2"},
    {2092, "F3"},
    {2093, "F4"},
    {2094, "F5"},
    {2095, "F6"},
    {2096, "F7"},
    {2097, "F8"},
    {2098, "F9"},
    {2099, "F10"},
    {2100, "F11"},
    {2101, "F12"},
    {2102, "NUM_LOCK"},
    {2103, "NUMPAD_0"},
    {2104, "NUMPAD_1"},
    {2105, "NUMPAD_2"},
    {2106, "NUMPAD_3"},
    {2107, "NUMPAD_4"},
    {2108, "NUMPAD_5"},
    {2109, "NUMPAD_6"},
    {2110, "NUMPAD_7"},
    {2111, "NUMPAD_8"},
    {2112, "NUMPAD_9"},
    {2113, "NUMPAD_DIVIDE"},
    {2114, "NUMPAD_MULTIPLY"},
    {2115, "NUMPAD_SUBTRACT"},
    {2116, "NUMPAD_ADD"},
    {2117, "NUMPAD_DOT"},
    {2118, "NUMPAD_COMMA"},
    {2119, "NUMPAD_ENTER"},
    {2120, "NUMPAD_EQUALS"},
    {2121, "NUMPAD_LEFT_PAREN"},
    {2122, "NUMPAD_RIGHT_PAREN"},
    {2210, "VIRTUAL_MULTITASK"},
    {2600, "SLEEP"},
    {2601, "ZENKAKU_HANKAKU"},
    {2602, "102ND"},
    {2603, "RO"},
    {2604, "KATAKANA"},
    {2605, "HIRAGANA"},
    {2606, "HENKAN"},
    {2607, "KATAKANA_HIRAGANA"},
    {2608, "MUHENKAN"},
    {2609, "LINEFEED"},
    {2610, "MACRO"},
    {2611, "NUMPAD_PLUSMINUS"},
    {2612, "SCALE"},
    {2613, "HANGUEL"},
    {2614, "HANJA"},
    {2615, "YEN"},
    {2616, "STOP"},
    {2617, "AGAIN"},
    {2618, "PROPS"},
    {2619, "UNDO"},
    {2620, "COPY"},
    {2621, "OPEN"},
    {2622, "PASTE"},
    {2623, "FIND"},
    {2624, "CUT"},
    {2625, "HELP"},
    {2626, "CALC"},
    {2627, "FILE"},
    {2628, "BOOKMARKS"},
    {2629, "NEXT"},
    {2630, "PLAYPAUSE"},
    {2631, "PREVIOUS"},
    {2632, "STOPCD"},
    {2634, "CONFIG"},
    {2635, "REFRESH"},
    {2636, "EXIT"},
    {2637, "EDIT"},
    {2638, "SCROLLUP"},
    {2639, "SCROLLDOWN"},
    {2640, "NEW"},
    {2641, "REDO"},
    {2642, "CLOSE"},
    {2643, "PLAY"},
    {2644, "BASSBOOST"},
    {2645, "PRINT"},
    {2646, "CHAT"},
    {2647, "FINANCE"},
    {2648, "CANCEL"},
    {2649, "KBDILLUM_TOGGLE"},
    {2650, "KBDILLUM_DOWN"},
    {2651, "KBDILLUM_UP"},
    {2652, "SEND"},
    {2653, "REPLY"},
    {2654, "FORWARDMAIL"},
    {2655, "SAVE"},
    {2656, "DOCUMENTS"},
    {2657, "VIDEO_NEXT"},
    {2658, "VIDEO_PREV"},
    {2659, "BRIGHTNESS_CYCLE"},
    {2660, "BRIGHTNESS_ZERO"},
    {2661, "DISPLAY_OFF"},
    {2662, "BTN_MISC"},
    {2663, "GOTO"},
    {2664, "INFO"},
    {2665, "PROGRAM"},
    {2666, "PVR"},
    {2667, "SUBTITLE"},
    {2668, "FULL_SCREEN"},
    {2669, "KEYBOARD"},
    {2670, "ASPECT_RATIO"},
    {2671, "PC"},
    {2672, "TV"},
    {2673, "TV2"},
    {2674, "VCR"},
    {2675, "VCR2"},
    {2676, "SAT"},
    {2677, "CD"},
    {2678, "TAPE"},
    {2679, "TUNER"},
    {2680, "PLAYER"},
    {2681, "DVD"},
    {2682, "AUDIO"},
    {2683, "VIDEO"},
    {2684, "MEMO"},
    {2685, "CALENDAR"},
    {2686, "RED"},
    {2687, "GREEN"},
    {2688, "YELLOW"},
    {2689, "BLUE"},
    {2690, "CHANNELUP"},
    {2691, "CHANNELDOWN"},
    {2692, "LAST"},
    {2693, "RESTART"},
    {2694, "SLOW"},
    {2695, "SHUFFLE"},
    {2696, "VIDEOPHONE"},
    {2697, "GAMES"},
    {2698, "ZOOMIN"},
    {2699, "ZOOMOUT"},
    {2700, "ZOOMRESET"},
    {2701, "WORDPROCESSOR"},
    {2702, "EDITOR"},
    {2703, "SPREADSHEET"},
    {2704, "GRAPHICSEDITOR"},
    {2705, "PRESENTATION"},
    {2706, "DATABASE"},
    {2707, "NEWS"},
    {2708, "VOICEMAIL"},
    {2709, "ADDRESSBOOK"},
    {2710, "MESSENGER"},
    {2711, "BRIGHTNESS_TOGGLE"},
    {2712, "SPELLCHECK"},
    {2713, "COFFEE"},
    {2714, "MEDIA_REPEAT"},
    {2715, "IMAGES"},
    {2716, "BUTTONCONFIG"},
    {2717, "TASKMANAGER"},
    {2718, "JOURNAL"},
    {2719, "CONTROLPANEL"},
    {2720, "APPSELECT"},
    {2721, "SCREENSAVER"},
    {2722, "ASSISTANT"},
    {2723, "KBD_LAYOUT_NEXT"},
    {2724, "BRIGHTNESS_MIN"},
    {2725, "BRIGHTNESS_MAX"},
    {2726, "KBDINPUTASSIST_PREV"},
    {2727, "KBDINPUTASSIST_NEXT"},
    {2728, "KBDINPUTASSIST_PREVGROUP"},
    {2729, "KBDINPUTASSIST_NEXTGROUP"},
    {2730, "KBDINPUTASSIST_ACCEPT"},
    {2731, "KBDINPUTASSIST_CANCEL"},
    {2800, "FRONT"},
    {2801, "SETUP"},
    {2802, "WAKEUP"},
    {2803, "SENDFILE"},
    {2804, "DELETEFILE"},
    {2805, "XFER"},
    {2806, "PROG1"},
    {2807, "PROG2"},
    {2808, "MSDOS"},
    {2809, "SCREENLOCK"},
    {2810, "DIRECTION_ROTATE_DISPLAY"},
    {2811, "CYCLEWINDOWS"},
    {2812, "COMPUTER"},
    {2813, "EJECTCLOSECD"},
    {2814, "ISO"},
    {2815, "MOVE"},
    {2816, "F13"},
    {2817, "F14"},
    {2818, "F15"},
    {2819, "F16"},
    {2820, "F17"},
    {2821, "F18"},
    {2822, "F19"},
    {2823, "F20"},
    {2824, "F21"},
    {2825, "F22"},
    {2826, "F23"},
    {2827, "F24"},
    {2828, "PROG3"},
    {2829, "PROG4"},
    {2830, "DASHBOARD"},
    {2831, "SUSPEND"},
    {2832, "HP"},
    {2833, "SOUND"},
    {2834, "QUESTION"},
    {2836, "CONNECT"},
    {2837, "SPORT"},
    {2838, "SHOP"},
    {2839, "ALTERASE"},
    {2841, "SWITCHVIDEOMODE"},
    {2842, "BATTERY"},
    {2843, "BLUETOOTH"},
    {2844, "WLAN"},
    {2845, "UWB"},
    {2846, "WWAN_WIMAX"},
    {2847, "RFKILL"},
    {3001, "CHANNEL"},
    {3100, "BTN_0"},
    {3101, "BTN_1"},
    {3102, "BTN_2"},
    {3103, "BTN_3"},
    {3104, "BTN_4"},
    {3105, "BTN_5"},
    {3106, "BTN_6"},
    {3107, "BTN_7"},
    {3108, "BTN_8"},
    {3109, "BTN_9"},
};

static ArkUI_NativeNodeAPI_1* nodeAPI;
std::string value2String(napi_env env, napi_value value) // 将napi_value转化为string类型的变量
{
    size_t stringSize = 0;
    napi_get_value_string_utf8(env, value, nullptr, 0, &stringSize);
    std::string valueString;
    valueString.resize(stringSize);
    napi_get_value_string_utf8(env, value, &valueString[0], stringSize + 1, &stringSize);
    return valueString;
}

bool onKeyEventCBWR(OH_NativeXComponent *component, void *window)
{
    return true;
}

void DispatchMouseEventCB(OH_NativeXComponent *component, void *window)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "DispatchMouseEventCB");
    OH_NativeXComponent_ExtraMouseEventInfo *extMouseEvent = nullptr;
    OH_NativeXComponent_MouseEvent mouseEvent;
    OH_NativeXComponent_GetMouseEvent(component, window, &mouseEvent);
    int32_t ret = OH_NativeXComponent_GetExtraMouseEventInfo(component, &extMouseEvent);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        // 错误处理
    }
    uint64_t keys = 0u;
    ret = OH_NativeXComponent_GetMouseEventModifierKeyStates(extMouseEvent, &keys);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        // 错误处理
    }

    mouseStateString = "mouse:";
    if ((keys & ArkUI_ModifierKeyName::ARKUI_MODIFIER_KEY_CTRL) > 0) {
        mouseStateString += " ctrl: down";
    }
    if ((keys & ArkUI_ModifierKeyName::ARKUI_MODIFIER_KEY_SHIFT) > 0) {
        // Shift键被按下
        mouseStateString += " shift: down";
    }
    if ((keys & ArkUI_ModifierKeyName::ARKUI_MODIFIER_KEY_ALT) > 0) {
        // Alt键被按下
        mouseStateString += " alt: down";
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "mouse: %{public}s", mouseStateString.c_str());
}

void DispatchKeyEventCB(OH_NativeXComponent *component, void *window)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "DispatchKeyEventCB");
    OH_NativeXComponent_KeyEvent *keyEvent = nullptr;
    int ret = OH_NativeXComponent_GetKeyEvent(component, &keyEvent);
    OH_NativeXComponent_KeyCode keycode;
    OH_NativeXComponent_GetKeyEventCode(keyEvent, &keycode);
    std::string keyname = keyStrings[static_cast<int>(keycode)];
    std::string stateString = "key: " + keyname;

    // 修饰键
    uint64_t keys = 0u;
    ret = OH_NativeXComponent_GetKeyEventModifierKeyStates(keyEvent, &keys);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "OH_NativeXComponent_GetKeyEventModifierKeyStates: %{public}d", ret);

    if ((keys & ArkUI_ModifierKeyName::ARKUI_MODIFIER_KEY_CTRL) > 0) {
        // Ctrl键被按下
        stateString += " ctrl: down;";
        keyStateString = "key: " + keyname + " ctrl: down";
    }
    if ((keys & ArkUI_ModifierKeyName::ARKUI_MODIFIER_KEY_SHIFT) > 0) {
        // Shift键被按下
        stateString += " shift: down;";
        keyStateString = "key: " + keyname + " shift: down";
    }
    if ((keys & ArkUI_ModifierKeyName::ARKUI_MODIFIER_KEY_ALT) > 0) {
        // Alt键被按下
        stateString += " alt: down;";
        keyStateString = "key: " + keyname + " alt: down";
    }

    // 键盘指示灯键
    bool isCapsLockOn = false;
    ret = OH_NativeXComponent_GetKeyEventCapsLockState(keyEvent, &isCapsLockOn);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        // 错误处理
    }
    if (isCapsLockOn) {
        stateString += " capslock: on;";
        indicatorStateString = "key: " + keyname + " capslock: on";
    } else {
        // 大写未被锁定
    }
    
    bool isNumLockOn = false;
    ret = OH_NativeXComponent_GetKeyEventNumLockState(keyEvent, &isNumLockOn);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        // 错误处理
    }
    if (isNumLockOn) {
        stateString += " numlock: on;";
        indicatorStateString = "key: " + keyname + " numlock: on";
    } else {
        // 未开启小键盘锁
    }
    
    bool isScrollLockOn = false;
    ret = OH_NativeXComponent_GetKeyEventScrollLockState(keyEvent, &isScrollLockOn);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        // 错误处理
    }
    if (isScrollLockOn) {
        stateString += " scrolllock: on;";
        indicatorStateString = "key: " + keyname + " scrolllock: on";
    } else {
        // 未打开滚动锁定键
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "key: %{public}s", stateString.c_str());
}

void DispatchAxisEventCB(OH_NativeXComponent *component, ArkUI_UIInputEvent *event, ArkUI_UIInputEvent_Type type) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "DispatchAxisEventCB");
    if (component == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback", "DispatchAxisEventCB: component is null");
        return;
    }
    if (type == ArkUI_UIInputEvent_Type::ARKUI_UIINPUTEVENT_TYPE_AXIS) {
        int32_t actionValue = OH_ArkUI_AxisEvent_GetAxisAction(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "DispatchAxisEventCB actionValue %{public}d",
                     actionValue);
    }
}

HitTestMode OnTouchInterceptCallback(OH_NativeXComponent* component, ArkUI_UIInputEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "OnTouchInterceptCallback");
    return HTM_BLOCK;
}

ArkUI_NodeHandle CreateKeyMouseEventNodeHandle(const std::string &tag)
{
    // 创建XC组件
    ArkUI_NodeHandle xcNode = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT); // surface类型
    ArkUI_AttributeItem itemStringStyle = {.string = "XComponentKeyMouseEventPage_XComponent"};
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    ArkUI_NumberValue value2[] = {{.i32 = 0}, {.i32 = 0}, {.i32 = 200}, {.i32 = 200}};
    ArkUI_AttributeItem item2 = {value2, 4};

    value[0].f32 = 200;
    nodeAPI->setAttribute(xcNode, NODE_WIDTH, &item); // 200
    nodeAPI->setAttribute(xcNode, NODE_HEIGHT, &item); // 200
    nodeAPI->setAttribute(xcNode, NODE_ID, &itemStringStyle); // XComponentKeyMouseEventPage_XComponent
    nodeAPI->setAttribute(xcNode, NODE_XCOMPONENT_SURFACE_RECT, &item2); // 200*200
    value[0].u32 = 0xFFFF0000; // 红色
    nodeAPI->setAttribute(xcNode, NODE_BACKGROUND_COLOR, &item);
    value[0].i32 = 1; // true
    nodeAPI->setAttribute(xcNode, NODE_FOCUSABLE, &item); // focusable: true
    nodeAPI->setAttribute(xcNode, NODE_DEFAULT_FOCUS, &item); // defaultFocus: true
    nodeAPI->setAttribute(xcNode, NODE_FOCUS_ON_TOUCH, &item); // focusOnTouch: true

    auto *nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcNode);
    OH_NativeXComponent_RegisterKeyEventCallback(nativeXComponent, DispatchKeyEventCB);

    static OH_NativeXComponent_MouseEvent_Callback mouseCallback = {
        .DispatchMouseEvent = DispatchMouseEventCB,
    };
    OH_NativeXComponent_RegisterMouseEventCallback(nativeXComponent, &mouseCallback);

    return xcNode;
}

napi_value XComponentKeyMouseEventTest::CreateKeyMouseEventNativeRoot(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 2;
    napi_value args[2] = { nullptr, nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != 2) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "napi_get_cb_info success");
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "OH_ArkUI_GetNodeHandleFromNapiValue %{public}d");
    nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
    );
    std::string tag = value2String(env, args[1]);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "tag=%{public}s", tag.c_str());
    int32_t ret = OH_ArkUI_NodeContent_SetUserData(nodeContentHandle_, new std::string(tag));
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "setUserData failed error=%{public}d", ret);
    }
    if (nodeAPI != nullptr && nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager",
                     "CreateNativeNode tag=%{public}s", tag.c_str());
        auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
            ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
            std::string *userDate = reinterpret_cast<std::string*>(OH_ArkUI_NodeContent_GetUserData(handle));
            if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
                ArkUI_NodeHandle testNode;
                if (userDate) {
                    testNode = CreateKeyMouseEventNodeHandle(*userDate);
                    delete userDate;
                    userDate = nullptr;
                } else {
                    testNode = CreateKeyMouseEventNodeHandle("noUserData");
                }
                OH_ArkUI_NodeContent_AddNode(handle, testNode);
            }
        };
        OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle_, nodeContentEvent);
    }
    return nullptr;
}

napi_value XComponentKeyMouseEventTest::GetKeyString(napi_env env, napi_callback_info info)
{
    napi_value cppStr;
    napi_create_string_latin1(env, keyStateString.c_str(), keyStateString.size(), &(cppStr));
    return cppStr;
}

napi_value XComponentKeyMouseEventTest::GetIndicatorString(napi_env env, napi_callback_info info)
{
    napi_value cppStr;
    napi_create_string_latin1(env, indicatorStateString.c_str(), indicatorStateString.size(), &(cppStr));
    return cppStr;
}

napi_value XComponentKeyMouseEventTest::GetMouseString(napi_env env, napi_callback_info info)
{
    napi_value cppStr;
    napi_create_string_latin1(env, mouseStateString.c_str(), mouseStateString.size(), &(cppStr));
    return cppStr;
}

napi_value XComponentKeyMouseEventTest::TestGetExtraMouseEventInfoErrorCode_01(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle xcNode = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("XComponentKeyMouseEventPage_XComponent", &xcNode);
    OH_NativeXComponent* nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcNode);

    OH_NativeXComponent_ExtraMouseEventInfo *extMouseEvent = nullptr;
    int32_t ret = OH_NativeXComponent_GetExtraMouseEventInfo(nativeXComponent, &extMouseEvent);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetExtraMouseEventInfoErrorCode_01: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetExtraMouseEventInfoErrorCode_02(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent_ExtraMouseEventInfo *extMouseEvent = nullptr;
    int32_t ret = OH_NativeXComponent_GetExtraMouseEventInfo(nullptr, &extMouseEvent);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetExtraMouseEventInfoErrorCode_02: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetMouseEventModifierKeyStatesErrorCode_01(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle xcNode = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("XComponentKeyMouseEventPage_XComponent", &xcNode);
    OH_NativeXComponent* nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcNode);
    
    OH_NativeXComponent_ExtraMouseEventInfo *extMouseEvent = nullptr;
    OH_NativeXComponent_GetExtraMouseEventInfo(nativeXComponent, &extMouseEvent);

    uint64_t keys = 0u;
    int32_t ret = OH_NativeXComponent_GetMouseEventModifierKeyStates(extMouseEvent, &keys);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetMouseEventModifierKeyStatesErrorCode_01: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetMouseEventModifierKeyStatesErrorCode_02(napi_env env, napi_callback_info info)
{
    uint64_t keys = 0u;
    int32_t ret = OH_NativeXComponent_GetMouseEventModifierKeyStates(nullptr, &keys);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetMouseEventModifierKeyStatesErrorCode_02: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetKeyEventModifierKeyStatesErrorCode_01(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle xcNode = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("XComponentKeyMouseEventPage_XComponent", &xcNode);
    OH_NativeXComponent* nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcNode);

    OH_NativeXComponent_KeyEvent *keyEvent = nullptr;
    OH_NativeXComponent_GetKeyEvent(nativeXComponent, &keyEvent);

    // 修饰键
    uint64_t keys = 0u;
    int32_t ret = OH_NativeXComponent_GetKeyEventModifierKeyStates(keyEvent, &keys);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetKeyEventModifierKeyStatesErrorCode_01: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetKeyEventModifierKeyStatesErrorCode_02(napi_env env, napi_callback_info info)
{
    // 修饰键
    uint64_t keys = 0u;
    int32_t ret = OH_NativeXComponent_GetKeyEventModifierKeyStates(nullptr, &keys);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetKeyEventModifierKeyStatesErrorCode_02: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetKeyEventNumLockStateErrorCode_01(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle xcNode = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("XComponentKeyMouseEventPage_XComponent", &xcNode);
    OH_NativeXComponent* nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcNode);

    OH_NativeXComponent_KeyEvent *keyEvent = nullptr;
    OH_NativeXComponent_GetKeyEvent(nativeXComponent, &keyEvent);

    // 小键盘锁
    bool isNumLockOn = false;
    int32_t ret = OH_NativeXComponent_GetKeyEventNumLockState(keyEvent, &isNumLockOn);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetKeyEventNumLockStateErrorCode_01: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetKeyEventNumLockStateErrorCode_02(napi_env env, napi_callback_info info)
{
    // 小键盘锁
    bool isNumLockOn = false;
    int32_t ret = OH_NativeXComponent_GetKeyEventNumLockState(nullptr, &isNumLockOn);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetKeyEventNumLockStateErrorCode_02: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetKeyEventCapsLockStateErrorCode_01(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle xcNode = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("XComponentKeyMouseEventPage_XComponent", &xcNode);
    OH_NativeXComponent* nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcNode);

    OH_NativeXComponent_KeyEvent *keyEvent = nullptr;
    OH_NativeXComponent_GetKeyEvent(nativeXComponent, &keyEvent);

    // 大写字母锁
    bool isCapsLockOn = false;
    int32_t ret = OH_NativeXComponent_GetKeyEventCapsLockState(keyEvent, &isCapsLockOn);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetKeyEventCapsLockStateErrorCode_01: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetKeyEventCapsLockStateErrorCode_02(napi_env env, napi_callback_info info)
{
    // 大写字母锁
    bool isCapsLockOn = false;
    int32_t ret = OH_NativeXComponent_GetKeyEventCapsLockState(nullptr, &isCapsLockOn);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetKeyEventCapsLockStateErrorCode_02: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetKeyEventScrollLockStateErrorCode_01(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle xcNode = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("XComponentKeyMouseEventPage_XComponent", &xcNode);
    OH_NativeXComponent* nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcNode);

    OH_NativeXComponent_KeyEvent *keyEvent = nullptr;
    OH_NativeXComponent_GetKeyEvent(nativeXComponent, &keyEvent);

    // 滚动锁定键
    bool isScrollLockOn = false;
    int32_t ret = OH_NativeXComponent_GetKeyEventScrollLockState(keyEvent, &isScrollLockOn);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetKeyEventScrollLockStateErrorCode_01: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetKeyEventScrollLockStateErrorCode_02(napi_env env, napi_callback_info info)
{
    // 滚动锁定键
    bool isScrollLockOn = false;
    int32_t ret = OH_NativeXComponent_GetKeyEventScrollLockState(nullptr, &isScrollLockOn);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestGetKeyEventScrollLockStateErrorCode_02: %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestRegisterKeyEventCallbackWithResult_01(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    auto *nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcomponent);

    auto ret = OH_NativeXComponent_RegisterKeyEventCallbackWithResult(nativeXComponent, onKeyEventCBWR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestRegisterKeyEventCallbackWithResult_01: %{public}d", ret);
    ASSERT_EQ(ret, OH_NATIVEXCOMPONENT_RESULT_SUCCESS);

    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestRegisterKeyEventCallbackWithResult_02(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_RegisterKeyEventCallbackWithResult(nullptr, onKeyEventCBWR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds",
        "TestRegisterKeyEventCallbackWithResult_02: %{public}d", ret);
    ASSERT_EQ(ret, OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER);

    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetTouchPointErrorCode_01(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    auto *nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcomponent);

    float windowX = 0.0f;
    float windowY = 0.0f;
    float displayX = 0.0f;
    float displayY = 0.0f;
    auto ret1 = OH_NativeXComponent_GetTouchPointWindowX(nativeXComponent, 0, &windowX);
    auto ret2 = OH_NativeXComponent_GetTouchPointWindowY(nativeXComponent, 0, &windowY);
    auto ret3 = OH_NativeXComponent_GetTouchPointDisplayX(nativeXComponent, 0, &displayX);
    auto ret4 = OH_NativeXComponent_GetTouchPointDisplayY(nativeXComponent, 0, &displayY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestGetTouchPointErrorCode_01: %{public}d", ret1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestGetTouchPointErrorCode_01: %{public}d", ret2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestGetTouchPointErrorCode_01: %{public}d", ret3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestGetTouchPointErrorCode_01: %{public}d", ret4);
    ASSERT_EQ(ret1, OH_NATIVEXCOMPONENT_RESULT_SUCCESS);
    ASSERT_EQ(ret2, OH_NATIVEXCOMPONENT_RESULT_SUCCESS);
    ASSERT_EQ(ret3, OH_NATIVEXCOMPONENT_RESULT_SUCCESS);
    ASSERT_EQ(ret4, OH_NATIVEXCOMPONENT_RESULT_SUCCESS);

    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetTouchPointErrorCode_02(napi_env env, napi_callback_info info)
{
    float windowX = 0.0f;
    float windowY = 0.0f;
    float displayX = 0.0f;
    float displayY = 0.0f;
    auto ret1 = OH_NativeXComponent_GetTouchPointWindowX(nullptr, 0, &windowX);
    auto ret2 = OH_NativeXComponent_GetTouchPointWindowY(nullptr, 0, &windowY);
    auto ret3 = OH_NativeXComponent_GetTouchPointDisplayX(nullptr, 0, &displayX);
    auto ret4 = OH_NativeXComponent_GetTouchPointDisplayY(nullptr, 0, &displayY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestGetTouchPointErrorCode_02: %{public}d", ret1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestGetTouchPointErrorCode_02: %{public}d", ret2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestGetTouchPointErrorCode_02: %{public}d", ret3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestGetTouchPointErrorCode_02: %{public}d", ret4);
    ASSERT_EQ(ret1, OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER);
    ASSERT_EQ(ret2, OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER);
    ASSERT_EQ(ret3, OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER);
    ASSERT_EQ(ret4, OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER);

    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestRegisterUIInputEventCallbackErrorCode_01(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);

    OH_NativeXComponent* nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcomponent);
    int32_t ret = OH_NativeXComponent_RegisterUIInputEventCallback(nativeXComponent, DispatchAxisEventCB,
        ArkUI_UIInputEvent_Type::ARKUI_UIINPUTEVENT_TYPE_AXIS);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestRegisterUIInputEventCallbackErrorCode_01: %{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);

    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestRegisterUIInputEventCallbackErrorCode_02(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_NativeXComponent_RegisterUIInputEventCallback(nullptr, DispatchAxisEventCB,
        ArkUI_UIInputEvent_Type::ARKUI_UIINPUTEVENT_TYPE_AXIS);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestRegisterUIInputEventCallbackErrorCode_02: %{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);

    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestRegisterOnTouchInterceptCallbackErrorCode_01(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);

    OH_NativeXComponent* nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcomponent);
    int32_t ret = OH_NativeXComponent_RegisterOnTouchInterceptCallback(nativeXComponent, OnTouchInterceptCallback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestRegisterOnTouchInterceptCallbackErrorCode_01: %{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);

    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestRegisterOnTouchInterceptCallbackErrorCode_02(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_NativeXComponent_RegisterOnTouchInterceptCallback(nullptr, OnTouchInterceptCallback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestRegisterOnTouchInterceptCallbackErrorCode_02: %{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);

    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetNativeAccessibilityProviderErrorCode_01(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);

    ArkUI_AccessibilityProvider* handle;
    OH_NativeXComponent* nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcomponent);
    int32_t ret = OH_NativeXComponent_GetNativeAccessibilityProvider(nativeXComponent, &handle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestGetNativeAccessibilityProviderErrorCode_01: %{public}d", ret);

    ASSERT_EQ(ret, OH_NATIVEXCOMPONENT_RESULT_SUCCESS);

    NAPI_END;
}

napi_value XComponentKeyMouseEventTest::TestGetNativeAccessibilityProviderErrorCode_02(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityProvider* handle;
    int32_t ret = OH_NativeXComponent_GetNativeAccessibilityProvider(nullptr, &handle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestGetNativeAccessibilityProviderErrorCode_02: %{public}d", ret);

    ASSERT_EQ(ret, OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER);

    NAPI_END;
}

} // namespace NativeXComponentSample