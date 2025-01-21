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
struct OutlineExample {
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        Text('outline')
          .key('outline_text')
          .margin({top:20})
          .backgroundColor(Color.Pink)
          .fontSize(50)
          .width(300)
          .height(300)
          .outline({
            width: { left: 3, right: 6, top: 10, bottom: 15 },
            color: { left: '#e3bbbb', right: Color.Blue, top: Color.Red, bottom: Color.Green },
            radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
            style: {
              left: OutlineStyle.SOLID,
              right: OutlineStyle.DASHED,
              top: OutlineStyle.DOTTED,
              bottom: OutlineStyle.DASHED
            }
          })
          .textAlign(TextAlign.Center)
      }
    }
  }
}