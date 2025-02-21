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
import {MessageManager,Callback} from '../../utils/MessageManager';

class MyDataSource78 implements IDataSource {
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
struct SwiperNextPrevMarginExample78 {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource78 = new MyDataSource78([])
  @State  displayCount : number = 1;
  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource78(list)
  }

  messageManager = new MessageManager<number>()

  onPageShow() {
    console.info('SwiperNextPrevMargin78 onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<number> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'displayCount') {
          this.displayCount = message.value
      }
         
    }
    this.messageManager.registerCallback(callback)

  }

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string,index:number) => {
          Text(item)
            .width('100%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30).key(index+"")
        }, (item: string) => item)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .displayMode(SwiperDisplayMode.STRETCH)
      .padding(10)
      .nextMargin(4)
      .displayCount(this.displayCount)
      .prevMargin(2)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .key("swiperNextPrevMargin78")

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
    .margin({ top: 5 }).key('ColumnSwiper78')
  }
}