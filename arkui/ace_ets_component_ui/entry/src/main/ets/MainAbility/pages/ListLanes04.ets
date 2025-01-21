/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct ListLanes04 {
  private arr: number[] = [0, 1, 2, 3, 4, 5]
  listGutter: Dimension = '0vp'
  @State listDirection: Axis = Axis.Horizontal
  @State listSpace: string = '20'
  @State alignListItem: ListItemAlign = ListItemAlign.Start
  @State initialIndex: number = 0

  build() {
    Column() {
      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width(100).height('100%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListItem01_' + item)
        }, (item: string) => item)
      }
      .key('ListLanesKey04_1')
      .listDirection(this.listDirection) // 排列方向
      .alignListItem(this.alignListItem)
      .lanes(2,0)
      .width('100%')
      .height('30%')

      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width(100).height('100%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListItem02_' + item)
        }, (item: string) => item)
      }
      .key('ListLanesKey04_2')
      .listDirection(this.listDirection) // 排列方向
      .alignListItem(this.alignListItem)
      .lanes(2,-1)
      .width('100%')
      .height('30%')

      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width(100).height('100%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListItem03_' + item)
        }, (item: string) => item)
      }
      .key('ListLanesKey04_3')
      .listDirection(this.listDirection) // 排列方向
      .alignListItem(this.alignListItem)
      .lanes(2,'10%')
      .width('100%')
      .height('30%')

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}