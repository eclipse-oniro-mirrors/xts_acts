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
import hilog from '@ohos.hilog';
import events_emitter from '@ohos.events.emitter';

function asNumber(val: string | number | null | undefined) {
  return val as number;
}
function asBoolean(value: string | number | boolean | null | undefined) {
  return value as boolean;
}
function asResourceStr(value: string | number | boolean | null | undefined) {
  return value as ResourceStr;
}

@Entry
@Component
struct Index {
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info("key==>pages res : onPageShow")
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("key==> page valueChangeCallBack");
    if (eventData.data?.type == "TextNum") {
      console.info("valueChangeCallBack TextNum:" + JSON.stringify(eventData));
      this.flag = true
      this.isNum = true
      this.textNum = Number(eventData.data?.text)
    }
    if (eventData.data?.type == "TextStr") {
      console.info("valueChangeCallBack TextStr:" + JSON.stringify(eventData));
      this.flag = true
      this.isNum = false
      this.textStr = eventData.data?.text
    }
    if (eventData.data?.type == "TextErr" && eventData.data?.text == "null") {
      console.info("valueChangeCallBack TextNull:" + JSON.stringify(eventData));
      this.flag = false
      this.isNull = true
    }
    if (eventData.data?.type == "TextErr" && eventData.data?.text == "undefined") {
      console.info("valueChangeCallBack TextErr:" + JSON.stringify(eventData));
      this.flag = false
      this.isNull = false
    }


    if (eventData.data?.type == "BoolTrue") {
      console.info("valueChangeCallBack TextAreaShowCounterTrue:" + JSON.stringify(eventData));
      this.boolFlag = true
      this.bool = true
    }
    if (eventData.data?.type == "BoolFalse") {
      console.info("valueChangeCallBack TextAreaShowCounterTrue:" + JSON.stringify(eventData));
      this.boolFlag = true
      this.bool = false
    }
    if (eventData.data?.type == "BoolErrNum") {
      console.info("valueChangeCallBack TextAreaMaxLengthStr:" + JSON.stringify(eventData));
      this.boolFlag = false
      this.boolIsNum = true
      this.boolNum = Number(eventData.data?.text)
    }
    if (eventData.data?.type == "BoolErrStr") {
      console.info("valueChangeCallBack TextAreaMaxLengthStr:" + JSON.stringify(eventData));
      this.boolFlag = false
      this.boolIsNum = false
      this.boolIsStr = true
      this.boolStr = eventData.data?.text
    }
    if (eventData.data?.type == "BoolErrNull") {
      console.info("valueChangeCallBack TextAreaMaxLengthStr:" + JSON.stringify(eventData));
      this.boolFlag = false
      this.boolIsNum = false
      this.boolIsStr = false
      this.boolIsNull = true
    }
    if (eventData.data?.type == "BoolErrUndefined") {
      console.info("valueChangeCallBack TextAreaMaxLengthStr:" + JSON.stringify(eventData));
      this.boolFlag = false
      this.boolIsNum = false
      this.boolIsStr = false
      this.boolIsNull = false
    }
    if (eventData.data?.type == "passWordIcon") {
      console.info("valueChangeCallBack ResourceIcon:" + JSON.stringify(eventData));
      this.passwordIcon = JSON.parse(eventData.data?.icon)
    }

  }

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }

  @State flag: boolean = false
  @State isNum: boolean = false
  @State isNull: boolean = false
  @State errFlag: boolean = false
  @State textNum: number = 2
  @State textStr: string = ''
  @State boolFlag: boolean = false
  @State bool: boolean = false
  @State boolIsNum: boolean = false
  @State boolIsStr: boolean = false
  @State boolIsNull: boolean = false
  @State boolNum: number = 2
  @State boolStr: string = ''
  @State onIconFlag: boolean = false
  @State offIconFlag: boolean = false
  @State passwordIcon: PasswordIcon = {
    onIconSrc: "",
    offIconSrc: ""
  }

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
        .onSelect((index: number) => {
          console.info("Select:" + index)
        })
    }
  }

  @State text: string = 'Hello World'
  controller: TextAreaController = new TextAreaController()

  build() {
    Column({ space: 5 }) {
      TextInput({ text: 'input your password...' })
        .key("TextInput")
        .width(400)
        .height(40)
        .margin(20)
        .maxLength(5)
        .type(InputType.Password)
        .showUnderline(asBoolean(this.boolFlag ? this.bool : (this.boolIsNum ? this.boolNum : (this.boolIsStr ? this.boolStr : (this.boolIsNull ? null : undefined)))))
        .showError(asResourceStr(this.flag ? (this.isNum ? this.textNum : this.textStr) : (this.isNull ? null : undefined)))
        .passwordIcon(this.passwordIcon)
      TextInput({ text: 'input your password...' })
        .key("TextInputResources")
        .width(400)
        .height(40)
        .margin(20)
        .showUnit(this.ShowUnit.bind(this))
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
        .barState(0)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0500")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(10)
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0600")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(asNumber("sfasf"))
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0700")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(asNumber(""))
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_barState_0800")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(null)
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
        .maxLines(asNumber("123"))
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
        .maxLines(asNumber(""))
        .style(TextInputStyle.Inline)
        .key("ArkUX_Stage_TextInput_maxLines_0500")
      TextInput({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .maxLines(null)
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
    .margin({ top: 5 })
  }
}