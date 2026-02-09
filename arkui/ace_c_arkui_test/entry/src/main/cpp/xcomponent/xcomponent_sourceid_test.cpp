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
#define STR_OVERLENGTH "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"\
                       "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"
#define STR_NULL ""

namespace ArkUICapiTest {

static napi_value TestXComponentSourceId001(napi_env env, napi_callback_info info)
{
    NAPI_START(xComponent, ARKUI_NODE_XCOMPONENT);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "xComponentKey";
    auto ret = nodeAPI->setAttribute(xComponent, NODE_XCOMPONENT_ID, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(xComponent, NODE_XCOMPONENT_ID)->string, "xComponentKey");
    NAPI_END;
}

static napi_value TestXComponentSourceId002(napi_env env, napi_callback_info info)
{
    NAPI_START(xComponent, ARKUI_NODE_XCOMPONENT);
    ArkUI_AttributeItem value_item = {};
    value_item.string = STR_OVERLENGTH;
    auto ret = nodeAPI->setAttribute(xComponent, NODE_XCOMPONENT_ID, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(xComponent, NODE_XCOMPONENT_ID)->string, STR_OVERLENGTH);
    NAPI_END;
}

static napi_value TestXComponentSourceId003(napi_env env, napi_callback_info info)
{
    NAPI_START(xComponent, ARKUI_NODE_XCOMPONENT);
    ArkUI_AttributeItem value_item = {};
    value_item.string = STR_NULL;
    auto ret = nodeAPI->setAttribute(xComponent, NODE_XCOMPONENT_ID, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(xComponent, NODE_XCOMPONENT_ID)->string, STR_NULL);
    NAPI_END;
}

static napi_value TestXComponentSourceId004(napi_env env, napi_callback_info info)
{
    NAPI_START(xComponent, ARKUI_NODE_XCOMPONENT);
    ArkUI_AttributeItem value_item = {};
    value_item.string = nullptr;
    auto ret = nodeAPI->setAttribute(xComponent, NODE_XCOMPONENT_ID, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUICapiTest
