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
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include "RegionListTest.h"

#define PARAM_100_POINT_02 100.02
#define PARAM_40_POINT_86325 40.86325
#define PARAM_3_POINT_5 3.5
#define PARAM_4_POINT_0 4.0
#define PARAM_0_POINT_0 0.0
#define PARAM_33 33
#define PARAM_NEGATIVE_25 (-25)
#define PARAM_NEGATIVE_25_POINT_0 (-25.0)
#define PARAM_NEGATIVE_2_POINT_0 (-2.0)
#define PARAM_NEGATIVE_3_POINT_0 (-3.0)
#define COLOR_PINK 0xFFFF6BA5

static ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
static bool g_hasAxis = false;
static ArkUI_NodeHandle Text = nullptr;

namespace ArkUICapiTest {
RegionListTest RegionListTest::manager_;
ArkUI_NodeHandle refresh;
ArkUI_NodeHandle currentHanle;
ArkUI_NodeHandle currentHanle2;
ArkUI_NodeHandle currentHanle3;
ArkUI_NodeHandle currentHanle4;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

napi_value RegionListTest::CreateNativeNode(napi_env env, napi_callback_info info) {

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Managerhqy", "CreateNativeNode env or info is null");
        return nullptr;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy", "CreateNativeNode  1111");

    size_t argCnt = 2;
    napi_value args[2] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Managerhqy", "CreateNativeNode napi_get_cb_info failed");
    }

    if (argCnt < 1) {
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
    auto manager = PluginManager::GetInstance();
    if (manager == nullptr) {
        return nullptr;
    }
    std::string id(idStr);
    OH_NativeXComponent *component = manager->GetNativeXComponent(id);
    if (component == nullptr) {
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy", "CreateNativeNode  2222 %{public}s", idStr);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy", "CreateNativeNode  3333333");
    
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    if (nodeAPI != nullptr) {
        if (nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {

            static ArkUI_ContextHandle context = nullptr;
            auto code = OH_ArkUI_GetContextFromNapiValue(env, args[PARAM_1], &context);


            ArkUI_NumberValue widthValue2[] = {SIZE_150};
            ArkUI_AttributeItem widthItem2 = {widthValue2, PARAM_1};
            ArkUI_NumberValue heightValue2[] = {SIZE_100};
            ArkUI_AttributeItem heightItem2 = {heightValue2, PARAM_1};


            ArkUI_NumberValue widthValue4[] = {SIZE_150};
            ArkUI_AttributeItem widthItem4 = {widthValue4, PARAM_1};
            ArkUI_NumberValue heightValue4[] = {SIZE_50};
            ArkUI_AttributeItem heightItem4 = {heightValue4, PARAM_1};

            
            ArkUI_NumberValue pinkValue[] = {{.u32 = COLOR_PINK}};
            ArkUI_AttributeItem pinkItem = {pinkValue, PARAM_1};
            ArkUI_NumberValue yellowValue[] = {{.u32 = COLOR_YELLOW}};
            ArkUI_AttributeItem yellowItem = {yellowValue, PARAM_1};

            ArkUI_NumberValue marginValue[] = {
                {.f32 = PARAM_5},
                {.f32 = PARAM_0},
                {.f32 = PARAM_5},
                {.f32 = PARAM_0},
            };
            ArkUI_AttributeItem marginItem = {.value = marginValue, .size = PARAM_4};
            ArkUI_NumberValue marginValue2[] = {
                {.f32 = PARAM_5},
                {.f32 = PARAM_0},
                {.f32 = PARAM_5},
                {.f32 = PARAM_0},
            };
            ArkUI_AttributeItem marginItem2 = {.value = marginValue2, .size = PARAM_4};


            ArkUI_NumberValue opacityValue[] = {PARAM_0_POINT_5};
            ArkUI_AttributeItem opacityItem = {opacityValue, PARAM_1};

            ArkUI_AttributeItem buttonLabel1 = {.string = "ResetRegionList"};

            ArkUI_NumberValue widthValueTest[] = {SIZE_150}; // 100%
            ArkUI_AttributeItem widthTestitem = {widthValueTest, PARAM_1};

            ArkUI_NumberValue heightValueTest[] = {SIZE_50}; // 50%
            ArkUI_AttributeItem heightTestitem = {heightValueTest, PARAM_1};
            ArkUI_NumberValue heightValueTest2[] = {PARAM_100}; // 100%
            ArkUI_AttributeItem heightTestitem2 = {heightValueTest2, PARAM_1};
            ArkUI_NumberValue heightValueTest3[] = {PARAM_100_POINT_02}; // 100.02%
            ArkUI_AttributeItem heightTestitem3 = {heightValueTest3, PARAM_1};

            ArkUI_NumberValue PositionVec[] = {
                {.f32 = PARAM_0},
                {.f32 = PARAM_0},
            };
            ArkUI_AttributeItem Position = {.value = PositionVec, .size = PARAM_2};
            ArkUI_NumberValue PositionVec2[] = {
                {.f32 = PARAM_0},
                {.f32 = PARAM_NEGATIVE_25},
            };
            ArkUI_AttributeItem Position2 = {.value = PositionVec2, .size = PARAM_2};
            ArkUI_NumberValue PositionVec3[] = {
                {.f32 = PARAM_40_POINT_86325},
                {.f32 = PARAM_0},
            };
            ArkUI_AttributeItem Position3 = {.value = PositionVec3, .size = PARAM_2};
            ArkUI_NumberValue PositionVec4[] = {
                {.f32 = PARAM_100_POINT_02},
                {.f32 = PARAM_100},
            };
            ArkUI_AttributeItem Position4 = {.value = PositionVec4, .size = PARAM_2};

            ArkUI_NumberValue sliceVec[] = {{.f32 = PARAM_NEGATIVE_2_POINT_0}, {.f32 = PARAM_NEGATIVE_3_POINT_0}, {.f32 = PARAM_3_POINT_5}, {.f32 = PARAM_4_POINT_0}};
            ArkUI_AttributeItem slice = {.value = sliceVec, .size = PARAM_4};

            ArkUI_NumberValue regionListVec[] = {
                {.i32 = ArkUI_ResponseRegionSupportedTool::ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_ALL},
                {.f32 = PARAM_0_POINT_0},
                {.f32 = PARAM_0_POINT_0},
                {.f32 = SIZE_100},
                {.f32 = SIZE_50}};
            ArkUI_AttributeItem regionListItem = {.value = regionListVec, .size = PARAM_5};
            ArkUI_AttributeItem textContext = {.string = "↓↓↓row1--ALL,0,0,100,50"};

            ArkUI_NumberValue regionListVec2[] = {
                {.i32 = ArkUI_ResponseRegionSupportedTool::ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_FINGER},
                {.f32 = PARAM_0_POINT_0},
                {.f32 = PARAM_NEGATIVE_25_POINT_0},
                {.f32 = PARAM_0},
                {.f32 = SIZE_50}};
            ArkUI_AttributeItem regionListItem2 = {.value = regionListVec2, .size = PARAM_5};
            ArkUI_AttributeItem textContext2 = {.string = "↓↓↓row2--FINGER,0,-25,0,50"};

            ArkUI_NumberValue regionListVec3[] = {
                {.i32 = ArkUI_ResponseRegionSupportedTool::ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_PEN},
                {.f32 = PARAM_40_POINT_86325},
                {.f32 = PARAM_0_POINT_0},
                {.f32 = SIZE_100},
                {.f32 = PARAM_0}};
            ArkUI_AttributeItem regionListItem3 = {.value = regionListVec3, .size = PARAM_5};
            ArkUI_AttributeItem textContext3 = {.string = "↓↓↓row3--PEN,40.86325,0,100,0"};

            ArkUI_NumberValue regionListVec4[] = {
                {.i32 = ArkUI_ResponseRegionSupportedTool::ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_MOUSE},
                {.f32 = PARAM_100_POINT_02},
                {.f32 = SIZE_100},
                {.f32 = PARAM_40_POINT_86325},
                {.f32 = PARAM_100_POINT_02}};
            ArkUI_AttributeItem regionListItem4 = {.value = regionListVec4, .size = PARAM_5};
            ArkUI_AttributeItem textContext4 = {.string = "↓↓↓row4--MOUSE,100.02,100,40.86325,100.02"};

            auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
            ArkUI_AttributeItem scrollId = {.string = "scrollId"};
            nodeAPI->setAttribute(scroll, NODE_ID, &scrollId);
            auto columnParent = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
            auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
            auto rowTest = nodeAPI->createNode(ARKUI_NODE_ROW);
            currentHanle = row;
            auto row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
            auto rowTest2 = nodeAPI->createNode(ARKUI_NODE_ROW);
            currentHanle2 = row2;
            auto row3 = nodeAPI->createNode(ARKUI_NODE_ROW);
            auto rowTest3 = nodeAPI->createNode(ARKUI_NODE_ROW);
            currentHanle3 = row3;
            auto row4 = nodeAPI->createNode(ARKUI_NODE_ROW);
            auto rowTest4 = nodeAPI->createNode(ARKUI_NODE_ROW);
            currentHanle4 = row4;

            static auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
            auto text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
            auto text3 = nodeAPI->createNode(ARKUI_NODE_TEXT);
            auto text4 = nodeAPI->createNode(ARKUI_NODE_TEXT);

            nodeAPI->setAttribute(button, NODE_WIDTH, &widthItem4);
            nodeAPI->setAttribute(button, NODE_HEIGHT, &heightItem4);
            nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel1);
            ArkUI_AttributeItem buttonId = {.string = "buttonId"};
            nodeAPI->setAttribute(button, NODE_ID, &buttonId);

            nodeAPI->setAttribute(row, NODE_WIDTH, &widthItem2);
            nodeAPI->setAttribute(row, NODE_HEIGHT, &heightItem2);
            nodeAPI->setAttribute(row, NODE_BACKGROUND_COLOR, &pinkItem);
            nodeAPI->setAttribute(row, NODE_MARGIN, &marginItem);
            nodeAPI->setAttribute(row, NODE_RESPONSE_REGION_LIST, &regionListItem);
            ArkUI_AttributeItem rowId = {.string = "rowId"};
            nodeAPI->setAttribute(row, NODE_ID, &rowId);
            nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textContext);
            ArkUI_AttributeItem textId = {.string = "textId"};
            nodeAPI->setAttribute(text, NODE_ID, &textId);
            nodeAPI->setAttribute(rowTest, NODE_WIDTH, &widthTestitem);
            nodeAPI->setAttribute(rowTest, NODE_HEIGHT, &heightTestitem);
            nodeAPI->setAttribute(rowTest, NODE_BACKGROUND_COLOR, &yellowItem);
            nodeAPI->setAttribute(rowTest, NODE_POSITION, &Position);

            nodeAPI->setAttribute(row2, NODE_WIDTH, &widthItem2);
            nodeAPI->setAttribute(row2, NODE_HEIGHT, &heightItem2);
            nodeAPI->setAttribute(row2, NODE_BACKGROUND_COLOR, &pinkItem);
            nodeAPI->setAttribute(row2, NODE_MARGIN, &marginItem);
            nodeAPI->setAttribute(row2, NODE_RESPONSE_REGION_LIST, &regionListItem2);
            nodeAPI->setAttribute(text2, NODE_TEXT_CONTENT, &textContext2);
            nodeAPI->setAttribute(rowTest2, NODE_WIDTH, &widthTestitem);
            nodeAPI->setAttribute(rowTest2, NODE_HEIGHT, &heightTestitem);
            ArkUI_AttributeItem rowId2 = {.string = "rowId2"};
            nodeAPI->setAttribute(rowTest2, NODE_ID, &rowId2);
            nodeAPI->setAttribute(rowTest2, NODE_BACKGROUND_COLOR, &yellowItem);
            nodeAPI->setAttribute(rowTest2, NODE_POSITION, &Position2);
            nodeAPI->setAttribute(rowTest2, NODE_OPACITY, &opacityItem);

            nodeAPI->setAttribute(row3, NODE_WIDTH, &widthItem2);
            nodeAPI->setAttribute(row3, NODE_HEIGHT, &heightItem2);
            nodeAPI->setAttribute(row3, NODE_BACKGROUND_COLOR, &pinkItem);
            nodeAPI->setAttribute(row3, NODE_MARGIN, &marginItem);
            nodeAPI->setAttribute(row3, NODE_RESPONSE_REGION_LIST, &regionListItem3);
            nodeAPI->setAttribute(text3, NODE_TEXT_CONTENT, &textContext3);
            nodeAPI->setAttribute(rowTest3, NODE_WIDTH, &widthTestitem);
            nodeAPI->setAttribute(rowTest3, NODE_HEIGHT, &heightTestitem2);
            nodeAPI->setAttribute(rowTest3, NODE_BACKGROUND_COLOR, &yellowItem);
            nodeAPI->setAttribute(rowTest3, NODE_POSITION, &Position3);
            nodeAPI->setAttribute(rowTest3, NODE_OPACITY, &opacityItem);
            ArkUI_AttributeItem rowId3 = {.string = "rowId3"};
            nodeAPI->setAttribute(row3, NODE_ID, &rowId3);

            nodeAPI->setAttribute(row4, NODE_WIDTH, &widthItem2);
            nodeAPI->setAttribute(row4, NODE_HEIGHT, &heightItem2);
            nodeAPI->setAttribute(row4, NODE_BACKGROUND_COLOR, &pinkItem);
            nodeAPI->setAttribute(row4, NODE_MARGIN, &marginItem2);
            nodeAPI->setAttribute(row4, NODE_RESPONSE_REGION_LIST, &regionListItem4);
            nodeAPI->setAttribute(text4, NODE_TEXT_CONTENT, &textContext4);
            nodeAPI->setAttribute(rowTest4, NODE_HEIGHT, &heightTestitem3);
            nodeAPI->setAttribute(rowTest4, NODE_BACKGROUND_COLOR, &yellowItem);
            nodeAPI->setAttribute(rowTest4, NODE_POSITION, &Position4);
            ArkUI_AttributeItem rowId4 = {.string = "rowId4"};
            nodeAPI->setAttribute(row4, NODE_ID, &rowId4);

            nodeAPI->registerNodeEvent(row, ArkUI_NodeEventType::NODE_ON_CLICK_EVENT, PARAM_11, nullptr);
            nodeAPI->registerNodeEvent(row2, ArkUI_NodeEventType::NODE_ON_CLICK_EVENT, PARAM_12, nullptr);
            nodeAPI->registerNodeEvent(row3, ArkUI_NodeEventType::NODE_ON_CLICK_EVENT, PARAM_13, nullptr);
            nodeAPI->registerNodeEvent(row4, ArkUI_NodeEventType::NODE_ON_CLICK_EVENT, PARAM_14, nullptr);

            nodeAPI->registerNodeEvent(button, ArkUI_NodeEventType::NODE_ON_CLICK_EVENT, PARAM_33, nullptr);

            nodeAPI->registerNodeEvent(text, ArkUI_NodeEventType::NODE_ON_CLICK_EVENT, PARAM_1, nullptr);
            nodeAPI->registerNodeEvent(text2, ArkUI_NodeEventType::NODE_ON_CLICK_EVENT, PARAM_2, nullptr);
            nodeAPI->registerNodeEvent(text3, ArkUI_NodeEventType::NODE_ON_CLICK_EVENT, PARAM_3, nullptr);
            nodeAPI->registerNodeEvent(text4, ArkUI_NodeEventType::NODE_ON_CLICK_EVENT, PARAM_4, nullptr);
            nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
                auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
                auto type = OH_ArkUI_NodeEvent_GetEventType(event);
                if (targetId == PARAM_1) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy",
                                 "row getResponseRegionListAttribute is ↓↓↓");
                    manager_.getResponseRegionListAttribute(currentHanle);
                } else if (targetId == PARAM_2) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy",
                                 "row2 getResponseRegionListAttribute is ↓↓↓");
                    manager_.getResponseRegionListAttribute(currentHanle2);
                } else if (targetId == PARAM_3) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy",
                                 "row3 getResponseRegionListAttribute is ↓↓↓");
                    manager_.getResponseRegionListAttribute(currentHanle3);
                } else if (targetId == PARAM_4) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy",
                                 "row4 getResponseRegionListAttribute is ↓↓↓");
                    manager_.getResponseRegionListAttribute(currentHanle4);
                } else if (targetId == PARAM_11) {
                    std::string numLockText = "row1 is clicked";
                    ArkUI_AttributeItem updatedTEXT_Item = {.string = numLockText.c_str()};
                    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &updatedTEXT_Item);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy", "row1 is clicked");
                } else if (targetId == PARAM_12) {
                    std::string numLockText = "row2 is clicked";
                    ArkUI_AttributeItem updatedTEXT_Item = {.string = numLockText.c_str()};
                    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &updatedTEXT_Item);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy", "row2 is clicked");
                } else if (targetId == PARAM_13) {
                    std::string numLockText = "row3 is clicked";
                    ArkUI_AttributeItem updatedTEXT_Item = {.string = numLockText.c_str()};
                    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &updatedTEXT_Item);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy", "row3 is clicked");
                } else if (targetId == PARAM_14) {
                    std::string numLockText = "row4 is clicked";
                    ArkUI_AttributeItem updatedTEXT_Item = {.string = numLockText.c_str()};
                    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &updatedTEXT_Item);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy", "row4 is clicked");
                } else if (targetId == PARAM_33) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy", "all ResponseRegionList is reset");
                    manager_.reSetResponseRegionListAttribute(currentHanle);
                    manager_.reSetResponseRegionListAttribute(currentHanle2);
                    manager_.reSetResponseRegionListAttribute(currentHanle3);
                    manager_.reSetResponseRegionListAttribute(currentHanle4);
                }
            });

            nodeAPI->addChild(scroll, columnParent);
            nodeAPI->addChild(columnParent, button);
            nodeAPI->addChild(columnParent, text);
            nodeAPI->addChild(columnParent, row);
            nodeAPI->addChild(row, rowTest);
            nodeAPI->addChild(columnParent, row2);
            nodeAPI->addChild(row2, rowTest2);
            nodeAPI->addChild(columnParent, row3);
            nodeAPI->addChild(row3, rowTest3);
            nodeAPI->addChild(columnParent, row4);
            nodeAPI->addChild(row4, rowTest4);
            OH_NativeXComponent_AttachNativeRootNode(component, scroll);
        }
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy", "CreateNativeNode  555");
    return nullptr;
}

void RegionListTest::getResponseRegionListAttribute(ArkUI_NodeHandle node) {
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto item = nodeAPI->getAttribute(node, NODE_RESPONSE_REGION_LIST);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy", "item->size is  %{public}d ", item->size);
    if (item->size == PARAM_5) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy",
                     "NODE_RESPONSE_REGION_LIST %{public}d %{public}f %{public}f %{public}f %{public}f",
                     item->value[PARAM_0].i32, item->value[PARAM_1].f32, item->value[PARAM_2].f32, item->value[PARAM_3].f32,
                     item->value[PARAM_4].f32);
    } else if (item->size == PARAM_20) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy",
                     "NODE_RESPONSE_REGION_LIST %{public}d %{public}f %{public}f %{public}f %{public}f "
                     "%{public}d %{public}f %{public}f %{public}f %{public}f"
                     "%{public}d %{public}f %{public}f %{public}f %{public}f"
                     "%{public}d %{public}f %{public}f %{public}f %{public}f",
                     item->value[PARAM_0].i32, item->value[PARAM_1].f32, item->value[PARAM_2].f32, item->value[PARAM_3].f32, item->value[PARAM_4].f32,
                     item->value[PARAM_5].i32, item->value[PARAM_6].f32, item->value[PARAM_7].f32, item->value[PARAM_8].f32, item->value[PARAM_9].f32,
                     item->value[PARAM_10].i32, item->value[PARAM_11].f32, item->value[PARAM_12].f32, item->value[PARAM_13].f32,
                     item->value[PARAM_14].f32, item->value[PARAM_15].i32, item->value[PARAM_16].f32, item->value[PARAM_17].f32,
                     item->value[PARAM_18].f32, item->value[PARAM_19].f32);
    } else if (item->size == PARAM_15) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy",
                     "NODE_RESPONSE_REGION_LIST %{public}d %{public}f %{public}f %{public}f %{public}f "
                     "%{public}d %{public}f %{public}f %{public}f %{public}f "
                     "%{public}d %{public}f %{public}f %{public}f %{public}f ",
                     item->value[PARAM_0].i32, item->value[PARAM_1].f32, item->value[PARAM_2].f32, item->value[PARAM_3].f32, item->value[PARAM_4].f32,
                     item->value[PARAM_5].i32, item->value[PARAM_6].f32, item->value[PARAM_7].f32, item->value[PARAM_8].f32, item->value[PARAM_9].f32,
                     item->value[PARAM_10].i32, item->value[PARAM_11].f32, item->value[PARAM_12].f32, item->value[PARAM_13].f32,
                     item->value[PARAM_14].f32);
    } else if (item->size == PARAM_10) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy",
                     "NODE_RESPONSE_REGION_LIST %{public}d %{public}f %{public}f %{public}f %{public}f "
                     "%{public}d %{public}f %{public}f %{public}f %{public}f",
                     item->value[PARAM_0].i32, item->value[PARAM_1].f32, item->value[PARAM_2].f32, item->value[PARAM_3].f32, item->value[PARAM_4].f32,
                     item->value[PARAM_5].i32, item->value[PARAM_6].f32, item->value[PARAM_7].f32, item->value[PARAM_8].f32,
                     item->value[PARAM_9].f32);
    } else if (item->size == PARAM_8) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Managerhqy",
                     "NODE_RESPONSE_REGION_LIST %{public}d %{public}f %{public}f %{public}f %{public}f "
                     "%{public}d %{public}f %{public}f %{public}f %{public}f",
                     item->value[PARAM_0].i32, item->value[PARAM_1].f32, item->value[PARAM_2].f32, item->value[PARAM_3].f32, item->value[PARAM_4].f32,
                     item->value[PARAM_5].i32, item->value[PARAM_6].f32, item->value[PARAM_7].f32, item->value[PARAM_8].f32,
                     item->value[PARAM_9].f32);
    }
}

void RegionListTest::reSetResponseRegionListAttribute(ArkUI_NodeHandle node) {
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    nodeAPI->resetAttribute(node, NODE_RESPONSE_REGION_LIST);
}
} // namespace ArkUICapiTest