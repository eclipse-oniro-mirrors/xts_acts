/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include "../manager/plugin_manager.h"
#include "custom_property_test.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

static int NUMBER_2 = 2;
static int NUMBER_1006 = 1006;

namespace ArkUICapiTest {

void CustomPropertyTest::testGetCustomProperty001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    OH_ArkUI_NodeUtils_AddCustomProperty(column, "CustomValueA", "aaa");
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);

    ArkUI_CustomProperty* customP;
    auto result = OH_ArkUI_NodeUtils_GetCustomProperty(column, "CustomValueA", &customP);
    if (result == ARKUI_ERROR_CODE_NO_ERROR) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceive2(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
            
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        auto parent =  OH_ArkUI_NodeUtils_GetParentInPageTree(pageNode);
        if (OH_ArkUI_NodeUtils_GetNodeType(parent) == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void CustomPropertyTest::testGetParentInPageTree002(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    
    ArkUI_NodeHandle text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive2);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceive3(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        ArkUI_ActiveChildrenInfo* activeChildrenInfo;
        if (OH_ArkUI_NodeUtils_GetActiveChildrenInfo(pageNode, &activeChildrenInfo) == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void CustomPropertyTest::testGetActiveChildrenInfo003(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    
    nodeAPI->addChild(column, text);
    
    ArkUI_NodeHandle text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive3);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceive4(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        if (OH_ArkUI_NodeUtils_GetNodeType(pageNode) == NUMBER_1006) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void CustomPropertyTest::testGetCurrentPageRootNode004(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    ArkUI_NodeHandle text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive4);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void CustomPropertyTest::testIsCreatedByNDK005(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    OH_ArkUI_NodeUtils_AddCustomProperty(column, "CustomValueA", "aaa");

    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);

    bool isCapi = OH_ArkUI_NodeUtils_IsCreatedByNDK(column);
    if (isCapi) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void CustomPropertyTest::testGetNodeType006(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    OH_ArkUI_NodeUtils_AddCustomProperty(column, "CustomValueA", "aaa");
    
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    
    if (OH_ArkUI_NodeUtils_GetNodeType(text) == 1) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void CustomPropertyTest::testCustomPropertyDestroy007(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    OH_ArkUI_NodeUtils_AddCustomProperty(column, "CustomValueA", "aaa");
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    ArkUI_CustomProperty* customP;
    OH_ArkUI_NodeUtils_GetCustomProperty(column, "CustomValueA", &customP);

    auto result = OH_ArkUI_CustomProperty_GetStringValue(customP);
    if (strcmp(result, "aaa") == 0) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    OH_ArkUI_CustomProperty_Destroy(customP);
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void CustomPropertyTest::testCustomPropertyGetStringValue008(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    OH_ArkUI_NodeUtils_AddCustomProperty(column, "CustomValueA", "aaa");
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    ArkUI_CustomProperty* customP;
    OH_ArkUI_NodeUtils_GetCustomProperty(column, "CustomValueA", &customP);

    auto result = OH_ArkUI_CustomProperty_GetStringValue(customP);
    if (strcmp(result, "aaa") == 0) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item);
    }

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceive9(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        ArkUI_ActiveChildrenInfo* activeChildrenInfo;
        if (OH_ArkUI_NodeUtils_GetActiveChildrenInfo(pageNode, &activeChildrenInfo) == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
        OH_ArkUI_ActiveChildrenInfo_Destroy(activeChildrenInfo);
    }
}

void CustomPropertyTest::testActiveChildrenInfoDestroy009(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    auto text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive9);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceive10(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        ArkUI_ActiveChildrenInfo* activeChildrenInfo;
        OH_ArkUI_NodeUtils_GetActiveChildrenInfo(pageNode, &activeChildrenInfo);
        auto firstChild = OH_ArkUI_ActiveChildrenInfo_GetNodeByIndex(activeChildrenInfo, 1000);
        if (OH_ArkUI_NodeUtils_GetNodeType(firstChild) == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void CustomPropertyTest::testActiveChildrenInfoGetNodeByIndex010(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    auto text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive10);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceive11(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        ArkUI_ActiveChildrenInfo* activeChildrenInfo;
        OH_ArkUI_NodeUtils_GetActiveChildrenInfo(pageNode, &activeChildrenInfo);
        
        if (OH_ArkUI_ActiveChildrenInfo_GetCount(activeChildrenInfo) == NUMBER_2) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void CustomPropertyTest::testActiveChildrenInfoGetCount011(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    auto text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive10);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

} // namespace ArkUICapiTest