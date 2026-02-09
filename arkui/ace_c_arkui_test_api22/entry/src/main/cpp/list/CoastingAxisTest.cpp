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

#include "CoastingAxisTest.h"
#include <asm-generic/stat.h>
#include <cstdint>
#include <iostream>
#include <linux/if.h>
#include <linux/if_link.h>
#include <linux/mroute6.h>
#include <linux/quota.h>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <arkui/native_gesture.h>
#include <arkui/native_key_event.h>
#include <hilog/log.h>
#include "manager/PluginManagerTest.h"

static long long g_timeStamp = 100;
static float g_deltaX = 10.0;
static float g_deltaY = 10.0;
static int g_subKind = 1;
static int g_eventTypeId = 9;
static int g_phase0 = ARKUI_COASTING_AXIS_EVENT_PHASE_NONE;
static int g_phase1 = ARKUI_COASTING_AXIS_EVENT_PHASE_BEGIN;
static int g_phase2 = ARKUI_COASTING_AXIS_EVENT_PHASE_UPDATE;
static int g_phase3 = ARKUI_COASTING_AXIS_EVENT_PHASE_END;
namespace ArkUICapiTest {

typedef int ArkUI_Bool;
typedef int ArkUI_Int32;
typedef unsigned int ArkUI_Uint32;
typedef long long ArkUI_Int64;
typedef float ArkUI_Float32;
typedef double ArkUI_Float64;
typedef const char* ArkUI_CharPtr;
typedef unsigned long long ArkUI_Uint64;

struct ArkUI_UIInputEvent_ {
    ArkUI_UIInputEvent_Type inputType;
    ArkUI_Int32 eventTypeId;
    void* inputEvent;
    bool isCloned = false;
};

struct ArkUiCoastingAxisEvent {
    ArkUI_Int64 timeStamp;
    ArkUI_Float32 deltaX;
    ArkUI_Float32 deltaY;
    ArkUI_Int32 subKind;
    ArkUI_Int32 phase;
    bool stopPropagation;
};

struct Contact {
    explicit Contact(std::string name) : name(name){};
    std::string name = "";
    std::string icon = "./resources/base/media/icon.png";
};
struct ContactsGroup {
    std::string title = "";
    std::vector<Contact> contacts = {};
};

const std::vector<ContactsGroup> staticContacts = {
    {"A", {{Contact("Alice")}, {Contact("Alan")}, {Contact("Amy")}, {Contact("Andy")}, {Contact("Anna")}}},
    {"B", {{Contact("Bob")}, {Contact("Betty")}, {Contact("Bruce")}, {Contact("Bella")}, {Contact("Brian")}}},
    {"C", {{Contact("Charlie")}, {Contact("Cindy")}, {Contact("Clara")}, {Contact("Carter")}}},
    {"D", {{Contact("David")}, {Contact("Diana")}, {Contact("Dan")}, {Contact("Daisy")}, {Contact("Dora")}}},
    {"E", {{Contact("Emma")}, {Contact("Eric")}, {Contact("Eva")}, {Contact("Ethan")}, {Contact("Elise")}}},
    {"F", {{Contact("Frank")}, {Contact("Fiona")}, {Contact("Felix")},
        {Contact("Faith")}, {Contact("Flora")}, {Contact("Fred")}}},
    {"G", {{Contact("George")}, {Contact("Grace")}, {Contact("Gary")}, {Contact("Gina")}, {Contact("Gavin")}}},
    {"H", {{Contact("Helen")}, {Contact("Henry")}, {Contact("Hank")},
        {Contact("Hazel")}, {Contact("Hugo")}, {Contact("Holly")}}},
    {"I", {{Contact("Ivy")}, {Contact("Ian")}, {Contact("Iris")}, {Contact("Ivan")}, {Contact("Isla")}}},
    {"J", {{Contact("John")}, {Contact("Jane")}, {Contact("Jack")},
        {Contact("Jill")}, {Contact("James")}, {Contact("Julia")}}},
    {"K", {{Contact("Kevin")}, {Contact("Kate")}, {Contact("Kyle")}, {Contact("Karen")}, {Contact("Karl")}}},
    {"L", {{Contact("Lucy")}, {Contact("Leo")}, {Contact("Lily")},
        {Contact("Luke")}, {Contact("Liam")}, {Contact("Luna")}}},
    {"M", {{Contact("Mike")}, {Contact("Mary")}, {Contact("Mark")}, {Contact("Mia")}, {Contact("Max")}}},
    {"N", {{Contact("Nancy")}, {Contact("Nick")}, {Contact("Nora")},
        {Contact("Noah")}, {Contact("Nina")}, {Contact("Nate")}}},
    {"0", {{Contact("olivia")}, {Contact("oscar")}, {Contact("olive")}, {Contact("Owen")}, {Contact("Opal")}}},
    {"P", {{Contact("Peter")}, {Contact("Paula")}, {Contact("Paul")},
        {Contact("Pam")}, {Contact("Phil")}, {Contact("Piper")}}},
    {"q", {{Contact("quinn")}, {Contact("quentin")}, {Contact("queen")}, {Contact("quincy")}, {Contact("Quella")}}},
    {"R", {{Contact("Robert")}, {Contact("Rose")}, {Contact("Ryan")},
        {Contact("Ruth")}, {Contact("Roy")}, {Contact("Rex")}}},
    {"S", {{Contact("Sarah")}, {Contact("Sam")}, {Contact("Steve")}, {Contact("Sue")}, {Contact("Sean")}}},
    {"T", {{Contact("Tom")}, {Contact("Tina")}, {Contact("Tim")},
        {Contact("Tara")}, {Contact("Ted")}, {Contact("Troy")}}},
    {"U", {{Contact("Uma")}, {Contact("Ulysses")}, {Contact("Uriah")}, {Contact("Ulric")}, {Contact("Ula")}}},
    {"V", {{Contact("victor")}, {Contact("Vera")}, {Contact("vince")},
        {Contact("violet")}, {Contact("Van")}, {Contact("Vicky")}}},
    {"W", {{Contact("William")}, {Contact("Wendy")}, {Contact("Wayne")}, {Contact("Willa")}, {Contact("Wade")}}},
    {"X", {{Contact("Xander")}, {Contact("Xena")}, {Contact("Xavier")}, {Contact("Xia")}, {Contact("Xerxes")}}},
    {"V", {{Contact("Yvonne")}, {Contact("Yves")}, {Contact("Yael")},
        {Contact("Yuri")}, {Contact("Yolanda")}, {Contact("Yan")}}},
    {"Z", {{Contact("Zoe")}, {Contact("Zack")}, {Contact("Zara")}, {Contact("Zane")}, {Contact("Zelda")}}}};

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

static ArkUI_NodeHandle CreateListImage(std::string icon)
{
    auto image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    ArkUI_AttributeItem item = {.string = icon.c_str()};
    nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &item);
    ArkUI_NumberValue value[] = {{.f32 = 40}};
    ArkUI_AttributeItem height = {value, 1};
    ArkUI_AttributeItem width = {value, 1};

    nodeAPI->setAttribute(image, NODE_HEIGHT, &height);
    nodeAPI->setAttribute(image, NODE_WIDTH, &width);
    ArkUI_NumberValue radiusValue[] = {{.f32 = 20}};
    ArkUI_AttributeItem radius = {radiusValue, 1};
    nodeAPI->setAttribute(image, NODE_BORDER_RADIUS, &radius);
    ArkUI_NumberValue marginValue[] = {{.f32 = 0}, {.f32 = 17}, {.f32 = 0}, {.f32 = 0}};
    ArkUI_AttributeItem margin = {marginValue, 4};
    nodeAPI->setAttribute(image, NODE_MARGIN, &margin);
    return image;
}

static ArkUI_NodeHandle CreateListText(std::string text)
{
    auto textNode = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem str = {nullptr, 0, text.c_str()};
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &str);
    ArkUI_NumberValue fontSizeValue[] = {{.f32 = 18}};
    ArkUI_AttributeItem fontSize = {fontSizeValue, 1};
    nodeAPI->setAttribute(textNode, NODE_FONT_SIZE, &fontSize);
    return textNode;
}

static ArkUI_NodeHandle CreateListItem(const Contact &contact)
{
    auto listItem = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto image = CreateListImage(contact.icon);
    auto text = CreateListText(contact.name);

    ArkUI_NumberValue paddingValue[] = {{.f32 = 12}};
    ArkUI_AttributeItem padding = {paddingValue, 1};
    nodeAPI->setAttribute(row, NODE_PADDING, &padding);

    ArkUI_NumberValue alignValue[] = {{.i32 = ARKUI_VERTICAL_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem align = {alignValue, 1};
    nodeAPI->setAttribute(row, NODE_ROW_ALIGN_ITEMS, &align);
    nodeAPI->addChild(row, image);
    nodeAPI->addChild(row, text);
    nodeAPI->addChild(listItem, row);

    return listItem;
}

static ArkUI_NodeHandle CreateHeader(const std::string &text)
{
    auto textNode = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem str = {nullptr, 0, text.c_str()};
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &str);

    ArkUI_NumberValue fontSizeValue[] = {{.f32 = 20}};
    ArkUI_AttributeItem fontsize = {fontSizeValue, 1};
    nodeAPI->setAttribute(textNode, NODE_FONT_SIZE, &fontsize);

    ArkUI_NumberValue widthValue[] = {{.f32 = 100}};
    ArkUI_AttributeItem width = {widthValue, 1};
    nodeAPI->setAttribute(textNode, NODE_WIDTH_PERCENT, &width);
    ArkUI_NumberValue colorValue[] = {{.u32 = 0xfff1f3f5}};

    ArkUI_AttributeItem color = {colorValue, 1};
    nodeAPI->setAttribute(textNode, NODE_BACKGROUND_COLOR, &color);
    ArkUI_NumberValue paddingValue[] = {{.f32 = 5}};
    ArkUI_AttributeItem padding = {paddingValue, 1};
    nodeAPI->setAttribute(textNode, NODE_PADDING, &padding);
    return textNode;
}

napi_value CoastingAxisTest::CoastingAxisEventTest_a(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUiCoastingAxisEvent *coastingAxisEvent = new ArkUiCoastingAxisEvent;
    coastingAxisEvent->timeStamp = g_timeStamp;
    coastingAxisEvent->deltaX = g_deltaX;
    coastingAxisEvent->deltaY = g_deltaY;
    coastingAxisEvent->phase = g_phase0;
    coastingAxisEvent->subKind = g_subKind;
    coastingAxisEvent->stopPropagation = false;
    ArkUI_UIInputEvent_ *event = new ArkUI_UIInputEvent_;
    event->eventTypeId = g_eventTypeId;
    auto coastingAxis = (ArkUI_CoastingAxisEvent *)coastingAxisEvent;
    event->inputEvent = (void *)coastingAxis;
    ArkUI_CoastingAxisEvent *axisEvent = OH_ArkUI_UIInputEvent_GetCoastingAxisEvent((ArkUI_UIInputEvent *)event);
    auto time = OH_ArkUI_CoastingAxisEvent_GetEventTime(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_a",
        "OH_ArkUI_CoastingAxisEvent_GetEventTime %{public}lld", time);
    ASSERT_EQ(time, g_timeStamp);
    auto deltaX = OH_ArkUI_CoastingAxisEvent_GetDeltaX(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_a",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaX %{public}f", deltaX);
    ASSERT_EQ(deltaX, g_deltaX);
    auto deltaY = OH_ArkUI_CoastingAxisEvent_GetDeltaY(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_a",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaY %{public}f", deltaY);
    ASSERT_EQ(deltaY, g_deltaY);
    auto phase = (int32_t)OH_ArkUI_CoastingAxisEvent_GetPhase(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_a",
        "OH_ArkUI_CoastingAxisEvent_GetPhase %{public}d", phase);
    ASSERT_EQ(phase, g_phase0);
    auto propagation = OH_ArkUI_CoastingAxisEvent_SetPropagation(axisEvent, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_a",
        "OH_ArkUI_CoastingAxisEvent_SetPropagation %{public}d", propagation);
    ASSERT_EQ(propagation, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value CoastingAxisTest::CoastingAxisEventTest_b(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_UIInputEvent *event = NULL;
    ArkUI_CoastingAxisEvent *axisEvent = OH_ArkUI_UIInputEvent_GetCoastingAxisEvent(event);
    auto time = OH_ArkUI_CoastingAxisEvent_GetEventTime(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "OH_ArkUI_CoastingAxisEvent_GetEventTime %{public}lld", time);
    ASSERT_EQ(time, 0);
    auto deltaX = OH_ArkUI_CoastingAxisEvent_GetDeltaX(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaX %{public}f", deltaX);
    ASSERT_EQ(deltaX, 0);
    auto deltaY = OH_ArkUI_CoastingAxisEvent_GetDeltaY(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaY %{public}f", deltaY);
    ASSERT_EQ(deltaY, 0);
    auto phase = (int32_t)OH_ArkUI_CoastingAxisEvent_GetPhase(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "OH_ArkUI_CoastingAxisEvent_GetPhase %{public}d", phase);
    ASSERT_EQ(phase, 0);
    auto propagation = OH_ArkUI_CoastingAxisEvent_SetPropagation(axisEvent, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "OH_ArkUI_CoastingAxisEvent_SetPropagation %{public}d", propagation);
    ASSERT_EQ(propagation, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value CoastingAxisTest::CoastingAxisEventTest_c(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUiCoastingAxisEvent *coastingAxisEvent = new ArkUiCoastingAxisEvent;
    coastingAxisEvent->timeStamp = g_timeStamp;
    coastingAxisEvent->deltaX = g_deltaX;
    coastingAxisEvent->deltaY = g_deltaY;
    coastingAxisEvent->phase = g_phase1;
    coastingAxisEvent->subKind = g_subKind;
    coastingAxisEvent->stopPropagation = false;
    ArkUI_UIInputEvent_ *event = new ArkUI_UIInputEvent_;
    event->eventTypeId = g_eventTypeId;
    auto coastingAxis = (ArkUI_CoastingAxisEvent *)coastingAxisEvent;
    event->inputEvent = (void *)coastingAxis;
    ArkUI_CoastingAxisEvent *axisEvent = OH_ArkUI_UIInputEvent_GetCoastingAxisEvent((ArkUI_UIInputEvent *)event);
    auto time = OH_ArkUI_CoastingAxisEvent_GetEventTime(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_c",
        "OH_ArkUI_CoastingAxisEvent_GetEventTime %{public}lld", time);
    ASSERT_EQ(time, g_timeStamp);
    auto deltaX = OH_ArkUI_CoastingAxisEvent_GetDeltaX(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_c",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaX %{public}f", deltaX);
    ASSERT_EQ(deltaX, g_deltaX);
    auto deltaY = OH_ArkUI_CoastingAxisEvent_GetDeltaY(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_c",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaY %{public}f", deltaY);
    ASSERT_EQ(deltaY, g_deltaY);
    auto phase = (int32_t)OH_ArkUI_CoastingAxisEvent_GetPhase(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_c",
        "OH_ArkUI_CoastingAxisEvent_GetPhase %{public}d", phase);
    ASSERT_EQ(phase, g_phase1);
    auto propagation = OH_ArkUI_CoastingAxisEvent_SetPropagation(axisEvent, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_c",
        "OH_ArkUI_CoastingAxisEvent_SetPropagation %{public}d", propagation);
    ASSERT_EQ(propagation, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value CoastingAxisTest::CoastingAxisEventTest_d(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUiCoastingAxisEvent *coastingAxisEvent = new ArkUiCoastingAxisEvent;
    coastingAxisEvent->timeStamp = g_timeStamp;
    coastingAxisEvent->deltaX = g_deltaX;
    coastingAxisEvent->deltaY = g_deltaY;
    coastingAxisEvent->phase = g_phase2;
    coastingAxisEvent->subKind = g_subKind;
    coastingAxisEvent->stopPropagation = false;
    ArkUI_UIInputEvent_ *event = new ArkUI_UIInputEvent_;
    event->eventTypeId = g_eventTypeId;
    auto coastingAxis = (ArkUI_CoastingAxisEvent *)coastingAxisEvent;
    event->inputEvent = (void *)coastingAxis;
    ArkUI_CoastingAxisEvent *axisEvent = OH_ArkUI_UIInputEvent_GetCoastingAxisEvent((ArkUI_UIInputEvent *)event);
    auto time = OH_ArkUI_CoastingAxisEvent_GetEventTime(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_d",
        "OH_ArkUI_CoastingAxisEvent_GetEventTime %{public}lld", time);
    ASSERT_EQ(time, g_timeStamp);
    auto deltaX = OH_ArkUI_CoastingAxisEvent_GetDeltaX(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_d",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaX %{public}f", deltaX);
    ASSERT_EQ(deltaX, g_deltaX);
    auto deltaY = OH_ArkUI_CoastingAxisEvent_GetDeltaY(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_d",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaY %{public}f", deltaY);
    ASSERT_EQ(deltaY, g_deltaY);
    auto phase = (int32_t)OH_ArkUI_CoastingAxisEvent_GetPhase(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_d",
        "OH_ArkUI_CoastingAxisEvent_GetPhase %{public}d", phase);
    ASSERT_EQ(phase, g_phase2);
    auto propagation = OH_ArkUI_CoastingAxisEvent_SetPropagation(axisEvent, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_d",
        "OH_ArkUI_CoastingAxisEvent_SetPropagation %{public}d", propagation);
    ASSERT_EQ(propagation, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value CoastingAxisTest::CoastingAxisEventTest_e(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUiCoastingAxisEvent *coastingAxisEvent = new ArkUiCoastingAxisEvent;
    coastingAxisEvent->timeStamp = g_timeStamp;
    coastingAxisEvent->deltaX = g_deltaX;
    coastingAxisEvent->deltaY = g_deltaY;
    coastingAxisEvent->phase = g_phase3;
    coastingAxisEvent->subKind = g_subKind;
    coastingAxisEvent->stopPropagation = false;
    ArkUI_UIInputEvent_ *event = new ArkUI_UIInputEvent_;
    event->eventTypeId = g_eventTypeId;
    auto coastingAxis = (ArkUI_CoastingAxisEvent *)coastingAxisEvent;
    event->inputEvent = (void *)coastingAxis;
    ArkUI_CoastingAxisEvent *axisEvent = OH_ArkUI_UIInputEvent_GetCoastingAxisEvent((ArkUI_UIInputEvent *)event);
    auto time = OH_ArkUI_CoastingAxisEvent_GetEventTime(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_e",
        "OH_ArkUI_CoastingAxisEvent_GetEventTime %{public}lld", time);
    ASSERT_EQ(time, g_timeStamp);
    auto deltaX = OH_ArkUI_CoastingAxisEvent_GetDeltaX(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_e",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaX %{public}f", deltaX);
    ASSERT_EQ(deltaX, g_deltaX);
    auto deltaY = OH_ArkUI_CoastingAxisEvent_GetDeltaY(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_e",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaY %{public}f", deltaY);
    ASSERT_EQ(deltaY, g_deltaY);
    auto phase = (int32_t)OH_ArkUI_CoastingAxisEvent_GetPhase(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_e",
        "OH_ArkUI_CoastingAxisEvent_GetPhase %{public}d", phase);
    ASSERT_EQ(phase, g_phase3);
    auto propagation = OH_ArkUI_CoastingAxisEvent_SetPropagation(axisEvent, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_e",
        "OH_ArkUI_CoastingAxisEvent_SetPropagation %{public}d", propagation);
    ASSERT_EQ(propagation, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value CoastingAxisTest::CreateNativeNode(
    napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisTest000", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CoastingAxisTest000",
            "GetContext env or info is null");
        return nullptr;
        }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisTest000", "CreateNativeNode2");
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle listNode = nodeAPI->createNode(ARKUI_NODE_LIST);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_STICKY_STYLE_HEADER}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(listNode, NODE_LIST_STICKY, &item);
    for (const auto &group : staticContacts) {
        auto groupNode = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM_GROUP);
        ArkUI_AttributeItem Item = {.object = CreateHeader(group.title)};
        nodeAPI->setAttribute(groupNode, NODE_LIST_ITEM_GROUP_SET_HEADER, &Item);
        for (const auto &contact : group.contacts) {
            auto listItem = CreateListItem(contact);
            nodeAPI->addChild(groupNode, listItem);
        }
        nodeAPI->addChild(listNode, groupNode);
    }
    ArkUI_AttributeItem columnItem = {.string = "column"};
    nodeAPI->setAttribute(listNode, NODE_ID, &columnItem);
    nodeAPI->registerNodeEvent(listNode, NODE_ON_COASTING_AXIS_EVENT, 0, nullptr);
    nodeAPI->registerNodeEvent(listNode, NODE_ON_AXIS, 0, nullptr);
    nodeAPI->addChild(column, listNode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisTest000", "CreateNativeNode3");
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        switch (eventType) {
            case NODE_ON_COASTING_AXIS_EVENT: {
                auto uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                auto coastingAxisEvent = OH_ArkUI_UIInputEvent_GetCoastingAxisEvent(uiInputEvent);
                auto time = OH_ArkUI_CoastingAxisEvent_GetEventTime(coastingAxisEvent);
                auto phase = OH_ArkUI_CoastingAxisEvent_GetPhase(coastingAxisEvent);
                auto deltaX = OH_ArkUI_CoastingAxisEvent_GetDeltaX(coastingAxisEvent);
                auto deltaY = OH_ArkUI_CoastingAxisEvent_GetDeltaY(coastingAxisEvent);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "===capi===",
                    "NODE_ON_COASTING_AXIS_EVENT column phase=%{public}d, deltaX=%{public}f, deltaY=%{public}f, "
                    "time=%{public}lld", phase, deltaX, deltaY, time);
                break;
        }
            case NODE_ON_AXIS: {
                auto uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                auto action = OH_ArkUI_UIInputEvent_GetAction(uiInputEvent);
                auto vertical = OH_ArkUI_AxisEvent_GetVerticalAxisValue(uiInputEvent);
                auto horizontal = OH_ArkUI_AxisEvent_GetHorizontalAxisValue(uiInputEvent);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "===сарі===",
                    "NODE_ON_AXIS column action=%{public}d, vertical=%{public}f, horizontal=%{public}f",
                    action, vertical, horizontal);
        }
            default: {
        }
        }
    });
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisTest000", "CreateNativeNode4");
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        column) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CoastingAxisTest000",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisTest000", "CreateNativeNode5");
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest