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
#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include "containerPicker/ContainerPickerOnChangeTest.h"
#include "containerPicker/ContainerPickerOnScrollStopTest.h"
#include "chainWeight/ChainWeightTest.h"
#include "border/BorderTest.h"
#include "border/BorderRadiusTest.h"
#include "layout/IgnoreLayoutSafeAreaTest.h"
#include "layout/LayoutGravityTest.h"
#include "flex/FlexSpaceTest.h"
#include "column/ColumnSpaceTest.h"
#include "row/RowSpaceTest.h"
#include "column/ColumnReverseTest.h"
#include "row/RowReverseTest.h"
#include "text/TextCompressLeadingPunctuationTest.h"
#include "textArea/TextAreaCompressLeadingPunctuationTest.h"
#include "textInput/TextInputCompressLeadingPunctuationTest.h"
#include "distance/DistanceTest.h"
#include "hoverEffect/HoverEffectTest.h"
#include "monopolize/MonopolizeTest.h"
#include "textSelection/TextSelectionTest.h"
#include "node/ConvertPositionToWindowTest.h"
#include "node/IsInRenderStateTest.h"
#include "node/ConvertPositionFromWindowTest.h"
#include "ScrollToVisible/ScrollToVisible.h"
#include "deleteBackward/DeleteBackwardTest.h"
#include "deleteBackward/TextAreaDeleteBackwardTest.h"
#include "textTest/TextTest.h"
#include "textTest/TextInputTest.h"
#include "textTest/TextAreaTest.h"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"getContext", nullptr, PluginManager::GetContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ContainerPickerOnChangeTest", nullptr, ContainerPickerOnChangeTest::CreateNativeNode,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ContainerPickerOnScrollStopTest", nullptr, ContainerPickerOnScrollStopTest::CreateNativeNode,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"chainWeightTest", nullptr, ChainWeightTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"borderTest", nullptr, BorderTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"borderRadiusTest", nullptr, BorderRadiusTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"ignoreLayoutSafeAreaTest", nullptr, IgnoreLayoutSafeAreaTest::CreateNativeNode, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"layoutGravityTest", nullptr, LayoutGravityTest::CreateNativeNode, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"flexSpaceTest", nullptr, FlexSpaceTest::CreateNativeNode, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"columnSpaceTest", nullptr, ColumnSpaceTest::CreateNativeNode, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"rowSpaceTest", nullptr, RowSpaceTest::CreateNativeNode, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"columnReverseTest", nullptr, ColumnReverseTest::CreateNativeNode, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"rowReverseTest", nullptr, RowReverseTest::CreateNativeNode, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"TextAreaCompressLeadingPunctuationTest", nullptr, TextAreaCompressLeadingPunctuationTest::CreateNativeNode, 
            nullptr, nullptr, nullptr, napi_default, nullptr}, 
        {"TextCompressLeadingPunctuationTest", nullptr, TextCompressLeadingPunctuationTest::CreateNativeNode, 
            nullptr, nullptr, nullptr, napi_default, nullptr}, 
        {"TextInputCompressLeadingPunctuationTest", nullptr, TextInputCompressLeadingPunctuationTest::CreateNativeNode, 
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetTextInputScrollToVisibleTest", nullptr, ScrollToVisibleTest::GetTextInputScrollToVisibleTest, 
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetTextAreaScrollToVisibleTest", nullptr, ScrollToVisibleTest::GetTextAreaScrollToVisibleTest, 
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreateScrollToVisibleNodeTest", nullptr, ScrollToVisibleTest::CreateScrollToVisibleNode, 
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"distanceTest", nullptr, DistanceTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"hoverEffectTest", nullptr, HoverEffectTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"monopolizeTest", nullptr, MonopolizeTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"textSelectionTest", nullptr, TextSelectionTest::textSelectionTest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestConvertPositionToWindow001", nullptr, ConvertPositionToWindowTest::TestConvertPositionToWindow001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestIsInRenderState001", nullptr, IsInRenderStateTest::TestIsInRenderState001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestConvertPositionFromWindow001", nullptr, ConvertPositionFromWindowTest::TestConvertPositionFromWindow001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DeleteBackwardTest", nullptr, DeleteBackwardTest::CreateNativeNode,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaDeleteBackwardTest", nullptr, TextAreaDeleteBackwardTest::CreateNativeNode,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextTest", nullptr, TextTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputTest", nullptr, TextInputTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaTest", nullptr, TextAreaTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }

    PluginManager::GetInstance()->Export(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module nativerenderModule = {.nm_version = 1,
                                         .nm_flags = 0,
                                         .nm_filename = nullptr,
                                         .nm_register_func = Init,
                                         .nm_modname = "nativerender",
                                         .nm_priv = ((void *)0),
                                         .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativerenderModule); }
} // namespace ArkUICapiTest