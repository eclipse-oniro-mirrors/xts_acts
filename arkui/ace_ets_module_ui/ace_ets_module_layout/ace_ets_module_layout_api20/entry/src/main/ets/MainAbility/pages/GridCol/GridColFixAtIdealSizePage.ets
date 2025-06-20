/*
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
struct GridColFixAtIdealSizePage {
  @State width1: number = 50
  @State height1: number = 50

  build() {
    Column() {
      Button('h=120').onClick(() => {
        this.height1 = 120
      }).key('GridColFixAtIdealSizePage_Btn').padding({bottom: 10})

      Column() {
        Text('fixAtIdealSize')

        GridRow() {
          GridCol() {
            Row().height(this.height1).backgroundColor(Color.Green)
          }
          .width(LayoutPolicy.fixAtIdealSize)
          .height(LayoutPolicy.fixAtIdealSize)
          .constraintSize({ maxWidth: 150, maxHeight: 100 })
          .backgroundColor(Color.Pink)
          .key('GridColFixAtIdealSizePage_GridCol')
        }
        .backgroundColor(Color.Yellow)
      }.width(100).height(80)
    }.width('100%').height('100%')
  }
}
