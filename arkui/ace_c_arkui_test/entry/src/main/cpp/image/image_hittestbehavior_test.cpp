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
#include "image_hittestbehavior_test.h"
#include <string>

#define IMAGE_ON_TOUCH_EVENT_ID 7001
#define IMAGE_BROTHER_ON_TOUCH_EVENT_ID 7002

namespace ArkUICapiTest {

void ImageHitTestBehaviorTest::OnEventReceive(ArkUI_NodeEvent *event)
{
    uint32_t backgroundColor = COLOR_BLUE;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageEventOnTouchTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageEventOnTouchTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageEventOnTouchTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == IMAGE_ON_TOUCH_EVENT_ID) {
        backgroundColor = COLOR_BLUE;
    } else {
        backgroundColor = COLOR_BLACK;
    }

    if ((eventId == IMAGE_ON_TOUCH_EVENT_ID) || (eventId == IMAGE_BROTHER_ON_TOUCH_EVENT_ID)) {
        ArkUI_NumberValue backgroundColorValue[] = {{.u32 = backgroundColor}};
        ArkUI_AttributeItem backgroundColorItem = {backgroundColorValue,
                                                   sizeof(backgroundColorValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &backgroundColorItem);
    }
}

ArkUI_NodeHandle ImageHitTestBehaviorTest::CreateSubImageNode(ArkUI_NativeNodeAPI_1 *node_api, int32_t hitTestBehavior,
                                                              const char *onTouchTestStack,
                                                              const char *onTouchTestImage,
                                                              const char *onTouchTestImageBrother)
{
    float stackWidth = SIZE_80;
    float stackHeight = SIZE_80;
    float imageWidth = SIZE_60;
    float imageHeight = SIZE_60;
    float imageBrotherWidth = SIZE_40;
    float imageBrotherHeight = SIZE_40;
    uint32_t stackBackgroundColor = COLOR_GRAY;
    uint32_t imageBackgroundColor = COLOR_RED;
    uint32_t imageBrotherBackgroundColor = COLOR_GREEN;

    // create stack, image and imageBrother
    auto stack = node_api->createNode(ARKUI_NODE_STACK);
    auto image = node_api->createNode(ARKUI_NODE_IMAGE);
    auto imageBrother = node_api->createNode(ARKUI_NODE_IMAGE);

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

    // set image id
    ArkUI_AttributeItem imageIdItem = {};
    imageIdItem.string = onTouchTestImage;
    node_api->setAttribute(image, NODE_ID, &imageIdItem);

    // set image width and height
    ArkUI_NumberValue imageWidthValue[] = {{.f32 = imageWidth}};
    ArkUI_AttributeItem imageWidthItem = {imageWidthValue, sizeof(imageWidthValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(image, NODE_WIDTH, &imageWidthItem);

    ArkUI_NumberValue imageHeightValue[] = {{.f32 = imageHeight}};
    ArkUI_AttributeItem imageHeightItem = {imageHeightValue, sizeof(imageHeightValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(image, NODE_HEIGHT, &imageHeightItem);

    // set image backgroundColor
    ArkUI_NumberValue imageBackgroundColorValue[] = {{.u32 = imageBackgroundColor}};
    ArkUI_AttributeItem imageBackgroundColorItem = {imageBackgroundColorValue,
                                                    sizeof(imageBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(image, NODE_BACKGROUND_COLOR, &imageBackgroundColorItem);

    // bind image onTouch event
    node_api->registerNodeEvent(image, NODE_TOUCH_EVENT, IMAGE_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "IMAGE_ON_TOUCH_EVENT_ID", "IMAGE_ON_TOUCH_EVENT_ID");

    // add image to stack
    node_api->addChild(stack, image);

    // set imageBrother id
    ArkUI_AttributeItem imageBrotherIdItem = {};
    imageBrotherIdItem.string = onTouchTestImageBrother;
    node_api->setAttribute(imageBrother, NODE_ID, &imageBrotherIdItem);

    // set imageBrother width and height
    ArkUI_NumberValue imageBrotherWidthValue[] = {{.f32 = imageBrotherWidth}};
    ArkUI_AttributeItem imageBrotherWidthItem = {imageBrotherWidthValue,
                                                 sizeof(imageBrotherWidthValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(imageBrother, NODE_WIDTH, &imageBrotherWidthItem);

    ArkUI_NumberValue imageBrotherHeightValue[] = {{.f32 = imageBrotherHeight}};
    ArkUI_AttributeItem imageBrotherHeightItem = {imageBrotherHeightValue,
                                                  sizeof(imageBrotherHeightValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(imageBrother, NODE_HEIGHT, &imageBrotherHeightItem);

    // set imageBrother backgroundColor
    ArkUI_NumberValue imageBrotherBackgroundColorValue[] = {{.u32 = imageBrotherBackgroundColor}};
    ArkUI_AttributeItem imageBrotherBackgroundColorItem = {
        imageBrotherBackgroundColorValue, sizeof(imageBrotherBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(imageBrother, NODE_BACKGROUND_COLOR, &imageBrotherBackgroundColorItem);

    // set imageBrother hitTestBehavior item
    ArkUI_NumberValue imageBrotherHitTestBehaviorValue[] = {{.i32 = hitTestBehavior}};
    ArkUI_AttributeItem imageBrotherHitTestBehaviorItem = {
        imageBrotherHitTestBehaviorValue, sizeof(imageBrotherHitTestBehaviorValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(imageBrother, NODE_HIT_TEST_BEHAVIOR, &imageBrotherHitTestBehaviorItem);

    // bind image onTouch event
    node_api->registerNodeEvent(imageBrother, NODE_TOUCH_EVENT, IMAGE_BROTHER_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "IMAGE_BROTHER_ON_TOUCH_EVENT_ID",
                 "IMAGE_BROTHER_ON_TOUCH_EVENT_ID");

    // add imageBrother to stack
    node_api->addChild(stack, imageBrother);

    return stack;
}

napi_value ImageHitTestBehaviorTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageHitTestBehaviorTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageHitTestBehaviorTest",
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
    string onTouchTestImage = "OnTouchTestImageDefault";
    string onTouchTestImageBrother = "OnTouchTestImageBrotherDefault";
    auto stack = CreateSubImageNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestImage.c_str(),
                                    onTouchTestImageBrother.c_str());
    // add stack to column
    nodeAPI->addChild(row, stack);

    hitTestBehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_BLOCK;
    onTouchTestStack = "OnTouchTestStackBlock";
    onTouchTestImage = "OnTouchTestImageBlock";
    onTouchTestImageBrother = "OnTouchTestImageBrotherBlock";
    stack = CreateSubImageNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestImage.c_str(),
                               onTouchTestImageBrother.c_str());
    // add stack to column
    nodeAPI->addChild(row, stack);

    hitTestBehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_TRANSPARENT;
    onTouchTestStack = "OnTouchTestStackTransparent";
    onTouchTestImage = "OnTouchTestImageTransparent";
    onTouchTestImageBrother = "OnTouchTestImageBrotherTransparent";
    stack = CreateSubImageNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestImage.c_str(),
                               onTouchTestImageBrother.c_str());
    // add stack to column
    nodeAPI->addChild(row, stack);
    nodeAPI->addChild(column, row);

    hitTestBehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_NONE;
    onTouchTestStack = "OnTouchTestStackNone";
    onTouchTestImage = "OnTouchTestImageNone";
    onTouchTestImageBrother = "OnTouchTestImageBrotherNone";
    stack = CreateSubImageNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestImage.c_str(),
                               onTouchTestImageBrother.c_str());
    // add stack to column
    nodeAPI->addChild(row1, stack);

    hitTestBehavior = PARAM_NEGATIVE_1;
    onTouchTestStack = "OnTouchTestStackExceptBelow";
    onTouchTestImage = "OnTouchTestImageExceptBelow";
    onTouchTestImageBrother = "OnTouchTestImageBrotherExceptBelow";
    stack = CreateSubImageNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestImage.c_str(),
                               onTouchTestImageBrother.c_str());
    // add stack to column
    nodeAPI->addChild(row1, stack);

    hitTestBehavior = PARAM_4;
    onTouchTestStack = "OnTouchTestStackExceptAbove";
    onTouchTestImage = "OnTouchTestImageExceptAbove";
    onTouchTestImageBrother = "OnTouchTestImageBrotherExceptAbove";
    stack = CreateSubImageNode(nodeAPI, hitTestBehavior, onTouchTestStack.c_str(), onTouchTestImage.c_str(),
                               onTouchTestImageBrother.c_str());
    // add stack to column
    nodeAPI->addChild(row1, stack);
    nodeAPI->addChild(column, row1);
    // bind node callBack event receiver
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // bind to XComponentID
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageHitTestBehaviorTest",
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