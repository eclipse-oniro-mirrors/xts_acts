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
@Component
struct bindMenuoutlineColorTest {
  private menuElements: MenuElement[] = [
    {
      value: 'Menu1',
      action: () => {

      }
    },
    {
      value: 'Menu2',
      action: () => {

      }
    },
    {
      value: 'Menu3',
      action: () => {

      }
    }
  ];
  build() {
    Row() {
      Column() {
        Button('bindMenu')
          .id('bindMenu001')
          .margin(100)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .bindMenu(this.menuElements, {
            title: 'BindMenuTest',
            showInSubWindow: true,
            placement: Placement.BottomRight,
            outlineWidth:8,
            outlineColor:Color.Red
          })
      }
    }
    .height('100%')
  }
}