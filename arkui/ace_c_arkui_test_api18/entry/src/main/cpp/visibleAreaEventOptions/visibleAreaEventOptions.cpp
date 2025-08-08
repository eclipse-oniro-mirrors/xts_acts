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

#include "visibleAreaEventOptions.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>

namespace ArkUICapiTest {

napi_value VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_a(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "GetContext env or info is null");
        return nullptr;
    }

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *options = OH_ArkUI_VisibleAreaEventOptions_Create();
    int creatFlag = 0;
    if(options == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "options creat failed");
        creatFlag = 1;
    }
    ASSERT_EQ(creatFlag, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "options creat success");
    OH_ArkUI_VisibleAreaEventOptions_Dispose(options);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "options Dispose success");
    NAPI_END;
}


napi_value VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_b(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b", "GetContext env or info is null");
        return nullptr;
    }

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *options = OH_ArkUI_VisibleAreaEventOptions_Create();
    float *ratiosArray = new float[12];
    ratiosArray[0] = 0.1;
    ratiosArray[1] = 0.2;
    ratiosArray[2] = 0.3;
    ratiosArray[3] = 0.4;
    ratiosArray[4] = 0.5;
    ratiosArray[5] = 0.6;
    int disFlag = 0;
    int r1 = OH_ArkUI_VisibleAreaEventOptions_SetRatios(options, ratiosArray, 12);
    if(r1 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b","ret ARKUI_ERROR_CODE_NO_ERROR");
    else if(r1 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b","ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    ASSERT_EQ(r1, ARKUI_ERROR_CODE_NO_ERROR);
    int r2 = OH_ArkUI_VisibleAreaEventOptions_SetExpectedUpdateInterval(options, 1);
    if(r2 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b","ret ARKUI_ERROR_CODE_NO_ERROR");
    else if(r2 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b","ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    ASSERT_EQ(r2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}


napi_value VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_c(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c", "GetContext env or info is null");
        return nullptr;
    }

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *options = OH_ArkUI_VisibleAreaEventOptions_Create();
    float *ratiosArray = new float[12];
    ratiosArray[0] = 0.1;
    ratiosArray[1] = 0.2;
    ratiosArray[2] = 0.3;
    ratiosArray[3] = 0.4;
    ratiosArray[4] = 0.5;
    ratiosArray[5] = 0.6;
    int disFlag = 0;
    int r1 = OH_ArkUI_VisibleAreaEventOptions_SetRatios(options, ratiosArray, 12);
    if(r1 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c","ret ARKUI_ERROR_CODE_NO_ERROR");
    else if(r1 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c","ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    float *getRatiosArray = new float[12];
    int size = 12;
    int r2 = OH_ArkUI_VisibleAreaEventOptions_GetRatios(options, getRatiosArray, &size);
    if(r2 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c","get ret ARKUI_ERROR_CODE_NO_ERROR");
    else if(r2 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c","get ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    else if(r2 == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR)
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c","get ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    ASSERT_EQ(r2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
napi_value VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_d(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d", "GetContext env or info is null");
        return nullptr;
    }

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *options = OH_ArkUI_VisibleAreaEventOptions_Create();
    float *ratiosArray = new float[12];
    ratiosArray[0] = 0.1;
    ratiosArray[1] = 0.2;
    ratiosArray[2] = 0.3;
    ratiosArray[3] = 0.4;
    ratiosArray[4] = 0.5;
    ratiosArray[5] = 0.6;
    int disFlag = 0;
    int r1 = OH_ArkUI_VisibleAreaEventOptions_SetRatios(options, ratiosArray, 12);
    if(r1 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d","r1 ARKUI_ERROR_CODE_NO_ERROR");
    else if(r1 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d","r1 ARKUI_ERROR_CODE_PARAM_INVALID ");
    int r2 = OH_ArkUI_VisibleAreaEventOptions_SetExpectedUpdateInterval(options, 520);
    if(r2 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d","r2 ARKUI_ERROR_CODE_NO_ERROR");
    else if(r2 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d","r2 ARKUI_ERROR_CODE_PARAM_INVALID ");
    int r3 = OH_ArkUI_VisibleAreaEventOptions_GetExpectedUpdateInterval(options);
    ASSERT_EQ(r3, 520);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d","get Interval success");
    NAPI_END;
}
} // namespace ArkUICapiTest