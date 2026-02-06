/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#ifndef HIAPPEVENT_IMAGEPIXELMAPMDKTEST_H
#define HIAPPEVENT_IMAGEPIXELMAPMDKTEST_H
#include "node_api.h"
#define MAX_STRING_SIZE 128
#define NUM_0 0

napi_value ImagePackerCreate1(napi_env env, napi_callback_info info);
napi_value ImagePackerRelease(napi_env env, napi_callback_info info);
napi_value PictureMetadataCreate1(napi_env env, napi_callback_info info);
napi_value PictureMetadataCreate2(napi_env env, napi_callback_info info);
napi_value PictureMetadataGetProperty1(napi_env env, napi_callback_info info);
napi_value PictureMetadataSetProperty1(napi_env env, napi_callback_info info);
napi_value PictureMetadataRelease1(napi_env env, napi_callback_info info);
napi_value PictureMetadataRelease2(napi_env env, napi_callback_info info);
napi_value PictureMetadataClone1(napi_env env, napi_callback_info info);
napi_value CreatePixelMapWithStride(napi_env env, napi_callback_info info);
napi_value CreateAlphaPixelMap(napi_env env, napi_callback_info info);
napi_value GetBytesNumberPerRow(napi_env env, napi_callback_info info);
napi_value GetIsEditable(napi_env env, napi_callback_info info);
napi_value IsSupportAlpha(napi_env env, napi_callback_info info);
napi_value SetAlphaAble(napi_env env, napi_callback_info info);
napi_value GetDensity(napi_env env, napi_callback_info info);
napi_value SetDensity(napi_env env, napi_callback_info info);
napi_value SetOpacity(napi_env env, napi_callback_info info);
napi_value PixelMapScale(napi_env env, napi_callback_info info);
napi_value ScaleWithAntiAliasing(napi_env env, napi_callback_info info);
napi_value PixelMapTranslate(napi_env env, napi_callback_info info);
napi_value PixelMapRotate(napi_env env, napi_callback_info info);
napi_value PixelMapFlip(napi_env env, napi_callback_info info);
napi_value PixelMapCrop(napi_env env, napi_callback_info info);
napi_value PixelMapGetImageInfo(napi_env env, napi_callback_info info);
napi_value PixelMapAccessPixels(napi_env env, napi_callback_info info);
napi_value PixelMapUnAccessPixels(napi_env env, napi_callback_info info);
napi_value UnAccessPixels(napi_env env, napi_callback_info info);
napi_value GetImageInfoParameter(napi_env env, napi_callback_info info);


#endif // HIAPPEVENT_IMAGEPIXELMAPMDKTEST_H
