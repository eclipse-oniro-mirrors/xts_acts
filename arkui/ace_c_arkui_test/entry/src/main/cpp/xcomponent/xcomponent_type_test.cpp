/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestXComponentType001(napi_env env, napi_callback_info info)
{
    NAPI_START(xComponent, ARKUI_NODE_XCOMPONENT);
    ASSERT_EQ(nodeAPI->getAttribute(xComponent, NODE_XCOMPONENT_TYPE)->value[PARAM_0].i32,
              ARKUI_XCOMPONENT_TYPE_SURFACE);
    NAPI_END;
}

static napi_value TestXComponentType002(napi_env env, napi_callback_info info)
{
    NAPI_START(xComponent, ARKUI_NODE_XCOMPONENT);
    ArkUI_NumberValue type_value[] = {{.i32 = ARKUI_XCOMPONENT_TYPE_SURFACE}};
    ArkUI_AttributeItem type_item = {type_value, sizeof(type_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xComponent, NODE_XCOMPONENT_TYPE, &type_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(xComponent, NODE_XCOMPONENT_TYPE)->value[PARAM_0].i32,
              ARKUI_XCOMPONENT_TYPE_SURFACE);
    NAPI_END;
}

static napi_value TestXComponentType003(napi_env env, napi_callback_info info)
{
    NAPI_START(xComponent, ARKUI_NODE_XCOMPONENT);
    ArkUI_NumberValue type_value[] = {{.i32 = ARKUI_XCOMPONENT_TYPE_TEXTURE}};
    ArkUI_AttributeItem type_item = {type_value, sizeof(type_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xComponent, NODE_XCOMPONENT_TYPE, &type_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(xComponent, NODE_XCOMPONENT_TYPE)->value[PARAM_0].i32,
              ARKUI_XCOMPONENT_TYPE_TEXTURE);
    NAPI_END;
}

static napi_value TestXComponentType004(napi_env env, napi_callback_info info)
{
    NAPI_START(xComponent, ARKUI_NODE_XCOMPONENT);
    ArkUI_NumberValue type_value[] = {{.i32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem type_item = {type_value, sizeof(type_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(xComponent, NODE_XCOMPONENT_TYPE, &type_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(xComponent, NODE_XCOMPONENT_TYPE)->value[PARAM_0].i32, PARAM_NEGATIVE_1);
    NAPI_END;
}
} // namespace ArkUICapiTest
