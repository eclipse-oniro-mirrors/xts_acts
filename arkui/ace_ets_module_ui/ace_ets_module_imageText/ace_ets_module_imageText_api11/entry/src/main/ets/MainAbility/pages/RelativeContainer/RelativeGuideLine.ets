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
interface linePosition1 {
  start?:Dimension,
  end?:Dimension
}
@Entry
@Component
struct RelativeGuideLine {
  @State RelWidth: string = '300'
  @State guideLineDir1: Axis = Axis.Horizontal
  @State guideLineDir2: Axis = Axis.Vertical
  @State buttonAlign: VerticalAlign = VerticalAlign.Top
  @State buttonPosition: Axis = Axis.Horizontal
  @State anchor1: string = 'guideLine1'
  @State anchor2: string = 'guideLine1'
  @State linePosition: linePosition1 = { start: 50 }

  build() {
    Column() {
      RelativeContainer() {
        Button('top')
          .width(50)
          .height(50)
          .alignRules({
            top: { anchor: this.anchor1, align: this.buttonAlign },
            left: { anchor: this.anchor2, align: HorizontalAlign.Start }
          })
          .key('RelButton')

      }
      .key('RelativeGuideLine1')
      .width(this.RelWidth).height(300)
      .margin({left: 50, top:100})
      .backgroundColor(Color.Grey)
      .guideLine([
        {id:"guideLine1", direction: this.guideLineDir1, position: this.linePosition},
        {id:"guideLine2", direction: this.guideLineDir2, position: this.linePosition}

      ])

      Row(){
        // start
        Button('changeDir').onClick(() => {
          this.guideLineDir1 = Axis.Vertical
        }).key('changeDir')

        Button('changeId').onClick(() => {
          this.guideLineDir1 = Axis.Horizontal
          this.guideLineDir2 = Axis.Vertical
          this.anchor2 = 'guideLine2'
        }).key('changeId')
      }

      Row(){
        Button('allNoSet').onClick(() => {
          this.anchor2 = 'guideLine1'
          this.linePosition = {}
        }).key('allNoSet')

        Button('setStartVp').onClick(() => {
          this.anchor2 = 'guideLine1'
          this.guideLineDir1 = Axis.Horizontal
          this.linePosition = { start: 50 }
        }).key('setStartVp')

      }

      Row(){
        Button('setStartPx').onClick(() => {
          this.anchor2 = 'guideLine1'
          this.guideLineDir1 = Axis.Horizontal
          this.linePosition = { start: '50px' }
        }).key('setStartPx')


        Button('setStartLpx').onClick(() => {
          this.anchor2 = 'guideLine1'
          this.guideLineDir1 = Axis.Horizontal
          this.linePosition = { start: '50lpx' }
        }).key('setStartLpx')

        Button('setStartPer').onClick(() => {
          this.anchor2 = 'guideLine1'
          this.guideLineDir1 = Axis.Horizontal
          this.linePosition = { start: '50%' }
        }).key('setStartPer')

      }

      Row() {
        Button('setStartRes').onClick(() => {
          this.anchor2 = 'guideLine1'
          this.guideLineDir1 = Axis.Horizontal
          this.linePosition = { start: $r('app.string.start_50') }
        }).key('setStartRes')

        Button('changeWidth').onClick(() => {
          this.RelWidth = 'auto'
          this.guideLineDir1 = Axis.Vertical
          this.linePosition = { start: 50 }
        }).key('changeWidth')

        Button('start 50%').onClick(() => {
          this.RelWidth = 'auto'
          this.guideLineDir1 = Axis.Vertical
          this.linePosition = { start: '50%' }
        }).key('changeWidth2')
      }

      Row() {
        Button('end 50').onClick(() => {
          this.RelWidth = 'auto'
          this.guideLineDir1 = Axis.Vertical
          this.linePosition = { end: 50 }
        }).key('changeWidth3')

        Button('start 80').onClick(() => {
          this.RelWidth = '300'
          this.guideLineDir1 = Axis.Horizontal
          this.linePosition = { start: 80 }
        }).key('changeStart4')
      }

    }
    .height('100%')
  }
}