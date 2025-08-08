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
import { CounterModifier } from "@ohos.arkui.modifier";

class CustomModifier extends CounterModifier{

  applyNormalAttribute(instance: CounterAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.enableInc(false)
  }
}

@Entry
@Component
struct CounterTest {
  @State customModifier: CounterModifier = new CustomModifier()
    .enableInc(true)
    .enableDec(true)
  @State value: number = 0

  build() {
    Row() {
      Column() {
        Button("change value").onClick(() => {
          (this.customModifier as CustomModifier).onChange1();
        }).key("changeButton")

        Counter() {
          Text(this.value.toString())
        }
        .key("Counter")
        .margin(100)
        .attributeModifier(this.customModifier as CustomModifier)
        .onInc(() => {
            this.value++
          })
        .onDec(() => {
            this.value--
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
