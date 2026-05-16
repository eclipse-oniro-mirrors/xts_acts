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
struct PromptActionShowActionMenuNullTest {
  @State testResult: string = 'Ready for testing';
  @State lastError: string = '';

  build() {
    Row() {
      Column() {
        Text('showActionMenu Null/Undefined Test Page')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Text('Test Result: ' + this.testResult)
          .fontSize(16)
          .margin({ bottom: 10 })
          .id('actionmenu_test_result')

        Text('Last Error: ' + this.lastError)
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 20 })
          .id('actionmenu_last_error')

        Divider().margin({ bottom: 20 })

        // ========== showActionMenu with null options ==========
        Text('=== Null/Undefined Parameter Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        // Test showActionMenu with null options
        Button('showActionMenu with null options')
          .id('btn_actionmenu_null')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              promptAction.showActionMenu(null);
              this.testResult = 'showActionMenu null: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'showActionMenu null: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test showActionMenu with undefined options
        Button('showActionMenu with undefined options')
          .id('btn_actionmenu_undefined')
          .width('80%')
          .height('5%')
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              promptAction.showActionMenu(undefined);
              this.testResult = 'showActionMenu undefined: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'showActionMenu undefined: FAILED';
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
  