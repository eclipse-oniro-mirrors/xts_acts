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
struct RelativeGuideLine2 {
  @State RelWidth: string = '70%'
  @State guideLineDir1: Axis = Axis.Horizontal
  @State guideLineDir2: Axis = Axis.Vertical
  @State buttonAlign: VerticalAlign = VerticalAlign.Top
  @State buttonPosition: Axis = Axis.Horizontal
  @State anchor1: string = 'guideLine1'
  @State linePosition: linePosition2 = { end: 50 }

  build() {
    Column() {
      RelativeContainer() {
        Button('top')
          .width(50)
          .height(50)
          .alignRules({
            bottom: { anchor: "guideLine1", align: this.buttonAlign },
            right: { anchor: this.anchor1, align: HorizontalAlign.Start }
          })
          .key('RelButton2')

      }
      .key('RelativeGuideLine2')
      .width(this.RelWidth).height('60%')
      .margin({left: 50, top:50})
      .backgroundColor(Color.Grey)
      .guideLine([
        {id:"guideLine1", direction: this.guideLineDir1, position: this.linePosition},
        {id:"guideLine2", direction: this.guideLineDir2, position: this.linePosition}
      ])

      Row(){

        Button('changeDir').onClick(() => {
          this.guideLineDir1 = Axis.Vertical
        }).key('changeDir2').width('30%')

        Button('changeId').onClick(() => {
          this.guideLineDir1 = Axis.Horizontal
          this.guideLineDir2 = Axis.Vertical
          this.anchor1 = 'guideLine2'
        }).key('changeId2').width('30%')

        Button('setEnd').onClick(() => {
          this.guideLineDir1 = Axis.Horizontal
          this.guideLineDir2 = Axis.Vertical
          this.anchor1 = 'guideLine2'
          this.linePosition = { end: -50 }
        }).key('setEnd').width('30%')

      }.height('10%')


    }
    .height('100%')
  }
}