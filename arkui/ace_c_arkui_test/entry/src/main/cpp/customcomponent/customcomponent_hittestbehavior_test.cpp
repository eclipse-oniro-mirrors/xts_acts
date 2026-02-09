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

#include "../manager/plugin_manager.h"
#include "customcomponent_hittestbehavior_test.h"
#include <string>

#define CUSTOMCOMPONENT_ON_TOUCH_EVENT_ID 7001
#define CUSTOMCOMPONENT_BROTHER_ON_TOUCH_EVENT_ID 7002
#define COLUMN_ON_TOUCH_EVENT_ID 7003
namespace ArkUICapiTest {

void CustomComponentHitTestBehaviorTest::OnEventReceive(ArkUI_NodeEvent *event)
{
    uint32_t backgroundColor = COLOR_BLUE;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentOnTouchTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentOnTouchTest",
                     "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentOnTouchTest",
                 "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == CUSTOMCOMPONENT_ON_TOUCH_EVENT_ID) {
        backgroundColor = COLOR_BLUE;
    } else if (eventId == CUSTOMCOMPONENT_BROTHER_ON_TOUCH_EVENT_ID) {
        backgroundColor = COLOR_BLACK;
    } else {
        backgroundColor = COLOR_WHITE;
    }

    if ((eventId == CUSTOMCOMPONENT_ON_TOUCH_EVENT_ID) || (eventId == CUSTOMCOMPONENT_BROTHER_ON_TOUCH_EVENT_ID) ||
        (eventId == COLUMN_ON_TOUCH_EVENT_ID)) {
        ArkUI_NumberValue backgroundColorValue[] = {{.u32 = backgroundColor}};
        ArkUI_AttributeItem backgroundColorItem = {backgroundColorValue,
                                                   sizeof(backgroundColorValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &backgroundColorItem);
    }
}

ArkUI_NodeHandle CustomComponentHitTestBehaviorTest::CreateSubCustomComponentNode(
    ArkUI_NativeNodeAPI_1 *node_api, int32_t hitTestBehavior, const char *onTouchTestStack,
    const char *onTouchTestCustomComponent, const char *onTouchTestCustomComponentBrother,
    const char *onTouchTestColumn)
{
    float stackWidth = SIZE_80;
    float stackHeight = SIZE_80;
    float customWidth = SIZE_60;
    float customHeight = SIZE_60;
    float customBrotherWidth = SIZE_40;
    float customBrotherHeight = SIZE_40;
    float columnWidth = SIZE_20;
    float columnHeight = SIZE_20;
    uint32_t stackBackgroundColor = COLOR_GRAY;
    uint32_t customBackgroundColor = COLOR_RED;
    uint32_t customBrotherBackgroundColor = COLOR_GREEN;
    uint32_t columnBackgroundColor = COLOR_PURPLE;
    // create stack, custom and customBrother
    auto stack = node_api->createNode(ARKUI_NODE_STACK);
    auto custom = node_api->createNode(ARKUI_NODE_CUSTOM);
    auto customBrother = node_api->createNode(ARKUI_NODE_CUSTOM);
    auto column = node_api->createNode(ARKUI_NODE_COLUMN);
    // set stack id
    ArkUI_AttributeItem idItem = {};
    idItem.string = onTouchTestStack;
    node_api->setAttribute(stack, NODE_ID, &idItem);

    // set stack width and height
    ArkUI_NumberValue stackWidthValue[] = {{.f32 = stackWidth}};
    ArkUI_AttributeItem stackWidthItem = {stackWidthValue, sizeof(stackWidthValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stack, NODE_WIDTH, &stackWidthItem);

    ArkUI_NumberValue stackHeightValue[] = {{.f32 = stackHeight}};
    ArkUI_AttributeItem stackHeightItem = {stackHeightValue, sizeof(stackHeightValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stack, NODE_HEIGHT, &stackHeightItem);

    // set stack backgroundColor
    ArkUI_NumberValue stackBackgroundColorValue[] = {{.u32 = stackBackgroundColor}};
    ArkUI_AttributeItem stackBackgroundColorItem = {stackBackgroundColorValue,
                                                    sizeof(stackBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(stack, NODE_BACKGROUND_COLOR, &stackBackgroundColorItem);

    // set custom id
    ArkUI_AttributeItem customIdItem = {};
    customIdItem.string = onTouchTestCustomComponent;
    node_api->setAttribute(custom, NODE_ID, &customIdItem);

    // set custom width and height
    ArkUI_NumberValue customWidthValue[] = {{.f32 = customWidth}};
    ArkUI_AttributeItem customWidthItem = {customWidthValue, sizeof(customWidthValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(custom, NODE_WIDTH, &customWidthItem);

    ArkUI_NumberValue customHeightValue[] = {{.f32 = customHeight}};
    ArkUI_AttributeItem customHeightItem = {customHeightValue, sizeof(customHeightValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(custom, NODE_HEIGHT, &customHeightItem);

    // set custom backgroundColor
    ArkUI_NumberValue customBackgroundColorValue[] = {{.u32 = customBackgroundColor}};
    ArkUI_AttributeItem customBackgroundColorItem = {customBackgroundColorValue,
                                                     sizeof(customBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(custom, NODE_BACKGROUND_COLOR, &customBackgroundColorItem);

    // bind custom onTouch event
    node_api->registerNodeEvent(custom, NODE_TOUCH_EVENT, CUSTOMCOMPONENT_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CUSTOMCOMPONENT_ON_TOUCH_EVENT_ID",
                 "CUSTOMCOMPONENT_ON_TOUCH_EVENT_ID");

    // set customBrother id
    ArkUI_AttributeItem customBrotherIdItem = {};
    customBrotherIdItem.string = onTouchTestCustomComponentBrother;
    node_api->setAttribute(customBrother, NODE_ID, &customBrotherIdItem);

    // set customBrother width and height
    ArkUI_NumberValue customBrotherWidthValue[] = {{.f32 = customBrotherWidth}};
    ArkUI_AttributeItem customBrotherWidthItem = {customBrotherWidthValue,
                                                  sizeof(customBrotherWidthValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(customBrother, NODE_WIDTH, &customBrotherWidthItem);

    ArkUI_NumberValue customBrotherHeightValue[] = {{.f32 = customBrotherHeight}};
    ArkUI_AttributeItem customBrotherHeightItem = {customBrotherHeightValue,
                                                   sizeof(customBrotherHeightValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(customBrother, NODE_HEIGHT, &customBrotherHeightItem);

    // set customBrother backgroundColor
    ArkUI_NumberValue customBrotherBackgroundColorValue[] = {{.u32 = customBrotherBackgroundColor}};
    ArkUI_AttributeItem customBrotherBackgroundColorItem = {
        customBrotherBackgroundColorValue, sizeof(customBrotherBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(customBrother, NODE_BACKGROUND_COLOR, &customBrotherBackgroundColorItem);

    // set customBrother hitTestBehavior item
    ArkUI_NumberValue customBrotherHitTestBehaviorValue[] = {{.i32 = hitTestBehavior}};
    ArkUI_AttributeItem customBrotherHitTestBehaviorItem = {
        customBrotherHitTestBehaviorValue, sizeof(customBrotherHitTestBehaviorValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(custom, NODE_HIT_TEST_BEHAVIOR, &customBrotherHitTestBehaviorItem);

    // bind custom onTouch event
    node_api->registerNodeEvent(customBrother, NODE_TOUCH_EVENT, CUSTOMCOMPONENT_BROTHER_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CUSTOMCOMPONENT_BROTHER_ON_TOUCH_EVENT_ID",
                 "CUSTOMCOMPONENT_BROTHER_ON_TOUCH_EVENT_ID");
    // set customBrother id
    ArkUI_AttributeItem columnIdItem = {};
    columnIdItem.string = onTouchTestColumn;
    node_api->setAttribute(column, NODE_ID, &columnIdItem);

    ArkUI_NumberValue columnWidthValue[] = {{.f32 = columnWidth}};
    ArkUI_AttributeItem columnWidthItem = {columnWidthValue, sizeof(columnWidthValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(column, NODE_WIDTH, &columnWidthItem);

    ArkUI_NumberValue columnHeightValue[] = {{.f32 = columnHeight}};
    ArkUI_AttributeItem columnHeightItem = {columnHeightValue, sizeof(columnHeightValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(column, NODE_HEIGHT, &columnHeightItem);

    ArkUI_NumberValue columnHittestbehaviorValue[] = {{.i32 = ARKUI_HIT_TEST_MODE_TRANSPARENT}};
    ArkUI_AttributeItem columnHittestbehaviorItem = {columnHittestbehaviorValue,
                                                     sizeof(columnHittestbehaviorValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(column, NODE_HIT_TEST_BEHAVIOR, &columnHittestbehaviorItem);

    ArkUI_NumberValue columnBackgroundColorValue[] = {{.u32 = columnBackgroundColor}};
    ArkUI_AttributeItem columnBackgroundColorItem = {columnBackgroundColorValue,
                                                     sizeof(columnBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(column, NODE_BACKGROUND_COLOR, &columnBackgroundColorItem);
    // bind custom onTouch event
    node_api->registerNodeEvent(column, NODE_TOUCH_EVENT, COLUMN_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "COLUMN_ON_TOUCH_EVENT_ID", "COLUMN_ON_TOUCH_EVENT_ID");

    // add customBrother to stack
    node_api->addChild(stack, customBrother);
    // add custom to stack
    node_api->addChild(stack, custom);

    node_api->addChild(custom, column);
    return stack;
}

napi_value CustomComponentHitTestBehaviorTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentHitTestBehaviorTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentHitTestBehaviorTest",
                     "GetContext env or info is null");
        return nullptr;
    }
    // create nodeApi
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    // create column
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);

    int32_t hitTestBehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_DEFAULT;
    string onTouchTestStack = "OnTouchTestStackDefault";
    string onTouchTestCustomComponent = "OnTouchTestCustomComponentDefault";
    string onTouchTestCustomComponentBrother = "OnTouchTestCustomComponentBrotherDefault";
    string onTouchTestColumn = "OnTouchTestColumnDefault";
    auto stack = CreateSubCustomComponentNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(),
                                              onTouchTestCustomComponent.c_str(),
                                              onTouchTestCustomComponentBrother.c_str(), onTouchTestColumn.c_str());
    // add stack to column
    nodeAPI->addChild(row, stack);

    hitTestBehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_BLOCK;
    onTouchTestStack = "OnTouchTestStackBlock";
    onTouchTestCustomComponent = "OnTouchTestCustomComponentBlock";
    onTouchTestCustomComponentBrother = "OnTouchTestCustomComponentBrotherBlock";
    onTouchTestColumn = "OnTouchTestColumnBlock";
    stack = CreateSubCustomComponentNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(),
                                         onTouchTestCustomComponent.c_str(), onTouchTestCustomComponentBrother.c_str(),
                                         onTouchTestColumn.c_str());
    // add stack to column
    nodeAPI->addChild(row, stack);

    hitTestBehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_TRANSPARENT;
    onTouchTestStack = "OnTouchTestStackTransparent";
    onTouchTestCustomComponent = "OnTouchTestCustomComponentTransparent";
    onTouchTestCustomComponentBrother = "OnTouchTestCustomComponentBrotherTransparent";
    onTouchTestColumn = "OnTouchTestColumnTransparent";
    stack = CreateSubCustomComponentNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(),
                                         onTouchTestCustomComponent.c_str(), onTouchTestCustomComponentBrother.c_str(),
                                         onTouchTestColumn.c_str());
    // add stack to column
    nodeAPI->addChild(row, stack);
    nodeAPI->addChild(column, row);

    hitTestBehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_NONE;
    onTouchTestStack = "OnTouchTestStackNone";
    onTouchTestCustomComponent = "OnTouchTestCustomComponentNone";
    onTouchTestCustomComponentBrother = "OnTouchTestCustomComponentBrotherNone";
    onTouchTestColumn = "OnTouchTestColumnNone";
    stack = CreateSubCustomComponentNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(),
                                         onTouchTestCustomComponent.c_str(), onTouchTestCustomComponentBrother.c_str(),
                                         onTouchTestColumn.c_str());
    // add stack to column
    nodeAPI->addChild(row1, stack);

    hitTestBehavior = PARAM_NEGATIVE_1;
    onTouchTestStack = "OnTouchTestStackExceptBelow";
    onTouchTestCustomComponent = "OnTouchTestCustomComponentExceptBelow";
    onTouchTestCustomComponentBrother = "OnTouchTestCustomComponentBrotherExceptBelow";
    onTouchTestColumn = "OnTouchTestColumnExceptBelow";
    stack = CreateSubCustomComponentNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(),
                                         onTouchTestCustomComponent.c_str(), onTouchTestCustomComponentBrother.c_str(),
                                         onTouchTestColumn.c_str());
    // add stack to column
    nodeAPI->addChild(row1, stack);

    hitTestBehavior = PARAM_4;
    onTouchTestStack = "OnTouchTestStackExceptAbove";
    onTouchTestCustomComponent = "OnTouchTestCustomComponentExceptAbove";
    onTouchTestCustomComponentBrother = "OnTouchTestCustomComponentBrotherExceptAbove";
    onTouchTestColumn = "OnTouchTestColumnExceptAbove";
    stack = CreateSubCustomComponentNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(),
                                         onTouchTestCustomComponent.c_str(), onTouchTestCustomComponentBrother.c_str(),
                                         onTouchTestColumn.c_str());
    // add stack to column
    nodeAPI->addChild(row1, stack);
    nodeAPI->addChild(column, row1);

    // bind node callBack event receiver
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // bind to XComponentID
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentHitTestBehaviorTest",
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