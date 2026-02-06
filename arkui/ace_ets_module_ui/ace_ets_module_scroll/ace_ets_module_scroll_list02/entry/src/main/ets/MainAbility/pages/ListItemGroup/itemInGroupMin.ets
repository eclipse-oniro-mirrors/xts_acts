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
@Entry
@Component
struct scrollToItemInGroupMin {
  listScroller: ListScroller = new ListScroller()
  private arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  @Builder
  itemHead(text: string) {
    Text(text)
      .id('group_min_header')
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .height(50)
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + '个')
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .height(50)
  }

  build(){
    Column() {
      Text('scrollToItemInGroup')
        .margin({ top: 10 })
      Row(){
        Button('-1')
          .id('itemInGroup_negative')
          .onClick(() => {
            this.listScroller.scrollToItemInGroup(-1, -1)
          })
        Button('0')
          .id('itemInGroup_0')
          .onClick(() => {
            this.listScroller.scrollToItemInGroup(0, 0)
          })
      }

      List({ scroller: this.listScroller }) {
        ListItemGroup({ header: this.itemHead('header'), footer: this.itemFoot(this.arr.length) }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('listItem' + item)
                .width('100%')
                .height('100%')
                .fontSize(16)
                .borderRadius(10)
                .textAlign(TextAlign.Center)
                .backgroundColor('#3366CC')
            }
            .id('itemGroup_min_' + item)
            .width('100%')
            .height('20%')
          })
        }
      }
      .id('itemInGroup_min')
      .alignListItem(ListItemAlign.Center)
      .scrollBar(BarState.On)
      .width('90%')
      .height('60%')
      .backgroundColor(0xFAEEE0)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}