/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct DirectiveMenuExample {
  private iconStr: ResourceStr = $r("app.media.icon");
  @State bdgColor: string = 'green';
  @State fontColor: string = 'black';

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
        .id('close')
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text("longClick")
          .fontSize(20)
          .width('100%')
          .height("25%")
          .backgroundColor(this.bdgColor)
          .fontColor(this.fontColor)
          .textAlign(TextAlign.Center)
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            enableArrow: true,
            placement: Placement.Bottom,
            aboutToAppear: () => {
              this.bdgColor = '#FFFF0000';
            },
            aboutToDisappear: () => {
              this.fontColor = '#FF0000FF';
            }
          })
          .id('aboutToAppear')
      }
    }
    .width('100%')
    .height('100%')
  }
}