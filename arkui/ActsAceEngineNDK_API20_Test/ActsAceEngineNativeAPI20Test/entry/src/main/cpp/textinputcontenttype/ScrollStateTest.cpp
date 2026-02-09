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

#include "TextInputContentType.h"

namespace TextInputContentTypeTest {
static int32_t g_scrollState1 = 2;
static int32_t g_scrollState2 = 2;
static int32_t g_scrollState3 = 2;

void onReceiver(ArkUI_NodeEvent *event)
{
    const ArkUI_NodeComponentEvent* eventdata = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
    if (eventdata) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "eventdata", "ScrollState: %{public}d",
          eventdata->data[0].i32);
        if (eventdata->data[0].i32 == ARKUI_SCROLL_STATE_IDLE) {
            g_scrollState1 = 0;
        } else if (eventdata->data[0].i32 == ARKUI_SCROLL_STATE_SCROLL) {
            g_scrollState2 = 0;
        } else if (eventdata->data[0].i32 == ARKUI_SCROLL_STATE_FLING) {
            g_scrollState3 = 0;
        }
    }
    return;
}
void SetImageAttributesForScroll(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle image)
{
    ArkUI_NumberValue width2[] = {{ .f32 = PARAM_0_POINT_5 }};
    ArkUI_NumberValue height2[] = {{ .f32 = PARAM_0_POINT_5 }};
    ArkUI_AttributeItem imageitem1 = {.value = width2, .size = 1};
    ArkUI_AttributeItem imageitem2 = {.value = height2, .size = 1};
    
    nodeAPI->setAttribute(image, NODE_WIDTH_PERCENT, &imageitem1);
    nodeAPI->setAttribute(image, NODE_HEIGHT_PERCENT, &imageitem2);
    
    ArkUI_NumberValue height3[] = { { .f32 = PARAM_1_POINT_0 } };
    ArkUI_AttributeItem imageitem3 = {.value = height3, .size = 1};
    nodeAPI->setAttribute(image, NODE_BORDER_WIDTH, &imageitem3);
}

void SetSwiperAttributesForScroll(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle swiper)
{
    ArkUI_NumberValue swipervalue1[] = {{ .i32 = 0 }};
    ArkUI_AttributeItem swipercoloritem1 = {.value = swipervalue1, .size = 1};
    nodeAPI->setAttribute(swiper, NODE_SWIPER_DISABLE_SWIPE, &swipercoloritem1);
    
    ArkUI_NumberValue value4[] = {{ .i32 = 1 }};
    ArkUI_AttributeItem item4 = {.value = value4, .size = 1};
    nodeAPI->setAttribute(swiper, NODE_FOCUSABLE, &item4);
    nodeAPI->setAttribute(swiper, NODE_DEFAULT_FOCUS, &item4);
    
    nodeAPI->addNodeEventReceiver(swiper, onReceiver);
}
ArkUI_NodeHandle CreateColumnNodeForScroll(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    ArkUI_NumberValue width[] = {{ .f32 = PARAM_1_POINT_0 }};
    ArkUI_AttributeItem item = {.value = width, .size = 1};
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &item);
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &item);
    
    ArkUI_NumberValue value[] = {{ .u32 = 0xFFFF0000 }};
    ArkUI_AttributeItem coloritem = {.value = value, .size = 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &coloritem);
    
    return column;
}

ArkUI_NodeHandle CreateSwiperNodeForScroll(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
{
    auto swiper = nodeAPI->createNode(ARKUI_NODE_SWIPER);
    nodeAPI->addChild(column, swiper);
    
    nodeAPI->registerNodeEvent(swiper, NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED, 1, nullptr);
    
    ArkUI_NumberValue width1[] = {{ .f32 = PARAM_0_POINT_9 }};
    ArkUI_NumberValue height1[] = {{ .f32 = PARAM_0_POINT_9 }};
    ArkUI_AttributeItem swiperitem1 = {.value = width1, .size = 1};
    ArkUI_AttributeItem swiperitem2 = {.value = height1, .size = 1};
    nodeAPI->setAttribute(swiper, NODE_WIDTH_PERCENT, &swiperitem1);
    nodeAPI->setAttribute(swiper, NODE_HEIGHT_PERCENT, &swiperitem2);
    
    ArkUI_NumberValue swipervalue[] = {{ .u32 = 0xFF0000FF }};
    ArkUI_AttributeItem swipercoloritem = {.value = swipervalue, .size = 1};
    nodeAPI->setAttribute(swiper, NODE_BACKGROUND_COLOR, &swipercoloritem);
    
    return swiper;
}

void CreateSwiperImagesForScroll(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle swiper)
{
    auto image1 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    auto image2 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    auto image3 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    
    nodeAPI->addChild(swiper, image1);
    nodeAPI->addChild(swiper, image2);
    nodeAPI->addChild(swiper, image3);
    
    SetImageAttributesForScroll(nodeAPI, image1);
    SetImageAttributesForScroll(nodeAPI, image2);
    SetImageAttributesForScroll(nodeAPI, image3);
    
    ArkUI_NumberValue swipervalue3[] = {{ .u32 = 0xFF00FF00 }};
    ArkUI_AttributeItem swipercoloritem3 = {.value = swipervalue3, .size = 1};
    nodeAPI->setAttribute(image1, NODE_BACKGROUND_COLOR, &swipercoloritem3);
    nodeAPI->setAttribute(image2, NODE_BACKGROUND_COLOR, &swipercoloritem3);
    nodeAPI->setAttribute(image3, NODE_BACKGROUND_COLOR, &swipercoloritem3);
}
napi_value GetScrollNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    auto column = CreateColumnNodeForScroll(nodeAPI);
    auto swiper = CreateSwiperNodeForScroll(nodeAPI, column);
    CreateSwiperImagesForScroll(nodeAPI, swiper);
    SetSwiperAttributesForScroll(nodeAPI, swiper);
    
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, column);
    
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ScrollStateTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_scrollState1, &retValue);
    return retValue;
}

napi_value ScrollStateTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_scrollState2, &retValue);
    return retValue;
}

napi_value ScrollStateTest_003(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_scrollState3, &retValue);
    return retValue;
}
}