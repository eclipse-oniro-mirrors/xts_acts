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

#ifndef IMAGE_RECEIVER_TEST_H
#define IMAGE_RECEIVER_TEST_H

#include <memory>
#include <string>
#include "napi/native_api.h"

namespace OHOS {
namespace Media {

class ImageReceiverTest {
public:
    static napi_value JsCreateImageReceiverOptions(napi_env env, napi_callback_info info);
    static napi_value JsImageReceiverOptionsGetSize(napi_env env, napi_callback_info info);
    static napi_value JsImageReceiverOptionsSetSize(napi_env env, napi_callback_info info);
    static napi_value JsImageReceiverOptionsGetCapacity(napi_env env, napi_callback_info info);
    static napi_value JsImageReceiverOptionsSetCapacity(napi_env env, napi_callback_info info);
    static napi_value JsReleaseImageReceiverOptions(napi_env env, napi_callback_info info);

public:
    static napi_value JsCreateImageReceiver(napi_env env, napi_callback_info info);
    static napi_value JsGetReceivingSurfaceId(napi_env env, napi_callback_info info);
    static napi_value JsReadLatestImage(napi_env env, napi_callback_info info);
    static napi_value JsReadNextImage(napi_env env, napi_callback_info info);
    static napi_value JsOn(napi_env env, napi_callback_info info);
    static napi_value JsOff(napi_env env, napi_callback_info info);
    static napi_value JsGetSize(napi_env env, napi_callback_info info);
    static napi_value JsGetCapacity(napi_env env, napi_callback_info info);
    static napi_value JsReleaseImageReceiver(napi_env env, napi_callback_info info);

public:
    static napi_value JsGetImageSize(napi_env env, napi_callback_info info);
    static napi_value JsGetImageComponentTypes(napi_env env, napi_callback_info info);
    static napi_value JsGetImageByteBuffer(napi_env env, napi_callback_info info);
    static napi_value JsGetImageBufferSize(napi_env env, napi_callback_info info);
    static napi_value JsGetImageRowStride(napi_env env, napi_callback_info info);
    static napi_value JsGetImagePixelStride(napi_env env, napi_callback_info info);
    static napi_value JsReleaseImage(napi_env env, napi_callback_info info);
};

} // namespace Media
} // namespace OHOS

#endif // IMAGE_RECEIVER_TEST_H