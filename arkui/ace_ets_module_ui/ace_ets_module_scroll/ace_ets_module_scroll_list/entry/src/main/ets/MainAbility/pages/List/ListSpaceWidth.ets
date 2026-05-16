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
struct ListSpaceWidthExample {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();
  @State spaceWIndex: number = 0
  @State spaceWList: ( Dimension )[] = [
    $r('app.string.spaceWidth_normal'),$r('app.string.spaceWidth_error')
  ]

  build() {
    Column() {
      Row(){
        Button('0')
          .onClick(() => {
            this.spaceWIndex = 0
          })
          .id('changeSpaceWListValue0')
        Button('1')
          .onClick(() => {
            this.spaceWIndex = 1
          })
          .id('changeSpaceWListValue1')
      }
      List({
        spaceWidth: this.spaceWList[this.spaceWIndex],
        initialIndex: 0
      }) {
        ForEach(this.data, (i: number) => {
          ListItemGroup({
            spaceWidth: this.spaceWList[this.spaceWIndex]
          }){
            ListItem() {
              Text('' + i)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
            ListItem() {
              Text('1' + i)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
          }
          .id('listItemGroupSpaceWidthId')
        }, (i: number) => i.toString())
      }
      .id('listSpaceWidthId')
      .width('100%')
      .backgroundColor(0xFFF8F0)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Grey)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}