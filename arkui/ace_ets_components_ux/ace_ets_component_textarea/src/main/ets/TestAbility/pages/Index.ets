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
import hilog from '@ohos.hilog';
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';

@Entry
@Component
struct Index {
  onPageShow() {
    let valueChangeEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info("key==>pages res : onPageShow")
  }

  private valueChangeCallBack = (eventData) => {
    console.info("key==> page valueChangeCallBack");
    if(eventData.data.type == "TextNum"){
      console.info("valueChangeCallBack TextNum:"+   JSON.stringify(eventData));
      this.flag = true
      this.isNum = true
      this.textNum = Number(eventData.data.text)
    }
    if(eventData.data.type == "TextStr"){
      console.info("valueChangeCallBack TextStr:"+   JSON.stringify(eventData));
      this.flag = true
      this.isNum = false
      this.textStr = eventData.data.text
    }
    if(eventData.data.type == "TextErr" && eventData.data.text == "null"){
      console.info("valueChangeCallBack TextNull:"+   JSON.stringify(eventData));
      this.flag = false
      this.isNull = true
    }
    if(eventData.data.type == "TextErr" && eventData.data.text == "undefined"){
      console.info("valueChangeCallBack TextErr:"+   JSON.stringify(eventData));
      this.flag = false
      this.isNull = false
    }


    if(eventData.data.type == "BoolTrue"){
      console.info("valueChangeCallBack TextAreaShowCounterTrue:"+   JSON.stringify(eventData));
      this.boolFlag = true
      this.bool = true
    }
    if(eventData.data.type == "BoolFalse"){
      console.info("valueChangeCallBack TextAreaShowCounterTrue:"+   JSON.stringify(eventData));
      this.boolFlag = true
      this.bool = false
    }
    if(eventData.data.type == "BoolErrNum"){
      console.info("valueChangeCallBack TextAreaMaxLengthStr:"+   JSON.stringify(eventData));
      this.boolFlag = false
      this.boolIsNum = true
      this.boolNum = Number(eventData.data.text)
    }
    if(eventData.data.type == "BoolErrStr"){
      console.info("valueChangeCallBack TextAreaMaxLengthStr:"+   JSON.stringify(eventData));
      this.boolFlag = false
      this.boolIsNum = false
      this.boolIsStr = true
      this.boolStr = eventData.data.text
    }
    if(eventData.data.type == "BoolErrNull"){
      console.info("valueChangeCallBack TextAreaMaxLengthStr:"+   JSON.stringify(eventData));
      this.boolFlag = false
      this.boolIsNum = false
      this.boolIsStr = false
      this.boolIsNull = true
    }
    if(eventData.data.type == "BoolErrUndefined"){
      console.info("valueChangeCallBack TextAreaMaxLengthStr:"+   JSON.stringify(eventData));
      this.boolFlag = false
      this.boolIsNum = false
      this.boolIsStr = false
      this.boolIsNull = false
    }

  }

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
    var abilityDelegator: any
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    var abilityDelegatorArguments: any
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
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

  @Builder ShowUnit() {
    Column() {
      Select([{value:'aaa',icon: "/common/1.png"},
        {value:'bbb',icon: "/common/2.png"},
        {value:'ccc',icon: "/common/3.png"},
        {value:'ddd',icon: "/common/4.png"}])
        .selected(2)
        .value('TTT')
        .font({size: 30, weight:400, family: 'serif', style: FontStyle.Normal })
        .selectedOptionFont({size: 40, weight: 500, family: 'serif', style: FontStyle.Normal })
        .optionFont({size: 30, weight: 400, family: 'serif', style: FontStyle.Normal })
        .onSelect((index:number)=>{
          console.info("Select:" + index)
        })
    }
  }

  @State text: string = 'Hello World'
  controller: TextAreaController = new TextAreaController()

  build() {
    Column({ space: 5 }) {
        TextArea({
          text: 'The text area can hold an unlimited amount of text. input your word...',
          controller: this.controller
        })
          .key("TextArea")
          .placeholderFont({ size: 16, weight: 400 })
          .width(336)
          .height(56)
          .margin(20)
          .fontSize(16)
          .maxLength(this.flag?(this.isNum? this.textNum: this.textStr):(this.isNull? null: undefined))
          .showCounter(this.boolFlag?this.bool:(this.boolIsNum?this.boolNum:(this.boolIsStr?this.boolStr:
                      (this.boolIsNull? null: undefined))))
          .backgroundColor('#FFFFFF')
          .onChange((value: string) => {
            this.text = value
          })
        TextArea({
          text: 'The text area can hold an unlimited amount of text. input your word...',
          controller: this.controller
        })
          .key("TextAreaNo")
          .placeholderFont({ size: 16, weight: 400 })
          .width(336)
          .height(56)
          .margin(20)
          .fontSize(16)
          .backgroundColor('#FFFFFF')
          .onChange((value: string) => {
            this.text = value
          })
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState(BarState.Off)
          .style(TextContentStyle.INLINE )
          .key("ArkUX_Stage_TextArea_barState_0100")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState(BarState.Auto)
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_barState_0200")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState(BarState.On)
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_barState_0300")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState(BarState.Off)
          .barState(BarState.Auto)
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_barState_0400")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState(0)
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_barState_0500")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState(10)
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_barState_0600")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState("sfasf")
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_barState_0700")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState("")
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_barState_0800")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState(null)
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_barState_0900")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState(undefined)
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_barState_1000")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState(BarState.On)
          .barState(undefined)
          .key("ArkUX_Stage_TextArea_barState_1100")
          .style(TextContentStyle.INLINE)
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState(undefined)
          .barState(BarState.On)
          .key("ArkUX_Stage_TextArea_barState_1200")
          .style(TextContentStyle.INLINE)
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style(TextContentStyle.INLINE)
          .key("TextAreaNO")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .barState(BarState.On)
          .key("TextAreaStyleDefault")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style(TextContentStyle.DEFAULT)
          .key("ArkUX_Stage_TextArea_Style_0100")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_Style_0200")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style(0)
          .key("ArkUX_Stage_TextArea_Style_0300")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style(10)
          .key("ArkUX_Stage_TextArea_Style_0400")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style("10")
          .key("ArkUX_Stage_TextArea_Style_0500")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style("")
          .key("ArkUX_Stage_TextArea_Style_0600")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style(null)
          .key("ArkUX_Stage_TextArea_Style_0700")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style(undefined)
          .key("ArkUX_Stage_TextArea_Style_0800")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style(TextContentStyle.DEFAULT)
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_Style_0900")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style(undefined)
          .style(TextContentStyle.INLINE)
          .key("ArkUX_Stage_TextArea_Style_1000")
        TextArea({
          text: "test",placeholder: 'input your word...',controller: this.controllerTextArea
        })
          .style(TextContentStyle.INLINE)
          .style(undefined)
          .key("ArkUX_Stage_TextArea_Style_1100")

    }.width('100%')
    .margin({ top: 5 })
  }
}