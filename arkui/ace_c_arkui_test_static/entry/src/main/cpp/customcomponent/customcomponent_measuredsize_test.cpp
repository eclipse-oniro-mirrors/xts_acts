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
#include "ani/ani.h"

namespace ArkUIAniTest {
#define WIDTH 100
#define HEIGHT 100
static ani_double TestCustomComponentMeasuredSize001(ani_env* env, ani_object info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t ret = nodeAPI->setMeasuredSize(nullptr, 0, 0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static ani_double TestCustomComponentMeasuredSize002(ani_env* env, ani_object info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t ret = nodeAPI->setMeasuredSize(swiper, WIDTH, HEIGHT);
    ASSERT_EQ(ret, SUCCESS);
    ArkUI_IntSize size = nodeAPI->getMeasuredSize(swiper);
    ASSERT_EQ(size.width, WIDTH);
    ASSERT_EQ(size.height, HEIGHT);
    NAPI_END;
}
} // namespace ArkUIAniTest