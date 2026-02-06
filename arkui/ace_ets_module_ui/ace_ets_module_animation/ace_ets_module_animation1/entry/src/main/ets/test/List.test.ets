/**
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

import FrameNodeAnimation from './FrameNodeAnimation.test'
import ParticleEmitter from './ParticleEmitter.test'
import Vector2TTest from './Vector2TTest.test'
import FrameNodeAnimationPage from './FrameNodeAnimationPage.test'
import TestSweepGradientOptions from './TestSweepGradientOptions.test'
import TransitionEdgeTest from './TransitionEdgeTest.test'
import ExpectedFrameRateRange from './AnimatorResultTest/ExpectedFrameRateRange.test'
import setExpectedFrameRateRangeTest from './AnimatorResultTest/setExpectedFrameRateRangeTest.test'
import AnimatorResultTest from './AnimatorResultTest/AnimatorResultTest.test'
import animateToTest from './AnimatorResultTest/animateToTest.test'
import SymbolGlyphTest from './SymbolGlyphTest/SymbolGlyphTest.test'
import ParticleAnimatorTest from './Particle/ParticleAnimatorTest.test'
import ParticleAttributeTest from './Particle/ParticleAttributeTest.test'
import ParticleJsunit from './ParticleTest/ParticlePropertyJsunit.test'
import MotionPathJsunit from './MotionPathJsunit.test';
import geometryTransition from './geometryTransitionTest/geometryTransition.test';
import animateToJunits from './Animateto.test';
import animationCurveTest from './AnimationCurve.test';
import geometryTransitionJsunit from './geometryTransitionTest/GeometryTransitionJsunit.test';
import animatorOnframeJsunit from './Animation/animator.test';
import remoteWindowJsunit from './RemoteWindowTest/remoteWindow.test'
import AnimationJsunit from './AnimationTest/AnimationJsunit.test';
import animateJsunit from './AnimationTest/AnimateJsunit.test';
import animationStatusJsunit from './AnimationTest/AnimationStatusJsunit.test';
import pageTransitionJsunit from './Animation/PageTransitionJsunit.test';
import curvesJsunit from './CurvesJsunit.test';
import WorkerUseCurvesTest from './WorkerUseCurves.test';
import MotionPathExample from './MotionPathExample.test';
import animationAdd from './Animation/animationAdd.test';
import playModeTest from './PlayModeJsunit.test';
import stageAnimatorTest from './StageAnimator.test';
import RippleFields from './Particle/RippleFields.test';
import VelocityFields from './Particle/VelocityFields.test';
import UIContextAnimateToImmediately from './AnimatorResultTest/UIContextAnimateToImmediately.test'
import StepsCurveComponent from './StepsCurveComponent.test';
import CurvesSpringMotion from './CurvesSpringMotion.test';
import AnimatorEase from './Animation/AnimatorEase.test';
import ExcludeFromRenderGroupDemo from './ExcludeFromRenderGroupDemo.test';

export default function testsuite() {
  animateJsunit();
  FrameNodeAnimation();
  ParticleEmitter();
  Vector2TTest();
  FrameNodeAnimationPage();
  TestSweepGradientOptions();
  TransitionEdgeTest();
  AnimatorResultTest();
  setExpectedFrameRateRangeTest();
  animateToTest();
  SymbolGlyphTest();
  ParticleAnimatorTest();
  ParticleAttributeTest();
  ParticleJsunit();
  animateToJunits();
  animationCurveTest();
  geometryTransition()
  geometryTransitionJsunit()
  animatorOnframeJsunit()
  remoteWindowJsunit()
  AnimationJsunit();
  animationStatusJsunit();
  curvesJsunit();
  pageTransitionJsunit();
  WorkerUseCurvesTest();
  MotionPathExample();
  animationAdd();
  MotionPathJsunit();
  ExpectedFrameRateRange();
  playModeTest();
  stageAnimatorTest();
  RippleFields();
  VelocityFields();
  UIContextAnimateToImmediately();
  StepsCurveComponent();
  CurvesSpringMotion();
  AnimatorEase();
  ExcludeFromRenderGroupDemo();
}