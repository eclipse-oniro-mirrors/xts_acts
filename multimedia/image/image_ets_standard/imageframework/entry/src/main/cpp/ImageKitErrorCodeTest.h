/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef IMAGE_KIT_TEST_H
#define IMAGE_KIT_TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>

#include <vector>

napi_value OH_PixelmapNative_AntiAliasingLevel_NONE(napi_env env, napi_callback_info info);
napi_value OH_PixelmapNative_AntiAliasingLevel_LOW(napi_env env, napi_callback_info info);
napi_value OH_PixelmapNative_AntiAliasingLevel_MEDIUM(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrMetadataKey_HDR_STATIC_METADATA(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrMetadataKey_HDR_DYNAMIC_METADATA(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrMetadataKey_HDR_GAINMAP_METADATA(napi_env env, napi_callback_info info);
napi_value Image_ErrorCode_IMAGE_DMA_NOT_EXIST(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrMetadataType_NONE(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrMetadataType_BASE(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrMetadataType_GAINMAP(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrMetadataType_ALTERNATE(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrStaticMetadata_displayPrimariesX(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrStaticMetadata_displayPrimariesY(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrStaticMetadata_whitePointX(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrStaticMetadata_whitePointY(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrStaticMetadata_maxLuminance(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrStaticMetadata_minLuminance(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrStaticMetadata_maxContentLightLevel(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrStaticMetadata_maxFrameAverageLightLevel(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrDynamicMetadata_data(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrDynamicMetadata_length(napi_env env, napi_callback_info info);

napi_value OH_Pixelmap_HdrGainmapMetadata_writerVersion(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrGainmapMetadata_miniVersion(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrGainmapMetadata_gainmapChannelNum(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrGainmapMetadata_useBaseColorFlag(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrGainmapMetadata_baseHeadroom(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrGainmapMetadata_alternateHeadroom(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrGainmapMetadata_gainmapMax(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrGainmapMetadata_gainmapMin(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrGainmapMetadata_gamma(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrGainmapMetadata_baselineOffset(napi_env env, napi_callback_info info);
napi_value OH_Pixelmap_HdrGainmapMetadata_alternateOffset(napi_env env, napi_callback_info info);

napi_value PixelFormat_RGB_565(napi_env env, napi_callback_info info);
napi_value PixelFormat_RGB_888(napi_env env, napi_callback_info info);
napi_value PixelFormat_ALPHA_8(napi_env env, napi_callback_info info);
napi_value PixelFormat_RGBA_F16(napi_env env, napi_callback_info info);
napi_value PixelFormat_NV21(napi_env env, napi_callback_info info);
napi_value PixelFormat_NV12(napi_env env, napi_callback_info info);
napi_value PixelFormat_RGBA_1010102(napi_env env, napi_callback_info info);
napi_value PixelFormat_YCBCR_P010(napi_env env, napi_callback_info info);
napi_value PixelFormat_YCRCB_P010(napi_env env, napi_callback_info info);

napi_value JSImageImageAllocatorModeDmaCode(napi_env env, napi_callback_info info);
napi_value JSImageImageAllocatorModeSharedMemoryCode(napi_env env, napi_callback_info info);
napi_value JSImagePixelmapAlphaTypeOpaqueCode(napi_env env, napi_callback_info info);
napi_value JSImagePixelmapAlphaTypeUnpremultipliedCode(napi_env env, napi_callback_info info);
napi_value JSImagePixelmapHdrMetadataValueTypeCode(napi_env env, napi_callback_info info);
napi_value JSImagePixelmapHdrMetadataValueStaticMetadataCode(napi_env env, napi_callback_info info);
napi_value JSImagePixelmapHdrMetadataValueDynamicMetadataCode(napi_env env, napi_callback_info info);
napi_value JSImagePixelmapHdrMetadataValueGainmapMetadataCode(napi_env env, napi_callback_info info);

#endif //IMAGE_KIT_TEST_H
