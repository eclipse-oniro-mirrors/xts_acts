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
import WindowLifeCycleTest from "./WindowLifeCycle.test";
import WindowLayoutTest from "./WindowLayout.test";
import WindowImmersiveTest from "./WindowImmersive.test";
import WindowModalTest from "./WindowModal.test";
import WindowZindexTest from "./WindowZindex.test";
import WindowTitleTest from "./WindowTitle.test";
import WindowOrientationTest from "./WindowOrientation.test";
import WindowPropertiesTest from "./WindowProperties.test";
import WindowPCTest from "./WindowPC.test";
import WindowKeyBoardTest from "./WindowKeyBoard.test";
import WindowFocusTest from "./WindowFocus.test";
export default function testsuite() {
  WindowLifeCycleTest();
  WindowImmersiveTest();
  WindowLayoutTest();
  WindowModalTest();
  WindowZindexTest();
  WindowTitleTest();
  WindowOrientationTest();
  WindowPropertiesTest();
  WindowPCTest();
  WindowKeyBoardTest();
  WindowFocusTest();
}