'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Content } from '@ohos.arkui.node'

export class LibUtil {
  static {
    loadLibrary("entry");
  }
  native testCustomDialog001() : number;
  native testCustomDialog002() : number;
  native testCustomDialogWidth() : number;
  native testCustomDialogHeight() : number;
  native testCustomDialogBorderWidth() : number;
  native testCustomDialogBorderColor() : number;
  native testCustomDialogBorderStyle() : number;
  native testCustomDialogShadow() : number;
  native testCustomDialogCustomShadow() : number;
  native testCustomDialogBackgroundBlurStyle() : number;
  native testCustomDialogKeyboardAvoidMode() : number;
  native testCustomDialogEnableHoverMode() : number;
  native testCustomDialogHoverModeArea() : number;
  native testCustomDialogLevelMode() : number;
  native testCustomDialogLevelUniqueId() : number;
  native testCustomDialogImmersiveMode() : number;
  native testCustomDialogBackgroundColor() : number;
  native testCustomDialogCornerRadius() : number;
  native testCustomModalMode() : number;
  native testCustomAutoCancel() : number;
  native testCustomMask() : number;
  native testTextPickerRange(a: Content):void;
  native textPickerEnableHapticFeedback(a: Content):void // c侧没有实现方法

  native CustomDialogTest1(a: Content):void;
}