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

#include "common/common.h"
#include <arkui/native_animate.h>

namespace ArkUICapiTest {

static napi_value testRegisterSystemColorModeChangeEvent_001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
	
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(column, NODE_WIDTH, &item);
    ArkUI_NumberValue value2[] = {720};
    ArkUI_AttributeItem item2 = {value2, 1};
    //value[0].f32 = 720;
    nodeAPI -> setAttribute(column, NODE_HEIGHT, &item2);

    ArkUI_NodeHandle image = nodeAPI -> createNode(ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value1[] = {200};
    ArkUI_AttributeItem item1 = {value1, 1};
    //value[0].f32 = 200;
    nodeAPI -> setAttribute(image, NODE_WIDTH, &item1);
    //value[0].f32 = 200;
    nodeAPI->setAttribute(image, NODE_HEIGHT, &item1);
    ArkUI_AttributeItem itemSrc = {nullptr, 0, "xxxxx_1.img"};
    nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &itemSrc);
    
    nodeAPI->addChild(column, image);

    auto onColorChange = [](ArkUI_SystemColorMode sysColorMode, void *userData) -> void {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SystemColorModeChangeEvent", "OnEventReceive");

        if (sysColorMode == ArkUI_SystemColorMode::ARKUI_SYSTEM_COLOR_MODE_DARK) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk onColorChange dark");
        } else if (sysColorMode == ArkUI_SystemColorMode::ARKUI_SYSTEM_COLOR_MODE_LIGHT) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk onColorChange light");
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SystemColorModeChangeEvent",
                "OnEventReceive: sysColorMode is null");
            return;
        }

        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );

        auto node = (ArkUI_NodeHandle)userData;

        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk onColorChange %{public}f",
            nodeAPI -> getAttribute(node, NODE_HEIGHT) -> value[0].f32);
    };

    auto ref = OH_ArkUI_RegisterSystemColorModeChangeEvent(image, image, onColorChange);

    ASSERT_EQ(ref, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value testUnregisterSystemColorModeChangeEvent_002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
	
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI -> setAttribute(column, NODE_WIDTH, &item);
    ArkUI_NumberValue value2[] = {720};
    ArkUI_AttributeItem item2 = {value2, 1};
    //value[0].f32 = 720;
    nodeAPI -> setAttribute(column, NODE_HEIGHT, &item2);

    ArkUI_NodeHandle image = nodeAPI -> createNode(ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value1[] = {200};
    ArkUI_AttributeItem item1 = {value1, 1};
    //value[0].f32 = 200;
    nodeAPI -> setAttribute(image, NODE_WIDTH, &item1);
    //value[0].f32 = 200;
    nodeAPI -> setAttribute(image, NODE_HEIGHT, &item1);
    ArkUI_AttributeItem itemSrc = {nullptr, 0, "xxxxx_1.img"};

    nodeAPI -> setAttribute(image, NODE_IMAGE_SRC, &itemSrc);
    nodeAPI -> addChild(column, image);

    auto onColorChange = [](ArkUI_SystemColorMode sysColorMode, void *userData) -> void {
        if (sysColorMode == ArkUI_SystemColorMode::ARKUI_SYSTEM_COLOR_MODE_DARK) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk onColorChange dark");
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk onColorChange light");
        }

        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );

        auto node = (ArkUI_NodeHandle)userData;

        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk onColorChange %{public}f",
            nodeAPI -> getAttribute(node, NODE_HEIGHT) -> value[0].f32);
    };

    auto ref = OH_ArkUI_RegisterSystemColorModeChangeEvent(image, image, onColorChange);

    ASSERT_EQ(ref, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_UnregisterSystemColorModeChangeEvent(image);
    NAPI_END;
}

static napi_value testRegisterSystemFontStyleChangeEvent_003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI -> setAttribute(column, NODE_WIDTH, &item);
    ArkUI_NumberValue value2[] = {720};
    ArkUI_AttributeItem item2 = {value2, 1};
    //value[0].f32 = 720;
    nodeAPI -> setAttribute(column, NODE_HEIGHT, &item2);

    ArkUI_NodeHandle text = nodeAPI -> createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value1[] = {100};
    ArkUI_AttributeItem item1 = {value1, 1};
    //value[0].f32 = 100;
    nodeAPI -> setAttribute(text, NODE_WIDTH, &item1);
    ArkUI_NumberValue value3[] = {30};
    ArkUI_AttributeItem item3 = {value3, 1};
    //value[0].f32 = 30;
    nodeAPI -> setAttribute(text, NODE_HEIGHT, &item3);
    ArkUI_AttributeItem itemString = {nullptr, 0, "人生得意须尽欢"};
    nodeAPI -> setAttribute(text, NODE_TEXT_CONTENT, &itemString);
    nodeAPI -> addChild(column, text);

    auto onFontChange = [](ArkUI_SystemFontStyleEvent *fontStyle, void *userData)->void {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk onFontChange fontChange");
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE,
            "ArkUI_NativeNodeAPI_1"));
        auto node = (ArkUI_NodeHandle)userData;

        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk onFontChange %{public}f",
            nodeAPI -> getAttribute(node, NODE_HEIGHT) -> value[0].f32);
    };

    auto ref = OH_ArkUI_RegisterSystemFontStyleChangeEvent(text, text, onFontChange);
    ASSERT_EQ(ref, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value testUnregisterSystemFontStyleChangeEvent_004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI -> setAttribute(column, NODE_WIDTH, &item);
    ArkUI_NumberValue value2[] = {720};
    ArkUI_AttributeItem item2 = {value2, 1};
    //value[0].f32 = 720;
    nodeAPI -> setAttribute(column, NODE_HEIGHT, &item2);

    ArkUI_NodeHandle text = nodeAPI -> createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value1[] = {100};
    ArkUI_AttributeItem item1 = {value1, 1};
    //value[0].f32 = 100;
    nodeAPI -> setAttribute(text, NODE_WIDTH, &item1);
    ArkUI_NumberValue value3[] = {30};
    ArkUI_AttributeItem item3 = {value3, 1};
    //value[0].f32 = 30;
    nodeAPI -> setAttribute(text, NODE_HEIGHT, &item3);
    ArkUI_AttributeItem itemString = {nullptr, 0, "人生得意须尽欢"};
    nodeAPI -> setAttribute(text, NODE_TEXT_CONTENT, &itemString);
    nodeAPI -> addChild(column, text);

    auto onFontChange = [](ArkUI_SystemFontStyleEvent *fontStyle, void *userData) -> void {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk onFontChange fontChange");
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE,
            "ArkUI_NativeNodeAPI_1"));
        
        auto node = (ArkUI_NodeHandle)userData;

        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk onFontChange %{public}f",
            nodeAPI->getAttribute(node, NODE_HEIGHT)->value[0].f32);
    };

    auto ref = OH_ArkUI_RegisterSystemFontStyleChangeEvent(text, text, onFontChange);
    ASSERT_EQ(ref, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_UnregisterSystemFontStyleChangeEvent(text);
    NAPI_END;
}


static napi_value testSystemFontStyleEvent_GetFontSizeScale_005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI -> setAttribute(column, NODE_WIDTH, &item);
    ArkUI_NumberValue value2[] = {720};
    ArkUI_AttributeItem item2 = {value2, 1};
    //value[0].f32 = 720;
    nodeAPI -> setAttribute(column, NODE_HEIGHT, &item2);

    ArkUI_NodeHandle text = nodeAPI -> createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value1[] = {100};
    ArkUI_AttributeItem item1 = {value1, 1};
    //value[0].f32 = 100;
    nodeAPI -> setAttribute(text, NODE_WIDTH, &item1);
    ArkUI_NumberValue value3[] = {30};
    ArkUI_AttributeItem item3 = {value3, 1};
    //value[0].f32 = 30;
    nodeAPI -> setAttribute(text, NODE_HEIGHT, &item3);
    ArkUI_AttributeItem itemString = {nullptr, 0, "人生得意须尽欢"};
    nodeAPI -> setAttribute(text, NODE_TEXT_CONTENT, &itemString);
    nodeAPI -> addChild(column, text);
    
    auto onFontChange = [](ArkUI_SystemFontStyleEvent *fontStyle, void *userData) -> void {
        auto fontSize = OH_ArkUI_SystemFontStyleEvent_GetFontSizeScale(fontStyle);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
            "kkk onFontChange fontSize = %{public}f", fontSize);
    };

    auto ref = OH_ArkUI_RegisterSystemFontStyleChangeEvent(text, text, onFontChange);
    ASSERT_EQ(ref, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value testSystemFontStyleEvent_GetFontWeightScale_006(napi_env env, napi_callback_info info)
{
    static napi_env env1 = env;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI -> setAttribute(column, NODE_WIDTH, &item);
    ArkUI_NumberValue value2[] = {720};
    ArkUI_AttributeItem item2 = {value2, 1};
    //value[0].f32 = 720;
    nodeAPI -> setAttribute(column, NODE_HEIGHT, &item2);

    ArkUI_NodeHandle text = nodeAPI -> createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value1[] = {100};
    ArkUI_AttributeItem item1 = {value1, 1};
    //value[0].f32 = 100;
    nodeAPI -> setAttribute(text, NODE_WIDTH, &item1);
    ArkUI_NumberValue value3[] = {30};
    ArkUI_AttributeItem item3 = {value3, 1};
    //value[0].f32 = 30;
    nodeAPI -> setAttribute(text, NODE_HEIGHT, &item3);
    ArkUI_AttributeItem itemString = {nullptr, 0, "人生得意须尽欢"};
    nodeAPI -> setAttribute(text, NODE_TEXT_CONTENT, &itemString);
    nodeAPI -> addChild(column, text);
    
    auto onFontChange = [](ArkUI_SystemFontStyleEvent *fontStyle, void *userData)->void {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SystemFontStyleEvenTest", "OnEventReceive");
        if (fontStyle == nullptr) {
            napi_throw_error((env1), nullptr,
                "assertion ( fontStyle != nullptr ) failed: Failed to produce error condition");
        }
        auto fontWeight = OH_ArkUI_SystemFontStyleEvent_GetFontWeightScale(fontStyle);
        
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
            "kkk onFontChange fontWeight = %{public}f", fontWeight);
    };

    auto ref = OH_ArkUI_RegisterSystemFontStyleChangeEvent(text, text, onFontChange);
    ASSERT_EQ(ref, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
}