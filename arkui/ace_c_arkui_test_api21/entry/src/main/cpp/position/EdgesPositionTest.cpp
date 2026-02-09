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
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include "common/common.h"
#include "EdgesPositionTest.h"

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
static ArkUI_NativeNodeAPI_1* nodeAPI;

namespace ArkUICapiTest {

static std::string value2String(napi_env env, napi_value value)
{
    size_t stringSize = 0;
    napi_get_value_string_utf8(env, value, nullptr, 0, &stringSize);
    std::string valueString;
    valueString.resize(stringSize);
    napi_get_value_string_utf8(env, value, &valueString[0], stringSize+1, &stringSize);
    return valueString;
}

ArkUI_NodeHandle CreatePositionEdgesNodeHandle(const std::string &tag)
{
    ArkUI_NodeHandle column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle flex2 = nodeAPI->createNode(ARKUI_NODE_FLEX);
    ArkUI_NodeHandle flex3 = nodeAPI->createNode(ARKUI_NODE_FLEX);
    ArkUI_NodeHandle flex4 = nodeAPI->createNode(ARKUI_NODE_FLEX);
    
    // column1
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = 1;
    nodeAPI->setAttribute(column1, NODE_WIDTH_PERCENT, &item);
    nodeAPI->setAttribute(column1, NODE_HEIGHT_PERCENT, &item);
    value[0].u32 = 0xFFffc0cb; // Color.Pink
    nodeAPI->setAttribute(column1, NODE_BACKGROUND_COLOR, &item);
    value[0].i32 = ARKUI_FLEX_ALIGNMENT_CENTER;
    nodeAPI->setAttribute(column1, NODE_COLUMN_JUSTIFY_CONTENT, &item);

    // flex2
    value[0].f32 = 100;
    nodeAPI->setAttribute(flex2, NODE_WIDTH, &item);
    value[0].f32 = 100;
    nodeAPI->setAttribute(flex2, NODE_HEIGHT, &item);
    value[0].u32 = 0xFF0000ff; // blue
    nodeAPI->setAttribute(flex2, NODE_BACKGROUND_COLOR, &item);

    ArkUI_AttributeItem parentStringStyle = {.string = "EdgesPositionPage_parentFlex"};
    nodeAPI->setAttribute(flex2, NODE_ID, &parentStringStyle);

    // flex3
    value[0].f32 = 10;
    nodeAPI->setAttribute(flex3, NODE_WIDTH, &item);
    nodeAPI->setAttribute(flex3, NODE_HEIGHT, &item);
    value[0].u32 = 0xFF00ff00; // green
    nodeAPI->setAttribute(flex3, NODE_BACKGROUND_COLOR, &item);

    ArkUI_AttributeItem itemStringStyle = {.string = "EdgesPositionPage_testFlex"};
    nodeAPI->setAttribute(flex3, NODE_ID, &itemStringStyle);

    // flex4
    ArkUI_AttributeItem itemStringStyle2 = {.string = "EdgesPositionPage_testFlex_copy"};
    nodeAPI->setAttribute(flex4, NODE_ID, &itemStringStyle2);

    nodeAPI->addChild(flex2, flex3);
    nodeAPI->addChild(flex2, flex4);
    nodeAPI->addChild(column1, flex2);

    return column1;
}

napi_value EdgesPositionTest::CreatePositionEdgesNativeRoot(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 2;
    napi_value args[2] = { nullptr, nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != 2) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EdgesPositionTest", "napi_get_cb_info success");
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "List", "OH_ArkUI_GetNodeHandleFromNapiValue %{public}d");
    nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
    );
    std::string tag = value2String(env, args[1]);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "tag=%{public}s", tag.c_str());
    int32_t ret = OH_ArkUI_NodeContent_SetUserData(nodeContentHandle_, new std::string(tag));
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "setUserData failed error=%{public}d", ret);
    }
    if (nodeAPI != nullptr && nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager",
                     "CreateNativeNode tag=%{public}s", tag.c_str());
        auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
            ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
            std::string *userDate = reinterpret_cast<std::string*>(OH_ArkUI_NodeContent_GetUserData(handle));
            if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
                ArkUI_NodeHandle testNode;
                if (userDate) {
                    testNode = CreatePositionEdgesNodeHandle(*userDate);
                    delete userDate;
                    userDate = nullptr;
                } else {
                    testNode = CreatePositionEdgesNodeHandle("noUserData");
                }
                OH_ArkUI_NodeContent_AddNode(handle, testNode);
            }
        };
        OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle_, nodeContentEvent);
    }
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdgesIllegal_1(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        auto ret = nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, nullptr);
        
        ArkUI_NumberValue value2[] = {{.f32 = 20}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdgesIllegal_2(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        
        ArkUI_NumberValue value2[] = {{.f32 = 20}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdgesIllegal_3(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 20}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_top(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetTop(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_top_negative(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetTop(positionEdges, -20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_left(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetLeft(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_left_negative(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetLeft(positionEdges, -20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_bottom(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetBottom(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_bottom_negative(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetBottom(positionEdges, -20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_right(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetRight(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_right_negative(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetRight(positionEdges, -20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_top_left(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetTop(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetLeft(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_top_right(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetTop(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetRight(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_top_bottom(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetTop(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetBottom(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_left_bottom(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetLeft(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetBottom(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_left_right(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetLeft(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetRight(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_bottom_right(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetBottom(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetRight(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_top_left_bottom(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetTop(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetLeft(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetBottom(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_top_left_right(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetTop(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetLeft(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetRight(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_top_bottom_right(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetTop(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetBottom(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetRight(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_left_bottom_right(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetLeft(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetBottom(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetRight(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

napi_value EdgesPositionTest::setPositionEdges_top_left_bottom_right(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        ArkUI_NumberValue value[] = {{.u32 = 0xFF00ffff}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(tsFlex, NODE_BACKGROUND_COLOR, &item);
        
        ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
        OH_ArkUI_PositionEdges_SetTop(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetLeft(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetBottom(positionEdges, 20);
        OH_ArkUI_PositionEdges_SetRight(positionEdges, 20);
        item.object = positionEdges;
        nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
        OH_ArkUI_PositionEdges_Dispose(positionEdges);
        
        ArkUI_NumberValue value2[] = {{.f32 = 10}};
        ArkUI_AttributeItem item2 = {value2, 1};
        nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    }
    
    return nullptr;
}

std::string getPositionEdges_content(ArkUI_NativeNodeAPI_1 * nodeAPI, ArkUI_NodeHandle tsFlex) {
    std::string showStr = "";
    std::string topStr = "";
    std::string leftStr = "";
    std::string bottomStr = "";
    std::string rightStr = "";

    const ArkUI_AttributeItem *get_item = nodeAPI->getAttribute(tsFlex, NODE_POSITION_EDGES);
    if (get_item) {
        ArkUI_PositionEdges *edges = reinterpret_cast<ArkUI_PositionEdges *>(get_item->object);
        float get_value;
    
        if (OH_ArkUI_PositionEdges_GetTop(edges, &get_value) == ARKUI_ERROR_CODE_PARAM_INVALID) {
            topStr = "NULL";
        } else {
            topStr = std::to_string(int(get_value));
        }
        if (OH_ArkUI_PositionEdges_GetLeft(edges, &get_value) == ARKUI_ERROR_CODE_PARAM_INVALID) {
            leftStr = "NULL";
        } else {
            leftStr = std::to_string(int(get_value));
        }
        if (OH_ArkUI_PositionEdges_GetBottom(edges, &get_value) == ARKUI_ERROR_CODE_PARAM_INVALID) {
            bottomStr = "NULL";
        } else {
            bottomStr = std::to_string(int(get_value));
        }
        if (OH_ArkUI_PositionEdges_GetRight(edges, &get_value) == ARKUI_ERROR_CODE_PARAM_INVALID) {
            rightStr = "NULL";
        } else {
            rightStr = std::to_string(int(get_value));
        }
        showStr = "top:" + topStr + ",left:" + leftStr + ",bottom:" + bottomStr + ",right:" + rightStr;
    }
    else {
        showStr = "undefined";
    }
    
    return showStr;
}

napi_value EdgesPositionTest::getPositionEdges(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    std::string showStr = "NAN";
    if (tsFlex) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        showStr = getPositionEdges_content(nodeAPI, tsFlex);
    }
    
    napi_value cppStr;
    napi_create_string_latin1(env, showStr.c_str(), showStr.size(), &(cppStr));
    return cppStr;
}

napi_value EdgesPositionTest::reSetPositionEdges(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);
    
    ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
    );
    nodeAPI->resetAttribute(tsFlex, NODE_POSITION_EDGES);
    
    ArkUI_NumberValue value2[] = {{.f32 = 30}};
    ArkUI_AttributeItem item2 = {value2, 1};
    nodeAPI->setAttribute(tsFlex, NODE_WIDTH, &item2);
    
    return nullptr;
}

napi_value EdgesPositionTest::copyPositionEdges(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsFlex = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex", &tsFlex);

    ArkUI_NodeHandle testFlex_copy = nullptr;
    auto ret2 = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("EdgesPositionPage_testFlex_copy", &testFlex_copy);
    
    ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
    );
    
    const ArkUI_AttributeItem *get_item = nodeAPI->getAttribute(tsFlex, NODE_POSITION_EDGES);
    if (get_item) {
        ArkUI_PositionEdges *edges = reinterpret_cast<ArkUI_PositionEdges *>(get_item->object);
        ArkUI_PositionEdges *edges_copy = OH_ArkUI_PositionEdges_Copy(edges);
    
        ArkUI_AttributeItem item = {.object = edges_copy};
        nodeAPI->setAttribute(testFlex_copy, NODE_POSITION_EDGES, &item);
    
        ArkUI_NumberValue value[] = {{.f32 = 20}};
        ArkUI_AttributeItem item2 = {value, 1};
        nodeAPI->setAttribute(testFlex_copy, NODE_WIDTH, &item2);
        nodeAPI->setAttribute(testFlex_copy, NODE_HEIGHT, &item2);
    
        value[0].u32 = 0xffff0000;
        nodeAPI->setAttribute(testFlex_copy, NODE_BACKGROUND_COLOR, &item2);
    }

    return nullptr;
}

napi_value EdgesPositionTest::TestPositionEdgesGetTopErrorCode_001(napi_env env, napi_callback_info info) {
    // create flex
    NAPI_START(tsFlex, ARKUI_NODE_FLEX);

    // SetTop
    ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
    OH_ArkUI_PositionEdges_SetTop(positionEdges, 20);

    ArkUI_AttributeItem item = {.object = positionEdges};
    nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
    OH_ArkUI_PositionEdges_Dispose(positionEdges);

    const ArkUI_AttributeItem *get_item = nodeAPI->getAttribute(tsFlex, NODE_POSITION_EDGES);
    ArkUI_PositionEdges *edges = reinterpret_cast<ArkUI_PositionEdges *>(get_item->object);

    // GetTop
    float get_value;
    auto ret = OH_ArkUI_PositionEdges_GetTop(edges, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPositionEdgesGetTopErrorCode_001 ret=%{public}d", ret);

    // Reset
    nodeAPI->resetAttribute(tsFlex, NODE_POSITION_EDGES);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value EdgesPositionTest::TestPositionEdgesGetTopErrorCode_002(napi_env env, napi_callback_info info) {
    float get_value;
    auto ret = OH_ArkUI_PositionEdges_GetTop(nullptr, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPositionEdgesGetTopErrorCode_002 ret=%{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value EdgesPositionTest::TestPositionEdgesGetLeftErrorCode_001(napi_env env, napi_callback_info info) {
    // create flex
    NAPI_START(tsFlex, ARKUI_NODE_FLEX);

    // SetLeft
    ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
    OH_ArkUI_PositionEdges_SetLeft(positionEdges, 20);

    ArkUI_AttributeItem item = {.object = positionEdges};
    nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
    OH_ArkUI_PositionEdges_Dispose(positionEdges);

    const ArkUI_AttributeItem *get_item = nodeAPI->getAttribute(tsFlex, NODE_POSITION_EDGES);
    ArkUI_PositionEdges *edges = reinterpret_cast<ArkUI_PositionEdges *>(get_item->object);

    // GetLeft
    float get_value;
    auto ret = OH_ArkUI_PositionEdges_GetLeft(edges, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPositionEdgesGetLeftErrorCode_001 ret=%{public}d", ret);

    // Reset
    nodeAPI->resetAttribute(tsFlex, NODE_POSITION_EDGES);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value EdgesPositionTest::TestPositionEdgesGetLeftErrorCode_002(napi_env env, napi_callback_info info) {
    float get_value;
    auto ret = OH_ArkUI_PositionEdges_GetLeft(nullptr, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPositionEdgesGetLeftErrorCode_002 ret=%{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value EdgesPositionTest::TestPositionEdgesGetBottomErrorCode_001(napi_env env, napi_callback_info info) {
    // create flex
    NAPI_START(tsFlex, ARKUI_NODE_FLEX);

    // SetBottom
    ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
    OH_ArkUI_PositionEdges_SetBottom(positionEdges, 20);

    ArkUI_AttributeItem item = {.object = positionEdges};
    nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
    OH_ArkUI_PositionEdges_Dispose(positionEdges);

    const ArkUI_AttributeItem *get_item = nodeAPI->getAttribute(tsFlex, NODE_POSITION_EDGES);
    ArkUI_PositionEdges *edges = reinterpret_cast<ArkUI_PositionEdges *>(get_item->object);

    // GetBottom
    float get_value;
    auto ret = OH_ArkUI_PositionEdges_GetBottom(edges, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPositionEdgesGetBottomErrorCode_001 ret=%{public}d", ret);

    // Reset
    nodeAPI->resetAttribute(tsFlex, NODE_POSITION_EDGES);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value EdgesPositionTest::TestPositionEdgesGetBottomErrorCode_002(napi_env env, napi_callback_info info) {
    float get_value;
    auto ret = OH_ArkUI_PositionEdges_GetBottom(nullptr, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPositionEdgesGetBottomErrorCode_002 ret=%{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value EdgesPositionTest::TestPositionEdgesGetRightErrorCode_001(napi_env env, napi_callback_info info) {
    // create flex
    NAPI_START(tsFlex, ARKUI_NODE_FLEX);

    // SetRight
    ArkUI_PositionEdges *positionEdges = OH_ArkUI_PositionEdges_Create();
    OH_ArkUI_PositionEdges_SetRight(positionEdges, 20);

    ArkUI_AttributeItem item = {.object = positionEdges};
    nodeAPI->setAttribute(tsFlex, NODE_POSITION_EDGES, &item);
    OH_ArkUI_PositionEdges_Dispose(positionEdges);

    const ArkUI_AttributeItem *get_item = nodeAPI->getAttribute(tsFlex, NODE_POSITION_EDGES);
    ArkUI_PositionEdges *edges = reinterpret_cast<ArkUI_PositionEdges *>(get_item->object);

    // GetRight
    float get_value;
    auto ret = OH_ArkUI_PositionEdges_GetRight(edges, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPositionEdgesGetRightErrorCode_001 ret=%{public}d", ret);

    // Reset
    nodeAPI->resetAttribute(tsFlex, NODE_POSITION_EDGES);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value EdgesPositionTest::TestPositionEdgesGetRightErrorCode_002(napi_env env, napi_callback_info info) {
    float get_value;
    auto ret = OH_ArkUI_PositionEdges_GetRight(nullptr, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPositionEdgesGetRightErrorCode_002 ret=%{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value EdgesPositionTest::TestPositionEdgesCopyReturnNullptr(napi_env env, napi_callback_info info) {
    float get_value;
    ArkUI_PositionEdges *copy = OH_ArkUI_PositionEdges_Copy(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPositionEdgesCopyReturnNullptr copy=%{public}p", copy);

    ASSERT_OBJ(copy, nullptr);
    NAPI_END;
}

napi_value EdgesPositionTest::TestPositionEdgesCreateReturnNoNullptr(napi_env env, napi_callback_info info) {
    ArkUI_PositionEdges *edges = OH_ArkUI_PositionEdges_Create();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPositionEdgesCreateReturnNoNullptr copy=%{public}p", edges);

    ASSERT_OBJ_NE(edges, nullptr);
    OH_ArkUI_PositionEdges_Dispose(edges);
    NAPI_END;
}

} // namespace ArkUICapiTest