'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, AttributeModifier, CounterAttribute, Counter, Text, Row } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class CounterModifier1 implements AttributeModifier<CounterAttribute>{
  applyNormalAttribute(instance: CounterAttribute): void {
    instance.enableInc(true)
    instance.enableDec(true)
  }
}

@Entry
@Component
struct CounterTest {
  @State CounterModifier1: CounterModifier1 = new CounterModifier1()
  @State value: number = 0

  build() {
    Row() {
      Column() {
        Counter() {
          Text(this.value.toString())
        }
        .key("Counter")
        .margin(100)
        .attributeModifier(this.CounterModifier1)
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
