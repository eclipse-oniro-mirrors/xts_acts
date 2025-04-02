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
struct RelativeBarrier {
  build() {
    Row() {
      RelativeContainer() {
        Button('A')
          .height(150)
          .width(100)
          .id('RelativeBarrierBt1')
          .alignRules({
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
          })

        Button('B')
          .height(100)
          .width(100)
          .id('RelativeBarrierBt2')
          .alignRules({
            left: { anchor: "RelativeBarrierBt1", align: HorizontalAlign.End },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
          })

        Button('C')
          .height(100)
          .width(100)
          .id('RelativeBarrierBt3')
          .alignRules({
            right: { anchor: "__container__", align: HorizontalAlign.End },
            bottom: { anchor: "barrier1", align: VerticalAlign.Top }
          })


      }
      .id('RelativeBarrier')
      .width(300).height(300)
      .backgroundColor(Color.Grey)
      .margin({left: 50})
      .barrier([
        {id: "barrier1", direction: BarrierDirection.TOP, referencedId:["RelativeBarrierBt1", "RelativeBarrierBt2"]}
      ])
    }
    .height('100%')
  }
}