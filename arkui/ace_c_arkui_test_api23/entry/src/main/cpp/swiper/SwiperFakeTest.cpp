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

#include "SwiperFakeTest.h"
#include <string>
#include <arkui/native_interface.h>
#include <memory>
#include "common/common.h"
#include "napi/native_api.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <hilog/log.h>
#include <arkui/native_node_napi.h>
#include "../manager/PluginManagerTest.h"

namespace ConstIde {
const float TEXT_WIDTH_VP = 200.0f;        // 宽度
const float TEXT_HEIGHT_VP = 60.0f;       // 高度
const uint32_t TEXT_BG_COLOR = 0xFFAFEEEE; // 淡蓝色
const int32_t TEXT_ALIGN_CENTER = 1;       // 居中
const float TEXT_FONT_SIZE_VP = 30.0f;     // 字体大小

const uint32_t NUMBER_0 = 0;
const uint32_t NUMBER_1 = 1;
const uint32_t BACKGROUND_COLOR = 0x2AA1A6B1;
} // namespace ConstIde

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
static ArkUI_NativeNodeAPI_1 *nodeAPI_ = nullptr;
ArkUI_ContextHandle g_contextHandle = nullptr;
int g_dragCount = PARAM_10;
ArkUI_NodeHandle swiper = nullptr;
ArkUI_NodeHandle buttonText = nullptr;
ArkUI_NodeHandle buttonText2 = nullptr;
ArkUI_NodeHandle buttonText3 = nullptr;
ArkUI_NodeHandle buttonText4 = nullptr;
ArkUI_NodeHandle buttonText5 = nullptr;
ArkUI_NodeHandle buttonText6 = nullptr;
ArkUI_NodeHandle buttonText7 = nullptr;
ArkUI_NodeHandle buttonText8 = nullptr;
ArkUI_NodeHandle buttonText9 = nullptr;
ArkUI_NodeHandle root_ = nullptr;
ArkUI_NumberValue value[] = {0};
ArkUI_AttributeItem item = {.value = value, .size = 1};
typedef void (*FakeCallback)(uint64_t nanoTimestamp, uint32_t frameCount, void *userData);
FakeCallback g_callback = [](uint64_t nanoTimestamp, uint32_t frameCount, void *userData) {
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq g_dragCount %{public}d", g_dragCount);
    if (g_dragCount > 0) {
        bool ret = false;
        OH_ArkUI_Swiper_FakeDragBy(swiper, PARAM_NEGATIVE_3, &ret);
        OH_ArkUI_PostFrameCallback(g_contextHandle, nullptr, g_callback);
        --g_dragCount;
    } else {
        bool ret = false;
        OH_ArkUI_Swiper_StopFakeDrag(swiper, &ret);
    }
};

static auto CreateSwiper()
{
    const int size = PARAM_11;
    // 设置swiper内容为0,1,2……
    const char *arr[size] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
    swiper = nodeAPI_->createNode(ARKUI_NODE_SWIPER);

    for (int j = ConstIde::NUMBER_0; j < size; j++) {
        ArkUI_NodeHandle textNode = nodeAPI_->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem content = {.string = arr[j]};
        nodeAPI_->setAttribute(textNode, NODE_TEXT_CONTENT, &content);
        value[ConstIde::NUMBER_0].f32 = ConstIde::TEXT_HEIGHT_VP;
        nodeAPI_->setAttribute(textNode, NODE_HEIGHT, &item);
        value[ConstIde::NUMBER_0].u32 = ConstIde::TEXT_BG_COLOR;
        nodeAPI_->setAttribute(textNode, NODE_BACKGROUND_COLOR, &item);
        value[ConstIde::NUMBER_0].i32 = ConstIde::TEXT_ALIGN_CENTER;
        nodeAPI_->setAttribute(textNode, NODE_TEXT_ALIGN, &item);
        value[ConstIde::NUMBER_0].f32 = ConstIde::TEXT_FONT_SIZE_VP;
        nodeAPI_->setAttribute(textNode, NODE_FONT_SIZE, &item);

        std::string str = "SwiperAutoPlayText_" + std::to_string(j);
        ArkUI_AttributeItem textId = {.string = str.c_str()};
        nodeAPI_->setAttribute(textNode, NODE_ID, &textId);
        nodeAPI_->addChild(swiper, textNode);
    }
}

static auto CreateButton1()
{
    buttonText = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = SIZE_100;
    nodeAPI_->setAttribute(buttonText, NODE_WIDTH, &item);
    value[0].f32 = SIZE_10;
    nodeAPI_->setAttribute(buttonText, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF00FF; // 红色
    nodeAPI_->setAttribute(buttonText, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem content = {.string = "start fake drag"};
    nodeAPI_->setAttribute(buttonText, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText, NODE_ON_CLICK, PARAM_1, nullptr);
    ArkUI_AttributeItem btnId = {.string = "btn1Id"};
    nodeAPI_->setAttribute(buttonText, NODE_ID, &btnId);
}

static auto CreateButton2()
{
    buttonText2 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = SIZE_100;
    nodeAPI_->setAttribute(buttonText2, NODE_WIDTH, &item);
    value[0].f32 = SIZE_10;
    nodeAPI_->setAttribute(buttonText2, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFFD700; // 金色
    nodeAPI_->setAttribute(buttonText2, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem content = {.string = "fake drag 100"};
    nodeAPI_->setAttribute(buttonText2, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText2, NODE_ON_CLICK, PARAM_2, nullptr);
    ArkUI_AttributeItem btnId = {.string = "btn2Id"};
    nodeAPI_->setAttribute(buttonText2, NODE_ID, &btnId);
}

static auto CreateButton3()
{
    buttonText3 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = SIZE_100;
    nodeAPI_->setAttribute(buttonText3, NODE_WIDTH, &item);
    value[0].f32 = SIZE_10;
    nodeAPI_->setAttribute(buttonText3, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF00FF; // 红色
    nodeAPI_->setAttribute(buttonText3, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem content = {.string = "fake drag -100"};
    nodeAPI_->setAttribute(buttonText3, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText3, NODE_ON_CLICK, PARAM_3, nullptr);
    ArkUI_AttributeItem btnId = {.string = "btn3Id"};
    nodeAPI_->setAttribute(buttonText3, NODE_ID, &btnId);
}

static auto CreateButton4()
{
    buttonText4 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = SIZE_100;
    nodeAPI_->setAttribute(buttonText4, NODE_WIDTH, &item);
    value[0].f32 = SIZE_10;
    nodeAPI_->setAttribute(buttonText4, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFFD700; // 金色
    nodeAPI_->setAttribute(buttonText4, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem content = {.string = "stop fake drag"};
    nodeAPI_->setAttribute(buttonText4, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText4, NODE_ON_CLICK, PARAM_4, nullptr);
    ArkUI_AttributeItem btnId = {.string = "btn4Id"};
    nodeAPI_->setAttribute(buttonText4, NODE_ID, &btnId);
}

static auto CreateButton5()
{
    buttonText5 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = SIZE_100;
    nodeAPI_->setAttribute(buttonText5, NODE_WIDTH, &item);
    value[0].f32 = SIZE_10;
    nodeAPI_->setAttribute(buttonText5, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF00FF; // 红色
    nodeAPI_->setAttribute(buttonText5, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem content = {.string = "模拟连续划动"};
    nodeAPI_->setAttribute(buttonText5, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText5, NODE_ON_CLICK, PARAM_5, nullptr);
    ArkUI_AttributeItem btnId = {.string = "btn5Id"};
    nodeAPI_->setAttribute(buttonText5, NODE_ID, &btnId);
}

static auto CreateButton6()
{
    buttonText6 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = SIZE_100;
    nodeAPI_->setAttribute(buttonText6, NODE_WIDTH, &item);
    value[0].f32 = SIZE_10;
    nodeAPI_->setAttribute(buttonText6, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFFD700; // 金色
    nodeAPI_->setAttribute(buttonText6, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem content = {.string = "showprev"};
    nodeAPI_->setAttribute(buttonText6, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText6, NODE_ON_CLICK, PARAM_6, nullptr);
    ArkUI_AttributeItem btnId = {.string = "btn6Id"};
    nodeAPI_->setAttribute(buttonText6, NODE_ID, &btnId);
}

static auto CreateButton7()
{
    buttonText7 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = SIZE_100;
    nodeAPI_->setAttribute(buttonText7, NODE_WIDTH, &item);
    value[0].f32 = SIZE_10;
    nodeAPI_->setAttribute(buttonText7, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF00FF; // 红色
    nodeAPI_->setAttribute(buttonText7, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem content = {.string = "shownext"};
    nodeAPI_->setAttribute(buttonText7, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText7, NODE_ON_CLICK, PARAM_7, nullptr);
    ArkUI_AttributeItem btnId = {.string = "btn7Id"};
    nodeAPI_->setAttribute(buttonText7, NODE_ID, &btnId);
}

static auto CreateButton8()
{
    buttonText8 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = SIZE_100;
    nodeAPI_->setAttribute(buttonText8, NODE_WIDTH, &item);
    value[0].f32 = SIZE_10;
    nodeAPI_->setAttribute(buttonText8, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFFD700; // 金色
    nodeAPI_->setAttribute(buttonText8, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem content = {.string = "errtest"};
    nodeAPI_->setAttribute(buttonText8, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText8, NODE_ON_CLICK, PARAM_8, nullptr);
    ArkUI_AttributeItem errBtnId = {.string = "errtestId"};
    nodeAPI_->setAttribute(buttonText8, NODE_ID, &errBtnId);
}

static auto CreateButton9()
{
    buttonText9 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = SIZE_100;
    nodeAPI_->setAttribute(buttonText9, NODE_WIDTH, &item);
    value[0].f32 = SIZE_10;
    nodeAPI_->setAttribute(buttonText9, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF00FF; // 红色
    nodeAPI_->setAttribute(buttonText9, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem content = {.string = "isfakedragging"};
    nodeAPI_->setAttribute(buttonText9, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText9, NODE_ON_CLICK, PARAM_9, nullptr);
    ArkUI_AttributeItem btnId = {.string = "btn9Id"};
    nodeAPI_->setAttribute(buttonText9, NODE_ID, &btnId);
}

static auto TestInvalidateCode()
{
    bool ret = false;
    int32_t codeErr1 = OH_ArkUI_Swiper_StartFakeDrag(nullptr, &ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
        "hzq OH_ArkUI_Swiper_StartFakeDrag %{public}d %{public}d", ret, codeErr1);
    int32_t codeErr2 = OH_ArkUI_Swiper_FakeDragBy(nullptr, PARAM_100, &ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
        "hzq OH_ArkUI_Swiper_FakeDragBy %{public}d %{public}d", ret, codeErr2);
    int32_t codeErr3 = OH_ArkUI_Swiper_StopFakeDrag(nullptr, &ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
        "hzq OH_ArkUI_Swiper_StopFakeDrag %{public}d %{public}d", ret, codeErr3);
    int32_t codeErr4 = OH_ArkUI_Swiper_IsFakeDragging(nullptr, &ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
        "hzq OH_ArkUI_Swiper_IsFakeDragging %{public}d %{public}d", ret, codeErr4);
    int32_t codeErr5 = OH_ArkUI_Swiper_ShowPrevious(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper_ShowPrevious %{public}d", codeErr5);
    int32_t codeErr6 = OH_ArkUI_Swiper_ShowNext(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper_ShowNext %{public}d", codeErr6);
    if (codeErr1 == ARKUI_ERROR_CODE_PARAM_INVALID && codeErr2 == ARKUI_ERROR_CODE_PARAM_INVALID
        && codeErr3 == ARKUI_ERROR_CODE_PARAM_INVALID && codeErr4 == ARKUI_ERROR_CODE_PARAM_INVALID
        && codeErr5 == ARKUI_ERROR_CODE_PARAM_INVALID && codeErr6 == ARKUI_ERROR_CODE_PARAM_INVALID) {
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper11_ShowNext", codeErr6);
            ArkUI_AttributeItem content = {.string = "401Code"};
            nodeAPI_->setAttribute(buttonText8, NODE_TEXT_CONTENT, &content);
        }
}
static auto TestParam1()
{
    bool ret = false;
    int32_t codeErr = OH_ArkUI_Swiper_StartFakeDrag(swiper, &ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
        "hzq OH_ArkUI_Swiper_StartFakeDrag %{public}d %{public}d", ret, codeErr);
    if (codeErr == ARKUI_ERROR_CODE_NO_ERROR) {
        ArkUI_AttributeItem content = {.string = "0Code"};
        nodeAPI_->setAttribute(buttonText, NODE_TEXT_CONTENT, &content);
    }
}

static auto TestParam2()
{
    bool ret = false;
    int32_t codeErr = OH_ArkUI_Swiper_FakeDragBy(swiper, PARAM_100, &ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
        "hzq OH_ArkUI_Swiper_FakeDragBy100 %{public}d %{public}d", ret, codeErr);
    if (codeErr == ARKUI_ERROR_CODE_NO_ERROR) {
        ArkUI_AttributeItem content = {.string = "0Code"};
        nodeAPI_->setAttribute(buttonText2, NODE_TEXT_CONTENT, &content);
    }
}

static auto TestParam3()
{
    bool ret = false;
    int32_t codeErr = OH_ArkUI_Swiper_FakeDragBy(swiper, PARAM_NEGATIVE_100, &ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
        "hzq OH_ArkUI_Swiper_FakeDragBy-100 %{public}d %{public}d", ret, codeErr);
    if (codeErr == ARKUI_ERROR_CODE_NO_ERROR) {
        ArkUI_AttributeItem content = {.string = "0Code"};
        nodeAPI_->setAttribute(buttonText3, NODE_TEXT_CONTENT, &content);
    }
}

static auto TestParam4()
{
    bool ret = false;
    int32_t codeErr = OH_ArkUI_Swiper_StopFakeDrag(swiper, &ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper_StopFakeDrag %{public}d %{public}d",
        ret, codeErr);
    if (codeErr == ARKUI_ERROR_CODE_NO_ERROR) {
        ArkUI_AttributeItem content = {.string = "0Code"};
        nodeAPI_->setAttribute(buttonText4, NODE_TEXT_CONTENT, &content);
    }
}

static auto TestParam5()
{
    bool ret = true;
    int32_t codeErr = OH_ArkUI_Swiper_StartFakeDrag(swiper, &ret);
    g_dragCount = PARAM_10;
    int32_t postFrameCallbackRet = OH_ArkUI_PostFrameCallback(g_contextHandle, nullptr, g_callback);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_PostFrameCallback %{public}d",
        postFrameCallbackRet);
    if (codeErr == ARKUI_ERROR_CODE_NO_ERROR) {
        ArkUI_AttributeItem content = {.string = "0Code"};
        nodeAPI_->setAttribute(buttonText5, NODE_TEXT_CONTENT, &content);
    }
}

static auto TestParam6()
{
    int32_t codeErr = OH_ArkUI_Swiper_ShowPrevious(swiper);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper_StopFakeDrag %{public}d", codeErr);
    if (codeErr == ARKUI_ERROR_CODE_NO_ERROR) {
        ArkUI_AttributeItem content = {.string = "0Code"};
        nodeAPI_->setAttribute(buttonText6, NODE_TEXT_CONTENT, &content);
    }
}

static auto TestParam7()
{
    int32_t codeErr = OH_ArkUI_Swiper_ShowNext(swiper);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper_StopFakeDrag %{public}d", codeErr);
    if (codeErr == ARKUI_ERROR_CODE_NO_ERROR) {
            ArkUI_AttributeItem content = {.string = "0Code"};
            nodeAPI_->setAttribute(buttonText7, NODE_TEXT_CONTENT, &content);
        }
}
static auto TestParam9()
{
    bool ret = false;
    int32_t codeErr = OH_ArkUI_Swiper_IsFakeDragging(swiper, &ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
        "hzq OH_ArkUI_Swiper_IsFakeDragging %{public}d %{public}d", ret, codeErr);
    if (codeErr == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper11_IsFakeDragging", codeErr);
            ArkUI_AttributeItem content = {.string = "0Code"};
            nodeAPI_->setAttribute(buttonText9, NODE_TEXT_CONTENT, &content);
        }
}

static auto RegisterOnClickForBtn()
{
    auto onclick = [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_1) {
            TestParam1();
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_2) {
            TestParam2();
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_3) {
            TestParam3();
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_4) {
            TestParam4();
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_5) {
            TestParam5();
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_6) {
            TestParam6();
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_7) {
            TestParam7();
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_8) {
            TestInvalidateCode();
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_9) {
            TestParam9();
        }
    };
    nodeAPI_->registerNodeEventReceiver(onclick);
}

static auto AddChildBtn()
{
    value[0].f32 = SIZE_300;
    nodeAPI_->setAttribute(swiper, NODE_WIDTH, &item);
    nodeAPI_->addChild(root_, swiper);
    nodeAPI_->addChild(root_, buttonText);
    nodeAPI_->addChild(root_, buttonText2);
    nodeAPI_->addChild(root_, buttonText3);
    nodeAPI_->addChild(root_, buttonText4);
    nodeAPI_->addChild(root_, buttonText5);
    nodeAPI_->addChild(root_, buttonText6);
    nodeAPI_->addChild(root_, buttonText7);
    nodeAPI_->addChild(root_, buttonText8);
    nodeAPI_->addChild(root_, buttonText9);
}

namespace ArkUICapiTest {
 napi_value SwiperFakeTest::CreateNativeSwiperNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Swiper11FakeTest", "start");
    size_t argc = 1;
    napi_value args1[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args1, nullptr, nullptr);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode napi_get_cb_info failed");
    }
    nodeAPI_ = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    root_ = nodeAPI_->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[ConstIde::NUMBER_0], &nodeContentHandle);
    OH_ArkUI_GetContextFromNapiValue(env, args[1], &g_contextHandle);
    CreateSwiper();
    CreateButton1();
    CreateButton2();
    CreateButton3();
    CreateButton4();
    CreateButton5();
    CreateButton6();
    CreateButton7();
    CreateButton8();
    CreateButton9();

    RegisterOnClickForBtn();
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = {0};
    napi_get_value_string_utf8(env, args1[0], xComponentID, length, &strLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Swiper11FakeTest",
                 "%{public}s", xComponentID);

    AddChildBtn();
    // 挂载节点
    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), root_);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
    return nullptr;
    }
    return exports;
}
}