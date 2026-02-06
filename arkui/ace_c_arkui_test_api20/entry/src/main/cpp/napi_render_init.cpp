/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
#include "manager/plugin_manager.h"
#include "onIdle/post_on_idle_test.h"
#include "customcomponent/customcomponent_ondraw_front_test.h"
#include "customcomponent/customcomponent_ondraw_behind_test.h"
#include "EmbeddedComponentOption/EmbeddedComponentOptionTest.h"
#include "uiState/UiStatesTest.h"
#include "touchTestDone/OntouchTestDoneTest.h"
#include "nodeUtils/NodeUniqueIdTest.h"
#include "uiInput/UiInputErrorCodeTest.h"
#include "scope/RunTaskInScopeTest.h"
#include "list/ListCrossLanguageTest.h"
#include "grid/GridCrossLanguageTest.h"
#include "swiper/SwiperCrossLanguageTest.h"
#include "waterFlow/WaterFlowCrossLanguageTest.h"
#include "BindController/BindControllerTest.h"
#include "scroll/ScrollBarMarginTest.h"
#include "row/RowCrossLanguageTest.h"
#include "Column/ColumnCrossLanguageTest.h"
#include "Flex/FlexCrossLanguageTest.h"
#include "Stack/StackCrossLanguageTest.h"
#include "RelativeContainer/RelativeContainerCrossLanguageTest.h"
#include "napi/native_api.h"
#include "node/NodeCreatorTest.h"
#include "scroll/ScrollZoomSampleTest.h"

namespace ArkUICapiTest
{
    EXTERN_C_START
    static napi_value Init(napi_env env, napi_value exports)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
        if ((env == nullptr) || (exports == nullptr))
        {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
            return nullptr;
        }

        napi_property_descriptor desc[] = {
            {"getContext", nullptr, PluginManager::GetContext, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"testPostOnIdle", nullptr, PostOnIdleTest::testPostOnIdle001,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"customComponentOnDrawFrontTest", nullptr, CustomComponentOnDrawFrontTest::CreateNativeNode,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"customComponentOnDrawBehindTest", nullptr, CustomComponentOnDrawBehindTest::CreateNativeNode,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"testEmbeddedComponentOption", nullptr, EmbeddedComponentOptionTest::testEmbeddedComponentOption001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
            {"uiStatesTest", nullptr, UiStatesTest::CreateNativeNode, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"ontouchTestDone", nullptr, OntouchTestDoneTest::CreateNativeNode, nullptr, nullptr,nullptr, napi_default, nullptr},
            {"testNodeUniqueId", nullptr, NodeUniqueIdTest::testNodeUniqueId001,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"uiInputErrorCodeTest", nullptr, ButtonErrorCodeTest::CreateNativeNode, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"testRunTaskInScope", nullptr, RunTaskInScopeTest::testRunTaskInScope, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"createCrossLanguageListNode", nullptr, ListCrossLanguageTest::createCrossLanguageListNode,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createCrossLanguageGridNode", nullptr, GridCrossLanguageTest::createCrossLanguageGridNode,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createCrossLanguageSwiperNode", nullptr, SwiperCrossLanguageTest::createCrossLanguageSwiperNode,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createCrossLanguageWaterFlowNode", nullptr, WaterFlowCrossLanguageTest::createCrossLanguageWaterFlowNode,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"testBindController001", nullptr, NodeBindControllerTest::testBindController001, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"scrollScrollBarMarginTest", nullptr, ScrollScrollBarMarginTest::CreateNativeNodeScrollBarMargin, nullptr,
             nullptr, nullptr, napi_default, nullptr},
            {"createCrossLanguageRowNode", nullptr, RowCrossLanguageTest::createCrossLanguageRowNode,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createCrossLanguageColumnNode", nullptr, ColumnCrossLanguageTest::createCrossLanguageColumnNode,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createCrossLanguageFlexNode", nullptr, FlexCrossLanguageTest::createCrossLanguageFlexNode,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createCrossLanguageStackNode", nullptr, StackCrossLanguageTest::createCrossLanguageStackNode,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createCrossLanguageRelativeContainerNode", nullptr, RelativeContainerCrossLanguageTest::createCrossLanguageRelativeContainerNode,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            { "CreateNodeArkUIPostAsyncUITask", nullptr, NativeModule::CreateNodeArkUIPostAsyncUITask,
                 nullptr, nullptr, nullptr, napi_default, nullptr },
            { "CreateNodeArkUIPostAsyncUITaskResultValueS", nullptr, NativeModule::CreateNodeArkUIPostAsyncUITaskResultValueS,
                 nullptr, nullptr, nullptr, napi_default, nullptr },
            { "CreateNodeArkUIPostAsyncUITaskResultValueF", nullptr, NativeModule::CreateNodeArkUIPostAsyncUITaskResultValueF,
                 nullptr, nullptr, nullptr, napi_default, nullptr },
            { "CreateNodeArkUIPostUITask", nullptr, NativeModule::CreateNodeArkUIPostUITask,
                 nullptr, nullptr, nullptr, napi_default, nullptr },
            { "CreateNodeArkUIPostUITaskResultValueS", nullptr, NativeModule::CreateNodeArkUIPostUITaskResultValueS,
                 nullptr, nullptr, nullptr, napi_default, nullptr },
            { "CreateNodeArkUIPostUITaskResultValueF", nullptr, NativeModule::CreateNodeArkUIPostUITaskResultValueF,
                 nullptr, nullptr, nullptr, napi_default, nullptr },
            { "CreateNodeArkUIPostUITaskAndWait", nullptr, NativeModule::CreateNodeArkUIPostUITaskAndWait,
                 nullptr, nullptr, nullptr, napi_default, nullptr },
            { "CreateNodeArkUIPostUITaskAndWaitResultValueS", nullptr, NativeModule::CreateNodeArkUIPostUITaskAndWaitResultValueS,
                 nullptr, nullptr, nullptr, napi_default, nullptr },
            { "CreateNodeArkUIPostUITaskAndWaitResultValueF", nullptr, NativeModule::CreateNodeArkUIPostUITaskAndWaitResultValueF,
                 nullptr, nullptr, nullptr, napi_default, nullptr },
            { "CreateNodeTreeOnUIThread", nullptr, NativeModule::CreateNodeTreeOnUIThread,
                 nullptr, nullptr, nullptr, napi_default, nullptr },
            { "DisposeNodeTree", nullptr, NativeModule::DisposeNodeTree,
                 nullptr, nullptr, nullptr, napi_default, nullptr },
            {"scrollZoomStartTest", nullptr, ScrollZoomSampleTest::ScrollZoomStartTest, nullptr,
             nullptr, nullptr, napi_default, nullptr},
            {"scrollZoomDidTest", nullptr, ScrollZoomSampleTest::ScrollZoomDidTest, nullptr,
             nullptr, nullptr, napi_default, nullptr},
            {"scrollZoomStopTest", nullptr, ScrollZoomSampleTest::ScrollZoomStopTest, nullptr,
             nullptr, nullptr, napi_default, nullptr},
        };
        if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok)
        {
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
