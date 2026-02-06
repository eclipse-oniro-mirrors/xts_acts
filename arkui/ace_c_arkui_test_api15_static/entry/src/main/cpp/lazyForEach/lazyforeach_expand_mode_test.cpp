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

#include <cstdint>
#include <random>
#include <sound/hdsp.h>
#include <string>
#include <cstdio>
#include "../manager/plugin_manager.h"
#include "lazyforeach_expand_mode_test.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <hilog/log.h>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

static int NUMBER_0 = 0;
static int NUMBER_1 = 1;
static int NUMBER_2 = 2;
static int NUMBER_3 = 3;
static int NUMBER_4 = 4;
static int NUMBER_5 = 5;
static int NUMBER_6 = 6;
static int NUMBER_7 = 7;
static int NUMBER_8 = 8;
static int NUMBER_9 = 9;
static int NUMBER_10 = 10;
static int NUMBER_11 = 11;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

namespace ArkUIAniTest {
static ArkUI_NodeHandle CreateChildNode1(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建button
    ArkUI_NumberValue text_height[] = {20};
    ArkUI_AttributeItem text_item1 = {text_height, sizeof(text_height) / sizeof(ArkUI_NumberValue)};
    
    ArkUI_NodeHandle bt9 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt9_item = {.string = "No error"};
    nodeAPI->setAttribute(bt9, NODE_HEIGHT, &text_item1);
    nodeAPI->setAttribute(bt9, NODE_BUTTON_LABEL, &bt9_item);
    ArkUI_AttributeItem bt9_id = {.string = "button_id9"};
    nodeAPI->setAttribute(bt9, NODE_ID, &bt9_id);
    nodeAPI->registerNodeEvent(bt9, NODE_ON_CLICK, NUMBER_9, nullptr);
    
    ArkUI_NodeHandle bt10 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt10_item = {.string = "Invalid"};
    nodeAPI->setAttribute(bt10, NODE_HEIGHT, &text_item1);
    nodeAPI->setAttribute(bt10, NODE_BUTTON_LABEL, &bt10_item);
    ArkUI_AttributeItem bt10_id = {.string = "button_id10"};
    nodeAPI->setAttribute(bt10, NODE_ID, &bt10_id);
    nodeAPI->registerNodeEvent(bt10, NODE_ON_CLICK, NUMBER_10, nullptr);
    
    nodeAPI->addChild(column, bt9);
    nodeAPI->addChild(column, bt10);
    return column;
}

static ArkUI_NodeHandle CreateChildNode2(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建button
    ArkUI_NumberValue text_height[] = {20};
    ArkUI_AttributeItem text_item1 = {text_height, sizeof(text_height) / sizeof(ArkUI_NumberValue)};
    
    ArkUI_NodeHandle bt1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt1_item = {.string = "GetChildAt"};
    nodeAPI->setAttribute(bt1, NODE_BUTTON_LABEL, &bt1_item);
    nodeAPI->setAttribute(bt1, NODE_HEIGHT, &text_item1);
    ArkUI_AttributeItem bt1_id = {.string = "button_id1"};
    nodeAPI->setAttribute(bt1, NODE_ID, &bt1_id);
    nodeAPI->registerNodeEvent(bt1, NODE_ON_CLICK, NUMBER_1, nullptr);
    nodeAPI->addChild(column, bt1);
    
    return column;
}

static ArkUI_NodeHandle CreateChildNode3(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建button
    ArkUI_NumberValue text_height[] = {20};
    ArkUI_AttributeItem text_item1 = {text_height, sizeof(text_height) / sizeof(ArkUI_NumberValue)};
    
    ArkUI_NodeHandle bt2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt2_item = {.string = "EXPAND"};
    nodeAPI->setAttribute(bt2, NODE_BUTTON_LABEL, &bt2_item);
    nodeAPI->setAttribute(bt2, NODE_HEIGHT, &text_item1);
    ArkUI_AttributeItem bt2_id = {.string = "button_id2"};
    nodeAPI->setAttribute(bt2, NODE_ID, &bt2_id);
    nodeAPI->registerNodeEvent(bt2, NODE_ON_CLICK, NUMBER_2, nullptr);
    nodeAPI->addChild(column, bt2);
    return column;
}

static ArkUI_NodeHandle CreateChildNode4(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建button
    ArkUI_NumberValue text_height[] = {20};
    ArkUI_AttributeItem text_item1 = {text_height, sizeof(text_height) / sizeof(ArkUI_NumberValue)};
  
    ArkUI_NodeHandle bt3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt3_item = {.string = "NOT_EXPAND"};
    nodeAPI->setAttribute(bt3, NODE_BUTTON_LABEL, &bt3_item);
    nodeAPI->setAttribute(bt3, NODE_HEIGHT, &text_item1);
    ArkUI_AttributeItem bt3_id = {.string = "button_id3"};
    nodeAPI->setAttribute(bt3, NODE_ID, &bt3_id);
    nodeAPI->registerNodeEvent(bt3, NODE_ON_CLICK, NUMBER_3, nullptr);
    nodeAPI->addChild(column, bt3);
    return column;
}

static ArkUI_NodeHandle CreateChildNode5(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建button
    ArkUI_NumberValue text_height[] = {20};
    ArkUI_AttributeItem text_item1 = {text_height, sizeof(text_height) / sizeof(ArkUI_NumberValue)};
    
    ArkUI_NodeHandle bt4 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt4_item = {.string = "LAZY_EXPAND"};
    nodeAPI->setAttribute(bt4, NODE_BUTTON_LABEL, &bt4_item);
    nodeAPI->setAttribute(bt4, NODE_HEIGHT, &text_item1);
    ArkUI_AttributeItem bt4_id = {.string = "button_id4"};
    nodeAPI->setAttribute(bt4, NODE_ID, &bt4_id);
    nodeAPI->registerNodeEvent(bt4, NODE_ON_CLICK, NUMBER_4, nullptr);
    nodeAPI->addChild(column, bt4);
    return column;
}

static ArkUI_NodeHandle CreateChildNode6(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建button
    ArkUI_NumberValue text_height[] = {20};
    ArkUI_AttributeItem text_item1 = {text_height, sizeof(text_height) / sizeof(ArkUI_NumberValue)};
    
    ArkUI_NodeHandle bt5 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt5_item = {.string = "ExpandMode_null"};
    nodeAPI->setAttribute(bt5, NODE_BUTTON_LABEL, &bt5_item);
    nodeAPI->setAttribute(bt5, NODE_HEIGHT, &text_item1);
    ArkUI_AttributeItem bt5_id = {.string = "button_id5"};
    nodeAPI->setAttribute(bt5, NODE_ID, &bt5_id);
    nodeAPI->registerNodeEvent(bt5, NODE_ON_CLICK, NUMBER_5, nullptr);
    nodeAPI->addChild(column, bt5);
    return column;
}

static ArkUI_NodeHandle CreateChildNode7(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建button
    ArkUI_NumberValue text_height[] = {20};
    ArkUI_AttributeItem text_item1 = {text_height, sizeof(text_height) / sizeof(ArkUI_NumberValue)};
    
    ArkUI_NodeHandle bt6 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt6_item = {.string = "ExpandMode_undefined"};
    nodeAPI->setAttribute(bt6, NODE_BUTTON_LABEL, &bt6_item);
    nodeAPI->setAttribute(bt6, NODE_HEIGHT, &text_item1);
    ArkUI_AttributeItem bt6_id = {.string = "button_id6"};
    nodeAPI->setAttribute(bt6, NODE_ID, &bt6_id);
    nodeAPI->registerNodeEvent(bt6, NODE_ON_CLICK, NUMBER_6, nullptr);
    nodeAPI->addChild(column, bt6);
    return column;
}

static ArkUI_NodeHandle CreateChildNode8(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建button
    ArkUI_NumberValue text_height[] = {20};
    ArkUI_AttributeItem text_item1 = {text_height, sizeof(text_height) / sizeof(ArkUI_NumberValue)};
    
    ArkUI_NodeHandle bt7 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt7_item = {.string = "Expand Out of bounds"};
    nodeAPI->setAttribute(bt7, NODE_BUTTON_LABEL, &bt7_item);
    nodeAPI->setAttribute(bt7, NODE_HEIGHT, &text_item1);
    ArkUI_AttributeItem bt7_id = {.string = "button_id7"};
    nodeAPI->setAttribute(bt7, NODE_ID, &bt7_id);
    nodeAPI->registerNodeEvent(bt7, NODE_ON_CLICK, NUMBER_7, nullptr);
    nodeAPI->addChild(column, bt7);
    return column;
}

static ArkUI_NodeHandle CreateChildNode9(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建button
    ArkUI_NumberValue text_height[] = {20};
    ArkUI_AttributeItem text_item1 = {text_height, sizeof(text_height) / sizeof(ArkUI_NumberValue)};
    
    ArkUI_NodeHandle bt8 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt8_item = {.string = "NotExpand Out of bounds"};
    nodeAPI->setAttribute(bt8, NODE_BUTTON_LABEL, &bt8_item);
    nodeAPI->setAttribute(bt8, NODE_HEIGHT, &text_item1);
    ArkUI_AttributeItem bt8_id = {.string = "button_id8"};
    nodeAPI->setAttribute(bt8, NODE_ID, &bt8_id);
    nodeAPI->registerNodeEvent(bt8, NODE_ON_CLICK, NUMBER_8, nullptr);
    nodeAPI->addChild(column, bt8);
    return column;
}

static void OnEventReceive1(ArkUI_NodeEvent *event)
{
    auto node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NodeHandle node_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("ListA", &node_ptr);
    uint32_t startIndex = 0;
    uint32_t endIndex = 0;
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_9) {
        auto errorCode1 = OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand(node_ptr, &startIndex);
        auto errorCode2 = OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand(node_ptr, &endIndex);
        ArkUI_NodeHandle subnode_ptr = nullptr;
        auto errorCode3 = OH_ArkUI_NodeUtils_GetChildWithExpandMode(node_ptr, NUMBER_3, &subnode_ptr, ARKUI_EXPAND);
        if (errorCode1 == ARKUI_ERROR_CODE_NO_ERROR &&
            errorCode2 == ARKUI_ERROR_CODE_NO_ERROR &&
            errorCode3 == ARKUI_ERROR_CODE_NO_ERROR) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_10) {
        auto errorCode1 = OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand(nullptr, &startIndex);
        auto errorCode2 = OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand(nullptr, &endIndex);
        ArkUI_NodeHandle subnode_ptr = nullptr;
        auto errorCode3 = OH_ArkUI_NodeUtils_GetChildWithExpandMode(nullptr, NUMBER_3, &subnode_ptr, ARKUI_EXPAND);
        if (errorCode1 == ARKUI_ERROR_CODE_PARAM_INVALID &&
            errorCode2 == ARKUI_ERROR_CODE_PARAM_INVALID &&
            errorCode3 == ARKUI_ERROR_CODE_PARAM_INVALID) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

static void OnEventReceive2(ArkUI_NodeEvent *event)
{
    auto node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NodeHandle node_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("ListA", &node_ptr);
    uint32_t startIndex = 0;
    uint32_t endIndex = 0;
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_1) {
        auto errorCode1 = OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand(node_ptr, &startIndex);
        auto errorCode2 = OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand(node_ptr, &endIndex);
        // 获取子节点  getChildAt只获取页面上显示的节点
        auto child = nodeAPI->getChildAt(node_ptr, NUMBER_3);
        auto getChildValue = nodeAPI->getAttribute(child, NODE_ID)->string;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getFirstChildIndexWithoutExpand1 :%{public}d ", startIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getLastChildIndexWithoutExpand1 :%{public}d ", endIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk getChild :%{public}s ",
                     getChildValue);
        if (startIndex == 0 && endIndex == NUMBER_10 && strcmp(getChildValue, "ListAItem_TTT3") == 0) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_2) {
        auto errorCode1 = OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand(node_ptr, &startIndex);
        auto errorCode2 = OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand(node_ptr, &endIndex);
        ArkUI_NodeHandle subnode_ptr = nullptr;
        OH_ArkUI_NodeUtils_GetChildWithExpandMode(node_ptr, NUMBER_3, &subnode_ptr, ARKUI_EXPAND);
        auto getChildValue = nodeAPI->getAttribute(subnode_ptr, NODE_ID)->string;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getFirstChildIndexWithoutExpand2 :%{public}d ", startIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getLastChildIndexWithoutExpand2 :%{public}d ", endIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk Expand getChild :%{public}s ",
                     getChildValue);
        if (startIndex == 0 && endIndex == NUMBER_3 && strcmp(getChildValue, "ListAItem_TTT3") == 0) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

static void OnEventReceive3(ArkUI_NodeEvent *event)
{
    auto node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NodeHandle node_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("ListA", &node_ptr);
    uint32_t startIndex = 0;
    uint32_t endIndex = 0;
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_3) {
        OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand(node_ptr, &startIndex);
        OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand(node_ptr, &endIndex);
        ArkUI_NodeHandle subnode_ptr = nullptr;
        OH_ArkUI_NodeUtils_GetChildWithExpandMode(node_ptr, NUMBER_3, &subnode_ptr, ARKUI_NOT_EXPAND);
        auto getChildValue = nodeAPI->getAttribute(subnode_ptr, NODE_ID)->string;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getFirstChildIndexWithoutExpand3 :%{public}d ", startIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getLastChildIndexWithoutExpand3 :%{public}d ", endIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk NotExpand getChild :%{public}s ",
                     getChildValue);
        if (startIndex == 0 && endIndex == NUMBER_3 && strcmp(getChildValue, "ListAItem_TTT3") == 0) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_4) {
        OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand(node_ptr, &startIndex);
        OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand(node_ptr, &endIndex);
        ArkUI_NodeHandle subnode_ptr = nullptr;
        OH_ArkUI_NodeUtils_GetChildWithExpandMode(node_ptr, NUMBER_3, &subnode_ptr, ARKUI_LAZY_EXPAND);
        auto getChildValue = nodeAPI->getAttribute(subnode_ptr, NODE_ID)->string;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getFirstChildIndexWithoutExpand4 :%{public}d ", startIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getLastChildIndexWithoutExpand4 :%{public}d ", endIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk LazyExpand getChild :%{public}s ",
                     getChildValue);
        if (startIndex == 0 && endIndex == NUMBER_3 && strcmp(getChildValue, "ListAItem_TTT3") == 0) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

static void OnEventReceive4(ArkUI_NodeEvent *event)
{
    auto node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NodeHandle node_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("ListA", &node_ptr);
    uint32_t startIndex = 0;
    uint32_t endIndex = 0;
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_5) {
        OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand(node_ptr, &startIndex);
        OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand(node_ptr, &endIndex);
        ArkUI_NodeHandle subnode_ptr = nullptr;
        OH_ArkUI_NodeUtils_GetChildWithExpandMode(node_ptr, NUMBER_3, &subnode_ptr, NULL);
        auto getChildValue = nodeAPI->getAttribute(subnode_ptr, NODE_ID)->string;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getFirstChildIndexWithoutExpand5 :%{public}d ", startIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getLastChildIndexWithoutExpand5 :%{public}d ", endIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk Expand_NULL getChild :%{public}s ",
                     getChildValue);
        if (startIndex == 0 && endIndex == NUMBER_3 && strcmp(getChildValue, "ListAItem_TTT3") == 0) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_6) {
        OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand(node_ptr, &startIndex);
        OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand(node_ptr, &endIndex);
        ArkUI_NodeHandle subnode_ptr = nullptr;
        auto ec = OH_ArkUI_NodeUtils_GetChildWithExpandMode(node_ptr, NUMBER_3, &subnode_ptr, Undefined);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getFirstChildIndexWithoutExpand6 :%{public}d ", startIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getLastChildIndexWithoutExpand6 :%{public}d ", endIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk ec :%{public}d ", ec);
        if (startIndex == 0 && endIndex == NUMBER_3 && ec == ARKUI_ERROR_CODE_PARAM_INVALID) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

static void OnEventReceive5(ArkUI_NodeEvent *event)
{
    auto node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NodeHandle node_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("ListA", &node_ptr);
    uint32_t startIndex = 0;
    uint32_t endIndex = 0;
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_7) {
        OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand(node_ptr, &startIndex);
        OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand(node_ptr, &endIndex);
        ArkUI_NodeHandle subnode_ptr = nullptr;
        auto ec = OH_ArkUI_NodeUtils_GetChildWithExpandMode(node_ptr, NUMBER_11, &subnode_ptr, ARKUI_EXPAND);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getFirstChildIndexWithoutExpand7 :%{public}d ", startIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getLastChildIndexWithoutExpand7 :%{public}d ", endIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk ec :%{public}d ", ec);
        if (startIndex == 0 && endIndex == NUMBER_3 && ec == ARKUI_ERROR_CODE_PARAM_INVALID) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_8) {
        OH_ArkUI_NodeUtils_GetFirstChildIndexWithoutExpand(node_ptr, &startIndex);
        OH_ArkUI_NodeUtils_GetLastChildIndexWithoutExpand(node_ptr, &endIndex);
        ArkUI_NodeHandle subnode_ptr = nullptr;
        auto ec = OH_ArkUI_NodeUtils_GetChildWithExpandMode(node_ptr, NUMBER_4, &subnode_ptr, ARKUI_NOT_EXPAND);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getFirstChildIndexWithoutExpand8 :%{public}d ", startIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "kkk getLastChildIndexWithoutExpand8 :%{public}d ", endIndex);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk ec :%{public}d ", ec);
        if (startIndex == 0 && endIndex == NUMBER_3 && ec == ARKUI_ERROR_CODE_PARAM_INVALID) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void LazyForEachExpandModeTest::testLazyForEachExpandMode001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    static ArkUI_NodeHandle root = CreateChildNode1(nodeAPI);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive1);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, root);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void LazyForEachExpandModeTest::testLazyForEachExpandMode002(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    static ArkUI_NodeHandle root = CreateChildNode2(nodeAPI);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive2);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, root);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void LazyForEachExpandModeTest::testLazyForEachExpandMode003(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    static ArkUI_NodeHandle root = CreateChildNode3(nodeAPI);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive2);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, root);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void LazyForEachExpandModeTest::testLazyForEachExpandMode004(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    static ArkUI_NodeHandle root = CreateChildNode4(nodeAPI);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive3);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, root);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void LazyForEachExpandModeTest::testLazyForEachExpandMode005(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    static ArkUI_NodeHandle root = CreateChildNode5(nodeAPI);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive3);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, root);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void LazyForEachExpandModeTest::testLazyForEachExpandMode006(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    static ArkUI_NodeHandle root = CreateChildNode6(nodeAPI);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive4);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, root);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void LazyForEachExpandModeTest::testLazyForEachExpandMode007(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    static ArkUI_NodeHandle root = CreateChildNode7(nodeAPI);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive4);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, root);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void LazyForEachExpandModeTest::testLazyForEachExpandMode008(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    static ArkUI_NodeHandle root = CreateChildNode8(nodeAPI);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive5);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, root);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void LazyForEachExpandModeTest::testLazyForEachExpandMode009(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    static ArkUI_NodeHandle root = CreateChildNode9(nodeAPI);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive5);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, root);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

} // namespace ArkUIAniTest