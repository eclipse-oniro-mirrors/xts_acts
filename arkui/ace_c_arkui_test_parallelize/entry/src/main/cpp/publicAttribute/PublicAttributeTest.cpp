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
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <hilog/log.h>
#include <vector>

const float VALUE_0 = 0.0;
const float VALUE_0_5 = 0.5;
const float VALUE_2 = 2.0;
const float VALUE_3 = 3.0;
const float VALUE_3_5 = 3.5;
const float VALUE_4 = 4.0;
const float VALUE_10 = 10.0;
const float VALUE_20 = 20.0;
const float VALUE_100 = 100.0;

namespace ArkUICApiAttributeDemo {
namespace {
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
}

void TestNodeBackgroundColor001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue backColorValue[] = {{.u32 = 0xFF009A61}};
    ArkUI_AttributeItem backColorItem = {backColorValue, 1};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &backColorItem);
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_COLOR);
    if(result->value->u32!=0xFF009A61) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_COLOR is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundColor002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_COLOR);
    if(result->value->u32!=0xFF009A61) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_COLOR is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImage001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue bgImage_value[] = { {.i32 = ARKUI_IMAGE_REPEAT_NONE} };
    ArkUI_AttributeItem bgImage_item = { bgImage_value, sizeof(bgImage_value) / sizeof(ArkUI_NumberValue), "resource://media/startIcon.png" };
    nodeAPI->setAttribute(button, NODE_BACKGROUND_IMAGE, &bgImage_item);
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE);
    if(result->value->i32 != ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_NONE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set ARKUI_IMAGE_REPEAT_NONE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImage002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE);
    if(result->value->i32 != ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_NONE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set ARKUI_IMAGE_REPEAT_NONE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeZIndex001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue zIndexValue3[] = {{.i32 = 1}};
    ArkUI_AttributeItem zIndexItem3 = {zIndexValue3, 1};
    nodeAPI->setAttribute(button, NODE_Z_INDEX, &zIndexItem3);
    auto result = nodeAPI->getAttribute(button, NODE_Z_INDEX);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_Z_INDEX is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeZIndex002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_Z_INDEX);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_Z_INDEX is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeVisibility001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue visibilityValue[] = {{.i32 = ARKUI_VISIBILITY_VISIBLE}};
    ArkUI_AttributeItem visibilityItem = {visibilityValue, 1};
    nodeAPI->setAttribute(button, NODE_VISIBILITY, &visibilityItem);
    auto result = nodeAPI->getAttribute(button, NODE_VISIBILITY);
    if(result->value->i32 != ARKUI_VISIBILITY_VISIBLE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_VISIBILITY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeVisibility002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_VISIBILITY);
    if(result->value->i32 != ARKUI_VISIBILITY_VISIBLE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_VISIBILITY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeHitTestBehavior001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue hitValChild[] = {{.i32 = ARKUI_HIT_TEST_MODE_TRANSPARENT}};
    ArkUI_AttributeItem hitItemChild = {hitValChild, 1};
    nodeAPI->setAttribute(button, NODE_HIT_TEST_BEHAVIOR, &hitItemChild);
    auto result = nodeAPI->getAttribute(button, NODE_HIT_TEST_BEHAVIOR);
    if(result->value->i32 != ARKUI_HIT_TEST_MODE_TRANSPARENT) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_HIT_TEST_BEHAVIOR is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeHitTestBehavior002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_HIT_TEST_BEHAVIOR);
    if(result->value->i32 != ARKUI_HIT_TEST_MODE_TRANSPARENT) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_HIT_TEST_BEHAVIOR is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImageSize001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue sizeArray[] = { { .f32 = 20 }, { .f32 = 100 } };
    ArkUI_AttributeItem backgroundImageSize_item = { .value = sizeArray, .size = 2};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_IMAGE_SIZE, &backgroundImageSize_item);
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_SIZE);
    if(result->value[0].f32 != VALUE_20 || result->value[1].f32 != VALUE_100) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_SIZE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImageSize002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_SIZE);
    if(result->value[0].f32 != VALUE_20 || result->value[1].f32 != VALUE_100) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_SIZE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImageSizeWithStyle001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue blurStyle[] = {{ .i32 = 0}};
    ArkUI_AttributeItem backgroundBlurStyle_item = { .value = blurStyle, .size = 1};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE, &backgroundBlurStyle_item);
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE);
    if(result->value->i32 != PARAM_2) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImageSizeWithStyle002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE);
    if(result->value->i32 != PARAM_2) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeDefaultFocus001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue defaultFocusValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem focusableItem = { defaultFocusValue, 1 };
    nodeAPI->setAttribute(button, NODE_DEFAULT_FOCUS, &focusableItem);
    auto result = nodeAPI->getAttribute(button, NODE_DEFAULT_FOCUS);
    if(result->value->i32 != PARAM_1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_DEFAULT_FOCUS is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeDefaultFocus002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_DEFAULT_FOCUS);
    if(result->value->i32 != PARAM_1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_DEFAULT_FOCUS is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeResponseRegion001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue responseRegion_value[] = { 0, 0, 100, 100 };
    ArkUI_AttributeItem responseRegion_item = {responseRegion_value, sizeof(responseRegion_value)/sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_RESPONSE_REGION, &responseRegion_item);
    auto result = nodeAPI->getAttribute(button, NODE_RESPONSE_REGION);
    if(result->value[0].f32 != VALUE_0 || result->value[1].f32 != VALUE_0 ||
        result->value[PARAM_2].f32 != VALUE_100 || result->value[PARAM_3].f32 != VALUE_100) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_RESPONSE_REGION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeResponseRegion002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_RESPONSE_REGION);
    if(result->value[0].f32 != VALUE_0 || result->value[1].f32 != VALUE_0 ||
        result->value[PARAM_2].f32 != VALUE_100 || result->value[PARAM_3].f32 != VALUE_100) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_RESPONSE_REGION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeOverlay001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue overlay_value[] = { {.i32 = ARKUI_ALIGNMENT_TOP_START}, 0, 10};
    ArkUI_AttributeItem overlay_item = { overlay_value, sizeof(overlay_value) / sizeof(ArkUI_NumberValue), "test" };
    nodeAPI->setAttribute(button, NODE_OVERLAY, &overlay_item);
    auto result = nodeAPI->getAttribute(button, NODE_OVERLAY);
    if(result->value[0].i32 != PARAM_0 || result->value[1].f32 != VALUE_0 || result->value[PARAM_2].f32 != VALUE_10) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_OVERLAY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}
void TestNodeOverlay002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_OVERLAY);
    if(result->value[0].i32 != PARAM_0 || result->value[1].f32 != VALUE_0 || result->value[PARAM_2].f32 != VALUE_10) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_OVERLAY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImagePosition001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue positionArray[] = { 20, 0};
    ArkUI_AttributeItem backgroundImagePosition_item = { .value = positionArray, .size = 2};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_IMAGE_POSITION, &backgroundImagePosition_item);
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_POSITION);
    if(result->value[0].f32 != VALUE_20 || result->value[1].f32 != VALUE_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_POSITION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImagePosition002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_POSITION);
    if(result->value[0].f32 != VALUE_20 || result->value[1].f32 != VALUE_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_POSITION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeFocusOnTouch001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue focusOnTouchValue[] = {{.i32 = 1}};
    ArkUI_AttributeItem focusOnTouchItem = {focusOnTouchValue, 1};
    nodeAPI->setAttribute(button, NODE_FOCUS_ON_TOUCH, &focusOnTouchItem);
    auto result = nodeAPI->getAttribute(button, NODE_FOCUS_ON_TOUCH);
    if(result->value->i32 != PARAM_1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_FOCUS_ON_TOUCH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeFocusOnTouch002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_FOCUS_ON_TOUCH);
    if(result->value->i32 != PARAM_1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_FOCUS_ON_TOUCH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeVisibleAreaChangeRatiO001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue visibleAreaChangeRatio_value[] = { { .f32 = 0.5 } };
    ArkUI_AttributeItem visibleAreaChangeRatio_item = {visibleAreaChangeRatio_value, 1};
    nodeAPI->setAttribute(button, NODE_VISIBLE_AREA_CHANGE_RATIO, &visibleAreaChangeRatio_item);
    auto result = nodeAPI->getAttribute(button, NODE_VISIBLE_AREA_CHANGE_RATIO);
    if(result->value->f32 != VALUE_0_5) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_VISIBLE_AREA_CHANGE_RATIO is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeVisibleAreaChangeRatiO002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_VISIBLE_AREA_CHANGE_RATIO);
    if(result->value->f32 != VALUE_0_5) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_VISIBLE_AREA_CHANGE_RATIO is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeTabStop001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue tabStop_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem tabStop_item = {tabStop_value, sizeof(tabStop_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_TAB_STOP, &tabStop_item);
    auto result = nodeAPI->getAttribute(button, NODE_TAB_STOP);
    if(result->value->i32 != PARAM_1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_TAB_STOP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeTabStop002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_TAB_STOP);
    if(result->value->i32 != PARAM_1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_TAB_STOP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImageResizableWithSlice001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue sliceVec[] = { {.f32= 2.0}, {.f32= 3.0}, {.f32= 3.5}, {.f32= 4.0} };
    ArkUI_AttributeItem slice = {.value = sliceVec, .size = 4};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE, &slice);
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE);
    if(result->value[0].f32 != VALUE_2 || result->value[1].f32 != VALUE_3 ||
        result->value[PARAM_2].f32 != VALUE_3_5 || result->value[PARAM_3].f32 != VALUE_4) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImageResizableWithSlice002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE);
    if(result->value[0].f32 != VALUE_2 || result->value[1].f32 != VALUE_3 ||
        result->value[PARAM_2].f32 != VALUE_3_5 || result->value[PARAM_3].f32 != VALUE_4) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnabled001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue enableValue[] = {{.i32 = false}};
    ArkUI_AttributeItem enableItem = {enableValue, 1};
    nodeAPI->setAttribute(button, NODE_ENABLED, &enableItem);
    auto result = nodeAPI->getAttribute(button, NODE_ENABLED);
    if(result->value->i32 != PARAM_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_ENABLED is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnabled002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_ENABLED);
    if(result->value->i32 != PARAM_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_ENABLED is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeInitAttribute001(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "Button1 is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonID1"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeList.push_back(button);
    TestNodeBackgroundColor001(nodeAPI, button);
    TestNodeBackgroundImage001(nodeAPI, button);
    TestNodeZIndex001(nodeAPI, button);
    TestNodeVisibility001(nodeAPI, button);
    TestNodeHitTestBehavior001(nodeAPI, button);
    TestNodeBackgroundImageSize001(nodeAPI, button);
    TestNodeDefaultFocus001(nodeAPI, button);
    TestNodeResponseRegion001(nodeAPI, button);
    TestNodeOverlay001(nodeAPI, button);
    TestNodeBackgroundImagePosition001(nodeAPI, button);
    TestNodeFocusOnTouch001(nodeAPI, button);
    TestNodeVisibleAreaChangeRatiO001(nodeAPI, button);
    TestNodeTabStop001(nodeAPI, button);
    TestNodeBackgroundImageResizableWithSlice001(nodeAPI, button);
}

void TestNodeInitAttribute101(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeList[0];
    if (button) {
        // 主线程读属性
        TestNodeBackgroundColor002(nodeAPI, button);
        TestNodeBackgroundImage002(nodeAPI, button);
        TestNodeZIndex002(nodeAPI, button);
        TestNodeVisibility002(nodeAPI, button);
        TestNodeHitTestBehavior002(nodeAPI, button);
        TestNodeBackgroundImageSize002(nodeAPI, button);
        TestNodeDefaultFocus002(nodeAPI, button);
        TestNodeResponseRegion002(nodeAPI, button);
        TestNodeOverlay002(nodeAPI, button);
        TestNodeBackgroundImagePosition002(nodeAPI, button);
        TestNodeFocusOnTouch002(nodeAPI, button);
        TestNodeVisibleAreaChangeRatiO002(nodeAPI, button);
        TestNodeTabStop002(nodeAPI, button);
        TestNodeBackgroundImageResizableWithSlice002(nodeAPI, button);
    }
}

void TestNodeInitAttribute002(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "Button2 is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonID2"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeList.push_back(button);
    TestNodeBackgroundImageSizeWithStyle001(nodeAPI, button);
    TestNodeEnabled001(nodeAPI, button);
}

void TestNodeInitAttribute102(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeList[1];
    if (button) {
        TestNodeBackgroundImageSizeWithStyle002(nodeAPI, button);
        TestNodeEnabled002(nodeAPI, button);
    }
}

void TestNodeBackgroundColor011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue backColorValue[] = {{.u32 = 0xFF009A61}};
    ArkUI_AttributeItem backColorItem = {backColorValue, 1};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &backColorItem);
    nodeAPI->resetAttribute(button, NODE_BACKGROUND_COLOR);
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_COLOR);
    if(result->value->u32 != 0xFF0A59F7) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_COLOR is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundColor012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_COLOR);
    if(result->value->u32 != 0xFF0A59F7) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_COLOR is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImage011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue bgImage_value[] = { {.i32 = ARKUI_IMAGE_REPEAT_NONE} };
    ArkUI_AttributeItem bgImage_item = { bgImage_value, sizeof(bgImage_value) / sizeof(ArkUI_NumberValue), "resource://media/startIcon.png" };
    nodeAPI->setAttribute(button, NODE_BACKGROUND_IMAGE, &bgImage_item);
    nodeAPI->resetAttribute(button, NODE_BACKGROUND_IMAGE);
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE);
    if(result->value->i32 != ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_NONE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImage012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE);
    if(result->value->i32 != ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_NONE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeZIndex011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue zIndexValue3[] = {{.i32 = 1}};
    ArkUI_AttributeItem zIndexItem3 = {zIndexValue3, 1};
    nodeAPI->setAttribute(button, NODE_Z_INDEX, &zIndexItem3);
    nodeAPI->resetAttribute(button, NODE_Z_INDEX);
    auto result = nodeAPI->getAttribute(button, NODE_Z_INDEX);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_Z_INDEX is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeZIndex012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_Z_INDEX);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_Z_INDEX is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeVisibility011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue visibilityValue[] = {{.i32 = ARKUI_VISIBILITY_VISIBLE}};
    ArkUI_AttributeItem visibilityItem = {visibilityValue, 1};
    nodeAPI->setAttribute(button, NODE_VISIBILITY, &visibilityItem);
    nodeAPI->resetAttribute(button, NODE_VISIBILITY);
    auto result = nodeAPI->getAttribute(button, NODE_VISIBILITY);
    if(result->value->i32 != ARKUI_VISIBILITY_VISIBLE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_VISIBILITY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeVisibility012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_VISIBILITY);
    if(result->value->i32 != ARKUI_VISIBILITY_VISIBLE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_VISIBILITY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeHitTestBehavior011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue hitValChild[] = {{.i32 = ARKUI_HIT_TEST_MODE_TRANSPARENT}};
    ArkUI_AttributeItem hitItemChild = {hitValChild, 1};
    nodeAPI->setAttribute(button, NODE_HIT_TEST_BEHAVIOR, &hitItemChild);
    nodeAPI->resetAttribute(button, NODE_HIT_TEST_BEHAVIOR);
    auto result = nodeAPI->getAttribute(button, NODE_HIT_TEST_BEHAVIOR);
    if(result->value->i32 != ARKUI_HIT_TEST_MODE_DEFAULT) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_HIT_TEST_BEHAVIOR is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeHitTestBehavior012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_HIT_TEST_BEHAVIOR);
    if(result->value->i32 != ARKUI_HIT_TEST_MODE_DEFAULT) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_HIT_TEST_BEHAVIOR is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImageSize011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue sizeArray[] = { { .f32 = 20 }, { .f32 = 100 } };
    ArkUI_AttributeItem backgroundImageSize_item = { .value = sizeArray, .size = 2};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_IMAGE_SIZE, &backgroundImageSize_item);
    nodeAPI->resetAttribute(button, NODE_BACKGROUND_IMAGE_SIZE);
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_SIZE);
    if(result->value[0].f32 != VALUE_0 || result->value[1].f32 != VALUE_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_SIZE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImageSize012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_SIZE);
    if(result->value[0].f32 != VALUE_0 || result->value[1].f32 != VALUE_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_SIZE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeDefaultFocus011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue defaultFocusValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem focusableItem = { defaultFocusValue, 1 };
    nodeAPI->setAttribute(button, NODE_DEFAULT_FOCUS, &focusableItem);
    nodeAPI->resetAttribute(button, NODE_DEFAULT_FOCUS);
    auto result = nodeAPI->getAttribute(button, NODE_DEFAULT_FOCUS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zdl", "NODE_DEFAULT_FOCUS %{public}d ", result->value->i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_DEFAULT_FOCUS is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeDefaultFocus012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
        // 主线程读属性
        auto result = nodeAPI->getAttribute(button, NODE_DEFAULT_FOCUS);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zdl", "NODE_DEFAULT_FOCUS %{public}d ", result->value->i32);
        if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_DEFAULT_FOCUS is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeResponseRegion011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue responseRegion_value[] = { 0, 0, 100, 100 };
    ArkUI_AttributeItem responseRegion_item = {responseRegion_value, sizeof(responseRegion_value)/sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_RESPONSE_REGION, &responseRegion_item);
    nodeAPI->resetAttribute(button, NODE_RESPONSE_REGION);
    auto result = nodeAPI->getAttribute(button, NODE_RESPONSE_REGION);
    if(result->value[0].f32 != VALUE_0 || result->value[1].f32 != VALUE_0 ||
        result->value[PARAM_2].f32 != VALUE_100 || result->value[PARAM_3].f32 != VALUE_100) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_RESPONSE_REGION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeResponseRegion012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_RESPONSE_REGION);
    if(result->value[0].f32 != VALUE_0 || result->value[1].f32 != VALUE_0 ||
        result->value[PARAM_2].f32 != VALUE_100 || result->value[PARAM_3].f32 != VALUE_100) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_RESPONSE_REGION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeOverlay011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue overlay_value[] = { {.i32 = ARKUI_ALIGNMENT_TOP_START}, 0, 10};
    ArkUI_AttributeItem overlay_item = { overlay_value, sizeof(overlay_value) / sizeof(ArkUI_NumberValue), "test" };
    nodeAPI->setAttribute(button, NODE_OVERLAY, &overlay_item);
    nodeAPI->resetAttribute(button, NODE_OVERLAY);
    auto result = nodeAPI->getAttribute(button, NODE_OVERLAY);
    if(result->value[0].i32 != 0 || result->value[1].f32 != VALUE_0 || result->value[PARAM_2].f32 != VALUE_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_OVERLAY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}
void TestNodeOverlay012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_OVERLAY);
    if(result->value[0].i32 != 0 || result->value[1].f32 != VALUE_0 || result->value[PARAM_2].f32 != VALUE_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_OVERLAY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImagePosition011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue positionArray[] = { 20, 0};
    ArkUI_AttributeItem backgroundImagePosition_item = { .value = positionArray, .size = 2};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_IMAGE_POSITION, &backgroundImagePosition_item);
    nodeAPI->resetAttribute(button, NODE_BACKGROUND_IMAGE_POSITION);
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_POSITION);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zdl", "NODE_BACKGROUND_IMAGE_POSITION %{public}f %{public}f ",
                 result->value[0].f32, result->value[1].f32);
    if(result->value[0].f32 != VALUE_0 || result->value[1].f32 != VALUE_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_POSITION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImagePosition012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_POSITION);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zdl", "NODE_BACKGROUND_IMAGE_POSITION %{public}f %{public}f ",
                 result->value[0].f32, result->value[1].f32);
    if(result->value[0].f32 != VALUE_0 || result->value[1].f32 != VALUE_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_POSITION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeFocusOnTouch011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue focusOnTouchValue[] = {{.i32 = 1}};
    ArkUI_AttributeItem focusOnTouchItem = {focusOnTouchValue, 1};
    nodeAPI->setAttribute(button, NODE_FOCUS_ON_TOUCH, &focusOnTouchItem);
    nodeAPI->resetAttribute(button, NODE_FOCUS_ON_TOUCH);
    auto result = nodeAPI->getAttribute(button, NODE_FOCUS_ON_TOUCH);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zdl", "NODE_FOCUS_ON_TOUCH %{public}d", result->value->i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_FOCUS_ON_TOUCH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeFocusOnTouch012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_FOCUS_ON_TOUCH);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zdl", "NODE_FOCUS_ON_TOUCH %{public}d", result->value->i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_FOCUS_ON_TOUCH is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeTabStop011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue tabStop_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem tabStop_item = {tabStop_value, sizeof(tabStop_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_TAB_STOP, &tabStop_item);
    nodeAPI->resetAttribute(button, NODE_TAB_STOP);
    auto result = nodeAPI->getAttribute(button, NODE_TAB_STOP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zdl", "NODE_TAB_STOP %{public}d",
                 result->value[0].i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_TAB_STOP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeTabStop012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_TAB_STOP);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zdl", "NODE_TAB_STOP %{public}d",
                 result->value[0].i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_TAB_STOP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImageResizableWithSlice011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue sliceVec[] = { {.f32= 2.0}, {.f32= 3.0}, {.f32= 3.5}, {.f32= 4.0} };
    ArkUI_AttributeItem slice = {.value = sliceVec, .size = 4};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE, &slice);
    nodeAPI->resetAttribute(button, NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE);
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE);
    if(result->value[0].f32 != VALUE_0 || result->value[1].f32 != VALUE_0 ||
        result->value[PARAM_2].f32 != VALUE_0 || result->value[PARAM_3].f32 != VALUE_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeBackgroundImageResizableWithSlice012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE);
    if(result->value[0].f32 != VALUE_0 || result->value[1].f32 != VALUE_0 ||
        result->value[PARAM_2].f32 != VALUE_0 || result->value[PARAM_3].f32 != VALUE_0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnabled011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue enableValue[] = {{.i32 = false}};
    ArkUI_AttributeItem enableItem = {enableValue, 1};
    nodeAPI->setAttribute(button, NODE_ENABLED, &enableItem);
    nodeAPI->resetAttribute(button, NODE_ENABLED);
    auto result = nodeAPI->getAttribute(button, NODE_ENABLED);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zdl", "NODE_ENABLED %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_ENABLED is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeEnabled012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(button, NODE_ENABLED);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zdl", "NODE_ENABLED %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_ENABLED is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}


void TestNodeInitAttribute011(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "Button3 is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonID3"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeList.push_back(button);
    TestNodeBackgroundColor011(nodeAPI, button);
    TestNodeBackgroundImage011(nodeAPI, button);
    TestNodeZIndex011(nodeAPI, button);
    TestNodeVisibility011(nodeAPI, button);
    TestNodeHitTestBehavior011(nodeAPI, button);
    TestNodeBackgroundImageSize011(nodeAPI, button);
    TestNodeDefaultFocus011(nodeAPI, button);
    TestNodeResponseRegion011(nodeAPI, button);
    TestNodeOverlay011(nodeAPI, button);
    TestNodeBackgroundImagePosition011(nodeAPI, button);
    TestNodeFocusOnTouch011(nodeAPI, button);
    TestNodeTabStop011(nodeAPI, button);
    TestNodeBackgroundImageResizableWithSlice011(nodeAPI, button);
}

void TestNodeInitAttribute111(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeList[PARAM_2];
    if (button) {
        TestNodeBackgroundColor012(nodeAPI, button);
        TestNodeBackgroundImage012(nodeAPI, button);
        TestNodeZIndex012(nodeAPI, button);
        TestNodeVisibility012(nodeAPI, button);
        TestNodeHitTestBehavior012(nodeAPI, button);
        TestNodeBackgroundImageSize012(nodeAPI, button);
        TestNodeDefaultFocus012(nodeAPI, button);
        TestNodeResponseRegion012(nodeAPI, button);
        TestNodeOverlay012(nodeAPI, button);
        TestNodeBackgroundImagePosition012(nodeAPI, button);
        TestNodeFocusOnTouch012(nodeAPI, button);
        TestNodeTabStop012(nodeAPI, button);
        TestNodeBackgroundImageResizableWithSlice012(nodeAPI, button);
    }
}

void TestNodeInitAttribute012(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "Button4 is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonID4"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeList.push_back(button);
    TestNodeEnabled011(nodeAPI, button);
}

void TestNodeInitAttribute112(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeList[PARAM_3];
    if (button) {
        TestNodeEnabled012(nodeAPI, button);
    }
}

void RunOnSubThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    TestNodeInitAttribute001(nodeAPI, nodeList);
    TestNodeInitAttribute002(nodeAPI, nodeList);
    TestNodeInitAttribute011(nodeAPI, nodeList);
    TestNodeInitAttribute012(nodeAPI, nodeList);
}

void RunOnUIThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    // 获取在RunOnSubThread中保存到nodeList中的组件
    TestNodeInitAttribute101(nodeAPI, nodeList);
    TestNodeInitAttribute102(nodeAPI, nodeList);
    TestNodeInitAttribute111(nodeAPI, nodeList);
    TestNodeInitAttribute112(nodeAPI, nodeList);
}
}