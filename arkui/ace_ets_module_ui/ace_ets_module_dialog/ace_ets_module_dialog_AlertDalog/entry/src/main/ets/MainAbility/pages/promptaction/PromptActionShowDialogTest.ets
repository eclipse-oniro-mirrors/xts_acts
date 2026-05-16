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
struct PromptActionShowDialogTest {
  @State dialogTestResult: string = 'Ready for testing';
  @State lastError: string = '';
  @State dialogIndex: number = 0;

  build() {
    Row() {
      Column() {
        Text('PromptAction ShowDialog Test Page')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Text('Test Result: ' + this.dialogTestResult)
          .fontSize(16)
          .margin({ bottom: 10 })
          .id('dialog_test_result')

        Text('Last Error: ' + this.lastError)
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 20 })
          .id('dialog_last_error')

        Text('Dialog Index: ' + this.dialogIndex)
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 20 })
          .id('dialog_index')

        Divider().margin({ bottom: 20 })

        // ========== buttons 测试 ==========
        Text('=== buttons Property Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        // Test buttons with empty array
        Button('Test buttons=[]')
          .id('btn_dialog_buttons_empty')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.dialogIndex++;
              promptAction.showDialog({
                title: 'Test Dialog',
                message: 'Dialog with empty buttons array',
                buttons: []
              }).then((data: promptAction.ShowDialogSuccessResponse) => {
                this.dialogTestResult = 'buttons empty: SUCCESS';
                this.lastError = '';
              }).catch((error: BusinessError) => {
                this.dialogTestResult = 'buttons empty: FAILED';
                this.lastError = `code: ${error.code}, message: ${error.message}`;
              });
            } catch (error) {
              let err = error as BusinessError;
              this.dialogTestResult = 'buttons empty: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test buttons with primary=true
        Button('Test buttons primary=true')
          .id('btn_dialog_buttons_primary_true')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.dialogIndex++;
              promptAction.showDialog({
                title: 'Test Dialog',
                message: 'Dialog with primary button',
                buttons: [
                  { text: 'Primary', color: '#0A59F7', primary: true },
                  { text: 'Secondary', color: '#000000', primary: false }
                ]
              }).then((data: promptAction.ShowDialogSuccessResponse) => {
                this.dialogTestResult = 'buttons primary true: SUCCESS';
                this.lastError = '';
              }).catch((error: BusinessError) => {
                this.dialogTestResult = 'buttons primary true: FAILED';
                this.lastError = `code: ${error.code}, message: ${error.message}`;
              });
            } catch (error) {
              let err = error as BusinessError;
              this.dialogTestResult = 'buttons primary true: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test buttons with primary=false
        Button('Test buttons primary=false')
          .id('btn_dialog_buttons_primary_false')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.dialogIndex++;
              promptAction.showDialog({
                title: 'Test Dialog',
                message: 'Dialog with non-primary button',
                buttons: [
                  { text: 'Non-Primary', color: '#0A59F7', primary: false }
                ]
              }).then((data: promptAction.ShowDialogSuccessResponse) => {
                this.dialogTestResult = 'buttons primary false: SUCCESS';
                this.lastError = '';
              }).catch((error: BusinessError) => {
                this.dialogTestResult = 'buttons primary false: FAILED';
                this.lastError = `code: ${error.code}, message: ${error.message}`;
              });
            } catch (error) {
              let err = error as BusinessError;
              this.dialogTestResult = 'buttons primary false: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== showInSubWindow 测试 ==========
        Text('=== showInSubWindow Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20, bottom: 10 })

        // Test showInSubWindow=true
        Button('Test showInSubWindow=true')
          .id('btn_dialog_showinsubwindow_true')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.dialogIndex++;
              promptAction.showDialog({
                title: 'Test Dialog',
                message: 'Dialog in sub window',
                buttons: [{ text: 'OK', color: '#0A59F7' }],
                showInSubWindow: true
              }).then((data: promptAction.ShowDialogSuccessResponse) => {
                this.dialogTestResult = 'showInSubWindow true: SUCCESS';
                this.lastError = '';
              }).catch((error: BusinessError) => {
                this.dialogTestResult = 'showInSubWindow true: FAILED';
                this.lastError = `code: ${error.code}, message: ${error.message}`;
              });
            } catch (error) {
              let err = error as BusinessError;
              this.dialogTestResult = 'showInSubWindow true: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test showInSubWindow=false
        Button('Test showInSubWindow=false')
          .id('btn_dialog_showinsubwindow_false')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.dialogIndex++;
              promptAction.showDialog({
                title: 'Test Dialog',
                message: 'Dialog in main window',
                buttons: [{ text: 'OK', color: '#0A59F7' }],
                showInSubWindow: false
              }).then((data: promptAction.ShowDialogSuccessResponse) => {
                this.dialogTestResult = 'showInSubWindow false: SUCCESS';
                this.lastError = '';
              }).catch((error: BusinessError) => {
                this.dialogTestResult = 'showInSubWindow false: FAILED';
                this.lastError = `code: ${error.code}, message: ${error.message}`;
              });
            } catch (error) {
              let err = error as BusinessError;
              this.dialogTestResult = 'showInSubWindow false: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== enableHoverMode 测试 ==========
        Text('=== enableHoverMode Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20, bottom: 10 })

        // Test enableHoverMode=true
        Button('Test enableHoverMode=true')
          .id('btn_dialog_enablehovermode_true')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.dialogIndex++;
              promptAction.showDialog({
                title: 'Test Dialog',
                message: 'Dialog with hover enabled',
                buttons: [{ text: 'OK', color: '#0A59F7' }],
                enableHoverMode: true
              }).then((data: promptAction.ShowDialogSuccessResponse) => {
                this.dialogTestResult = 'enableHoverMode true: SUCCESS';
                this.lastError = '';
              }).catch((error: BusinessError) => {
                this.dialogTestResult = 'enableHoverMode true: FAILED';
                this.lastError = `code: ${error.code}, message: ${error.message}`;
              });
            } catch (error) {
              let err = error as BusinessError;
              this.dialogTestResult = 'enableHoverMode true: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test enableHoverMode=false
        Button('Test enableHoverMode=false')
          .id('btn_dialog_enablehovermode_false')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.dialogIndex++;
              promptAction.showDialog({
                title: 'Test Dialog',
                message: 'Dialog with hover disabled',
                buttons: [{ text: 'OK', color: '#0A59F7' }],
                enableHoverMode: false
              }).then((data: promptAction.ShowDialogSuccessResponse) => {
                this.dialogTestResult = 'enableHoverMode false: SUCCESS';
                this.lastError = '';
              }).catch((error: BusinessError) => {
                this.dialogTestResult = 'enableHoverMode false: FAILED';
                this.lastError = `code: ${error.code}, message: ${error.message}`;
              });
            } catch (error) {
              let err = error as BusinessError;
              this.dialogTestResult = 'enableHoverMode false: FAILED';
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
          .id('btn_dialog_options_null')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.dialogIndex++;
              // Test passing null as options parameter
              promptAction.showDialog(null).then((data: promptAction.ShowDialogSuccessResponse) => {
                this.dialogTestResult = 'options null: SUCCESS';
                this.lastError = '';
              }).catch((error: BusinessError) => {
                this.dialogTestResult = 'options null: FAILED';
                this.lastError = `code: ${error.code}, message: ${error.message}`;
              });
            } catch (error) {
              let err = error as BusinessError;
              this.dialogTestResult = 'options null: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test options with undefined
        Button('Test options=undefined')
          .id('btn_dialog_options_undefined')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.dialogIndex++;
              // Test passing undefined as options parameter
              promptAction.showDialog(undefined).then((data: promptAction.ShowDialogSuccessResponse) => {
                this.dialogTestResult = 'options undefined: SUCCESS';
                this.lastError = '';
              }).catch((error: BusinessError) => {
                this.dialogTestResult = 'options undefined: FAILED';
                this.lastError = `code: ${error.code}, message: ${error.message}`;
              });
            } catch (error) {
              let err = error as BusinessError;
              this.dialogTestResult = 'options undefined: FAILED';
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