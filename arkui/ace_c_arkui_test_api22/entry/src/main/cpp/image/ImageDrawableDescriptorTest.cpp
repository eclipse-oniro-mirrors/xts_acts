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

#include "ImageDrawableDescriptorTest.h"
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
ArkUI_DrawableDescriptor *descriptorAnimated1;
ArkUI_DrawableDescriptor *descriptorAnimated2;
ArkUI_NodeHandle image1;
ArkUI_NodeHandle image2;
ArkUI_NodeHandle text1;
ArkUI_NodeHandle text2;
ArkUI_NodeHandle text3;
ArkUI_NodeHandle text4;
ArkUI_NodeHandle text5;
ArkUI_NodeHandle text6;
ArkUI_NodeHandle text7;
ArkUI_NodeHandle text8;
ArkUI_DrawableDescriptor_AnimationController *controller1;
ArkUI_DrawableDescriptor_AnimationController *controller2;

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
            "ImageDrawableDescriptorTest", "OnEventReceive:1111 event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "ImageDrawableDescriptorTest", "OnEventReceive2222 eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CUSTOM_EVENT_1_ID) {
        OH_ArkUI_DrawableDescriptor_CreateAnimationController(descriptorAnimated1, image1, &controller1);
        OH_ArkUI_DrawableDescriptor_StartAnimation(controller1);
        DrawableDescriptor_AnimationStatus getStatus =
            DrawableDescriptor_AnimationStatus::DRAWABLE_DESCRIPTOR_ANIMATION_STATUS_INITIAL;
        auto retGetStatus = OH_ArkUI_DrawableDescriptor_GetAnimationStatus(controller1, &getStatus);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest",
            "ImageGetStatus OH_ArkUI_DrawableDescriptor_GetAnimationStatus getStatus = %{public}d ,ret = %{public}d",
            static_cast<int32_t>(getStatus), retGetStatus);
        std::string statusText1 = "getStatus = " + std::to_string(static_cast<int32_t>(getStatus));
        ArkUI_AttributeItem valueItem2 = { .string = statusText1.c_str() };
        nodeAPI->setAttribute(text2, NODE_TEXT_CONTENT, &valueItem2);
    }
    if (eventId == ON_CUSTOM_EVENT_2_ID) {
        OH_ArkUI_DrawableDescriptor_CreateAnimationController(descriptorAnimated1, image1, &controller1);
        OH_ArkUI_DrawableDescriptor_StopAnimation(controller1);
        DrawableDescriptor_AnimationStatus getStatus =
            DrawableDescriptor_AnimationStatus::DRAWABLE_DESCRIPTOR_ANIMATION_STATUS_STOPPED;
        auto retGetStatus = OH_ArkUI_DrawableDescriptor_GetAnimationStatus(controller1, &getStatus);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest",
                     "OH_ArkUI_DrawableDescriptor_GetAnimationStatus getStatus = %{public}d ,ret = %{public}d",
                     static_cast<int32_t>(getStatus), retGetStatus);
        OH_ArkUI_DrawableDescriptor_DisposeAnimationController(controller1);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest",
                     "OH_ArkUI_DrawableDescriptor_DisposeAnimationController isDispose = %{public}d",
                     controller1 == nullptr);
        std::string statusText2 = "getStatus = " + std::to_string(static_cast<int32_t>(getStatus));
        ArkUI_AttributeItem valueItem3 = { .string = statusText2.c_str() };
        nodeAPI->setAttribute(text3, NODE_TEXT_CONTENT, &valueItem3);
    }
    if (eventId == ON_CUSTOM_EVENT_3_ID) {
        OH_ArkUI_DrawableDescriptor_CreateAnimationController(descriptorAnimated1, image1, &controller1);
        OH_ArkUI_DrawableDescriptor_PauseAnimation(controller1);
        DrawableDescriptor_AnimationStatus getStatus =
        DrawableDescriptor_AnimationStatus::DRAWABLE_DESCRIPTOR_ANIMATION_STATUS_PAUSED;
        auto retGetStatus = OH_ArkUI_DrawableDescriptor_GetAnimationStatus(controller1, &getStatus);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest",
                     "OH_ArkUI_DrawableDescriptor_GetAnimationStatus getStatus = %{public}d ,ret = %{public}d",
                     static_cast<int32_t>(getStatus), retGetStatus);
        OH_ArkUI_DrawableDescriptor_DisposeAnimationController(controller1);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest",
                     "OH_ArkUI_DrawableDescriptor_DisposeAnimationController isDispose = %{public}d",
                     controller1 == nullptr);
        std::string statusText3 = "getStatus = " + std::to_string(static_cast<int32_t>(getStatus));
        ArkUI_AttributeItem valueItem4 = { .string = statusText3.c_str() };
        nodeAPI->setAttribute(text4, NODE_TEXT_CONTENT, &valueItem4);
    }
    if (eventId == ON_CUSTOM_EVENT_4_ID) {
        OH_ArkUI_DrawableDescriptor_CreateAnimationController(descriptorAnimated1, image1, &controller1);
        OH_ArkUI_DrawableDescriptor_ResumeAnimation(controller1);
        DrawableDescriptor_AnimationStatus getStatus =
        DrawableDescriptor_AnimationStatus::DRAWABLE_DESCRIPTOR_ANIMATION_STATUS_RUNNING;
        auto retGetStatus = OH_ArkUI_DrawableDescriptor_GetAnimationStatus(controller1, &getStatus);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest",
                     "OH_ArkUI_DrawableDescriptor_GetAnimationStatus getStatus = %{public}d ,ret = %{public}d",
                     static_cast<int32_t>(getStatus), retGetStatus);
        std::string statusText4 = "getStatus = " + std::to_string(static_cast<int32_t>(getStatus));
        ArkUI_AttributeItem valueItem5 = { .string = statusText4.c_str() };
        nodeAPI->setAttribute(text5, NODE_TEXT_CONTENT, &valueItem5);
    }
    if (eventId == ON_CUSTOM_EVENT_5_ID) {
        uint32_t getArr[PARAM_4];
        size_t getSize = 4;
        auto retGetFrame = OH_ArkUI_DrawableDescriptor_GetAnimationFrameDurations(descriptorAnimated1,
            getArr, &getSize);
        std::string interStr = "";
        for (int i = 0; i < getSize; i++) {
            interStr += std::to_string(getArr[i])+",";
        }
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest",
                     "OH_ArkUI_DrawableDescriptor_GetAnimationFrameDurations durations = %{public}s size = "
                     "%{public}zu ret = %{public}d",
                     interStr.c_str(), getSize, retGetFrame);
        ArkUI_AttributeItem valueItem1 = { .string = interStr.c_str() };
        nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &valueItem1);
    }
    if (eventId == ON_CUSTOM_EVENT_6_ID) {
        uint32_t getArr[PARAM_4];
        size_t getSize = 4;
        auto retGetFrame = OH_ArkUI_DrawableDescriptor_GetAnimationFrameDurations(descriptorAnimated2,
            getArr, &getSize);
        std::string interStr = "";
        for (int i = 0; i < getSize; i++) {
            interStr += std::to_string(getArr[i])+",";
        }
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest",
                     "OH_ArkUI_DrawableDescriptor_GetAnimationFrameDurations durations = %{public}s size = "
                     "%{public}zu ret = %{public}d",
                     interStr.c_str(), getSize, retGetFrame);
        ArkUI_AttributeItem valueItem1 = { .string = interStr.c_str() };
        nodeAPI->setAttribute(text8, NODE_TEXT_CONTENT, &valueItem1);
    }
}
napi_value ImageDrawableDescriptorTest::imageDrawableDescriptorTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest",
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

    image1 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    image2 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    ArkUI_NumberValue width_value[] = {{.f32 = 80}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue height_value[] = {{.f32 = 80}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue borderWidth_value[] = {{.f32 = 2}};
    ArkUI_AttributeItem borderWidth_value_item = {borderWidth_value,
        sizeof(borderWidth_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(image1, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(image1, NODE_HEIGHT, &height_item);
    nodeAPI->setAttribute(image1, NODE_MARGIN, &margin_item);
    nodeAPI->setAttribute(image1, NODE_BORDER_WIDTH, &borderWidth_value_item);
    nodeAPI->setAttribute(image2, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(image2, NODE_HEIGHT, &height_item);
    nodeAPI->setAttribute(image2, NODE_MARGIN, &margin_item);
    nodeAPI->setAttribute(image2, NODE_BORDER_WIDTH, &borderWidth_value_item);
    
    text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text3 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text4 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text5 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text6 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text7 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    text8 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = " ";

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
    
    descriptorAnimated1 = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, PARAM_4);
    OH_ArkUI_DrawableDescriptor_SetAnimationIteration(descriptorAnimated1, -1);
    descriptorAnimated2 = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, PARAM_4);
    OH_ArkUI_DrawableDescriptor_SetAnimationIteration(descriptorAnimated2, -1);
    
    uint32_t arr[4];
    arr[PARAM_0] = ARR_FIRST;
    arr[PARAM_1] = ARR_SECOND;
    arr[PARAM_2] = ARR_THIRD;
    arr[PARAM_3] = ARR_FOURTH;
    OH_ArkUI_DrawableDescriptor_SetAnimationFrameDurations(descriptorAnimated1, arr, ARR_LEN);
    uint32_t autoPlay1 = 1;
    OH_ArkUI_DrawableDescriptor_SetAnimationAutoPlay(descriptorAnimated1, autoPlay1);
    OH_ArkUI_DrawableDescriptor_CreateAnimationController(descriptorAnimated1, image1, &controller1);
    uint32_t autoPlay2 = 0;
    OH_ArkUI_DrawableDescriptor_SetAnimationAutoPlay(descriptorAnimated2, autoPlay2);
    OH_ArkUI_DrawableDescriptor_SetAnimationAutoPlay(descriptorAnimated2, autoPlay2);
    OH_ArkUI_DrawableDescriptor_SetAnimationFrameDurations(descriptorAnimated2, nullptr, ARR_LEN);
    ArkUI_AttributeItem item1 = {.object = descriptorAnimated1};
    ArkUI_AttributeItem item2 = {.object = descriptorAnimated2};

    auto flex = nodeAPI->createNode(ARKUI_NODE_FLEX);
    auto flex1 = nodeAPI->createNode(ARKUI_NODE_FLEX);
    nodeAPI->addChild(column, flex);
    nodeAPI->addChild(column, flex1);
    auto button = CreateButton("Start", COLOR_RED);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, ON_CUSTOM_EVENT_1_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    ArkUI_AttributeItem ButtonId2 = {.string = "Button002"};
    nodeAPI->setAttribute(button, NODE_ID, &ButtonId2);
    nodeAPI->addChild(flex, button);

    auto button2 = CreateButton("Stop", COLOR_BLUE);
    nodeAPI->registerNodeEvent(button2, NODE_ON_CLICK, ON_CUSTOM_EVENT_2_ID, nullptr);
    ArkUI_AttributeItem ButtonId3 = {.string = "Button003"};
    nodeAPI->setAttribute(button2, NODE_ID, &ButtonId3);
    nodeAPI->addChild(flex, button2);

    auto button3 = CreateButton("Pause", COLOR_GREEN);
    nodeAPI->registerNodeEvent(button3, NODE_ON_CLICK, ON_CUSTOM_EVENT_3_ID, nullptr);
    ArkUI_AttributeItem ButtonId4 = {.string = "Button004"};
    nodeAPI->setAttribute(button3, NODE_ID, &ButtonId4);
    nodeAPI->addChild(flex, button3);

    auto button4 = CreateButton("Resume", COLOR_YELLOW);
    nodeAPI->registerNodeEvent(button4, NODE_ON_CLICK, ON_CUSTOM_EVENT_4_ID, nullptr);
    ArkUI_AttributeItem ButtonId5 = {.string = "Button005"};
    nodeAPI->setAttribute(button4, NODE_ID, &ButtonId5);
    nodeAPI->addChild(flex, button4);
    
    auto button5 = CreateButton("GetDurations", COLOR_GREY);
    nodeAPI->registerNodeEvent(button5, NODE_ON_CLICK, ON_CUSTOM_EVENT_5_ID, nullptr);
    ArkUI_AttributeItem ButtonId1 = {.string = "Button001"};
    nodeAPI->setAttribute(button5, NODE_ID, &ButtonId1);
    nodeAPI->addChild(flex1, button5);

    auto button6 = CreateButton("GetDurations1", COLOR_GREY);
    nodeAPI->registerNodeEvent(button6, NODE_ON_CLICK, ON_CUSTOM_EVENT_6_ID, nullptr);
    ArkUI_AttributeItem ButtonId6 = {.string = "Button006"};
    nodeAPI->setAttribute(button6, NODE_ID, &ButtonId6);
    nodeAPI->addChild(flex1, button6);

    nodeAPI->setAttribute(image1, NODE_IMAGE_SRC, &item1);
    nodeAPI->setAttribute(image2, NODE_IMAGE_SRC, &item2);
    nodeAPI->addChild(column, image1);
    ArkUI_AttributeItem imageId1 = {.string = "image001"};
    nodeAPI->setAttribute(image1, NODE_ID, &imageId1);
    nodeAPI->addChild(column, text1);
    ArkUI_AttributeItem textId1 = {.string = "text001"};
    nodeAPI->setAttribute(text1, NODE_ID, &textId1);
    nodeAPI->addChild(column, text2);
    ArkUI_AttributeItem textId2 = {.string = "text002"};
    nodeAPI->setAttribute(text2, NODE_ID, &textId2);
    nodeAPI->addChild(column, text3);
    ArkUI_AttributeItem textId3 = {.string = "text003"};
    nodeAPI->setAttribute(text3, NODE_ID, &textId3);
    nodeAPI->addChild(column, text4);
    ArkUI_AttributeItem textId4 = {.string = "text004"};
    nodeAPI->setAttribute(text4, NODE_ID, &textId4);
    nodeAPI->addChild(column, text5);
    ArkUI_AttributeItem textId5 = {.string = "text005"};
    nodeAPI->setAttribute(text5, NODE_ID, &textId5);
    ArkUI_AttributeItem textId8 = {.string = "text008"};
    nodeAPI->setAttribute(text8, NODE_ID, &textId8);
    nodeAPI->addChild(column, text8);
    nodeAPI->addChild(column, image2);
    
    OH_ArkUI_DrawableDescriptor_CreateAnimationController(descriptorAnimated2, image2, &controller2);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    auto retGetAutoPlay1 = OH_ArkUI_DrawableDescriptor_GetAnimationAutoPlay(descriptorAnimated1, &autoPlay1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest",
                 "Image001 OH_ArkUI_DrawableDescriptor_GetAnimationAutoPlay AutoPlay = %{public}d ret = %{public}d",
                 autoPlay1, retGetAutoPlay1);
    auto retGetAutoPlay2 = OH_ArkUI_DrawableDescriptor_GetAnimationAutoPlay(descriptorAnimated2, &autoPlay2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDrawableDescriptorTest",
                 "Image002 OH_ArkUI_DrawableDescriptor_GetAnimationAutoPlay AutoPlay = %{public}d ret = %{public}d",
                 autoPlay2, retGetAutoPlay2);
    std::string autoPlayText5 = "AutoPlay = " + std::to_string(static_cast<int32_t>(autoPlay1));
    ArkUI_AttributeItem valueItem6 = { .string = autoPlayText5.c_str() };
    nodeAPI->setAttribute(text6, NODE_TEXT_CONTENT, &valueItem6);
    std::string autoPlayText6 = "AutoPlay = " + std::to_string(static_cast<int32_t>(autoPlay2));
    ArkUI_AttributeItem valueItem7 = { .string = autoPlayText6.c_str() };
    nodeAPI->setAttribute(text7, NODE_TEXT_CONTENT, &valueItem7);

    nodeAPI->addChild(column, text6);
    ArkUI_AttributeItem textId6 = {.string = "text006"};
    nodeAPI->setAttribute(text6, NODE_ID, &textId6);
    nodeAPI->addChild(column, text7);
    ArkUI_AttributeItem textId7 = {.string = "text007"};
    nodeAPI->setAttribute(text7, NODE_ID, &textId7);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
            "ImageAltTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
ArkUI_NodeHandle ImageDrawableDescriptorTest::CreateButton(std::string text, uint32_t color)
{
    auto btn = new ButtonComponent();
    btn->SetLabel(text);
    btn->SetWidth(SIZE_100);
    btn->SetMargin(DEFAULT_MARGIN);
    btn->SetBackgroundColor(color);
    return btn->GetComponent();
}
}