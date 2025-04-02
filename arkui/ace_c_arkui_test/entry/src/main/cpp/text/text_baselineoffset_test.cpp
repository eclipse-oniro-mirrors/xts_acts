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
/*
 * @tc.number     : SUB_ARKUI_CAPI_TEXT_BASELINEOFFSET_0100
 * @tc.name       : testTextBaselineOffset001
 * @tc.desc       : testing baselineOffset for text with normal value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 1
 */
static napi_value TestTextBaselineOffset001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float baselineOffsetValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = baselineOffsetValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_BASELINE_OFFSET, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_BASELINE_OFFSET)->value[PARAM_0].f32, baselineOffsetValue);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

/*
 * @tc.number     : SUB_ARKUI_CAPI_TEXT_BASELINEOFFSET_0200
 * @tc.name       : testTextBaselineOffset002
 * @tc.desc       : testing baselineOffset for text with normal value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 1
 */
static napi_value TestTextBaselineOffset002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float baselineOffsetValue = -20;
    ArkUI_NumberValue value[] = {{.f32 = baselineOffsetValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_BASELINE_OFFSET, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_BASELINE_OFFSET)->value[PARAM_0].f32, baselineOffsetValue);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

/*
 * @tc.number     : SUB_ARKUI_CAPI_TEXT_BASELINEOFFSET_0300
 * @tc.name       : testTextBaselineOffset003
 * @tc.desc       : testing baselineOffset for text with large value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 1
 */
static napi_value TestTextBaselineOffset003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t largeValue = 100;
    ArkUI_NumberValue value[] = {{.i32 = largeValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_BASELINE_OFFSET, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_TEXT_BASELINE_OFFSET) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_TEXT_BASELINE_OFFSET)->value[PARAM_0].f32, largeValue);
    }

    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest
