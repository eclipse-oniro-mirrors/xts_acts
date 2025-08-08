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
import windowOrientation from './windowOrientation.test'
import windowFocus from './windowFocus.test'
import windowEvent from './windowEvent.test'
import windowInput from './windowInput.test'
import windowLayout from './windowLayout.test'
import windowLevel from './windowLevel.test'
import specialWindow from './specialWindow.test'

export default function testsuite() {
  windowOrientation(globalThis.abilityContext,globalThis.windowStage)
  windowFocus(globalThis.abilityContext,globalThis.windowStage)
  windowEvent(globalThis.abilityContext,globalThis.windowStage)
  windowLayout(globalThis.abilityContext,globalThis.windowStage)
  windowLevel(globalThis.abilityContext,globalThis.windowStage)
  specialWindow(globalThis.abilityContext,globalThis.windowStage)
  windowInput(globalThis.abilityContext,globalThis.windowStage)
}