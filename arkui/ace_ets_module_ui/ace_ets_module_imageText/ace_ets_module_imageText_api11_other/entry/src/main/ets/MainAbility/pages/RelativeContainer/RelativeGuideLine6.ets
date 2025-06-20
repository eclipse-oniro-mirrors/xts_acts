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
struct RelativeGuideLine6 {

  build() {
    Column() {
      RelativeContainer() {
        // 多个子组件 25 26
        Button('top')
          .width(100)
          .height(100)
          .backgroundColor(Color.White)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          })
          .key('RelButton6_1')
        Button('top')
          .width(70)
          .height(70)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          })
          .key('RelButton6_2')
        Button('top')
          .width(50)
          .height(50)
          .backgroundColor(Color.Green)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          })
          .key('RelButton6_3')

      }
      .key('RelativeGuideLine6')
      .width(300).height(300)
      .margin({left: 50, top:5})
      .backgroundColor(Color.Grey)
      .guideLine([
        {id:"guideLine1", direction: Axis.Vertical, position: { start: 50 }}

      ])


      RelativeContainer() {
        // 多个子组件 25 26
        Button('top')
          .width(100)
          .height(100)
          .backgroundColor(Color.White)
          .zIndex(2)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          })
          .key('RelButton6_4')
        Button('top')
          .width(70)
          .height(70)
          .zIndex(1)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          })
          .key('RelButton6_5')
        Button('top')
          .width(50)
          .height(50)
          .zIndex(0)
          .backgroundColor(Color.Green)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          })
          .key('RelButton6_6')

      }
      .key('RelativeGuideLine6_2')
      .width(300).height(300)
      .margin({left: 50, top:100})
      .backgroundColor(Color.Grey)
      .guideLine([
        {id:"guideLine1", direction: Axis.Vertical, position: { start: 50 }}

      ])

    }
    .height('100%')
  }
}