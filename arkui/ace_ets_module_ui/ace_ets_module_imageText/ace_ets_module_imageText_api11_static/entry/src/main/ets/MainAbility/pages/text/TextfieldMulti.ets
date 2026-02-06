'use static';
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
import {
  Entry,
  Component,
  Column,
  Button,
  $r,
  TextInputController,
  TextInput,
  CancelButtonOptions,
  CancelButtonStyle,
  IconOptions,
  Color
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextfieldMulti {


  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      Button("Password")

      TextInput({ placeholder: 'input ...', controller: this.controller })
        .key("ArkUX_Text_Visual_static_0110")
        .width(380)
        .height(60)
        .cancelButton({
          style: CancelButtonStyle.CONSTANT,
          icon: {
            size: 45,
            src: $r('app.media.icon'),
            color: Color.Blue
          } as IconOptions
        } as CancelButtonOptions)

      TextInput({ placeholder: 'input ...', controller: this.controller })
        .key("ArkUX_Text_Visual_static_0120")
        .width(380)
        .height(60)
        .cancelButton({
          style: CancelButtonStyle.INVISIBLE,
          icon: {
            size: 60,
            src: $r('app.media.icon'),
            color: Color.Green
          } as IconOptions
        }as CancelButtonOptions)

      TextInput({ placeholder: 'input ...', controller: this.controller })
        .key("ArkUX_Text_Visual_static_0130")
        .width(380)
        .height(60)
        .cancelButton({
          style: CancelButtonStyle.INPUT,
          icon: {
            size: 70,
            src: $r('app.media.icon'),
            color: Color.White
          } as IconOptions
        }as CancelButtonOptions)

      TextInput({ placeholder: 'input ...', controller: this.controller })
        .key("ArkUX_Text_Visual_static_0140")
        .width(380)
        .height(60)
        .cancelButton({}as CancelButtonOptions)
    }
  }
}