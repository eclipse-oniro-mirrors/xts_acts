/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
class MyDataCachedOptions implements IDataSource {
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
struct swiperCachedOptions {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataCachedOptions = new MyDataCachedOptions([])

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 6; i++) {
      list.push(i);
    }
    this.data = new MyDataCachedOptions(list)
  }

  build() {
    Column() {
      // ========== SwiperAttribute.cachedCount ==========
      // CachedCountOptions: { isShown: true, independent: true }
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width('100%')
            .height('100%')
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
        }, (item: string) => item)
      }
      .id('cachedCount_isIn_true')
      .cachedCount(1,{ isShown: true, independent: true })
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)
      .width('80%')
      .height('10%')

      // CachedCountOptions: { isShown: false, independent: false }
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width('100%')
            .height('100%')
            .backgroundColor('#FFFCCC')
            .textAlign(TextAlign.Center)
        }, (item: string) => item)
      }
      .id('cachedCount_isIn_false')
      .cachedCount(1,{ isShown: false, independent: false })
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)
      .width('80%')
      .height('10%')

      // CachedCountOptions: { isShown: true, independent: false }
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width('100%')
            .height('100%')
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
        }, (item: string) => item)
      }
      .id('cachedCount_isIn_tf')
      .cachedCount(1,{ isShown: true, independent: false })
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)
      .width('80%')
      .height('10%')

      // count: null
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width('100%')
            .height('100%')
            .backgroundColor('#FFFCCC')
            .textAlign(TextAlign.Center)
        }, (item: string) => item)
      }
      .id('cachedCount_count_null')
      .cachedCount(null,{ isShown: true, independent: true })
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)
      .width('80%')
      .height('10%')

      // count: undefined
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width('100%')
            .height('100%')
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
        }, (item: string) => item)
      }
      .id('cachedCount_count_undefined')
      .cachedCount(undefined,{ isShown: true, independent: true })
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)
      .width('80%')
      .height('10%')

      // options: null
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width('100%')
            .height('100%')
            .backgroundColor('#FFFCCC')
            .textAlign(TextAlign.Center)
        }, (item: string) => item)
      }
      .id('cachedCount_options_null')
      .cachedCount(1,null)
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)
      .width('80%')
      .height('10%')

      // options: undefined
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width('100%')
            .height('100%')
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
        }, (item: string) => item)
      }
      .id('cachedCount_options_undefined')
      .cachedCount(1,undefined)
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)
      .width('80%')
      .height('10%')

    }
    .width('100%')
    .margin(5)
  }
}