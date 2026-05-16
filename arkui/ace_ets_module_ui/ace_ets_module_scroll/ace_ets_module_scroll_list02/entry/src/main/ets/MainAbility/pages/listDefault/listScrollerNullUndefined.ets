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
struct ListScrollerNullUndefined {
  @State numbers: string[] = []
  private listScroller: ListScroller = new ListScroller()

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== closeAllSwipeActions tests ==========
      Text('closeAllSwipeActions')
      Row() {
        // Test closeAllSwipeActions with null
        Button('null')
          .id('closeAllSwipeActions_nullUndefined_1')
          .onClick(() => {
            try {
              this.listScroller.closeAllSwipeActions(null)
            } catch (error) {
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('closeAllSwipeActions_null', error.code);
            }
          })

        // Test closeAllSwipeActions with undefined
        Button('undefined')
          .id('closeAllSwipeActions_nullUndefined_2')
          .onClick(() => {
            try {
              this.listScroller.closeAllSwipeActions(undefined)
            } catch (error) {
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('closeAllSwipeActions_undefined', error.code);
            }
          })
      }.height('5%')

      // ========== getItemRectInGroup tests ==========
      Text('getItemRectInGroup')
      Row() {
        // Test getItemRectInGroup index with null
        Button('1null')
          .id('getItemRectInGroup_nullUndefined_1')
          .onClick(() => {
            try {
              this.listScroller.getItemRectInGroup(null, 1);
            } catch (error) {
              console.info('index Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getItemRectInGroup_x_null', error.code);
            }
          })

        // Test getItemRectInGroup index with undefined
        Button('1undefined')
          .id('getItemRectInGroup_nullUndefined_2')
          .onClick(() => {
            try {
              this.listScroller.getItemRectInGroup(undefined, 1);
            } catch (error) {
              console.info('index Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getItemRectInGroup_x_undefined', error.code);
            }
          })
        // Test getItemRectInGroup indexInGroup with null
        Button('2null')
          .id('getItemRectInGroup_nullUndefined_3')
          .onClick(() => {
            try {
              this.listScroller.getItemRectInGroup(1, null)
            } catch (error) {
              console.info('indexInGroup Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getItemRectInGroup_y_null', error.code);
            }
          })

        // Test getItemRectInGroup indexInGroup with undefined
        Button('2undefined')
          .id('getItemRectInGroup_nullUndefined_4')
          .onClick(() => {
            try {
              this.listScroller.getItemRectInGroup(1, undefined)
            } catch (error) {
              console.info('indexInGroup Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getItemRectInGroup_y_undefined', error.code);
            }
          })
      }.height('5%')

      // ========== getVisibleListContentInfo tests ==========
      Text('getVisibleListContentInfo')
      Row() {
        // Test getVisibleListContentInfo x with null
        Button('1null')
          .id('getVisibleListContentInfo_nullUndefined_1')
          .onClick(() => {
            try {
              this.listScroller.getVisibleListContentInfo(null, 1);
            } catch (error) {
              console.info('X Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getVisibleListContentInfo_x_null', error.code);
            }
          })

        // Test getVisibleListContentInfo x with undefined
        Button('1undefined')
          .id('getVisibleListContentInfo_nullUndefined_2')
          .onClick(() => {
            try {
              this.listScroller.getVisibleListContentInfo(undefined, 1);
            } catch (error) {
              console.info('X Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getVisibleListContentInfo_x_undefined', error.code);
            }
          })
        // Test getVisibleListContentInfo y with null
        Button('2null')
          .id('getVisibleListContentInfo_nullUndefined_3')
          .onClick(() => {
            try {
              this.listScroller.getVisibleListContentInfo(1, null)
            } catch (error) {
              console.info('Y Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getVisibleListContentInfo_y_null', error.code);
            }
          })

        // Test getVisibleListContentInfo y with undefined
        Button('2undefined')
          .id('getVisibleListContentInfo_nullUndefined_4')
          .onClick(() => {
            try {
              this.listScroller.getVisibleListContentInfo(1, undefined)
            } catch (error) {
              console.info('Y Get error code: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('getVisibleListContentInfo_y_undefined', error.code);
            }
          })
      }.height('5%')

      List({ scroller: this.listScroller }) {
        ListItemGroup() {
          ForEach(this.numbers, (item: number) => {
            ListItem({ style: ListItemStyle.CARD }) {
              Text('item' + item)
                .width('100%')
                .height('100%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
            }
            .id('listScroller_nullUndefined_' + item)
            .height('20%')
            .backgroundColor(0xF9CF93)
          })
        }
      }
      .id('listScroller_nullUndefined')
      .width('90%')
      .height('30%')
      .backgroundColor(0xF0F0F0)

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}