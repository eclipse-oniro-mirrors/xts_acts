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
struct PromptActionOpenMenuNullTest {
  @State testResult: string = 'Ready for testing';
  @State lastError: string = '';

  build() {
    Row() {
      Column() {
        Text('openMenu Null/Undefined Test Page')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)

        Text('Test Result: ' + this.testResult)
          .fontSize(10)
          .id('openmenu_test_result')

        Text('Last Error: ' + this.lastError)
          .fontSize(14)
          .fontColor(Color.Red)
          .id('openmenu_last_error')

        Divider()

        // ========== openMenu with null/undefined parameters ==========
        Text('=== Null/Undefined Parameter Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)

        // Test openMenu with null contentNode (param 1)
        Button('openMenu with null contentNode')
          .id('btn_openmenu_null_content')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const promptAction = context.getPromptAction();
              promptAction.openMenu(null, { id: 'btn', componentId: 0 }, { enableArrow: true });
              this.testResult = 'openMenu null contentNode: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openMenu null contentNode: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test openMenu with undefined contentNode (param 1)
        Button('openMenu with undefined contentNode')
          .id('btn_openmenu_undefined_content')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const promptAction = context.getPromptAction();
              promptAction.openMenu(undefined, { id: 'btn', componentId: 0 }, { enableArrow: true });
              this.testResult = 'openMenu undefined contentNode: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openMenu undefined contentNode: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test openMenu with null target (param 2)
        Button('openMenu with null target')
          .id('btn_openmenu_null_target')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildMenu));
              const promptAction = context.getPromptAction();
              promptAction.openMenu(contentNode, null, { enableArrow: true });
              this.testResult = 'openMenu null target: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openMenu null target: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test openMenu with undefined target (param 2)
        Button('openMenu with undefined target')
          .id('btn_openmenu_undefined_target')
          .width('80%')
          .height('5%')

          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildMenu));
              const promptAction = context.getPromptAction();
              promptAction.openMenu(contentNode, undefined, { enableArrow: true });
              this.testResult = 'openMenu undefined target: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openMenu undefined target: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test openMenu with null options (param 3)
        Button('openMenu with null options')
          .id('btn_openmenu_null_options')
          .width('80%')
          .height('5%')

          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildMenu));
              const promptAction = context.getPromptAction();
              let uniqueId = this.getUniqueId();
              let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
              promptAction.openMenu(contentNode, { id: 'btn', componentId: frameNode?.getUniqueId() }, null);
              this.testResult = 'openMenu null options: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openMenu null options: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test openMenu with undefined options (param 3)
        Button('openMenu with undefined options')
          .id('btn_openmenu_undefined_options')
          .width('80%')
          .height('5%')

          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildMenu));
              const promptAction = context.getPromptAction();
              let uniqueId = this.getUniqueId();
              let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
              promptAction.openMenu(contentNode, { id: 'btn', componentId: frameNode?.getUniqueId() }, undefined);
              this.testResult = 'openMenu undefined options: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openMenu undefined options: FAILED';
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