/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct EdgeOutlineWidthsPage {
  @State edgeOutlineWidths: EdgeOutlineWidths = {left: '20px', right: '10fp', top: '40lpx', bottom: 80};
  @State outlineColorValue: EdgeColors ={top: Color.Red, right: 0xAFEEEE, bottom: '0xAFEEEE' ,left: $r('app.color.left_Color')}

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        Text('DOTTED')
          .id('testId')
          .backgroundColor(Color.Pink)
          .outline({ width: 5, color: 0x317AF7, radius: 10, style: OutlineStyle.DOTTED })
          .outlineWidth(this.edgeOutlineWidths)
          .outlineColor(this.outlineColorValue)
      }.width('100%').height(150)
    }
  }
}