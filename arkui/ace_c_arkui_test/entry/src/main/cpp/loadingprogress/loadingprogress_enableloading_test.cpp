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

static napi_value TestLoadingProgressEnableLoading001(napi_env env, napi_callback_info info)
{
    NAPI_START(loadingProgress, ARKUI_NODE_LOADING_PROGRESS);
    ArkUI_NumberValue value[] = {{.i32 = true}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(loadingProgress, NODE_LOADING_PROGRESS_ENABLE_LOADING, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(loadingProgress, NODE_LOADING_PROGRESS_ENABLE_LOADING)->value[PARAM_0].i32, true);
    NAPI_END;
}

static napi_value TestLoadingProgressEnableLoading002(napi_env env, napi_callback_info info)
{
    NAPI_START(loadingProgress, ARKUI_NODE_LOADING_PROGRESS);
    ArkUI_NumberValue value[] = {{.i32 = false}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(loadingProgress, NODE_LOADING_PROGRESS_ENABLE_LOADING, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(loadingProgress, NODE_LOADING_PROGRESS_ENABLE_LOADING)->value[PARAM_0].i32, false);
    NAPI_END;
}

static napi_value TestLoadingProgressEnableLoading003(napi_env env, napi_callback_info info)
{
    NAPI_START(loadingProgress, ARKUI_NODE_LOADING_PROGRESS);
    ArkUI_NumberValue value[] = {{.i32 = -1}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(loadingProgress, NODE_LOADING_PROGRESS_ENABLE_LOADING, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
} // namespace ArkUICapiTest
