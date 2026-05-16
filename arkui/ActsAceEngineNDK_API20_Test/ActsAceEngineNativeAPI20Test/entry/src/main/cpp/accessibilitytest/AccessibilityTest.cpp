/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "common/Common.h"
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <accessibilitytest/AccessibilityTest.h>
#include <vector>

EXTERN_C_START

static void InitPush1(std::vector<napi_property_descriptor>& desc)
{
        desc.push_back(XL("RegisterCallback0100", AccessibilityTools::RegisterCallback0100));
        desc.push_back(XL("RegisterCallback0200", AccessibilityTools::RegisterCallback0200));
        desc.push_back(XL("RegisterCallback0300", AccessibilityTools::RegisterCallback0300));
        desc.push_back(XL("RegisterCallbackWithInstance0100", AccessibilityTools::RegisterCallbackWithInstance0100));
        desc.push_back(XL("RegisterCallbackWithInstance0200", AccessibilityTools::RegisterCallbackWithInstance0200));
        desc.push_back(XL("RegisterCallbackWithInstance0300", AccessibilityTools::RegisterCallbackWithInstance0300));
        desc.push_back(XL("SetElementId0100", AccessibilityTools::SetElementId0100));
        desc.push_back(XL("SetElementId0200", AccessibilityTools::SetElementId0200));
        desc.push_back(XL("SetParentId0100", AccessibilityTools::SetParentId0100));
        desc.push_back(XL("SetParentId0200", AccessibilityTools::SetParentId0200));
        desc.push_back(XL("SetComponentType0100", AccessibilityTools::SetComponentType0100));
        desc.push_back(XL("SetComponentType0200", AccessibilityTools::SetComponentType0200));
        desc.push_back(XL("SetComponentType0300", AccessibilityTools::SetComponentType0300));
        desc.push_back(XL("SetContents0100", AccessibilityTools::SetContents0100));
        desc.push_back(XL("SetContents0200", AccessibilityTools::SetContents0200));
        desc.push_back(XL("SetContents0300", AccessibilityTools::SetContents0300));
        desc.push_back(XL("SetHintText0100", AccessibilityTools::SetHintText0100));
        desc.push_back(XL("SetHintText0200", AccessibilityTools::SetHintText0200));
        desc.push_back(XL("SetHintText0300", AccessibilityTools::SetHintText0300));
        desc.push_back(XL("SetAccessibilityText0100", AccessibilityTools::SetAccessibilityText0100));
        desc.push_back(XL("SetAccessibilityText0200", AccessibilityTools::SetAccessibilityText0200));
        desc.push_back(XL("SetAccessibilityText0300", AccessibilityTools::SetAccessibilityText0300));
        desc.push_back(XL("SetAccessibilityDescription0100", AccessibilityTools::SetAccessibilityDescription0100));
        desc.push_back(XL("SetAccessibilityDescription0200", AccessibilityTools::SetAccessibilityDescription0200));
        desc.push_back(XL("SetAccessibilityDescription0300", AccessibilityTools::SetAccessibilityDescription0300));
        desc.push_back(XL("SetChildNodeIds0100", AccessibilityTools::SetChildNodeIds0100));
        desc.push_back(XL("SetChildNodeIds0200", AccessibilityTools::SetChildNodeIds0200));
        desc.push_back(XL("SetChildNodeIds0300", AccessibilityTools::SetChildNodeIds0300));
        desc.push_back(XL("SetChildNodeIds0400", AccessibilityTools::SetChildNodeIds0400));
        desc.push_back(XL("SetOperationActions0100", AccessibilityTools::SetOperationActions0100));
        desc.push_back(XL("SetOperationActions0200", AccessibilityTools::SetOperationActions0200));
        desc.push_back(XL("SetOperationActions0300", AccessibilityTools::SetOperationActions0300));
        desc.push_back(XL("SetOperationActions0400", AccessibilityTools::SetOperationActions0400));
        desc.push_back(XL("SetScreenRect0100", AccessibilityTools::SetScreenRect0100));
        desc.push_back(XL("SetScreenRect0200", AccessibilityTools::SetScreenRect0200));
        desc.push_back(XL("SetScreenRect0300", AccessibilityTools::SetScreenRect0300));
        desc.push_back(XL("SetCheckable0100", AccessibilityTools::SetCheckable0100));
        desc.push_back(XL("SetCheckable0200", AccessibilityTools::SetCheckable0200));
        desc.push_back(XL("SetChecked0100", AccessibilityTools::SetChecked0100));
        desc.push_back(XL("SetChecked0200", AccessibilityTools::SetChecked0200));
        desc.push_back(XL("SetFocusable0100", AccessibilityTools::SetFocusable0100));
        desc.push_back(XL("SetFocusable0200", AccessibilityTools::SetFocusable0200));
}

static void InitPush2(std::vector<napi_property_descriptor>& desc)
{
        desc.push_back(XL("SetFocused0100", AccessibilityTools::SetFocused0100));
        desc.push_back(XL("SetFocused0200", AccessibilityTools::SetFocused0200));
        desc.push_back(XL("SetVisible0100", AccessibilityTools::SetVisible0100));
        desc.push_back(XL("SetVisible0200", AccessibilityTools::SetVisible0200));
        desc.push_back(XL("SetAccessibilityFocused0100", AccessibilityTools::SetAccessibilityFocused0100));
        desc.push_back(XL("SetAccessibilityFocused0200", AccessibilityTools::SetAccessibilityFocused0200));
        desc.push_back(XL("SetSelected0100", AccessibilityTools::SetSelected0100));
        desc.push_back(XL("SetSelected0200", AccessibilityTools::SetSelected0200));
        desc.push_back(XL("SetClickable0100", AccessibilityTools::SetClickable0100));
        desc.push_back(XL("SetClickable0200", AccessibilityTools::SetClickable0200));
        desc.push_back(XL("SetLongClickable0100", AccessibilityTools::SetLongClickable0100));
        desc.push_back(XL("SetLongClickable0200", AccessibilityTools::SetLongClickable0200));
        desc.push_back(XL("SetEnabled0100", AccessibilityTools::SetEnabled0100));
        desc.push_back(XL("SetEnabled0200", AccessibilityTools::SetEnabled0200));
        desc.push_back(XL("SetIsPassword0100", AccessibilityTools::SetIsPassword0100));
        desc.push_back(XL("SetIsPassword0200", AccessibilityTools::SetIsPassword0200));
        desc.push_back(XL("SetScrollable0100", AccessibilityTools::SetScrollable0100));
        desc.push_back(XL("SetScrollable0200", AccessibilityTools::SetScrollable0200));
        desc.push_back(XL("SetEditable0100", AccessibilityTools::SetEditable0100));
        desc.push_back(XL("SetEditable0200", AccessibilityTools::SetEditable0200));
        desc.push_back(XL("SetIsHint0100", AccessibilityTools::SetIsHint0100));
        desc.push_back(XL("SetIsHint0200", AccessibilityTools::SetIsHint0200));
        desc.push_back(XL("SetRangeInfo0100", AccessibilityTools::SetRangeInfo0100));
        desc.push_back(XL("SetRangeInfo0200", AccessibilityTools::SetRangeInfo0200));
        desc.push_back(XL("SetRangeInfo0300", AccessibilityTools::SetRangeInfo0300));
        desc.push_back(XL("SetGridInfo0100", AccessibilityTools::SetGridInfo0100));
        desc.push_back(XL("SetGridInfo0200", AccessibilityTools::SetGridInfo0200));
        desc.push_back(XL("SetGridInfo0300", AccessibilityTools::SetGridInfo0300));
        desc.push_back(XL("SetGridItemInfo0100", AccessibilityTools::SetGridItemInfo0100));
        desc.push_back(XL("SetGridItemInfo0200", AccessibilityTools::SetGridItemInfo0200));
        desc.push_back(XL("SetGridItemInfo0300", AccessibilityTools::SetGridItemInfo0300));
        desc.push_back(XL("SetSelectedTextStart0100", AccessibilityTools::SetSelectedTextStart0100));
        desc.push_back(XL("SetSelectedTextStart0200", AccessibilityTools::SetSelectedTextStart0200));
        desc.push_back(XL("SetSelectedTextEnd0100", AccessibilityTools::SetSelectedTextEnd0100));
        desc.push_back(XL("SetSelectedTextEnd0200", AccessibilityTools::SetSelectedTextEnd0200));
        desc.push_back(XL("SetCurrentItemIndex0100", AccessibilityTools::SetCurrentItemIndex0100));
        desc.push_back(XL("SetCurrentItemIndex0200", AccessibilityTools::SetCurrentItemIndex0200));
}

static void InitPush3(std::vector<napi_property_descriptor>& desc)
{
        desc.push_back(XL("SetStartItemIndex0100", AccessibilityTools::SetStartItemIndex0100));
        desc.push_back(XL("SetStartItemIndex0200", AccessibilityTools::SetStartItemIndex0200));
        desc.push_back(XL("SetEndItemIndex0100", AccessibilityTools::SetEndItemIndex0100));
        desc.push_back(XL("SetEndItemIndex0200", AccessibilityTools::SetEndItemIndex0200));
        desc.push_back(XL("SetItemCount0100", AccessibilityTools::SetItemCount0100));
        desc.push_back(XL("SetItemCount0200", AccessibilityTools::SetItemCount0200));
        desc.push_back(XL("SetAccessibilityOffset0100", AccessibilityTools::SetAccessibilityOffset0100));
        desc.push_back(XL("SetAccessibilityOffset0200", AccessibilityTools::SetAccessibilityOffset0200));
        desc.push_back(XL("SetAccessibilityGroup0100", AccessibilityTools::SetAccessibilityGroup0100));
        desc.push_back(XL("SetAccessibilityGroup0200", AccessibilityTools::SetAccessibilityGroup0200));
        desc.push_back(XL("SetAccessibilityLevel0100", AccessibilityTools::SetAccessibilityLevel0100));
        desc.push_back(XL("SetAccessibilityLevel0200", AccessibilityTools::SetAccessibilityLevel0200));
        desc.push_back(XL("SetAccessibilityLevel0300", AccessibilityTools::SetAccessibilityLevel0300));
        desc.push_back(XL("SetZIndex0100", AccessibilityTools::SetZIndex0100));
        desc.push_back(XL("SetZIndex0200", AccessibilityTools::SetZIndex0200));
        desc.push_back(XL("SetAccessibilityOpacity0100", AccessibilityTools::SetAccessibilityOpacity0100));
        desc.push_back(XL("SetAccessibilityOpacity0200", AccessibilityTools::SetAccessibilityOpacity0200));
        desc.push_back(XL("SetAccessibilityOpacity0300", AccessibilityTools::SetAccessibilityOpacity0300));
        desc.push_back(XL("SetBackgroundColor0100", AccessibilityTools::SetBackgroundColor0100));
        desc.push_back(XL("SetBackgroundColor0200", AccessibilityTools::SetBackgroundColor0200));
        desc.push_back(XL("SetBackgroundColor0300", AccessibilityTools::SetBackgroundColor0300));
        desc.push_back(XL("SetBackgroundImage0100", AccessibilityTools::SetBackgroundImage0100));
        desc.push_back(XL("SetBackgroundImage0200", AccessibilityTools::SetBackgroundImage0200));
        desc.push_back(XL("SetBackgroundImage0300", AccessibilityTools::SetBackgroundImage0300));
        desc.push_back(XL("SetBlur0100", AccessibilityTools::SetBlur0100));
        desc.push_back(XL("SetBlur0200", AccessibilityTools::SetBlur0200));
        desc.push_back(XL("SetBlur0300", AccessibilityTools::SetBlur0300));
        desc.push_back(XL("SetHitTestBehavior0100", AccessibilityTools::SetHitTestBehavior0100));
        desc.push_back(XL("SetHitTestBehavior0200", AccessibilityTools::SetHitTestBehavior0200));
        desc.push_back(XL("SetHitTestBehavior0300", AccessibilityTools::SetHitTestBehavior0300));
        desc.push_back(XL("SetEventType0100", AccessibilityTools::SetEventType0100));
        desc.push_back(XL("SetEventType0200", AccessibilityTools::SetEventType0200));
        desc.push_back(XL("SetTextAnnouncedForAccessibility0100",
                          AccessibilityTools::SetTextAnnouncedForAccessibility0100));
        desc.push_back(XL("SetTextAnnouncedForAccessibility0200",
                          AccessibilityTools::SetTextAnnouncedForAccessibility0200));
        desc.push_back(XL("SetRequestFocusId0100", AccessibilityTools::SetRequestFocusId0100));
        desc.push_back(XL("SetRequestFocusId0200", AccessibilityTools::SetRequestFocusId0200));
        desc.push_back(XL("SetElementInfo0100", AccessibilityTools::SetElementInfo0100));
        desc.push_back(XL("SetElementInfo0200", AccessibilityTools::SetElementInfo0200));
        desc.push_back(XL("SetElementInfo0300", AccessibilityTools::SetElementInfo0300));
        desc.push_back(XL("ActionArgumentByKey0100", AccessibilityTools::ActionArgumentByKey0100));
        desc.push_back(XL("ActionArgumentByKey0200", AccessibilityTools::ActionArgumentByKey0200));
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "animatendk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
