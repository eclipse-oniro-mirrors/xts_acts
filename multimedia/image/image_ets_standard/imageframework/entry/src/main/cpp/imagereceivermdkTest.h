/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#ifndef MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGERECEIVERMDK_TEST_H
#define MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGERECEIVERMDK_TEST_H
#include "node_api.h"

napi_value CreateImageReceiver(napi_env env, napi_callback_info info);
napi_value GetReceivingSurfaceId(napi_env env, napi_callback_info info);
napi_value ReadLatestImage(napi_env env, napi_callback_info info);
napi_value ReadNextImage(napi_env env, napi_callback_info info);
napi_value ReceiverOn(napi_env env, napi_callback_info info);
napi_value ReceiverGetSize(napi_env env, napi_callback_info info);
napi_value ReceiverGetCapacity(napi_env env, napi_callback_info info);
napi_value ReceiverGetFormat(napi_env env, napi_callback_info info);
napi_value ReceiverRelease(napi_env env, napi_callback_info info);
napi_value ImageSourceCreate(napi_env env, napi_callback_info info);
napi_value ImageSourceCreateFromUri(napi_env env, napi_callback_info info);
napi_value ImageSourceCreateFromFd(napi_env env, napi_callback_info info);
napi_value ImageSourceCreateFromData(napi_env env, napi_callback_info info);
napi_value ImageSourceCreateFromRawFile(napi_env env, napi_callback_info info);
napi_value ImageSourceCreateIncremental(napi_env env, napi_callback_info info);
napi_value ImageSourceCreateIncrementalFromData(napi_env env, napi_callback_info info);
napi_value ImageSourceGetSupportedFormats(napi_env env, napi_callback_info info);
napi_value ImageSourceCreatePixelMap(napi_env env, napi_callback_info info);
napi_value ImageSourceCreatePixelMapList(napi_env env, napi_callback_info info);
napi_value ImageSource_GetDelayTime(napi_env env, napi_callback_info info);
napi_value ImageSourceGetFrameCount(napi_env env, napi_callback_info info);
napi_value ImageSourceGetImageInfo(napi_env env, napi_callback_info info);
napi_value ImageSourceGetImageProperty(napi_env env, napi_callback_info info);
napi_value ImageSourceModifyImageProperty(napi_env env, napi_callback_info info);
napi_value ImageSourceUpdateData(napi_env env, napi_callback_info info);
napi_value ImageSourceRelease(napi_env env, napi_callback_info info);
napi_value CreateEmptyPixelmap(napi_env env, napi_callback_info info);

#endif // MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGERECEIVERMDK_TEST_H
