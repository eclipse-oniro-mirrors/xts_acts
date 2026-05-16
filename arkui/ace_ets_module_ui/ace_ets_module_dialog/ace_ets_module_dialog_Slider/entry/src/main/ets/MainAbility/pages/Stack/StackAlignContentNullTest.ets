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
struct StackAlignContentNullTest {
  @State testResult: string = 'Ready for testing';
  @State lastError: string = '';

  build() {
    Row() {
      Column() {
        Text('Stack alignContent Null/Undefined Test Page')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Text('Test Result: ' + this.testResult)
          .fontSize(16)
          .margin({ bottom: 10 })
          .id('alignContent_test_result')

        Text('Last Error: ' + this.lastError)
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 20 })
          .id('alignContent_last_error')

        Divider().margin({ bottom: 20 })

        // ========== alignContent null 测试 ==========
        Text('=== alignContent Null Test ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Button('Test alignContent with null')
          .id('btn_alignContent_null')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              Stack(null)
                .width('100%')
                .height('30%')
                .backgroundColor(Color.Pink)
                .onClick(() => {
                  console.info('Stack clicked');
                });
              this.testResult = 'alignContent null: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'alignContent null: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== alignContent undefined 测试 ==========
        Text('=== alignContent Undefined Test ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20, bottom: 10 })

        Button('Test alignContent with undefined')
          .id('btn_alignContent_undefined')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              Stack(undefined)
                .width('100%')
                .height('30%')
                .backgroundColor(Color.Yellow)
                .onClick(() => {
                  console.info('Stack clicked');
                });
              this.testResult = 'alignContent undefined: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'alignContent undefined: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== alignContent 方法 null 测试 ==========
        Text('=== alignContent() Method Null Test ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20, bottom: 10 })

        Button('Test Stack.alignContent() with null')
          .id('btn_alignContent_method_null')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              Stack()
                .alignContent(null)
                .width('100%')
                .height('30%')
                .backgroundColor(Color.Blue)
                .onClick(() => {
                  console.info('Stack clicked');
                });
              this.testResult = 'alignContent() method null: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'alignContent() method null: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== alignContent 方法 undefined 测试 ==========
        Text('=== alignContent() Method Undefined Test ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20, bottom: 10 })

        Button('Test Stack.alignContent() with undefined')
          .id('btn_alignContent_method_undefined')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              Stack()
                .alignContent(undefined)
                .width('100%')
                .height('30%')
                .backgroundColor(Color.Green)
                .onClick(() => {
                  console.info('Stack clicked');
                });
              this.testResult = 'alignContent() method undefined: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'alignContent() method undefined: FAILED';
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