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
interface linePosition2 {
  start?:Dimension,
  end?:Dimension
}
@Entry
@Component
struct RelativeGuideLine7 {
  @State relStart: number = 50
  @State relEnd: number = 50

  build() {
    Column() {
      RelativeContainer() {
        Button('top')
          .height(100)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start  },
            right: { anchor: "guideLine2", align: HorizontalAlign.Start }
          })
          .key('RelButton7')

      }
      .key('RelativeGuideLine7')
      .width(300).height(300)
      .margin({left: 50, top:100})
      .backgroundColor(Color.Grey)
      .guideLine([
        {id:"guideLine1", direction: Axis.Vertical, position: { start: this.relStart }},
        {id:"guideLine2", direction: Axis.Vertical, position: { end: this.relEnd }}
      ])

      Row() {
        Button('change 100')
          .key('RelButton100')
          .onClick(() => {
            this.relStart = 100
            this.relEnd = 100
          })
      }

    }
    .height('100%')
  }
}