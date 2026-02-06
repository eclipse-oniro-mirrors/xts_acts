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

#include "AnimationControllerTest.h"
#include "manager/PluginManagerTest.h"
#include "component/ButtonComponentTest.h"
#include <cstdint>
#include <string>
#define FIRST_MIDDLE_VALUE "./resources/base/media/icon.png"
#define SECOND_MIDDLE_VALUE                                                                                            \
    "https://gitee.com/openharmony/docs/raw/master/zh-cn/application-dev/"                                             \
    "reference/apis-arkui/arkui-ts/figures/edgewidths.png"
#define PARAM_100 100
#define HEIGHT_PERCENT_1 0.6
#define WIDTH_PERCENT_1 0.5
#define ARR_LEN 4
#define ARR_FIRST 500
#define ARR_SECOND 1500
#define ARR_THIRD 1000
#define ARR_FOURTH 3000
#define AUTOPLAYTEXT_LEN 100
namespace ArkUICapiTest {
ArkUI_DrawableDescriptor *descriptorAnimated001;
ArkUI_NodeHandle image001;
ArkUI_NodeHandle text001;
ArkUI_NodeHandle text002;
ArkUI_NodeHandle text003;
ArkUI_NodeHandle text004;
ArkUI_NodeHandle text005;
ArkUI_NodeHandle text006;
ArkUI_DrawableDescriptor_AnimationController *controller001;

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "animationControllerTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
            "animationControllerTest", "OnEventReceive:1111 event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "animationControllerTest", "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CUSTOM_EVENT_1_ID) {
        auto ret = OH_ArkUI_DrawableDescriptor_CreateAnimationController(descriptorAnimated001,
            image001, &controller001);
        auto start = OH_ArkUI_DrawableDescriptor_StartAnimation(controller001);
        DrawableDescriptor_AnimationStatus getStatus =
            DrawableDescriptor_AnimationStatus::DRAWABLE_DESCRIPTOR_ANIMATION_STATUS_INITIAL;
        auto retGetStatus = OH_ArkUI_DrawableDescriptor_GetAnimationStatus(controller001, &getStatus);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "animationControllerTest",
            "ImageGetStatus OH_ArkUI_DrawableDescriptor_GetAnimationStatus getStatus = %{public}d ,ret = %{public}d",
            static_cast<int32_t>(getStatus), retGetStatus);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "animationControllerTest",
            "ret = %{public}d", ret);
        std::string statusText1 = "err.Node1 = " + std::to_string(ret);
        ArkUI_AttributeItem valueItem1 = { .string = statusText1.c_str() };
        nodeAPI->setAttribute(text001, NODE_TEXT_CONTENT, &valueItem1);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "animationControllerTest",
            "start = %{public}d", start);
        std::string statusText2 = "err.Node2 = " + std::to_string(start);
        ArkUI_AttributeItem valueItem2 = { .string = statusText2.c_str() };
        nodeAPI->setAttribute(text002, NODE_TEXT_CONTENT, &valueItem2);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "animationControllerTest",
            "retGetStatus = %{public}d", retGetStatus);
        std::string statusText3 = "err.Node3 = " + std::to_string(retGetStatus);
        ArkUI_AttributeItem valueItem3 = { .string = statusText3.c_str() };
        nodeAPI->setAttribute(text003, NODE_TEXT_CONTENT, &valueItem3);
    }
    if (eventId == ON_CUSTOM_EVENT_2_ID) {
        auto ret = OH_ArkUI_DrawableDescriptor_CreateAnimationController(descriptorAnimated001,
            image001, &controller001);
        auto stop = OH_ArkUI_DrawableDescriptor_StopAnimation(controller001);
        DrawableDescriptor_AnimationStatus getStatus =
            DrawableDescriptor_AnimationStatus::DRAWABLE_DESCRIPTOR_ANIMATION_STATUS_STOPPED;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "animationControllerTest", "stop = %{public}d", stop);
        std::string statusText4 = "err.Node4 = " + std::to_string(stop);
        ArkUI_AttributeItem valueItem4 = { .string = statusText4.c_str() };
        nodeAPI->setAttribute(text004, NODE_TEXT_CONTENT, &valueItem4);
    }
    if (eventId == ON_CUSTOM_EVENT_3_ID) {
        auto pause = OH_ArkUI_DrawableDescriptor_PauseAnimation(controller001);
        DrawableDescriptor_AnimationStatus getStatus =
        DrawableDescriptor_AnimationStatus::DRAWABLE_DESCRIPTOR_ANIMATION_STATUS_PAUSED;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "animationControllerTest", "pause = %{public}d", pause);
        std::string statusText5 = "err.Node5 = " + std::to_string(pause);
        ArkUI_AttributeItem valueItem5 = { .string = statusText5.c_str() };
        nodeAPI->setAttribute(text005, NODE_TEXT_CONTENT, &valueItem5);
    }
    if (eventId == ON_CUSTOM_EVENT_4_ID) {
        auto resume = OH_ArkUI_DrawableDescriptor_ResumeAnimation(controller001);
        DrawableDescriptor_AnimationStatus getStatus =
        DrawableDescriptor_AnimationStatus::DRAWABLE_DESCRIPTOR_ANIMATION_STATUS_RUNNING;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "animationControllerTest", "resume = %{public}d", resume);
        std::string statusText6 = "err.Node6 = " + std::to_string(resume);
        ArkUI_AttributeItem valueItem6 = { .string = statusText6.c_str() };
        nodeAPI->setAttribute(text006, NODE_TEXT_CONTENT, &valueItem6);
    }
}
napi_value AnimationControllerTest::animationControllerTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "animationControllerTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "animationControllerTest",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue columnPercentWith[] = { { .f32 = WIDTH_PERCENT_1 } };
    ArkUI_AttributeItem columnPercentWithItem = { columnPercentWith,
        sizeof(columnPercentWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &columnPercentWithItem);
    ArkUI_NumberValue columnPercentHeight[] = { { .f32 = HEIGHT_PERCENT_1 } };
    ArkUI_AttributeItem columnPercentHeightItem = { columnPercentHeight,
        sizeof(columnPercentHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &columnPercentHeightItem);

    image001 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
   
    ArkUI_NumberValue width_value[] = {{.f32 = 80}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue height_value[] = {{.f32 = 80}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue borderWidth_value[] = {{.f32 = 2}};
    ArkUI_AttributeItem borderWidth_value_item = {borderWidth_value,
        sizeof(borderWidth_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(image001, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(image001, NODE_HEIGHT, &height_item);
    nodeAPI->setAttribute(image001, NODE_MARGIN, &margin_item);
    nodeAPI->setAttribute(image001, NODE_BORDER_WIDTH, &borderWidth_value_item);
 
    text001 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text002 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text003 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text004 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text005 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text006 = nodeAPI->createNode(ARKUI_NODE_TEXT);

    OH_PixelmapNativeHandle pixelMap = nullptr;
    OH_PixelmapNativeHandle pixelMap1 = nullptr;
    OH_PixelmapNativeHandle pixelMap2 = nullptr;
    OH_PixelmapNativeHandle pixelMap3 = nullptr;
    OH_PixelmapNativeHandle array[PARAM_4];
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + PARAM_1;
    }

    uint8_t data1[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data1[i] = uint8_t(0);
        data1[i + PARAM_1] = uint8_t(i + PARAM_1);
        data1[i + PARAM_2] = uint8_t(i + PARAM_2);
        data1[i + PARAM_3] = uint8_t(PARAM_255);
    }

    uint8_t data2[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data2[i] = uint8_t(0);
        data2[i + PARAM_1] = uint8_t(i + PARAM_3);
        data2[i + PARAM_2] = uint8_t(PARAM_255);
        data2[i + PARAM_3] = uint8_t(i + PARAM_4);
    }

    uint8_t data3[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data3[i] = uint8_t(0);
        data3[i + PARAM_1] = uint8_t(PARAM_255);
        data3[i + PARAM_1] = uint8_t(i + PARAM_5);
        data3[i + PARAM_3] = uint8_t(i + PARAM_6);
    }
    
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, SIZE_200);
    OH_PixelmapInitializationOptions_SetHeight(options, SIZE_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    
    OH_PixelmapNative_Rotate(pixelMap, PARAM_90_POINT_0);
    OH_PixelmapNative_Opacity(pixelMap, PARAM_0_POINT_2);
    OH_PixelmapNative_Scale(pixelMap, PARAM_0_POINT_8, PARAM_1_POINT_0);
    OH_PixelmapNative_Flip(pixelMap, true, true);
    OH_PixelmapNative_Rotate(pixelMap2, PARAM_180_POINT_0);
    OH_PixelmapNative_Rotate(pixelMap3, PARAM_270_POINT_0);
    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelMap);
    OH_PixelmapNative_CreatePixelmap(data1, dataSize, options, &pixelMap1);
    OH_PixelmapNative_CreatePixelmap(data2, dataSize, options, &pixelMap2);
    OH_PixelmapNative_CreatePixelmap(data3, dataSize, options, &pixelMap3);
    
    array[PARAM_0] = pixelMap;
    array[PARAM_1] = pixelMap1;
    array[PARAM_2] = pixelMap2;
    array[PARAM_3] = pixelMap3;
    
    descriptorAnimated001 = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, PARAM_4);
    OH_ArkUI_DrawableDescriptor_SetAnimationIteration(descriptorAnimated001, -1);
    
    uint32_t arr[4];
    arr[PARAM_0] = ARR_FIRST;
    arr[PARAM_1] = ARR_SECOND;
    arr[PARAM_2] = ARR_THIRD;
    arr[PARAM_3] = ARR_FOURTH;
    OH_ArkUI_DrawableDescriptor_SetAnimationFrameDurations(descriptorAnimated001, arr, ARR_LEN);
    
    ArkUI_AttributeItem item1 = {.object = descriptorAnimated001};

    auto flex = nodeAPI->createNode(ARKUI_NODE_FLEX);
    nodeAPI->addChild(column, flex);

    auto button = CreateButton("Start", COLOR_RED);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, ON_CUSTOM_EVENT_1_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    ArkUI_AttributeItem ButtonId1 = {.string = "Button1"};
    nodeAPI->setAttribute(button, NODE_ID, &ButtonId1);
    nodeAPI->addChild(flex, button);

    auto button2 = CreateButton("Stop", COLOR_BLUE);
    nodeAPI->registerNodeEvent(button2, NODE_ON_CLICK, ON_CUSTOM_EVENT_2_ID, nullptr);
    ArkUI_AttributeItem ButtonId2 = {.string = "Button2"};
    nodeAPI->setAttribute(button2, NODE_ID, &ButtonId2);
    nodeAPI->addChild(flex, button2);

    auto button3 = CreateButton("Pause", COLOR_GREEN);
    nodeAPI->registerNodeEvent(button3, NODE_ON_CLICK, ON_CUSTOM_EVENT_3_ID, nullptr);
    ArkUI_AttributeItem ButtonId3 = {.string = "Button3"};
    nodeAPI->setAttribute(button3, NODE_ID, &ButtonId3);
    nodeAPI->addChild(flex, button3);

    auto button4 = CreateButton("Resume", COLOR_YELLOW);
    nodeAPI->registerNodeEvent(button4, NODE_ON_CLICK, ON_CUSTOM_EVENT_4_ID, nullptr);
    ArkUI_AttributeItem ButtonId4 = {.string = "Button4"};
    nodeAPI->setAttribute(button4, NODE_ID, &ButtonId4);
    nodeAPI->addChild(flex, button4);
    auto ret = OH_ArkUI_DrawableDescriptor_CreateAnimationController(descriptorAnimated001, image001, &controller001);

    nodeAPI->setAttribute(image001, NODE_IMAGE_SRC, &item1);

    nodeAPI->addChild(column, image001);
    ArkUI_AttributeItem imageId1 = {.string = "image001"};
    nodeAPI->setAttribute(image001, NODE_ID, &imageId1);
    nodeAPI->addChild(column, text001);
    ArkUI_AttributeItem textId1 = {.string = "text001"};
    nodeAPI->setAttribute(text001, NODE_ID, &textId1);
    nodeAPI->addChild(column, text002);
    ArkUI_AttributeItem textId2 = {.string = "text002"};
    nodeAPI->setAttribute(text002, NODE_ID, &textId2);
    nodeAPI->addChild(column, text003);
    ArkUI_AttributeItem textId3 = {.string = "text003"};
    nodeAPI->setAttribute(text003, NODE_ID, &textId3);
    nodeAPI->addChild(column, text004);
    ArkUI_AttributeItem textId4 = {.string = "text004"};
    nodeAPI->setAttribute(text004, NODE_ID, &textId4);
    nodeAPI->addChild(column, text005);
    ArkUI_AttributeItem textId5 = {.string = "text005"};
    nodeAPI->setAttribute(text005, NODE_ID, &textId5);
    nodeAPI->addChild(column, text006);
    ArkUI_AttributeItem textId6 = {.string = "text006"};
    nodeAPI->setAttribute(text006, NODE_ID, &textId6);
    
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
            "animationControllerTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
ArkUI_NodeHandle AnimationControllerTest::CreateButton(std::string text, uint32_t color)
{
    auto btn = new ButtonComponent();
    btn->SetLabel(text);
    btn->SetWidth(SIZE_100);
    btn->SetMargin(DEFAULT_MARGIN);
    btn->SetBackgroundColor(color);
    return btn->GetComponent();
}
}