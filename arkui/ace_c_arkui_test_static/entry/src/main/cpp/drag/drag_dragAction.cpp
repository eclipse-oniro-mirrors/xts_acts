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
#define WIDTH 400
#define HEIGHT 600
#define TOUCHPOINTXY 200
namespace ArkUIAniTest {

static ani_double drag_DragAction_Dispose_001(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    OH_ArkUI_DragAction_Dispose(dragAction);
    NAPI_END;
}

static ani_double drag_DragAction_SetPointerId_002(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    auto returnValue = OH_ArkUI_DragAction_SetPointerId(dragAction, 1);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragAction_SetPixelMaps_003(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    uint8_t data[960000];
    size_t dataSize = 960000;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelmap = nullptr;
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmap);
    std::vector<OH_PixelmapNative *> pixelVector;
    pixelVector.push_back(pixelmap);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    auto returnValue = OH_ArkUI_DragAction_SetPixelMaps(dragAction, pixelVector.data(), pixelVector.size());
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragAction_SetTouchPointX_004(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    auto returnValue = OH_ArkUI_DragAction_SetTouchPointX(dragAction, TOUCHPOINTXY);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragAction_SetTouchPointY_005(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    auto returnValue = OH_ArkUI_DragAction_SetTouchPointY(dragAction, TOUCHPOINTXY);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragAction_SetDragPreviewOption_006(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragAction_SetDragPreviewOption(dragAction, previewOptions);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragAction_RegisterStatusListener_007(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ArkUI_ContextHandle context = OH_ArkUI_GetContextByNode(text);
    auto *dragAction = OH_ArkUI_CreateDragActionWithContext(context);
    auto returnValue = OH_ArkUI_DragAction_RegisterStatusListener(
        dragAction, nullptr, [](ArkUI_DragAndDropInfo *dragAndDropInfo, void *userData) -> void {});
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragAction_UnregisterStatusListener_008(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ArkUI_ContextHandle context = OH_ArkUI_GetContextByNode(text);
    auto *dragAction = OH_ArkUI_CreateDragActionWithContext(context);
    OH_ArkUI_DragAction_UnregisterStatusListener(dragAction);
    NAPI_END;
}

static ani_double drag_DragAction_StartDrag_009(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ArkUI_ContextHandle context = OH_ArkUI_GetContextByNode(text);
    auto *dragAction = OH_ArkUI_CreateDragActionWithContext(context);
    auto returnValue = OH_ArkUI_StartDrag(dragAction);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_DragAction_DragAndDropInfo_0010(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ArkUI_DragAndDropInfo *dragAndDropInfo = nullptr;
    ArkUI_DragStatus status = OH_ArkUI_DragAndDropInfo_GetDragStatus(dragAndDropInfo);
    ASSERT_EQ(status, PARAM_NEGATIVE_1);
    ArkUI_DragEvent *event = OH_ArkUI_DragAndDropInfo_GetDragEvent(dragAndDropInfo);
    ASSERT_OBJ(event, nullptr);
    NAPI_END;
}
}
