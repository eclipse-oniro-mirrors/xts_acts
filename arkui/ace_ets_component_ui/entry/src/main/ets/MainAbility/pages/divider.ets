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
@Entry
@Component
struct DividerExample {
  @State vertical:boolean = false
  @State color:string = '#acbdef'
  @State strokeWidth:number = 20
  @State lineCapStyle:LineCapStyle = LineCapStyle.Butt
  @State widthK:number = 0
  messageManager:MessageManager = new MessageManager()
   onPageShow() {
    console.info('divider onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'vertical') {
          this.vertical = message.value
      }
      if (message.name == 'color') {
          this.color = message.value
      }
      if (message.name == 'strokeWidth') {
          this.strokeWidth = message.value
      }
      if (message.name == 'lineCapStyle') {
          this.lineCapStyle = message.value
      }
      if (message.name == 'widthK') {
          this.widthK = message.value
         
      }
    }
    this.messageManager.registerCallback(callback)

  }

  build() {
    Column() {
      // 使用横向分割线场景
      Text('Horizontal divider').fontSize(9).fontColor(0xCCCCCC)
      List() {
        ForEach([1, 2, 3], (item) => {
          ListItem() {
            Text('list' + item).width('100%').fontSize(14).fontColor('#182431').textAlign(TextAlign.Start)
          }.width(244).height(48)
        }, item => item.toString())
      }.padding({ left: 24, bottom: 8 })

      Divider().strokeWidth(8).color('#F1F3F5')
      List() {
        ForEach([4, 5], (item) => {
          ListItem() {
            Text('list' + item).width('100%').fontSize(14).fontColor('#182431').textAlign(TextAlign.Start)
          }.width(244).height(48)
        }, item => item.toString())
      }.padding({ left: 24, top: 8 })

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