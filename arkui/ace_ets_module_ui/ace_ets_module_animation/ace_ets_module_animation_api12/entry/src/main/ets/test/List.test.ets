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

import setExpectedFrameRateRangeTest from './AnimatorResultTest/setExpectedFrameRateRangeTest.test'
import AnimatorResultTest from './AnimatorResultTest/AnimatorResultTest.test'
import setPolyToPoly from './setPolyToPoly.test'
import SymbolGlyphTest from './SymbolGlyphTest/SymbolGlyphTest.test'
import ParticleTest from './ParticleTest/ParticleTest.test'
import ParticleAnimatorTest from './Particle/ParticleAnimatorTest.test'
import APIParticleEmitter from './APIParticleEmitter.test'
import animateToTest from './AnimatorResultTest/animateToTest.test'
import ParticleAttributeTest from './Particle/ParticleAttributeTest.test'
import CurvePage from './CurvePage.test'
import SimpleAnimatorOptionsPage from './SimpleAnimatorOptionsPage.test'
import Blur from './Blur.test'
import ParticlePage from './Particle.test'
import ParticleModifierTest from './ParticleModifierTest.test'
import ParticleShapePage from './ParticleShapePage.test'


export default function testsuite() {
  AnimatorResultTest()
  setExpectedFrameRateRangeTest()
  setPolyToPoly();
  SymbolGlyphTest();
  ParticleTest();
  ParticleAnimatorTest();
  APIParticleEmitter();
  animateToTest();
  ParticleAttributeTest();
  CurvePage();
  SimpleAnimatorOptionsPage();
  Blur();
  ParticlePage();
  ParticleModifierTest();
  ParticleShapePage();
}