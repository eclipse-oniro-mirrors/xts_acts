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
#include "image_id_test.h"
#include <string>

#define IMAGE_FIRST_ON_TOUCH_EVENT_ID 7001
#define IMAGE_SECOND_ON_TOUCH_EVENT_ID 7002

namespace ArkUICapiTest {

void ImageIdTest::OnEventReceive(ArkUI_NodeEvent *event)
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

    if (eventId == IMAGE_FIRST_ON_TOUCH_EVENT_ID) {
        backgroundColor = COLOR_BLUE;
    } else {
        backgroundColor = COLOR_BLACK;
    }

    if ((eventId == IMAGE_FIRST_ON_TOUCH_EVENT_ID) || (eventId == IMAGE_SECOND_ON_TOUCH_EVENT_ID)) {
        ArkUI_NumberValue backgroundColorValue[] = {{.u32 = backgroundColor}};
        ArkUI_AttributeItem backgroundColorItem = {backgroundColorValue,
                                                   sizeof(backgroundColorValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &backgroundColorItem);
    }
}

ArkUI_NodeHandle ImageIdTest::CreateSubImageNode(ArkUI_NativeNodeAPI_1 *node_api, const char *id, uint32_t eventId)
{
    float width = SIZE_200;
    float height = SIZE_200;
    uint32_t backgroundColor = COLOR_RED;

    // create image
    auto image = node_api->createNode(ARKUI_NODE_IMAGE);

    // set image id
    ArkUI_AttributeItem idItem = {};
    idItem.string = id;
    node_api->setAttribute(image, NODE_ID, &idItem);

    // set image width and height
    ArkUI_NumberValue widthValue[] = {{.f32 = width}};
    ArkUI_AttributeItem widthItem = {widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(image, NODE_WIDTH, &widthItem);

    ArkUI_NumberValue heightValue[] = {{.f32 = height}};
    ArkUI_AttributeItem heightItem = {heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(image, NODE_HEIGHT, &heightItem);

    // set image backgroundColor
    ArkUI_NumberValue backgroundColorValue[] = {{.u32 = backgroundColor}};
    ArkUI_AttributeItem backgroundColorItem = {backgroundColorValue,
                                               sizeof(backgroundColorValue) / sizeof(ArkUI_NumberValue)};
    node_api->setAttribute(image, NODE_BACKGROUND_COLOR, &backgroundColorItem);

    // bind image onTouch event
    node_api->registerNodeEvent(image, NODE_TOUCH_EVENT, eventId, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "IMAGE_ON_TOUCH_EVENT_ID", "IMAGE_ON_TOUCH_EVENT_ID");

    return image;
}

napi_value ImageIdTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageIdTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageIdTest", "GetConimage env or info is null");
        return nullptr;
    }
    // create nodeApi
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    // create column
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t imageFirstEventId = IMAGE_FIRST_ON_TOUCH_EVENT_ID;
    const char *imageFirstId = "onTouchFirst";
    ;
    auto image = CreateSubImageNode(nodeAPI, imageFirstId, imageFirstEventId);
    // add image to column
    nodeAPI->addChild(column, image);

    int32_t imageSecondEventId = IMAGE_SECOND_ON_TOUCH_EVENT_ID;
    const char *imageSecondId = "onTouchSecond";
    ;
    image = CreateSubImageNode(nodeAPI, imageSecondId, imageSecondEventId);
    // add image to column
    nodeAPI->addChild(column, image);

    // bind node callBack event receiver
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // bind to XComponentID
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageIdTest",
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