/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "imageEffect.h"
#include "effect_filter_test.h"

#define DESCRIPTOR(jsmethod, method)                                                                                   \
    { jsmethod, nullptr, method, nullptr, nullptr, nullptr, napi_default, nullptr }

napi_property_descriptor desc1[] = {
    DESCRIPTOR("savePixelMapForPath", savePixelMapForPath),
    DESCRIPTOR("creatOutPixeMapForPath", creatOutPixeMapForPath),
    DESCRIPTOR("OHEffectBufferInfoCreate", OHEffectBufferInfoCreate),
    DESCRIPTOR("OHEffectBufferInfoSetAddr", OHEffectBufferInfoSetAddr),
    DESCRIPTOR("OHEffectBufferInfoGetAddr", OHEffectBufferInfoGetAddr),
    DESCRIPTOR("OHEffectBufferInfoSetEffectFormat", OHEffectBufferInfoSetEffectFormat),
    DESCRIPTOR("OHEffectBufferInfoGetEffectFormat", OHEffectBufferInfoGetEffectFormat),
    DESCRIPTOR("OHEffectBufferInfoSetHeight", OHEffectBufferInfoSetHeight),
    DESCRIPTOR("OHEffectBufferInfoGetHeight", OHEffectBufferInfoGetHeight),
    DESCRIPTOR("OHEffectBufferInfoSetRowSize", OHEffectBufferInfoSetRowSize),
    DESCRIPTOR("OHEffectBufferInfoGetRowSize", OHEffectBufferInfoGetRowSize),
    DESCRIPTOR("OHEffectBufferInfoSetWidth", OHEffectBufferInfoSetWidth),
    DESCRIPTOR("OHEffectBufferInfoGetWidth", OHEffectBufferInfoGetWidth),
    DESCRIPTOR("OHEffectBufferInfoSetTimestamp", OHEffectBufferInfoSetTimestamp),
    DESCRIPTOR("OHEffectBufferInfoGetTimestamp", OHEffectBufferInfoGetTimestamp),
    DESCRIPTOR("OHEffectBufferInfoSetTextureId", OHEffectBufferInfoSetTextureId),
    DESCRIPTOR("OHEffectBufferInfoGetTextureId", OHEffectBufferInfoGetTextureId),
    DESCRIPTOR("OHEffectBufferInfoRelease", OHEffectBufferInfoRelease),
    DESCRIPTOR("OHEffectFilterInfoCreate", OHEffectFilterInfoCreate),
    DESCRIPTOR("OHEffectFilterInfoSetFilterName", OHEffectFilterInfoSetFilterName),
    DESCRIPTOR("OHEffectFilterInfoGetFilterName", OHEffectFilterInfoGetFilterName),
    DESCRIPTOR("OHEffectFilterInfoSetSupportedBufferTypes", OHEffectFilterInfoSetSupportedBufferTypes),
};

napi_property_descriptor desc2[] = {
    DESCRIPTOR("OHEffectFilterInfoGetSupportedBufferTypes", OHEffectFilterInfoGetSupportedBufferTypes),
    DESCRIPTOR("OHEffectFilterInfoSetSupportedFormats", OHEffectFilterInfoSetSupportedFormats),
    DESCRIPTOR("OHEffectFilterInfoGetSupportedFormats", OHEffectFilterInfoGetSupportedFormats),
    DESCRIPTOR("OHEffectFilterInfoRelease", OHEffectFilterInfoRelease),
    DESCRIPTOR("OHEffectFilterCreate", OHEffectFilterCreate),
    DESCRIPTOR("OHEffectFilterSetValue", OHEffectFilterSetValue),
    DESCRIPTOR("OHEffectFilterGetValue", OHEffectFilterGetValue),
    DESCRIPTOR("OHEffectFilterLookupFilterInfo", OHEffectFilterLookupFilterInfo),
    DESCRIPTOR("OHEffectFilterLookupFilters", OHEffectFilterLookupFilters),
    DESCRIPTOR("OHEffectFilterRegister", OHEffectFilterRegister),
    DESCRIPTOR("OHEffectFilterRelease", OHEffectFilterRelease),
    DESCRIPTOR("OHEffectFilterReleaseFilterNames", OHEffectFilterReleaseFilterNames),
    DESCRIPTOR("OHEffectFilterRender", OHEffectFilterRender),
    DESCRIPTOR("OHEffectFilterRenderWithTextureId", OHEffectFilterRenderWithTextureId),
    DESCRIPTOR("OHImageEffectCreate", OHImageEffectCreate),
    DESCRIPTOR("OHImageEffectConfigure", OHImageEffectConfigure),
    DESCRIPTOR("OHImageEffectAddFilter", OHImageEffectAddFilter),
    DESCRIPTOR("OHImageEffectAddFilterByFilter", OHImageEffectAddFilterByFilter),
};

napi_property_descriptor desc3[] = {
    DESCRIPTOR("OHImageEffectGetFilter", OHImageEffectGetFilter),
    DESCRIPTOR("OHImageEffectGetFilterCount", OHImageEffectGetFilterCount),
    DESCRIPTOR("OHImageEffectGetInputSurface", OHImageEffectGetInputSurface),
    DESCRIPTOR("OHImageEffectInsertFilter", OHImageEffectInsertFilter),
    DESCRIPTOR("OHImageEffectInsertFilterByFilter", OHImageEffectInsertFilterByFilter),
    DESCRIPTOR("OHImageEffectReplaceFilter", OHImageEffectReplaceFilter),
    DESCRIPTOR("OHImageEffectReplaceFilterByFilter", OHImageEffectReplaceFilterByFilter),
    DESCRIPTOR("OHImageEffectRelease", OHImageEffectRelease),
    DESCRIPTOR("OHImageEffectRemoveFilter", OHImageEffectRemoveFilter),
    DESCRIPTOR("OHImageEffectRemoveFilterByIndex", OHImageEffectRemoveFilterByIndex),
    DESCRIPTOR("OHImageEffectSave", OHImageEffectSave),
    DESCRIPTOR("OHImageEffectRestore", OHImageEffectRestore),
    DESCRIPTOR("OHImageEffectSetInputNativeBuffer", OHImageEffectSetInputNativeBuffer),
    DESCRIPTOR("OHImageEffectSetInputPixelmap", OHImageEffectSetInputPixelmap),
    DESCRIPTOR("OHImageEffectSetInputUri", OHImageEffectSetInputUri),
    DESCRIPTOR("OHImageEffectSetOutputNativeBuffer", OHImageEffectSetOutputNativeBuffer),
    DESCRIPTOR("OHImageEffectSetOutputPixelmap", OHImageEffectSetOutputPixelmap),
    DESCRIPTOR("OHImageEffectSetOutputSurface", OHImageEffectSetOutputSurface),
    DESCRIPTOR("OHImageEffectSetOutputUri", OHImageEffectSetOutputUri),
    DESCRIPTOR("OHImageEffectStart", OHImageEffectStart),
    DESCRIPTOR("OHImageEffectStop", OHImageEffectStop),
    DESCRIPTOR("OHImageEffectSetInputPicture", OHImageEffectSetInputPicture),
    DESCRIPTOR("OHImageEffectSetOutputPicture", OHImageEffectSetOutputPicture),
    DESCRIPTOR("OHImageEffectSetInputTexture", OHImageEffectSetInputTexture),
    DESCRIPTOR("OHImageEffectSetOutputTexture", OHImageEffectSetOutputTexture),
};

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    size_t mergedLength =
        sizeof(desc1) / sizeof(desc1[0]) + sizeof(desc2) / sizeof(desc2[0]) + sizeof(desc3) / sizeof(desc3[0]);
    napi_property_descriptor mergedArray[mergedLength];
    for (size_t i = 0; i < sizeof(desc1) / sizeof(desc1[0]); ++i) {
        mergedArray[i] = desc1[i];
    }
    for (size_t i = 0; i < sizeof(desc2) / sizeof(desc2[0]); ++i) {
        mergedArray[sizeof(desc1) / sizeof(desc1[0]) + i] = desc2[i];
    }
    for (size_t i = 0; i < sizeof(desc3) / sizeof(desc3[0]); ++i) {
        mergedArray[sizeof(desc1) / sizeof(desc1[0]) + sizeof(desc2) / sizeof(desc2[0]) + i] = desc3[i];
    }
    napi_define_properties(env, exports, mergedLength, mergedArray);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "imageEffect",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}