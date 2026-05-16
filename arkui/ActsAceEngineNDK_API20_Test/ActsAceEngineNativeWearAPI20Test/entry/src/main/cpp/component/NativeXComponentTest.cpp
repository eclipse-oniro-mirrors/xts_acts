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

#include "dialog/DialogXComponent.h"
#include "dragdrog/XComponentDragAndDrog.h"

namespace NativeXComponentTest {
EXTERN_C_START

static void InitPushDragAndDrog(napi_property_descriptor* desc)
{
    napi_property_descriptor descTemp[] = {
        XL("CreateDragAndDrogNativeNode", XComponentDragAndDrog::CreateDragAndDrogNativeNode),
        XL("GetDragResult", XComponentDragAndDrog::GetDragResult),
        XL("GetDropOperationResult", XComponentDragAndDrog::GetDropOperationResult),
        XL("GetOnPreDragResult", XComponentDragAndDrog::GetOnPreDragResult),
        XL("DragPreviewOptionSetScaleMode", XComponentDragAndDrog::DragPreviewOptionSetScaleMode),
        XL("DragAndDropInfoGetDragStatusUnknown", XComponentDragAndDrog::DragAndDropInfoGetDragStatusUnknown),
        XL("DragEventDisableDefaultDropAnimationOk", XComponentDragAndDrog::DragEventDisableDefaultDropAnimationOk),
        XL("DragEventDisableDefaultDropAnimationParamInvalid",
           XComponentDragAndDrog::DragEventDisableDefaultDropAnimationParamInvalid),
        XL("DragEventSetSuggestedDropOperationOk", XComponentDragAndDrog::DragEventSetSuggestedDropOperationOk),
        XL("DragEventSetSuggestedDropOperationParamInvalid",
           XComponentDragAndDrog::DragEventSetSuggestedDropOperationParamInvalid),
        XL("DragEventSetDragResultOk", XComponentDragAndDrog::DragEventSetDragResultOk),
        XL("DragEventSetDragResultParamInvalid", XComponentDragAndDrog::DragEventSetDragResultParamInvalid),
        XL("DragEventSetDataOk", XComponentDragAndDrog::DragEventSetDataOk),
        XL("DragEventSetDataParamInvalid", XComponentDragAndDrog::DragEventSetDataParamInvalid),
        XL("DragEventSetDataLoadParamsOk", XComponentDragAndDrog::DragEventSetDataLoadParamsOk),
        XL("DragEventSetDataLoadParamsParamInvalid", XComponentDragAndDrog::DragEventSetDataLoadParamsParamInvalid),
        XL("DragEventGetUdmfDataOk", XComponentDragAndDrog::DragEventGetUdmfDataOk),
        XL("DragEventGetUdmfDataParamInvalid", XComponentDragAndDrog::DragEventGetUdmfDataParamInvalid),
        XL("DragEventGetDataTypeCountOk", XComponentDragAndDrog::DragEventGetDataTypeCountOk),
        XL("DragEventGetDataTypeCountParamInvalid", XComponentDragAndDrog::DragEventGetDataTypeCountParamInvalid),
        XL("DragEventGetDataTypesOk", XComponentDragAndDrog::DragEventGetDataTypesOk),
        XL("DragEventGetDataTypesParamInvalid", XComponentDragAndDrog::DragEventGetDataTypesParamInvalid),
        XL("DragEventGetDataTypesBufferSizeError", XComponentDragAndDrog::DragEventGetDataTypesBufferSizeError),
        XL("DragEventGetDragResultOk", XComponentDragAndDrog::DragEventGetDragResultOk),
        XL("DragEventGetDragResultParamInvalid", XComponentDragAndDrog::DragEventGetDragResultParamInvalid),
        XL("DragEventGetDropOperationOk", XComponentDragAndDrog::DragEventGetDropOperationOk),
        XL("DragEventGetDropOperationParamInvalid", XComponentDragAndDrog::DragEventGetDropOperationParamInvalid),
        XL("GetDragTouchPointDisplayX", XComponentDragAndDrog::GetDragTouchPointDisplayX),
        XL("GetDragTouchPointDisplayY", XComponentDragAndDrog::GetDragTouchPointDisplayY),
        XL("DragEventGetModifierKeyStatesOk", XComponentDragAndDrog::DragEventGetModifierKeyStatesOk),
        XL("DragEventGetModifierKeyStatesParamInvalid",
           XComponentDragAndDrog::DragEventGetModifierKeyStatesParamInvalid),
        XL("DragEventGetDisplayIdOk", XComponentDragAndDrog::DragEventGetDisplayIdOk),
        XL("DragEventGetDisplayIdParamInvalid", XComponentDragAndDrog::DragEventGetDisplayIdParamInvalid),
        XL("DragEventStartDataLoadingOk", XComponentDragAndDrog::DragEventStartDataLoadingOk),
        XL("DragEventStartDataLoadingParamInvalid", XComponentDragAndDrog::DragEventStartDataLoadingParamInvalid),
        XL("DragEventCancelDataLoadingOk", XComponentDragAndDrog::DragEventCancelDataLoadingOk),
        XL("DragEventCancelDataLoadingParamInvalid", XComponentDragAndDrog::DragEventCancelDataLoadingParamInvalid),
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index] = descTemp[index];
    }
}

static void InitPushDragAndDrog2(napi_property_descriptor* desc)
{
    int offset = 37;
    napi_property_descriptor descTemp[] = {
        XL("DisableDropDataPrefetchOnNodeOk", XComponentDragAndDrog::DisableDropDataPrefetchOnNodeOk),
        XL("DisableDropDataPrefetchOnNodeParamInvalid",
           XComponentDragAndDrog::DisableDropDataPrefetchOnNodeParamInvalid),
        XL("DragActionSetDataLoadParamsOk", XComponentDragAndDrog::DragActionSetDataLoadParamsOk),
        XL("DragActionSetDataLoadParamsParamInvalid", XComponentDragAndDrog::DragActionSetDataLoadParamsParamInvalid),
        XL("DragEventGetDragSourceOk", XComponentDragAndDrog::DragEventGetDragSourceOk),
        XL("DragEventGetDragSourceParamInvalid", XComponentDragAndDrog::DragEventGetDragSourceParamInvalid),
        XL("DragEventIsRemoteOk", XComponentDragAndDrog::DragEventIsRemoteOk),
        XL("DragEventIsRemoteParamInvalid", XComponentDragAndDrog::DragEventIsRemoteParamInvalid),
        XL("EnableDropDisallowedBadgeOk", XComponentDragAndDrog::EnableDropDisallowedBadgeOk),
        XL("EnableDropDisallowedBadgeParamInvalid", XComponentDragAndDrog::EnableDropDisallowedBadgeParamInvalid),
        XL("DragAndDropInfoGetDragStatusStarted", XComponentDragAndDrog::DragAndDropInfoGetDragStatusStarted),
        XL("DragAndDropInfoGetDragStatusEnded", XComponentDragAndDrog::DragAndDropInfoGetDragStatusEnded),
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void InitPushDialog(napi_property_descriptor* desc)
{
    int offset = 49;
    napi_property_descriptor descTemp[] = {
        XL("ShowDialog", DialogXComponent::ShowDialog),
        XL("CloseDialog", DialogXComponent::CloseDialog),
        XL("CustomDialogGetStateParamInvalid", DialogXComponent::CustomDialogGetStateParamInvalid),
        XL("CustomDialogGetStateOk", DialogXComponent::CustomDialogGetStateOk),
        XL("CustomDialogGetState", DialogXComponent::CustomDialogGetState),
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}


static napi_value Init(napi_env env, napi_value exports)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }
    napi_property_descriptor desc[54] = {};
    InitPushDragAndDrog(desc);
    InitPushDragAndDrog2(desc);
    InitPushDialog(desc);
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }
    return exports;
}
EXTERN_C_END

static napi_module nativexcomponentModule = { .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativexcomponent",
    .nm_priv = ((void*)0),
    .reserved = { 0 } };

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&nativexcomponentModule);
}
} // namespace NativeXComponentTest
