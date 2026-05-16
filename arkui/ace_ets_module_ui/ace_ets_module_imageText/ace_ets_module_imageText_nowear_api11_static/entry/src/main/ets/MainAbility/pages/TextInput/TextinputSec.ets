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
  ColumnOptions,
  Margin,
  ResourceStr,
  PasswordIcon,
  Builder,
  Select,
  TextAreaController,
  TextInputController,
  TextInput,
  FontStyle,
  InputType,
  $r,
  BarState,
  TextInputStyle
} from '@ohos.arkui.component'
import {
  State,StoragePropRef
} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog';

@Entry
@Component
struct Index {

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }

  @State errFlag: boolean = false
  @State onIconFlag: boolean = false
  @State offIconFlag: boolean = false
  @StoragePropRef('passwordIcon') passwordIcon: PasswordIcon|undefined = {
    onIconSrc: "",
    offIconSrc: ""
  } as PasswordIcon
  @StoragePropRef('showUnderline') showUnderline: boolean|undefined = undefined
  @StoragePropRef('showError') showError: ResourceStr | undefined = ''
  @Builder
  ShowUnit() {
    Column() {
      Select([{ value: 'aaa', icon: "/common/1.png" },
        { value: 'bbb', icon: "/common/2.png" },
        { value: 'ccc', icon: "/common/3.png" },
        { value: 'ddd', icon: "/common/4.png" }])
        .selected(2)
        .value('TTT')
        .font({ size: 30, weight: 400, family: 'serif', style: FontStyle.Normal })
        .selectedOptionFont({ size: 40, weight: 500, family: 'serif', style: FontStyle.Normal })
        .optionFont({ size: 30, weight: 400, family: 'serif', style: FontStyle.Normal })
        .onSelect((index: int) :void=> {
          console.info("Select:" + index)
        })
    }
  }

  @State text: string = 'Hello World'
  controller: TextInputController = new TextInputController();

  build() {
    Column({ space: 5 } as ColumnOptions) {
      TextInput({ text: 'input your password...' })
        .key("TextInput")
        .width(400)
        .height(40)
        .margin(20)
        .maxLength(5)
        .type(InputType.Password)
        .showUnderline(this.showUnderline)
        .showError(this.showError)
        .passwordIcon(this.passwordIcon)
      TextInput({ text: 'input your password...' })
        .key("TextInputResources")
        .width(400)
        .height(40)
        .margin(20)
        .showUnit((): void => this.ShowUnit())
        .showError($r("app.string.TextInput_ShowError_test"))
      TextInput({ text: 'input your password...' })
        .key("TextInputNO")
        .width(400)
        .height(40)
        .margin(20)

      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Off)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0100")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Auto)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0200")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.On)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0300")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Off)
        .barState(BarState.Auto)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0400")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Off)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0500")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Auto)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0600")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Auto)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0700")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Auto)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0800")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(undefined)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0900")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(undefined)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_1000")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.On)
        .barState(undefined)
        .key("ArkUX_Stage_TextInput_barState_1100")
        .style(TextInputStyle.Inline)
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(undefined)
        .barState(BarState.On)
        .key("ArkUX_Stage_TextInput_barState_1200")
        .style(TextInputStyle.Inline)
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(TextInputStyle.Inline)
        .key("TextInputInlineNO")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.On)
        .maxLines(10)
        .style(TextInputStyle.Default)
        .key("TextInputStyleDefault")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .maxLines(10)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_maxLines_0100")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .maxLines(0)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_maxLines_0200")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_maxLines_0300")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .maxLines(-5)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_maxLines_0400")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_maxLines_0500")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .maxLines(undefined)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_maxLines_0600")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .maxLines(undefined)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_maxLines_0700")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .maxLines(1)
        .maxLines(10)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_maxLines_0800")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .maxLines(10)
        .maxLines(undefined)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_maxLines_0900")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .maxLines(undefined)
        .maxLines(10)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_maxLines_1000")


    }.width('100%')
    .margin({ top: 5 } as Margin)
  }
}