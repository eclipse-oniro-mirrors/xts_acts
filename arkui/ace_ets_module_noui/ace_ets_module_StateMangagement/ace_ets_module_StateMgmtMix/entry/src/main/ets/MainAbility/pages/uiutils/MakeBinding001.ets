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

import { Binding, MutableBinding, UIUtils } from '@kit.ArkUI';

@Builder
function customButton(num1: Binding<number>) {
  Row() {
    Text(num1.value.toString())
      .id('num1')
      .height('5%')
  }
}
@Builder
function customButton2(num2: MutableBinding<number>) {
  Row() {
    Text(num2.value.toString())
      .id('num2')
      .height('5%')
    Button(`Custom Button: ${num2.value}`)
      .id('button2')
      .height('5%')
      .onClick(() => {
        num2.value += 1;
      })
  }
}

@Entry
@ComponentV2
struct CompV2 {
  @Local number1: number = 5;
  @Local number2: number = 10;

  build() {
    Column() {

      customButton(
        UIUtils.makeBinding<number>(
          () => this.number1
        )
      )
      customButton2(
        UIUtils.makeBinding<number>(
          () => this.number2,
          (val: number) => {
            this.number2 = val;
          })
      )
    }
  }
}