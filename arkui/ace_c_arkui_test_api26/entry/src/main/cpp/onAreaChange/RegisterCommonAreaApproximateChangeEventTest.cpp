/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "RegisterCommonAreaApproximateChangeEventTest.h"
#include <cstdint>
#include <iostream>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <arkui/styled_string.h>
#include <hilog/log.h>
#include "../manager/PluginManagerTest.h"

static ArkUI_NodeHandle text = nullptr;
static ArkUI_NodeHandle textInput = nullptr;
static ArkUI_NodeHandle textArea = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle Text11 = nullptr;
static float  index_height = 0.0f;

namespace ArkUICapiTest {

static auto SetId(ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeHandle& nodeHandle, const char* id)
{
    ArkUI_AttributeItem id_item = {};
    id_item.string = id;
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &id_item);
    return nodeHandle;
}

struct AreaWatchData {
    int32_t id = 0;
    bool flag = true;
    ArkUI_NodeHandle node = nullptr;
};

static ArkUI_NodeHandle gAreaWatchNode = nullptr;
static AreaWatchData* gAreaWatchData = nullptr;

static void OnAreaApproximateChange(ArkUI_NodeEvent* event)
{
    if (event == nullptr) {
        return;
    }
    auto userData = reinterpret_cast<AreaWatchData*>(OH_ArkUI_NodeEvent_GetUserData(event));
    if (userData == nullptr || userData->node == nullptr) {
        return;
    }

    ArkUI_IntSize size = {0, 0};
    ArkUI_IntOffset pos = {0, 0};
    (void)OH_ArkUI_NodeUtils_GetLayoutSize(userData->node, &size);
    (void)OH_ArkUI_NodeUtils_GetLayoutPosition(userData->node, &pos);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AreaCb",
        "Ace: on area change: id=%{public}d, w=%{public}d, h=%{public}d, x=%{public}d, y=%{public}d",
        userData->id, size.width, size.height, pos.x, pos.y);
}

napi_value RegisterCommonAreaApproximateChangeEventTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RegisterCommonAreaApproximateChangeEventTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);  
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr))
    {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RegisterCommonAreaApproximateChangeEventTest",
                     "GetContext env or info is null");
        return nullptr;
    }
    
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    Text11 = nodeAPI->createNode(ARKUI_NODE_TEXT);  
    std::string idValue1 = "Text11";
    ArkUI_AttributeItem idValueItem1 = {.string = idValue1.c_str()};
    nodeAPI->setAttribute(Text11, NODE_ID, &idValueItem1); 

    //创建button组件并绑定ONClick事件
    auto buttonA = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem btnLabelA = {.string = "放大"};
    nodeAPI->setAttribute(buttonA, NODE_BUTTON_LABEL, &btnLabelA);
    nodeAPI->registerNodeEvent(buttonA, NODE_ON_CLICK, 0, nullptr);
    std::string idValue = "buttonA";
    ArkUI_AttributeItem idValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(buttonA, NODE_ID, &idValueItem);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    static auto image = nodeAPI->createNode(ARKUI_NODE_IMAGE);

    ArkUI_NumberValue colW[] = { { .f32 = 200.0f } };
    ArkUI_AttributeItem colWItem = { colW, 1 };
    ArkUI_NumberValue colH[] = { { .f32 = 50.0f } };
    ArkUI_AttributeItem colHItem = { colH, 1 };
    nodeAPI->setAttribute(column, NODE_WIDTH, &colWItem);
    nodeAPI->setAttribute(column, NODE_HEIGHT, &colHItem);

    ArkUI_NumberValue imgW[] = { { .f32 = 40.0f } };
    ArkUI_AttributeItem imgWItem = { imgW, 1 };
    ArkUI_NumberValue imgH[] = { { .f32 = 20.0f + index_height } };
    ArkUI_AttributeItem imgHItem = { imgH, 1 };
    nodeAPI->setAttribute(image, NODE_WIDTH, &imgWItem);
    nodeAPI->setAttribute(image, NODE_HEIGHT, &imgHItem);

    ArkUI_AttributeItem itemSrc = { .string = "resources/base/media/background.png" };
    nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &itemSrc);

    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event)
    {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        switch (eventType) {
        case NODE_ON_CLICK: {
            switch (targetId) {
                case 0: {
                    index_height += 1.0f;
                    ArkUI_NumberValue imgH[] = { { .f32 = 20.0f + index_height } };
                    ArkUI_AttributeItem imgHItem = { imgH, 1 };
                    nodeAPI->setAttribute(image, NODE_HEIGHT, &imgHItem);
                } break;
                case 1: {
                    index_height -= 1.0f;
                    ArkUI_NumberValue imgH[] = { { .f32 = 20.0f + index_height } };
                    ArkUI_AttributeItem imgHItem = { imgH, 1 };
                    nodeAPI->setAttribute(image, NODE_HEIGHT, &imgHItem);
                } break;
            }
        } break;
        default:
            break;
        }
    });
    nodeAPI->addChild(column, Text11);
    nodeAPI->addChild(column, buttonA);
    nodeAPI->addChild(column, image);

    if (gAreaWatchData != nullptr)
    {
        delete gAreaWatchData;
        gAreaWatchData = nullptr;
    }
    gAreaWatchData = new AreaWatchData();
    gAreaWatchData->flag = true;
    gAreaWatchData->node = image;
    gAreaWatchNode = image;

    auto ret = OH_ArkUI_NativeModule_RegisterCommonAreaApproximateChangeEvent(
        image, 3000.0f, gAreaWatchData, OnAreaApproximateChange);             
    if( ARKUI_ERROR_CODE_NO_ERROR == ret )
    {
        OH_LOG_Print(LOG_APP, LOG_INFO,LOG_PRINT_DOMAIN, "Manager", "ARKUI_ERROR_CODE_NO_ERROR");
        ArkUI_AttributeItem item0;
        item0.string = "ARKUI_ERROR_CODE_NO_ERROR";
        nodeAPI->setAttribute(Text11, NODE_TEXT_CONTENT, &item0);
    }

    std::string id(xComponentID);

    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) 
    {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RegisterCommonAreaApproximateChangeEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok)
    {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICApiDemo