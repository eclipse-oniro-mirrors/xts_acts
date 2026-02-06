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
 
#include "../common/common.h"
#include "ClipShapeTest.h"
#include <string>
#include "../manager/PluginManagerTest.h"
#include <string>
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>
#include <arkui/drag_and_drop.h>
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <arkui/native_render.h>
#include <cstddef>
#include <hilog/log.h>
#undef LOG_TAG
#define LOG_TAG "public"

namespace ArkUICapiTest {
    static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    static ArkUI_NodeHandle Column = nullptr;
    static ArkUI_RectShapeOption* newRectShapeOptionNull = nullptr;

// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isID)
{
    std::string idValue = isID;
    ArkUI_AttributeItem IDValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &IDValueItem);
}

// 设置宽高圆角
static auto HeightAndWidth(ArkUI_NodeHandle &nodeHandle, float isWidth, float isHeight, float isRadius)
{
    ArkUI_NumberValue WidthValue[] = {isWidth};
    ArkUI_AttributeItem WidthItem = {WidthValue, 1};
    ArkUI_NumberValue HeightValue[] = {isHeight};
    ArkUI_AttributeItem HeightItem = {HeightValue, 1};
    ArkUI_NumberValue RadiusValue[] = {isRadius};
    ArkUI_AttributeItem RadiusItem = {RadiusValue, 1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &WidthItem);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &HeightItem);
    nodeAPI->setAttribute(nodeHandle, NODE_BORDER_RADIUS, &RadiusItem);
}

// 设置Button label
static auto LabelTest(ArkUI_NodeHandle &nodeHandle, std::string isLabel)
{
    std::string idValue = isLabel;
    ArkUI_AttributeItem IDValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_BUTTON_LABEL, &IDValueItem);
}

static auto SetClipOption1(ArkUI_NodeHandle handle_)
{
    //RectShape
    auto newRectShapeOption = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_25, ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_55, ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_55, ARKUI_EDGE_DIRECTION_BOTTOM);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_25, ARKUI_EDGE_DIRECTION_LEFT);
    auto RectOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromRectShape(newRectShapeOption);

    ArkUI_NumberValue valueR[] = {{.i32 = 0}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = RectOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}

static auto SetClipOption2(ArkUI_NodeHandle handle_)
{
    //CircleShape
    auto circleShapeOption = OH_ArkUI_RenderNodeUtils_CreateCircleShapeOption();
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterX(circleShapeOption, PARAM_50);
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterY(circleShapeOption, PARAM_50);
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionRadius(circleShapeOption, PARAM_50);
    auto circleOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromCircleShape(circleShapeOption);
    
    ArkUI_NumberValue valueR[] = {{.i32 = 1}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = circleOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}

static auto SetClipOption3(ArkUI_NodeHandle handle_)
{
    //RoundRectShape
    auto roundRectShapeOption = OH_ArkUI_RenderNodeUtils_CreateRoundRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, NULL, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, PARAM_75, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, PARAM_75, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, NULL, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(
        roundRectShapeOption, PARAM_150, PARAM_100, ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_TOP_LEFT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(
        roundRectShapeOption, PARAM_150, PARAM_150, ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_BOTTOM_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(
        roundRectShapeOption, NULL, NULL, ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_ALL);
    auto roundOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromRoundRectShape(roundRectShapeOption);
    
    ArkUI_NumberValue valueR[] = {{.i32 = 0}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = roundOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}

static auto SetClipOption4(ArkUI_NodeHandle handle_)
{
    auto newRectShapeOption = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();

    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_50, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_150, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_150, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_100, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    auto OvalOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromOvalShape(newRectShapeOption);
    
    ArkUI_NumberValue valueR[] = {{.i32 = 2}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = OvalOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}

static auto SetClipOption5(ArkUI_NodeHandle handle_)
{
    auto OvalOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromOvalShape(newRectShapeOptionNull);
    if (OvalOption == nullptr) {
        return nullptr;
    }

    ArkUI_NumberValue valueR[] = {{.i32 = 2}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = OvalOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}

static auto SetClipOption6(ArkUI_NodeHandle handle_)
{
    //RectShape
    auto newRectShapeOption = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, NULL, ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_55, ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, NULL, ARKUI_EDGE_DIRECTION_BOTTOM);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_25, ARKUI_EDGE_DIRECTION_LEFT);
    auto RectOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromRectShape(newRectShapeOption);

    ArkUI_NumberValue valueR[] = {{.i32 = 0}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = RectOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}

static auto SetClipOption7(ArkUI_NodeHandle handle_)
{
    //RectShape
    auto newRectShapeOption = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, napi_undefined, ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_55, ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, napi_undefined, ARKUI_EDGE_DIRECTION_BOTTOM);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_25, ARKUI_EDGE_DIRECTION_LEFT);
    auto RectOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromRectShape(newRectShapeOption);

    ArkUI_NumberValue valueR[] = {{.i32 = 0}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = RectOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}

static auto SetClipOption8(ArkUI_NodeHandle handle_)
{
    //CircleShape
    auto circleShapeOption = OH_ArkUI_RenderNodeUtils_CreateCircleShapeOption();
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterX(circleShapeOption, NULL);
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterY(circleShapeOption, NULL);
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionRadius(circleShapeOption, PARAM_50);
    auto circleOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromCircleShape(circleShapeOption);
    
    ArkUI_NumberValue valueR[] = {{.i32 = 1}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = circleOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}

static auto SetClipOption9(ArkUI_NodeHandle handle_)
{
    //CircleShape
    auto circleShapeOption = OH_ArkUI_RenderNodeUtils_CreateCircleShapeOption();
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterX(
        circleShapeOption, napi_undefined);
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterY(
        circleShapeOption, napi_undefined);
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionRadius(
        circleShapeOption, PARAM_50);
    auto circleOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromCircleShape(circleShapeOption);
    
    ArkUI_NumberValue valueR[] = {{.i32 = 1}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = circleOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}
static auto SetClipOption10(ArkUI_NodeHandle handle_)
{
    //RoundRectShape
    auto roundRectShapeOption = OH_ArkUI_RenderNodeUtils_CreateRoundRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, PARAM_25, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, PARAM_75, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, PARAM_75, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, PARAM_25, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(
        roundRectShapeOption, PARAM_150, PARAM_100, ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_TOP_LEFT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(
        roundRectShapeOption, PARAM_150, PARAM_150, ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_BOTTOM_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(
        roundRectShapeOption, PARAM_5, PARAM_5, ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_ALL);
    auto roundOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromRoundRectShape(roundRectShapeOption);
    
    ArkUI_NumberValue valueR[] = {{.i32 = 0}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = roundOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}
static auto SetClipOption11(ArkUI_NodeHandle handle_)
{
    //RoundRectShape
    auto roundRectShapeOption = OH_ArkUI_RenderNodeUtils_CreateRoundRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, napi_undefined, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, PARAM_75, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, PARAM_75, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(
        roundRectShapeOption, napi_undefined, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(
        roundRectShapeOption, PARAM_150, PARAM_100, ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_TOP_LEFT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(
        roundRectShapeOption, PARAM_150, PARAM_150, ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_BOTTOM_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(
        roundRectShapeOption, napi_undefined, napi_undefined, ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_ALL);
    auto roundOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromRoundRectShape(roundRectShapeOption);
    
    ArkUI_NumberValue valueR[] = {{.i32 = 0}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = roundOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}
static auto SetClipOption12(ArkUI_NodeHandle handle_) 
{
    auto newRectShapeOption = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();

    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, NULL, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_150, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, NULL, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_100, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    auto OvalOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromOvalShape(newRectShapeOption);
    
    ArkUI_NumberValue valueR[] = {{.i32 = 2}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = OvalOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}
static auto SetClipOption13(ArkUI_NodeHandle handle_)
{
    auto newRectShapeOption = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();

    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, napi_undefined, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_150, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, napi_undefined, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(
        newRectShapeOption, PARAM_100, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    auto OvalOption = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromOvalShape(newRectShapeOption);
    
    ArkUI_NumberValue valueR[] = {{.i32 = 2}};
    ArkUI_AttributeItem newRectItem = {.size = 1, .value = valueR, .object = OvalOption};
    nodeAPI->setAttribute(handle_, NODE_CLIP_SHAPE, &newRectItem);
}

napi_value ClipShapeTest::CreateNativeNode(
    napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "diatanceTest",
                 "%{public}s", xComponentID);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "diatanceTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto ColumnParent = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    HeightAndWidth(Column, PARAM_100, PARAM_100, PARAM_20);
    ArkUI_NumberValue color1[] = {{.u32 = 0xFFFF0000}};
    ArkUI_AttributeItem color1_item = {color1, sizeof(color1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(Column, NODE_BACKGROUND_COLOR, &color1_item);

    auto Button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button4 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button5 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button6 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button7 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button8 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button9 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button10 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button11 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button12 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Button13 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto Row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto Row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto Row3 = nodeAPI->createNode(ARKUI_NODE_ROW);

    IDTest(Column, "TextClipShape");
    IDTest(Button1, "ButtonClipShape1");
    IDTest(Button2, "ButtonClipShape2");
    IDTest(Button3, "ButtonClipShape3");
    IDTest(Button4, "ButtonClipShape4");
    IDTest(Button5, "ButtonClipShape5");
    IDTest(Button6, "ButtonClipShape6");
    IDTest(Button7, "ButtonClipShape7");
    IDTest(Button8, "ButtonClipShape8");
    IDTest(Button9, "ButtonClipShape9");
    IDTest(Button10, "ButtonClipShape10");
    IDTest(Button11, "ButtonClipShape11");
    IDTest(Button12, "ButtonClipShape12");
    IDTest(Button13, "ButtonClipShape13");

    LabelTest(Button1, "1");
    LabelTest(Button2, "2");
    LabelTest(Button3, "3");
    LabelTest(Button4, "4");
    LabelTest(Button5, "5");
    LabelTest(Button6, "6");
    LabelTest(Button7, "7");
    LabelTest(Button8, "8");
    LabelTest(Button9, "9");
    LabelTest(Button10, "10");
    LabelTest(Button11, "11");
    LabelTest(Button12, "13");
    LabelTest(Button13, "12");
    nodeAPI->registerNodeEvent(Button1, NODE_ON_CLICK_EVENT, PARAM_0, nullptr);
    nodeAPI->registerNodeEvent(Button2, NODE_ON_CLICK_EVENT, PARAM_1, nullptr);
    nodeAPI->registerNodeEvent(Button3, NODE_ON_CLICK_EVENT, PARAM_2, nullptr);
    nodeAPI->registerNodeEvent(Button4, NODE_ON_CLICK_EVENT, PARAM_3, nullptr);
    nodeAPI->registerNodeEvent(Button5, NODE_ON_CLICK_EVENT, PARAM_4, nullptr);
    nodeAPI->registerNodeEvent(Button6, NODE_ON_CLICK_EVENT, PARAM_5, nullptr);
    nodeAPI->registerNodeEvent(Button7, NODE_ON_CLICK_EVENT, PARAM_6, nullptr);
    nodeAPI->registerNodeEvent(Button8, NODE_ON_CLICK_EVENT, PARAM_7, nullptr);
    nodeAPI->registerNodeEvent(Button9, NODE_ON_CLICK_EVENT, PARAM_8, nullptr);
    nodeAPI->registerNodeEvent(Button10, NODE_ON_CLICK_EVENT, PARAM_9, nullptr);
    nodeAPI->registerNodeEvent(Button11, NODE_ON_CLICK_EVENT, PARAM_10, nullptr);
    nodeAPI->registerNodeEvent(Button12, NODE_ON_CLICK_EVENT, PARAM_11, nullptr);
    nodeAPI->registerNodeEvent(Button13, NODE_ON_CLICK_EVENT, PARAM_12, nullptr);

    nodeAPI->addChild(Row1, Button1);
    nodeAPI->addChild(Row1, Button2);
    nodeAPI->addChild(Row1, Button6);
    nodeAPI->addChild(Row2, Button3);
    nodeAPI->addChild(Row2, Button4);
    nodeAPI->addChild(Row2, Button5);
    nodeAPI->addChild(Row3, Button7);
    nodeAPI->addChild(Row3, Button8);
    nodeAPI->addChild(Row3, Button9);
    nodeAPI->addChild(Row1, Button10);
    nodeAPI->addChild(Row2, Button11);
    nodeAPI->addChild(Row3, Button12);
    nodeAPI->addChild(Row1, Button13);
    nodeAPI->addChild(ColumnParent, Column);
    nodeAPI->addChild(ColumnParent, Row1);
    nodeAPI->addChild(ColumnParent, Row2);
    nodeAPI->addChild(ColumnParent, Row3);

    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);

        switch (targetId) {
            case PARAM_0: {
                SetClipOption3(Column);
            } break;
            case PARAM_1: {
                SetClipOption1(Column);
            } break;
            case PARAM_2: {
                SetClipOption2(Column);
            } break;
            case PARAM_3: {
                SetClipOption4(Column);
            } break;
            case PARAM_4: {
                SetClipOption5(Column);
            } break;
            case PARAM_5: {
                SetClipOption6(Column);
            } break;
            case PARAM_6: {
                SetClipOption7(Column);
            } break;
            case PARAM_7: {
                SetClipOption8(Column);
            } break;
            case PARAM_8: {
                SetClipOption9(Column);
            } break;
            case PARAM_9: {
                SetClipOption10(Column);
            } break;
            case PARAM_10: {
                SetClipOption11(Column);
            } break;
            case PARAM_11: {
                SetClipOption12(Column);
            } break;
            case PARAM_12: {
                SetClipOption13(Column);
                } break;
        }
    });

    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), ColumnParent);

    napi_value exports;
    napi_create_object(env, &exports);
    return exports;
}
}  // namespace ArkUICapiTest