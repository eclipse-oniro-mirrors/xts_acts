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
struct RelativeBarrier5 {
  @State isShow: boolean = false

  @State RelativeHeight: string = '60%'
  build() {
    Column() {
      Row() {
        RelativeContainer() {
          Button('A')
            .height('50%')
            .width('30%')
            .id('RelativeBarrier5Bt1')
            .alignRules({
              top: { anchor: "__container__", align: VerticalAlign.Top },
              left: { anchor: "__container__", align: HorizontalAlign.Start }
            })

          Button('B')
            .height('50%')
            .width('50%')
            .id('RelativeBarrier5Bt2')
            .alignRules({
              top: { anchor: "RelativeBarrier5Bt1", align: VerticalAlign.Top },
              left: { anchor: "__container__", align: HorizontalAlign.Start }
            })

          if (this.isShow) {
            Button('C')
              .height(this.RelativeHeight)
              .width('30%')
              .id('RelativeBarrier5Bt3')
              .alignRules({
                top: { anchor: "__container__", align: VerticalAlign.Top },
                left: { anchor: "barrier1", align: HorizontalAlign.Start }
              })
          }

        }
        .id('RelativeBarrier5')
        .width('80%').height('60%')
        .backgroundColor(Color.Grey)
        .barrier([
          {id: "barrier1", direction: BarrierDirection.RIGHT, referencedId:["RelativeBarrier5Bt1", "RelativeBarrier5Bt2"]},
          {id: "barrier2", direction: BarrierDirection.RIGHT, referencedId:["RelativeBarrier5Bt1", "RelativeBarrier5Bt2", "RelativeBarrier5Bt3"]}
        ])
      }
      Row() {
        Button('增加子组件').onClick(() => {
          this.isShow = true
        }).key('addChild')
      }
      

    }
    .height('100%')
  }
}