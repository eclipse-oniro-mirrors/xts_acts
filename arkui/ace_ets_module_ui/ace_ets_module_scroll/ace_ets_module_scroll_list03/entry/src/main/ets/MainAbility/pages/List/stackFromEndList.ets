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
struct stackFromEndListExample {
  arr: Array<number> = new Array<number>()
  @State stackFromEnd1: boolean = false;

  aboutToAppear(): void {
    for (let i = 1; i < 6; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Button('stackFromEnd:' + true)
        .id('list_stackFromEnd_true')
        .margin({top:5})
        .height('5%')
        .onClick(() => {
          this.stackFromEnd1 = true
        })
      List({ initialIndex: 0 }) {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text('' + item)
              .id('stackFromEnd_' + item)
              .width('100%')
              .height('40%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(Color.Pink)
          }
        }, (item: string) => item)
      }
      .id('list_stackFromEnd')
      .width('90%')
      .height('60%')
      .friction(0.6)
      .border({ width: 2, color: Color.Red })
      .lanes(5)
      .scrollBar(BarState.Off)
      .stackFromEnd(this.stackFromEnd1)

    }.width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}