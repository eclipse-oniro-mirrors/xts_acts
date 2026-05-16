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
      // MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项1' })
      // MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项2' })
      MenuItem({  content: '菜单选项1' })
      MenuItem({  content: '菜单选项2' })
    }
  }
  .width('80%')
}

@Entry
@Component
struct PromptActionUpdateMenuNullTest {
  @State testResult: string = 'Ready for testing';
  @State lastError: string = '';

  build() {
    Row() {
      Column() {
        Text('updateMenu Null/Undefined/Boolean Test Page')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)

        Text('Test Result: ' + this.testResult)
          .fontSize(10)
          .id('updatemenu_test_result')

        Text('Last Error: ' + this.lastError)
          .fontSize(14)
          .fontColor(Color.Red)
          .id('updatemenu_last_error')

        Divider()

        // ========== updateMenu parameter tests ==========
        Text('=== Null/Undefined/Boolean Parameter Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)

        // Test updateMenu with null contentNode (param 1)
        Button('updateMenu with null contentNode')
          .id('btn_updatemenu_null_content')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const promptAction = context.getPromptAction();
              promptAction.updateMenu(null, { enableArrow: true }, false);
              this.testResult = 'updateMenu null contentNode: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'updateMenu null contentNode: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test updateMenu with undefined contentNode (param 1)
        Button('updateMenu with undefined contentNode')
          .id('btn_updatemenu_undefined_content')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const promptAction = context.getPromptAction();
              promptAction.updateMenu(undefined, { enableArrow: true }, false);
              this.testResult = 'updateMenu undefined contentNode: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'updateMenu undefined contentNode: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test updateMenu with null options (param 2)
        Button('updateMenu with null options')
          .id('btn_updatemenu_null_options')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildMenu));
              const promptAction = context.getPromptAction();
              promptAction.updateMenu(contentNode, null, false);
              this.testResult = 'updateMenu null options: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'updateMenu null options: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test updateMenu with undefined options (param 2)
        Button('updateMenu with undefined options')
          .id('btn_updatemenu_undefined_options')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildMenu));
              const promptAction = context.getPromptAction();
              promptAction.updateMenu(contentNode, undefined, false);
              this.testResult = 'updateMenu undefined options: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'updateMenu undefined options: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test updateMenu with true target (param 3)
        Button('updateMenu with true target')
          .id('btn_updatemenu_true_target')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildMenu));
              const promptAction = context.getPromptAction();
              promptAction.updateMenu(contentNode, { enableArrow: true }, true);
              this.testResult = 'updateMenu true target: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'updateMenu true target: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test updateMenu with false target (param 3)
        Button('updateMenu with false target')
          .id('btn_updatemenu_false_target')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildMenu));
              const promptAction = context.getPromptAction();
              promptAction.updateMenu(contentNode, { enableArrow: true }, false);
              this.testResult = 'updateMenu false target: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'updateMenu false target: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .margin({top:30})
    }
    .height('100%')
  }
}