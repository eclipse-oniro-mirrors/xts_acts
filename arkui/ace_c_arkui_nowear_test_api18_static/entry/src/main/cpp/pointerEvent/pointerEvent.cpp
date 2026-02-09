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

#include "pointerEvent.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>
#include "ani/ani.h"

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>

namespace ArkUICapiTest {

typedef int ArkUI_Bool;
typedef int ArkUI_Int32;
typedef unsigned int ArkUI_Uint32;
typedef long long ArkUI_Int64;
typedef float ArkUI_Float32;
typedef double ArkUI_Float64;
typedef const char* ArkUI_CharPtr;
typedef unsigned long long ArkUI_Uint64;

struct ArkUI_UIInputEvent_ {
    ArkUI_UIInputEvent_Type inputType;
    ArkUI_Int32 eventTypeId;
    void* inputEvent;
    bool isCloned = false;
};

ani_int PointerEventTest::PointerEventTest_a(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointerEventTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    const ArkUI_UIInputEvent *event = NULL;
    ArkUI_InteractionHand *hand = NULL;
    auto ret = OH_ArkUI_PointerEvent_GetInteractionHand(event, hand);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointerEventTest_a","ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

ani_int PointerEventTest::PointerEventTest_a1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointerEventTest_a1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_UIInputEvent_ *event = new ArkUI_UIInputEvent_;
    event->eventTypeId = 2; //C_TOUCH_EVENT_ID
    int hand = 1;
    auto ret = OH_ArkUI_PointerEvent_GetInteractionHand((const ArkUI_UIInputEvent*)event, (ArkUI_InteractionHand*)&hand);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointerEventTest_a1","ret_a1 %{public}d ", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int PointerEventTest::PointerEventTest_b(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointerEventTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    const ArkUI_UIInputEvent *event = NULL;
    ArkUI_InteractionHand *hand = NULL;
    auto ret = OH_ArkUI_PointerEvent_GetInteractionHandByIndex(event, 0, hand);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointerEventTest_b","ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}


ani_int PointerEventTest::PointerEventTest_b1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointerEventTest_b1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_UIInputEvent_ *event = new ArkUI_UIInputEvent_;
    event->eventTypeId = 1; //TOUCH_EVENT_ID
    int hand = 1;
    auto ret = OH_ArkUI_PointerEvent_GetInteractionHandByIndex((const ArkUI_UIInputEvent*)event, 0, (ArkUI_InteractionHand*)&hand);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointerEventTest_b1","ret %{public}d ", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
} // namespace ArkUICapiTest