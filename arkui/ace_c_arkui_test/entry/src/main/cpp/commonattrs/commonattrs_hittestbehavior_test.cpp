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
#include "commonattrs_hittestbehavior_test.h"
#include <string>

#define COMMONATTRS_ON_TOUCH_EVENT_ID 7001
#define COMMONATTRS_BROTHER_ON_TOUCH_EVENT_ID 7002

namespace ArkUICapiTest {

void CommonAttrsHitTestBehaviorTest::OnEventReceive(ArkUI_NodeEvent *event)
{
    uint32_t backgroundColor = COLOR_BLUE;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsEventOnTouchTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonAttrsEventOnTouchTest",
                     "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsEventOnTouchTest",
                 "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == COMMONATTRS_ON_TOUCH_EVENT_ID) {
        backgroundColor = COLOR_BLUE;
    } else {
        backgroundColor = COLOR_BLACK;
    }

    if ((eventId == COMMONATTRS_ON_TOUCH_EVENT_ID) || (eventId == COMMONATTRS_BROTHER_ON_TOUCH_EVENT_ID)) {
        ArkUI_NumberValue backgroundColorValue[] = {{.u32 = backgroundColor}};
        ArkUI_AttributeItem backgroundColorItem = {backgroundColorValue,
                                                   sizeof(backgroundColorValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &backgroundColorItem);
    }
}

ArkUI_NodeHandle CommonAttrsHitTestBehaviorTest::CreateSubCommonAttrsNode(ArkUI_NativeNodeAPI_1 *node_api,
                                                                          int32_t hitTestBehavior,
                                                                          const char *onTouchTestStack,
                                                                          const char *onTouchTestCommonAttrs,
                                                                          const char *onTouchTestCommonAttrsBrother)
{
    float stackWidth = SIZE_80;
    float stackHeight = SIZE_80;
    float commonAttrsWidth = SIZE_60;
    float commonAttrsHeight = SIZE_60;
    float commonAttrsBrotherWidth = SIZE_40;
    float commonAttrsBrotherHeight = SIZE_40;
    uint32_t stackBackgroundColor = COLOR_GRAY;
    uint32_t commonAttrsBackgroundColor = COLOR_RED;
    uint32_t commonAttrsBrotherBackgroundColor = COLOR_GREEN;

    // create stack, commonAttrs and commonAttrsBrother
    auto stack = node_api->createNode(ARKUI_NODE_STACK);
    auto commonAttrs = node_api->createNode(ARKUI_NODE_TEXT);
    auto commonAttrsBrother = node_api->createNode(ARKUI_NODE_TEXT);

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

    // set commonAttrs id
    ArkUI_AttributeItem commonAttrsIdItem = {};
    commonAttrsIdItem.string = onTouchTestCommonAttrs;
    node_api->setAttribute(commonAttrs, NODE_ID, &commonAttrsIdItem);

    // set commonAttrs width and height
    ArkUI_NumberValue commonAttrsWidthValue[] = {{.f32 = commonAttrsWidth}};
    ArkUI_AttributeItem commonAttrsWidthItem = {commonAttrsWidthValue,
                                                sizeof(commonAttrsWidthValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(commonAttrs, NODE_WIDTH, &commonAttrsWidthItem);

    ArkUI_NumberValue commonAttrsHeightValue[] = {{.f32 = commonAttrsHeight}};
    ArkUI_AttributeItem commonAttrsHeightItem = {commonAttrsHeightValue,
                                                 sizeof(commonAttrsHeightValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(commonAttrs, NODE_HEIGHT, &commonAttrsHeightItem);

    // set commonAttrs backgroundColor
    ArkUI_NumberValue commonAttrsBackgroundColorValue[] = {{.u32 = commonAttrsBackgroundColor}};
    ArkUI_AttributeItem commonAttrsBackgroundColorItem = {
        commonAttrsBackgroundColorValue, sizeof(commonAttrsBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(commonAttrs, NODE_BACKGROUND_COLOR, &commonAttrsBackgroundColorItem);

    // bind commonAttrs onTouch event
    node_api->registerNodeEvent(commonAttrs, NODE_TOUCH_EVENT, COMMONATTRS_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "COMMONATTRS_ON_TOUCH_EVENT_ID", "COMMONATTRS_ON_TOUCH_EVENT_ID");

    // add commonAttrs to stack
    node_api->addChild(stack, commonAttrs);

    // set commonAttrsBrother id
    ArkUI_AttributeItem commonAttrsBrotherIdItem = {};
    commonAttrsBrotherIdItem.string = onTouchTestCommonAttrsBrother;
    node_api->setAttribute(commonAttrsBrother, NODE_ID, &commonAttrsBrotherIdItem);

    // set commonAttrsBrother width and height
    ArkUI_NumberValue commonAttrsBrotherWidthValue[] = {{.f32 = commonAttrsBrotherWidth}};
    ArkUI_AttributeItem commonAttrsBrotherWidthItem = {
        commonAttrsBrotherWidthValue, sizeof(commonAttrsBrotherWidthValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(commonAttrsBrother, NODE_WIDTH, &commonAttrsBrotherWidthItem);

    ArkUI_NumberValue commonAttrsBrotherHeightValue[] = {{.f32 = commonAttrsBrotherHeight}};
    ArkUI_AttributeItem commonAttrsBrotherHeightItem = {
        commonAttrsBrotherHeightValue, sizeof(commonAttrsBrotherHeightValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(commonAttrsBrother, NODE_HEIGHT, &commonAttrsBrotherHeightItem);

    // set commonAttrsBrother backgroundColor
    ArkUI_NumberValue commonAttrsBrotherBackgroundColorValue[] = {{.u32 = commonAttrsBrotherBackgroundColor}};
    ArkUI_AttributeItem commonAttrsBrotherBackgroundColorItem = {commonAttrsBrotherBackgroundColorValue,
                                                                 sizeof(commonAttrsBrotherBackgroundColorValue) /
                                                                     sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(commonAttrsBrother, NODE_BACKGROUND_COLOR, &commonAttrsBrotherBackgroundColorItem);

    // set commonAttrsBrother hitTestBehavior item
    ArkUI_NumberValue commonAttrsBrotherHitTestBehaviorValue[] = {{.i32 = hitTestBehavior}};
    ArkUI_AttributeItem commonAttrsBrotherHitTestBehaviorItem = {commonAttrsBrotherHitTestBehaviorValue,
                                                                 sizeof(commonAttrsBrotherHitTestBehaviorValue) /
                                                                     sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(commonAttrsBrother, NODE_HIT_TEST_BEHAVIOR, &commonAttrsBrotherHitTestBehaviorItem);

    // bind commonAttrs onTouch event
    node_api->registerNodeEvent(commonAttrsBrother, NODE_TOUCH_EVENT, COMMONATTRS_BROTHER_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "COMMONATTRS_BROTHER_ON_TOUCH_EVENT_ID",
                 "COMMONATTRS_BROTHER_ON_TOUCH_EVENT_ID");

    // add commonAttrsBrother to stack
    node_api->addChild(stack, commonAttrsBrother);

    return stack;
}

napi_value CommonAttrsHitTestBehaviorTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonAttrsHitTestBehaviorTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonAttrsHitTestBehaviorTest",
                     "GetContext env or info is null");
        return nullptr;
    }
    // create nodeApi
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    // create column
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t hitTestBehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_DEFAULT;
    string onTouchTestStack = "OnTouchTestStackDefault";
    string onTouchTestCommonAttrs = "OnTouchTestCommonAttrsDefault";
    string onTouchTestCommonAttrsBrother = "OnTouchTestCommonAttrsBrotherDefault";
    auto stack = CreateSubCommonAttrsNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(),
                                          onTouchTestCommonAttrs.c_str(), onTouchTestCommonAttrsBrother.c_str());
    // add stack to column
    nodeAPI->addChild(column, stack);

    hitTestBehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_BLOCK;
    onTouchTestStack = "OnTouchTestStackBlock";
    onTouchTestCommonAttrs = "OnTouchTestCommonAttrsBlock";
    onTouchTestCommonAttrsBrother = "OnTouchTestCommonAttrsBrotherBlock";
    stack = CreateSubCommonAttrsNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestCommonAttrs.c_str(),
                                     onTouchTestCommonAttrsBrother.c_str());
    // add stack to column
    nodeAPI->addChild(column, stack);

    hitTestBehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_TRANSPARENT;
    onTouchTestStack = "OnTouchTestStackTransparent";
    onTouchTestCommonAttrs = "OnTouchTestCommonAttrsTransparent";
    onTouchTestCommonAttrsBrother = "OnTouchTestCommonAttrsBrotherTransparent";
    stack = CreateSubCommonAttrsNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestCommonAttrs.c_str(),
                                     onTouchTestCommonAttrsBrother.c_str());
    // add stack to column
    nodeAPI->addChild(column, stack);

    hitTestBehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_NONE;
    onTouchTestStack = "OnTouchTestStackNone";
    onTouchTestCommonAttrs = "OnTouchTestCommonAttrsNone";
    onTouchTestCommonAttrsBrother = "OnTouchTestCommonAttrsBrotherNone";
    stack = CreateSubCommonAttrsNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestCommonAttrs.c_str(),
                                     onTouchTestCommonAttrsBrother.c_str());
    // add stack to column
    nodeAPI->addChild(column, stack);

    hitTestBehavior = PARAM_NEGATIVE_1;
    onTouchTestStack = "OnTouchTestStackExceptBelow";
    onTouchTestCommonAttrs = "OnTouchTestCommonAttrsExceptBelow";
    onTouchTestCommonAttrsBrother = "OnTouchTestCommonAttrsBrotherExceptBelow";
    stack = CreateSubCommonAttrsNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestCommonAttrs.c_str(),
                                     onTouchTestCommonAttrsBrother.c_str());
    // add stack to column
    nodeAPI->addChild(column, stack);

    hitTestBehavior = PARAM_4;
    onTouchTestStack = "OnTouchTestStackExceptAbove";
    onTouchTestCommonAttrs = "OnTouchTestCommonAttrsExceptAbove";
    onTouchTestCommonAttrsBrother = "OnTouchTestCommonAttrsBrotherExceptAbove";
    stack = CreateSubCommonAttrsNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestCommonAttrs.c_str(),
                                     onTouchTestCommonAttrsBrother.c_str());
    // add stack to column
    nodeAPI->addChild(column, stack);

    // bind node callBack event receiver
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // bind to XComponentID
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonAttrsHitTestBehaviorTest",
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