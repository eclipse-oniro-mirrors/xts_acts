/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct RelativeContainer_AnchorPoint_ThreeDirection {
  onPageShow() {
    console.info('RelativeContainer_AnchorPoint_ThreeDirection onPageShow');

  }

  build() {
    Row() {
      RelativeContainer() {
        Button("Button1")
          .width(120)
          .height(30)
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            middle: { anchor: "__container__", align: HorizontalAlign.Center }
          })
          .key("RelativeContainer_AnchorPoint_ThreeDirection_bt1")
          .id("RelativeContainer_AnchorPoint_ThreeDirection_bt1")
          .borderWidth(5)
          .borderColor(Color.Black)

        Text("This is text")
          .fontSize(20)
          .padding(10)
          .alignRules({
            right: { anchor: "RelativeContainer_AnchorPoint_ThreeDirection_bt1", align: HorizontalAlign.Center },
            top: { anchor: "__container__", align: VerticalAlign.Top },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            center: { anchor: "__container__", align: VerticalAlign.Center },
          })
          .key("RelativeContainer_AnchorPoint_ThreeDirection_tx2")
          .id("RelativeContainer_AnchorPoint_ThreeDirection_tx2")
          .borderWidth(2)
          .borderColor(Color.Green)
          .width(250)
      }
      .key("RelativeContainer_AnchorPoint_ThreeDirection_r1")
      .width(300).height(300)
    }
    .height('100%')
  }
}