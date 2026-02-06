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
#define X 100
#define Y 100
static napi_value TestCustomComponentLayoutPosition001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t ret = nodeAPI->setLayoutPosition(nullptr, 0, 0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value TestCustomComponentLayoutPosition002(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t ret = nodeAPI->setLayoutPosition(swiper, X, Y);
    ASSERT_EQ(ret, SUCCESS);
    ArkUI_IntOffset offset = nodeAPI->getLayoutPosition(swiper);
    ASSERT_EQ(offset.x, X);
    ASSERT_EQ(offset.y, Y);
    NAPI_END;
}
} // namespace ArkUICapiTest