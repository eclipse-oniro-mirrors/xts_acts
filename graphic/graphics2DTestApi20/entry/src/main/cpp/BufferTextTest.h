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

#ifndef BUFFER_TEXT_TEST_H
#define BUFFER_TEXT_TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addBufferTextTest(std::vector<napi_property_descriptor> &descData);
napi_value OH_NativeBuffer_GetColorSpaceSuccess(napi_env env, napi_callback_info info);
napi_value OH_NativeBuffer_GetColorSpaceFail(napi_env env, napi_callback_info info);
napi_value OH_NativeBuffer_SetMetadataValueSuccess(napi_env env, napi_callback_info info);
napi_value OH_NativeBuffer_SetMetadataValueFail(napi_env env, napi_callback_info info);
napi_value OH_NativeBuffer_GetMetadataValueSuccess(napi_env env, napi_callback_info info);
napi_value OH_NativeBuffer_GetMetadataValueFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RunBufferGlyphsSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RunBufferPosSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RunBufferUtf8textSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RunBufferClustersSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_SystemFontTypeSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_TextUndefinedGlyphDisplayDEFAULT(napi_env env, napi_callback_info info);
napi_value OH_Drawing_TextUndefinedGlyphDisplayTOFU(napi_env env, napi_callback_info info);
napi_value BufferHandleSuccess(napi_env env, napi_callback_info info);
napi_value BufferHandleWidth(napi_env env, napi_callback_info info);
napi_value BufferHandleStride(napi_env env, napi_callback_info info);
napi_value BufferHandleHeight(napi_env env, napi_callback_info info);
napi_value BufferHandleFormat(napi_env env, napi_callback_info info);
napi_value BufferHandleUsage(napi_env env, napi_callback_info info);
napi_value BufferHandleKey(napi_env env, napi_callback_info info);
napi_value BufferHandlePhyAddr(napi_env env, napi_callback_info info);
napi_value BufferHandleReserveFds(napi_env env, napi_callback_info info);
napi_value BufferHandleReserveInts(napi_env env, napi_callback_info info);
napi_value BufferHandleReserve(napi_env env, napi_callback_info info);
napi_value OH_NativeBuffer_PlanesSuccess(napi_env env, napi_callback_info info);
napi_value OH_NativeBuffer_PlaneCount(napi_env env, napi_callback_info info);
napi_value OH_NativeBuffer_PlaneOffset(napi_env env, napi_callback_info info);
napi_value OH_NativeBuffer_PlaneColumnStride(napi_env env, napi_callback_info info);
napi_value OH_NativeBuffer_PlaneRowStride(napi_env env, napi_callback_info info);
napi_value OH_NativeBuffer_PlanesSuccess2(napi_env env, napi_callback_info info);
#endif //BUFFER_TEXT_TEST_H
