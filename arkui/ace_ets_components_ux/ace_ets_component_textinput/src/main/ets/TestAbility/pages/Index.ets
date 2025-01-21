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
// @ts-nocheck
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../test/List.test'

@Entry
@Component
struct textInputTest {
  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_0100")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition(3)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_0200")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition(0)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_0300")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition(7)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_0400")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition("7")
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_0500")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition($r("app.string.textInput_Size_test"))
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_0600")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition(100)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_0700")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition("")
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_0800")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition(-1)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_0900")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition(null)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_1000")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition(undefined)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_1100")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition(7)
          .caretPosition(3)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_1200")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition(7)
          .caretPosition(undefined)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_1300")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition(7)
          .position(null)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "To display string text for extra long To display string text for extra long ",
          controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretPosition_1400")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretPosition(70)
          .margin(20)
          .fontSize(20)
          .fontColor(Color.Black)
          .style(TextInputStyle.Default)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_0100")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: 0 })
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_0200")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: 7 })
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_0300")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: "7vp" })
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_0400")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: $r("app.string.textInput_Size_test") })
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_0500")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: -1 })
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_0600")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: "" })
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_0700")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: null })
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_0800")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: undefined })
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_0900")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: "asff%6&" })
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_1000")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: 7 })
          .caretStyle({ width: "2fp" })
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_1100")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: 7 })
          .caretStyle({ width: undefined })
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_CaretWidth_1200")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .caretStyle({ width: "7lpx" })
          .margin(20)
          .fontSize(14)
          .width(null)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_0100")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .selectedBackgroundColor(0x00ff00)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_0200")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .selectedBackgroundColor("#fffd0000")
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_0300")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .selectedBackgroundColor('rgb(138,43,226)')
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_0400")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .selectedBackgroundColor(Color.Pink)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_0500")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .selectedBackgroundColor($r("app.color.TextInput_Color"))
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_0600")
          .placeholderColor(Color.Grey)
          .backgroundColor($r("sys.color.ohos_id_color_text_highlight_bg"))
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .selectedBackgroundColor("")
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_0700")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .backgroundColor($r("sys.color.ohos_id_color_text_highlight_bg"))
          .caretColor(Color.Blue)
          .selectedBackgroundColor(null)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_0800")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .backgroundColor($r("sys.color.ohos_id_color_text_highlight_bg"))
          .caretColor(Color.Blue)
          .selectedBackgroundColor(undefined)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_0900")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .selectedBackgroundColor(Color.Pink)
          .selectedBackgroundColor("#FFFD0000")
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_1000")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .backgroundColor($r("sys.color.ohos_id_color_text_highlight_bg"))
          .caretColor(Color.Blue)
          .selectedBackgroundColor(Color.Pink)
          .selectedBackgroundColor(undefined)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_1100")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .selectedBackgroundColor(0x00ff00)
          .backgroundColor(null)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_1200")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .selectedBackgroundColor(0x00ff00)
          .caretStyle({ width: 7 })
          .caretPosition(4)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
        TextInput({ text: "input your word...", controller: this.controller })
          .key("ArkUX_Stage_TextInput_selectedColor_1300")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .backgroundColor($r("sys.color.ohos_id_color_text_highlight_bg"))
          .caretColor(Color.Blue)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
