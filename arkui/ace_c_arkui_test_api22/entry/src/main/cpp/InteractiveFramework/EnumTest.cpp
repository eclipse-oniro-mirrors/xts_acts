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
#include "common/common.h"
#include <arkui/native_key_event.h>
#include <arkui/native_node.h>
#include <arkui/drag_and_drop.h>
#include <arkui/native_gesture.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

#define PARAM_160002 160002
#define PARAM_128 128

namespace ArkUICapiTest {

static napi_value Enum_ARKUI_GESTURE_RECOGNIZER_STATE_READY(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(ARKUI_GESTURE_RECOGNIZER_STATE_READY, PARAM_0);
    NAPI_END;
}

static napi_value Enum_ARKUI_GESTURE_RECOGNIZER_STATE_DETECTING(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(ARKUI_GESTURE_RECOGNIZER_STATE_DETECTING, PARAM_1);
    NAPI_END;
}

static napi_value Enum_ARKUI_GESTURE_RECOGNIZER_STATE_PENDING(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(ARKUI_GESTURE_RECOGNIZER_STATE_PENDING, PARAM_2);
    NAPI_END;
}
static napi_value Enum_ARKUI_GESTURE_RECOGNIZER_STATE_BLOCKED(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(ARKUI_GESTURE_RECOGNIZER_STATE_BLOCKED, PARAM_3);
    NAPI_END;
}
static napi_value Enum_ARKUI_GESTURE_RECOGNIZER_STATE_FAILED(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(ARKUI_GESTURE_RECOGNIZER_STATE_FAILED, PARAM_5);
    NAPI_END;
}
static napi_value Enum_ARKUI_ERROR_CODE_COMPONENT_SNAPSHOT_TIMEOUT(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(ARKUI_ERROR_CODE_COMPONENT_SNAPSHOT_TIMEOUT, PARAM_160002);
    NAPI_END;
}
static napi_value Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_ALL(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_ALL, PARAM_0);
    NAPI_END;
}
static napi_value Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_FINGER(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_FINGER, PARAM_1);
    NAPI_END;
}
static napi_value Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_PEN(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_PEN, PARAM_2);
    NAPI_END;
}
static napi_value Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_MOUSE(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_MOUSE, PARAM_3);
    NAPI_END;
}
static napi_value Enum_UI_INPUT_EVENT_SOURCE_TYPE_UNKNOWN(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(UI_INPUT_EVENT_SOURCE_TYPE_UNKNOWN, PARAM_0);
    NAPI_END;
}
static napi_value Enum_UI_INPUT_EVENT_SOURCE_TYPE_MOUSE(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(UI_INPUT_EVENT_SOURCE_TYPE_MOUSE, PARAM_1);
    NAPI_END;
}
static napi_value Enum_UI_INPUT_EVENT_SOURCE_TYPE_KEY(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(UI_INPUT_EVENT_SOURCE_TYPE_KEY, PARAM_4);
    NAPI_END;
}
static napi_value Enum_UI_INPUT_EVENT_SOURCE_TYPE_JOYSTICK(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(UI_INPUT_EVENT_SOURCE_TYPE_JOYSTICK, PARAM_5);
    NAPI_END;
}
typedef int ArkUI_Int32;
typedef float ArkUI_Float32;
struct ArkUIAPIEventGestureAsyncEvent {
    ArkUI_Int32 subKind;
};

struct ArkUI_GestureEvent_ {
    ArkUIAPIEventGestureAsyncEvent eventData;
};

static napi_value Enum_GESTURE_EVENT_ACTION_ACCEPT(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_GestureEvent_ *aaa = new ArkUI_GestureEvent_;
    aaa ->eventData.subKind = PARAM_0;
    auto aa = OH_ArkUI_GestureEvent_GetActionType((ArkUI_GestureEvent *)aaa);
    ASSERT_EQ(aa, GESTURE_EVENT_ACTION_ACCEPT);
    aaa ->eventData.subKind = PARAM_2;
    auto bb = OH_ArkUI_GestureEvent_GetActionType((ArkUI_GestureEvent *)aaa);
    ASSERT_EQ(bb, GESTURE_EVENT_ACTION_UPDATE);
    aaa ->eventData.subKind = PARAM_3;
    auto cc = OH_ArkUI_GestureEvent_GetActionType((ArkUI_GestureEvent *)aaa);
    ASSERT_EQ(cc, GESTURE_EVENT_ACTION_END);
    aaa ->eventData.subKind = PARAM_4;
    auto dd = OH_ArkUI_GestureEvent_GetActionType((ArkUI_GestureEvent *)aaa);
    ASSERT_EQ(dd, GESTURE_EVENT_ACTION_CANCEL);
    NAPI_END;
}

struct ArkUI_NodeEvent_I {
    int32_t category;
    int32_t kind;
};

static napi_value Enum_OH_ArkUI_NodeEvent_GetEventType(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NodeEvent_I *event = new ArkUI_NodeEvent_I;
    event ->category = PARAM_0;
    int eventTypes[] = {
        NODE_TOUCH_EVENT,
        NODE_EVENT_ON_APPEAR,
        NODE_EVENT_ON_DISAPPEAR,
        NODE_EVENT_ON_AREA_CHANGE,
        NODE_ON_FOCUS,
        NODE_ON_BLUR,
        NODE_ON_CLICK,
        NODE_ON_TOUCH_INTERCEPT,
        NODE_EVENT_ON_VISIBLE_AREA_CHANGE,
        NODE_ON_HOVER,
        NODE_ON_MOUSE,
        NODE_EVENT_ON_ATTACH,
        NODE_EVENT_ON_DETACH,
        NODE_ON_ACCESSIBILITY_ACTIONS,
        NODE_ON_PRE_DRAG,
        NODE_ON_DRAG_START,
        NODE_ON_DRAG_ENTER,
        NODE_ON_DRAG_MOVE,
        NODE_ON_DRAG_LEAVE,
        NODE_ON_DROP,
        NODE_ON_DRAG_END,
        NODE_ON_KEY_EVENT,
        NODE_ON_KEY_PRE_IME,
        NODE_ON_FOCUS_AXIS,
        NODE_DISPATCH_KEY_EVENT,
        NODE_ON_AXIS,
        NODE_ON_CLICK_EVENT,
        NODE_ON_HOVER_EVENT,
        NODE_VISIBLE_AREA_APPROXIMATE_CHANGE_EVENT,
        NODE_ON_HOVER_MOVE,
        NODE_ON_SIZE_CHANGE,
        NODE_ON_COASTING_AXIS_EVENT,
        NODE_ON_CHILD_TOUCH_TEST,
        NODE_CHECKBOX_EVENT_ON_CHANGE,
        NODE_CHECKBOX_GROUP_EVENT_ON_CHANGE,
        NODE_RADIO_EVENT_ON_CHANGE,
        NODE_SLIDER_EVENT_ON_CHANGE
    };
    for (int i = PARAM_0; i < sizeof(eventTypes) / sizeof(eventTypes[PARAM_0]); i++) {
        event->kind = eventTypes[i];
        auto eventType = OH_ArkUI_NodeEvent_GetEventType((ArkUI_NodeEvent*)event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetEventType", "result:%{public}d", eventType);
        ASSERT_EQ(eventType, eventTypes[i]);
    }
    NAPI_END;
}
typedef enum {
    C_KEY_EVENT_ID = PARAM_5,
} ArkUIEventTypeId_;

struct ArkUI_UIInputEvent_ {
    ArkUI_UIInputEvent_Type inputType;
    ArkUIEventTypeId_ eventTypeId;
    void* inputEvent;
    bool isCloned = false;
    int32_t apiVersion = PARAM_0;
};

typedef unsigned int ArkUI_Uint32;
typedef long long ArkUI_Int64;
typedef double ArkUI_Float64;

struct ArkUIKeyEvent_ {
    ArkUI_Int32 subKind;
    ArkUI_Int32 type;
    ArkUI_Int32 keyCode;
    char keyText[PARAM_128];
    ArkUI_Int32 keySource;
    ArkUI_Int64 deviceId;
    ArkUI_Uint32 unicode;
    ArkUI_Float64 timestamp;
    ArkUI_Int32* pressedKeyCodes;
    ArkUI_Int32 keyCodesLength;
    ArkUI_Int32 intentionCode;
};

static napi_value Enum_OH_ArkUI_KeyEvent_GetType(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    std::vector<ArkUI_KeyEventType> keyTypes = {
        ARKUI_KEY_EVENT_UNKNOWN,
        ARKUI_KEY_EVENT_DOWN,
        ARKUI_KEY_EVENT_UP,
        ARKUI_KEY_EVENT_LONG_PRESS,
        ARKUI_KEY_EVENT_CLICK,
    };

    int count = PARAM_0;
    for (auto type : keyTypes) {
        ArkUIKeyEvent_ keyEvent{.type = static_cast<int32_t>(type)};
        ArkUI_UIInputEvent_ event = {
            .inputType = ARKUI_UIINPUTEVENT_TYPE_KEY,
            .eventTypeId = C_KEY_EVENT_ID,
            .inputEvent = &keyEvent,
            .isCloned = false,
            .apiVersion = PARAM_0,
        };
        const ArkUI_UIInputEvent *eventPtr = reinterpret_cast<const ArkUI_UIInputEvent *>(&event);
        auto result = OH_ArkUI_KeyEvent_GetType(eventPtr);
        ASSERT_EQ(result, type);
        count++;
    }
    NAPI_END;
}

static napi_value Enum_OH_ArkUI_KeyEvent_GetKeyIntensionCode(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    std::vector<ArkUI_KeyIntension> intensions = {
            ARKUI_KEY_INTENSION_UNKNOWN,
            ARKUI_KEY_INTENSION_UP,
            ARKUI_KEY_INTENSION_DOWN,
            ARKUI_KEY_INTENSION_LEFT,
            ARKUI_KEY_INTENSION_RIGHT,
            ARKUI_KEY_INTENSION_SELECT,
            ARKUI_KEY_INTENSION_ESCAPE,
            ARKUI_KEY_INTENSION_BACK,
            ARKUI_KEY_INTENSION_FORWARD,
            ARKUI_KEY_INTENSION_MENU,
            ARKUI_KEY_INTENSION_HOME,
            ARKUI_KEY_INTENSION_PAGE_UP,
            ARKUI_KEY_INTENSION_PAGE_DOWN,
            ARKUI_KEY_INTENSION_ZOOM_OUT,
            ARKUI_KEY_INTENSION_ZOOM_IN,
            ARKUI_KEY_INTENTION_MEDIA_PLAY_PAUSE,
            ARKUI_KEY_INTENTION_MEDIA_FAST_FORWARD,
            ARKUI_KEY_INTENTION_MEDIA_FAST_PLAYBACK,
            ARKUI_KEY_INTENTION_MEDIA_NEXT,
            ARKUI_KEY_INTENTION_MEDIA_PREVIOUS,
            ARKUI_KEY_INTENTION_MEDIA_MUTE,
            ARKUI_KEY_INTENTION_VOLUME_UP,
            ARKUI_KEY_INTENTION_VOLUME_DOWN,
            ARKUI_KEY_INTENTION_CALL,
            ARKUI_KEY_INTENTION_CAMERA
    };
    int count = PARAM_0;
    for (auto intention : intensions) {
        ArkUIKeyEvent_ keyEvent { .intentionCode = static_cast<int32_t>(intention) };
        ArkUI_UIInputEvent_ event = {
            .inputType = ARKUI_UIINPUTEVENT_TYPE_KEY,
            .eventTypeId = C_KEY_EVENT_ID,
            .inputEvent = &keyEvent,
            .isCloned = false,
            .apiVersion = PARAM_0,
        };
        const ArkUI_UIInputEvent *eventPtr = reinterpret_cast<const ArkUI_UIInputEvent *>(&event);
        auto result = OH_ArkUI_KeyEvent_GetKeyIntensionCode(eventPtr);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetKeyIntensionCode", "result:%{public}d", result);
        ASSERT_EQ(result, intention);
        count++;
    }
    NAPI_END;
}

static napi_value Enum_OH_ArkUI_DragEvent_StartDataLoading(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    char key[] = "";
    unsigned int keyLen = 0;
    int32_t ret = OH_ArkUI_DragEvent_StartDataLoading(nullptr, nullptr, key, keyLen);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

} // namespace ArkUICapiTest