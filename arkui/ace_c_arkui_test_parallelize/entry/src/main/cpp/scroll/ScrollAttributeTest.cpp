/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "common/common.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <hilog/log.h>
#include <vector>
#include "scroll/NodeXtsScrollTest.h"
#include "scroll/ScrollAttributeTest.h"

namespace ArkUICapiTest {
const char* MY_SCROLL_LOG = "nativeScrollTest";
static auto tester = new NodeXTSScrollTest();

void TestNodeScrollBar001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollBar_value[] = { {.i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON} };
    ArkUI_AttributeItem scrollBar_item = {scrollBar_value, sizeof(scrollBar_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE, &scrollBar_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE);
    if(result->value[0].i32 != ARKUI_SCROLL_BAR_DISPLAY_MODE_AUTO) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_DISPLAY_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBar002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE);
    if(result->value[0].i32 != ARKUI_SCROLL_BAR_DISPLAY_MODE_AUTO) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_DISPLAY_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBar011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollBar_value[] = { {.i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON} };
    ArkUI_AttributeItem scrollBar_item = {scrollBar_value, sizeof(scrollBar_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE, &scrollBar_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE);
    if(result->value[0].i32 != ARKUI_SCROLL_BAR_DISPLAY_MODE_ON) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_DISPLAY_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBar012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE);
    if(result->value[0].i32 != ARKUI_SCROLL_BAR_DISPLAY_MODE_ON) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_DISPLAY_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarWidth001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollBarWidth_value[] = { {.f32 = 20} };
    ArkUI_AttributeItem scrollBarWidth_item = {scrollBarWidth_value, sizeof(scrollBarWidth_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_WIDTH, &scrollBarWidth_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_BAR_WIDTH);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH);
    if(result->value[0].f32 != 4) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_WIDTH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarWidth002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH);
    if(result->value[0].f32 != 4) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_WIDTH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarWidth011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollBarWidth_value[] = { {.f32 = 20} };
    ArkUI_AttributeItem scrollBarWidth_item = {scrollBarWidth_value, sizeof(scrollBarWidth_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_WIDTH, &scrollBarWidth_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH);
    if(result->value[0].f32 != 20) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_WIDTH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarWidth012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH);
    if(result->value[0].f32 != 20) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_WIDTH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarColor001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollBarColor_value[] = { {.u32 = 0xFFFF0000} };
    ArkUI_AttributeItem scrollBarColor_item = {scrollBarColor_value, sizeof(scrollBarColor_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_COLOR, &scrollBarColor_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_BAR_COLOR);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_COLOR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "rxw",
                 "NODE_TOUCH_EVENTScrollBarColor:0x%{public}08X.", result->value[0].u32);
}

void TestNodeScrollBarColor002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_COLOR);
}

void TestNodeScrollBarColor011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollBarColor_value[] = { {.u32 = 0xFFFF0000} };
    ArkUI_AttributeItem scrollBarColor_item = {scrollBarColor_value, sizeof(scrollBarColor_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_COLOR, &scrollBarColor_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_COLOR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "rxw",
                 "NODE_TOUCH_EVENTScrollBarColor:0x%{public}08X.", result->value[0].u32);
}

void TestNodeScrollBarColor012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_COLOR);
}

void TestNodeScrollBarDirection001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollBarDirection_value[] = { {.i32 = ARKUI_SCROLL_DIRECTION_FREE} };
    ArkUI_AttributeItem scrollBarDirection_item = {scrollBarDirection_value, sizeof(scrollBarDirection_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &scrollBarDirection_item);
     nodeAPI->resetAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION);
    if(result->value[0].i32 != ARKUI_SCROLL_DIRECTION_VERTICAL) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_SCROLL_DIRECTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarDirection002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION);
    if(result->value[0].i32 != ARKUI_SCROLL_DIRECTION_VERTICAL) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_SCROLL_DIRECTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarDirection011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollBarDirection_value[] = { {.i32 = ARKUI_SCROLL_DIRECTION_FREE} };
    ArkUI_AttributeItem scrollBarDirection_item = {scrollBarDirection_value, sizeof(scrollBarDirection_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &scrollBarDirection_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION);
    if(result->value[0].i32 != ARKUI_SCROLL_DIRECTION_FREE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_SCROLL_DIRECTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarDirection012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION);
    if(result->value[0].i32 != ARKUI_SCROLL_DIRECTION_FREE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_SCROLL_DIRECTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEdgeEffect001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue edgeEffect_value[] = { {.i32 = ARKUI_EDGE_EFFECT_SPRING}, {.i32 = 1} };
    ArkUI_AttributeItem edgeEffect_item = {edgeEffect_value, sizeof(edgeEffect_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_EDGE_EFFECT, &edgeEffect_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_EDGE_EFFECT);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE_EFFECT);
    if(result->value[0].i32 != ARKUI_EDGE_EFFECT_NONE || result->value[1].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_EDGE_EFFECT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEdgeEffect002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE_EFFECT);
    if(result->value[0].i32 != ARKUI_EDGE_EFFECT_NONE || result->value[1].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_EDGE_EFFECT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEdgeEffect011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue edgeEffect_value[] = { {.i32 = ARKUI_EDGE_EFFECT_SPRING}, {.i32 = 1} };
    ArkUI_AttributeItem edgeEffect_item = {edgeEffect_value, sizeof(edgeEffect_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_EDGE_EFFECT, &edgeEffect_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE_EFFECT);
    if(result->value[0].i32 != ARKUI_EDGE_EFFECT_SPRING || result->value[1].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_EDGE_EFFECT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEdgeEffect012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE_EFFECT);
    if(result->value[0].i32 != ARKUI_EDGE_EFFECT_SPRING || result->value[1].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_EDGE_EFFECT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollInteraction001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollInteraction_value[] = { {.i32 = true} };
    ArkUI_AttributeItem scrollInteraction_item = {scrollInteraction_value, sizeof(scrollInteraction_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_SCROLL_INTERACTION, &scrollInteraction_item);
       nodeAPI->resetAttribute(scroll, NODE_SCROLL_ENABLE_SCROLL_INTERACTION);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_SCROLL_INTERACTION);
    if(result->value[0].i32 != true) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_SCROLL_INTERACTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollInteraction002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_SCROLL_INTERACTION);
    if(result->value[0].i32 != true) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_SCROLL_INTERACTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollInteraction011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollInteraction_value[] = { {.i32 = true} };
    ArkUI_AttributeItem scrollInteraction_item = {scrollInteraction_value, sizeof(scrollInteraction_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_SCROLL_INTERACTION, &scrollInteraction_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_SCROLL_INTERACTION);
    if(result->value[0].i32 != true) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_SCROLL_INTERACTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollInteraction012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_SCROLL_INTERACTION);
    if(result->value[0].i32 != true) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_SCROLL_INTERACTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeNestedScroll001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue nestedScroll_value[] = { {.i32 = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY},
        {.i32 = ARKUI_SCROLL_NESTED_MODE_SELF_FIRST} };
    ArkUI_AttributeItem nestedScroll_item = {nestedScroll_value, sizeof(nestedScroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_NESTED_SCROLL, &nestedScroll_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_NESTED_SCROLL);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_NESTED_SCROLL);
    if(result->value[0].i32 != ARKUI_SCROLL_NESTED_MODE_SELF_ONLY || result->value[1].i32 != ARKUI_SCROLL_NESTED_MODE_SELF_ONLY) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_NESTED_SCROLL is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeNestedScroll002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_NESTED_SCROLL);
    if(result->value[0].i32 != ARKUI_SCROLL_NESTED_MODE_SELF_ONLY || result->value[1].i32 != ARKUI_SCROLL_NESTED_MODE_SELF_ONLY) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_NESTED_SCROLL is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeNestedScroll011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue nestedScroll_value[] = { {.i32 = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY},
        {.i32 = ARKUI_SCROLL_NESTED_MODE_SELF_FIRST} };
    ArkUI_AttributeItem nestedScroll_item = {nestedScroll_value, sizeof(nestedScroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_NESTED_SCROLL, &nestedScroll_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_NESTED_SCROLL);
    if(result->value[0].i32 != ARKUI_SCROLL_NESTED_MODE_SELF_ONLY || result->value[1].i32 != ARKUI_SCROLL_NESTED_MODE_SELF_FIRST) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_NESTED_SCROLL is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeNestedScroll012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_NESTED_SCROLL);
    if(result->value[0].i32 != ARKUI_SCROLL_NESTED_MODE_SELF_ONLY || result->value[1].i32 != ARKUI_SCROLL_NESTED_MODE_SELF_FIRST) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_NESTED_SCROLL is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollOffset001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollTo_value[] = {{.f32 = 0}, {.f32 = 100}, {.i32 = 0},
                                          {.i32 = 0}, {.i32 = 0},   {.i32 = 0}};
    ArkUI_AttributeItem scrollTo_item = {scrollTo_value, sizeof(scrollTo_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scrollTo_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_OFFSET);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET);
    if(result->value[0].f32 != 0 || result->value[1].f32 != 0 ||  result->value[2].i32 != 0
        || result->value[3].i32 != 0 || result->value[4].i32 != 0, result->value[5].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollOffset002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET);
    if(result->value[0].f32 != 0 || result->value[1].f32 != 0 ||  result->value[2].i32 != 0
        || result->value[3].i32 != 0 || result->value[4].i32 != 0, result->value[5].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollOffset011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollTo_value[] = {{.f32 = 0}, {.f32 = 100}, {.i32 = 0},
                                          {.i32 = 0}, {.i32 = 0},   {.i32 = 0}};
    ArkUI_AttributeItem scrollTo_item = {scrollTo_value, sizeof(scrollTo_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scrollTo_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET);
    if(result->value[0].f32 != 0 || result->value[1].f32 != 100 ||  result->value[2].i32 != 0
        || result->value[3].i32 != 0 || result->value[4].i32 != 0, result->value[5].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollOffset012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET);
    if(result->value[0].f32 != 0 || result->value[1].f32 != 100 ||  result->value[2].i32 != 0
        || result->value[3].i32 != 0 || result->value[4].i32 != 0, result->value[5].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnablePaging001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue enablePaging_value[] = { {.i32 = 1} };
    ArkUI_AttributeItem enablePaging_item = {enablePaging_value, sizeof(enablePaging_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_PAGING, &enablePaging_item);
      nodeAPI->resetAttribute(scroll, NODE_SCROLL_ENABLE_PAGING);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_PAGING);
    if(result->value[0].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_PAGING is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnablePaging002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_PAGING);
    if(result->value[0].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_PAGING is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnablePaging011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue enablePaging_value[] = { {.i32 = 1} };
    ArkUI_AttributeItem enablePaging_item = {enablePaging_value, sizeof(enablePaging_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_PAGING, &enablePaging_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_PAGING);
    if(result->value[0].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_PAGING is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnablePaging012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_PAGING);
    if(result->value[0].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_PAGING is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeFadingEdge001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue fadingEdge_value[] = { {.i32 = 1} };
    ArkUI_AttributeItem fadingEdge_item = {fadingEdge_value, sizeof(fadingEdge_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_FADING_EDGE, &fadingEdge_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_FADING_EDGE);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_FADING_EDGE);
    if(result->value[0].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_FADING_EDGE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeFadingEdge002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_FADING_EDGE);
    if(result->value[0].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_FADING_EDGE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeFadingEdge011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue fadingEdge_value[] = { {.i32 = 1} };
    ArkUI_AttributeItem fadingEdge_item = {fadingEdge_value, sizeof(fadingEdge_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_FADING_EDGE, &fadingEdge_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_FADING_EDGE);
    if(result->value[0].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_FADING_EDGE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeFadingEdge012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_FADING_EDGE);
    if(result->value[0].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_FADING_EDGE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}
//
void TestNodeContentStartOffset001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue contentStartOffset_value[] = { {.f32 = 400} };
    ArkUI_AttributeItem contentStartOffset_item = {contentStartOffset_value, sizeof(contentStartOffset_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_CONTENT_START_OFFSET, &contentStartOffset_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_CONTENT_START_OFFSET);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CONTENT_START_OFFSET);
    if(result->value[0].f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CONTENT_START_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeContentStartOffset002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CONTENT_START_OFFSET);
    if(result->value[0].f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CONTENT_START_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeContentStartOffset011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue contentStartOffset_value[] = { {.f32 = 400} };
    ArkUI_AttributeItem contentStartOffset_item = {contentStartOffset_value, sizeof(contentStartOffset_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_CONTENT_START_OFFSET, &contentStartOffset_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CONTENT_START_OFFSET);
    if(result->value[0].f32 != 400) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CONTENT_START_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeContentStartOffset012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CONTENT_START_OFFSET);
    if(result->value[0].f32 != 400) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CONTENT_START_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeContentEndOffset001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue contentEndOffset_value[] = { {.f32 = 300} };
    ArkUI_AttributeItem contentEndOffset_item = {contentEndOffset_value, sizeof(contentEndOffset_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_CONTENT_END_OFFSET, &contentEndOffset_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_CONTENT_END_OFFSET);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CONTENT_END_OFFSET);
    if(result->value[0].f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CONTENT_END_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeContentEndOffset002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CONTENT_END_OFFSET);
    if(result->value[0].f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CONTENT_END_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeContentEndOffset011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue contentEndOffset_value[] = { {.f32 = 300} };
    ArkUI_AttributeItem contentEndOffset_item = {contentEndOffset_value, sizeof(contentEndOffset_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_CONTENT_END_OFFSET, &contentEndOffset_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CONTENT_END_OFFSET);
    if(result->value[0].f32 != 300) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CONTENT_END_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeContentEndOffset012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CONTENT_END_OFFSET);
    if(result->value[0].f32 != 300) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CONTENT_END_OFFSET is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeClipContent001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue clipContent_value[] = { {.i32 = ARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY} };
    ArkUI_AttributeItem clipContent_item = {clipContent_value, sizeof(clipContent_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_CLIP_CONTENT, &clipContent_item);
     nodeAPI->resetAttribute(scroll, NODE_SCROLL_CLIP_CONTENT);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CLIP_CONTENT);
    if(result->value[0].i32 != ARKUI_CONTENT_CLIP_MODE_BOUNDARY) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CLIP_CONTENT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeClipContent002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CLIP_CONTENT);
    if(result->value[0].i32 != ARKUI_CONTENT_CLIP_MODE_BOUNDARY) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CLIP_CONTENT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeClipContent011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue clipContent_value[] = { {.i32 = ARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY} };
    ArkUI_AttributeItem clipContent_item = {clipContent_value, sizeof(clipContent_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_CLIP_CONTENT, &clipContent_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CLIP_CONTENT);
    if(result->value[0].i32 != ARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CLIP_CONTENT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeClipContent012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_CLIP_CONTENT);
    if(result->value[0].i32 != ARKUI_CONTENT_CLIP_MODE_CONTENT_ONLY) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_CLIP_CONTENT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarMargin001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollBarMargin_value[] = { {.f32 = 10}, {.f32 = 15} };
    ArkUI_AttributeItem scrollBarMargin_item = {scrollBarMargin_value, sizeof(scrollBarMargin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_MARGIN, &scrollBarMargin_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_BAR_MARGIN);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_MARGIN);
    if(result->value[0].f32 != 0 || result->value[1].f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_MARGIN is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarMargin002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_MARGIN);
    if(result->value[0].f32 != 0 || result->value[1].f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_MARGIN is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarMargin011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue scrollBarMargin_value[] = { {.f32 = 10}, {.f32 = 15} };
    ArkUI_AttributeItem scrollBarMargin_item = {scrollBarMargin_value, sizeof(scrollBarMargin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_MARGIN, &scrollBarMargin_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_MARGIN);
    if(result->value[0].f32 != 10 || result->value[1].f32 != 15) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_MARGIN is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeScrollBarMargin012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_MARGIN);
    if(result->value[0].f32 != 10 || result->value[1].f32 != 15) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_BAR_MARGIN is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeMaxZoomScale001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue maxZoomScale_value[] = { {.f32 = 3} };
    ArkUI_AttributeItem maxZoomScale_item = {maxZoomScale_value, sizeof(maxZoomScale_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_MAX_ZOOM_SCALE, &maxZoomScale_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_MAX_ZOOM_SCALE);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_MAX_ZOOM_SCALE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "rxw",
                 "NODE_TOUCH_EVENT2:%{public}f.", result->value[0].f32);
    if(result->value[0].f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_MAX_ZOOM_SCALE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeMaxZoomScale002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_MAX_ZOOM_SCALE);
    if(result->value[0].f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_MAX_ZOOM_SCALE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeMaxZoomScale011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue maxZoomScale_value[] = { {.f32 = 3} };
    ArkUI_AttributeItem maxZoomScale_item = {maxZoomScale_value, sizeof(maxZoomScale_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_MAX_ZOOM_SCALE, &maxZoomScale_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_MAX_ZOOM_SCALE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "rxw",
                 "NODE_TOUCH_EVENT2:%{public}f.", result->value[0].f32);
    if(result->value[0].f32 != 3) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_MAX_ZOOM_SCALE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeMaxZoomScale012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_MAX_ZOOM_SCALE);
    if(result->value[0].f32 != 3) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_MAX_ZOOM_SCALE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeMinZoomScale001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue minZoomScale_value[] = { {.f32 = 0.9} };
    ArkUI_AttributeItem minZoomScale_item = {minZoomScale_value, sizeof(minZoomScale_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_MIN_ZOOM_SCALE, &minZoomScale_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_MIN_ZOOM_SCALE);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_MIN_ZOOM_SCALE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "rxw",
                 "NODE_TOUCH_EVENT2:%{public}f.", result->value[0].f32);
    if(result->value[0].f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_MIN_ZOOM_SCALE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeMinZoomScale002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_MIN_ZOOM_SCALE);
    if(result->value[0].f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_MIN_ZOOM_SCALE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeMinZoomScale011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue minZoomScale_value[] = { {.f32 = 1} };
    ArkUI_AttributeItem minZoomScale_item = {minZoomScale_value, sizeof(minZoomScale_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_MIN_ZOOM_SCALE, &minZoomScale_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_MIN_ZOOM_SCALE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "rxw",
                 "MinZoomScale011:%{public}f.", result->value[0].f32);
    if(result->value[0].f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_MIN_ZOOM_SCALE is 111 error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeMinZoomScale012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_MIN_ZOOM_SCALE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "rxw",
                 "MinZoomScale0111:%{public}f.", result->value[0].f32);
    if(result->value[0].f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_MIN_ZOOM_SCALE is 1111 error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeZoomScale001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ZoomScale_value[] = { {.f32 = 1} };
    ArkUI_AttributeItem ZoomScale_item = {ZoomScale_value, sizeof(ZoomScale_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_ZOOM_SCALE, &ZoomScale_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_ZOOM_SCALE);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ZOOM_SCALE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "rxw",
                 "NODE_TOUCH_EVENT2:%{public}f.", result->value[0].f32);
    if(result->value[0].f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ZOOM_SCALE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeZoomScale002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ZOOM_SCALE);
    if(result->value[0].f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ZOOM_SCALE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeZoomScale011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ZoomScale_value[] = { {.f32 = 1} };
    ArkUI_AttributeItem ZoomScale_item = {ZoomScale_value, sizeof(ZoomScale_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_ZOOM_SCALE, &ZoomScale_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ZOOM_SCALE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "rxw",
                 "NODE_TOUCH_EVENT2:%{public}f.", result->value[0].f32);
    if(result->value[0].f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ZOOM_SCALE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeZoomScale012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ZOOM_SCALE);
    if(result->value[0].f32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ZOOM_SCALE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnableZoom001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue enableZoom_value[] = { {.i32 = 1} };
    ArkUI_AttributeItem enableZoom_item = {enableZoom_value, sizeof(enableZoom_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_BOUNCES_ZOOM, &enableZoom_item);
    nodeAPI->resetAttribute(scroll, NODE_SCROLL_ENABLE_BOUNCES_ZOOM);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_BOUNCES_ZOOM);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "rxw",
                 "NODE_TOUCH_EVENT2:%{public}d.", result->value[0].i32);
    if(result->value[0].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_BOUNCES_ZOOM is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnableZoom002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_BOUNCES_ZOOM);
    if(result->value[0].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_BOUNCES_ZOOM is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnableZoom011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue enableZoom_value[] = { {.i32 = 1} };
    ArkUI_AttributeItem enableZoom_item = {enableZoom_value, sizeof(enableZoom_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_BOUNCES_ZOOM, &enableZoom_item);
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_BOUNCES_ZOOM);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "rxw",
                 "NODE_TOUCH_EVENT2:%{public}d.", result->value[0].i32);
    if(result->value[0].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_BOUNCES_ZOOM is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnableZoom012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &scroll, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_BOUNCES_ZOOM);
    if(result->value[0].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_SCROLL_ENABLE_BOUNCES_ZOOM is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}
//滚动事件
void TestNodeScrollEvent001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, NODE_SCROLL_EVENT_ON_SCROLL, nullptr);
}

void TestNodeScrollEvent002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_SCROLL");
        }
    });
}


void TestNodeScrollEvent101(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, NODE_SCROLL_EVENT_ON_SCROLL, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL);
}

void TestNodeScrollEvent102(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_SCROLL");
        }
    });
}

void TestNodeScrollEvent003(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN, NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN, nullptr);
}

void TestNodeScrollEvent004(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN");
        }
    });
}


void TestNodeScrollEvent103(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN, NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN);
}

void TestNodeScrollEvent104(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN");
        }
    });
}

void TestNodeScrollEvent005(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_SCROLL, NODE_SCROLL_EVENT_ON_WILL_SCROLL, nullptr);
}

void TestNodeScrollEvent006(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_WILL_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_WILL_SCROLL");
        }
    });
}


void TestNodeScrollEvent105(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_SCROLL, NODE_SCROLL_EVENT_ON_WILL_SCROLL, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_SCROLL);
}

void TestNodeScrollEvent106(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_WILL_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_WILL_SCROLL");
        }
    });
}

void TestNodeScrollEvent007(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_SCROLL, NODE_SCROLL_EVENT_ON_DID_SCROLL, nullptr);
}

void TestNodeScrollEvent008(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_DID_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_DID_SCROLL");
        }
    });
}


void TestNodeScrollEvent107(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_SCROLL, NODE_SCROLL_EVENT_ON_DID_SCROLL, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_SCROLL);
}

void TestNodeScrollEvent108(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_DID_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_DID_SCROLL");
        }
    });
}

void TestNodeScrollEvent009(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_START, NODE_SCROLL_EVENT_ON_SCROLL_START, nullptr);
}

void TestNodeScrollEvent010(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_SCROLL_START) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_SCROLL_START");
        }
    });
}


void TestNodeScrollEvent109(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_START, NODE_SCROLL_EVENT_ON_SCROLL_START, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_START);
}

void TestNodeScrollEvent110(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_SCROLL_START) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_SCROLL_START");
        }
    });
}

void TestNodeScrollEvent011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_STOP, NODE_SCROLL_EVENT_ON_SCROLL_STOP, nullptr);
}

void TestNodeScrollEvent012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_SCROLL_STOP) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_SCROLL_STOP");
        }
    });
}


void TestNodeScrollEvent111(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_STOP, NODE_SCROLL_EVENT_ON_SCROLL_STOP, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_STOP);
}

void TestNodeScrollEvent112(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_SCROLL_STOP) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_SCROLL_STOP");
        }
    });
}

void TestNodeScrollEvent013(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_EDGE, NODE_SCROLL_EVENT_ON_SCROLL_EDGE, nullptr);
}

void TestNodeScrollEvent014(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_SCROLL_EDGE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_SCROLL_EDGE");
        }
    });
}

void TestNodeScrollEvent113(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_EDGE, NODE_SCROLL_EVENT_ON_SCROLL_EDGE, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL_EDGE);
}

void TestNodeScrollEvent114(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_SCROLL_EDGE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_SCROLL_EDGE");
        }
    });
}

void TestNodeScrollEvent015(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_REACH_START, NODE_SCROLL_EVENT_ON_REACH_START, nullptr);
}

void TestNodeScrollEvent016(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_REACH_START) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_REACH_START");
        }
    });
}


void TestNodeScrollEvent115(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_REACH_START, NODE_SCROLL_EVENT_ON_REACH_START, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_REACH_START);
}

void TestNodeScrollEvent116(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_REACH_START) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_REACH_START");
        }
    });
}

void TestNodeScrollEvent017(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_REACH_END, NODE_SCROLL_EVENT_ON_REACH_END, nullptr);
}

void TestNodeScrollEvent018(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_REACH_END) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_REACH_END");
        }
    });
}

void TestNodeScrollEvent117(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_REACH_END, NODE_SCROLL_EVENT_ON_REACH_END, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_REACH_END);
}

void TestNodeScrollEvent118(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_REACH_END) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_REACH_END");
        }
    });
}

void TestNodeScrollEvent019(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING, NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING, nullptr);
}

void TestNodeScrollEvent020(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING");
        }
    });
}


void TestNodeScrollEvent119(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING, NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING);
}

void TestNodeScrollEvent120(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING");
        }
    });
}

void TestNodeScrollEvent021(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_ZOOM, NODE_SCROLL_EVENT_ON_DID_ZOOM, nullptr);
}

void TestNodeScrollEvent022(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_DID_ZOOM) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_DID_ZOOM");
        }
    });
}

void TestNodeScrollEvent121(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_ZOOM, NODE_SCROLL_EVENT_ON_DID_ZOOM, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_ZOOM);
}

void TestNodeScrollEvent122(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_DID_ZOOM) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_DID_ZOOM");
        }
    });
}

void TestNodeScrollEvent023(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_ZOOM_START, NODE_SCROLL_EVENT_ON_ZOOM_START, nullptr);
}

void TestNodeScrollEvent024(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_ZOOM_START) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent scroll NODE_SCROLL_EVENT_ON_ZOOM_START");
        }
    });
}

void TestNodeScrollEvent123(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_ZOOM_START, NODE_SCROLL_EVENT_ON_ZOOM_START, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_ZOOM_START);
}

void TestNodeScrollEvent124(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_ZOOM_START) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent scroll NODE_SCROLL_EVENT_ON_ZOOM_START");
        }
    });
}

void TestNodeScrollEvent025(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_ZOOM_STOP, NODE_SCROLL_EVENT_ON_ZOOM_STOP, nullptr);
}

void TestNodeScrollEvent026(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_ZOOM_STOP) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent NODE_SCROLL_EVENT_ON_ZOOM_STOP");
        }
    });
}

void TestNodeScrollEvent125(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_ZOOM_STOP, NODE_SCROLL_EVENT_ON_ZOOM_STOP, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_ZOOM_STOP);
}

void TestNodeScrollEvent126(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_ZOOM_STOP) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent NODE_SCROLL_EVENT_ON_ZOOM_STOP");
        }
    });
}

void TestNodeScrollEvent027(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_START_DRAGGING, NODE_SCROLL_EVENT_ON_WILL_START_DRAGGING, nullptr);
}

void TestNodeScrollEvent028(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_WILL_START_DRAGGING) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent NODE_SCROLL_EVENT_ON_WILL_START_DRAGGING");
        }
    });
}

void TestNodeScrollEvent127(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_START_DRAGGING, NODE_SCROLL_EVENT_ON_WILL_START_DRAGGING, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_START_DRAGGING);
}

void TestNodeScrollEvent128(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_WILL_START_DRAGGING) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent NODE_SCROLL_EVENT_ON_WILL_START_DRAGGING");
        }
    });
}

void TestNodeScrollEvent029(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_STOP_DRAGGING, NODE_SCROLL_EVENT_ON_DID_STOP_DRAGGING, nullptr);
}

void TestNodeScrollEvent030(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_DID_STOP_DRAGGING) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent NODE_SCROLL_EVENT_ON_DID_STOP_DRAGGING");
        }
    });
}

void TestNodeScrollEvent129(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_STOP_DRAGGING, NODE_SCROLL_EVENT_ON_DID_STOP_DRAGGING, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_STOP_DRAGGING);
}

void TestNodeScrollEvent130(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_DID_STOP_DRAGGING) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent NODE_SCROLL_EVENT_ON_DID_STOP_DRAGGING");
        }
    });
}

void TestNodeScrollEvent031(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_START_FLING, NODE_SCROLL_EVENT_ON_WILL_START_FLING, nullptr);
}

void TestNodeScrollEvent032(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_WILL_START_FLING) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent NODE_SCROLL_EVENT_ON_WILL_START_FLING");
        }
    });
}

void TestNodeScrollEvent131(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_START_FLING, NODE_SCROLL_EVENT_ON_WILL_START_FLING, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_WILL_START_FLING);
}

void TestNodeScrollEvent132(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_WILL_START_FLING) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent NODE_SCROLL_EVENT_ON_WILL_START_FLING");
        }
    });
}

void TestNodeScrollEvent033(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_STOP_FLING, NODE_SCROLL_EVENT_ON_DID_STOP_FLING, nullptr);
}

void TestNodeScrollEvent034(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SCROLL_EVENT_ON_DID_STOP_FLING) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "RegisterEvent NODE_SCROLL_EVENT_ON_WILL_START_FLING");
        }
    });
}

void TestNodeScrollEvent133(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_STOP_FLING, NODE_SCROLL_EVENT_ON_DID_STOP_FLING, nullptr);
    nodeAPI->unregisterNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_STOP_FLING);
}

void TestNodeScrollEvent134(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle scroll)
{
    nodeAPI->addNodeEventReceiver(scroll, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_SCROLL_EVENT_ON_DID_STOP_FLING) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_SCROLL_LOG, "UnRegisterEvent NODE_SCROLL_EVENT_ON_DID_STOP_FLING");
        }
    });
}

void TestNodeInitScrollAttribute001(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "Scroll capi is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonScrollID1"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    nodeList.push_back(scroll);
    nodeList.push_back(button);
    TestNodeScrollBar001(nodeAPI, scroll, button);
    TestNodeScrollBarWidth001(nodeAPI, scroll, button);
    TestNodeScrollBarColor001(nodeAPI, scroll, button);
    TestNodeScrollBarDirection001(nodeAPI, scroll, button);
    TestNodeEdgeEffect001(nodeAPI, scroll, button);
    TestNodeScrollInteraction001(nodeAPI, scroll, button);
    TestNodeNestedScroll001(nodeAPI, scroll, button);
    TestNodeScrollOffset001(nodeAPI, scroll, button);
    TestNodeEnablePaging001(nodeAPI, scroll, button);
    TestNodeFadingEdge001(nodeAPI, scroll, button);
    TestNodeContentStartOffset001(nodeAPI, scroll, button);
    TestNodeContentEndOffset001(nodeAPI, scroll, button);
    TestNodeClipContent001(nodeAPI, scroll, button);
    TestNodeScrollBarMargin001(nodeAPI, scroll, button);
    TestNodeMaxZoomScale001(nodeAPI, scroll, button);
    TestNodeMinZoomScale001(nodeAPI, scroll, button);
    TestNodeZoomScale001(nodeAPI, scroll, button);
    TestNodeEnableZoom001(nodeAPI, scroll, button);
    TestNodeScrollEvent001(nodeAPI, scroll);
    TestNodeScrollEvent003(nodeAPI, scroll);
    TestNodeScrollEvent005(nodeAPI, scroll);
    TestNodeScrollEvent007(nodeAPI, scroll);
    TestNodeScrollEvent009(nodeAPI, scroll);
    TestNodeScrollEvent011(nodeAPI, scroll);
    TestNodeScrollEvent013(nodeAPI, scroll);
    TestNodeScrollEvent015(nodeAPI, scroll);
    TestNodeScrollEvent017(nodeAPI, scroll);
    TestNodeScrollEvent019(nodeAPI, scroll);
    TestNodeScrollEvent021(nodeAPI, scroll);
    TestNodeScrollEvent023(nodeAPI, scroll);
    TestNodeScrollEvent025(nodeAPI, scroll);
    TestNodeScrollEvent027(nodeAPI, scroll);
    TestNodeScrollEvent029(nodeAPI, scroll);
    TestNodeScrollEvent031(nodeAPI, scroll);
    TestNodeScrollEvent033(nodeAPI, scroll);
}
//
void TestNodeInitScrollAttribute002(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto scroll = nodeList[0];
    auto button = nodeList[1];
    if (scroll) {
        // 主线程读属性
        TestNodeScrollBar002(nodeAPI, scroll, button);
        TestNodeScrollBarWidth002(nodeAPI, scroll, button);
        TestNodeScrollBarColor002(nodeAPI, scroll, button);
        TestNodeScrollBarDirection002(nodeAPI, scroll, button);
        TestNodeEdgeEffect002(nodeAPI, scroll, button);
        TestNodeScrollInteraction002(nodeAPI, scroll, button);
        TestNodeNestedScroll002(nodeAPI, scroll, button);
        TestNodeScrollOffset002(nodeAPI, scroll, button);
        TestNodeEnablePaging002(nodeAPI, scroll, button);
        TestNodeFadingEdge002(nodeAPI, scroll, button);
        TestNodeContentStartOffset002(nodeAPI, scroll, button);
        TestNodeContentEndOffset002(nodeAPI, scroll, button);
        TestNodeClipContent002(nodeAPI, scroll, button);
        TestNodeScrollBarMargin002(nodeAPI, scroll, button);
        TestNodeMaxZoomScale002(nodeAPI, scroll, button);
        TestNodeMinZoomScale002(nodeAPI, scroll, button);
        TestNodeZoomScale002(nodeAPI, scroll, button);
        TestNodeEnableZoom002(nodeAPI, scroll, button);
        TestNodeScrollEvent002(nodeAPI, scroll);
        TestNodeScrollEvent004(nodeAPI, scroll);
        TestNodeScrollEvent006(nodeAPI, scroll);
        TestNodeScrollEvent008(nodeAPI, scroll);
        TestNodeScrollEvent010(nodeAPI, scroll);
        TestNodeScrollEvent012(nodeAPI, scroll);
        TestNodeScrollEvent014(nodeAPI, scroll);
        TestNodeScrollEvent016(nodeAPI, scroll);
        TestNodeScrollEvent018(nodeAPI, scroll);
        TestNodeScrollEvent020(nodeAPI, scroll);
        TestNodeScrollEvent022(nodeAPI, scroll);
        TestNodeScrollEvent024(nodeAPI, scroll);
        TestNodeScrollEvent026(nodeAPI, scroll);
        TestNodeScrollEvent028(nodeAPI, scroll);
        TestNodeScrollEvent030(nodeAPI, scroll);
        TestNodeScrollEvent032(nodeAPI, scroll);
        TestNodeScrollEvent034(nodeAPI, scroll);
    }
}
void TestNodeInitScrollAttribute011(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "Scroll2 capi is successful"};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem1 = {.string = "buttonScrollID2"};
    nodeAPI->setAttribute(button1, NODE_ID, &idItem1);
    auto scroll1 = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    nodeList.push_back(scroll1);
    nodeList.push_back(button1);
    TestNodeScrollBar011(nodeAPI, scroll1, button1);
    TestNodeScrollBarWidth011(nodeAPI, scroll1, button1);
    TestNodeScrollBarColor001(nodeAPI, scroll1, button1);
    TestNodeScrollBarDirection011(nodeAPI, scroll1, button1);
    TestNodeEdgeEffect011(nodeAPI, scroll1, button1);
    TestNodeScrollInteraction011(nodeAPI, scroll1, button1);
    TestNodeNestedScroll011(nodeAPI, scroll1, button1);
    TestNodeScrollOffset011(nodeAPI, scroll1, button1);
    TestNodeEnablePaging011(nodeAPI, scroll1, button1);
    TestNodeFadingEdge011(nodeAPI, scroll1, button1);
    TestNodeContentStartOffset011(nodeAPI, scroll1, button1);
    TestNodeContentEndOffset011(nodeAPI, scroll1, button1);
    TestNodeClipContent011(nodeAPI, scroll1, button1);
    TestNodeScrollBarMargin011(nodeAPI, scroll1, button1);
    TestNodeZoomScale011(nodeAPI, scroll1, button1);
    TestNodeEnableZoom011(nodeAPI, scroll1, button1);
    TestNodeScrollEvent101(nodeAPI, scroll1);
    TestNodeScrollEvent103(nodeAPI, scroll1);
    TestNodeScrollEvent105(nodeAPI, scroll1);
    TestNodeScrollEvent107(nodeAPI, scroll1);
    TestNodeScrollEvent109(nodeAPI, scroll1);
    TestNodeScrollEvent111(nodeAPI, scroll1);
    TestNodeScrollEvent115(nodeAPI, scroll1);
    TestNodeScrollEvent117(nodeAPI, scroll1);
    TestNodeScrollEvent119(nodeAPI, scroll1);
    TestNodeScrollEvent121(nodeAPI, scroll1);
    TestNodeScrollEvent123(nodeAPI, scroll1);
    TestNodeScrollEvent125(nodeAPI, scroll1);
    TestNodeScrollEvent127(nodeAPI, scroll1);
    TestNodeScrollEvent129(nodeAPI, scroll1);
    TestNodeScrollEvent131(nodeAPI, scroll1);
    TestNodeScrollEvent133(nodeAPI, scroll1);
}
void TestNodeInitScrollAttribute012(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto scroll = nodeList[2];
    auto button = nodeList[3];
    if (scroll) {
        TestNodeScrollBar012(nodeAPI, scroll, button);
        TestNodeScrollBarWidth012(nodeAPI, scroll, button);
        TestNodeScrollBarColor002(nodeAPI, scroll, button);
        TestNodeScrollBarDirection012(nodeAPI, scroll, button);
        TestNodeEdgeEffect012(nodeAPI, scroll, button);
        TestNodeScrollInteraction012(nodeAPI, scroll, button);
        TestNodeNestedScroll012(nodeAPI, scroll, button);
        TestNodeScrollOffset012(nodeAPI, scroll, button);
        TestNodeEnablePaging012(nodeAPI, scroll, button);
        TestNodeFadingEdge012(nodeAPI, scroll, button);
        TestNodeContentStartOffset012(nodeAPI, scroll, button);
        TestNodeContentEndOffset012(nodeAPI, scroll, button);
        TestNodeClipContent012(nodeAPI, scroll, button);
        TestNodeScrollBarMargin012(nodeAPI, scroll, button);
        TestNodeZoomScale012(nodeAPI, scroll, button);
        TestNodeEnableZoom012(nodeAPI, scroll, button);
        TestNodeScrollEvent102(nodeAPI, scroll);
        TestNodeScrollEvent104(nodeAPI, scroll);
        TestNodeScrollEvent106(nodeAPI, scroll);
        TestNodeScrollEvent108(nodeAPI, scroll);
        TestNodeScrollEvent110(nodeAPI, scroll);
        TestNodeScrollEvent112(nodeAPI, scroll);
        TestNodeScrollEvent114(nodeAPI, scroll);
        TestNodeScrollEvent116(nodeAPI, scroll);
        TestNodeScrollEvent118(nodeAPI, scroll);
        TestNodeScrollEvent120(nodeAPI, scroll);
        TestNodeScrollEvent122(nodeAPI, scroll);
        TestNodeScrollEvent124(nodeAPI, scroll);
        TestNodeScrollEvent126(nodeAPI, scroll);
        TestNodeScrollEvent128(nodeAPI, scroll);
        TestNodeScrollEvent130(nodeAPI, scroll);
        TestNodeScrollEvent132(nodeAPI, scroll);
        TestNodeScrollEvent134(nodeAPI, scroll);
    }
}
void TestNodeInitScrollAttribute101(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "Scroll3 capi is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonScrollID3"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    nodeList.push_back(scroll);
    nodeList.push_back(button);
    TestNodeMaxZoomScale011(nodeAPI, scroll, button);
    TestNodeMinZoomScale011(nodeAPI, scroll, button);
}
void TestNodeInitScrollAttribute102(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto scroll = nodeList[4];
    auto button = nodeList[5];
    if (scroll) {
        TestNodeMaxZoomScale012(nodeAPI, scroll, button);
        TestNodeMinZoomScale012(nodeAPI, scroll, button);
    }
}
void RunOnSubThreadScroll(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    TestNodeInitScrollAttribute001(nodeAPI, nodeList);
    TestNodeInitScrollAttribute011(nodeAPI, nodeList);
    TestNodeInitScrollAttribute101(nodeAPI, nodeList);
}

void RunOnUIThreadScroll(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    // 获取在RunOnSubThreadScroll中保存到nodeList中的组件
    TestNodeInitScrollAttribute002(nodeAPI, nodeList);
    TestNodeInitScrollAttribute012(nodeAPI, nodeList);
    TestNodeInitScrollAttribute102(nodeAPI, nodeList);
}

napi_value ScrollAttributeTest::CreateNativeScrollNode(napi_env env, napi_callback_info info)
{
    return tester->CreateCNodeTreeScroll(env, info, RunOnUIThreadScroll, RunOnSubThreadScroll);
}

napi_value ScrollAttributeTest::DisposeNativeScrollNode(napi_env env, napi_callback_info info)
{
    // 释放组件
    return tester->DisposeCNodeTreeScroll(env, info);
}
}

