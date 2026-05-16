/*
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

import { BusinessError } from '@kit.BasicServicesKit';
// import { ResourceColor } from '@ohos.arkui.component';

@Entry
@Component
struct CheckboxGroupSelectedColorNullTest {
  @State testResult: string = 'Ready for testing';
  @State lastError: string = '';

  build() {
    Row() {
      Column() {
        Text('CheckboxGroup selectedColor() Null/Undefined Test Page')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Text('Test Result: ' + this.testResult)
          .fontSize(16)
          .margin({ bottom: 10 })
          .id('checkboxGroup_selectedColor_test_result')

        Text('Last Error: ' + this.lastError)
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 20 })
          .id('checkboxGroup_selectedColor_last_error')

        Divider().margin({ bottom: 20 })

        // ========== selectedColor null 测试 ==========
        Text('=== selectedColor() Null Test ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Button('Test selectedColor() with null')
          .id('btn_selectedColor_null')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              CheckboxGroup()
                .selectedColor(null)
                .width('100%')
                .height('30%')
                .onClick(() => {
                  console.info('CheckboxGroup clicked');
                });
              this.testResult = 'selectedColor null: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'selectedColor null: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== selectedColor undefined 测试 ==========
        Text('=== selectedColor() Undefined Test ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20, bottom: 10 })

        Button('Test selectedColor() with undefined')
          .id('btn_selectedColor_undefined')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              CheckboxGroup()
                .selectedColor(undefined)
                .width('100%')
                .height('30%')
                .onClick(() => {
                  console.info('CheckboxGroup clicked');
                });
              this.testResult = 'selectedColor undefined: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'selectedColor undefined: FAILED';
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