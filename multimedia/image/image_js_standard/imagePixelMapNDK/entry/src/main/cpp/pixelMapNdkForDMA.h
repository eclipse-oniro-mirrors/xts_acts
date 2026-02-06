/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#ifndef CREATEPIXELMAP_IMAGE_SOURCE_NATIVE_H
#define CREATEPIXELMAP_IMAGE_SOURCE_NATIVE_H

#include <multimedia/image_framework/image/image_native.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include "multimedia/image_framework/image/pixelmap_native.h"
#include "multimedia/image_framework/image/image_source_native.h"
#include "multimedia/image_framework/image/image_common.h"
#include "multimedia/image_framework/image/image_native.h"
#include "multimedia/image_framework/image/image_packer_native.h"

class ImageSourceNative {
public:
    Image_ErrorCode errorCode = IMAGE_SUCCESS;
    OH_ImageSourceNative *source = nullptr;
    OH_DecodingOptions *options = nullptr;
    OH_PixelmapNative *pixelmap = nullptr;
    size_t size = 10 * 8 * 4; //辅助图的长*宽*4
    uint8_t *buffer = new uint8_t[size]; //ReadPixelsToBuffer的buffer
    size_t pixelsBufferSize = 320; //bufferSize
    ImageSourceNative() {}
    ~ImageSourceNative() {}

private:
};

#endif //CREATEPIXELMAP_IMAGE_SOURCE_NATIVE_H
