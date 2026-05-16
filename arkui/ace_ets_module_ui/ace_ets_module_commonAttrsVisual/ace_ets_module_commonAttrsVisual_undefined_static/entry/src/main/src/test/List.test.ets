'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import BackgroundColorTest from './backgroundColorTest/backgroundColor.test';
import HueRotateTest from './hueRotateTest/hueRotate.test'
import InvertTest from './invertTest/invert.test'
import SepiaTest from './sepiaTest/sepia.test';
import SaturateTest from './saturateTest/saturate.test'
import ColorBlendTest from './colorBlendTest/colorBlend.test'
import GrayscaleTest from './grayscaleTest/grayscale.test'
import ContrastTest from './contrastTest/contrast.test'
import ContrastModifierTest from './contrastTest/contrastModifier.test'
import BrightnessTest from './brightnessTest/brightness.test'
import OutlineRadiusTest from './outlineRadiusTest/outlineRadius.test'
import OutlineStyleTest from './outlineStyleTest/outlineStyle.test'
import OutlineWidthTest from './outlineWidthTest/outlineWidth.test'
import OutlineColorTest from './outlineColorTest/outlineColor.test'
import OutlineTest from './outlineTest/outline.test'
import OpacityTest from './opacityTest/opacity.test'
import BackgroundEffectTest from './backgroundEffectTest/backgroundEffect.test'
import LinearGradientBlurTest from './linearGradientBlurTest/linearGradientBlur.test'
import ForegroundEffectTest from './foregroundEffectTest/foregroundEffect.test'
import AnimationTest from './animationTest/animation.test'
import RotateTest from './rotateTest/rotate.test'
import BackdropBlurTest from './backdropBlurTest/backdropBlur.test'
import BlendModeTest from './blendModeTest/blendMode.test'
import ClipTest from './clipTest/clip.test'
import BackgroundBrightnessTest from './backgroundBrightnessTest/backgroundBrightness.test'
import LightUpEffectTest from './lightUpEffectTest/lightUpEffect.test'
import LinearGradientTest from './linearGradientTest/linearGradient.test'
import MaskTest from './maskTest/mask.test'
import PixelStretchEffectTest from './pixelStretchEffectTest/pixelStretchEffect.test'
import RadialGradientTest from './radialGradientTest/radialGradient.test'
import RenderFitTest from './renderFitTest/renderFit.test'
import RenderGroupTest from './renderGroupTest/renderGroup.test'
import ScaleTest from './scaleTest/scale.test'
import ShadowTest from './shadowTest/shadow.test'
import SphericalEffectTest from './sphericalEffectTest/sphericalEffect.test'
import SweepGradientTest from './sweepGradientTest/sweepGradient.test'
import TransformTest from './transformTest/transform.test'
import TranslateTest from './translateTest/translate.test'
import UseShadowBatchingTest from './useShadowBatchingTest/useShadowBatching.test'
import BackgroundColorModifierTest from './backgroundColorTest/backgroundColorModifier.test'
import BackgroundEffectModifierTest from './backgroundEffectTest/backgroundEffectModifier.test'
import BackgroundBlurStyleModifierTest from './backgroundBlurStyleTest/backgroundBlurStyleModifier.test'
import BackgroundBlurStyleTest from './backgroundBlurStyleTest/backgroundBlurStyle.test'
import BrightnessModifierTest from './brightnessTest/brightnessModifier.test'
import ColorBlendModifierTest from './colorBlendTest/colorBlendModifier.test'
import ForegroundEffectModifierTest from './foregroundEffectTest/foregroundEffectModifier.test'
import HueRotateModifierTest from './hueRotateTest/hueRotateModifier.test'
import InvertModifierTest from './invertTest/invertModifier.test'
import SepiaModifierTest from './sepiaTest/sepiaModifier.test';
import SaturateModifierTest from './saturateTest/saturateModifier.test'
import GrayscaleModifierTest from './grayscaleTest/grayscaleModifier.test'
import OutlineRadiusModifierTest from './outlineRadiusTest/outlineRadiusModifier.test'
import OutlineStyleModifierTest from './outlineStyleTest/outlineStyleModifier.test'
import OutlineWidthModifierTest from './outlineWidthTest/outlineWidthModifier.test'
import OutlineColorModifierTest from './outlineColorTest/outlineColorModifier.test'
import OutlineModifierTest from './outlineTest/outlineModifier.test'
import OpacityModifierTest from './opacityTest/opacityModifier.test'
import LinearGradientBlurModifierTest from './linearGradientBlurTest/linearGradientBlurModifier.test'
import RotateModifierTest from './rotateTest/rotateModifier.test'
import BackdropBlurModifierTest from './backdropBlurTest/backdropBlurModifier.test'
import BlendModeModifierTest from './blendModeTest/blendModeModifier.test'
import ClipModifierTest from './clipTest/clipModifier.test'
import BackgroundBrightnessModifierTest from './backgroundBrightnessTest/backgroundBrightnessModifier.test'
import LightUpEffectModifierTest from './lightUpEffectTest/lightUpEffectModifier.test'
import LinearGradientModifierTest from './linearGradientTest/linearGradientModifier.test'
import MaskModifierTest from './maskTest/maskModifier.test'
import PixelStretchEffectModifierTest from './pixelStretchEffectTest/pixelStretchEffectModifier.test'
import RadialGradientModifierTest from './radialGradientTest/radialGradientModifier.test'
import RenderFitModifierTest from './renderFitTest/renderFitModifier.test'
import RenderGroupModifierTest from './renderGroupTest/renderGroupModifier.test'
import ScaleModifierTest from './scaleTest/scaleModifier.test'
import ShadowModifierTest from './shadowTest/shadowModifier.test'
import SphericalEffectModifierTest from './sphericalEffectTest/sphericalEffectModifier.test'
import SweepGradientModifierTest from './sweepGradientTest/sweepGradientModifier.test'
import TransformModifierTest from './transformTest/transformModifier.test'
import TranslateModifierTest from './translateTest/translateModifier.test'
import UseShadowBatchingModifierTest from './useShadowBatchingTest/useShadowBatchingModifier.test'
import BlurTest from './blurTest/blur.test'
import BlurModifierTest from './blurTest/blurModifier.test'
import BindSheetTest from './bindSheetTest/bindSheet.test'

export default function testsuite() {
  BlurModifierTest();
  BlurTest();
  BackgroundColorTest();
  BackgroundBlurStyleTest();
  BackgroundBlurStyleModifierTest();
  ContrastTest();
  BrightnessModifierTest();
  ClipModifierTest();
  ColorBlendTest();
  BrightnessTest();
  BackdropBlurTest();
  BlendModeTest();
  ClipTest();
  BackgroundColorModifierTest();
  BackgroundEffectModifierTest();
  ColorBlendModifierTest();
  ContrastModifierTest();
  BackdropBlurModifierTest();
  BlendModeModifierTest();
  ForegroundEffectTest();
  ForegroundEffectModifierTest();
  GrayscaleTest();
  GrayscaleModifierTest();
  HueRotateTest();
  HueRotateModifierTest();
  InvertTest();
  InvertModifierTest();
  LightUpEffectTest();
  LightUpEffectModifierTest();
  LinearGradientBlurTest();
  LinearGradientBlurModifierTest();
  LinearGradientTest();
  LinearGradientModifierTest();
  MaskModifierTest();
  MaskTest();
  OpacityTest();
  OpacityModifierTest();
  OutlineColorTest();
  OutlineColorModifierTest();
  OutlineRadiusTest();
  OutlineRadiusModifierTest();
  OutlineStyleTest();
  OutlineStyleModifierTest();
  OutlineTest();
  OutlineModifierTest();
  OutlineWidthTest();
  OutlineWidthModifierTest();
  PixelStretchEffectTest();
  PixelStretchEffectModifierTest();
  RadialGradientTest();
  RadialGradientModifierTest();
  RenderFitTest();
  RenderFitModifierTest();
  RenderGroupTest();
  RenderGroupModifierTest();
  RotateTest();
  RotateModifierTest();
  SaturateTest();
  SaturateModifierTest();
  ScaleTest();
  ScaleModifierTest();
  SepiaTest();
  SepiaModifierTest();
  ShadowTest();
  ShadowModifierTest();
  SphericalEffectTest();
  SphericalEffectModifierTest();
  SweepGradientTest();
  SweepGradientModifierTest();
  TransformTest();
  TransformModifierTest();
  UseShadowBatchingTest();
  UseShadowBatchingModifierTest();
  BackgroundBrightnessModifierTest();
  BackgroundEffectTest();
  AnimationTest();
  BackgroundBrightnessTest();
  TranslateTest();
  TranslateModifierTest();
  BindSheetTest();
}