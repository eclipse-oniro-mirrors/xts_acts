/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#ifndef IMAGE_RECEIVER_MDK_TEST_H
#define IMAGE_RECEIVER_MDK_TEST_H

#include <memory>
#include <string>

#include "napi/native_api.h"
#include "multimedia/image_framework/image_receiver_mdk.h"

namespace OHOS {
namespace Media {
class ImageReceiverNDKTest {
public:
    static napi_value Init(napi_env env, napi_value exports);
    static napi_value JsCreateImageReceiver(napi_env env, napi_callback_info info);
    static napi_value JsGetReceivingSurfaceId(napi_env env, napi_callback_info info);
    static napi_value JsReadLatestImage(napi_env env, napi_callback_info info);
    static napi_value JsReadNextImage(napi_env env, napi_callback_info info);
    static napi_value JsOn(napi_env env, napi_callback_info info);
    static napi_value JsGetSize(napi_env env, napi_callback_info info);
    static napi_value JsGetCapacity(napi_env env, napi_callback_info info);
    static napi_value JsGetFormat(napi_env env, napi_callback_info info);
    static napi_value JsGetOnEventCount(napi_env env, napi_callback_info info);

    static napi_value JsImageClipRect(napi_env env, napi_callback_info info);
    static napi_value JsImageSize(napi_env env, napi_callback_info info);
    static napi_value JsImageFormat(napi_env env, napi_callback_info info);
    static napi_value JsImageGetComponent(napi_env env, napi_callback_info info);
    static napi_value JsReceiverRelease(napi_env env, napi_callback_info info);
    static napi_value JsImageRelease(napi_env env, napi_callback_info info);
    
private:
    static uint32_t sOnEvnentCount;
    static void OnEvent();
};
} // namespace Media
} // namespace OHOS
#endif // IMAGE_RECEIVER_MDK_TEST_H