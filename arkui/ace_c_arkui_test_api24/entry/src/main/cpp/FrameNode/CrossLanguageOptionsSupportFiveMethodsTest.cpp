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

#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include "common/common.h"
#include "napi/native_api.h"
#include "arkui/native_node.h"
#include "arkui/native_interface.h"
#include <hilog/log.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include "CrossLanguageOptionsSupportFiveMethodsTest.h"

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

namespace ArkUICapiTest {

static ArkUI_NativeNodeAPI_1* nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
    );

void SetWidth(ArkUI_NodeHandle node, float width) {
    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(node, NODE_WIDTH, &item);
    return;
}

void SetHeight(ArkUI_NodeHandle node, float height) {
    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(node, NODE_HEIGHT, &item);
    return;
}

void SetBackgroundColor(ArkUI_NodeHandle node, uint32_t color) {
    ArkUI_NumberValue value[] = {{.u32 = color}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &item);
    return;
}

void SetId(ArkUI_NodeHandle node, const char *id){
    ArkUI_AttributeItem item = {.string = id};
    nodeAPI->setAttribute(node, NODE_ID, &item);
    return;
}

napi_value CrossLanguageOptionsSupportFiveMethodsTest::AddChild(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle node_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("col", &node_ptr);
    auto col = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    SetWidth(col, 100);
    SetHeight(col, 15);
    SetId(col,"AddChildNodeId");
    SetBackgroundColor(col, 0xff00ff00);
    auto code = nodeAPI->addChild(node_ptr, col);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "wds AddChild=%{public}d", code);
    return nullptr;
}

napi_value CrossLanguageOptionsSupportFiveMethodsTest::InsertChildAfter(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle node_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("col", &node_ptr);
    ArkUI_NodeHandle child_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("col_child", &child_ptr);
    auto col = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    SetWidth(col, 100);
    SetHeight(col, 15);
    SetId(col,"InsertChildAfterNodeId");
    SetBackgroundColor(col, 0xff0000ff);
    auto code = nodeAPI->insertChildAfter(node_ptr, col, child_ptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "wds InsetChildAfter=%{public}d", code);
    return nullptr;
}

napi_value CrossLanguageOptionsSupportFiveMethodsTest::InsertChildBefore(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle node_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("col", &node_ptr);
    ArkUI_NodeHandle child_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("col_child", &child_ptr);
    auto col = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    SetWidth(col, 100);
    SetHeight(col, 15);
    SetId(col,"InsertChildBeforeNodeId");
    SetBackgroundColor(col, 0xff0000ff);
    auto code = nodeAPI->insertChildBefore(node_ptr, col, child_ptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "wds InsetChildBefore=%{public}d", code);
    return nullptr;
}

napi_value CrossLanguageOptionsSupportFiveMethodsTest::InsertChildAt(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle node_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("col", &node_ptr);
    auto col = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    SetWidth(col, 100);
    SetHeight(col, 15);
    SetId(col,"InsertChildAtNodeId");
    SetBackgroundColor(col, 0xff0000ff);
    auto code = nodeAPI->insertChildAt(node_ptr, col, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "wds InsetChildAt=%{public}d", code);
    return nullptr;
}

napi_value CrossLanguageOptionsSupportFiveMethodsTest::RemoveChild(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle node_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("col", &node_ptr);
    ArkUI_NodeHandle child_ptr = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("col_child", &child_ptr);
    auto code = nodeAPI->removeChild(node_ptr, child_ptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "wds", "wds RemoveChild=%{public}d", code);
    return nullptr;
}

} // namespace ArkUICapiTest