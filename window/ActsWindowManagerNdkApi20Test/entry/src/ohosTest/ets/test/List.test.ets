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

import DisplayManagerErrorCodeTest from './display/DisplayManagerErrorCodeTest.test'
import NativeDisplayManagerTest from './display/NativeDisplayManagerTest.test'
import DisplayManagerTest from './displaymanagertest/DisplayManager.test'
import DisplayTest from './windowmanager/Display.test'
import WindowTest from './windowmanager/Window.test'
import WindowPipTest from './windowmanager/WindowPip.test'
import ArkUINdkTest from './ArkUINdkTest.test'

export default function testsuite() {
  WindowTest()
  WindowPipTest()
  DisplayTest()
  DisplayManagerTest()
  NativeDisplayManagerTest()
  DisplayManagerErrorCodeTest()
  ArkUINdkTest()
}
