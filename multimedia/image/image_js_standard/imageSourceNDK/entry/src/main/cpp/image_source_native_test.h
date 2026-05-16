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

#ifndef IMAGE_SOURCE_NATIVE_TEST_H
#define IMAGE_SOURCE_NATIVE_TEST_H

#include <memory>
#include <string>
#include "napi/native_api.h"
#include "image_source_module_test.h"
#include "multimedia/image_framework/image/image_packer_native.h"
#include "multimedia/image_framework/image/image_source_native.h"

namespace OHOS {
namespace Media {
class ImageSourceTest {
public:
    static napi_value JsGetImageProperty(napi_env env, napi_callback_info info);
    static napi_value JsModifyImageProperty(napi_env env, napi_callback_info info);
    static napi_value setDecodingOptColorSpace(napi_env env, napi_callback_info info);
    static napi_value setDecodingOptColorSpaceErr(napi_env env, napi_callback_info info);
    static napi_value getDecodingOptColorSpace(napi_env env, napi_callback_info info);
    static napi_value getDecodingOptColorSpaceErr(napi_env env, napi_callback_info info);
    static napi_value getPixelMapForColorSpace(napi_env env, napi_callback_info info);
    static napi_value SetDesiredDynamicRangeToDecodingOptions(napi_env env, napi_callback_info info);
    static napi_value createImageSource(napi_env env, napi_callback_info info);
    static napi_value createDecodingOptions(napi_env env, napi_callback_info info);
    static napi_value createPixelmap(napi_env env, napi_callback_info info);
    static napi_value releaseImageSource(napi_env env, napi_callback_info info);
    static napi_value releaseDecodingOptions(napi_env env, napi_callback_info info);
    static napi_value releasePixelMap(napi_env env, napi_callback_info info);
    static std::string getStringFromArgs(napi_env env, napi_value arg);
    static napi_value ModifyMakerNoteImageProperty(napi_env env, napi_callback_info info);
    static napi_value GetMakerNoteImageProperty(napi_env env, napi_callback_info info);
    static napi_value testPackPixelMapToFile(napi_env env, napi_callback_info info);
    static napi_value SetMimeTypeToTestPackingOptions(napi_env env, napi_callback_info info);
    static napi_value SetQualityToTestPackingOptions(napi_env env, napi_callback_info info);
    static napi_value SetNeedsPackPropertiesToTestPackingOptions(napi_env env, napi_callback_info info);
    static napi_value CreatePackingOptions(napi_env env, napi_callback_info info);
    static napi_value TestGetImagePropertyShort(napi_env env, napi_callback_info info);
    static napi_value TestGetImagePropertyLong(napi_env env, napi_callback_info info);
    static napi_value TestGetImagePropertyDouble(napi_env env, napi_callback_info info);
    static napi_value TestGetImagePropertyArraySize(napi_env env, napi_callback_info info);
    static napi_value TestGetImagePropertyString(napi_env env, napi_callback_info info);
    static napi_value TestGetImagePropertyIntArray(napi_env env, napi_callback_info info);
    static napi_value TestGetImagePropertyDoubleArray(napi_env env, napi_callback_info info);
    static napi_value TestGetImagePropertyBlob(napi_env env, napi_callback_info info);
    static napi_value TestGetImagePropertyError(napi_env env, napi_callback_info info);
    static napi_value TestModifyImagePropertyShort(napi_env env, napi_callback_info info);
    static napi_value TestModifyImagePropertyLong(napi_env env, napi_callback_info info);
    static napi_value TestModifyImagePropertyDouble(napi_env env, napi_callback_info info);
    static napi_value TestModifyImagePropertyIntArray(napi_env env, napi_callback_info info);
    static napi_value TestModifyImagePropertyDoubleArray(napi_env env, napi_callback_info info);
    static napi_value TestModifyImagePropertyBlob(napi_env env, napi_callback_info info);
    static napi_value TestModifyImagePropertyError(napi_env env, napi_callback_info info);
private:
};
} // namespace Media
} // namespace OHOS
#endif // IMAGE_SOURCE_NATIVE_TEST_H