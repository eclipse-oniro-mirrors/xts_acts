/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import APIClipMaskShapeTest from './ImageTest/APIClipMaskShape.test';
import AboutToRecycleImageJSTest from './ImageTest/AboutToRecycleImageJS.test';
import ImageBasicAttributesTest from './ImageTest/ImageBasicAttributes.test';
import ImageTextTest from './ImageTest/ImageText.test';
import ImageDynamicRangeModeTest from './ImageTest/ImageDynamicRangeMode.test';
import ImageEnableAnalyzerTest from './ImageTest/ImageEnableAnalyzer.test';
import ImageObjectFitTest from './ImageTest/ImageObjectFit.test';
import ImageApiTest from './ImageTest/ImageApi.test';
import ImageAttrTest from './ImageTest/ImageAttr.test';
import ImageObscuredTest from './ImageTest/ImageObscured.test';
import ImageObjectRepeatTest from './ImageTest/ImageObjectRepeat.test';
import ImageResizableTest from './ImageTest/ImageResizable.test';
import ImageMultiAttributeTest from './ImageTest/ImageMultiAttribute.test';
import ImageEventsTest from './ImageTest/ImageEvents.test';
import ImageOhosMatrix4Test from './ImageTest/ImageOhosMatrix4.test';
import ShapeClippingJsunitTest from './ImageTest/ShapeClippingJsunit.test';
import ImageAdvancedTest from './ImageAdvancedTest/ImageAdvancedTest.test';
import ImageAltTest from './ImageAlt/ImageAltTest.test';
import ImageAnalyzerControllerTest from './ImageAnalyzerControllerTest/ImageAnalyzerController.test';
import ImageAnimationControllerTest from './ImageAnimationControllerTest/ImageAnimationController.test';
import ImageAnimatorFillModeJsunitTest from './ImageAnimator/FillModeJsunit.test';
import ImageAnimatorBasicAttributesTest from './ImageAnimator/ImageAnimatorBasicAttributes.test';
import ImageAnimatorEventDataTest from './ImageAnimator/ImageAnimatorEventData.test';
import monitorInvisibleAreaTest from './ImageAnimator/monitorInvisibleArea.test';
import ImageAnimatorAdvancedTest from './ImageAnimatorAdvancedTest/ImageAnimatorAdvancedTest.test';
import ImageContentEmptyTest from './ImageContentTest/ImageContentEmpty.test';
import ImageContentTransitionEffectTest from './ImageContentTransitionEffectTest/ImageContentTransitionEffect.test';
import ImageOnErrorTest from './ImageErrorTest/ImageOnError.test';
import ImageOnErrorCodeTest from './ImageErrorTest/ImageOnErrorCode.test';
import ImageSvgTest from './ImageSvgTest/ImageSvg.test';
import ImageSvgFillColorTest from './ImageSvgFillColorTest/ImageSvgFillColor.test';
import ImageOrientationTest from './ImageOrientationTest/ImageOrientation.test';
import ImageMatrixTest from './ImageMatrix/ImageMatrix.test';
import ImageHdrBrightnessTest from './ImageHdrBrightnessTest/ImageHdrBrightness.test';
import ImageLoaderTest from './ImageLoaderTest/ImageLoader.test';
import getUIContextApi01 from './ImageGetUIContext/getUIContextApi01.test';
import getUIContextApi02 from './ImageGetUIContext/getUIContextApi02.test';
import getUIContextApi03 from './ImageGetUIContext/getUIContextApi03.test';
import BorderImageTest from './BorderImageTest/BorderImage.test';
import getUIContextApi04 from './ImageGetUIContext/getUIContextApi04.test';
import getUIContextApi05 from './ImageGetUIContext/getUIContextApi05.test';
import getUIContextApi06 from './ImageGetUIContext/getUIContextApi06.test';
import getUIContextApi07 from './ImageGetUIContext/getUIContextApi07.test';
import blendNodeTest from './BlendModeTest/blendNodeTest.test';
import ImageAntialiasedTest from './ImageAntialiasedTest/ImageAntialiased.test';

export default function testsuite() {
  getUIContextApi01();
  getUIContextApi02();
  getUIContextApi03();
  getUIContextApi04();
  getUIContextApi05();
  getUIContextApi06();
  getUIContextApi07();
  APIClipMaskShapeTest();
  AboutToRecycleImageJSTest();
  ImageBasicAttributesTest();
  ImageTextTest();
  ImageDynamicRangeModeTest();
  ImageEnableAnalyzerTest();
  ImageObjectFitTest();
  ImageApiTest();
  ImageAttrTest();
  ImageObscuredTest();
  ImageObjectRepeatTest();
  ImageResizableTest();
  ImageMultiAttributeTest();
  ImageEventsTest();
  ImageOhosMatrix4Test();
  ShapeClippingJsunitTest();
  ImageAdvancedTest();
  ImageAltTest();
  ImageAnalyzerControllerTest();
  ImageAnimationControllerTest();
  ImageAnimatorFillModeJsunitTest();
  ImageAnimatorBasicAttributesTest();
  ImageAnimatorEventDataTest();
  monitorInvisibleAreaTest();
  ImageAnimatorAdvancedTest();
  ImageContentEmptyTest();
  ImageContentTransitionEffectTest();
  ImageOnErrorTest();
  ImageOnErrorCodeTest();
  ImageSvgTest();
  ImageSvgFillColorTest();
  ImageOrientationTest();
  ImageMatrixTest();
  ImageHdrBrightnessTest();
  ImageLoaderTest();
  BorderImageTest();
  blendNodeTest();
  ImageAntialiasedTest();
}