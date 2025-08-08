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

import window from '@ohos.window';

@Entry
@Component
struct BindMenuAnchorPosition {
  @State menuPosition: Position = { x: 0, y: 0 };
  @State textPosition1: Position = { x: 0, y: 0 };
  @State textPosition2: Position = { x: 0, y: 0 };
  @State textPosition3: Position = { x: 0, y: 0 };
  @State left: number = 0;
  @State top: number = 0;

  onPageShow(): void {
    let context = this.getUIContext().getHostContext();
    window.getLastWindow(context).then((data) => {
      let windowClass: window.Window = data;
      let rect = windowClass.getWindowProperties().windowRect;
      this.left = this.getUIContext().px2vp(rect.left);
      this.top = this.getUIContext().px2vp(rect.top);
    });
  }


  @Builder
  MenuBuilder() {
    Column() {
      Text('Options').id('Options')
      Divider().strokeWidth(2).margin(5).color('#F0F0F0')
      Text('Hide')
      Divider().strokeWidth(2).margin(5).color('#F0F0F0')
      Text('Exit')
    }.id('MenuBuilder')
    .onAreaChange((oldValue: Area, newValue: Area) => {
      this.menuPosition.x = newValue.globalPosition.x as number - this.left;
      this.menuPosition.y = newValue.globalPosition.y as number - this.top;
    })
    .width(100)
  }
  
  build() {
    Column() {
      Text(this.menuPosition.x + '').id('menuPositionX')
      Text(this.menuPosition.y + '').id('menuPositionY')
      Text(this.textPosition1.x + '').id('textPositionX1')
      Text(this.textPosition1.y + '').id('textPositionY1')
      Text(this.textPosition2.x + '').id('textPositionX2')
      Text(this.textPosition2.y + '').id('textPositionY2')
      Text(this.textPosition3.x + '').id('textPositionX3')
      Text(this.textPosition3.y + '').id('textPositionY3')

      Text('bindMenu1')
        .id('bindMenuAnchorPosition1')
        .width(200)
        .height(100)
        .backgroundColor('#F0F0F0')
        .margin({ top: 50, left: 150 })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          this.textPosition1.x = newValue.globalPosition.x;
          this.textPosition1.y = newValue.globalPosition.y;
        })
        .bindMenu(this.MenuBuilder, {
          anchorPosition: { x: 10, y: 20 },
        })

      Text('bindMenu2')
        .id('bindMenuAnchorPosition2')
        .width(200)
        .height(100)
        .backgroundColor('#F0F0F0')
        .margin({ top: 50, left: 150 })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          this.textPosition2.x = newValue.globalPosition.x;
          this.textPosition2.y = newValue.globalPosition.y;
        })
        .bindMenu(this.MenuBuilder, {
          anchorPosition: { x: -10, y: -20 },
        })

      Text('bindMenu3')
        .id('bindMenuAnchorPosition3')
        .width(200)
        .height(100)
        .backgroundColor('#F0F0F0')
        .margin({ top: 50, left: 150 })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          this.textPosition3.x = newValue.globalPosition.x;
          this.textPosition3.y = newValue.globalPosition.y;
        })
        .bindMenu(this.MenuBuilder, {
          anchorPosition: { x: -20, y: 20 },
        })
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
  }
}