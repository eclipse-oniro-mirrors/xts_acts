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
import GlobalContext from './../../common/GlobalContext';
import { Value } from './../../common/Value';
import { MessageManager, Callback } from './../../common/MessageManager';

type MessageData = boolean | string | number | LineCapStyle

@Entry
@Component
struct DividerExample {
  @State vertical:boolean = false
  @State color:string = '#acbdef'
  @State strokeWidth:number = 20
  @State lineCapStyle:LineCapStyle = LineCapStyle.Butt
  @State widthK:number = 0
  messageManager: MessageManager<MessageData> = new MessageManager()
   onPageShow() {
    console.info('divider onPageShow')
    let value: Value<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<MessageData> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'vertical') {
          this.vertical = message.value as boolean
      }
      if (message.name == 'color') {
          this.color = message.value as string
      }
      if (message.name == 'strokeWidth') {
          this.strokeWidth = message.value as number
      }
      if (message.name == 'lineCapStyle') {
          this.lineCapStyle = message.value as LineCapStyle
      }
      if (message.name == 'widthK') {
          this.widthK = message.value as number
         
      }
    }
    this.messageManager.registerCallback(callback)

  }

  build() {
    Column() {
      // 使用纵向分割线场景
      Text('Vertical divider').fontSize(9).fontColor(0xCCCCCC)
      Column() {
        Column() {
          Row().width(288).height(64).backgroundColor('#30C9F0').opacity(0.3)
          Row() {
            Button('Button')
              .width(136)
              .height(22)
              .fontSize(16)
              .fontColor('#007DFF')
              .fontWeight(500)
              .backgroundColor(Color.Transparent)
            Divider().vertical(this.vertical).height(22).color(this.color).width(this.widthK).margin({ left: 8, right: 8 }).strokeWidth(this.strokeWidth).lineCap(this.lineCapStyle).key("divider")
            Button('Button')
              .width(136)
              .height(22)
              .fontSize(16)
              .fontColor('#007DFF')
              .fontWeight(500)
              .backgroundColor(Color.Transparent)
          }.margin({ top: 17 })
        }
        .width(336)
        .height(152)
        .backgroundColor('#FFFFFF')
        .borderRadius(24)
        .padding(24)
      }
      .width('100%')
      .height(168)
      .backgroundColor('#F1F3F5')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 8 })
    }.width('100%').padding({ top: 24 })
  }
}