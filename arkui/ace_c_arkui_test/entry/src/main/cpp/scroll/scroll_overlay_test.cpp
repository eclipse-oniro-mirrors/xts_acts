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

#define SUCCESS 0
#define ABNORMAL_PARAM 1000
#define OFFSET 10

namespace ArkUICapiTest {

static napi_value TestScrollOverlay001(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_TOP_START}, {.f32 = OFFSET}, {.f32 = OFFSET}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "ScrollOverLayTest";
    auto ret = nodeAPI->setAttribute(scroll, NODE_OVERLAY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP_START);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_2].f32, OFFSET);
    NAPI_END;
}

static napi_value TestScrollOverlay002(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_TOP}, {.f32 = OFFSET}, {.f32 = OFFSET}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "ScrollOverLayTest";
    auto ret = nodeAPI->setAttribute(scroll, NODE_OVERLAY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_2].f32, OFFSET);
    NAPI_END;
}

static napi_value TestScrollOverlay003(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_TOP_END}, {.f32 = OFFSET}, {.f32 = OFFSET}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "ScrollOverLayTest";
    auto ret = nodeAPI->setAttribute(scroll, NODE_OVERLAY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP_END);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_2].f32, OFFSET);
    NAPI_END;
}

static napi_value TestScrollOverlay004(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_START}, {.f32 = OFFSET}, {.f32 = OFFSET}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "ScrollOverLayTest";
    auto ret = nodeAPI->setAttribute(scroll, NODE_OVERLAY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_START);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_2].f32, OFFSET);
    NAPI_END;
}

static napi_value TestScrollOverlay005(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_CENTER}, {.f32 = OFFSET}, {.f32 = OFFSET}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "ScrollOverLayTest";
    auto ret = nodeAPI->setAttribute(scroll, NODE_OVERLAY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_CENTER);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_2].f32, OFFSET);
    NAPI_END;
}

static napi_value TestScrollOverlay006(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_END}, {.f32 = OFFSET}, {.f32 = OFFSET}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "ScrollOverLayTest";
    auto ret = nodeAPI->setAttribute(scroll, NODE_OVERLAY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_END);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_2].f32, OFFSET);
    NAPI_END;
}

static napi_value TestScrollOverlay007(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM_START}, {.f32 = OFFSET}, {.f32 = OFFSET}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "ScrollOverLayTest";
    auto ret = nodeAPI->setAttribute(scroll, NODE_OVERLAY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM_START);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_2].f32, OFFSET);
    NAPI_END;
}

static napi_value TestScrollOverlay008(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM}, {.f32 = OFFSET}, {.f32 = OFFSET}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "ScrollOverLayTest";
    auto ret = nodeAPI->setAttribute(scroll, NODE_OVERLAY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_2].f32, OFFSET);
    NAPI_END;
}

static napi_value TestScrollOverlay009(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM_END}, {.f32 = OFFSET}, {.f32 = OFFSET}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "ScrollOverLayTest";
    auto ret = nodeAPI->setAttribute(scroll, NODE_OVERLAY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM_END);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_1].f32, OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OVERLAY)->value[PARAM_2].f32, OFFSET);
    NAPI_END;
}
} // namespace ArkUICapiTest
