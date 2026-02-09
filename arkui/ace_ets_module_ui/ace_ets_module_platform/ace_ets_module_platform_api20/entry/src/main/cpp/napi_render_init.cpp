/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

#include "render/EGLRender.h"
#include "napi/native_api.h"
#include <native_window/external_window.h>
#include <unordered_map>
#include <hilog/log.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <native_buffer/native_buffer.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include "AccessibilityManagerTest.h"
#include "common/common.h"
#include <arkui/native_node.h>
#include <arkui/native_gesture.h>
#include <arkui/native_interface.h>

#include "XComponent/XComponentCrossLanguageTest.h"

static int NUMBER_200 = 200;

// libraryname模式不要使用xcomponentId区分组件
static std::unordered_map<std::string, ArkUI_NodeHandle> nodeHandleMap;
static std::unordered_map<std::string, AccessibilityManager*> accessibilityProviderMap;
static std::unordered_map<void*, EGLRender*> rendererMap;
static std::unordered_map<void*, OH_ArkUI_SurfaceCallback*> callbackMap;
static std::unordered_map<void*, OH_ArkUI_SurfaceHolder*> surfaceHolderMap;

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

ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
    );

std::string value2String(napi_env env, napi_value value)
{
    size_t stringSize = 0;
    napi_get_value_string_utf8(env, value, nullptr, 0, &stringSize);
    std::string valueString;
    valueString.resize(stringSize);
    napi_get_value_string_utf8(env, value, &valueString[0], stringSize+1, &stringSize);
    if (valueString.size() == 9) valueString.pop_back();
    return valueString;
}

void OnSurfaceCreated(OH_ArkUI_SurfaceHolder* holder)
{
    auto window = OH_ArkUI_XComponent_GetNativeWindow(holder);
    auto render =  new EGLRender();
    rendererMap[holder] = render;
    render->SetUpEGLContext(window, 0);
}

void OnSurfaceChanged(OH_ArkUI_SurfaceHolder* holder, uint64_t width, uint64_t height)
{
    auto window = OH_ArkUI_XComponent_GetNativeWindow(holder);
    uint64_t sid;
    OH_NativeWindow_GetSurfaceId(window, &sid);
    if (rendererMap.count(holder)) {
        auto render = rendererMap[holder];
        render->SetEGLWindowSize(width, height);
    }
}

void OnSurfaceDestroyed(OH_ArkUI_SurfaceHolder* holder)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "on destroyed");
    auto window = OH_ArkUI_XComponent_GetNativeWindow(holder);
    if (rendererMap.count(holder)) {
        auto render = rendererMap[holder];
        delete render;
        rendererMap.erase(holder);
    }
    if (callbackMap.count(holder)) {
        OH_ArkUI_SurfaceCallback_Dispose(callbackMap[holder]);
        callbackMap.erase(holder);
    }
    OH_ArkUI_SurfaceHolder_Dispose(holder);
}

void OnFrameCallback(ArkUI_NodeHandle node, uint64_t a, uint64_t b)
{
    if (!surfaceHolderMap.count(node)) {
        return;
    }
    auto holder = surfaceHolderMap[node];
    auto render = rendererMap[holder];
    render->DrawOnFrame();
}

void OnSurfaceShow(OH_ArkUI_SurfaceHolder* holder)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "on surface show");
}

void OnSurfaceHide(OH_ArkUI_SurfaceHolder* holder)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "on surface hide");
}

void SetXComponentID(ArkUI_NodeHandle node,  const char* id)
{
    ArkUI_AttributeItem item = {nullptr, 0, id};
    nodeAPI->setAttribute(node, NODE_XCOMPONENT_ID, &item);
    return;
}

void SetHeight(ArkUI_NodeHandle node, float height)
{
    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(node, NODE_HEIGHT, &item);
    return;
}
void SetWidth(ArkUI_NodeHandle node, float width)
{
    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(node, NODE_WIDTH, &item);
    return;
}

void focusable(ArkUI_NodeHandle handle, bool focusable)
{
    ArkUI_NumberValue value[] = {{.i32 = static_cast<int>(focusable)}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(handle, NODE_FOCUSABLE, &item);
}

void defaultFocus(ArkUI_NodeHandle handle, bool defaultFocus)
{
    ArkUI_NumberValue value[] = {{.i32 = static_cast<int>(defaultFocus)}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(handle, NODE_DEFAULT_FOCUS, &item);
}

void focusOnTouch(ArkUI_NodeHandle handle, bool focusOnTouch)
{
    ArkUI_NumberValue value[] = {{.i32 = static_cast<int>(focusOnTouch)}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(handle, NODE_FOCUS_ON_TOUCH, &item);
}

void setBackgroundColor(ArkUI_NodeHandle handle)
{
    ArkUI_NumberValue value[] = { {.u32=0xFFFF0000} };
    ArkUI_AttributeItem item = { value, sizeof(value)/sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(handle, NODE_BACKGROUND_COLOR, &item);
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

napi_value GetKeyString(napi_env env, napi_callback_info info)
{
    napi_value cppStr;
    napi_create_string_latin1(env, keyStateString.c_str(), keyStateString.size(), &(cppStr));
    return cppStr;
}

napi_value GetIndicatorString(napi_env env, napi_callback_info info)
{
    napi_value cppStr;
    napi_create_string_latin1(env, indicatorStateString.c_str(), indicatorStateString.size(), &(cppStr));
    return cppStr;
}

napi_value GetMouseString(napi_env env, napi_callback_info info)
{
    napi_value cppStr;
    napi_create_string_latin1(env, mouseStateString.c_str(), mouseStateString.size(), &(cppStr));
    return cppStr;
}

napi_value createNativeNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }

    size_t argCnt = 1;
    napi_value args[1] = { nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        return nullptr;
    }

    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    if (OH_ArkUI_NodeContent_GetUserData(nodeContentHandle_)) {
        return nullptr;
    }

    ArkUI_NodeHandle xcNode = nullptr;
    xcNode = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    SetXComponentID(xcNode, "surfaceRect");
    SetWidth(xcNode, NUMBER_200);
    SetHeight(xcNode, NUMBER_200);
    setBackgroundColor(xcNode);
    focusable(xcNode, true);
    defaultFocus(xcNode, true);
    focusOnTouch(xcNode, true);

    auto  *nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcNode);
    
    OH_NativeXComponent_RegisterKeyEventCallback(nativeXComponent, DispatchKeyEventCB);
    static OH_NativeXComponent_MouseEvent_Callback mouseCallback = {
        .DispatchMouseEvent = DispatchMouseEventCB,
    };
    OH_NativeXComponent_RegisterMouseEventCallback(nativeXComponent, &mouseCallback);

    OH_ArkUI_NodeContent_SetUserData(nodeContentHandle_, xcNode);

    auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
        ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
        auto xc = reinterpret_cast<ArkUI_NodeHandle>(OH_ArkUI_NodeContent_GetUserData(handle));
        if (xc == nullptr) return;
    
        if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
            OH_ArkUI_NodeContent_AddNode(handle, xc);
        } else {
            OH_ArkUI_NodeContent_RemoveNode(handle, xc);
            nodeAPI->disposeNode(xc);
            OH_ArkUI_NodeContent_SetUserData(handle, nullptr);
        }
    };
    OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle_, nodeContentEvent);
    
    return nullptr;
}

napi_value bindNode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    ArkUI_NodeHandle handle;

    OH_ArkUI_GetNodeHandleFromNapiValue(env, args[1], &handle);
    OH_ArkUI_SurfaceHolder* holder = OH_ArkUI_SurfaceHolder_Create(handle);
    nodeHandleMap[nodeId] = handle;
    surfaceHolderMap[handle] = holder;
    auto callback = OH_ArkUI_SurfaceCallback_Create();
    OH_ArkUI_SurfaceCallback_SetSurfaceCreatedEvent(callback, OnSurfaceCreated);
    OH_ArkUI_SurfaceCallback_SetSurfaceChangedEvent(callback, OnSurfaceChanged);
    OH_ArkUI_SurfaceCallback_SetSurfaceDestroyedEvent(callback, OnSurfaceDestroyed);
    OH_ArkUI_SurfaceCallback_SetSurfaceShowEvent(callback, OnSurfaceShow);
    OH_ArkUI_SurfaceCallback_SetSurfaceHideEvent(callback, OnSurfaceHide);
    OH_ArkUI_XComponent_RegisterOnFrameCallback(handle, OnFrameCallback);
    OH_ArkUI_SurfaceHolder_AddSurfaceCallback(holder, callback);
    
    return nullptr;
}

napi_value unbindNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    nodeAPI->disposeNode(node);
    nodeHandleMap.erase(nodeId);
    return nullptr;
}

napi_value setNeedSoftKeyboard(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    
    bool needSoftKeyboard = false;
    napi_get_value_bool(env, args[1], &needSoftKeyboard);
    int32_t status = OH_ArkUI_XComponent_SetNeedSoftKeyboard(node, needSoftKeyboard);

    return nullptr;
}

napi_value disposeProvider(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    if (accessibilityProviderMap.count(nodeId)) {
        OH_ArkUI_AccessibilityProvider_Dispose(accessibilityProviderMap[nodeId]->getProvider());
        delete accessibilityProviderMap[nodeId];
        accessibilityProviderMap.erase(nodeId);
    }
    return nullptr;
}

napi_value createProvider(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    accessibilityProviderMap[nodeId] = new AccessibilityManager();
    accessibilityProviderMap[nodeId]->Initialize(nodeId, node);
    return nullptr;
}

napi_value registerFrameCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    int32_t status = OH_ArkUI_XComponent_RegisterOnFrameCallback(node, OnFrameCallback);

    napi_value statusCode;
    napi_status ret = napi_create_int32(env, status, &(statusCode));

    return statusCode;
}

napi_value unregisterFrameCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    int32_t status = OH_ArkUI_XComponent_UnregisterOnFrameCallback(node);

    napi_value statusCode;
    napi_status ret = napi_create_int32(env, status, &(statusCode));

    return statusCode;
}

napi_value TestSetExpectedFrameRateRangeErrorCode_001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    
    OH_NativeXComponent_ExpectedRateRange range = {
        .min = 0,
        .max = 120,
        .expected = 60
    };
    int32_t status = OH_ArkUI_XComponent_SetExpectedFrameRateRange(node, range);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "setFrameRate %{public}d", status);

    ASSERT_EQ(status, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value TestSetExpectedFrameRateRangeErrorCode_002(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    
    OH_NativeXComponent_ExpectedRateRange range = {
        .min = 120,
        .max = 100,
        .expected = 60
    };
    int32_t status = OH_ArkUI_XComponent_SetExpectedFrameRateRange(node, range);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "setFrameRate %{public}d", status);

    ASSERT_EQ(status, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TestSetNeedSoftKeyboardErrorCode_001(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    
    bool needSoftKeyboard = false;
    napi_get_value_bool(env, args[1], &needSoftKeyboard);
    int32_t status = OH_ArkUI_XComponent_SetNeedSoftKeyboard(node, needSoftKeyboard);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestSetNeedSoftKeyboardErrorCode_001 %{public}d", status);

    ASSERT_EQ(status, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value TestSetNeedSoftKeyboardErrorCode_002(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    
    bool needSoftKeyboard = false;
    napi_get_value_bool(env, args[1], &needSoftKeyboard);
    int32_t status = OH_ArkUI_XComponent_SetNeedSoftKeyboard(nullptr, needSoftKeyboard);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestSetNeedSoftKeyboardErrorCode_002 %{public}d", status);

    ASSERT_EQ(status, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TestRegisterOnFrameCallbackErrorCode_001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    int32_t status = OH_ArkUI_XComponent_RegisterOnFrameCallback(node, OnFrameCallback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestRegisterOnFrameCallbackErrorCode_001 %{public}d", status);

    ASSERT_EQ(status, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value TestRegisterOnFrameCallbackErrorCode_002(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    int32_t status = OH_ArkUI_XComponent_RegisterOnFrameCallback(nullptr, OnFrameCallback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestRegisterOnFrameCallbackErrorCode_002 %{public}d", status);

    ASSERT_EQ(status, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TestUnregisterOnFrameCallbackErrorCode_001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    int32_t status = OH_ArkUI_XComponent_UnregisterOnFrameCallback(node);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestUnregisterOnFrameCallbackErrorCode_001 %{public}d", status);

    ASSERT_EQ(status, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value TestUnregisterOnFrameCallbackErrorCode_002(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    auto node = nodeHandleMap[nodeId];
    int32_t status = OH_ArkUI_XComponent_UnregisterOnFrameCallback(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "TestUnregisterOnFrameCallbackErrorCode_002 %{public}d", status);

    ASSERT_EQ(status, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"bindNode", nullptr, bindNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unbindNode", nullptr, unbindNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setNeedSoftKeyboard", nullptr, setNeedSoftKeyboard, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"disposeProvider", nullptr, disposeProvider, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createProvider", nullptr, createProvider, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerFrameCallback", nullptr, registerFrameCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unregisterFrameCallback", nullptr, unregisterFrameCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestSetExpectedFrameRateRangeErrorCode_001", nullptr, TestSetExpectedFrameRateRangeErrorCode_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestSetExpectedFrameRateRangeErrorCode_002", nullptr, TestSetExpectedFrameRateRangeErrorCode_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestRegisterOnFrameCallbackErrorCode_001", nullptr, TestRegisterOnFrameCallbackErrorCode_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestRegisterOnFrameCallbackErrorCode_002", nullptr, TestRegisterOnFrameCallbackErrorCode_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestUnregisterOnFrameCallbackErrorCode_001", nullptr, TestUnregisterOnFrameCallbackErrorCode_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestUnregisterOnFrameCallbackErrorCode_002", nullptr, TestUnregisterOnFrameCallbackErrorCode_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestSetNeedSoftKeyboardErrorCode_001", nullptr, TestSetNeedSoftKeyboardErrorCode_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestSetNeedSoftKeyboardErrorCode_002", nullptr, TestSetNeedSoftKeyboardErrorCode_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        
        {"createNativeNode", nullptr, createNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr },
        {"getKeyStr", nullptr, GetKeyString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getIndicatorStr", nullptr, GetIndicatorString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getMouseStr", nullptr, GetMouseString, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"createCrossLanguageXComponentNativeNode", nullptr, XComponentCrossLanguageTest::createCrossLanguageXComponentNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"crossLanguageSetXComponentAttribute", nullptr, XComponentCrossLanguageTest::crossLanguageSetXComponentAttribute,
         nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
