/**
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
import rotateAngleOptionsTest from './transformation/RotateAngleOptions.test';
import gradientDirectionJsunit from './GradientDirectionJsunit.test';
import useShadowBatching from './UseShadowBatching.test';
import colorGradientJsunit from './ColorGradientJsunit.test';
import transFormJsunit from './TransFormJsunit.test';
import resourceColor from './ResourceColor.test';
import setCircleShapeTest from './SetCircleShape.test';
import backgroundBlurStyleTest from './background/backgroundBlurStyle.test'
import backgroundEffectTest from './background/backgroundEffect.test'
import backgroundImageOption from './background/backgroundImageOption.test'
import backgroundImageResizableTest from './backgroundImageTest/backgroundImageResizable.test';
import foregroundEffect from './ForegroundEffect.test'
import systemBarEffectTest from './ImageEffectTest/systemBarEffect1.test'
import freezeTest from './ImageEffectTest/freeze.test'
import fractionStops from './ImageEffectTest/fractionStops.test'
import backgroundBrightness from './backgroundImageTest/backgroundBrightness.test';
import visualEffectTest from './visualEffectTest/visualEffect.test'
import motionBlurTest from './visualEffectTest/motionBlur.test'
import imageEffectsJsunit from './imageEffectsTest/ImageEffectsJsunit.test';
import backgroundEffectJsunit from './imageEffectsTest/backgroundEffect.test';
import blendMode1Jsunit from './imageEffectsTest/blendMode1.test'
import blendModeTest from './imageEffectsTest/blendModeTest.test';
import backgroundEffectJsSuit from './imageEffectsTest/backgroundEffectJsSuit.test';
import InvertOptionsJsSuit from './imageEffectsTest/InvertOptionsJsSuit.test';
import ForegroundColorJsSuit from './imageEffectsTest/ForegroundColorJsSuit.test';
import sheetSize1Jsunit from './imageEffectsTest/sheetSize1.test'
import clickeffectTest from './clickeffectTest/clickeffect'
import commonColorModeJsunit from './imageEffectsTest/common.test';
import enumsCancelJsunit from './imageEffectsTest/enums.test';
import hoverEffectJsunit from './imageEffectsTest/hoverEffect.test';
import hitTestModeJsunit from './imageEffectsTest/hitTestMode.test';
import transformPointTest from './imageEffectsTest/transformPointTest.test';
import commonBackgroundBlurStyleJsunit from './imageEffectsTest/common.test3';
import common_ts_ets_apiStaticClearJsunit from './imageEffectsTest/common_ts_ets_api.test';
import rotateTest from './imageEffectsTest/rotateTest.test';
import shapeTest from './imageEffectsTest/shapeTest.test';
import EdgeOutlineWidthsPage from './EdgeOutlineWidthsPage.test';
import OpacityTest from './OpacityTest.test';
import LinearGradientBlurTest from './LinearGradientBlurTest.test'
import ContrastTest from './ContrastTest.test'
import RectShapePage from './RectShapePage.test'
import MaterialFilter from './MaterialFilter.test'
import TransitionEffectOpacity from './TransitionEffectOpacity.test'

export default function testsuite() {
  rotateAngleOptionsTest()
  gradientDirectionJsunit()
  useShadowBatching()
  resourceColor()
  setCircleShapeTest()
  backgroundBlurStyleTest();
  backgroundEffectTest();
  backgroundImageOption();
  backgroundImageResizableTest();
  foregroundEffect();
  systemBarEffectTest();
  freezeTest();
  fractionStops()
  backgroundBrightness()
  visualEffectTest();
  motionBlurTest();
  imageEffectsJsunit();
  backgroundEffectJsunit();
  blendModeTest();
  backgroundEffectJsSuit();
  InvertOptionsJsSuit();
  ForegroundColorJsSuit();
  sheetSize1Jsunit()
  clickeffectTest();
  commonColorModeJsunit()
  hoverEffectJsunit()
  hitTestModeJsunit()
  transformPointTest()
  commonBackgroundBlurStyleJsunit()
  common_ts_ets_apiStaticClearJsunit()
  rotateTest()
  shapeTest()
  EdgeOutlineWidthsPage()
  OpacityTest()
  LinearGradientBlurTest()
  ContrastTest()
  RectShapePage()
  MaterialFilter()
  TransitionEffectOpacity()
}