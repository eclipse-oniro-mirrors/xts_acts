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

#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestTextInputGetTextContentRect001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_RECT)->value[PARAM_0].f32;
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputGetTextContentRect001 ", "PARAM_0 = %{public}f", tmp);
    tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_RECT)->value[PARAM_1].f32;
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputGetTextContentRect001 ", "PARAM_1 = %{public}f", tmp);
    tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_RECT)->value[PARAM_2].f32;
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputGetTextContentRect001 ", "PARAM_2 = %{public}f", tmp);
    tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_RECT)->value[PARAM_3].f32;
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputGetTextContentRect001 ", "PARAM_3 = %{public}f", tmp);
    NAPI_END;
}
} // namespace ArkUICapiTest