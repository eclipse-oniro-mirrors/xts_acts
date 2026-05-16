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

import { ComponentContent, FrameNode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class Params {
  private text: string = ''

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildMenu(param?: Params) {
  Column() {
    Menu() {
      MenuItem({  content: '菜单选项1' })
      MenuItem({  content: '菜单选项2' })
    }
  }
  .width('80%')
}

@Entry
@Component
struct PromptActionCloseMenuNullTest {
  @State testResult: string = 'Ready for testing';
  @State lastError: string = '';

  build() {
    Row() {
      Column() {
        Text('closeMenu Null/Undefined Test Page')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)

        Text('Test Result: ' + this.testResult)
          .fontSize(10)

          .id('closemenu_test_result')

        Text('Last Error: ' + this.lastError)
          .fontSize(14)
          .fontColor(Color.Red)

          .id('closemenu_last_error')

        Divider()

        // ========== closeMenu with null/undefined parameters ==========
        Text('=== Null/Undefined Parameter Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)


        // Test closeMenu with null contentNode (param 1)
        Button('closeMenu with null contentNode')
          .id('btn_closemenu_null_content')
          .width('80%')
          .height('5%')

          .onClick(() => {
            try {
              let context = this.getUIContext();
              const promptAction = context.getPromptAction();
              promptAction.closeMenu(null);
              this.testResult = 'closeMenu null contentNode: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'closeMenu null contentNode: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test closeMenu with undefined contentNode (param 1)
        Button('closeMenu with undefined contentNode')
          .id('btn_closemenu_undefined_content')
          .width('80%')
          .height('5%')

          .onClick(() => {
            try {
              let context = this.getUIContext();
              const promptAction = context.getPromptAction();
              promptAction.closeMenu(undefined);
              this.testResult = 'closeMenu undefined contentNode: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'closeMenu undefined contentNode: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .margin({top:40})
    }
    .height('100%')
  }
}