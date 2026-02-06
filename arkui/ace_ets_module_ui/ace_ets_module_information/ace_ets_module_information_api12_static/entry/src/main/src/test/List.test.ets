'use static';
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
import gauge from './Gauge/gauge.test'
import PatternLockActivateCircleStyle1 from './PatternLockTest/PatternLockActivateCircleStyle1.test'
import progress from './progressTest/progress.test'
import ProgressMask from './progressTest/ProgressMask.test'
import BounceSymbolEffect_APITest from './SymbolGlyphTest/SymbolGlyph_APITest/BounceSymbolEffect_APITest'
import ReplaceSymbolEffect_APITest from './SymbolGlyphTest/SymbolGlyph_APITest/ReplaceSymbolEffect_APITest'
import ACTION_FIRST_APITest from './TabsTest/AnimationMode_APITest/ACTION_FIRST_APITest'
import CONTENT_FIRST_APITest from './TabsTest/AnimationMode_APITest/CONTENT_FIRST_APITest'
import NO_ANIMATION_APITest from './TabsTest/AnimationMode_APITest/NO_ANIMATION_APITest'
export default function testsuite() {
  gauge()
  PatternLockActivateCircleStyle1()
  progress()
  ProgressMask()
  BounceSymbolEffect_APITest()
  ReplaceSymbolEffect_APITest()
  ACTION_FIRST_APITest()
  CONTENT_FIRST_APITest()
  NO_ANIMATION_APITest()

}