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

#include <hilog/log.h>
#include "image_source_module_test.h"
#include <cstring>

ImageSourceModuleTest::ImageSourceModuleTest()
{
}

ImageSourceModuleTest::~ImageSourceModuleTest()
{
}

Image_ErrorCode ImageSourceModuleTest::GetImageProperty(int32_t fd, std::string propertykey, std::string *val)
{
    OH_ImageSourceNative *source;
    Image_ErrorCode ret = OH_ImageSourceNative_CreateFromFd(fd, &source);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageSourceNative_Release(source);
        LOG("OH_ImageSourceNative_CreateFromFd failed: err = %{public}d.", ret);
        return ret;
    }

    Image_String value;
    Image_String key;
    key.size = propertykey.size();
    key.data = static_cast<char *>(malloc(key.size));
    memcpy(key.data, propertykey.c_str(), propertykey.size());

    ret = OH_ImageSourceNative_GetImageProperty(source, &key, &value);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageSourceNative_Release(source);
        LOG("OH_ImageSourceNative_GetImageProperty failed: err = %{public}d.", ret);
        return ret;
    }
    *val = std::string(value.data, value.size);
    free(value.data);
    free(key.data);
    OH_ImageSourceNative_Release(source);
    return ret;
}

Image_ErrorCode ImageSourceModuleTest::ModifyImageProperty(int32_t fd, std::string propertyKey,
                                                           std::string propertyValue, std::string *val)
{
    OH_ImageSourceNative *source;
    Image_ErrorCode ret = OH_ImageSourceNative_CreateFromFd(fd, &source);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageSourceNative_Release(source);
        LOG("OH_ImageSourceNative_CreateFromFd failed: err = %{public}d.", ret);
        return ret;
    }

    Image_String value;
    Image_String key;
    key.size = propertyKey.size();
    key.data = static_cast<char *>(malloc(key.size));
    memcpy(key.data, propertyKey.c_str(), propertyKey.size());
    value.size = propertyValue.size();
    value.data = static_cast<char *>(malloc(value.size));
    memcpy(value.data, propertyValue.c_str(), propertyValue.size());

    ret = OH_ImageSourceNative_ModifyImageProperty(source, &key, &value);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageSourceNative_Release(source);
        LOG("OH_ImageSourceNative_ModifyImageProperty failed: err = %{public}d.", ret);
        return ret;
    }
    *val = std::string(value.data, value.size);
    free(value.data);
    free(key.data);
    OH_ImageSourceNative_Release(source);
    return ret;
}