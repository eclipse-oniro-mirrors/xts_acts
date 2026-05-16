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


#include "image_oncomplete_test.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

#define ON_TOUCH_EVENT_ID 7001
#define ON_COMPLETE_EVENT_ID 8001

namespace ArkUIAniTest {

static bool g_hasOnCompleteInit = false;

void ImageOnCompleteTest::OnEventReceive(ArkUI_NodeEvent *event)
{
    uint32_t backgroundColor = COLOR_GREEN;
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

    if (eventId == ON_TOUCH_EVENT_ID) {
        g_hasOnCompleteInit = true;
        ArkUI_AttributeItem src_item = {};
        src_item.string = "resource://media/icon.png";
        nodeAPI->setAttribute(nodeHandler, NODE_IMAGE_SRC, &src_item);
    }

    if ((g_hasOnCompleteInit == true) || (eventId == ON_COMPLETE_EVENT_ID)) {
        ArkUI_NumberValue backgroundColorValue[] = {{.u32 = backgroundColor}};
        ArkUI_AttributeItem backgroundColorItem = {backgroundColorValue,
                                                   sizeof(backgroundColorValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &backgroundColorItem);
    }
}

ArkUI_NodeHandle ImageOnCompleteTest::CreateSubImageNode(ArkUI_NativeNodeAPI_1 *node_api, const char *id,
                                                         uint32_t eventId)
{
    float width = SIZE_200;
    float height = SIZE_100;
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

void ImageOnCompleteTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    // create column
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t onTouchEventId = ON_TOUCH_EVENT_ID;
    const char *imageId = "onTouchEvent";
    ;
    auto image = CreateSubImageNode(nodeAPI, imageId, onTouchEventId);
    // add image to column
    nodeAPI->addChild(column, image);

    // bind image onTouch event
    nodeAPI->registerNodeEvent(image, NODE_IMAGE_ON_COMPLETE, ON_COMPLETE_EVENT_ID, nullptr);

    // bind node callBack event receiver
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

} // namespace ArkUIAniTest