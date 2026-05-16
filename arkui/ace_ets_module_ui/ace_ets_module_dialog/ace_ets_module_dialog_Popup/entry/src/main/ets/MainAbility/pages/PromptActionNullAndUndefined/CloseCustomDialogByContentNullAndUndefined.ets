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

import { PromptAction, promptAction, UIContext, ComponentContent } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class DialogParams {
  public text: string = '';
  public onClose?: () => void;

  constructor(text: string, onClose?: () => void) {
    this.text = text;
    this.onClose = onClose;
  }
}

@Builder
function buildDialog(params: DialogParams) {
  Column() {
    Text(params.text)
      .fontWeight(FontWeight.Bold)
      .height('50%').width('100%')
    Button('Close')
      .onClick(() => {
        if (params.onClose) {
          params.onClose();
        }
      })
      .height('50%').width('100%')
  }.backgroundColor('#FFF0F0F0').height('5%').width('10%')
}

@Entry
@Component
struct CloseCustomDialogByContentNullAndUndefined {
  @State resultText: string = 'Init';
  private ctx: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.ctx.getPromptAction();
  private contentNode: ComponentContent<DialogParams> | null = null;

  aboutToAppear(): void {
    this.contentNode = new ComponentContent(this.ctx, wrapBuilder(buildDialog),
      new DialogParams('Test Dialog', () => {
        if (this.contentNode && this.promptAction) {
          this.promptAction.closeCustomDialog(this.contentNode);
        }
      }));
  }

  build() {
    Column() {
      Text('CloseCustomDialogByContent Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height('5%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultTextCloseByContent')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Button('Close by Content Success')
            .id('btnCloseCustomDialogByContentSuccess')
            .width('45%')
            .onClick(async () => {
              if (this.contentNode) {
                try {
                  await this.promptAction.closeCustomDialog(this.contentNode!);
                  this.resultText = 'close by content success';
                } catch (err) {
                  this.resultText = 'close by content error: ' + ((err as BusinessError).code);
                }
              }
            })

          Button('Content null')
            .id('btnCloseCustomDialogByContentNull')
            .width('45%')

            .onClick(async () => {
              try {
                await this.promptAction.closeCustomDialog(null as ESObject);
                this.resultText = 'content null success';
              } catch (err) {
                this.resultText = 'content null error: ' + ((err as BusinessError).code);
              }
            })

          Button('Content undefined')
            .id('btnCloseCustomDialogByContentUndefined')
            .width('45%')

            .onClick(async () => {
              try {
                await this.promptAction.closeCustomDialog(undefined as ESObject);
                this.resultText = 'content undefined success';
              } catch (err) {
                this.resultText = 'content undefined error: ' + ((err as BusinessError).code);
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
