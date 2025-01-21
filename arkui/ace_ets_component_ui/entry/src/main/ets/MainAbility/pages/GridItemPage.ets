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
struct GridItemPage {
  @State numbers: string[] = Array.apply(null, { length: 16 }).map(function (item, i) {
    return i.toString()
  })
  @State rowStart: number = 1
  @State rowEnd: number = 4
  @State columnStart: number = 1
  @State columnEnd: number = 5
  @State forceRebuild: boolean = true
  @State selectable: boolean = false
  @State onSelect: string = 'a'
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('GridItemPage onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'rowStart') {
        this.rowStart = message.value
      }
      if (message.name == 'rowEnd') {
        this.rowEnd = message.value
      }
      if (message.name == 'columnStart') {
        this.columnStart = message.value
      }
      if (message.name == 'columnEnd') {
        this.columnEnd = message.value
      }
      if (message.name == 'forceRebuild') {
        this.forceRebuild = message.value
      }
      if (message.name == 'selectable') {
        this.selectable = message.value
      }
      if (message.name == 'onSelect') {
        this.onSelect = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Grid() {
        GridItem() {
          Text(this.onSelect)
            .key('onSelect')
            .fontSize(16)
            .backgroundColor(0xFAEEE0)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }.rowStart(this.rowStart)
        .rowEnd(this.rowEnd)
        .key("gridItem1")
        .selectable(this.selectable)
        .onSelect((isSelected: boolean) =>{
          this.onSelect = 'true'
          console.info('isSelected: ' + isSelected)
        })

        ForEach(this.numbers, (item) => {
          GridItem() {
            Text(item)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
              .key(item)
          }.forceRebuild(this.forceRebuild)
          .key("gridItem2")
        }, item => item)

        GridItem() {
          Text('b')
            .fontSize(16)
            .backgroundColor(0xDBD0C0)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }.columnStart(this.columnStart).columnEnd(this.columnEnd).key("gridItem3")
      }
      .key('grid1')
      .columnsGap("4")
      .rowsGap("5")
      .multiSelectable(true)
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .width('90%').height(300)
    }.width('100%').margin({ top: 5 })
  }
}