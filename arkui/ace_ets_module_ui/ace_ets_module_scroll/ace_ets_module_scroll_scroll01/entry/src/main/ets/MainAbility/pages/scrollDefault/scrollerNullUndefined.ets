/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
@Entry
@Component
struct ScrollerCallBackNullUndefined {
  @State numbers: string[] = []
  scroller: Scroller = new Scroller();

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== scrollPage tests ==========
      Text('scrollPage')
      Row() {
        // Test scrollPage with null
        Button('null')
          .id('scrollPage_nullUndefined_1')
          .onClick(() => {
            this.scroller.scrollPage(null)
          })

        // Test scrollPage with undefined
        Button('undefined')
          .id('scrollPage_nullUndefined_2')
          .onClick(() => {
            this.scroller.scrollPage(undefined)
          })
      }.height('5%')

      // ========== scrollTo tests ==========
      Text('scrollTo')
      Row() {
        // Test scrollTo with null
        Button('null')
          .id('scrollTo_nullUndefined_1')
          .onClick(() => {
            this.scroller.scrollTo(null)
          })

        // Test scrollTo with undefined
        Button('undefined')
          .id('scrollTo_nullUndefined_2')
          .onClick(() => {
            this.scroller.scrollTo(undefined)
          })

        // Test xOffset with empty string, animation:canOverScroll with false, canOverScroll with false
        Button('scrollTo')
          .id('scrollTo_nullUndefined_3')
          .onClick(() => {
            this.scroller.scrollTo({
              xOffset: '',
              yOffset: this.scroller.currentOffset().yOffset + 100,
              animation: { duration: 1000, canOverScroll: false },
              canOverScroll: false
            })
          })
      }.height('5%')

      // ========== scrollEdge tests ==========
      Text('scrollEdge')
      Row() {
        // Test scrollEdge with null
        Button('null')
          .id('scrollEdge_nullUndefined_1')
          .onClick(() => {
            this.scroller.scrollEdge(null)
          })

        // Test scrollEdge with undefined
        Button('undefined')
          .id('scrollEdge_nullUndefined_2')
          .onClick(() => {
            this.scroller.scrollEdge(undefined)
          })

        // Test scrollEdge velocity with null
        Button('velocity1')
          .id('scrollEdge_nullUndefined_3')
          .onClick(() => {
            this.scroller.scrollEdge(Edge.Bottom, null);
          })

        // Test scrollEdge velocity with undefined
        Button('velocity2')
          .id('scrollEdge_nullUndefined_4')
          .onClick(() => {
            this.scroller.scrollEdge(Edge.Top, undefined);
          })
      }.height('5%')

      // ========== scrollToIndex tests ==========
      Text('scrollToIndex')
      Row() {
        // Test scrollToIndex value with null
        Button('null')
          .id('scrollToIndex_nullUndefined_1')
          .onClick(() => {
            this.scroller.scrollToIndex(null)
          })

        // Test scrollToIndex value with undefined
        Button('undefined')
          .id('scrollToIndex_nullUndefined_2')
          .onClick(() => {
            this.scroller.scrollToIndex(undefined)
          })

        // Test scrollToIndex options with null
        Button('options1')
          .id('scrollToIndex_nullUndefined_3')
          .onClick(() => {
            this.scroller.scrollToIndex(6, true, ScrollAlign.AUTO, null)
          })

        // Test scrollToIndex options with undefined
        Button('options2')
          .id('scrollToIndex_nullUndefined_4')
          .onClick(() => {
            this.scroller.scrollToIndex(6, true, ScrollAlign.AUTO, undefined)
          })
      }.height('5%')

      // ========== scrollBy tests ==========
      Text('scrollBy')
      Row() {
        // Test scrollBy dx with null
        Button('1null')
          .id('scrollBy_nullUndefined_1')
          .onClick(() => {
            this.scroller.scrollBy(null, 1)
          })

        // Test scrollBy dx with undefined
        Button('1undefined')
          .id('scrollBy_nullUndefined_2')
          .onClick(() => {
            this.scroller.scrollBy(undefined, 1)
          })
        // Test scrollBy dy with null
        Button('2null')
          .id('scrollBy_nullUndefined_3')
          .onClick(() => {
            this.scroller.scrollBy(1, null)
          })

        // Test scrollBy dy with undefined
        Button('2undefined')
          .id('scrollBy_nullUndefined_4')
          .onClick(() => {
            this.scroller.scrollBy(1, undefined)
          })
      }.height('5%')

      // ========== getItemIndex tests ==========
      Text('getItemIndex')
      Row() {
        // Test getItemIndex x with null
        Button('1null')
          .id('getItemIndex_nullUndefined_1')
          .onClick(() => {
            try {
              this.scroller.getItemIndex(null, 1);
            } catch (error) {
              console.info('X Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getItemIndex_x_null', error.code);
            }
          })

        // Test getItemIndex x with undefined
        Button('1undefined')
          .id('getItemIndex_nullUndefined_2')
          .onClick(() => {
            try {
              this.scroller.getItemIndex(undefined, 1);
            } catch (error) {
              console.info('X Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getItemIndex_x_undefined', error.code);
            }
          })
        // Test getItemIndex y with null
        Button('2null')
          .id('getItemIndex_nullUndefined_3')
          .onClick(() => {
            try {
              this.scroller.getItemIndex(1, null)
            } catch (error) {
              console.info('Y Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getItemIndex_y_null', error.code);
            }
          })

        // Test getItemIndex y with undefined
        Button('2undefined')
          .id('getItemIndex_nullUndefined_4')
          .onClick(() => {
            try {
              this.scroller.getItemIndex(1, undefined)
            } catch (error) {
              console.info('Y Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getItemIndex_y_undefined', error.code);
            }
          })
      }.height('5%')

      // ========== getItemRect tests ==========
      Text('getItemRect')
      Row() {
        // Test getItemRect with null
        Button('null')
          .id('getItemRect_nullUndefined_1')
          .onClick(() => {
            try {
              this.scroller.getItemRect(null)
            } catch (error) {
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getItemRect_null', error.code);
            }
          })

        // Test getItemRect with undefined
        Button('undefined')
          .id('getItemRect_nullUndefined_2')
          .onClick(() => {
            try {
              this.scroller.getItemRect(undefined)
            } catch (error) {
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getItemRect_undefined', error.code);
            }
          })
      }.height('5%')

      Scroll(this.scroller) {
        Column() {
          ForEach(this.numbers, (item: number) => {
            Text('' + item)
              .id('scroller_nullUndefined_' + item)
              .width('100%')
              .height('20%')
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }, (item: number) => item.toString())
        }
      }
      .id('scroller_nullUndefined')
      .width('90%')
      .height('20%')
      .backgroundColor(0xF0F0F0)

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}