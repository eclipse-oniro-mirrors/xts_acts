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
#include "common/common.h"
#include "renderNode/RenderNodeAttributeTest.cpp"
#include "renderNode/RenderNodeTest.cpp"
#include "renderNodeUtils/renderNodeUtils.cpp"

namespace ArkUICapiTest
{
    EXTERN_C_START
    static napi_value Init(napi_env env, napi_value exports)
    {
        if ((env == nullptr) || (exports == nullptr))
        {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
            return nullptr;
        }

        napi_property_descriptor desc[] = {
            {"TestBackgroundColor", nullptr, TestBackgroundColor, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestBorderColor", nullptr, TestBorderColor, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestBorderRadius", nullptr, TestBorderRadius, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestBorderStyle", nullptr, TestBorderStyle, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestBorderWidth", nullptr, TestBorderWidth, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestBounds", nullptr, TestBounds, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestClipToBounds", nullptr, TestClipToBounds, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestClipToFrame", nullptr, TestClipToFrame, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestOpacity", nullptr, TestOpacity, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestPivot", nullptr, TestPivot, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestPosition", nullptr, TestPosition, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestRotation", nullptr, TestRotation, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestScale", nullptr, TestScale, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestSetDrawRegion", nullptr, TestSetDrawRegion, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestSetMarkNodeGroup", nullptr, TestSetMarkNodeGroup, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestShadowAlpha", nullptr, TestShadowAlpha, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestShadowColor", nullptr, TestShadowColor, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestShadowElevation", nullptr, TestShadowElevation, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestShadowOffset", nullptr, TestShadowOffset, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestShadowRadius", nullptr, TestShadowRadius, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestSize", nullptr, TestSize, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestTransform", nullptr, TestTransform, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestTranslation", nullptr, TestTranslation, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestAddRenderNode001", nullptr, TestAddRenderNode001, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestAddRenderNode002", nullptr, TestAddRenderNode002, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestAddRenderNode003", nullptr, TestAddRenderNode003, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestRemoveRenderNode001", nullptr, TestRemoveRenderNode001, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestRemoveRenderNode002", nullptr, TestRemoveRenderNode002, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestClearRenderNodeChildren001", nullptr, TestClearRenderNodeChildren001, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestClearRenderNodeChildren002", nullptr, TestClearRenderNodeChildren002, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestInvalidate", nullptr, TestInvalidate, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"TestRenderNode001", nullptr, TestRenderNode001, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestRenderNode002", nullptr, TestRenderNode002, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestRenderNode003", nullptr, TestRenderNode003, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestRenderNode004", nullptr, TestRenderNode004, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestRenderNode005", nullptr, TestRenderNode005, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestRenderNode006", nullptr, TestRenderNode006, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestRenderNode007", nullptr, TestRenderNode007, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestRenderNode008", nullptr, TestRenderNode008, nullptr, nullptr, nullptr,
                napi_default, nullptr},
			{"RenderNodeUtils_001", nullptr, RenderNodeUtils_001, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_002", nullptr, RenderNodeUtils_002, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_003", nullptr, RenderNodeUtils_003, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_004", nullptr, RenderNodeUtils_004, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_005", nullptr, RenderNodeUtils_005, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_006", nullptr, RenderNodeUtils_006, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_007", nullptr, RenderNodeUtils_007, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_008", nullptr, RenderNodeUtils_008, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_009", nullptr, RenderNodeUtils_009, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_010", nullptr, RenderNodeUtils_010, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_011", nullptr, RenderNodeUtils_011, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_012", nullptr, RenderNodeUtils_012, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_013", nullptr, RenderNodeUtils_013, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_014", nullptr, RenderNodeUtils_014, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_015", nullptr, RenderNodeUtils_015, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"RenderNodeUtils_016", nullptr, RenderNodeUtils_016, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
        };
        if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok)
        {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
            return nullptr;
        }
        return exports;
    }
    EXTERN_C_END

    static napi_module nativefuncModule = {.nm_version = 1,
                                           .nm_flags = 0,
                                           .nm_filename = nullptr,
                                           .nm_register_func = Init,
                                           .nm_modname = "nativefunc",
                                           .nm_priv = ((void *)0),
                                           .reserved = {0}};

    extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativefuncModule); }
} // namespace ArkUICapiTest
