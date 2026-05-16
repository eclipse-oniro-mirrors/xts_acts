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
import imagepixelmapmdk from './Imagepixelmapmdk.test'
import imagereceivermdk from './Imagereceivermdk.test'
import ImagePackingNDKTest from './ImagePackingNDKTest.test'
import imagepicture from './Imagepicture.test'
import imageframework from './Imageframework.test'
import ImageReceiverNDKTest from './ReceiverNDK.test';
import ImagePixelMapNDKTest from './ImagePixelMapNDK.test'
import ImagePackerNativeTest from './ImagePackerNative.test'
import ImagePackerNativeTest1 from './ImagePackerNative1.test'
import ImageSourceNativeCodeTest from './ImageSourceNativeCode.test'
import  ImageEffectErrorCodeTest from  './ImageEffectErrorCode.test'
import ImageKitErrorCodeTest from './ImageKitErroerCodeTest.test.ets'
import ImageProcessingTest from './ImageProcessingTest.test.ets'
export default function testsuite() {
  imagepixelmapmdk()
  imagereceivermdk()
  ImagePackingNDKTest()
  imagepicture()
  imageframework()
  ImageReceiverNDKTest();
  ImagePixelMapNDKTest();
  ImagePackerNativeTest();
  ImagePackerNativeTest1();
  ImageSourceNativeCodeTest();
  ImageEffectErrorCodeTest();
  ImageKitErrorCodeTest();
  ImageProcessingTest();
}
