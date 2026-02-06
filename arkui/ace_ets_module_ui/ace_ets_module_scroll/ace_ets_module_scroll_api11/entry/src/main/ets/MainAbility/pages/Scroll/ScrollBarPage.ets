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
import {MessageManager,Callback} from '../../utils/MessageManager';

@Entry
@Component
struct ScrollBarPage {
  private scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State ScrollDirection: ScrollDirection = ScrollDirection.Vertical
  @State scrollBarDirection: ScrollBarDirection = ScrollBarDirection.Vertical
  @State state: BarState = BarState.Auto
  @State backColor : Color = Color.Grey
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('ScrollBarPage onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'scroller') {
        this.scroller = message.value
      }
      if (message.name == 'scrollBarDirection') {
        this.scrollBarDirection = message.value
      }
      if (message.name == 'BarState') {
        this.state = message.value
      }
      if (message.name == 'backgroundColor') {
        this.backColor = message.value
      }
      if (message.name == 'ScrollDirection') {
        this.ScrollDirection = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.End }) {
        Scroll(this.scroller) {
          Flex({ direction: FlexDirection.Column }) {
            ForEach(this.arr, (item: number) => {
              Row() {
                Text(item.toString())
                  .width('90%')
                  .height(100)
                  .backgroundColor('#3366CC')
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 5 })
              }
            }, (item: string) => item)
          }.margin({ left: 52 })
        }
        .scrollBar(BarState.Off)
        .scrollable(this.ScrollDirection)
        ScrollBar({ scroller: this.scroller, direction: this.scrollBarDirection,state: this.state }) {
          Text()
            .width(30)
            .height(100)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(30).backgroundColor(this.backColor).key('scrollBar')
      }
    }
  }
}