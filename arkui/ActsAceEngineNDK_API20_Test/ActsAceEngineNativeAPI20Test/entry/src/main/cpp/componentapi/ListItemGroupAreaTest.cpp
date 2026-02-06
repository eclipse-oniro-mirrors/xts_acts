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
#include "ListItemGroupAreaTest.h"
#include "component/Component.h"


namespace ListItemGroupAreaTest {

static int32_t g_areaOutsideResult = 0;
static int32_t g_areaNoneResult = 0;
static int32_t g_areaItemResult = 0;
static int32_t g_areaHeaderResult = 0;
static int32_t g_areaFooterResult = 0;
ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

void OnScrollPositionChanged(ArkUI_NodeEvent *event)
{
    const ArkUI_NodeComponentEvent *eventData = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);

    int startArea = eventData->data[0].i32;
    int endArea = eventData->data[PARAM_5].i32;

    if (startArea == ARKUI_LIST_ITEM_GROUP_AREA_OUTSIDE) {
        g_areaOutsideResult = 1;
    } else if (startArea == ARKUI_LIST_ITEM_SWIPE_AREA_NONE) {
        g_areaNoneResult = 1;
    } else if (startArea == ARKUI_LIST_ITEM_SWIPE_AREA_ITEM) {
        g_areaItemResult = 1;
    } else if (startArea == ARKUI_LIST_ITEM_SWIPE_AREA_HEADER) {
        g_areaHeaderResult = 1;
    } else if (startArea == ARKUI_LIST_ITEM_SWIPE_AREA_FOOTER) {
        g_areaFooterResult = 1;
    }

    if (endArea == ARKUI_LIST_ITEM_GROUP_AREA_OUTSIDE) {
        g_areaOutsideResult = 1;
    } else if (endArea == ARKUI_LIST_ITEM_SWIPE_AREA_NONE) {
        g_areaNoneResult = 1;
    } else if (endArea == ARKUI_LIST_ITEM_SWIPE_AREA_ITEM) {
        g_areaItemResult = 1;
    } else if (endArea == ARKUI_LIST_ITEM_SWIPE_AREA_HEADER) {
        g_areaHeaderResult = 1;
    } else if (endArea == ARKUI_LIST_ITEM_SWIPE_AREA_FOOTER) {
        g_areaFooterResult = 1;
    }
}

void  CreateListComponent(XC list)
{
    list.SetPercentHeight(1.0);
    list.SetPercentWidth(1.0);
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_STICKY_STYLE_HEADER}, {.i32 = ARKUI_STICKY_STYLE_FOOTER}};
    ArkUI_AttributeItem item = {.value = values, .size = 2};
    list.setAttribute(NODE_LIST_STICKY, &item);
    list.SetId("SwiperList");
    nodeAPI->registerNodeEvent(list.GetComponent(), NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE, 1, nullptr);
    nodeAPI->removeNodeEventReceiver(list.GetComponent(), ArkUICapiTest::Component::NodeEventReceiver);
    nodeAPI->addNodeEventReceiver(list.GetComponent(), OnScrollPositionChanged);
    for (int i = 0; i < PARAM_4; i++) {
        XC item = XC(ARKUI_NODE_LIST_ITEM);
        item.SetPercentWidth(1.0);
        item.SetHeight(SIZE_120);
        std::shared_ptr<XC> ptr = std::make_shared<XC>(item);
        list.AddChild(ptr);
    }
}

void CreateListGroupComponent(XC group1)
{
    XC header = XC(ARKUI_NODE_COLUMN);
    header.SetHeight(SIZE_200);
    header.SetPercentWidth(1.0);
    header.SetBackgroundColor(0xff483D8B);
    XC headerText = XC(ARKUI_NODE_TEXT);
    headerText.SetHeight(SIZE_120);
    headerText.SetPercentWidth(1.0);
    ArkUI_AttributeItem text = {.string = "这是Header区域"};
    headerText.setAttribute(NODE_TEXT_CONTENT, &text);
    std::shared_ptr<XC> headerPtr = std::make_shared<XC>(headerText);
    header.AddChild(headerPtr);
    ArkUI_AttributeItem headerAttr = {.object = header.GetComponent()};
    group1.setAttribute(NODE_LIST_ITEM_GROUP_SET_HEADER, &headerAttr);

    XC footer = XC(ARKUI_NODE_COLUMN);
    footer.SetHeight(SIZE_200);
    footer.SetBackgroundColor(0xffff00ff);
    XC footerText = XC(ARKUI_NODE_TEXT);
    footerText.SetHeight(SIZE_120);
    footerText.SetPercentWidth(1.0);
    ArkUI_AttributeItem text1 = {.string = "这是footer区域"};
    footerText.setAttribute(NODE_TEXT_CONTENT, &text1);
    std::shared_ptr<XC> footerPtr = std::make_shared<XC>(footerText);
    footer.AddChild(footerPtr);
    ArkUI_AttributeItem footerAttr = {.object = footer.GetComponent()};
    group1.setAttribute(NODE_LIST_ITEM_GROUP_SET_FOOTER, &footerAttr);

    for (int i = 0; i < PARAM_3; i++) {
        XC item = XC(ARKUI_NODE_LIST_ITEM);
        item.SetPercentWidth(1.0);
        item.SetHeight(SIZE_240);
        std::shared_ptr<XC> ptr = std::make_shared<XC>(item);
        group1.AddChild(ptr);
    }
}

void CreateListGroup2Component(XC group2)
{
    XC header = XC(ARKUI_NODE_COLUMN);
    header.SetHeight(SIZE_200);
    header.SetPercentWidth(1.0);
    header.SetBackgroundColor(0xff483D8B);
    XC headerText = XC(ARKUI_NODE_TEXT);
    headerText.SetHeight(SIZE_120);
    headerText.SetPercentWidth(1.0);
    ArkUI_AttributeItem text = {.string = "这是Header2区域"};
    headerText.setAttribute(NODE_TEXT_CONTENT, &text);
    std::shared_ptr<XC> headerPtr = std::make_shared<XC>(headerText);
    header.AddChild(headerPtr);
    ArkUI_AttributeItem headerAttr = {.object = header.GetComponent()};
    group2.setAttribute(NODE_LIST_ITEM_GROUP_SET_HEADER, &headerAttr);

    XC footer = XC(ARKUI_NODE_COLUMN);
    footer.SetHeight(SIZE_200);
    footer.SetBackgroundColor(0xffff00ff);
    XC footerText = XC(ARKUI_NODE_TEXT);
    footerText.SetHeight(SIZE_120);
    footerText.SetPercentWidth(1.0);
    ArkUI_AttributeItem text1 = {.string = "这是footer2区域"};
    footerText.setAttribute(NODE_TEXT_CONTENT, &text1);
    std::shared_ptr<XC> footerPtr = std::make_shared<XC>(footerText);
    footer.AddChild(footerPtr);
    ArkUI_AttributeItem footerAttr = {.object = footer.GetComponent()};
    group2.setAttribute(NODE_LIST_ITEM_GROUP_SET_FOOTER, &footerAttr);

    for (int i = 0; i < PARAM_3; i++) {
        XC item = XC(ARKUI_NODE_LIST_ITEM);
        item.SetPercentWidth(1.0);
        item.SetHeight(SIZE_240);
        std::shared_ptr<XC> ptr = std::make_shared<XC>(item);
        group2.AddChild(ptr);
    }
}

void CreateListGroup3Component(XC group3)
{
    XC header = XC(ARKUI_NODE_COLUMN);
    header.SetHeight(SIZE_200);
    header.SetPercentWidth(1.0);
    header.SetBackgroundColor(0xff483D8B);
    XC headerText = XC(ARKUI_NODE_TEXT);
    headerText.SetHeight(SIZE_120);
    headerText.SetPercentWidth(1.0);
    ArkUI_AttributeItem text = {.string = "这是Header3区域"};
    headerText.setAttribute(NODE_TEXT_CONTENT, &text);
    std::shared_ptr<XC> headerPtr = std::make_shared<XC>(headerText);
    header.AddChild(headerPtr);
    ArkUI_AttributeItem headerAttr = {.object = header.GetComponent()};
    group3.setAttribute(NODE_LIST_ITEM_GROUP_SET_HEADER, &headerAttr);

    XC footer = XC(ARKUI_NODE_COLUMN);
    footer.SetHeight(SIZE_200);
    footer.SetBackgroundColor(0xffff00ff);
    XC footerText = XC(ARKUI_NODE_TEXT);
    footerText.SetHeight(SIZE_120);
    footerText.SetPercentWidth(1.0);
    ArkUI_AttributeItem text1 = {.string = "这是footer3区域"};
    footerText.setAttribute(NODE_TEXT_CONTENT, &text1);
    std::shared_ptr<XC> footerPtr = std::make_shared<XC>(footerText);
    footer.AddChild(footerPtr);
    ArkUI_AttributeItem footerAttr = {.object = footer.GetComponent()};
    group3.setAttribute(NODE_LIST_ITEM_GROUP_SET_FOOTER, &footerAttr);

    for (int i = 0; i < PARAM_3; i++) {
        XC item = XC(ARKUI_NODE_LIST_ITEM);
        item.SetPercentWidth(1.0);
        item.SetHeight(SIZE_240);
        std::shared_ptr<XC> ptr = std::make_shared<XC>(item);
        group3.AddChild(ptr);
    }
}

napi_value CreateRegionTestList(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);

    XC list = XC(ARKUI_NODE_LIST);
    CreateListComponent(list);
    
    XC group1 = XC(ARKUI_NODE_LIST_ITEM_GROUP);
    CreateListGroupComponent(group1);
    std::shared_ptr<XC> ptr = std::make_shared<XC>(group1);
    list.AddChild(ptr);

    XC group2 = XC(ARKUI_NODE_LIST_ITEM_GROUP);
    CreateListGroup2Component(group2);
    ptr = std::make_shared<XC>(group2);
    list.AddChild(ptr);

    XC group3 = XC(ARKUI_NODE_LIST_ITEM_GROUP);
    CreateListGroup3Component(group3);
    ptr = std::make_shared<XC>(group3);
    list.AddChild(ptr);

    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, list.GetComponent());
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

void ResetAllResults()
{
    g_areaOutsideResult = PARAM_0;
    g_areaNoneResult = PARAM_0;
    g_areaItemResult = PARAM_0;
    g_areaHeaderResult = PARAM_0;
    g_areaFooterResult = PARAM_0;
}

napi_value TestAreaOutside(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, g_areaOutsideResult, &result);
    ResetAllResults();
    return result;
}

napi_value TestAreaNone(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, g_areaNoneResult, &result);
    ResetAllResults();
    return result;
}

napi_value TestAreaItem(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, g_areaItemResult, &result);
    ResetAllResults();
    return result;
}

napi_value TestAreaHeader(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, g_areaHeaderResult, &result);
    ResetAllResults();
    return result;
}

napi_value TestAreaFooter(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_areaFooterResult, &retValue);
    ResetAllResults();
    return retValue;
}

} // namespace ListItemGroupAreaTest