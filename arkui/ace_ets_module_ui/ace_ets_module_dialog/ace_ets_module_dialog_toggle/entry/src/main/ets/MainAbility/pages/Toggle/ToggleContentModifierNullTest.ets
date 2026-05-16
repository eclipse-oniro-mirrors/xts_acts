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

import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ToggleContentModifierNullTest {
  @State testResult: string = 'Ready for testing';
  @State lastError: string = '';

  build() {
    Row() {
      Column() {
        Text('Toggle contentModifier Null/Undefined Test Page')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Text('Test Result: ' + this.testResult)
          .fontSize(16)
          .margin({ bottom: 10 })
          .id('contentModifier_test_result')

        Text('Last Error: ' + this.lastError)
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 20 })
          .id('contentModifier_last_error')

        Divider().margin({ bottom: 20 })

        // ========== contentModifier null 测试 ==========
        Text('=== contentModifier Null Test ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Button('Test contentModifier with null')
          .id('btn_contentModifier_null')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              Toggle({ type: ToggleType.Switch, isOn: false })
                .contentModifier(null)
                .onChange((isOn: boolean) => {
                  console.info('Switch is on:' + isOn);
                });
              this.testResult = 'contentModifier null: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'contentModifier null: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== contentModifier undefined 测试 ==========
        Text('=== contentModifier Undefined Test ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20, bottom: 10 })

        Button('Test contentModifier with undefined')
          .id('btn_contentModifier_undefined')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              Toggle({ type: ToggleType.Switch, isOn: false })
                .contentModifier(undefined)
                .onChange((isOn: boolean) => {
                  console.info('Switch is on:' + isOn);
                });
              this.testResult = 'contentModifier undefined: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'contentModifier undefined: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })
      }
      .width('100%')
      .height('100%')
      .padding(20)
    }
    .height('100%')
  }
}