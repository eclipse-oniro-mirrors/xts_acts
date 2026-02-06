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

static ani_double TestCommonAttrsRenderFit001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_CENTER;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit002(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_TOP;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit003(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_BOTTOM;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit004(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_LEFT;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit005(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_RIGHT;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit006(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_TOP_LEFT;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit007(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_TOP_RIGHT;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit008(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_BOTTOM_LEFT;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit009(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_BOTTOM_RIGHT;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit010(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_RESIZE_FILL;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit011(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_RESIZE_CONTAIN;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit012(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_RESIZE_CONTAIN_TOP_LEFT;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit013(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_RESIZE_CONTAIN_BOTTOM_RIGHT;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit014(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_RESIZE_COVER;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit015(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_RESIZE_COVER_TOP_LEFT;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit016(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_RESIZE_COVER_BOTTOM_RIGHT;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_FIT)->value[PARAM_0].i32, renderfit);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit017(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = PARAM_17;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit018(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderFit019(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderfit = ARKUI_RENDER_FIT_RESIZE_COVER_BOTTOM_RIGHT;
    ArkUI_NumberValue value[] = {{.i32 = renderfit}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_RENDER_FIT, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_RENDER_FIT);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUIAniTest
