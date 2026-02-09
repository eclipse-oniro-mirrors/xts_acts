/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
//
#include "button_label_test.h"
#include <string>
#include <arkui/native_node_napi.h>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

#define STR_NORMAL "label"
#define STR_LONG "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"\
                 "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"
#define STR_NULL ""


namespace ArkUIAniTest {

static ArkUI_NodeHandle CreateChildNodeButtonLabel(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);

    ArkUI_NumberValue widthValue[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem widthItem = {widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &widthItem);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &widthItem);

    return scroll;
}

void ButtonLabelTest::CreateNativeNodeButtonLabel001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeButtonLabel(nodeAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_width_item);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = STR_NORMAL;
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &valueItem);
    ASSERT_EQ_NO_RETURN_VALUE(ret, SUCCESS);
    ASSERT_STREQ_NO_RETURN_VALUE(nodeAPI->getAttribute(button, NODE_BUTTON_LABEL)->string, STR_NORMAL);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "button001";
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, button);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ButtonLabelTest::CreateNativeNodeButtonLabel002(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeButtonLabel(nodeAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_width_item);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = STR_LONG;
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &valueItem);
    ASSERT_EQ_NO_RETURN_VALUE(ret, SUCCESS);
    ASSERT_STREQ_NO_RETURN_VALUE(nodeAPI->getAttribute(button, NODE_BUTTON_LABEL)->string, STR_LONG);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "button002";
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, button);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ButtonLabelTest::CreateNativeNodeButtonLabel003(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeButtonLabel(nodeAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_width_item);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = STR_NULL;
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &valueItem);
    ASSERT_EQ_NO_RETURN_VALUE(ret, SUCCESS);
    ASSERT_STREQ_NO_RETURN_VALUE(nodeAPI->getAttribute(button, NODE_BUTTON_LABEL)->string, STR_NULL);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "button003";
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, button);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ButtonLabelTest::CreateNativeNodeButtonLabel004(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeButtonLabel(nodeAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_width_item);
    ArkUI_AttributeItem valueItem = {};
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &valueItem);
    ASSERT_EQ_NO_RETURN_VALUE(ret, INVALID_PARAM);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "button004";
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, button);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
