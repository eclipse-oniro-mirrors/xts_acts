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
function buildPopup(param?: Params) {
  Column() {
    Text('popup').fontSize(12)
  }.width(100).height(40).padding(5)
}

@Entry
@Component
struct PromptActionOpenPopupNullTest {
  @State testResult: string = 'Ready for testing';
  @State lastError: string = '';

  build() {
    Row() {
      Column() {
        Text('openPopup Null/Undefined Test Page')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)


        Text('Test Result: ' + this.testResult)
          .fontSize(10)
          .id('openpopup_test_result')

        Text('Last Error: ' + this.lastError)
          .fontSize(10)
          .fontColor(Color.Red)
          .id('openpopup_last_error')

        Divider()

        // ========== openPopup with null/undefined parameters ==========
        Text('=== Null/Undefined Parameter Tests ===')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)

        // Test openPopup with null contentNode (param 1)
        Button('openPopup with null contentNode')
          .id('btn_openpopup_null_content')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const promptAction = context.getPromptAction();
              let uniqueId = this.getUniqueId();
              let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
              let targetId = frameNode?.getFirstChild()?.getUniqueId();
              promptAction.openPopup(null, { id: targetId }, { enableArrow: true });
              this.testResult = 'openPopup null contentNode: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openPopup null contentNode: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test openPopup with undefined contentNode (param 1)
        Button('openPopup with undefined contentNode')
          .id('btn_openpopup_undefined_content')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const promptAction = context.getPromptAction();
              let uniqueId = this.getUniqueId();
              let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
              let targetId = frameNode?.getFirstChild()?.getUniqueId();
              promptAction.openPopup(undefined, { id: targetId }, { enableArrow: true });
              this.testResult = 'openPopup undefined contentNode: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openPopup undefined contentNode: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test openPopup with null target (param 2)
        Button('openPopup with null target')
          .id('btn_openpopup_null_target')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildPopup));
              const promptAction = context.getPromptAction();
              promptAction.openPopup(contentNode, null, { enableArrow: true });
              this.testResult = 'openPopup null target: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openPopup null target: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test openPopup with undefined target (param 2)
        Button('openPopup with undefined target')
          .id('btn_openpopup_undefined_target')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildPopup));
              const promptAction = context.getPromptAction();
              promptAction.openPopup(contentNode, undefined, { enableArrow: true });
              this.testResult = 'openPopup undefined target: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openPopup undefined target: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test openPopup with null options (param 3)
        Button('openPopup with null options')
          .id('btn_openpopup_null_options')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildPopup));
              const promptAction = context.getPromptAction();
              let uniqueId = this.getUniqueId();
              let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
              let targetId = frameNode?.getFirstChild()?.getUniqueId();
              promptAction.openPopup(contentNode, { id: targetId }, null);
              this.testResult = 'openPopup null options: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openPopup null options: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test openPopup with undefined options (param 3)
        Button('openPopup with undefined options')
          .id('btn_openpopup_undefined_options')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              let context = this.getUIContext();
              const contentNode = new ComponentContent(context, wrapBuilder(buildPopup));
              const promptAction = context.getPromptAction();
              let uniqueId = this.getUniqueId();
              let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
              let targetId = frameNode?.getFirstChild()?.getUniqueId();
              promptAction.openPopup(contentNode, { id: targetId }, undefined);
              this.testResult = 'openPopup undefined options: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.testResult = 'openPopup undefined options: FAILED';
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