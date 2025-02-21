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

#ifndef OHIMAGEEFFECTNDK_IMAGEEFFECT_H
#define OHIMAGEEFFECTNDK_IMAGEEFFECT_H

#include "napi/native_api.h"

#ifdef __cplusplus
extern "C" {
#endif

napi_value savePixelMapForPath(napi_env env, napi_callback_info info);
napi_value creatOutPixeMapForPath(napi_env env, napi_callback_info info);
napi_value OHEffectFilterRender(napi_env env, napi_callback_info info);
napi_value OHImageEffectCreate(napi_env env, napi_callback_info info);
napi_value OHImageEffectConfigure(napi_env env, napi_callback_info info);
napi_value OHImageEffectAddFilter(napi_env env, napi_callback_info info);
napi_value OHImageEffectAddFilterByFilter(napi_env env, napi_callback_info info);
napi_value OHImageEffectGetFilter(napi_env env, napi_callback_info info);
napi_value OHImageEffectGetFilterCount(napi_env env, napi_callback_info info);
napi_value OHImageEffectGetInputSurface(napi_env env, napi_callback_info info);
napi_value OHImageEffectInsertFilter(napi_env env, napi_callback_info info);
napi_value OHImageEffectInsertFilterByFilter(napi_env env, napi_callback_info info);
napi_value OHImageEffectReplaceFilter(napi_env env, napi_callback_info info);
napi_value OHImageEffectReplaceFilterByFilter(napi_env env, napi_callback_info info);
napi_value OHImageEffectRelease(napi_env env, napi_callback_info info);
napi_value OHImageEffectRemoveFilter(napi_env env, napi_callback_info info);
napi_value OHImageEffectRemoveFilterByIndex(napi_env env, napi_callback_info info);
napi_value OHImageEffectSave(napi_env env, napi_callback_info info);
napi_value OHImageEffectRestore(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetInputNativeBuffer(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetInputPixelmap(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetInputUri(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetOutputNativeBuffer(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetOutputPixelmap(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetOutputSurface(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetOutputUri(napi_env env, napi_callback_info info);
napi_value OHImageEffectStart(napi_env env, napi_callback_info info);
napi_value OHImageEffectStop(napi_env env, napi_callback_info info);

#ifdef __cplusplus
}
#endif
#endif // OHIMAGEEFFECTNDK_IMAGEEFFECT_H
