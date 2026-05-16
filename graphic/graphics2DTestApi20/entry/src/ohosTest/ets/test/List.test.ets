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

import BrushPointRecordTest from './BrushPointRecordTest.test'
import CanvasPenTest from './CanvasPenTest.test.ets'
import RectFontTest from './RectFontTest.test.ets'
import EffectTest from './EffectTest.test.ets'
import BufferTextTest from './BufferTextTest.test.ets'
import ColorSpaceNameTest from './ColorSpaceNameTest.test.ets'
import NativeBufferColorSpaceTest from './NativeBufferTest.test'
import ExternalWindowTest from './ExternalWindowTest.test'
import ErrorCodeTest from './ErrorCodeTest.test.ets'
import VSyncFenceTest from './VSyncFenceTest.test.ets'
import EffectShareTest from './EffectShareTest.test.ets'
import ErrorCodeWindowTest from './ErrorCodeWindowTest.test.ets'
import TypographyTest from './TypographyTest.test.ets'

export default function testsuite() {
  BrushPointRecordTest()
  CanvasPenTest()
  RectFontTest()
  EffectTest()
  BufferTextTest()
  ColorSpaceNameTest()
  NativeBufferColorSpaceTest()
  ExternalWindowTest()
  ErrorCodeTest()
  VSyncFenceTest()
  EffectShareTest()
  ErrorCodeWindowTest()
  TypographyTest()
}