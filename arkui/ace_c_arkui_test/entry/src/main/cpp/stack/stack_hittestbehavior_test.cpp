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

#include "stack_hittestbehavior_test.h"
#include "../manager/plugin_manager.h"
#include <string>

#define STACK_ON_TOUCH_EVENT_ID 7001
#define STACK_BROTHER_ON_TOUCH_EVENT_ID 7002

namespace ArkUICapiTest {

void StackHitTestBehaviorTest::OnEventReceive(ArkUI_NodeEvent *event)
{
    uint32_t backgroundColor = 0xFF0000FF;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "StackEventOnTouchTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "StackEventOnClickTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == STACK_ON_TOUCH_EVENT_ID) {
        backgroundColor = 0xFF0000FF;
    } else {
        backgroundColor = 0xFF000000;
    }

    if ((eventId == STACK_ON_TOUCH_EVENT_ID) || (eventId == STACK_BROTHER_ON_TOUCH_EVENT_ID)) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = backgroundColor}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

ArkUI_NodeHandle StackHitTestBehaviorTest::CreateSubStackNode(ArkUI_NativeNodeAPI_1 *node_api, int32_t hitTestBehavior,
                                                              const char *onTouchTestStackParent,
                                                              const char *onTouchTestStack,
                                                              const char *onTouchTestStackBrother)
{
    float stackParentWidth = 80;
    float stackParentHeight = 80;
    float stackWidth = 60;
    float stackHeight = 60;
    float stackBrotherWidth = 40;
    float stackBrotherHeight = 40;
    uint32_t stackParentBackgroundColor = 0xFF888888;
    uint32_t stackBackgroundColor = 0xFFFF0000;
    uint32_t stackBrotherBackgroundColor = 0xFF00FF00;

    auto stackParent = node_api->createNode(ARKUI_NODE_STACK);
    auto stack = node_api->createNode(ARKUI_NODE_STACK);
    auto stackBrother = node_api->createNode(ARKUI_NODE_STACK);

    ArkUI_AttributeItem id_item = {};
    id_item.string = onTouchTestStackParent;
    node_api->setAttribute(stackParent, NODE_ID, &id_item);

    ArkUI_NumberValue stack_parent_width_value[] = {{.f32 = stackParentWidth}};
    ArkUI_AttributeItem stack_parent_width_item = {stack_parent_width_value,
                                                   sizeof(stack_parent_width_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stackParent, NODE_WIDTH, &stack_parent_width_item);

    ArkUI_NumberValue stack_parent_height_value[] = {{.f32 = stackParentHeight}};
    ArkUI_AttributeItem stack_parent_height_item = {stack_parent_height_value,
                                                    sizeof(stack_parent_height_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stackParent, NODE_HEIGHT, &stack_parent_height_item);

    ArkUI_NumberValue stack_parent_background_color_value[] = {{.u32 = stackParentBackgroundColor}};
    ArkUI_AttributeItem stack_parent_background_color_item = {
        stack_parent_background_color_value, sizeof(stack_parent_background_color_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stackParent, NODE_BACKGROUND_COLOR, &stack_parent_background_color_item);

    ArkUI_AttributeItem stack_id_item = {};
    stack_id_item.string = onTouchTestStack;
    node_api->setAttribute(stack, NODE_ID, &stack_id_item);

    ArkUI_NumberValue stack_width_value[] = {{.f32 = stackWidth}};
    ArkUI_AttributeItem stack_width_item = {stack_width_value, sizeof(stack_width_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stack, NODE_WIDTH, &stack_width_item);

    ArkUI_NumberValue stack_height_value[] = {{.f32 = stackHeight}};
    ArkUI_AttributeItem stack_height_item = {stack_height_value,
                                             sizeof(stack_height_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stack, NODE_HEIGHT, &stack_height_item);

    ArkUI_NumberValue stack_background_color_value[] = {{.u32 = stackBackgroundColor}};
    ArkUI_AttributeItem stack_background_color_item = {
        stack_background_color_value, sizeof(stack_background_color_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stack, NODE_BACKGROUND_COLOR, &stack_background_color_item);

    node_api->registerNodeEvent(stack, NODE_TOUCH_EVENT, STACK_ON_TOUCH_EVENT_ID, nullptr);

    node_api->addChild(stackParent, stack);

    ArkUI_AttributeItem stack_brother_id_item = {};
    stack_brother_id_item.string = onTouchTestStackBrother;
    node_api->setAttribute(stackBrother, NODE_ID, &stack_brother_id_item);

    ArkUI_NumberValue stack_brother_width_value[] = {{.f32 = stackBrotherWidth}};
    ArkUI_AttributeItem stack_brother_width_item = {stack_brother_width_value,
                                                    sizeof(stack_brother_width_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stackBrother, NODE_WIDTH, &stack_brother_width_item);

    ArkUI_NumberValue stack_brother_height_value[] = {{.f32 = stackBrotherHeight}};
    ArkUI_AttributeItem stack_brother_height_item = {stack_brother_height_value,
                                                     sizeof(stack_brother_height_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stackBrother, NODE_HEIGHT, &stack_brother_height_item);

    ArkUI_NumberValue stack_brother_background_color_value[] = {{.u32 = stackBrotherBackgroundColor}};
    ArkUI_AttributeItem stack_brother_background_color_item = {
        stack_brother_background_color_value, sizeof(stack_brother_background_color_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stackBrother, NODE_BACKGROUND_COLOR, &stack_brother_background_color_item);

    ArkUI_NumberValue stack_brother_hittestbehavior_value[] = {{.i32 = hitTestBehavior}};
    ArkUI_AttributeItem stack_brother_hittestbehavior_item = {
        stack_brother_hittestbehavior_value, sizeof(stack_brother_hittestbehavior_value) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stackBrother, NODE_HIT_TEST_BEHAVIOR, &stack_brother_hittestbehavior_item);

    node_api->registerNodeEvent(stackBrother, NODE_TOUCH_EVENT, STACK_BROTHER_ON_TOUCH_EVENT_ID, nullptr);

    node_api->addChild(stackParent, stackBrother);

    return stackParent;
}

napi_value StackHitTestBehaviorTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "StackHitTestBehaviorTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "StackHitTestBehaviorTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);

    int32_t hitTestBehavior = PARAM_0;
    string onTouchTestStackParent = "OnTouchTestStackParentDefault";
    string onTouchTestStack = "OnTouchStackDefault";
    string onTouchTestStackBrother = "OnTouchTestStackBrotherDefault";
    auto stackParent = CreateSubStackNode(nodeAPI, hitTestBehavior, onTouchTestStackParent.c_str(),
                                          onTouchTestStack.c_str(), onTouchTestStackBrother.c_str());
    nodeAPI->addChild(row, stackParent);

    hitTestBehavior = PARAM_1;
    onTouchTestStackParent = "OnTouchTestStackParentBlock";
    onTouchTestStack = "OnTouchTestStackBlock";
    onTouchTestStackBrother = "OnTouchTestStackBrotherBlock";
    stackParent = CreateSubStackNode(nodeAPI, hitTestBehavior, onTouchTestStackParent.c_str(), onTouchTestStack.c_str(),
                                     onTouchTestStackBrother.c_str());
    nodeAPI->addChild(row, stackParent);

    hitTestBehavior = PARAM_2;
    onTouchTestStackParent = "OnTouchTestStackParentTransparent";
    onTouchTestStack = "OnTouchTestStackTransparent";
    onTouchTestStackBrother = "OnTouchTestStackBrotherTransparent";
    stackParent = CreateSubStackNode(nodeAPI, hitTestBehavior, onTouchTestStackParent.c_str(), onTouchTestStack.c_str(),
                                     onTouchTestStackBrother.c_str());
    nodeAPI->addChild(row, stackParent);                                 
    nodeAPI->addChild(column, row);

    hitTestBehavior = PARAM_3;
    onTouchTestStackParent = "OnTouchTestStackParentNone";
    onTouchTestStack = "OnTouchTestStackNone";
    onTouchTestStackBrother = "OnTouchTestStackBrotherNone";
    stackParent = CreateSubStackNode(nodeAPI, hitTestBehavior, onTouchTestStackParent.c_str(), onTouchTestStack.c_str(),
                                     onTouchTestStackBrother.c_str());
    nodeAPI->addChild(row1, stackParent);

    hitTestBehavior = -1;
    onTouchTestStackParent = "OnTouchTestStackParentExceptBelow";
    onTouchTestStack = "OnTouchTestStackExceptBelow";
    onTouchTestStackBrother = "OnTouchTestStackBrotherExceptBelow";
    stackParent = CreateSubStackNode(nodeAPI, hitTestBehavior, onTouchTestStackParent.c_str(), onTouchTestStack.c_str(),
                                     onTouchTestStackBrother.c_str());
    nodeAPI->addChild(row1, stackParent);

    hitTestBehavior = PARAM_4;
    onTouchTestStackParent = "OnTouchTestStackParentExceptAbove";
    onTouchTestStack = "OnTouchTestStackExceptAbove";
    onTouchTestStackBrother = "OnTouchTestStackBrotherExceptAbove";
    stackParent = CreateSubStackNode(nodeAPI, hitTestBehavior, onTouchTestStackParent.c_str(), onTouchTestStack.c_str(),
                                     onTouchTestStackBrother.c_str());
    nodeAPI->addChild(row1, stackParent);                                 
    nodeAPI->addChild(column, row1);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "StackHitTestBehaviorTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

} // namespace ArkUICapiTest