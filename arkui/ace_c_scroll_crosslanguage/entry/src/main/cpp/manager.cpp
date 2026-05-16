/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <arkui/native_type.h>
#include <cstdint>
#include <cstdio>
#include <string>
#include <thread>
#include <vector>

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <hilog/log.h>

#include "manager.h"

namespace NativeXComponentSample {
#define TEST_TEXT_NUMBER 20

ArkUI_NodeHandle gTextBuf[TEST_TEXT_NUMBER];
int gBarWidth = 10;

Manager Manager::manager_;

Manager::~Manager() {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "~Manager");
    nativeXComponentMap_.clear();

    for (auto iter = containerMap_.begin(); iter != containerMap_.end(); ++iter) {
        if (iter->second != nullptr) {
            delete iter->second;
            iter->second = nullptr;
        }
    }
    containerMap_.clear();
}

void preTest(ArkUI_NativeNodeAPI_1 *nodeAPI) {
    for (int i = 0; i < TEST_TEXT_NUMBER; ++i) {
        gTextBuf[i] = nodeAPI->createNode(ARKUI_NODE_TEXT);

        ArkUI_NumberValue value[] = {300};
        ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(gTextBuf[i], NODE_WIDTH, &item);
        value[0].f32 = 100;
        nodeAPI->setAttribute(gTextBuf[i], NODE_HEIGHT, &item);
        value[0].u32 = 0xffffff00;
        nodeAPI->setAttribute(gTextBuf[i], NODE_BACKGROUND_COLOR, &item);
    }
}

struct TimeTable {
    std::string title;
    std::vector<std::string> projects;
};

std::vector<TimeTable> gTimeTables = {
    {"星期一", {"语文", "数学", "英语"}},
    {"星期二", {"物理", "化学", "生物"}},
    {"星期三", {"历史", "地理", "政治"}},
    {"星期四", {"美术", "音乐", "体育"}},
};


ArkUI_NodeHandle testColorAndFontChangeExample(ArkUI_NativeNodeAPI_1 *nodeAPI) {
    ArkUI_NodeHandle capiNode = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    ArkUI_AttributeItem itemStringStyle = {.string = "capiNode"};
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(capiNode, NODE_ID, &itemStringStyle);
    value[0].f32 = 10;
    nodeAPI->setAttribute(capiNode, NODE_WIDTH_PERCENT, &item);
    value[0].f32 = 10;
    nodeAPI->setAttribute(capiNode, NODE_HEIGHT_PERCENT, &item);
    value[0].u32 = 0xff00ffff;
    nodeAPI->setAttribute(capiNode, NODE_BACKGROUND_COLOR, &item);
    value[0].f32 = 20;
    nodeAPI->setAttribute(capiNode, NODE_SCROLL_BAR_WIDTH, &item);

    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    value[0].f32 = 5;
    nodeAPI->setAttribute(capiNode, NODE_WIDTH_PERCENT, &item);
    value[0].f32 = 5;
    nodeAPI->setAttribute(capiNode, NODE_HEIGHT_PERCENT, &item);
    value[0].u32 = 0xFFFFFF00;
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);

    ArkUI_NodeHandle column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    value[0].f32 = 5;
    nodeAPI->setAttribute(capiNode, NODE_WIDTH_PERCENT, &item);
    value[0].f32 = 5;
    nodeAPI->setAttribute(capiNode, NODE_HEIGHT_PERCENT, &item);
    value[0].u32 = 0xFF555555;
    nodeAPI->setAttribute(column1, NODE_BACKGROUND_COLOR, &item);


    nodeAPI->addChild(column, column1);
    nodeAPI->addChild(capiNode, column);

    ArkUI_NodeHandle tsScroll;
    auto error = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("typeNode", &tsScroll);
    if (tsScroll) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ tsScroll is exist");
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ tsScroll is null");
    }
    nodeAPI->registerNodeEvent(capiNode, NODE_ON_CLICK, 2, tsScroll); // 改成2测试nodeutils获取位置的那一坨接口
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ CAPI click start");
        if (targetId == 1) {
            auto inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
            auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
            ArkUI_NumberValue value[] = {480};
            ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
            value[0].f32 = 70;
            if (node) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ click node is exist");
            } else {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ click node is null");
            }
            nodeAPI->setAttribute(node, NODE_SCROLL_BAR_WIDTH, &item);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ CAPI click end");
        }
        //Capi对TS侧节点操作////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        if (targetId == 2) {
            auto inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
            auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
            //scroll绑定typeNode
            ArkUI_NodeHandle scroll = nullptr;
            OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("typeNode", &scroll);
            //设置属性--滚动条宽度
            ArkUI_NumberValue value[] = {10};
            ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
            auto errorCode =nodeAPI-> setAttribute(scroll, NODE_SCROLL_BAR_WIDTH, &item);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,"Manager","YYY %{public}d",errorCode);
            //设置边缘效果
            ArkUI_NumberValue edge_effect_value[] = {{.i32 = ARKUI_EDGE_EFFECT_SPRING}, {.i32 = 1}};             
            ArkUI_AttributeItem edge_effect_item = {edge_effect_value, sizeof(edge_effect_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(scroll, NODE_SCROLL_EDGE_EFFECT, &edge_effect_item);
              auto errorCode1 =nodeAPI-> setAttribute(scroll, NODE_SCROLL_EDGE_EFFECT, &item);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,"Manager","ABC %{public}d",errorCode1);
            //
            ArkUI_NumberValue enable_paging_value[] = {{.i32 = true }};
                ArkUI_AttributeItem enable_paging_item = {enable_paging_value,
                                                        sizeof(enable_paging_value) /
                                                        sizeof(ArkUI_NumberValue)};
                nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_PAGING, &enable_paging_item);
            
            if (node) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ click node is exist");
            } else {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ click node is null");
            }
            nodeAPI->setAttribute(node, NODE_SCROLL_BAR_WIDTH, &item);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ CAPI click end");
        }
    });


    ArkUI_CrossLanguageOption *option = OH_ArkUI_CrossLanguageOption_Create();
    //跨语言开关
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(option, true);
    OH_ArkUI_NodeUtils_SetCrossLanguageOption(capiNode, option);
    bool crossLanguageAttributeSetting = OH_ArkUI_CrossLanguageOption_GetAttributeSettingStatus(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "xsx crossLanguageAttributeSetting=%{public}d",
                 crossLanguageAttributeSetting);
    OH_ArkUI_CrossLanguageOption_Destroy(option);

    return capiNode;
}

ArkUI_NodeHandle testColorAndFontChangeExampleFalse(ArkUI_NativeNodeAPI_1 *nodeAPI) {
    ArkUI_NodeHandle capiNode = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    ArkUI_AttributeItem itemStringStyle = {.string = "capiNodeFalse"};
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(capiNode, NODE_ID, &itemStringStyle);
    value[0].f32 = 10;
    nodeAPI->setAttribute(capiNode, NODE_WIDTH_PERCENT, &item);
    value[0].f32 = 10;
    nodeAPI->setAttribute(capiNode, NODE_HEIGHT_PERCENT, &item);
    value[0].u32 = 0xff00ffff;
    nodeAPI->setAttribute(capiNode, NODE_BACKGROUND_COLOR, &item);
    value[0].f32 = 20;
    nodeAPI->setAttribute(capiNode, NODE_SCROLL_BAR_WIDTH, &item);

    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    value[0].f32 = 5;
    nodeAPI->setAttribute(capiNode, NODE_WIDTH_PERCENT, &item);
    value[0].f32 = 5;
    nodeAPI->setAttribute(capiNode, NODE_HEIGHT_PERCENT, &item);
    value[0].u32 = 0xFFFFFF00;
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);

    ArkUI_NodeHandle column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    value[0].f32 = 5;
    nodeAPI->setAttribute(capiNode, NODE_WIDTH_PERCENT, &item);
    value[0].f32 = 5;
    nodeAPI->setAttribute(capiNode, NODE_HEIGHT_PERCENT, &item);
    value[0].u32 = 0xFF555555;
    nodeAPI->setAttribute(column1, NODE_BACKGROUND_COLOR, &item);


    nodeAPI->addChild(column, column1);
    nodeAPI->addChild(capiNode, column);

    ArkUI_NodeHandle tsScroll;
    auto error = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("typeNode", &tsScroll);
    if (tsScroll) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ tsScroll is exist");
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ tsScroll is null");
    }
    nodeAPI->registerNodeEvent(capiNode, NODE_ON_CLICK, 2, tsScroll); // 改成2测试nodeutils获取位置的那一坨接口
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ CAPI click start");
        if (targetId == 1) {
            auto inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
            auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
            ArkUI_NumberValue value[] = {480};
            ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
            value[0].f32 = 70;
            if (node) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ click node is exist");
            } else {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ click node is null");
            }
            nodeAPI->setAttribute(node, NODE_SCROLL_BAR_WIDTH, &item);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ CAPI click end");
        }
        //Capi对TS侧节点操作////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        if (targetId == 2) {
            auto inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
            auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
            //scroll绑定typeNode
            ArkUI_NodeHandle scroll = nullptr;
            OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("typeNode", &scroll);
            //设置属性--滚动条宽度
            ArkUI_NumberValue value[] = {10};
            ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
            auto errorCode =nodeAPI-> setAttribute(scroll, NODE_SCROLL_BAR_WIDTH, &item);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,"Manager","YYY %{public}d",errorCode);
            //设置边缘效果
            ArkUI_NumberValue edge_effect_value[] = {{.i32 = ARKUI_EDGE_EFFECT_SPRING}, {.i32 = 1}};             
            ArkUI_AttributeItem edge_effect_item = {edge_effect_value, sizeof(edge_effect_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(scroll, NODE_SCROLL_EDGE_EFFECT, &edge_effect_item);
              auto errorCode1 =nodeAPI-> setAttribute(scroll, NODE_SCROLL_EDGE_EFFECT, &item);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,"Manager","ABC %{public}d",errorCode1);
            //
            ArkUI_NumberValue enable_paging_value[] = {{.i32 = true }};
                ArkUI_AttributeItem enable_paging_item = {enable_paging_value,
                                                        sizeof(enable_paging_value) /
                                                        sizeof(ArkUI_NumberValue)};
                nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_PAGING, &enable_paging_item);
            
            if (node) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ click node is exist");
            } else {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ click node is null");
            }
            nodeAPI->setAttribute(node, NODE_SCROLL_BAR_WIDTH, &item);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "ZRJ CAPI click end");
        }
    });


    ArkUI_CrossLanguageOption *option = OH_ArkUI_CrossLanguageOption_Create();
    //跨语言开关
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(option, false);
    OH_ArkUI_NodeUtils_SetCrossLanguageOption(capiNode, option);
    OH_ArkUI_NodeUtils_GetCrossLanguageOption(capiNode, option);
    bool crossLanguageAttributeSetting = OH_ArkUI_CrossLanguageOption_GetAttributeSettingStatus(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "xsx crossLanguageAttributeSetting=%{public}d",
                 crossLanguageAttributeSetting);
    OH_ArkUI_CrossLanguageOption_Destroy(option);

    return capiNode;
}

napi_value Manager::CreateNativeNode(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode BEGIN");
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 1");
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode napi_get_cb_info failed");
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 2");

    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 3");
    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 4");
    if (valuetype != napi_string) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 5");

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    constexpr uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    size_t length;
    if (napi_get_value_string_utf8(env, args[0], idStr, idSize, &length) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 6");

    auto manager = Manager::GetInstance();
    if (manager == nullptr) {
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 7 idStr(%{public}s)", idStr);

    OH_NativeXComponent *component = manager->GetNativeXComponent(idStr);
    if (component == nullptr) {
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou OH_ArkUI_GetBasicNodeAPI before");
    auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou OH_ArkUI_GetBasicNodeAPI after");
    if (nodeAPI != nullptr) {
        if (nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 1");
            ArkUI_NodeHandle testNode;
            preTest(nodeAPI);
            testNode = testColorAndFontChangeExample(nodeAPI);


            OH_NativeXComponent_AttachNativeRootNode(component, testNode);
        }
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  555");
    return nullptr;
}

napi_value Manager::CreateNativeNodeFalse(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode BEGIN");
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 1");
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode napi_get_cb_info failed");
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 2");

    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 3");
    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 4");
    if (valuetype != napi_string) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 5");

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    constexpr uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    size_t length;
    if (napi_get_value_string_utf8(env, args[0], idStr, idSize, &length) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 6");

    auto manager = Manager::GetInstance();
    if (manager == nullptr) {
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 7 idStr(%{public}s)", idStr);

    OH_NativeXComponent *component = manager->GetNativeXComponent(idStr);
    if (component == nullptr) {
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou OH_ArkUI_GetBasicNodeAPI before");
    auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    //    auto *dialogApi = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(OH_ArkUI_GetNativeAPI(ARKUI_NATIVE_DIALOG,
    //    1));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou OH_ArkUI_GetBasicNodeAPI after");
    if (nodeAPI != nullptr) {
        if (nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "liyou CreateNativeNode 1");
            ArkUI_NodeHandle testNode;
            preTest(nodeAPI);
            testNode = testColorAndFontChangeExampleFalse(nodeAPI);


            OH_NativeXComponent_AttachNativeRootNode(component, testNode);
        }
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  555");
    return nullptr;
}

napi_value Manager::UpdateNativeNode(napi_env env, napi_callback_info info) {

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UpdateNativeNode env or info is null");
        return nullptr;
    }

    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UpdateNativeNode napi_get_cb_info failed");
    }

    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }

    if (valuetype != napi_string) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    constexpr uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    size_t length;
    if (napi_get_value_string_utf8(env, args[0], idStr, idSize, &length) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }

    auto manager = Manager::GetInstance();
    if (manager == nullptr) {
        return nullptr;
    }

    OH_NativeXComponent *component = manager->GetNativeXComponent(idStr);
    if (component == nullptr) {
        return nullptr;
    }

    if ((env == nullptr) || (info == nullptr || component == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "GetContext env or info is null");
        return nullptr;
    }
    return nullptr;
}

napi_value Manager::GetContext(napi_env env, napi_callback_info info) {
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "GetContext env or info is null");
        return nullptr;
    }

    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "GetContext napi_get_cb_info failed");
    }

    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }

    if (valuetype != napi_number) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    int64_t value;
    if (napi_get_value_int64(env, args[0], &value) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

void Manager::Export(napi_env env, napi_value exports) {
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: env or exports is null");
        return;
    }

    napi_value exportInstance = nullptr;
    if (napi_get_named_property(env, exports, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: napi_get_named_property fail");
        return;
    }

    OH_NativeXComponent *nativeXComponent = nullptr;
    if (napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent)) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: napi_unwrap fail");
        return;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    if (OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "Export: OH_NativeXComponent_GetXComponentId fail");
        return;
    }

    std::string id(idStr);
    auto manager = Manager::GetInstance();
    if ((manager != nullptr) && (nativeXComponent != nullptr)) {
        manager->SetNativeXComponent(id, nativeXComponent);
        auto container = manager->GetContainer(id);
        if (container != nullptr) {
            container->RegisterCallback(nativeXComponent);
        }
    }
}

void Manager::SetNativeXComponent(std::string &id, OH_NativeXComponent *nativeXComponent) {
    if (nativeXComponent == nullptr) {
        return;
    }

    nativeXComponentMap_[id] = nativeXComponent;
}

OH_NativeXComponent *Manager::GetNativeXComponent(const std::string &id) { return nativeXComponentMap_[id]; }

Container *Manager::GetContainer(std::string &id) {
    if (containerMap_.find(id) == containerMap_.end()) {
        Container *instance = Container::GetInstance(id);
        containerMap_[id] = instance;
        return instance;
    }

    return containerMap_[id];
}
} // namespace NativeXComponentSample
