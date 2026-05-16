/*
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
import matrix4Test from './matrix4/Matrix4Test.test'
import errorCodeTest from './matrix4/ErrorCodeTest.test'
import EnableClickSoundEffectTest from './enableClickSoundEffect/EnableClickSoundEffectTest.test'
import EllipsisModeCenterTest from './ellipsisModeTest/ellipsisModeCenter.test'
import EllipsisModeStartTest from './ellipsisModeTest/ellipsisModeStart.test'
import arkuiNativeCapiDragAndDrop from './arkui_native/ArkUICapiGenerated_drag_and_drop.test'
import arkuiNativeCapiDrawableDescriptor from './arkui_native/ArkUICapiGenerated_drawable_descriptor.test'
import arkuiNativeCapiNativeInterfaceA11y from './arkui_native/ArkUICapiGenerated_native_interface_a11y.test'
import arkuiNativeCapiNativeNode from './arkui_native/ArkUICapiGenerated_native_node.test'
import arkuiNativeCapiNativeType from './arkui_native/ArkUICapiGenerated_native_type.test'
import arkuiNativeCapiStyledString from './arkui_native/ArkUICapiGenerated_styled_string.test'
import arkuiNativeCapiUiInputEvent from './arkui_native/ArkUICapiGenerated_ui_input_event.test'
import PointerEventGetCurrentLocalTest from './pointerEventGetCurrentLocal/PointerEventGetCurrentLocalTest.test'
import TextGetCharacterTest from './TextGetCharacter/TextGetCharacterTest.test'
import CrossLanguageOptionsSupportFiveMethodsTest from './FrameNode/CrossLanguageOptionsSupportFiveMethodsTest.test'

export default function testsuite() {
  matrix4Test();
  errorCodeTest();
  EnableClickSoundEffectTest();
  EllipsisModeCenterTest();
  EllipsisModeStartTest()
  arkuiNativeCapiDragAndDrop();
  arkuiNativeCapiDrawableDescriptor();
  arkuiNativeCapiNativeInterfaceA11y();
  arkuiNativeCapiNativeNode();
  arkuiNativeCapiNativeType();
  arkuiNativeCapiStyledString();
  arkuiNativeCapiUiInputEvent();
  PointerEventGetCurrentLocalTest();
  TextGetCharacterTest();
  CrossLanguageOptionsSupportFiveMethodsTest();
}