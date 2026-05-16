/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class LineModifier1 implements AttributeModifier<LineAttribute> {
  applyNormalAttribute(instance: LineAttribute): void {
    instance
      .startPoint([0, 1])
      .endPoint([200, 220])
  }
}

@Entry
@Component
struct LineNe {
  @State lineModifier: LineModifier1 = new LineModifier1()

  build() {
    Column() {

      Line()
        .fillOpacity(0)
        .stroke(Color.Red)
        .strokeWidth(3)
        .key("LineKey1")
        .attributeModifier(this.lineModifier)
    }
    .width('100%')
    .height('100%')
  }
}

