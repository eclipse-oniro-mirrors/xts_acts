/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "dragTest.h"
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double drag_DragPreviewOption_Dispose_001(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    OH_ArkUI_DragPreviewOption_Dispose(previewOptions);
    NAPI_END;
}

static ani_double drag_DragPreviewOption_SetScaleMode_002(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetScaleMode(previewOptions,
                        ArkUI_DragPreviewScaleMode::ARKUI_DRAG_PREVIEW_SCALE_DISABLED);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragPreviewOption_SetDefaultShadowEnabled_003(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetDefaultShadowEnabled(previewOptions, true);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragPreviewOption_SetDefaultRadiusEnabled_004(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetDefaultRadiusEnabled(previewOptions, true);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragPreviewOption_SetNumberBadgeEnabled_005(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetNumberBadgeEnabled(previewOptions, true);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragPreviewOption_SetBadgeNumber_006(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetBadgeNumber(previewOptions, 2147483647);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled_007(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled(previewOptions, true);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragPreviewOption_SetNodeDragPreviewOption_008(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_SetNodeDragPreviewOption(text, previewOptions);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}
}
