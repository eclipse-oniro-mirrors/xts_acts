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
#include "node_model.h"
#define ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED 106102
#define ARKUI_ERROR_CODE_NOT_SUPPROTED_FOR_ARKTS_NODE 106103

namespace ArkUICapiTest {

static napi_value TestAttributeSetting001(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);

    int32_t buttonType = ARKUI_BUTTON_TYPE_NORMAL;
    ArkUI_NumberValue  buttonValue[] = {{.i32 =  buttonType}};
    ArkUI_AttributeItem button_item = {buttonValue, sizeof(buttonValue) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_TYPE, &button_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_BUTTON_TYPE)->value[PARAM_0].i32, buttonType);

    NAPI_END;
}

static napi_value TestAttributeSetting002(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);

    int32_t buttonType = ARKUI_BUTTON_TYPE_NORMAL;
    ArkUI_NumberValue  buttonValue[] = {{.i32 =  buttonType}};
    ArkUI_AttributeItem button_item = {buttonValue, sizeof(buttonValue) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_TYPE, &button_item);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_BUTTON_TYPE)->value[PARAM_0].i32, buttonType);
    
    NAPI_END;
}

static napi_value TestAttributeSetting003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);

    ArkUI_NumberValue alignValue[] = {{.i32 = ARKUI_ALIGNMENT_TOP_START}};
    ArkUI_AttributeItem align_value_item = {alignValue, sizeof(alignValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    auto ret = nodeAPI->resetAttribute(stack, NODE_STACK_ALIGN_CONTENT);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_CENTER);
    
    NAPI_END;
}

static napi_value TestAttributeSetting004(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);

    int32_t buttonType = ARKUI_BUTTON_TYPE_NORMAL;
    ArkUI_NumberValue  buttonValue[] = {{.i32 =  buttonType}};
    ArkUI_AttributeItem button_item = {buttonValue, sizeof(buttonValue) / sizeof(ArkUI_NumberValue)};
    button = nullptr;
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_TYPE, &button_item);
    ASSERT_EQ(ret, INVALID_PARAM);

    NAPI_END;
}

static napi_value TestAttributeSetting005(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);

    int32_t buttonType = ARKUI_BUTTON_TYPE_NORMAL;
    ArkUI_NumberValue  buttonValue[] = {{.i32 =  buttonType}};
    ArkUI_AttributeItem button_item = {buttonValue, sizeof(buttonValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_BUTTON_TYPE, &button_item);
    button = nullptr;
    ASSERT_OBJ(nodeAPI->getAttribute(button, NODE_BUTTON_TYPE), nullptr);

    NAPI_END;
}

static napi_value TestAttributeSetting006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);

    ArkUI_NumberValue alignValue[] = {{.i32 = ARKUI_ALIGNMENT_TOP_START}};
    ArkUI_AttributeItem align_value_item = {alignValue, sizeof(alignValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    stack = nullptr;
    auto ret = nodeAPI->resetAttribute(stack, NODE_STACK_ALIGN_CONTENT);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

static napi_value TestAttributeSetting007(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ASSERT_EQ(nodeAPI->setAttribute(span, NODE_WIDTH, nullptr), ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED);

    NAPI_END;
}

static napi_value TestAttributeSetting008(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ASSERT_EQ(nodeAPI->resetAttribute(span, NODE_WIDTH), ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED);
    
    NAPI_END;
}

static napi_value TestAttributeSetting009(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto abnormalNode = new ArkUI_Node({PARAM_NEGATIVE_1, nullptr});
    ASSERT_EQ(nodeAPI->setAttribute(abnormalNode, NODE_WIDTH, nullptr), ARKUI_ERROR_CODE_NOT_SUPPROTED_FOR_ARKTS_NODE);
    
    NAPI_END;
}

static napi_value TestAttributeSetting010(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto abnormalNode = new ArkUI_Node({PARAM_NEGATIVE_1, nullptr, true});
    ASSERT_EQ(nodeAPI->resetAttribute(abnormalNode, NODE_WIDTH), ARKUI_ERROR_CODE_NOT_SUPPROTED_FOR_ARKTS_NODE);
    
    NAPI_END;
}
} // namespace ArkUICapiTest