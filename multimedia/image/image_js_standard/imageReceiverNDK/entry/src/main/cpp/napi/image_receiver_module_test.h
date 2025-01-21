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

#ifndef IMAGE_RECEIVER_MODULE_TEST_H
#define IMAGE_RECEIVER_MODULE_TEST_H

#include <memory>
#include <string>
#include <vector>
#include "napi/native_api.h"
#include "camera_manager_ndk.h"
#include "image/image_receiver_native.h"
#include "image/image_common.h"

class ImageReceiverModuleTest {
public:
    ImageReceiverModuleTest();
    ~ImageReceiverModuleTest();

    // Image Receiver
    Image_ErrorCode CreateImageReceiver(int32_t width, int32_t height, int32_t capicity);
    Image_ErrorCode DestroyImageReceiver();

    Image_ErrorCode GetImageReceiverSurfaceId(uint64_t *surfaceId);
    Image_ErrorCode GetImageReceiverLatestImage(OH_ImageNative **image);
    Image_ErrorCode GetImageReceiverNextImage(OH_ImageNative **image);

    Image_ErrorCode RegisterImageReceiverListener(OH_ImageReceiver_OnCallback callback);
    Image_ErrorCode UnregisterImageReceiverListener();

    Image_ErrorCode VerifyImageReceiver();

    // Image Native
    Image_ErrorCode DumpImageInfo(OH_ImageNative *image);
    Image_ErrorCode ReleaseImage(OH_ImageNative *image);

private:
    bool ReuseSameRecevier(int32_t width, int32_t height, int32_t capicity);

    Image_ErrorCode VerifyImageReceiverOptions(OH_ImageReceiverOptions *options);

    Image_ErrorCode GetImageSize(OH_ImageNative *image, Image_Size *size);
    Image_ErrorCode GetImageComponentTypes(OH_ImageNative *image, std::vector<uint32_t> *types);
    Image_ErrorCode GetImageByteBuffer(OH_ImageNative *image, int32_t type, OH_NativeBuffer **nativeBuffer);
    Image_ErrorCode GetImageBufferSize(OH_ImageNative *image, int32_t type, size_t *size);
    Image_ErrorCode GetImageRowStride(OH_ImageNative *image, int32_t type, int32_t *rowStride);
    Image_ErrorCode GetImagePixelStride(OH_ImageNative *image, int32_t type, int32_t *pixelStride);

private:
    OH_ImageReceiverNative *imageReceiver_ = nullptr;

    // Params
    int32_t width_;
    int32_t height_;
    int32_t capacity_;
};

#endif // IMAGE_RECEIVER_MODULE_TEST_H
