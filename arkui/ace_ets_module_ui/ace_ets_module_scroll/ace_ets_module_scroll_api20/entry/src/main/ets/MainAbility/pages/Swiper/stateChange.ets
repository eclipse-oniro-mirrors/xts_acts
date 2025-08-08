/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class MyDataSource implements IDataSource {
  private list: number[] = [];

  constructor(list: number[]) {
    this.list = list;
  }

  totalCount(): number {
    return this.list.length;
  }

  getData(index: number): number {
    return this.list[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct onScrollStateChangedSwiper {
  private swiperController: SwiperController = new SwiperController();
  private data: MyDataSource = new MyDataSource([]);
  @State scrollState1: string = 'scrollState: '

  aboutToAppear(): void {
    let list: number[] = [];
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(list);
  }

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width('90%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: string) => item)
      }
      .id('swiper_stateChange')
      .index(1)
      .backgroundColor(Color.Black)
      .onContentWillScroll((result: SwiperContentWillScrollResult) => {
        if (result.comingIndex == 3) {
          return false;
        }
        return true;
      })
      .loop(false)
      .effectMode(EdgeEffect.Spring)
      .onScrollStateChanged((scrollState: ScrollState) => {
        this.scrollState1 += scrollState
        console.info('onScrollStateChanged: ' + scrollState);
      })
      Text(this.scrollState1).id('stateChange_test')
      Row() {
        Button('showNext')
          .id('stateChange_showNext')
          .onClick(() => {
            this.swiperController.showNext()//2 0
          })
        Button('showPrevious')
          .id('stateChange_showPrevious')
          .onClick(() => {
            this.swiperController.showPrevious()//2 0
          })
      }

      Row() {
        Button('To 5')
          .id('stateChange_6')
          .onClick(() => {
            this.swiperController.changeIndex(5, true)//2 0
          })
        Button('To 0')
          .id('stateChange_1')
          .onClick(() => {
            this.swiperController.changeIndex(0)//不打印
          })
        Button('reset')
          .id('stateChange_reset')
          .onClick(() => {
            this.scrollState1 = 'scrollState: '
          })
      }
    }.width('100%')
    .margin({ top: 5 })
  }
}