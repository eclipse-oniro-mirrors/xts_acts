/*
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
struct FlexWrapContent1 {
  @State width1: number = 50
  @State height1: number = 50
  build() {
    // constraintSize限制宽150 高100
    Column() {

      Flex() {
        Flex().width(this.width1).height(this.height1)
      }
      .id('FlexWrapContent1')
      .backgroundColor(Color.Pink)
      .width(LayoutPolicy.wrapContent)
      .height(LayoutPolicy.wrapContent)
    
      Row() {
        Button('160_120').onClick(() => {
          this.width1 = 160
          this.height1 = 120
        }).id('FlexButton1')
      }

    }.width(150).height(100).position({ x: 50, y: 100 })

  }
}