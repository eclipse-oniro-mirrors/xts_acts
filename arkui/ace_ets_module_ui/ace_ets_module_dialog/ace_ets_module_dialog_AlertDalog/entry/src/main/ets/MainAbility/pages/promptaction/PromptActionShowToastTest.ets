/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import promptAction from '@ohos.promptAction';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct PromptActionShowToastTest {
  @State toastTestResult: string = 'Ready for testing';
  @State lastError: string = '';

  build() {
    Row() {
      Column() {
        Text('PromptAction ShowToast Test Page')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Text('Test Result: ' + this.toastTestResult)
          .fontSize(16)
          .margin({ bottom: 10 })
          .id('toast_test_result')

        Text('Last Error: ' + this.lastError)
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 20 })
          .id('toast_last_error')

        Divider().margin({ bottom: 20 })

        // ========== bottom 属性测试 ==========
        Text('=== bottom Property Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        // Test bottom with empty string
        Button('Test bottom=""')
          .id('btn_toast_bottom_empty')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              promptAction.showToast({
                message: 'Toast with empty bottom',
                bottom: ''
              });
              this.toastTestResult = 'bottom empty string: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'bottom empty string: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== showMode 枚举测试 ==========
        Text('=== showMode Enum Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20, bottom: 10 })

        // Test showMode DEFAULT
        Button('Test showMode=DEFAULT(0)')
          .id('btn_toast_showmode_default')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              promptAction.showToast({
                message: 'Toast with DEFAULT mode',
                showMode: promptAction.ToastShowMode.DEFAULT
              });
              this.toastTestResult = 'showMode DEFAULT: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'showMode DEFAULT: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test showMode TOP_MOST
        Button('Test showMode=TOP_MOST(1)')
          .id('btn_toast_showmode_topmost')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              promptAction.showToast({
                message: 'Toast with TOP_MOST mode',
                showMode: promptAction.ToastShowMode.TOP_MOST
              });
              this.toastTestResult = 'showMode TOP_MOST: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'showMode TOP_MOST: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== enableHoverMode 测试 ==========
        Text('=== enableHoverMode Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20, bottom: 10 })

        // Test enableHoverMode = true
        Button('Test enableHoverMode=true')
          .id('btn_toast_enablehovermode_true')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              promptAction.showToast({
                message: 'Toast with hover enabled',
                enableHoverMode: true
              });
              this.toastTestResult = 'enableHoverMode true: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'enableHoverMode true: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test enableHoverMode = false
        Button('Test enableHoverMode=false')
          .id('btn_toast_enablehovermode_false')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              promptAction.showToast({
                message: 'Toast with hover disabled',
                enableHoverMode: false
              });
              this.toastTestResult = 'enableHoverMode false: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'enableHoverMode false: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== null/undefined 参数测试 ==========
        Text('=== Null/Undefined Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20, bottom: 10 })

// Test options with null
        Button('Test options=null')
          .id('btn_toast_options_null')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              // Test passing null as options parameter
              promptAction.showToast(null);
              this.toastTestResult = 'options null: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'options null: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test options with undefined
        Button('Test options=undefined')
          .id('btn_toast_options_undefined')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              // Test passing undefined as options parameter
              promptAction.showToast(undefined);
              this.toastTestResult = 'options undefined: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'options undefined: FAILED';
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
