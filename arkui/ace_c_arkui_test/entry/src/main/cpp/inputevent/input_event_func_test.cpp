/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <arkui/ui_input_event.h>
#include <cstdint>
#include <string>

#include "../manager/plugin_manager.h"
#include "button_component.h"
#include "column_component.h"
#include "common/common.h"
#include "input_event_test.h"
#include "row_component.h"
#include "text_component.h"

namespace ArkUICapiTest {
static napi_value TestInputEvent121(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_UIInputEvent_GetType(nullptr);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}
static napi_value TestInputEvent122(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_UIInputEvent_GetAction(nullptr);
    ASSERT_EQ(ret, NULLPTR_ERROR);
    NAPI_END;
}

static napi_value TestInputEvent123(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_UIInputEvent_GetSourceType(nullptr);
    ASSERT_EQ(ret, 0); // UI_INPUT_EVENT_SOURCE_TYPE_UNKNOWN
    NAPI_END;
}

static napi_value TestInputEvent124(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_UIInputEvent_GetToolType(nullptr);
    ASSERT_EQ(ret, 0); // UI_INPUT_EVENT_TOOL_TYPE_UNKNOWN
    NAPI_END;
}
static napi_value TestInputEvent125(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_UIInputEvent_GetEventTime(nullptr);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}

static napi_value TestInputEvent126(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetPointerCount(nullptr);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}

static napi_value TestInputEvent127(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetPointerId(nullptr, 0);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}

static napi_value TestInputEvent128(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetX(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent129(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetXByIndex(nullptr, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent130(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetY(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent131(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetYByIndex(nullptr, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent132(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetWindowX(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent133(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetWindowXByIndex(nullptr, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent134(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetWindowY(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent135(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetWindowYByIndex(nullptr, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent136(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetDisplayX(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent137(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetDisplayXByIndex(nullptr, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent138(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetDisplayY(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent139(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetDisplayYByIndex(nullptr, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent140(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetPressure(nullptr, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent141(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetTiltX(nullptr, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent142(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetTiltY(nullptr, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent143(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetTouchAreaWidth(nullptr, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent144(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetTouchAreaHeight(nullptr, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}
static napi_value TestInputEvent145(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistorySize(nullptr);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}

static napi_value TestInputEvent146(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryEventTime(nullptr, 0);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}

static napi_value TestInputEvent147(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryPointerCount(nullptr, 0);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}

static napi_value TestInputEvent148(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryPointerId(nullptr, 0, 0);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}

static napi_value TestInputEvent149(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryX(nullptr, 0, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent150(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryY(nullptr, 0, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent151(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryWindowX(nullptr, 0, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent152(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryWindowY(nullptr, 0, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent153(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryDisplayX(nullptr, 0, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent154(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryDisplayY(nullptr, 0, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent155(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryPressure(nullptr, 0, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent156(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryTiltX(nullptr, 0, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent157(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryTiltY(nullptr, 0, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent158(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth(nullptr, 0, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent159(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight(nullptr, 0, 0);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestInputEvent160(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AxisEvent_GetVerticalAxisValue(nullptr);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}

static napi_value TestInputEvent161(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AxisEvent_GetHorizontalAxisValue(nullptr);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}

static napi_value TestInputEvent162(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AxisEvent_GetPinchAxisScaleValue(nullptr);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}

static napi_value TestInputEvent163(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_SetInterceptHitTestMode(nullptr, HitTestMode::HTM_DEFAULT);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestInputEvent164(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_MouseEvent_GetMouseButton(nullptr);
    ASSERT_EQ(ret, NULLPTR_ERROR);
    NAPI_END;
}
static napi_value TestInputEvent165(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_MouseEvent_GetMouseAction(nullptr);
    ASSERT_EQ(ret, NULLPTR_ERROR);
    NAPI_END;
}
} // namespace ArkUICapiTest
