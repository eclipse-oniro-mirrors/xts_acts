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
struct RelativeContainer_AnchorPoint_Interdependence {
  onPageShow() {
    console.info('RelativeContainer_AnchorPoint_Interdependence onPageShow');
  }

  build() {
    Row() {
      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            right: { anchor: "RelativeContainer_AnchorPoint_Interdependence_row2", align: HorizontalAlign.Start },
            bottom: { anchor: "RelativeContainer_AnchorPoint_Interdependence_row2", align: VerticalAlign.Top }
          })
          .key("RelativeContainer_AnchorPoint_Interdependence_row1")
          .id("RelativeContainer_AnchorPoint_Interdependence_row1")

        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "RelativeContainer_AnchorPoint_Interdependence_row1", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeContainer_AnchorPoint_Interdependence_row1", align: HorizontalAlign.End }
          })
          .key("RelativeContainer_AnchorPoint_Interdependence_row2")
          .id("RelativeContainer_AnchorPoint_Interdependence_row2")


        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF9966")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
          })
          .key("RelativeContainer_AnchorPoint_Interdependence_row3")
          .id("RelativeContainer_AnchorPoint_Interdependence_row3")

      }
      .key("RelativeContainer_AnchorPoint_Interdependence_re1")
      .width(300).height(300)

    }
    .height('100%')
  }
}