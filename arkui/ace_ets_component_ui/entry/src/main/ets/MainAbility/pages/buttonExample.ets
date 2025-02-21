
/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {MessageManager,Callback} from '../utils/MessageManager';

type Message = ButtonType|boolean|string|Color|FontStyle|FontWeight

@Entry
@Component
struct ButtonExample {
  @State bttype:ButtonType = ButtonType.Normal
  @State stateEffect:boolean = true
  @State str:string = "Disable1"
  messageManager = new MessageManager<Message>()
  
  
  @State fontColor:Color = Color.Red
  @State fontFamily:string = "123"
  @State fontStyle:FontStyle = FontStyle.Italic
  @State fontWeight:FontWeight = FontWeight.Lighter
  @State fontSize: string = '12'

  onPageShow() {
    console.info('ButtonExample onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<Message> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'bttype') {
          this.bttype = message.value as ButtonType
      }
      if (message.name == 'stateEffect') {
          this.stateEffect = message.value as boolean
      }

      if (message.name == 'fontSize') {
          this.fontSize = message.value as string
      }
      if (message.name == 'fontColor') {
          this.fontColor = message.value as Color
      }
      if (message.name == 'fontFamily') {
          this.fontFamily = message.value as string
      }
      if (message.name == 'fontStyle') {
          this.fontStyle = message.value as FontStyle
      }
      if (message.name == 'fontWeight') {
          this.fontWeight = message.value as FontWeight
      }
      
    }
    this.messageManager.registerCallback(callback)

  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Text('Normal button').fontSize(9).fontColor(0xCCCCCC)
      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Button('OK', { type: this.bttype, stateEffect: this.stateEffect}).borderRadius(8).backgroundColor(0x317aff).width(90).fontSize(this.fontSize).key('btok')
        .fontColor(this.fontColor).fontFamily(this.fontFamily).fontStyle(this.fontStyle).fontWeight(this.fontWeight)
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row() {
            LoadingProgress().width(20).height(20).margin({ left: 12 }).color(0xFFFFFF)
            Text('loading').fontSize(12).fontColor(0xffffff).margin({ left: 5, right: 12 })
          }.alignItems(VerticalAlign.Center)
        }.borderRadius(8).backgroundColor(0x317aff).width(90).height(40)

        Button('Disable', { type: ButtonType.Normal, stateEffect: false }).opacity(0.4)
          .borderRadius(8).backgroundColor(0x317aff).width(90).key('btdisable')
      }

      Text('Capsule button').fontSize(9).fontColor(0xCCCCCC)
      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Button('OK1', { type: ButtonType.Capsule, stateEffect: true }).backgroundColor(0x317aff).width(90)
        Button({ type: ButtonType.Capsule, stateEffect: true }) {
          Row() {
            LoadingProgress().width(20).height(20).margin({ left: 12 }).color(0xFFFFFF)
            Text('loading1').fontSize(12).fontColor(0xffffff).margin({ left: 5, right: 12 })
          }.alignItems(VerticalAlign.Center).width(90).height(40)
        }.backgroundColor(0x317aff)

        Button(this.str, { type: ButtonType.Capsule, stateEffect: true }).opacity(0.4)
          .backgroundColor(0x317aff).width(90).key('btdisable1').onClick(() => {
               this.str = "click"
          })
      }

      Text('Circle button').fontSize(9).fontColor(0xCCCCCC)
      Flex({ alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap }) {
        Button({ type: ButtonType.Circle, stateEffect: true }) {
          LoadingProgress().width(20).height(20).color(0xFFFFFF)
        }.width(55).height(55).backgroundColor(0x317aff)

        Button({ type: ButtonType.Circle, stateEffect: true }) {
          LoadingProgress().width(20).height(20).color(0xFFFFFF)
        }.width(55).height(55).margin({ left: 20 }).backgroundColor(0xF55A42)
      }
    }.height(400).padding({ left: 35, right: 35, top: 35 })
  }
}