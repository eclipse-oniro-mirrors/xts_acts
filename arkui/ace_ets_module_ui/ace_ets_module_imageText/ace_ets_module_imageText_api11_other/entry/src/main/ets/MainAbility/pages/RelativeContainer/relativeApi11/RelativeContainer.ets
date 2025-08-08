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
struct Index44 {
  @State text: string = '111'
  build() {
    Row() {
      Text(this.text).fontSize(14).fontColor(Color.Red).id('RelativeContainerText')

      RelativeContainer() {
        Button('A').width(100).height(150).alignRules({
          bottom:{ anchor:"__container__",align:VerticalAlign.Bottom},
          left: {anchor: "__container__", align: HorizontalAlign.Start},
        }).id("buttonRelativeContainer").borderWidth(1).borderColor(Color.Black)
          .onClick(() => {
            this.text = '222'
          })

        Button('B').width(100).height(150).alignRules({
          bottom:{ anchor:"__container__",align:VerticalAlign.Bottom},
          left: {anchor: "__container__", align: HorizontalAlign.End},
        }).id("button2").borderWidth(1).borderColor(Color.Black)


        Button('C').width(100).height(150).alignRules({
          bottom:{ anchor:"__container__",align:VerticalAlign.Top},
          right: {anchor: "__container__", align: HorizontalAlign.End},
        }).id("button3").borderWidth(1).borderColor(Color.Black)


      }
      .width(300).height(300)
      .margin({left: 50})
      .border({width:2,color:"#6699FF"})
      .barrier([{id:"barrier",direction: BarrierDirection.RIGHT,referencedId:["button1","button2"]}])
    }
    .height('100%')
  }
}