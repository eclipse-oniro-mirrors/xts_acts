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

static napi_value TestToggleSwitch001(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    float width = 36;
    float height = 20;
    float topBottomMargin = 6;
    float leftRightMargin = 14;
    if (nodeAPI->getAttribute(toggle, NODE_WIDTH) != nullptr && nodeAPI->getAttribute(toggle, NODE_HEIGHT) != nullptr &&
        nodeAPI->getAttribute(toggle, NODE_MARGIN) != nullptr &&
        nodeAPI->getAttribute(toggle, NODE_MARGIN)->value != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_WIDTH)->value[PARAM_0].f32, width);
        ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_HEIGHT)->value[PARAM_0].f32, height);
        ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_0].f32, topBottomMargin);
        ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_1].f32, leftRightMargin);
        ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_2].f32, topBottomMargin);
        ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_3].f32, leftRightMargin);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
