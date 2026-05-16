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
  ColumnOptions,
  Column,
  Margin,
  TextArea,
  Builder,
  Select,
  TextAreaController,
  BarState,
  TextContentStyle,
  FontStyle
} from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog';
import { MessageManagerBase, CallbackBase, MessageBase } from '../../common/MessageManager2';

// function asNumber(val: string | number | null | undefined) {
//   return val as int;
// }
function asNumber(val: string) {
  console.log("================= asNumber" + Number.parseInt(val).toInt())
  return Number.parseInt(val).toInt();
}

function asBoolean(val: boolean | undefined) {  //测试接口只支持 undefined、 boolean
  // return val as boolean;
  if (val == undefined){
    return undefined
  }else{
    return val
  }
}

@Entry
@Component
struct textAreaUx {

  messageManagerText: MessageManagerBase<string> = new MessageManagerBase<string>()

  onPageShow() {
    AppStorage.setOrCreate<MessageManagerBase<string>>('messageManagerTextAreaUx', this.messageManagerText)
    let callbackTextCase: CallbackBase<string> = (message: MessageBase<string>) => {
      console.error('message = ' + message.name + " -- " + message.value)
      if (message.name == 'TextNum') {
        this.textNum = message.value
        this.isNum = true
        this.flag = true
      }
      if (message.name == "TextStr") {
        console.log("======================================= TextStr" + message.value);
        this.textStr = message.value
        this.flag = true
        this.isNum = false
      }
      if (message.name == "TextErr" && message.value == "null") {
        console.info("valueChangeCallBack TextNull:" + JSON.stringify(message));
        this.flag = false
        this.isNull = true
      }
      if (message.name == "TextErr" && message.value == "undefined") {
        console.info("valueChangeCallBack TextErr:" + JSON.stringify(message));
        this.flag = false
        this.isNull = false
      }

      if (message.name == "BoolTrue") {
        console.info("valueChangeCallBack TextAreaShowCounterTrue:" + JSON.stringify(message));
        this.boolFlag = true
        this.bool = true
      }
      if (message.name == "BoolFalse") {
        this.boolFlag = true
        this.bool = false
      }
      // if ((eventData.data as ESObject).getProperty('type').toString() == "BoolErrNum" && eventData.data != null) {
      //   console.info("valueChangeCallBack TextAreaMaxLengthStr:" + JSON.stringify(eventData));
      //   this.boolFlag = false
      //   this.boolIsNum = true
      //   this.boolNum = ((eventData.data) as ESObject).getProperty('text').toNumber()
      // }
      // if ((eventData.data as ESObject).getProperty('type').toString() == "BoolErrStr") {
      //   console.info("valueChangeCallBack TextAreaMaxLengthStr:" + JSON.stringify(eventData));
      //   this.boolFlag = false
      //   this.boolIsNum = false
      //   this.boolIsStr = true
      //   this.boolStr = (eventData.data as ESObject).getProperty('text').toString()
      // }
      // if ((eventData.data as ESObject).getProperty('type').toString() == "BoolErrNull") {
      //   console.info("valueChangeCallBack TextAreaMaxLengthStr:" + JSON.stringify(eventData));
      //   this.boolFlag = false
      //   this.boolIsNum = false
      //   this.boolIsStr = false
      //   this.boolIsNull = true
      // }
      if (message.name == "BoolErrUndefined") {
        console.info("valueChangeCallBack TextAreaMaxLengthStr:" + JSON.stringify(message));
        this.boolFlag = false
        this.boolIsNum = false
        this.boolIsStr = false
        this.boolIsNull = false
      }
    }
    this.messageManagerText.registerCallback(callbackTextCase)
  }


  aboutToAppear() {
    console.info("textAreaUx aboutToAppear")
  }

  @State flag: boolean = false
  @State isNum: boolean = false
  @State isNull: boolean = false
  @State errFlag: boolean = false
  @State textNum: string = '2'
  @State textStr: string = ''
  @State boolFlag: boolean = false
  @State bool: boolean = false
  @State boolIsNum: boolean = false
  @State boolIsStr: boolean = false
  @State boolIsNull: boolean = false
  @State boolNum: number = 2
  @State boolStr: string = ''

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
  controller: TextAreaController = new TextAreaController()

  build() {
    Column({ space: 5 } as ColumnOptions) {
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
        // .maxLength(asNumber(this.flag ? (this.isNum ? this.textNum : this.textStr) : (this.isNull ? null : undefined)) as int)
        .maxLength(this.flag ? asNumber(this.isNum ? this.textNum : this.textStr) :  undefined)
        .showCounter(asBoolean(this.boolFlag ? this.bool :  undefined))
        // .showCounter(asBoolean(this.boolFlag ? this.bool : (this.boolIsNum ? this.boolNum :
        //   (this.boolIsStr ? this.boolStr : (this.boolIsNull ? null : undefined)))))
        .backgroundColor('#FFFFFF')
        .onChange((value: string) :void=> {
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
        .onChange((value: string) :void=> {
          this.text = value
        })
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Off)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_barState_0100")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Auto)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_barState_0200")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.On)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_barState_0300")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Off)
        .barState(BarState.Auto)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_barState_0400")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Off)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_barState_0500")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.Auto)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_barState_0600")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(undefined)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_barState_0700")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(undefined)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_barState_0800")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(undefined)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_barState_0900")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(undefined)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_barState_1000")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.On)
        .barState(undefined)
        .key("ArkUX_Stage_TextArea_barState_1100")
        .style(TextContentStyle.INLINE)
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(undefined)
        .barState(BarState.On)
        .key("ArkUX_Stage_TextArea_barState_1200")
        .style(TextContentStyle.INLINE)
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(TextContentStyle.INLINE)
        .key("TextAreaNO")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .barState(BarState.On)
        .key("TextAreaStyleDefault")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(TextContentStyle.DEFAULT)
        .key("ArkUX_Stage_TextArea_Style_0100")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_Style_0200")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(undefined)
        .key("ArkUX_Stage_TextArea_Style_0300")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(undefined)
        .key("ArkUX_Stage_TextArea_Style_0400")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(undefined)
        .key("ArkUX_Stage_TextArea_Style_0500")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(undefined)
        .key("ArkUX_Stage_TextArea_Style_0600")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(undefined)
        .key("ArkUX_Stage_TextArea_Style_0700")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(undefined)
        .key("ArkUX_Stage_TextArea_Style_0800")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(TextContentStyle.DEFAULT)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_Style_0900")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(undefined)
        .style(TextContentStyle.INLINE)
        .key("ArkUX_Stage_TextArea_Style_1000")
      TextArea({
        text: "test", placeholder: 'input your word...', controller: this.controller
      })
        .style(TextContentStyle.INLINE)
        .style(undefined)
        .key("ArkUX_Stage_TextArea_Style_1100")

    }.width('100%')
    .margin({ top: 5 } as Margin)
  }
}