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
#include "image_receiver_module_test.h"

#define IMAGE_LOG_TAG "IMAGE_RECEIVER_TAGLOG"
#define IMAGE_LOG_DOMAIN 0x3200
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)

ImageReceiverModuleTest::ImageReceiverModuleTest()
{
}

ImageReceiverModuleTest::~ImageReceiverModuleTest()
{
    DestroyImageReceiver();
}

Image_ErrorCode ImageReceiverModuleTest::CreateImageReceiver(uint32_t width, uint32_t height, uint32_t capacity)
{
    LOG("CreateImageReceiver enter.");
    if (imageReceiver_ != nullptr) {
        if (ReuseSameRecevier(width, height, capacity)) {
            LOG("Reuse last create ImageReceiver.");
            return IMAGE_SUCCESS;
        } else {
            DestroyImageReceiver();
        }
    }
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode ret = OH_ImageReceiverOptions_Create(&options);
    if (ret != IMAGE_SUCCESS) {
        LOG("Create Image Receiver options failed: err = %{public}d.", ret);
        return ret;
    }

    width_ = width;
    height_ = height;
    capacity_ = capacity;
    Image_Size size = { width_, height_ };
    ret = OH_ImageReceiverOptions_SetSize(options, size);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageReceiverOptions_Release(options);
        LOG("Set Image Receiver options size(%{public}dx%{public}d) failed: err = %{public}d.",
            size.width, size.height, ret);
        return ret;
    }
    ret = OH_ImageReceiverOptions_SetCapacity(options, capacity_);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageReceiverOptions_Release(options);
        LOG("Set Image Receiver options capacity(%{public}d) failed: err = %{public}d.",
            capacity, ret);
        return ret;
    }
    ret = VerifyImageReceiverOptions(options);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageReceiverOptions_Release(options);
        LOG("Set Image Receiver options capacity(%{public}d) failed: err = %{public}d.",
            capacity, ret);
        return ret;
    }
    ret = OH_ImageReceiverNative_Create(options, &imageReceiver_);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageReceiverOptions_Release(options);
        LOG("Create Image Receiver failed: err = %{public}d.", ret);
        return ret;
    }
    OH_ImageReceiverOptions_Release(options);
    LOG("CreateImageReceiver end.");
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::DestroyImageReceiver()
{
    LOG("DestroyImageReceiver enter.");
    Image_ErrorCode ret = OH_ImageReceiverNative_Release(imageReceiver_);
    if (ret != IMAGE_SUCCESS) {
        LOG("Release Image Receiver failed: err = %{public}d.", ret);
        return ret;
    }
    imageReceiver_ = nullptr;
    LOG("DestroyImageReceiver end.");
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::GetImageReceiverSurfaceId(uint64_t *surfaceId)
{
    LOG("GetImageReceiverSurfaceId enter.");
    Image_ErrorCode ret = OH_ImageReceiverNative_GetReceivingSurfaceId(imageReceiver_, surfaceId);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image Receiver SurfaceId failed: err = %{public}d.", ret);
        return ret;
    }
    LOG("GetImageReceiverSurfaceId end.");
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::GetImageReceiverLatestImage(OH_ImageNative **image)
{
    LOG("GetImageReceiverLatestImage enter.");
    Image_ErrorCode ret = OH_ImageReceiverNative_ReadLatestImage(imageReceiver_, image);
    if (ret != IMAGE_SUCCESS) {
        LOG("Read Image Receiver Latest Image failed: err = %{public}d.", ret);
        return ret;
    }
    LOG("GetImageReceiverLatestImage end.");

    int64_t timestamp = 0;
    ret = OH_ImageNative_GetTimestamp(*image, &timestamp);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get imageReceiverLatestImage failed : timestamp is : %{public}lld., err = %{public}d.",
            static_cast<long long>(timestamp), ret);
        return ret;
    }
    LOG("GetImageReceiverLatestImage %{public}s timestamp is : %{public}lld.", __func__,
        static_cast<long long>(timestamp));
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::GetImageReceiverNextImage(OH_ImageNative **image)
{
    LOG("GetImageReceiverNextImage enter.");
    Image_ErrorCode ret = OH_ImageReceiverNative_ReadNextImage(imageReceiver_, image);
    if (ret != IMAGE_SUCCESS) {
        LOG("Read Image Receiver Next Image failed: err = %{public}d.", ret);
        return ret;
    }
    LOG("GetImageReceiverNextImage end.");
    
    int64_t timestamp = 0;
    ret = OH_ImageNative_GetTimestamp(*image, &timestamp);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get imageReceiverNextImage failed : timestamp is : %{public}lld., err = %{public}d.",
            static_cast<long long>(timestamp), ret);
        return ret;
    }
    LOG("GetImageReceiverNextImage %{public}s timestamp is : %{public}lld.", __func__,
        static_cast<long long>(timestamp));
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::RegisterImageReceiverListener(OH_ImageReceiver_OnCallback callback)
{
    LOG("RegisterImageReceiverListener enter.");
    Image_ErrorCode ret = OH_ImageReceiverNative_On(imageReceiver_, callback);
    if (ret != IMAGE_SUCCESS) {
        LOG("Register Image Receiver on callback failed: err = %{public}d.", ret);
        return ret;
    }
    LOG("RegisterImageReceiverListener end.");
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::UnregisterImageReceiverListener()
{
    LOG("UnregisterImageReceiverListener enter.");
    Image_ErrorCode ret = OH_ImageReceiverNative_Off(imageReceiver_);
    if (ret != IMAGE_SUCCESS) {
        LOG("Register Image Receiver on callback failed: err = %{public}d.", ret);
        return ret;
    }
    LOG("UnregisterImageReceiverListener end.");
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::VerifyImageReceiver()
{
    LOG("VerifyImageReceiver enter.");
    Image_ErrorCode ret = IMAGE_SUCCESS;

    Image_Size size = { 0 };
    ret = OH_ImageReceiverNative_GetSize(imageReceiver_, &size);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image Receiver size failed: err = %{public}d.", ret);
        return ret;
    }
    LOG("Image Receiver size = %{public}dx%{public}d.", size.width, size.height);
    if (size.width != width_ || size.height != height_) {
        LOG("Get Image Receiver options size value is wrong: "
            "expect(%{public}dx%{public}d) actual(%{public}dx%{public}d).",
            width_, height_, size.width, size.height);
        return IMAGE_BAD_PARAMETER;
    }

    int32_t capacity = 0;
    ret = OH_ImageReceiverNative_GetCapacity(imageReceiver_, &capacity);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image Receiver capacity failed: err = %{public}d.", ret);
        return ret;
    }
    LOG("Image Receiver capacity = %{public}d.", capacity);
    if (capacity != capacity_) {
        LOG("Get Image Receiver capacity value is wrong: "
            "expect(%{public}d) actual(%{public}d).",
            capacity_, capacity);
        return IMAGE_BAD_PARAMETER;
    }

    uint64_t id = 0;
    ret = OH_ImageReceiverNative_GetReceivingSurfaceId(imageReceiver_, &id);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image Receiver SurfaceId failed: err = %{public}d.", ret);
        return ret;
    }
    LOG("Image Receiver surfaceId = %{public}llu.", static_cast<unsigned long long>(id));
    if (id == 0) {
        LOG("Get Image Receiver SurfaceId is zero.");
        return IMAGE_BAD_PARAMETER;
    }

    LOG("VerifyImageReceiver end.");
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::DumpImageInfo(OH_ImageNative *image)
{
    LOG("DumpImageInfo enter.");
    Image_Size size = { 0 };
    std::vector<uint32_t> types;

    if (GetImageSize(image, &size) != IMAGE_SUCCESS ||
        GetImageComponentTypes(image, &types) != IMAGE_SUCCESS) {
        LOG("Get Image property failed");
        return IMAGE_BAD_PARAMETER;
    }

    LOG("=== Start dump image(%{public}p) ===.", image);
    LOG("Get %{public}lu components.", static_cast<unsigned long>(types.size()));
    for (uint32_t i = 0; i < types.size(); i++) {
        OH_NativeBuffer* nativeBuffer = nullptr;
        size_t bufferSize = 0;
        int32_t rowStride = 0;
        int32_t pixelStride = 0;
        if (GetImageByteBuffer(image, types[i], &nativeBuffer) != IMAGE_SUCCESS ||
            GetImageBufferSize(image, types[i], &bufferSize) != IMAGE_SUCCESS ||
            GetImageRowStride(image, types[i], &rowStride) != IMAGE_SUCCESS ||
            GetImagePixelStride(image, types[i], &pixelStride) != IMAGE_SUCCESS) {
            LOG("Get Image property failed.");
            return IMAGE_BAD_PARAMETER;
        }
        LOG("Image component(%{public}d): ByteBuffer(%{public}p) Size(%{public}lu "
            "Stride(row %{public}d pixel %{public}d)).",
            types[i], nativeBuffer, static_cast<unsigned long>(bufferSize), rowStride, pixelStride);
    }
    LOG("=== End dump image(%{public}p) ===.", image);

    LOG("DumpImageInfo end.");
    return IMAGE_SUCCESS;
}

Image_ErrorCode ImageReceiverModuleTest::ReleaseImage(OH_ImageNative *image)
{
    LOG("ReleaseImage enter.");
    Image_ErrorCode ret = OH_ImageNative_Release(image);
    if (ret != IMAGE_SUCCESS) {
        LOG("Release Image failed: err = %{public}d.", ret);
        return ret;
    }
    LOG("ReleaseImage end.");
    return ret;
}

bool ImageReceiverModuleTest::ReuseSameRecevier(uint32_t width, uint32_t height, uint32_t capacity)
{
    if (width == width_ && height == height_ && capacity == capacity_) {
        return true;
    }
    return false;
}

Image_ErrorCode ImageReceiverModuleTest::VerifyImageReceiverOptions(OH_ImageReceiverOptions *options)
{
    LOG("VerifyImageReceiverOptions enter.");
    Image_ErrorCode ret = IMAGE_SUCCESS;

    Image_Size size = { 0 };
    ret = OH_ImageReceiverOptions_GetSize(options, &size);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image Receiver options size failed: err = %{public}d.", ret);
        return ret;
    }
    LOG("Image Receiver options size = %{public}dx%{public}d.", size.width, size.height);
    if (size.width != width_ || size.height != height_) {
        LOG("Get Image Receiver options size value is wrong: "
            "expect(%{public}dx%{public}d) actual(%{public}dx%{public}d).",
            width_, height_, size.width, size.height);
        return IMAGE_BAD_PARAMETER;
    }

    int32_t capacity = 0;
    ret = OH_ImageReceiverOptions_GetCapacity(options, &capacity);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image Receiver options capacity failed: err = %{public}d.", ret);
        return ret;
    }
    LOG("Image Receiver options capacity = %{public}d.", capacity);
    if (capacity != capacity_) {
        LOG("Get Image Receiver options capacity value is wrong: "
            "expect(%{public}d) actual(%{public}d).",
            capacity_, capacity);
        return IMAGE_BAD_PARAMETER;
    }

    LOG("VerifyImageReceiverOptions end.");
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::GetImageSize(OH_ImageNative *image, Image_Size *size)
{
    Image_ErrorCode ret = OH_ImageNative_GetImageSize(image, size);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image size failed: err = %{public}d.", ret);
        return ret;
    }
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::GetImageComponentTypes(OH_ImageNative *image, std::vector<uint32_t> *types)
{
    if (types == nullptr) {
        LOG("Types is nullptr.");
        return IMAGE_BAD_PARAMETER;
    }

    size_t typeSize = 0;
    Image_ErrorCode ret = OH_ImageNative_GetComponentTypes(image, nullptr, &typeSize);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image component types failed: err = %{public}d.", ret);
        return ret;
    }

    uint32_t *typesArr = nullptr;
    if (typeSize <= 0) {
        return IMAGE_BAD_PARAMETER;
    } else {
        typesArr = new uint32_t[typeSize];
    }

    if (typesArr == nullptr) {
        return IMAGE_ALLOC_FAILED;
    }

    ret = OH_ImageNative_GetComponentTypes(image, &typesArr, &typeSize);
    if (ret != IMAGE_SUCCESS) {
        delete [] typesArr;
        LOG("Get Image component types failed: err = %{public}d.", ret);
        return ret;
    }

    types->resize(typeSize);
    for (uint32_t i = 0; i < typeSize; i++) {
        types->push_back(typesArr[i]);
    }

    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::GetImageByteBuffer(OH_ImageNative *image, int32_t type,
                                                            OH_NativeBuffer **nativeBuffer)
{
    Image_ErrorCode ret = OH_ImageNative_GetByteBuffer(image, type, nativeBuffer);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image ByteBuffer failed: err = %{public}d.", ret);
        return ret;
    }
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::GetImageBufferSize(OH_ImageNative *image, int32_t type, size_t *size)
{
    Image_ErrorCode ret = OH_ImageNative_GetBufferSize(image, type, size);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image buffer size failed: err = %{public}d.", ret);
        return ret;
    }
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::GetImageRowStride(OH_ImageNative *image, int32_t type, int32_t *rowStride)
{
    Image_ErrorCode ret = OH_ImageNative_GetRowStride(image, type, rowStride);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image buffer rowStride failed: err = %{public}d.", ret);
        return ret;
    }
    return ret;
}

Image_ErrorCode ImageReceiverModuleTest::GetImagePixelStride(OH_ImageNative *image, int32_t type, int32_t *pixelStride)
{
    Image_ErrorCode ret = OH_ImageNative_GetPixelStride(image, type, pixelStride);
    if (ret != IMAGE_SUCCESS) {
        LOG("Get Image buffer pixelStride failed: err = %{public}d.", ret);
        return ret;
    }
    return ret;
}
