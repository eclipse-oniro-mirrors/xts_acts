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

import { PromptAction, promptAction, UIContext, ComponentContent, LevelMode, ImmersiveMode } from '@kit.ArkUI';
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
      .fontWeight(FontWeight.Bold)      .height('50%').width('100%')
    Button('Close')
      .id('btnDialogClose')
      .onClick(() => {
        if (params.onClose) {
          params.onClose();
        }
      })      .height('50%').width('100%')
  }.backgroundColor('#FFF0F0F0').height('5%').width('10%')
}

@Entry
@Component
struct UpdateCustomDialogNullAndUndefined {
  @State resultText: string = 'Init';
  @State dialogOpened: boolean = false;
  private ctx: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.ctx.getPromptAction();
  private contentNode: ComponentContent<DialogParams> | null = null;

  aboutToAppear(): void {
    this.contentNode = new ComponentContent(this.ctx, wrapBuilder(buildDialog), 
      new DialogParams('Test Dialog', () => {
        if (this.contentNode && this.promptAction) {
          this.promptAction.closeCustomDialog(this.contentNode);
          this.dialogOpened = false;
        }
      }));
    this.promptAction.openCustomDialog(this.contentNode!, {
      showInSubWindow: false,alignment: DialogAlignment.Center
    }).then(() => {
      this.dialogOpened = true;
    });
  }

  aboutToDisappear(): void {
    try {
      if (this.dialogOpened && this.contentNode && this.promptAction) {
        this.promptAction.closeCustomDialog(this.contentNode);
        this.dialogOpened = false;
      }
    } catch (err) {
      console.error('aboutToDisappear close error: ' + (err as BusinessError).code);
    }
  }

  build() {
    Column() {
      Text('UpdateCustomDialog Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)
        .height('5%')

      Text(this.resultText)
        .id('resultTextUpdateCustomDialog')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Button('showInSubWindow true')
            .id('btnShowInSubWindowTrue')
            .width('45%')
            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                showInSubWindow: true
              }).then(() => {
                this.resultText = 'showInSubWindow true success';
              }).catch((err: BusinessError) => {
                this.resultText = 'showInSubWindow true error: ' + err.code;
              });
            })

          Button('showInSubWindow false')
            .id('btnShowInSubWindowFalse')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                showInSubWindow: false
              }).then(() => {
                this.resultText = 'showInSubWindow false success';
              }).catch((err: BusinessError) => {
                this.resultText = 'showInSubWindow false error: ' + err.code;
              });
            })

          Button('isModal true')
            .id('btnIsModalTrue')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                isModal: true
              }).then(() => {
                this.resultText = 'isModal true success';
              }).catch((err: BusinessError) => {
                this.resultText = 'isModal true error: ' + err.code;
              });
            })

          Button('isModal false')
            .id('btnIsModalFalse')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                isModal: false
              }).then(() => {
                this.resultText = 'isModal false success';
              }).catch((err: BusinessError) => {
                this.resultText = 'isModal false error: ' + err.code;
              });
            })

          Button('autoCancel true')
            .id('btnAutoCancelTrue')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                autoCancel: true
              }).then(() => {
                this.resultText = 'autoCancel true success';
              }).catch((err: BusinessError) => {
                this.resultText = 'autoCancel true error: ' + err.code;
              });
            })

          Button('autoCancel false')
            .id('btnAutoCancelFalse')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                autoCancel: false
              }).then(() => {
                this.resultText = 'autoCancel false success';
              }).catch((err: BusinessError) => {
                this.resultText = 'autoCancel false error: ' + err.code;
              });
            })

          Button('enableHoverMode true')
            .id('btnEnableHoverModeTrue')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                enableHoverMode: true
              }).then(() => {
                this.resultText = 'enableHoverMode true success';
              }).catch((err: BusinessError) => {
                this.resultText = 'enableHoverMode true error: ' + err.code;
              });
            })

          Button('enableHoverMode false')
            .id('btnEnableHoverModeFalse')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                enableHoverMode: false
              }).then(() => {
                this.resultText = 'enableHoverMode false success';
              }).catch((err: BusinessError) => {
                this.resultText = 'enableHoverMode false error: ' + err.code;
              });
            })

          Button('levelMode OVERLAY')
            .id('btnLevelModeOverlay')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                levelMode: LevelMode.OVERLAY
              }).then(() => {
                this.resultText = 'levelMode OVERLAY success';
              }).catch((err: BusinessError) => {
                this.resultText = 'levelMode OVERLAY error: ' + err.code;
              });
            })

          Button('levelMode EMBEDDED')
            .id('btnLevelModeEmbedded')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                levelMode: LevelMode.EMBEDDED
              }).then(() => {
                this.resultText = 'levelMode EMBEDDED success';
              }).catch((err: BusinessError) => {
                this.resultText = 'levelMode EMBEDDED error: ' + err.code;
              });
            })

          Button('immersiveMode DEFAULT')
            .id('btnImmersiveModeDefault')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                immersiveMode: ImmersiveMode.DEFAULT
              }).then(() => {
                this.resultText = 'immersiveMode DEFAULT success';
              }).catch((err: BusinessError) => {
                this.resultText = 'immersiveMode DEFAULT error: ' + err.code;
              });
            })

          Button('immersiveMode EXTEND')
            .id('btnImmersiveModeExtend')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                immersiveMode: ImmersiveMode.EXTEND
              }).then(() => {
                this.resultText = 'immersiveMode EXTEND success';
              }).catch((err: BusinessError) => {
                this.resultText = 'immersiveMode EXTEND error: ' + err.code;
              });
            })

          Button('focusable true')
            .id('btnFocusableTrue')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                focusable: true
              }).then(() => {
                this.resultText = 'focusable true success';
              }).catch((err: BusinessError) => {
                this.resultText = 'focusable true error: ' + err.code;
              });
            })

          Button('focusable false')
            .id('btnFocusableFalse')
            .width('45%')

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              this.promptAction.updateCustomDialog(this.contentNode!, {
                focusable: false
              }).then(() => {
                this.resultText = 'focusable false success';
              }).catch((err: BusinessError) => {
                this.resultText = 'focusable false error: ' + err.code;
              });
            })

          Button('content null')
            .id('btnContentNull')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.updateCustomDialog(null as ESObject, {
                  showInSubWindow: false
                }).then(() => {
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

            .onClick(() => {
              try {
                this.promptAction.updateCustomDialog(undefined as ESObject, {
                  showInSubWindow: false
                }).then(() => {
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

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              try {
                this.promptAction.updateCustomDialog(this.contentNode!, null as ESObject)
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

            .onClick(() => {
              if (!this.dialogOpened) {
                this.resultText = 'Please open dialog first';
                return;
              }
              try {
                this.promptAction.updateCustomDialog(this.contentNode!, undefined as ESObject)
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
