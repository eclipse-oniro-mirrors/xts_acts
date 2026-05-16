/*
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
struct UpdatePopupNullAndUndefined {
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
      Text('UpdatePopup Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultTextUpdatePopup')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Button('Open Popup')
            .id('btnOpenPopup')
            .width('45%')
            .onClick(async () => {
              try {
                let frameNode = this.ctx.getFrameNodeByUniqueId(this.getUniqueId());
                let targetId = frameNode?.getFirstChild()?.getUniqueId();
                if (targetId) {
                  await this.promptAction.openPopup(this.contentNode!, { id: targetId }, {
                    enableArrow: true
                  }).then(() => {
                    this.popupOpened = true;
                    this.resultText = 'open popup success';
                  }).catch((err: BusinessError) => {
                    this.resultText = 'open popup error: ' + err.code;
                  });
                }
              } catch (err) {
                this.resultText = 'open popup catch: ' + ((err as BusinessError).code);
              }
            })

          Button('Update partialUpdate true')
            .id('btnPartialUpdateTrue')
            .width('45%')

            .onClick(async () => {
              if (!this.popupOpened) {
                this.resultText = 'Please open popup first';
                return;
              }
              try {
                await this.promptAction.updatePopup(this.contentNode!, { enableArrow: false }, true)
                  .then(() => {
                    this.resultText = 'partialUpdate true success';
                  }).catch((err: BusinessError) => {
                    this.resultText = 'partialUpdate true error: ' + err.code;
                  });
              } catch (err) {
                this.resultText = 'partialUpdate true catch: ' + ((err as BusinessError).code);
              }
            })

          Button('Update partialUpdate false')
            .id('btnPartialUpdateFalse')
            .width('45%')

            .onClick(async () => {
              if (!this.popupOpened) {
                this.resultText = 'Please open popup first';
                return;
              }
              try {
                await this.promptAction.updatePopup(this.contentNode!, { enableArrow: true }, false)
                  .then(() => {
                    this.resultText = 'partialUpdate false success';
                  }).catch((err: BusinessError) => {
                    this.resultText = 'partialUpdate false error: ' + err.code;
                  });
              } catch (err) {
                this.resultText = 'partialUpdate false catch: ' + ((err as BusinessError).code);
              }
            })

          Button('content null')
            .id('btnContentNull')
            .width('45%')

            .onClick(async () => {
              try {
                await this.promptAction.updatePopup(null as ESObject, { enableArrow: true }, true)
                  .then(() => {
                    this.resultText = 'content null success';
                  }).catch((err: BusinessError) => {
                    this.resultText = 'content null error: ' + err.code;
                  });
              } catch (err) {
                this.resultText = 'content null catch: ' + ((err as BusinessError).code);
              }
            })

          Button('content undefined')
            .id('btnContentUndefined')
            .width('45%')

            .onClick(async () => {
              try {
                await this.promptAction.updatePopup(undefined as ESObject, { enableArrow: true }, true)
                  .then(() => {
                    this.resultText = 'content undefined success';
                  }).catch((err: BusinessError) => {
                    this.resultText = 'content undefined error: ' + err.code;
                  });
              } catch (err) {
                this.resultText = 'content undefined catch: ' + ((err as BusinessError).code);
              }
            })

          Button('options null')
            .id('btnOptionsNull')
            .width('45%')

            .onClick(async () => {
              if (!this.popupOpened) {
                this.resultText = 'Please open popup first';
                return;
              }
              try {
                await this.promptAction.updatePopup(this.contentNode!, null as ESObject, true)
                  .then(() => {
                    this.resultText = 'options null success';
                  }).catch((err: BusinessError) => {
                    this.resultText = 'options null error: ' + err.code;
                  });
              } catch (err) {
                this.resultText = 'options null catch: ' + ((err as BusinessError).code);
              }
            })

          Button('options undefined')
            .id('btnOptionsUndefined')
            .width('45%')

            .onClick(async () => {
              if (!this.popupOpened) {
                this.resultText = 'Please open popup first';
                return;
              }
              try {
                await this.promptAction.updatePopup(this.contentNode!, undefined as ESObject, true)
                  .then(() => {
                    this.resultText = 'options undefined success';
                  }).catch((err: BusinessError) => {
                    this.resultText = 'options undefined error: ' + err.code;
                  });
              } catch (err) {
                this.resultText = 'options undefined catch: ' + ((err as BusinessError).code);
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
