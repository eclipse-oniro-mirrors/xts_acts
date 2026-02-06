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
import ImageEffectFilterRenderSuppTest from './ImageEffectFilterRenderSupp.test';
import ImageEffectFilterSuppTest from './ImageEffectFilterSupp.test';
import ImageEffectSuppTest from './ImageEffectSupp.test';
import imageFrameworkPixelMapNativeCreateSuppTest from './ImageFrameworkPixelMapNativeCreateSupp.test';
import imageFrameworkImageSourceNativeCreateSuppTest from './ImageSourceNativeCreateTest.test';
import OHEffectBufferInfoGetTextureIdTest from './OHEffectBufferInfoGetTextureIdTest.test';
import OHEffectBufferInfoGetTimestampTest from './OHEffectBufferInfoGetTimestampTest.test';
import OHEffectBufferInfoSetTextureIdTest from './OHEffectBufferInfoSetTextureIdTest.test';
import OHEffectBufferInfoSetTimestampTest from './OHEffectBufferInfoSetTimestampTest.test';
import ImageErrorSuppTest from './ImageErrorSupp.test';
import ImageEffectInfoSupplementTest from './OHEffectFilterInfoSupplement.test';
import OHImagePixelMapCreateTest from './ImagePixelMapCreateTest.test';
import OHImagePackerCreateTest from './OHImagePackerCreateTest.test';
import PixelMapInitNativePixelMap from './PixelMapInitNativePixelMap.test';
import ImageInitImageNativeSuppTest from './ImageInitImageNativeSupp.test';
import ImageReceiverNativeTest from './ImageReceiverNativeTest.test';
import PixelMapNativeTest from './PixelMapNativeTest.test';
import ImageEffectsSuppTest from './ImageEffectsSupp.test';
import AccessPixelsSuppTest from './AccessPixelsSupp.test';
import ImageSourceSuppTest from './ImageSourceSupp.test';
import OHEffectBufferInfoSetInfoTest from './OHEffectBufferInfoSetInfoTest.test';
import OHImageEffectRestoreTest from './OHImageEffectRestoreTest.test';
import OHImageSizeTest from './OHImageSizeTest.test';
import OHPixelmapNativeCreatePixelmapNativeTest from './OHPixelmapNativeCreatePixelmapNativeTest.test';
import ImageEffectErrorCodeSuppTest from './ImageEffectErrcodeSupp.test';
import OHPixelMapSupplementTest from './OHPixelMapSupplement.test';
import OHImageEffectSetOutputTexture from './OHImageEffectSetOutputTexture.test';
import OHImageEffectStartTest from './OHImageEffectStart.test';
import OHPictureMetadata from './OHPictureMetadata.test';
import PixelMapGetIsEditableTest from './OHPixelMapGetIsEditable.test';
import PixelMapIsSupportAlphaTest from './OHPixelMapIsSupportAlpha.test';
import PixelMapSetAlphaAbleTest from './OHPixelMapSetAlphaAble.test';
import PixelMapSetDensityTest from './OHPixelMapSetDensity.test';
import ImagePixelmapTest from './PixelMapGetBytesNumberPerRow.test';
import IRNdkErrCode from './OHIRNdkErrCodeTest.test';
import IRNdkErrCodeSupplementTest from './IRNdkErrCodeSupplement.test';
import ImageResultIRNdkErrCodeTest from './ImageResultIRNdkErrCodeTest.test';
import ImageReceiverNativeReadTest from './ImageReceiverNativeReadTest.test';
import OHImageNdkFrameworkTest from './OHImageNdkFrameworkTest.test';
import OHImageSourceNativeSupp from './ImageSourceNativeGetImageProperty.test';
import imageFrameworkImageSourceNativeModifySuppTest from './ImageSourceNativeModify.test';
import PixelMapNativeCropTest from './PixelmapNativeCropTest.test';
import ImagePackerNativeTest from './ImagePackerNativeTest.test';
import ImagePictureNativeTest from './ImagePictureNativeTest.test';
import OHImageSourceNativeSupplementTest from './OHImageSourceNativeSupplement.test';
import ImageOHImageSourceInfoCreate from './ImageOHImageSourceInfoCreate.test';

export default function testsuite() {
  ImageEffectSuppTest();
  OHEffectBufferInfoSetTimestampTest();
  OHEffectBufferInfoGetTimestampTest();
  OHEffectBufferInfoSetTextureIdTest();
  OHEffectBufferInfoGetTextureIdTest();
  ImageEffectFilterSuppTest();
  ImageEffectFilterRenderSuppTest();
  imageFrameworkPixelMapNativeCreateSuppTest();
  imageFrameworkImageSourceNativeCreateSuppTest();
  ImageErrorSuppTest();
  ImageEffectInfoSupplementTest();
  PixelMapInitNativePixelMap();
  OHImagePackerCreateTest();
  OHImagePixelMapCreateTest();
  ImageInitImageNativeSuppTest();
  ImageReceiverNativeTest();
  PixelMapNativeTest();
  ImageEffectsSuppTest();
  AccessPixelsSuppTest();
  ImageSourceSuppTest();
  OHEffectBufferInfoSetInfoTest();
  OHImageEffectRestoreTest();
  OHImageSizeTest();
  OHPixelmapNativeCreatePixelmapNativeTest();
  ImageEffectErrorCodeSuppTest();
  OHPixelMapSupplementTest();
  ImagePixelmapTest();
  PixelMapGetIsEditableTest();
  PixelMapIsSupportAlphaTest();
  PixelMapSetAlphaAbleTest();
  PixelMapSetDensityTest();
  OHImageEffectStartTest();
  OHImageEffectSetOutputTexture();
  OHPictureMetadata();
  IRNdkErrCodeSupplementTest();
  ImageResultIRNdkErrCodeTest();
  IRNdkErrCode();
  OHImageNdkFrameworkTest();
  OHImageSourceNativeSupp();
  imageFrameworkImageSourceNativeModifySuppTest();
  PixelMapNativeCropTest();
  ImagePackerNativeTest();
  ImagePictureNativeTest();
  OHImageSourceNativeSupplementTest()
  ImageOHImageSourceInfoCreate();
}