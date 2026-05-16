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

#include "component/RefreshComponent.h"
#include "RefreshAttrsTest.h"

namespace ArkUICapiTest {
napi_value TestPullUpToCancelRefresh01(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto refresh = nodeAPI->createNode(ARKUI_NODE_REFRESH);
    ArkUI_NumberValue mode[] = { { .i32 = false  } };
    ArkUI_AttributeItem modeItem = { mode,
        sizeof(mode) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_UP_TO_CANCEL_REFRESH, &modeItem);
    auto ret1 = nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_UP_TO_CANCEL_REFRESH)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, false);
    NAPI_END;
}

napi_value TestPullUpToCancelRefresh02(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto refresh = nodeAPI->createNode(ARKUI_NODE_REFRESH);
    ArkUI_NumberValue mode[] = { { .i32 = true  } };
    ArkUI_AttributeItem modeItem = { mode,
        sizeof(mode) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_UP_TO_CANCEL_REFRESH, &modeItem);
    auto ret1 = nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_UP_TO_CANCEL_REFRESH)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, true);
    NAPI_END;
}

napi_value TestPullUpToCancelRefreshError(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = nodeAPI->createNode(ARKUI_NODE_REFRESH);
    ArkUI_NumberValue mode[] = { { .i32 = PARAM_NEGATIVE_1  } };
    ArkUI_AttributeItem modeItem = { mode,
        sizeof(mode) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(grid, NODE_REFRESH_PULL_UP_TO_CANCEL_REFRESH, &modeItem);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_REFRESH_PULL_UP_TO_CANCEL_REFRESH)->value[PARAM_0].i32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, true);
    NAPI_END;
}
} // namespace ArkUICapiTest