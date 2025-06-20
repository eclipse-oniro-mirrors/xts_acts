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
class PolyLinePoints implements AttributeModifier<PolylineAttribute> {
  applyNormalAttribute(instance: PolylineAttribute): void {
    instance.points([[0, 0], [20, 60], [100, 100]]);
  }
}

@Entry
@Component
  struct PolyLinePointsExample {
  @State buttonMod: PolyLinePoints = new PolyLinePoints()
  build() {
    Column({ space: 10 }) {
      Polyline({ width: 100, height: 100 })
        .attributeModifier(this.buttonMod)
        .key("polyLine")
        .fillOpacity(0)
        .stroke(Color.Blue)
        .strokeWidth(3)

        Polyline({ width: 100, height: 100 })
        .points([[0, 0], [20, 60], [100, 100]])
        .key("polyLine1")
        .fillOpacity(0)
        .stroke(Color.Blue)
        .strokeWidth(3)

    }.width('100%')
  }
}

