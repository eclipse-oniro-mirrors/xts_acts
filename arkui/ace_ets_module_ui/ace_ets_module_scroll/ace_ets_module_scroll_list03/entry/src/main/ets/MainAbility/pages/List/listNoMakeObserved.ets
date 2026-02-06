/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
@ComponentV2
struct listNoMakeObserved {
  private arr: number[] = [1,2,3,4,5]
  private scroller: ListScroller = new ListScroller()
  @Local colors: number[] = [0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  listChildrenSize: ChildrenMainSize = new ChildrenMainSize(20)
  @Local sizeStr: string = 'size: '

  build() {
    Column() {
      Text(this.sizeStr)
        .id('no_observed_str')
        .margin({top: 10})
      Button('change Default')
        .id('no_observed_default')
        .height('8%')
        .onClick(() => {
          let result = this.listChildrenSize.childDefaultSize += 10
          this.sizeStr = 'childDefaultSize: ' + result
        })
      Row(){
        Button('splice')
          .id('no_observed_splice')
          .height('8%')
          .onClick(() => {
            this.listChildrenSize.splice(2, 3, [50, 50])
          })
        Button('update')
          .id('no_observed_update')
          .height('8%')
          .onClick(() => {
            this.listChildrenSize.update(0, 40)
          })
      }

      List({ scroller: this.scroller }) {
        ForEach(this.arr, (item: number, index: number) => {
          ListItem() {
            Text('item-' + index)
              .id('no_observed_' + index)
              .width('100%')
              .height(this.listChildrenSize.childDefaultSize)
              .textAlign(TextAlign.Center)
          }
          .backgroundColor(this.colors[index % 5])
        }, (item: string) => item)
      }
      .childrenMainSize(this.listChildrenSize)
      .width('80%')
      .backgroundColor(Color.Pink)
    }
  }
}