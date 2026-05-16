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

static napi_value TestCommonAttrsBackgroundImagePosition001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float positionX = PARAM_30;
    float positionY = PARAM_30;
    ArkUI_NumberValue value[] = {{.f32 = positionX}, {.f32 = positionY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_POSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_0].f32, positionX);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_1].f32, positionY);
    NAPI_END;
}


static napi_value TestCommonAttrsBackgroundImagePosition002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float positionX = PARAM_NEGATIVE_30;
    float positionY = PARAM_30;
    ArkUI_NumberValue value[] = {{.f32 = positionX}, {.f32 = positionY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_POSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_0].f32, positionX);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_1].f32, positionY);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePosition003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float positionX = PARAM_30;
    float positionY = PARAM_NEGATIVE_30;
    ArkUI_NumberValue value[] = {{.f32 = positionX}, {.f32 = positionY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_POSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_0].f32, positionX);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_1].f32, positionY);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePosition004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float positionX = PARAM_NEGATIVE_30;
    float positionY = PARAM_NEGATIVE_30;
    ArkUI_NumberValue value[] = {{.f32 = positionX}, {.f32 = positionY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_POSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_0].f32, positionX);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_1].f32, positionY);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePosition005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float positionX = PARAM_150;
    float positionY = PARAM_150;
    ArkUI_NumberValue value[] = {{.f32 = positionX}, {.f32 = positionY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_POSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_0].f32, positionX);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_1].f32, positionY);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePosition006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float positionX = PARAM_300;
    float positionY = PARAM_300;
    ArkUI_NumberValue value[] = {{.f32 = positionX}, {.f32 = positionY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_POSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_0].f32, positionX);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_1].f32, positionY);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePosition007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float positionX = PARAM_0;
    float positionY = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = positionX}, {.f32 = positionY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_POSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_0].f32, positionX);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_1].f32, positionY);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePosition008(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float positionX = PARAM_30;
    float positionY = PARAM_300;
    ArkUI_NumberValue value[] = {{.f32 = positionX}, {.f32 = positionY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_POSITION, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_BACKGROUND_IMAGE_POSITION);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_POSITION)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

} // namespace ArkUICapiTest
