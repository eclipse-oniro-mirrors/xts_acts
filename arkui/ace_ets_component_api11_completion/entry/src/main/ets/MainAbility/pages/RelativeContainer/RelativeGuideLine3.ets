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
interface linePosition {
  start?:Dimension,
  end?:Dimension
}
@Entry
@Component
struct RelativeGuideLine3 {
  @State RelWidth: string = '300'
  @State guideLineDir1: Axis = Axis.Horizontal
  @State buttonAlign: VerticalAlign = VerticalAlign.Top
  @State buttonPosition: Axis = Axis.Horizontal
  @State anchor1: string = 'guideLine1'
  @State linePosition: linePosition = { start: 50, end: 50 }

  build() {
    Column() {
      RelativeContainer() {
        Button('top')
          .width(50)
          .height(50)
          .alignRules({
            top: { anchor: "guideLine1", align: this.buttonAlign },
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          })
          .key('RelButton3')

      }
      .key('RelativeGuideLine3')
      .width(300).height(300)
      .margin({left: 50, top:100})
      .backgroundColor(Color.Grey)
      .guideLine([
        {id:"guideLine1", direction: this.guideLineDir1, position: this.linePosition}
      ])

      Row(){

        Button('delPos').onClick(() => {
          this.linePosition = {}
        }).key('delPos')

        Button('changeVer').onClick(() => {
          this.guideLineDir1 = Axis.Vertical
        }).key('changeVer')

        Button('changeHor').onClick(() => {
          this.guideLineDir1 = Axis.Horizontal
        }).key('changeHor')

      }
    }
    .height('100%')
  }
}