/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

class MyDataSource2 implements IDataSource {
  private list: number[] = []
  private listener?: DataChangeListener = undefined

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
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct SwiperAttributeNullUndefined {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource2 = new MyDataSource2([])

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource2(list)
  }

  onPageShow(): void {
    this.swiperController.preloadItems(undefined)
      .then(() => {
        console.info('preloadItems success2.')
      })
      .catch(() => {
        console.info('preloadItems failed2.')
      })
    this.swiperController.preloadItems(null)
      .then(() => {
        console.info('preloadItems success2.')
      })
      .catch(() => {
        console.info('preloadItems failed2.')
      })
  }

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item)
            .width('90%')
            .height('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(20)
        }, (item: string) => item)
      }
      .key('swiper1')
      .cachedCount(null)
      .index(1)
      .autoPlay(false)
      .autoPlay(false, null)
      .autoPlay(false, { stopWhenTouched: true })
      .indicator(null)
      .displayArrow(null)
      .displayCount(null)
      .displayCount(null, true)
      .indicatorStyle(null)
      .indicatorStyle({mask: true})
      .prevMargin(null)
      .nextMargin(null)
      .customContentTransition(null)
      .pageFlipMode(null)
      .height('30%')

      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item)
            .width('90%')
            .height('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(20)
        }, (item: string) => item)
      }
      .key('swiper2')
      .cachedCount(undefined)
      .index(1)
      .autoPlay(false)
      .autoPlay(false, undefined)
      .autoPlay(false, { stopWhenTouched: false })
      .indicator(undefined)
      .displayArrow(undefined)
      .displayCount(undefined)
      .displayCount(undefined, true)
      .indicatorStyle(undefined)
      .indicatorStyle({mask: true})
      .prevMargin(undefined)
      .nextMargin(undefined)
      .customContentTransition(undefined)
      .pageFlipMode(undefined)
      .height('30%')

      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item)
            .width('90%')
            .height('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(20)
        }, (item: string) => item)
      }
      .key('swiper3')
      .height('30%')
    }.margin({ top: 5 })
  }
}