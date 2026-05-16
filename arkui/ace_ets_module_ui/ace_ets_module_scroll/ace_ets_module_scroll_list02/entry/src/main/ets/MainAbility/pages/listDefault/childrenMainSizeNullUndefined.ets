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
struct ChildrenMainSizeNullUndefined {
  @State numbers: string[] = []
  private listScroller: ListScroller = new ListScroller()
  @State listChildrenSize: ChildrenMainSize = new ChildrenMainSize(30)

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== splice tests ==========
      Text('splice')
      Row() {
        // Test splice start with null
        Button('1null')
          .id('splice_nullUndefined_1')
          .onClick(() => {
            try {
              this.listChildrenSize.splice(null)
            } catch (error) {
              console.info('ChildrenMainSize Get start: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('splice_start_null', error.code);
            }
          })

        // Test splice start with undefined
        Button('1undefined')
          .id('splice_nullUndefined_2')
          .onClick(() => {
            try {
              this.listChildrenSize.splice(undefined)
            } catch (error) {
              console.info('ChildrenMainSize Get start: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('splice_start_undefined', error.code);
            }
          })
      }.height('5%')
      Row() {
        // Test splice deleteCount with null
        Button('2null')
          .id('splice_nullUndefined_3')
          .onClick(() => {
            try {
              this.listChildrenSize.splice(0, null)
              AppStorage.setOrCreate('splice_deleteCount_null', 'success');
            } catch (error) {
              console.info('ChildrenMainSize Get deleteCount: %{public}s', JSON.stringify(error.code));
            }
          })

        // Test splice deleteCount with undefined
        Button('2undefined')
          .id('splice_nullUndefined_4')
          .onClick(() => {
            try {
              this.listChildrenSize.splice(0, undefined)
              AppStorage.setOrCreate('splice_deleteCount_undefined', 'success');
            } catch (error) {
              console.info('ChildrenMainSize Get deleteCount: %{public}s', JSON.stringify(error.code));
            }
          })
      }.height('5%')
      Row() {
        // Test splice childrenSize with null
        Button('3null')
          .id('splice_nullUndefined_5')
          .onClick(() => {
            try {
              this.listChildrenSize.splice(0, 1, null)
              AppStorage.setOrCreate('splice_childrenSize_null', 'success');
            } catch (error) {
              console.info('ChildrenMainSize Get childrenSize: %{public}s', JSON.stringify(error.code));
            }
          })

        // Test splice childrenSize with undefined
        Button('3undefined')
          .id('splice_nullUndefined_6')
          .onClick(() => {
            try {
              this.listChildrenSize.splice(0, 1, undefined)
              AppStorage.setOrCreate('splice_childrenSize_undefined', 'success');
            } catch (error) {
              console.info('ChildrenMainSize Get childrenSize: %{public}s', JSON.stringify(error.code));
            }
          })

        // Test splice childrenSize with empty array
        Button('3[]')
          .id('splice_nullUndefined_7')
          .onClick(() => {
            try {
              this.listChildrenSize.splice(0, 1, [])
              AppStorage.setOrCreate('splice_childrenSize_empty', 'success');
            } catch (error) {
              console.info('ChildrenMainSize Get childrenSize_empty: %{public}s', JSON.stringify(error.code));
            }
          })
      }.height('5%')


      // ========== update tests ==========
      Text('update')
      Row() {
        // Test update index with null
        Button('1null')
          .id('update_nullUndefined_1')
          .onClick(() => {
            try {
              this.listChildrenSize.update(null, 1);
            } catch (error) {
              console.info('ChildrenMainSize Get update index: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('update_index_null', error.code);
            }
          })

        // Test update index with undefined
        Button('1undefined')
          .id('update_nullUndefined_2')
          .onClick(() => {
            try {
              this.listChildrenSize.update(undefined, 1);
            } catch (error) {
              console.info('ChildrenMainSize Get update index: %{public}s', JSON.stringify(error.code));
              AppStorage.setOrCreate('update_index_undefined', error.code);
            }
          })
        // Test update childSize with null
        Button('2null')
          .id('update_nullUndefined_3')
          .onClick(() => {
            try {
              this.listChildrenSize.update(1, null)
              AppStorage.setOrCreate('update_childSize_null', 'success');
            } catch (error) {
              console.info('ChildrenMainSize Get update childSize: %{public}s', JSON.stringify(error.code));
            }
          })

        // Test update indexInGroup with undefined
        Button('2undefined')
          .id('update_nullUndefined_4')
          .onClick(() => {
            try {
              this.listChildrenSize.update(1, undefined)
              AppStorage.setOrCreate('update_childSize_undefined', 'success');
            } catch (error) {
              console.info('ChildrenMainSize Get update childSize: %{public}s', JSON.stringify(error.code));
            }
          })
      }.height('5%')

      List({ scroller: this.listScroller }) {
        ForEach(this.numbers, (item: number) => {
          ListItem() {
            Text('item' + item)
              .width('100%')
              .height( item < 5 ? 20 : this.listChildrenSize.childDefaultSize)
              .fontSize(14)
              .textAlign(TextAlign.Center)
          }
          .id('childrenMainSize_nullUndefined_' + item)
          .backgroundColor(0xF9CF93)
        })
      }
      .id('list_childrenMainSize_nullUndefined')
      .childrenMainSize(this.listChildrenSize)
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