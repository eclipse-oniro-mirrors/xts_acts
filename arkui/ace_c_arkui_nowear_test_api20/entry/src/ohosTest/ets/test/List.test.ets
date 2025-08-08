/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import buttonGetTypeTest from './button/ButtonGetTypeTest.test'
import focusWrapModeTest from './grid/FocusWrapModeTest.test'
import dragEventGetDisplayIdTest from './dragEventTest/dragEventGetDisplayId.test'
import dragEventGetDragSourceTest from './dragEventTest/dragEventGetDragSource.test'
import enableDropDisallowedBadgeTest from './dropBadge/enableDropDisallowedBadge.test'
import dialogGetStateTest from './dialog/DialogGetStateTest.test'
import RenderNodeTest from "./renderNode/RenderNodeTest.test"
import RenderNodeUtilsTest from "./renderNodeUtils/renderNodeUtils.test"
import RenderNodeAttributeTest from "./renderNode/TestRenderNodeAttribute.test"

export default function testsuite() {
  enableDropDisallowedBadgeTest();
  buttonGetTypeTest();
  focusWrapModeTest();
  dragEventGetDisplayIdTest();
  dragEventGetDragSourceTest();
  dialogGetStateTest();
  RenderNodeTest();
  RenderNodeUtilsTest();
  RenderNodeAttributeTest();
}
