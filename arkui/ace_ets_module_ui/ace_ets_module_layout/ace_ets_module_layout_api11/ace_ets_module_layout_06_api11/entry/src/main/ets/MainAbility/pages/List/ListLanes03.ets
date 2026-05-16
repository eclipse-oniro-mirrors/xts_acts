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
struct ListLanes03 {
  private arr: number[] = [0, 1]
  @State listDirection: Axis = Axis.Vertical
  @State listSpace: string = '2'
  @State alignListItem: ListItemAlign = ListItemAlign.Start
  @State initialIndex: number = 0

  build() {
    Column() {
      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%').height('20%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListLanes31_' + item)
        }, (item: string) => item)
      }
      .listDirection(this.listDirection) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .alignListItem(this.alignListItem)
      .lanes(2, '10vp')
      .width('100%')
      .padding(5)
      .margin({ top: 10 })

      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%').height('20%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListLanes32_' + item)
        }, (item: string) => item)
      }
      .listDirection(this.listDirection) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .alignListItem(this.alignListItem)
      .lanes(2, '10fp')
      .width('100%')
      .padding(5)
      .margin({ top: 10 })

      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%').height('20%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListLanes33_' + item)
        }, (item: string) => item)
      }
      .listDirection(this.listDirection) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .alignListItem(this.alignListItem)
      .lanes(2, '10lpx')
      .width('100%')
      .padding(5)
      .margin({ top: 10 })

      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%').height('20%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListLanes34_' + item)
        }, (item: string) => item)
      }
      .listDirection(this.listDirection) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .alignListItem(this.alignListItem)
      .lanes(2, '10px')
      .width('100%')
      .padding(5)
      .margin({ top: 10 })

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}