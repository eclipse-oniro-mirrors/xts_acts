/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include "AccessPixelsTest.h"
#include "ImagePackerCreateTest.h"
#include "ImagePackerNativeTest.h"
#include "ImagePictureNativeTest.h"
#include "ImagePixelMapTest.h"
#include "OHImageSourceNativeSupplementTest.h"
#include "PixelmapNativeCropTest.h"
#include "napi/native_api.h"
#include "ImageReceiverNativeReadTest.h"
#include "ImageReceiverNativeTest.h"
#include "PixleMapNativeTest.h"
#include "InitNativePixelMapTest.h"
#include "ImageEffectSuppTest.h"
#include "ImageEffectFilterSuppTest.h"
#include "ImageEffectFilterRenderSuppTest.h"
#include "ImageFrameworkPixelMapNativeCreateSuppTest.h"
#include "ImageSourceNativeCreateTest.h"
#include "OHEffectBufferInfoSetTimestampTest.h"
#include "OHEffectBufferInfoGetTimestampTest.h"
#include "OHEffectBufferInfoSetTextureIdTest.h"
#include "OHEffectBufferInfoGetTextureIdTest.h"
#include "OHImageErrorSuppTest.h"
#include "OHEffectFilterInfoSupplementTest.h"
#include "ImagePackerCreateTest.h"
#include "ImageEffectsSuppTest.h"
#include "ImageSourceTest.h"
#include "ImageInitImageNativeSuppTest.h"
#include "OHPixelMapGetBytesNumberPerRowTest.h"
#include "OHPixelMapGetIsEditableTest.h"
#include "OHPixelMapIsSupportAlphaTest.h"
#include "OHPixelMapSetAlphaAbleTest.h"
#include "OHPixelMapSetDensityTest.h"
#include "OHImageEffectSetOutputTextureIdTest.h"
#include "OHImageEffectStartTest.h"
#include "OHPictureMetadataTest.h"
#include "OHImageEffectErrcodeSuppTest.h"
#include "OHPixelMapSupplementTest.h"
#include "IRNdkErrCodeSupplementTest.h"
#include "ImageInitImageNativeSuppTest.h"
#include "OHEffectBufferInfoSetInfoTest.h"
#include "OHImageEffectRestoreTest.h"
#include "OHImageSizeTest.h"
#include "OHPixelmapNativeCreatePixelmapNativeTest.h"
#include "ImageResultIRNdkErrCodeTest.h"
#include "ImageNdkErrCodeTest.h"
#include "OHImageNdkFrameworkTest.h"
#include "ImageSourceNativeGetImagePropertyTest.h"
#include "ImageSourceNativeModifySuppTest.h"
#include "ImageOHImageSourceInfoCreateTest.h"

#define DESCRIPTOR(jsmethod, method)                                                                                   \
    { jsmethod, nullptr, method, nullptr, nullptr, nullptr, napi_default, nullptr }

napi_property_descriptor desc1[] = {
    DESCRIPTOR("OHImageEffectCreateSupp", OHImageEffectCreateSupp),
    DESCRIPTOR("OHImageEffectAddFilterSupp", OHImageEffectAddFilterSupp),
    DESCRIPTOR("OHImageEffectInsertFilterSupp", OHImageEffectInsertFilterSupp),
    DESCRIPTOR("OHImageEffectRemoveFilterSupp", OHImageEffectRemoveFilterSupp),
    DESCRIPTOR("OHImageEffectReplaceFilterSupp", OHImageEffectReplaceFilterSupp),
    DESCRIPTOR("OHEffectBufferInfoSetTimestampTest", OHEffectBufferInfoSetTimestampTest),
    DESCRIPTOR("OHEffectBufferInfoGetTimestampTest", OHEffectBufferInfoGetTimestampTest),
    DESCRIPTOR("OHEffectBufferInfoSetTextureIdTest", OHEffectBufferInfoSetTextureIdTest),
    DESCRIPTOR("OHEffectBufferInfoGetTextureIdTest", OHEffectBufferInfoGetTextureIdTest),
    DESCRIPTOR("OHEffectFilterCreateSupp", OHEffectFilterCreateSupp),
    DESCRIPTOR("OHEffectFilterLookUpFiltersSupp", OHEffectFilterLookUpFiltersSupp),
    DESCRIPTOR("OHEffectFilterLookUpFiltersNullptrSupp", OHEffectFilterLookUpFiltersNullptrSupp),
    DESCRIPTOR("OHEffectFilterSetValueSupp", OHEffectFilterSetValueSupp),
    DESCRIPTOR("OHEffectFilterGetValueSupp", OHEffectFilterGetValueSupp),
    DESCRIPTOR("OHEffectFilterRegisterSupp", OHEffectFilterRegisterSupp),
    DESCRIPTOR("OHEffectFilterLookupFilterInfoSupp", OHEffectFilterLookupFilterInfoSupp),
    DESCRIPTOR("OHEffectFilterReleaseSupp", OHEffectFilterReleaseSupp),
    DESCRIPTOR("OHEffectFilterRenderSupp", OHEffectFilterRenderSupp),
    DESCRIPTOR("OHEffectFilterRenderWithTextureIdSupp", OHEffectFilterRenderWithTextureIdSupp),
    DESCRIPTOR("OHPixelmapNativeCreateScaledPixelMapSupp", OHPixelmapNativeCreateScaledPixelMapSupp),
    DESCRIPTOR("OHPixelmapNativeCreateScaledPixelMapWithAntiAliasingSupp",
               OHPixelmapNativeCreateScaledPixelMapWithAntiAliasingSupp),
    DESCRIPTOR("OHPixelmapNativeTranslateSupp", OHPixelmapNativeTranslateSupp),
    DESCRIPTOR("OHImageSourceNativeCreateFromUriSupp", OHImageSourceNativeCreateFromUriSupp),
    DESCRIPTOR("OHImageSourceNativeCreateFromFdSupp", OHImageSourceNativeCreateFromFdSupp),
    DESCRIPTOR("OHImageAlphaTypeSupp", OHImageAlphaTypeSupp),
    DESCRIPTOR("OHImageErrorCodeSupp", OHImageErrorCodeSupp),
    DESCRIPTOR("OHImageScaleModeSupp", OHImageScaleModeSupp),
    DESCRIPTOR("OHImageAuxiliaryPictureSupp", OHImageAuxiliaryPictureSupp),
    DESCRIPTOR("OHEffectFilterInfoSetFilterNameSupplementTest", OHEffectFilterInfoSetFilterNameSupplementTest),
    DESCRIPTOR("OHEffectFilterInfoGetFilterNameSupplementTest", OHEffectFilterInfoGetFilterNameSupplementTest),
    DESCRIPTOR("OHEffectFilterInfoSetSupportedBufferTypesSuppTest", OHEffectFilterInfoSetSupportedBufferTypesSuppTest),
    DESCRIPTOR("OHEffectFilterInfoGetSupportedBufferTypesSuppTest", OHEffectFilterInfoGetSupportedBufferTypesSuppTest),
    DESCRIPTOR("OHEffectFilterInfoSetSupportedFormatsSuppTest", OHEffectFilterInfoSetSupportedFormatsSuppTest),
    DESCRIPTOR("OHEffectFilterInfoGetSupportedFormatsSuppTest", OHEffectFilterInfoGetSupportedFormatsSuppTest),
    DESCRIPTOR("OHEffectFilterInfoReleaseSupplementTest", OHEffectFilterInfoReleaseSupplementTest),
    DESCRIPTOR("OHImageEffectAddFilterByFilterSupp", OHImageEffectAddFilterByFilterSupp),
    DESCRIPTOR("OHImageEffectInsertFilterByFilterSupp", OHImageEffectInsertFilterByFilterSupp),
    DESCRIPTOR("OHImageEffectRemoveFilterByIndexSupp", OHImageEffectRemoveFilterByIndexSupp),
    DESCRIPTOR("OHImageEffectGetFilterSupp", OHImageEffectGetFilterSupp),
    DESCRIPTOR("OHImageEffectSetInputPictureSupp", OHImageEffectSetInputPictureSupp),
    DESCRIPTOR("OHImageEffectSetOutputPictureSupp", OHImageEffectSetOutputPictureSupp),
    DESCRIPTOR("OHImageEffectReleaseSupp", OHImageEffectReleaseSupp),
    DESCRIPTOR("OHImageEffectReplaceFilterByFilterSupp", OHImageEffectReplaceFilterByFilterSupp),
    DESCRIPTOR("PixelMapGetIsEditableResult", PixelMapGetIsEditableResult),
    DESCRIPTOR("ImagePackerCreateTest", ImagePackerCreateTest),
    DESCRIPTOR("ImagePackerInitNativeTest", ImagePackerInitNativeTest),
    DESCRIPTOR("ImagePackerPackToDataTest", ImagePackerPackToDataTest),
    DESCRIPTOR("ImagePackerPackToFileTest", ImagePackerPackToFileTest),
    DESCRIPTOR("CreatePixelMapTest", CreatePixelMapTest),
    DESCRIPTOR("CreatePixelMapWithStrideTest", CreatePixelMapWithStrideTest),
    DESCRIPTOR("CreateAlphaPixelMapTest", CreateAlphaPixelMapTest),
    DESCRIPTOR("PixelMapGetImageInfoTest", PixelMapGetImageInfoTest),
    DESCRIPTOR("PixelMapAccessPixelsTest", PixelMapAccessPixelsTest),
    DESCRIPTOR("PixelMapUnAccessPixelsTest", PixelMapUnAccessPixelsTest),
    DESCRIPTOR("OHImageInitImageNativeSupp", OHImageInitImageNativeSupp),
    DESCRIPTOR("OHPackingOptionsCreateSupp", OHPackingOptionsCreateSupp),
    DESCRIPTOR("OHPictureMetadataGetPropertyWithNullSupp", OHPictureMetadataGetPropertyWithNullSupp),
    DESCRIPTOR("OHPixelmapNativeGetMetadataSupp", OHPixelmapNativeGetMetadataSupp),
    DESCRIPTOR("OHPixelmapNativeSetMetadataSupp", OHPixelmapNativeSetMetadataSupp),
    DESCRIPTOR("OHConvertPixelmapNativeFromNapiSupp", OHConvertPixelmapNativeFromNapiSupp),
    DESCRIPTOR("OHPictureNativeGetMetadataSupp", OHPictureNativeGetMetadataSupp),
    DESCRIPTOR("OHPictureNativeSetMetadataSupp", OHPictureNativeSetMetadataSupp),
    DESCRIPTOR("OHAuxiliaryPictureNativeSetMetadataSupp", OHAuxiliaryPictureNativeSetMetadataSupp),
    DESCRIPTOR("OHImageEffectConfigureSupp", OHImageEffectConfigureSupp),
    DESCRIPTOR("OHImageEffectSetOutputSurfaceSupp", OHImageEffectSetOutputSurfaceSupp),
    DESCRIPTOR("OHImageEffectGetInputSurfaceSupp", OHImageEffectGetInputSurfaceSupp),
    DESCRIPTOR("OHImageEffectSetInputPixelmapSupp", OHImageEffectSetInputPixelmapSupp),
    DESCRIPTOR("savePixelMapForPathSupp", savePixelMapForPathSupp),
    DESCRIPTOR("OHImageEffectSaveSupp", OHImageEffectSaveSupp),
    DESCRIPTOR("OHImageEffectEmuSupp", OHImageEffectEmuSupp),
    DESCRIPTOR("CreatePixelMap", CreatePixelMap),
    DESCRIPTOR("CreatOutPixelMapForPathSupp", CreatOutPixelMapForPathSupp),
    DESCRIPTOR("OHImageEffectSetOutputPixelmapSupp", OHImageEffectSetOutputPixelmapSupp),
    DESCRIPTOR("OHImageEffectSetInputUriSupp", OHImageEffectSetInputUriSupp),
    DESCRIPTOR("OHImageEffectSetOutputUriSupp", OHImageEffectSetOutputUriSupp),
    DESCRIPTOR("TestAccessPixels", TestAccessPixels),
    DESCRIPTOR("TestUnAccessPixels", TestUnAccessPixels),
    DESCRIPTOR("ImageSourceCreatTest", ImageSourceCreatTest),
    DESCRIPTOR("ImageSourceGetSupportedFormatsTest", ImageSourceGetSupportedFormatsTest),
    DESCRIPTOR("ImageSourceCreateIncrementalTest", ImageSourceCreateIncrementalTest),
    DESCRIPTOR("ImageSourceInitNativeSuppTest", ImageSourceInitNativeSuppTest),
    DESCRIPTOR("PixelmapNativeGetNativeBuffer", PixelmapNativeGetNativeBuffer),
    DESCRIPTOR("TestImageScale", TestImageScale),
    DESCRIPTOR("PixelmapNativeWritePixelsToArea", PixelmapNativeWritePixelsToArea),
    DESCRIPTOR("CreatePixelMapSuppTest", CreatePixelMapSuppTest),
    DESCRIPTOR("OHImageEffectErrorCodeSupp", OHImageEffectErrorCodeSupp),
    DESCRIPTOR("OHIRNdkErrorCodeTestSupp", OHIRNdkErrorCodeTestSupp),
    DESCRIPTOR("OHPixelMapTranslateSupplementTest", OHPixelMapTranslateSupplementTest),
    DESCRIPTOR("OHPixelMapRotateSupplementTest", OHPixelMapRotateSupplementTest),
    DESCRIPTOR("OHPixelmapNativeSetColorSpaceNativeSuppTest", OHPixelmapNativeSetColorSpaceNativeSuppTest),
    DESCRIPTOR("OHPixelmapNativeGetColorSpaceNativeSuppTest", OHPixelmapNativeGetColorSpaceNativeSuppTest),
    DESCRIPTOR("OHEffectBufferInfoSetAddrSupplementTest", OHEffectBufferInfoSetAddrSupplementTest),
    DESCRIPTOR("OHEffectBufferInfoGetAddrSupplementTest", OHEffectBufferInfoGetAddrSupplementTest),
    DESCRIPTOR("OHEffectBufferInfoCreateSupplementTest", OHEffectBufferInfoCreateSupplementTest),
    DESCRIPTOR("OHEffectFilterInfoCreateSupplementTest", OHEffectFilterInfoCreateSupplementTest),
    DESCRIPTOR("OHEffectFilterCreateSupplementTest", OHEffectFilterCreateSupplementTest),
    DESCRIPTOR("OHPixelmapNativeUnaccessPixelsSuppTest", OHPixelmapNativeUnaccessPixelsSuppTest),
    DESCRIPTOR("CreateImageReceiverSupplementTest", CreateImageReceiverSupplementTest),
    DESCRIPTOR("OHPixelmapNativeAccessPixelsSuppTest", OHPixelmapNativeAccessPixelsSuppTest),
    DESCRIPTOR("OHPixelmapNativeCreateAlphaPixelmapSuppTest", OHPixelmapNativeCreateAlphaPixelmapSuppTest),
    DESCRIPTOR("OHPixelmapNativeGetUniqueIdSuppTest", OHPixelmapNativeGetUniqueIdSuppTest),
    DESCRIPTOR("OHPixelmapNativeIsReleasedSuppTest", OHPixelmapNativeIsReleasedSuppTest),
    DESCRIPTOR("OHPixelmapNativeReadPixelsFromAreaSuppTest", OHPixelmapNativeReadPixelsFromAreaSuppTest),
    DESCRIPTOR("OHPixelmapNativeWritePixelsToAreaSuppTest", OHPixelmapNativeWritePixelsToAreaSuppTest),
    DESCRIPTOR("IRNdkErrCodeSupplementTest", IRNdkErrCodeSupplementTest),
    DESCRIPTOR("OHImageEffectCreateSupplement", OHImageEffectCreateSupplement),
    DESCRIPTOR("OHImageEffectAddFilterSupplement", OHImageEffectAddFilterSupplement),
    DESCRIPTOR("OHImageEffectInsertFilterSupplement", OHImageEffectInsertFilterSupplement),
    DESCRIPTOR("OHImageEffectReplaceFilterSupplement", OHImageEffectReplaceFilterSupplement),
    DESCRIPTOR("OHImageEffectGetFilterSupplement", OHImageEffectGetFilterSupplement),
    DESCRIPTOR("OHImageEffectSetInputTextureSupp", OHImageEffectSetInputTextureSupp),
    DESCRIPTOR("OHEffectBufferInfoSetWidthTest", OHEffectBufferInfoSetWidthTest),
    DESCRIPTOR("OHEffectBufferInfoGetWidthTest", OHEffectBufferInfoGetWidthTest),
    DESCRIPTOR("OHEffectBufferInfoGetHeightTest", OHEffectBufferInfoGetHeightTest),
    DESCRIPTOR("OHEffectBufferInfoSetHeightTest", OHEffectBufferInfoSetHeightTest),
    DESCRIPTOR("OHEffectBufferInfoSetRowSizeTest", OHEffectBufferInfoSetRowSizeTest),
    DESCRIPTOR("OHEffectBufferInfoGetRowSizeTest", OHEffectBufferInfoGetRowSizeTest),
    DESCRIPTOR("OHEffectBufferInfoReleaseTest", OHEffectBufferInfoReleaseTest),
    DESCRIPTOR("OHImageSizeTest", OHImageSizeTest),
    DESCRIPTOR("OHImageEffectRestoreTest", OHImageEffectRestoreTest),
    DESCRIPTOR("OHPixelmapNativeCreatePixelmapNativeTest", OHPixelmapNativeCreatePixelmapNativeTest),
    DESCRIPTOR("OHPixelmapNativeGetArgbPixelsTest", OHPixelmapNativeGetArgbPixelsTest),
    DESCRIPTOR("OHPixelmapNativeToSdrTest", OHPixelmapNativeToSdrTest),
    DESCRIPTOR("PixelmapNativeCreateEmptyPixelmapUsingAllocator", PixelmapNativeCreateEmptyPixelmapUsingAllocator),
    DESCRIPTOR("IRNdkErrCodeSupplement", IRNdkErrCodeSupplement),
    DESCRIPTOR("OIRNdkErrCodeEmuSupp", OIRNdkErrCodeEmuSupp),
    DESCRIPTOR("ImageReceiverNativeReadLatestImageTest", ImageReceiverNativeReadLatestImageTest),
    DESCRIPTOR("InitImageReceiverNativeTest", InitImageReceiverNativeTest),
    DESCRIPTOR("OHImageClipRectTest", OHImageClipRectTest),
    DESCRIPTOR("CreatePixelmapUsingAllocatorTest", CreatePixelmapUsingAllocatorTest),
    DESCRIPTOR("PixelmapNativeSetMemoryNameTest", PixelmapNativeSetMemoryNameTest),
    DESCRIPTOR("ImageSourceNativeCreatePictureTest", ImageSourceNativeCreatePictureTest),
    DESCRIPTOR("ImageSourceNativeCreatePictureAtIndexTest", ImageSourceNativeCreatePictureAtIndexTest),
    DESCRIPTOR("DecodingOptionsGetDesiredColorSpaceTest", DecodingOptionsGetDesiredColorSpaceTest),
    DESCRIPTOR("ClonePixelmapTest", ClonePixelmapTest),
    DESCRIPTOR("CreateCroppedAndScaledPixelMapTest", CreateCroppedAndScaledPixelMapTest),
    DESCRIPTOR("CreatePixelmapFromSurfaceTest", CreatePixelmapFromSurfaceTest),
    DESCRIPTOR("CreatePixelmapFromNativeBufferTest", CreatePixelmapFromNativeBufferTest),
    DESCRIPTOR("OHPixelMapGetBytesNumberPerRow", OHPixelMapGetBytesNumberPerRow),
    DESCRIPTOR("OHPixelMapGetIsEditable", OHPixelMapGetIsEditable),
    DESCRIPTOR("OHPixelMapIsSupportAlpha", OHPixelMapIsSupportAlpha),
    DESCRIPTOR("OHPixelMapSetAlphaAble", OHPixelMapSetAlphaAble),
    DESCRIPTOR("OHPixelMapSetDensity", OHPixelMapSetDensity),
    DESCRIPTOR("OHImageEffectStart", OHImageEffectStart),
    DESCRIPTOR("OHImageEffectSetOutputTextureId", OHImageEffectSetOutputTextureId),
    DESCRIPTOR("PictureMetadataGetProperty", PictureMetadataGetProperty),
    DESCRIPTOR("PictureMetadataSetProperty", PictureMetadataSetProperty),
    DESCRIPTOR("ClonedMetadataGetProperty", ClonedMetadataGetProperty),
    DESCRIPTOR("OHIRNdkErrCodeTestSupp", OHIRNdkErrCodeTestSupp),
    DESCRIPTOR("ImageResultIRNdkErrCodeTest", ImageResultIRNdkErrCodeTest),
    DESCRIPTOR("MediaLibraryErrorCode", MediaLibraryErrorCode),
    DESCRIPTOR("OHIRNdkErrCodeTestSupp", OHIRNdkErrCodeTestSupp),
    DESCRIPTOR("ImageReceiverNativeReadLatestImageSuccessTest", ImageReceiverNativeReadLatestImageSuccessTest),
    DESCRIPTOR("ImagePackerNativeCreateTest", ImagePackerNativeCreateTest),
    DESCRIPTOR("OHDecodingOptionsCreateTest", OHDecodingOptionsCreateTest),
    DESCRIPTOR("OH_PixelmapNative_GetImageInfoTest", OH_PixelmapNative_GetImageInfoTest),
    DESCRIPTOR("OH_PixelmapNative_ConvertAlphaFormatTest", OH_PixelmapNative_ConvertAlphaFormatTest),
    DESCRIPTOR("PixelmapNativeGetNativeBufferNotExist", PixelmapNativeGetNativeBufferNotExist),
    DESCRIPTOR("ImageSourceCreatSuccessTest", ImageSourceCreatSuccessTest),
    DESCRIPTOR("ImageSourceCreate", ImageSourceCreate),
    DESCRIPTOR("ImageSourceNativeGetImagePropertyLong", ImageSourceNativeGetImagePropertyLong),
    DESCRIPTOR("ImageSourceNativeGetImagePropertyShort", ImageSourceNativeGetImagePropertyShort),
    DESCRIPTOR("ImageSourceNativeGetImagePropertyDouble", ImageSourceNativeGetImagePropertyDouble),
    DESCRIPTOR("ImageSourceGetImagePropertyArraySize", ImageSourceGetImagePropertyArraySize),
    DESCRIPTOR("OHImageSourceNativeModifyImagePropertyDoubleSupp", OHImageSourceNativeModifyImagePropertyDoubleSupp),
    DESCRIPTOR("ImageModifyImagePropertyIntArraySupp", ImageModifyImagePropertyIntArraySupp),
    DESCRIPTOR("ImageModifyImagePropertyDoubleArraySupp", ImageModifyImagePropertyDoubleArraySupp),
    DESCRIPTOR("OHImageSourceNativeModifyImagePropertyBlobSupp", OHImageSourceNativeModifyImagePropertyBlobSupp),
    DESCRIPTOR("PixelmapNativeCropTest", PixelmapNativeCropTest),
    DESCRIPTOR("ConvertAlphaFormatTest", ConvertAlphaFormatTest),
    DESCRIPTOR("DecodingOptionsReleaseTest", DecodingOptionsReleaseTest),
    DESCRIPTOR("CreatePixelmapFromSurfaceWithTransformationTest", CreatePixelmapFromSurfaceWithTransformationTest),
    DESCRIPTOR("SetDesiredPixelFormatTest", SetDesiredPixelFormatTest),
    DESCRIPTOR("GetDesiredPixelFormatTest", GetDesiredPixelFormatTest),
    DESCRIPTOR("ComposeOptionsReleaseTest", ComposeOptionsReleaseTest),
    DESCRIPTOR("GetHdrComposedPixelmapWithOptionsTest", GetHdrComposedPixelmapWithOptionsTest),
    DESCRIPTOR("ComposeOptionsCreateTest", ComposeOptionsCreateTest),
    DESCRIPTOR("OHImageSourceNativeGetImagePropertyIntArraySupp", OHImageSourceNativeGetImagePropertyIntArraySupp),
    DESCRIPTOR("OHImageSourceNativeModifyImagePropertyLongSupp", OHImageSourceNativeModifyImagePropertyLongSupp),
    DESCRIPTOR("ImageSourceNativeGetImagePropertyDoubleArraySupp", ImageSourceNativeGetImagePropertyDoubleArraySupp),
    DESCRIPTOR("ImageErrCodeSupp", ImageErrCodeSupp),
    DESCRIPTOR("ImageModifyImagePropertyShortSupp", ImageModifyImagePropertyShortSupp),
    DESCRIPTOR("OHImageSourceNativeGetImagePropertyBlobSupp", OHImageSourceNativeGetImagePropertyBlobSupp),
    DESCRIPTOR("OHImageSourceNativeGetImagePropertyStringSupp", OHImageSourceNativeGetImagePropertyStringSupp),
    DESCRIPTOR("OHImageSourceInfoCreateTest", OHImageSourceInfoCreateTest),
    DESCRIPTOR("OHImageNativeGetFormatTest", OHImageNativeGetFormatTest),
    DESCRIPTOR("OHImageNativeGetBufferDataTest", OHImageNativeGetBufferDataTest),
    DESCRIPTOR("OHPixelmapNativeWritePixelsTest", OHPixelmapNativeWritePixelsTest),
    DESCRIPTOR("OHPixelmapNativeReadPixelsTest", OHPixelmapNativeReadPixelsTest),
    DESCRIPTOR("OHImageNativeGetBufferDataValueTest", OHImageNativeGetBufferDataValueTest),
    DESCRIPTOR("OHImageNativeGetColorSpaceTest", OHImageNativeGetColorSpaceTest),

};
EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    size_t mergedLength = sizeof(desc1) / sizeof(desc1[0]);
    napi_property_descriptor mergedArray[mergedLength];
    for (size_t i = 0; i < sizeof(desc1) / sizeof(desc1[0]); ++i) {
        mergedArray[i] = desc1[i];
    }
    napi_define_properties(env, exports, mergedLength, mergedArray);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "imageEffect",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }