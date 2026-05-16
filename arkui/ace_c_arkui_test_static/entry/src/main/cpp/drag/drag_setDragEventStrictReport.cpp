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

static ani_double drag_setDragEventStrictReportWidthNode_001(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_setDragEventStrictReportWidthNode Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto returnValue = OH_ArkUI_SetDragEventStrictReportWithNode(text, true);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_setDragEventStrictReportWidthNode_002(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_setDragEventStrictReportWidthNode Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto returnValue = OH_ArkUI_SetDragEventStrictReportWithNode(text, false);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_setDragEventStrictReportWidthContext_003(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_setDragEventStrictReportWidthNode Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ArkUI_ContextHandle context = OH_ArkUI_GetContextByNode(text);
    auto returnValue = OH_ArkUI_SetDragEventStrictReportWithContext(context, true);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}

static ani_double drag_setDragEventStrictReportWidthContext_004(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_setDragEventStrictReportWidthNode Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ArkUI_ContextHandle context = OH_ArkUI_GetContextByNode(text);
    auto returnValue = OH_ArkUI_SetDragEventStrictReportWithContext(context, false);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}
}
