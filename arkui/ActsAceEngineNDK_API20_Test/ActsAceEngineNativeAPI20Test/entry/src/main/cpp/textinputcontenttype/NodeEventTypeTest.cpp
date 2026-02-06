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
#include "arkui/drawable_descriptor.h"
#include <cstdint>

namespace TextInputContentTypeTest {
static int32_t g_nodeeventtype1 = 1;
static int32_t g_nodeeventtype2 = 1;
static int32_t g_nodeeventtype3 = 1;
static int32_t g_nodeeventtype4 = 1;
static int32_t g_nodeeventtype5 = 1;
static int32_t g_nodeeventtype6 = 1;
static int32_t g_nodeeventtype7 = 1;
static int32_t g_nodeeventtype8 = 1;
static int32_t g_nodeeventtype9 = 1;
static int32_t g_nodeeventtype10 = 1;
static int32_t g_nodeeventtype11 = 1;
static int32_t g_nodeeventtype12 = 1;
static int32_t g_nodeeventtype13 = 1;
static int32_t g_nodeeventtype14 = 1;
static int32_t g_nodeeventtype15 = 1;
void onReceiver1(ArkUI_NodeEvent *event)
{
    const ArkUI_NodeEventType eventtype = OH_ArkUI_NodeEvent_GetEventType(event);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "eventtype", "CreateNativeNode: %{public}d", eventtype);
    if (eventtype == NODE_EVENT_ON_ATTACH) {
        g_nodeeventtype1 = 0;
    } else if (eventtype  == NODE_EVENT_ON_ATTACH) {
        g_nodeeventtype2 = 0;
    } else if (eventtype  == NODE_VISIBLE_AREA_APPROXIMATE_CHANGE_EVENT) {
        g_nodeeventtype3 = 0;
    } else if (eventtype  == NODE_ON_HOVER_MOVE) {
        g_nodeeventtype4 = 0;
    } else if (eventtype  == NODE_TEXT_ON_DETECT_RESULT_UPDATE) {
        g_nodeeventtype5 = 0;
    } else if (eventtype  == NODE_TEXT_SPAN_ON_LONG_PRESS) {
        g_nodeeventtype6 = 0;
    } else if (eventtype  == NODE_IMAGE_ON_ERROR) {
        g_nodeeventtype7 = 0;
    } else if (eventtype  == NODE_TEXT_INPUT_ON_WILL_CHANGE) {
        g_nodeeventtype8 = 0;
    } else if (eventtype  == NODE_TEXT_AREA_ON_WILL_CHANGE) {
        g_nodeeventtype9 = 0;
    } else if (eventtype  == NODE_TEXT_PICKER_EVENT_ON_SCROLL_STOP) {
        g_nodeeventtype10 = 0;
    } else if (eventtype  == NODE_CHECKBOX_GROUP_EVENT_ON_CHANGE) {
        g_nodeeventtype11 = 0;
    } else if (eventtype  == NODE_SWIPER_EVENT_ON_UNSELECTED) {
        g_nodeeventtype12 = 0;
    } else if (eventtype  == NODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL) {
        g_nodeeventtype13 = 0;
    } else if (eventtype  == NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED) {
        g_nodeeventtype14 = 0;
    } else if (eventtype  == NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE) {
        g_nodeeventtype15 = 0;
    }
    return;
}
ArkUI_NodeHandle CreateColumnNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    ArkUI_NumberValue width[] = {{ .f32 = PARAM_1_POINT_0 }};
    ArkUI_AttributeItem item1 = {.value = width, .size = PARAM_1};
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &item1);
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &item1);
    
    ArkUI_NumberValue value[] = {{ .u32 = 0xFFFF0000 }};
    ArkUI_AttributeItem coloritem = {.value = value, .size = PARAM_1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &coloritem);
    
    nodeAPI->registerNodeEvent(column, NODE_ON_HOVER_MOVE, PARAM_1, nullptr);
    
    return column;
}

void CreateRowAndButtonNodes(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
{
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    
    nodeAPI->registerNodeEvent(row, NODE_EVENT_ON_ATTACH, PARAM_1, nullptr);
    nodeAPI->registerNodeEvent(row, NODE_EVENT_ON_DETACH, PARAM_1, nullptr);
    nodeAPI->registerNodeEvent(button, NODE_EVENT_ON_DETACH, PARAM_1, nullptr);
    
    nodeAPI->addChild(column, row);
    nodeAPI->addChild(column, list);
    nodeAPI->addChild(row, button);
    
    ArkUI_NumberValue buttonvalue[] = {{ .u32 = 0xFF0000FF }};
    ArkUI_AttributeItem buttoncoloritem = {.value = buttonvalue, .size = PARAM_1};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &buttoncoloritem);
    
    nodeAPI->removeChild(row, button);
    nodeAPI->addNodeEventReceiver(row, onReceiver1);
    nodeAPI->addNodeEventReceiver(button, onReceiver1);
}

void CreateTextNode(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
{
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text);
    
    nodeAPI->registerNodeEvent(text, NODE_TEXT_ON_DETECT_RESULT_UPDATE, 1, nullptr);
    nodeAPI->registerNodeEvent(text, NODE_VISIBLE_AREA_APPROXIMATE_CHANGE_EVENT, 1, nullptr);
    
    ArkUI_NumberValue textwidth[] = {{ .f32 = PARAM_100 }};
    ArkUI_AttributeItem textitem1 = {.value = textwidth, .size = PARAM_1};
    nodeAPI->setAttribute(text, NODE_WIDTH, &textitem1);
    nodeAPI->setAttribute(text, NODE_HEIGHT, &textitem1);
    
    ArkUI_AttributeItem item3 = {.string = "手机号码：15535573557" };
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &item3);
    
    ArkUI_NumberValue value2[] = {{ .i32 = ARKUI_TEXT_DATA_DETECTOR_TYPE_PHONE_NUMBER }};
    ArkUI_AttributeItem item2 = {.value = value2, .size = PARAM_1};
    nodeAPI->setAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG, &item2);
    
    ArkUI_NumberValue value22[] = {{ .i32 = true }};
    ArkUI_AttributeItem item22 = {.value = value22, .size = PARAM_1};
    nodeAPI->setAttribute(text, NODE_TEXT_ENABLE_DATA_DETECTOR, &item22);
    
    auto options = OH_ArkUI_VisibleAreaEventOptions_Create();
    int32_t size = PARAM_2;
    float optionsvalue = PARAM_1_POINT_0;
    OH_ArkUI_VisibleAreaEventOptions_SetRatios(options, &optionsvalue, size);
    ArkUI_AttributeItem textitem3 = {.object = options};
    nodeAPI->setAttribute(text, NODE_VISIBLE_AREA_APPROXIMATE_CHANGE_RATIO, &textitem3);
    
    nodeAPI->addNodeEventReceiver(text, onReceiver1);
    OH_ArkUI_VisibleAreaEventOptions_Dispose(options);
}

void CreateSpanNode(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
{
    auto span = nodeAPI->createNode(ARKUI_NODE_SPAN);
    auto text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    
    nodeAPI->addChild(column, text1);
    nodeAPI->addChild(text1, span);
    
    nodeAPI->registerNodeEvent(span, NODE_TEXT_SPAN_ON_LONG_PRESS, PARAM_1, nullptr);
    
    ArkUI_NumberValue spanwidth[] = {{ .f32 = PARAM_100 }};
    ArkUI_AttributeItem spanitem1 = {.value = spanwidth, .size = PARAM_1};
    nodeAPI->setAttribute(text1, NODE_WIDTH, &spanitem1);
    nodeAPI->setAttribute(text1, NODE_HEIGHT, &spanitem1);
    nodeAPI->setAttribute(span, NODE_WIDTH, &spanitem1);
    nodeAPI->setAttribute(span, NODE_HEIGHT, &spanitem1);
    
    ArkUI_AttributeItem spaniditem = { .string = "span66", .size = PARAM_1};
    nodeAPI->setAttribute(text1, NODE_ID, &spaniditem);
    
    ArkUI_AttributeItem spanitem11 = { .string = "span6span6span6span6" };
    nodeAPI->setAttribute(span, NODE_SPAN_CONTENT, &spanitem11);
    
    nodeAPI->addNodeEventReceiver(span, onReceiver1);
}

void CreateImageNode(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
{
    auto image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    nodeAPI->addChild(column, image);
    
    nodeAPI->registerNodeEvent(image, NODE_IMAGE_ON_ERROR, PARAM_1, nullptr);
    
    ArkUI_NumberValue imageidth[] = {{ .f32 = PARAM_100 }};
    ArkUI_AttributeItem imageitem1 = {.value = imageidth, .size = PARAM_1};
    nodeAPI->setAttribute(image, NODE_WIDTH, &imageitem1);
    nodeAPI->setAttribute(image, NODE_HEIGHT, &imageitem1);
    
    ArkUI_AttributeItem imageitem = { .string = "image7", .size = PARAM_1};
    nodeAPI->setAttribute(image, NODE_ID, &imageitem);
    
    ArkUI_AttributeItem imagesrc = { .string = "sss" };
    nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &imagesrc);
    
    nodeAPI->addNodeEventReceiver(image, onReceiver1);
}

void CreateTextInputNode(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
{
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    nodeAPI->addChild(column, textinput);
    
    ArkUI_AttributeItem textinputitem = { .string = "textinput8", .size = PARAM_1 };
    nodeAPI->setAttribute(textinput, NODE_ID, &textinputitem);
    
    ArkUI_NumberValue textinputvalue[] = {{ .u32 = 0xFF0000FF }};
    ArkUI_AttributeItem textinputcoloritem = {.value = textinputvalue, .size = 1};
    nodeAPI->setAttribute(textinput, NODE_BACKGROUND_COLOR, &textinputcoloritem);
    
    nodeAPI->registerNodeEvent(textinput, NODE_TEXT_INPUT_ON_WILL_CHANGE, PARAM_1, nullptr);
    nodeAPI->addNodeEventReceiver(textinput, onReceiver1);
}

void CreateTextAreaNode(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
{
    auto textarea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
    nodeAPI->addChild(column, textarea);
    
    ArkUI_AttributeItem textareaitem = { .string = "textarea9", .size = PARAM_1};
    nodeAPI->setAttribute(textarea, NODE_ID, &textareaitem);
    
    ArkUI_NumberValue textareavalue[] = {{ .u32 = 0xFF0000FF }};
    ArkUI_AttributeItem textareacoloritem = {.value = textareavalue, .size = PARAM_1};
    nodeAPI->setAttribute(textarea, NODE_BACKGROUND_COLOR, &textareacoloritem);
    
    nodeAPI->registerNodeEvent(textarea, NODE_TEXT_AREA_ON_WILL_CHANGE, PARAM_1, nullptr);
    nodeAPI->addNodeEventReceiver(textarea, onReceiver1);
}

void CreateCheckboxNode(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
{
    auto checkbox = nodeAPI->createNode(ARKUI_NODE_CHECKBOX_GROUP);
    nodeAPI->addChild(column, checkbox);
    
    nodeAPI->registerNodeEvent(checkbox, NODE_CHECKBOX_GROUP_EVENT_ON_CHANGE, PARAM_1, nullptr);
    
    ArkUI_AttributeItem checkboxitem = { .string = "Checkbox11", .size = PARAM_1 };
    nodeAPI->setAttribute(checkbox, NODE_ID, &checkboxitem);
    
    nodeAPI->addNodeEventReceiver(checkbox, onReceiver1);
}

void CreateTextPickerNode(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
{
    auto textpicker = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    nodeAPI->addChild(column, textpicker);
    
    nodeAPI->registerNodeEvent(textpicker, NODE_TEXT_PICKER_EVENT_ON_SCROLL_STOP, 1, nullptr);
    
    ArkUI_AttributeItem textpickeritem = { .string = "textpicker11", .size = PARAM_1 };
    nodeAPI->setAttribute(textpicker, NODE_ID, &textpickeritem);
    
    ArkUI_NumberValue textpickerwidth[] = {{ .f32 = PARAM_200 }};
    ArkUI_AttributeItem textpickeritem1 = {.value = textpickerwidth, .size = PARAM_1};
    nodeAPI->setAttribute(textpicker, NODE_WIDTH, &textpickeritem1);
    nodeAPI->setAttribute(textpicker, NODE_HEIGHT, &textpickeritem1);
    
    ArkUI_NumberValue itemvalue3[] = {{ .u32 = 0xFFFF00FF }};
    ArkUI_AttributeItem listitem33 = {.value = itemvalue3, .size = PARAM_1};
    nodeAPI->setAttribute(textpicker, NODE_BACKGROUND_COLOR, &listitem33);
    
    ArkUI_NumberValue textpickervalue3[] = {{ .i32 = false }};
    ArkUI_AttributeItem textpickeritem33 = {.value = textpickervalue3, .size = PARAM_1};
    nodeAPI->setAttribute(textpicker, NODE_TEXT_PICKER_CAN_LOOP, &textpickeritem33);
    
    ArkUI_NumberValue textpickervalue[] = { { .i32 = ARKUI_TEXTPICKER_RANGETYPE_SINGLE } };
    ArkUI_AttributeItem textpickercontent = { .value = textpickervalue, .size = PARAM_1, .string = "aaaaa;bbb;ccc" };
    nodeAPI->setAttribute(textpicker, NODE_TEXT_PICKER_OPTION_RANGE, &textpickercontent);
    
    nodeAPI->addNodeEventReceiver(textpicker, onReceiver1);
}
napi_value CreateEventTypeNode(napi_env env, napi_callback_info info)
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
    
    auto column = CreateColumnNode(nodeAPI);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, column);
    
    CreateRowAndButtonNodes(nodeAPI, column);
    CreateTextNode(nodeAPI, column);
    CreateSpanNode(nodeAPI, column);
    CreateImageNode(nodeAPI, column);
    CreateTextInputNode(nodeAPI, column);
    CreateTextAreaNode(nodeAPI, column);
    CreateCheckboxNode(nodeAPI, column);
    CreateTextPickerNode(nodeAPI, column);
    
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
ArkUI_NodeHandle CreateColumnNode1(ArkUI_NativeNodeAPI_1 *nodeAPI)
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

ArkUI_NodeHandle CreateSwiperNode(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
{
    auto swiper = nodeAPI->createNode(ARKUI_NODE_SWIPER);
    nodeAPI->addChild(column, swiper);
    
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
void SetImageAttributes(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle image)
{
    ArkUI_NumberValue width2[] = {{ .f32 = 0.5 }};
    ArkUI_NumberValue height2[] = {{ .f32 = 0.5 }};
    ArkUI_AttributeItem imageitem1 = {.value = width2, .size = 1};
    ArkUI_AttributeItem imageitem2 = {.value = height2, .size = 1};
    
    nodeAPI->setAttribute(image, NODE_WIDTH_PERCENT, &imageitem1);
    nodeAPI->setAttribute(image, NODE_HEIGHT_PERCENT, &imageitem2);
    
    ArkUI_NumberValue height3[] = { { .f32 = PARAM_1_POINT_0 } };
    ArkUI_AttributeItem imageitem3 = {.value = height3, .size = 1};
    nodeAPI->setAttribute(image, NODE_BORDER_WIDTH, &imageitem3);
}

void SetSwiperAttributes(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle swiper)
{
    nodeAPI->registerNodeEvent(swiper, NODE_SWIPER_EVENT_ON_UNSELECTED, 1, nullptr);
    nodeAPI->registerNodeEvent(swiper, NODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL, 1, nullptr);
    nodeAPI->registerNodeEvent(swiper, NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED, 1, nullptr);
    
    ArkUI_NumberValue swipervalue1[] = {{ .i32 = 0 }};
    ArkUI_AttributeItem swipercoloritem1 = {.value = swipervalue1, .size = 1};
    nodeAPI->setAttribute(swiper, NODE_SWIPER_DISABLE_SWIPE, &swipercoloritem1);
    
    ArkUI_NumberValue value4[] = {{ .i32 = 1 }};
    ArkUI_AttributeItem item4 = {.value = value4, .size = 1};
    nodeAPI->setAttribute(swiper, NODE_FOCUSABLE, &item4);
    nodeAPI->setAttribute(swiper, NODE_DEFAULT_FOCUS, &item4);
    
    ArkUI_NumberValue swipervalue2[] = {{ .i32 = 1 }};
    ArkUI_AttributeItem swipercoloritem2 = {.value = swipervalue2, .size = PARAM_1};
    nodeAPI->setAttribute(swiper, NODE_SWIPER_AUTO_PLAY, &swipercoloritem2);
    
    nodeAPI->addNodeEventReceiver(swiper, onReceiver1);
}
void CreateSwiperImages(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle swiper)
{
    auto image1 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    auto image2 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    auto image3 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    
    nodeAPI->addChild(swiper, image1);
    nodeAPI->addChild(swiper, image2);
    nodeAPI->addChild(swiper, image3);
    
    SetImageAttributes(nodeAPI, image1);
    SetImageAttributes(nodeAPI, image2);
    SetImageAttributes(nodeAPI, image3);
    
    ArkUI_NumberValue swipervalue3[] = {{ .u32 = 0xFF00FF00 }};
    ArkUI_AttributeItem swipercoloritem3 = {.value = swipervalue3, .size = 1};
    nodeAPI->setAttribute(image1, NODE_BACKGROUND_COLOR, &swipercoloritem3);
    nodeAPI->setAttribute(image2, NODE_BACKGROUND_COLOR, &swipercoloritem3);
    nodeAPI->setAttribute(image3, NODE_BACKGROUND_COLOR, &swipercoloritem3);
}
napi_value CreateEventTypeNode1(napi_env env, napi_callback_info info)
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
    
    auto column = CreateColumnNode1(nodeAPI);
    auto swiper = CreateSwiperNode(nodeAPI, column);
    CreateSwiperImages(nodeAPI, swiper);
    SetSwiperAttributes(nodeAPI, swiper);
    
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, column);
    
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
void SetListItemAttributes(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle listItem, uint32_t color)
{
    ArkUI_NumberValue width2[] = {{ .f32 = PARAM_0_POINT_9 }};
    ArkUI_NumberValue height2[] = {{ .f32 = PARAM_0_POINT_5 }};
    ArkUI_AttributeItem listItemitem1 = {.value = width2, .size = 1};
    ArkUI_AttributeItem listItemitem2 = {.value = height2, .size = 1};
    
    nodeAPI->setAttribute(listItem, NODE_WIDTH_PERCENT, &listItemitem1);
    nodeAPI->setAttribute(listItem, NODE_HEIGHT_PERCENT, &listItemitem2);
    
    ArkUI_NumberValue itemValue[] = {{ .u32 = color }};
    ArkUI_AttributeItem colorItem = {.value = itemValue, .size = 1};
    nodeAPI->setAttribute(listItem, NODE_BACKGROUND_COLOR, &colorItem);
}
ArkUI_NodeHandle CreateColumnNode2(ArkUI_NativeNodeAPI_1 *nodeAPI)
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

ArkUI_NodeHandle CreateListNode(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
{
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    nodeAPI->addChild(column, list);
    
    nodeAPI->registerNodeEvent(list, NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE, 1, nullptr);
    
    ArkUI_NumberValue width1[] = {{ .f32 = PARAM_0_POINT_9 }};
    ArkUI_NumberValue height1[] = {{ .f32 = PARAM_1_POINT_1 }};
    ArkUI_AttributeItem listitem1 = {.value = width1, .size = 1};
    ArkUI_AttributeItem listitem2 = {.value = height1, .size = 1};
    nodeAPI->setAttribute(list, NODE_WIDTH_PERCENT, &listitem1);
    nodeAPI->setAttribute(list, NODE_HEIGHT_PERCENT, &listitem2);
    
    ArkUI_NumberValue swipervalue[] = {{ .u32 = 0xFF0000FF }};
    ArkUI_AttributeItem swipercoloritem = {.value = swipervalue, .size = 1};
    nodeAPI->setAttribute(list, NODE_BACKGROUND_COLOR, &swipercoloritem);
    
    nodeAPI->addNodeEventReceiver(list, onReceiver1);
    
    return list;
}

void CreateListItems(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    auto listitem1 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto listitem2 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto listitem3 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    
    nodeAPI->addChild(list, listitem1);
    nodeAPI->addChild(list, listitem2);
    nodeAPI->addChild(list, listitem3);
    
    SetListItemAttributes(nodeAPI, listitem1, 0xFF00FFFF);
    SetListItemAttributes(nodeAPI, listitem2, 0xFFFFFFFF);
    SetListItemAttributes(nodeAPI, listitem3, 0xFFFF00FF);
}
napi_value CreateEventTypeNode2(napi_env env, napi_callback_info info)
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
    
    auto column = CreateColumnNode2(nodeAPI);
    auto list = CreateListNode(nodeAPI, column);
    CreateListItems(nodeAPI, list);
    
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, column);
    
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
napi_value CreateEventTypeNode3(napi_env env, napi_callback_info info)
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
    // 1. 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, column);

    ArkUI_NumberValue width[] = {{ .f32 = 1.0 }};
    ArkUI_AttributeItem item1 = {.value = width, .size = 1};
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &item1);
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &item1);
    ArkUI_NumberValue value[] = {{ .u32 = 0xFFFF0000 }};
    ArkUI_AttributeItem coloritem = {.value = value, .size = 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &coloritem);
    
    auto checkbox = nodeAPI->createNode(ARKUI_NODE_CHECKBOX_GROUP);
    nodeAPI->addChild(column, checkbox);
    nodeAPI->registerNodeEvent(checkbox, NODE_CHECKBOX_GROUP_EVENT_ON_CHANGE, 1, nullptr);
    ArkUI_NumberValue value4[] = {{ .i32 = 1 }};
    ArkUI_AttributeItem item4 = {.value = value4, .size = 1};
    nodeAPI->setAttribute(checkbox, NODE_FOCUSABLE, &item4);
    nodeAPI->setAttribute(checkbox, NODE_DEFAULT_FOCUS, &item4);
    nodeAPI->addNodeEventReceiver(checkbox, onReceiver1);
    
    ArkUI_AttributeItem checkboxitem = { .string = "Checkbox11" };
    nodeAPI->setAttribute(checkbox, NODE_ID, &checkboxitem);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value NodeEventTypeTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype1, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype2, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_003(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype3, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_004(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype4, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_005(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype5, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_006(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype6, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_007(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype7, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_008(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype8, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_009(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype9, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_010(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype10, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_011(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype11, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_012(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype12, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_013(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype13, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_014(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype14, &retValue);
    return retValue;
}

napi_value NodeEventTypeTest_015(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodeeventtype15, &retValue);
    return retValue;
}
}