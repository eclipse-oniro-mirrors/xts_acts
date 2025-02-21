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

#ifndef IMAGE_SOURCE_TEST_H
#define IMAGE_SOURCE_TEST_H

#include <memory>
#include <string>
#include "napi/native_api.h"
#include "napi/native_node_api.h"
#include "image_source_module_test.h"

namespace OHOS {
namespace Media {
class ImageSourceTest {
public:
    static napi_value JsGetImageProperty(napi_env env, napi_callback_info info);
    static napi_value JsModifyImageProperty(napi_env env, napi_callback_info info);
    static std::string getStringFromArgs(napi_env env, napi_value arg);
private:
};
} // namespace Media
} // namespace OHOS
#endif // IMAGE_SOURCE_TEST_H