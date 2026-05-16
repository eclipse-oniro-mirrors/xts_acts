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

#include "button_font_scale_Test.h"

#include "../manager/plugin_manager.h"

#define HEIGHT_PERCENT_1 0.1
#define WIDTH_PERCENT_1 0.5
#define MARGIN_NUMBER_10 10

namespace ArkUICapiTest {

std::shared_ptr<Component> CreateImageWithBlur(float blur)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsBlurTest", "CreateImageNode");

    auto image = std::make_shared<Component>(ARKUI_NODE_IMAGE);
    image->SetWidth(SIZE_100);
    image->SetHeight(SIZE_100);
    image->SetMargin(DEFAULT_MARGIN);
    image->SetBackgroundImage("resource://media/icon.png");
    image->SetBackgroundImageSizeWithStyle(ARKUI_IMAGE_SIZE_COVER);
    ArkUI_NumberValue blur_value[] = { { .f32 = blur } };
    ArkUI_AttributeItem blur_item = { blur_value, sizeof(blur_value) / sizeof(ArkUI_NumberValue) };
    image->setAttribute(NODE_BLUR, &blur_item);

    return image;
}

napi_value ButtonFontScaleTest::ButtonFontScale(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonFontScaleTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonFontScaleTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button1);
    nodeAPI->addChild(column, button2);
    nodeAPI->addChild(column, button3);

    ArkUI_NumberValue value[] = {{.f32 = MARGIN_NUMBER_10}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button1, NODE_MARGIN, &valueItem);
    nodeAPI->setAttribute(button2, NODE_MARGIN, &valueItem);
    nodeAPI->setAttribute(button3, NODE_MARGIN, &valueItem);

    ArkUI_NumberValue width_value[] = { { .f32 = WIDTH_PERCENT_1 } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(button1, NODE_WIDTH_PERCENT, &width_item);
    nodeAPI->setAttribute(button2, NODE_WIDTH_PERCENT, &width_item);
    nodeAPI->setAttribute(button3, NODE_WIDTH_PERCENT, &width_item);

    ArkUI_NumberValue height_value[] = { { .f32 = HEIGHT_PERCENT_1 } };
    ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(button1, NODE_HEIGHT_PERCENT, &height_item);
    nodeAPI->setAttribute(button2, NODE_HEIGHT_PERCENT, &height_item);
    nodeAPI->setAttribute(button3, NODE_HEIGHT_PERCENT, &height_item);

    ArkUI_NumberValue text_value[] = {};
    ArkUI_AttributeItem text_item = {text_value, sizeof(text_value) / sizeof(ArkUI_NumberValue)};
    text_item.string = "Button";
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &text_item);
    nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &text_item);
    nodeAPI->setAttribute(button3, NODE_BUTTON_LABEL, &text_item);

    ArkUI_NumberValue min_font_value[] = {{.f32 = 0.5}};
    ArkUI_AttributeItem min_font_item = {min_font_value, sizeof(min_font_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button1, NODE_BUTTON_MIN_FONT_SCALE, &min_font_item);
    
    ArkUI_NumberValue min_font_value1[] = {{.f32 = 0}};
    ArkUI_AttributeItem min_font_item1 = {min_font_value1, sizeof(min_font_value1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button2, NODE_BUTTON_MIN_FONT_SCALE, &min_font_item1);
    
    ArkUI_NumberValue min_font_value2[] = {{.f32 = 1}};
    ArkUI_AttributeItem min_font_item2 = {min_font_value2, sizeof(min_font_value2) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button3, NODE_BUTTON_MIN_FONT_SCALE, &min_font_item2);

    ArkUI_NumberValue max_font_value[] = {{.f32 = 2}};
    ArkUI_AttributeItem max_font_item = {max_font_value, sizeof(max_font_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button1, NODE_BUTTON_MAX_FONT_SCALE, &max_font_item);
    
    ArkUI_NumberValue max_font_value1[] = {{.f32 = 1}};
    ArkUI_AttributeItem max_font_item1 = {max_font_value1, sizeof(max_font_value1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button2, NODE_BUTTON_MAX_FONT_SCALE, &max_font_item1);
    
    ArkUI_AttributeItem textId = {.string = "button_001"};
    nodeAPI->setAttribute(button1, NODE_ID, &textId);
    ArkUI_AttributeItem textId1 = {.string = "button_002"};
    nodeAPI->setAttribute(button2, NODE_ID, &textId1);
    ArkUI_AttributeItem textId2 = {.string = "button_003"};
    nodeAPI->setAttribute(button3, NODE_ID, &textId2);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonFontScaleTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest