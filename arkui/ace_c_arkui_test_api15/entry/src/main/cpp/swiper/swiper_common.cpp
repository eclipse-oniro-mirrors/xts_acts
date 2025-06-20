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

#include "swiper_common.h"
#include <string>
#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {

ArkUI_NodeHandle SwiperCommon::CreateSwiper(SwiperPropertiesInit flags)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto swiper = nodeAPI->createNode(ARKUI_NODE_SWIPER);

    if (flags.initWidthFlag) {
        ArkUI_NumberValue width_value[] = { { .f32 = 200 } };
        ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(swiper, NODE_WIDTH, &width_item);
    }

    if (flags.initHeightFlag) {
        ArkUI_NumberValue height_value[] = { { .f32 = 100 } };
        ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(swiper, NODE_HEIGHT, &height_item);
    }

    ArkUI_NumberValue margin_value[] = { { .f32 = 20 } };
    ArkUI_AttributeItem margin_item = { margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(swiper, NODE_MARGIN, &margin_item);

    if (flags.initBackgroundColorFlag) {
        ArkUI_NumberValue background_color_value[] = { { .u32 = 0xFFFFFFFF } };
        ArkUI_AttributeItem background_color_value_item = { background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(swiper, NODE_BACKGROUND_COLOR, &background_color_value_item);
    }

    if (flags.initChildNodeFlag) {
        auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_NumberValue text_background_value[] = { { .u32 = 0xFFAFEEEE } };
        ArkUI_AttributeItem text_background_item = { text_background_value,
            sizeof(text_background_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &text_background_item);

        auto text_second = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_NumberValue text_second_background_value[] = { { .u32 = 0xFF00FF00 } };
        ArkUI_AttributeItem text_second_background_item = { text_second_background_value,
            sizeof(text_second_background_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(text_second, NODE_BACKGROUND_COLOR, &text_second_background_item);

        auto text_third = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_NumberValue text_third_background_value[] = { { .u32 = 0xFFFF0000 } };
        ArkUI_AttributeItem text_third_background_item = { text_third_background_value,
            sizeof(text_third_background_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(text_third, NODE_BACKGROUND_COLOR, &text_third_background_item);

        auto text_fourth = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_NumberValue text_fourth_background_value[] = { { .u32 = 0xFF0000FF } };
        ArkUI_AttributeItem text_fourth_background_item = { text_fourth_background_value,
            sizeof(text_fourth_background_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(text_fourth, NODE_BACKGROUND_COLOR, &text_fourth_background_item);

        nodeAPI->addChild(swiper, text);
        nodeAPI->addChild(swiper, text_second);
        nodeAPI->addChild(swiper, text_third);
        nodeAPI->addChild(swiper, text_fourth);
    }

    return swiper;
}
} // namespace ArkUICapiTest