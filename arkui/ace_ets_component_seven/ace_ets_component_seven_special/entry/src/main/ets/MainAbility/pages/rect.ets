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

class RectModifier1 implements AttributeModifier<RectAttribute>{
  applyNormalAttribute(instance: RectAttribute): void {
    instance.radiusHeight(8);
  }
}

class RectModifier2 implements AttributeModifier<RectAttribute>{
  applyNormalAttribute(instance: RectAttribute): void {
    instance.radius(6);
  }
}

class RectModifier3 implements AttributeModifier<RectAttribute>{
  applyNormalAttribute(instance: RectAttribute): void {
    instance.radiusWidth(12);
  }
}

@Entry
@Component
struct RectTest {
  @State RectModifier1: RectModifier1 = new RectModifier1()
  @State RectModifier2: RectModifier1 = new RectModifier2()
  @State RectModifier3: RectModifier1 = new RectModifier3()
  @State value: number = 0

  build() {
      Column() {
          Rect({ width: '80%', height: '20%' })
          .key("Rect1")
          .attributeModifier(this.RectModifier1)

          Rect({ width: '60%', height: '30%' })
          .key("Rect2")
          .attributeModifier(this.RectModifier2)

          Rect({ width: '40%', height: '40%' })
          .key("Rect3")
          .attributeModifier(this.RectModifier3)

          Rect({ width: '80%', height: '20%' })
          .key("Rect11")
          .radiusHeight(8);

          Rect({ width: '60%', height: '30%' })
          .key("Rect22")
          .radius(6);

          Rect({ width: '40%', height: '40%' })
          .key("Rect33")
          .radiusWidth(12);
      }
  }
}
