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

import { PromptAction, UIContext, ComponentContent } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class PopupParams {
  public text: string = 'Test Popup';
  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildPopup(params: PopupParams) {
  Column() {
    Text(params.text)
      .fontSize(10)
      .fontWeight(FontWeight.Bold)
  }.backgroundColor('#FFF0F0F0')
}

@Entry
@Component
struct ClosePopupNullAndUndefined {
  @State resultText: string = 'Init';
  private ctx: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.ctx.getPromptAction();
  private contentNode: ComponentContent<PopupParams> | null = null;
  private popupOpened: boolean = false;

  aboutToAppear(): void {
    this.contentNode = new ComponentContent(this.ctx, wrapBuilder(buildPopup), new PopupParams('Test Popup'));
  }

  aboutToDisappear(): void {
    try {
      if (this.popupOpened && this.contentNode && this.promptAction) {
        this.promptAction.closePopup(this.contentNode);
        this.popupOpened = false;
      }
    } catch (err) {
      console.error('aboutToDisappear close popup error: ' + (err as BusinessError).code);
    }
  }

  build() {
    Column() {
      Text('ClosePopup Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height('5%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultTextClosePopup')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Button('Open Popup')
            .id('btnOpenPopup')
            .width('45%')
            .onClick(async () => {
              if (this.contentNode) {
                try {
                  let frameNode = this.ctx.getFrameNodeByUniqueId(this.getUniqueId());
                  let targetId = frameNode?.getFirstChild()?.getUniqueId();
                  await this.promptAction.openPopup(this.contentNode, { id: targetId });
                  this.popupOpened = true;
                  this.resultText = 'open popup success';
                } catch (err) {
                  this.resultText = 'open popup error: ' + ((err as BusinessError).code);
                }
              }
            })

          Button('Close Popup')
            .id('btnClosePopup')
            .width('45%')

            .onClick(async () => {
              if (!this.popupOpened) {
                this.resultText = 'Please open popup first';
                return;
              }
              if (this.contentNode) {
                try {
                  await this.promptAction.closePopup(this.contentNode);
                  this.popupOpened = false;
                  this.resultText = 'close popup success';
                } catch (err) {
                  this.resultText = 'close popup error: ' + ((err as BusinessError).code);
                }
              }
            })

          Button('content null')
            .id('btnContentNull')
            .width('45%')

            .onClick(async () => {
              try {
                await this.promptAction.closePopup(null as ESObject);
                this.resultText = 'content null success';
              } catch (err) {
                this.resultText = 'content null error: ' + ((err as BusinessError).code);
              }
            })

          Button('content undefined')
            .id('btnContentUndefined')
            .width('45%')

            .onClick(async () => {
              try {
                await this.promptAction.closePopup(undefined as ESObject);
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
