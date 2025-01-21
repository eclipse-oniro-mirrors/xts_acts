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

type Message = string|Color

@Entry
@Component
struct RadioPage {
  private radioValue: string = 'radio1'
  @State radioGroup : string = 'radioGroup'
  @State text : string = 'no change'
  @State backColor : Color = Color.Blue
  messageManager = new MessageManager<Message>()

  onPageShow() {
    console.info('RadioPage onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<Message> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'radioValue') {
        this.radioValue = message.value as string
      }
      if (message.name == 'radioGroup') {
        this.radioGroup = message.value as string
      }
      if (message.name == 'backColor') {
        this.backColor = message.value as Color
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Column() {
        Text(this.radioValue).key('t1')
        Radio({ value: this.radioValue, group: 'radioGroup' }).checked(true)
          .height(50)
          .width(50)
          .backgroundColor(this.backColor)
          .key('r1')
          .onChange((isChecked: boolean) => {
            console.log(this.radioValue + ' status is ' + isChecked)
          })
      }
      Column() {
        Text('Radio2')
        Radio({ value: 'Radio2', group: this.radioGroup }).checked(false)
          .height(50)
          .width(50)
          .key('r2')
          .onChange((isChecked: boolean) => {
            console.log('Radio2 status is ' + isChecked)
          })
      }
      Column() {
        Text('Radio3')
        Radio({ value: 'Radio3', group: 'radioGroup' }).checked(false)
          .height(50)
          .width(50)
          .key('r3')
          .onChange((isChecked: boolean) => {
            this.text = "change succ"
            console.log('Radio3 status is ' + isChecked)
          })
      }
      Column() {
        Text('Radio4')
        Radio({ value: 'Radio4', group: this.radioGroup }).checked(false)
          .height(50)
          .width(50)
          .key('r4')
          .onChange((isChecked: boolean) => {
            console.log('Radio3 status is ' + isChecked)
          })
      }
      Text(this.text).fontSize(20).margin(10).key('text')
    }.padding({ top: 30 })
  }
}