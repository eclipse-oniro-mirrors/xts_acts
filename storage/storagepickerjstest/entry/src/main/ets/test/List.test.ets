/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import photoPickerCallback from './photoPickerCallback.test.ets'
import photoPickerPromise from './photoPickerPromise.test.ets'
import documentPickerCallback from './documentPickerCallback.test.ets'
import documentPickerPromise from './documentPickerPromise.test.ets'
import audioPickerCallback from './audioPickerCallback.test.ets'
import audioPickerPromise from './audioPickerPromise.test.ets'
export default function testsuite() {
  photoPickerCallback(globalThis.abilityContext)
  photoPickerPromise(globalThis.abilityContext)
  documentPickerCallback(globalThis.abilityContext)
  documentPickerPromise(globalThis.abilityContext)
  audioPickerCallback(globalThis.abilityContext)
  audioPickerPromise(globalThis.abilityContext)
}