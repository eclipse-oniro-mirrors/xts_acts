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
#include "imageAnimator_event_test.h"
#include "component/imageanimator_component.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_interface.h>

#include <cassert>
#include <string>

#define ON_START_EVENT_ID 6001
#define ON_END_EVENT_ID 6002
#define ON_BUTTON_PAUSE_ID 2
#define ON_BUTTON_STOP_ID 3
#define ON_BUTTON_REPEAT_ID 4
#define SIZE_2000 2000
#define SIZE_1000 1000

namespace ArkUICapiTest {

std::shared_ptr<ImageAnimatorComponent> imageAnimator_ = nullptr;

static void CreateChildNode(const std::string &id)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageAnimatorOnStartTest", "CreateChildNode in");
    std::vector<ArkUI_ImageAnimatorFrameInfo*> vec;
    char* imageUrls[] = {
        "./resources/base/media/icon.png",
        "./resources/base/media/background_green.png",
        "./resources/base/media/background_red.png",
        "./resources/base/media/background_yellow.png",
        "./resources/base/media/background_blue.png",
    };
    for (int i = 0; i < PARAM_5; ++i) {
        auto item = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(const_cast<char*>(imageUrls[i]));
        OH_ArkUI_ImageAnimatorFrameInfo_SetWidth(item, SIZE_100);
        OH_ArkUI_ImageAnimatorFrameInfo_SetHeight(item, SIZE_80);
        OH_ArkUI_ImageAnimatorFrameInfo_SetTop(item, SIZE_10);
        OH_ArkUI_ImageAnimatorFrameInfo_SetLeft(item, SIZE_10);
        OH_ArkUI_ImageAnimatorFrameInfo_SetDuration(item, SIZE_1000);
        vec.push_back(item);
    }
    imageAnimator_ = std::make_shared<ImageAnimatorComponent>();
    imageAnimator_->SetImage(vec);
    imageAnimator_->SetBackgroundColor(0xFFFFFFFF);
    imageAnimator_->SetWidth(SIZE_100);
    imageAnimator_->SetHeight(SIZE_80);
    imageAnimator_->SetMargin(PARAM_10);
    imageAnimator_->SetDuration(SIZE_2000);
    imageAnimator_->SetId(id);
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    int32_t targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    if (targetId == 0) {
        imageAnimator_->SetState(ARKUI_ANIMATION_STATUS_RUNNING);
    }
    if (targetId == 1) {
        imageAnimator_->SetState(ARKUI_ANIMATION_STATUS_INITIAL);
    }
    if (targetId == ON_BUTTON_PAUSE_ID) {
        imageAnimator_->SetState(ARKUI_ANIMATION_STATUS_PAUSED);
    }
    if (targetId == ON_BUTTON_STOP_ID) {
        imageAnimator_->SetState(ARKUI_ANIMATION_STATUS_STOPPED);
    }
    if (targetId == ON_BUTTON_REPEAT_ID) {
        imageAnimator_->SetIteration(-1);
    }
}

napi_value ImageAnimatorEventTest::ImageAnimatorOnCancel(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest", "ImageAnimatorOnCancel");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    CreateChildNode("OnStart");
    imageAnimator_->RegisterOnCancel([](ArkUI_NodeEvent* event) { imageAnimator_->SetBackgroundColor(COLOR_GREEN); });
    ArkUI_NodeHandle start_button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem start_item = {.string = "start"};
    nodeAPI->setAttribute(start_button, NODE_ID, &start_item);
    nodeAPI->setAttribute(start_button, NODE_BUTTON_LABEL, &start_item);
    nodeAPI->registerNodeEvent(start_button, NODE_ON_CLICK, 0, nullptr);

    ArkUI_NodeHandle end_button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem end_item = {.string = "cancel"};
    nodeAPI->setAttribute(end_button, NODE_ID, &end_item);
    nodeAPI->setAttribute(end_button, NODE_BUTTON_LABEL, &end_item);
    nodeAPI->registerNodeEvent(end_button, NODE_ON_CLICK, 1, nullptr);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(column, imageAnimator_->GetComponent());
    nodeAPI->addChild(column, row);
    nodeAPI->addChild(row, start_button);
    nodeAPI->addChild(row, end_button);
    nodeAPI->registerNodeEvent(imageAnimator_->GetComponent(), NODE_IMAGE_ANIMATOR_EVENT_ON_START,
        ON_START_EVENT_ID, nullptr);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ImageAnimatorEventTest::ImageAnimatorOnPause(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest", "ImageAnimatorOnPause");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    CreateChildNode("OnPause");
    imageAnimator_->RegisterOnPause([](ArkUI_NodeEvent *event) { imageAnimator_->SetBackgroundColor(COLOR_GREEN);});
    ArkUI_NodeHandle start_button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem start_item = {.string = "start"};
    nodeAPI->setAttribute(start_button, NODE_ID, &start_item);
    nodeAPI->setAttribute(start_button, NODE_BUTTON_LABEL, &start_item);
    nodeAPI->registerNodeEvent(start_button, NODE_ON_CLICK, 0, nullptr);

    ArkUI_NodeHandle end_button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem end_item = {.string = "pause"};
    nodeAPI->setAttribute(end_button, NODE_ID, &end_item);
    nodeAPI->setAttribute(end_button, NODE_BUTTON_LABEL, &end_item);
    nodeAPI->registerNodeEvent(end_button, NODE_ON_CLICK, ON_BUTTON_PAUSE_ID, nullptr);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(column, imageAnimator_->GetComponent());
    nodeAPI->addChild(column, row);
    nodeAPI->addChild(row, start_button);
    nodeAPI->addChild(row, end_button);
    nodeAPI->registerNodeEvent(imageAnimator_->GetComponent(), NODE_IMAGE_ANIMATOR_EVENT_ON_START,
        ON_START_EVENT_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ImageAnimatorEventTest::ImageAnimatorOnRepeat(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest", "ImageAnimatorOnRepeat");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    CreateChildNode("OnRepeat");
    imageAnimator_->RegisterOnRepeat([](ArkUI_NodeEvent *event) { imageAnimator_->SetBackgroundColor(COLOR_GREEN);});
    ArkUI_NodeHandle start_button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem start_item = {.string = "start"};
    nodeAPI->setAttribute(start_button, NODE_ID, &start_item);
    nodeAPI->setAttribute(start_button, NODE_BUTTON_LABEL, &start_item);
    nodeAPI->registerNodeEvent(start_button, NODE_ON_CLICK, 0, nullptr);

    ArkUI_NodeHandle end_button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem end_item = {.string = "repeat"};
    nodeAPI->setAttribute(end_button, NODE_ID, &end_item);
    nodeAPI->setAttribute(end_button, NODE_BUTTON_LABEL, &end_item);
    nodeAPI->registerNodeEvent(end_button, NODE_ON_CLICK, ON_BUTTON_REPEAT_ID, nullptr);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(column, imageAnimator_->GetComponent());
    nodeAPI->addChild(column, row);
    nodeAPI->addChild(row, start_button);
    nodeAPI->addChild(row, end_button);
    nodeAPI->registerNodeEvent(imageAnimator_->GetComponent(), NODE_IMAGE_ANIMATOR_EVENT_ON_START,
        ON_START_EVENT_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ImageAnimatorEventTest::ImageAnimatorOnFinish(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest", "ImageAnimatorOnFinish");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest",
                     "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    CreateChildNode("OnFinish");
    imageAnimator_->RegisterOnFinish([](ArkUI_NodeEvent* event) { imageAnimator_->SetBackgroundColor(COLOR_GREEN); });
    ArkUI_NodeHandle start_button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem start_item = {.string = "start"};
    nodeAPI->setAttribute(start_button, NODE_ID, &start_item);
    nodeAPI->setAttribute(start_button, NODE_BUTTON_LABEL, &start_item);
    nodeAPI->registerNodeEvent(start_button, NODE_ON_CLICK, 0, nullptr);

    ArkUI_NodeHandle end_button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem end_item = {.string = "stop"};
    nodeAPI->setAttribute(end_button, NODE_ID, &end_item);
    nodeAPI->setAttribute(end_button, NODE_BUTTON_LABEL, &end_item);
    nodeAPI->registerNodeEvent(end_button, NODE_ON_CLICK, ON_BUTTON_STOP_ID, nullptr);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(column, imageAnimator_->GetComponent());
    nodeAPI->addChild(column, row);
    nodeAPI->addChild(row, start_button);
    nodeAPI->addChild(row, end_button);
    nodeAPI->registerNodeEvent(imageAnimator_->GetComponent(), NODE_IMAGE_ANIMATOR_EVENT_ON_START,
        ON_START_EVENT_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageAnimatorEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest