/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"
#include "../manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <arkui/ui_input_event.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value TestErrorCode001(napi_env env, napi_callback_info info)
{
    ArkUI_TouchTestInfo* touchInfo = nullptr;
    ArkUI_TouchTestInfoItemArray array = nullptr;
    int32_t size = 0;
    if (touchInfo == nullptr) {
        auto error1 = OH_ArkUI_TouchTestInfo_GetTouchTestInfoList(nullptr, &array, &size);
        ASSERT_EQ(error1, ARKUI_ERROR_CODE_PARAM_INVALID);
    } else if (touchInfo != nullptr) {
        auto error2 = OH_ArkUI_TouchTestInfo_GetTouchTestInfoList(touchInfo, &array, &size);
        ASSERT_EQ(error2, ARKUI_ERROR_CODE_NO_ERROR);
    }
    NAPI_END;
}

static napi_value TestErrorCode002(napi_env env, napi_callback_info info)
{
    ArkUI_TouchTestInfoItemArray array = nullptr;
    ArkUI_Rect childRect{};
    if (array == nullptr) {
        auto error3 = OH_ArkUI_TouchTestInfoItem_GetChildRect(nullptr, &childRect);
        ASSERT_EQ(error3, ARKUI_ERROR_CODE_PARAM_INVALID);
    } else if (array != nullptr) {
        auto error4 = OH_ArkUI_TouchTestInfoItem_GetChildRect(array[0], &childRect);
        ASSERT_EQ(error4, ARKUI_ERROR_CODE_NO_ERROR);
    }
    NAPI_END;
}

static napi_value TestErrorCode003(napi_env env, napi_callback_info info)
{
    ArkUI_Rect childRect{};
    ArkUI_TouchTestInfoItemArray array = nullptr;
    char childIdBuffer[256] = {0};
    char childIdBuffer2[1] = {0};
    if (array == nullptr) {
        auto error5 = OH_ArkUI_TouchTestInfoItem_GetChildId(nullptr, childIdBuffer, sizeof(childIdBuffer));
        ASSERT_EQ(error5, ARKUI_ERROR_CODE_PARAM_INVALID);
    } else if (array != nullptr) {
        auto error6 = OH_ArkUI_TouchTestInfoItem_GetChildId(array[0], childIdBuffer, sizeof(childIdBuffer));
        ASSERT_EQ(error6, ARKUI_ERROR_CODE_NO_ERROR);
        auto error7 = OH_ArkUI_TouchTestInfoItem_GetChildId(array[0], childIdBuffer2, sizeof(childIdBuffer2));
        ASSERT_EQ(error7, ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH);
    }
    NAPI_END;
}

static napi_value TestErrorCode004(napi_env env, napi_callback_info info)
{
    ArkUI_TouchTestInfo* touchInfo = nullptr;
    if (touchInfo == nullptr) {
        auto error8 = OH_ArkUI_TouchTestInfo_SetTouchResultId(nullptr, "ColumnTest");
        ASSERT_EQ(error8, ARKUI_ERROR_CODE_PARAM_INVALID);
    } else if (touchInfo != nullptr) {
        auto error9 = OH_ArkUI_TouchTestInfo_SetTouchResultId(touchInfo, "ColumnTest");
        ASSERT_EQ(error9, ARKUI_ERROR_CODE_NO_ERROR);
    }
    NAPI_END;
}

static napi_value TestErrorCode005(napi_env env, napi_callback_info info)
{
    ArkUI_TouchTestInfo* touchInfo = nullptr;
    if (touchInfo == nullptr) {
        auto error10 = OH_ArkUI_TouchTestInfo_SetTouchResultStrategy(nullptr, ARKUI_TOUCH_TEST_STRATEGY_DEFAULT);
        ASSERT_EQ(error10, ARKUI_ERROR_CODE_PARAM_INVALID);
    } else if (touchInfo != nullptr) {
        auto error11 = OH_ArkUI_TouchTestInfo_SetTouchResultStrategy(touchInfo, ARKUI_TOUCH_TEST_STRATEGY_DEFAULT);
        ASSERT_EQ(error11, ARKUI_ERROR_CODE_NO_ERROR);
    }
    NAPI_END;
}
} // namespace ArkUICapiTest