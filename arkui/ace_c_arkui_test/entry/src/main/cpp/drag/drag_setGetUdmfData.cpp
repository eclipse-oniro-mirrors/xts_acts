/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

namespace ArkUICapiTest {

static napi_value drag_setGetUdmfData_001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetAbstract(plainText, "this is plainText Abstract example");
    OH_UdsPlainText_SetContent(plainText, "this is plainText Content example");
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfData_AddRecord(data, record);

    ArkUI_NodeEvent *event = nullptr;
    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    auto returnValue = OH_ArkUI_DragEvent_SetData(dragEvent, data);
    ASSERT_EQ(returnValue, INVALID_PARAM);
    NAPI_END;
}

static napi_value drag_setGetUdmfData_002(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetAbstract(plainText, "this is plainText Abstract example");
    OH_UdsPlainText_SetContent(plainText, "this is plainText Content example");
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfData_AddRecord(data, record);

    ArkUI_NodeEvent *event = nullptr;
    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    auto returnValue = OH_ArkUI_DragEvent_GetUdmfData(dragEvent, data);
    ASSERT_EQ(returnValue, INVALID_PARAM);
    NAPI_END;
}

static napi_value drag_setGetUdmfData_003(napi_env env, napi_callback_info info)
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

    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetAbstract(plainText, "this is plainText Abstract example");
    OH_UdsPlainText_SetContent(plainText, "this is plainText Content example");
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfData_AddRecord(data, record);

    auto returnValue = OH_ArkUI_DragAction_SetData(dragAction, data);
    ASSERT_EQ(returnValue, SUCCESS);
    NAPI_END;
}
}
