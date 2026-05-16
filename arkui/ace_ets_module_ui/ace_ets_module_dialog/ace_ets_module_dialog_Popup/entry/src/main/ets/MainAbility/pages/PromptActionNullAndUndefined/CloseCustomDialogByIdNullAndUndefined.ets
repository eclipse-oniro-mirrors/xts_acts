/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of this License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { PromptAction, promptAction, UIContext } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct CloseCustomDialogByIdNullAndUndefined {
  @State resultText: string = 'Init';
  @State dialogId: number = -1;
  private ctx: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.ctx.getPromptAction();

  @Builder
  customDialogBuilder() {
    Column() {
      Text('Custom Dialog')
        .fontWeight(FontWeight.Bold)
        .height('50%').width('100%')
    }.backgroundColor('#FFF0F0F0').height('5%').width('10%')
  }

  build() {
    Column() {
      Text('CloseCustomDialogById Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height('5%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultTextCloseById')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Button('Open Dialog')
            .id('btnOpenCustomDialogById')
            .width('45%')
            .onClick(() => {
              this.promptAction.openCustomDialog({
                builder: () => {
                  this.customDialogBuilder()
                }
              }).then((id: number) => {
                this.dialogId = id;
                this.resultText = 'open dialog success, id: ' + id;
              }).catch((err: BusinessError) => {
                this.resultText = 'open dialog error: ' + err.code;
              });
            })

          Button('Close by DialogId')
            .id('btnCloseCustomDialogByIdSuccess')
            .width('45%')

            .onClick(() => {
              if (this.dialogId >= 0) {
                try {
                  this.promptAction.closeCustomDialog(this.dialogId);
                  this.resultText = 'close by dialogId success';
                  this.dialogId = -1;
                } catch (err) {
                  this.resultText = 'close by dialogId error: ' + ((err as BusinessError).code);
                }
              } else {
                this.resultText = 'dialogId not available';
              }
            })

          Button('DialogId null')
            .id('btnCloseCustomDialogByIdNull')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.closeCustomDialog(null as ESObject);
                this.resultText = 'dialogId null success';
              } catch (err) {
                this.resultText = 'dialogId null error: ' + ((err as BusinessError).code);
              }
            })

          Button('DialogId undefined')
            .id('btnCloseCustomDialogByIdUndefined')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.closeCustomDialog(undefined as ESObject);
                this.resultText = 'dialogId undefined success';
              } catch (err) {
                this.resultText = 'dialogId undefined error: ' + ((err as BusinessError).code);
              }
            })
        }
      }
      .width('100%')
      .height('85%')
    }
    .width('100%')
    .height('100%')
  }
}
