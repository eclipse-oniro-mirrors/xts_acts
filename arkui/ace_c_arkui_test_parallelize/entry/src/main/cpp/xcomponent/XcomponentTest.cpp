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
#include "xcomponent/NodeXtsTest.h"
#include "xcomponent/XcomponentTest.h"
#include <string>

namespace ArkUICapiTest {
namespace ArkUIXComponentCApiDemo {

static auto tester = new NodeXTSTest();

void SetNodeId(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle handle, std::string id)
{
    ArkUI_AttributeItem item = {nullptr, 0, id.c_str()};
    nodeAPI->setAttribute(handle, NODE_ID, &item);
    return;
}

static void RunOnSubThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    // 子线程创建组件
    auto xc = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    // 需要手动保存到nodeList中，nodeList中的组件会由框架负责挂载到主树上
    nodeList.push_back(xc);
    // 子线程写属性
    SetNodeId(nodeAPI, xc, "xcomponent_surface_success");
    // XComponent组件属性--id
    ArkUI_AttributeItem id_item = {};
    std::string text = "xcomponent_surface";
    id_item.string = text.c_str();
    nodeAPI->setAttribute(xc, NODE_XCOMPONENT_ID, &id_item);
    // XComponent组件属性--surface size
    ArkUI_NumberValue surfaceSize_value[] = {{.i32 = 300}, {.i32 = 50}};
    ArkUI_AttributeItem surfaceSize_item = {surfaceSize_value, 2};
    nodeAPI->setAttribute(xc, NODE_XCOMPONENT_SURFACE_SIZE, &surfaceSize_item);
    // XComponent 组件属性--surfaceRect
    ArkUI_NumberValue surfacerect_value[] = {{.i32=0},{.i32=0},{.i32 = 300}, {.i32 = 300}};
    ArkUI_AttributeItem surfacerect_item = {surfacerect_value, 4};
    nodeAPI->setAttribute(xc, NODE_XCOMPONENT_SURFACE_RECT, &surfacerect_item);
    // XComponent 组件属性--type
    ArkUI_NumberValue type_value[] = {{.i32 = ARKUI_XCOMPONENT_TYPE_SURFACE}};
    ArkUI_AttributeItem type_item = {type_value, 1};
    nodeAPI->setAttribute(xc, NODE_XCOMPONENT_TYPE, &type_item);
    // XComponent 组件属性--enable analyzer
    ArkUI_NumberValue enable_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem enable_item = {enable_value, 1};
    nodeAPI->setAttribute(xc, NODE_XCOMPONENT_ENABLE_ANALYZER, &enable_item);
    // 子线程读属性
    const ArkUI_AttributeItem* id = nodeAPI->getAttribute(xc, NODE_XCOMPONENT_ID);
    std::string idGet = id->string;
    if (idGet != text) {
        SetNodeId(nodeAPI, xc, "xcomponent_surface_failed_get_id_multithread");
    }
    const ArkUI_AttributeItem* size = nodeAPI->getAttribute(xc, NODE_XCOMPONENT_SURFACE_SIZE);
    if (size->value[0].i32 != 0 || size->value[1].i32 != 0) {
        SetNodeId(nodeAPI, xc, "xcomponent_surface_failed_get_surfacesize_multithread");
    }
    const ArkUI_AttributeItem* rect = nodeAPI->getAttribute(xc, NODE_XCOMPONENT_SURFACE_RECT);
    if (size->value[0].i32 != 0 || size->value[1].i32 != 0 || size->value[PARAM_2].i32 != 0 || size->value[PARAM_3].i32 != 0) {
        SetNodeId(nodeAPI, xc, "xcomponent_surface_failed_get_surfacerect_multithread");
    }
    const ArkUI_AttributeItem* type = nodeAPI->getAttribute(xc, NODE_XCOMPONENT_TYPE);
    if (type->value[0].i32 != ARKUI_XCOMPONENT_TYPE_SURFACE) {
        SetNodeId(nodeAPI, xc, "xcomponent_surface_failed_get_type_multithread");
    }
    const ArkUI_AttributeItem* enable = nodeAPI->getAttribute(xc, NODE_XCOMPONENT_ENABLE_ANALYZER);
    if (type->value[0].i32 != 1) {
        SetNodeId(nodeAPI, xc, "xcomponent_surface_failed_get_enableanalyzer_multithread");
    }
}

static void RunOnUIThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    // 获取在RunOnSubThread中保存到nodeList中的组件
    auto xc = nodeList[0];
    std::string text = "xcomponent_surface";
    if (xc) {
        // 主线程读属性
        const ArkUI_AttributeItem* id = nodeAPI->getAttribute(xc, NODE_XCOMPONENT_ID);
        std::string idGet = id->string;
        if (idGet != text) {
            SetNodeId(nodeAPI, xc, "xcomponent_surface_failed_get_id_multithread");
        }
        const ArkUI_AttributeItem* size = nodeAPI->getAttribute(xc, NODE_XCOMPONENT_SURFACE_SIZE);
        if (size->value[0].i32 != 0 || size->value[1].i32 != 0) {
            SetNodeId(nodeAPI, xc, "xcomponent_surface_failed_get_surfacesize_multithread");
        }
        const ArkUI_AttributeItem* rect = nodeAPI->getAttribute(xc, NODE_XCOMPONENT_SURFACE_RECT);
        if (size->value[0].i32 != 0 || size->value[1].i32 != 0 || size->value[PARAM_2].i32 != 0 || size->value[PARAM_3].i32 != 0) {
            SetNodeId(nodeAPI, xc, "xcomponent_surface_failed_get_surfacerect_multithread");
        }
        const ArkUI_AttributeItem* type = nodeAPI->getAttribute(xc, NODE_XCOMPONENT_TYPE);
        if (type->value[0].i32 != ARKUI_XCOMPONENT_TYPE_SURFACE) {
            SetNodeId(nodeAPI, xc, "xcomponent_surface_failed_get_type_multithread");
        }
        const ArkUI_AttributeItem* enable = nodeAPI->getAttribute(xc, NODE_XCOMPONENT_ENABLE_ANALYZER);
        if (type->value[0].i32 != 1) {
            SetNodeId(nodeAPI, xc, "xcomponent_surface_failed_get_enableanalyzer_multithread");
        }
    }
}

napi_value XComponentTest::DisposeNativeNode(napi_env env, napi_callback_info info)
{
    // 释放组件
    return tester->DisposeCNodeTree(env, info);
}

napi_value XComponentTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    return tester->CreateCNodeTree(env, info, RunOnUIThread, RunOnSubThread);
}

}
}