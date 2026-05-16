/**
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
import {MessageManager,Callback} from '../../../utils/MessageManager';

class MyDataSource1 implements IDataSource {
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): number {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct SwiperMinSize {
  messageManager:MessageManager = new MessageManager()
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource1 = new MyDataSource1([])
  @State minSize: number = 0
  @State swiperTextWidth: number = 160
  @State swiperWidth: number = 160
  @State swiperPadding: number = 0
  @State swiperMargin: number = 0
  @State itemSpace: number = 0
  @State nextMargin: number = 0


  @State text: string = ''

  onPageShow() {
    console.info('navigationPosition  onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'minSize') {
        this.minSize = message.value;
      }
      if (message.name == 'swiperTextWidth') {
        this.swiperTextWidth = message.value;
      }
      if (message.name == 'swiperWidth') {
        this.swiperWidth = message.value;
      }
      if (message.name == 'swiperPadding') {
        this.swiperPadding = message.value;
      }
      if (message.name == 'swiperMargin') {
        this.swiperMargin = message.value;
      }
      if (message.name == 'itemSpace') {
        this.itemSpace = message.value;
      }
      if (message.name == 'nextMargin') {
        this.nextMargin = message.value;
      }

    }
    this.messageManager.registerCallback(callback);
  }

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource1(list)
  }

  build() {
    Column({ space: 5 }) {

      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .height('30%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: string) => item)
      }
      .width(160)
      .key('swiperMinSize1')
      .autoPlay(false)
      .indicator(true)
      .loop(true)
      .displayArrow({
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      }, false)

      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width(this.swiperTextWidth)
            .height('30%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
            .key('swiperText' + item)
        }, (item: string) => item)
      }
      .width(this.swiperWidth)
      .key('swiperMinSize2')
      .autoPlay(false)
      .indicator(true)
      .loop(true)
      .displayArrow({
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      }, false)
      .displayCount({ minSize: this.minSize })
      .itemSpace(this.itemSpace)
      .nextMargin(this.nextMargin)
      .padding({ top: this.swiperPadding})
      .margin({ top: this.swiperMargin })
      .vertical(false)

      Row({ space: 12 }) {
        Button('showNext')
          .onClick(() => {
            this.swiperController.showNext()
          })
        Button('showPrevious')
          .onClick(() => {
            this.swiperController.showPrevious()
          })
      }.margin(5)

    }.width('100%')
  }
}