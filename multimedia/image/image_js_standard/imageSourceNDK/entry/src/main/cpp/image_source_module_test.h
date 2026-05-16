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

#ifndef IMAGE_SOURCE_MODULE_TEST_H
#define IMAGE_SOURCE_MODULE_TEST_H

#include <memory>
#include <string>
#include <vector>
#include "napi/native_api.h"
#include "multimedia/image_framework/image/image_source_native.h"
#include "multimedia/image_framework/image/image_common.h"

#define IMAGE_LOG_TAG "ImageSourceModuleTest"
#define IMAGE_LOG_DOMAIN 0x3200

#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)


class ImageSourceModuleTest {
public:
    ImageSourceModuleTest();
    ~ImageSourceModuleTest();

    Image_ErrorCode GetImageProperty(int32_t fd, std::string propertykey, std::string *value);
    Image_ErrorCode ModifyImageProperty(int32_t fd, std::string propertyKey,
                                        std::string propertyValue, std::string *value);

private:
};
#endif // IMAGE_SOURCE_MODULE_TEST_H