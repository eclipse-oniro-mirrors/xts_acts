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
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .height('50%').width('100%')
    Button('Close')
      .onClick(() => {
        if (params.onClose) {
          params.onClose();
        }
      }).height('50%').width('100%')
  }.backgroundColor('#FFF0F0F0').height('5%').width('10%')
}

@Entry
@Component
struct OpenCustomDialogWithControllerNullAndUndefined {
  @State resultText: string = 'Init';
  @State dialogClosed: boolean = false;
  private ctx: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.ctx.getPromptAction();
  private dialogController: promptAction.DialogController = new promptAction.DialogController();
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
      Text('OpenCustomDialogWithController Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height('5%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultTextOpenWithController')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Button('showInSubWindow true')
            .id('btnShowInSubWindowTrue')
            .width('45%')
            .onClick(() => {
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                showInSubWindow: true,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                showInSubWindow: false,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                isModal: true,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                isModal: false,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                autoCancel: true,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                autoCancel: false,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                enableHoverMode: true,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                enableHoverMode: false,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                levelMode: LevelMode.OVERLAY,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                levelMode: LevelMode.EMBEDDED,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                immersiveMode: ImmersiveMode.DEFAULT,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                immersiveMode: ImmersiveMode.EXTEND,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                focusable: true,alignment: DialogAlignment.Center
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
              this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController, {
                focusable: false,alignment: DialogAlignment.Center
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
                this.promptAction.openCustomDialogWithController(null as ESObject, this.dialogController, {
                  showInSubWindow: false,alignment: DialogAlignment.Center
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
                this.promptAction.openCustomDialogWithController(undefined as ESObject, this.dialogController, {
                  showInSubWindow: false,alignment: DialogAlignment.Center
                }).then(() => {
                  this.resultText = 'content undefined success';
                }).catch((err: BusinessError) => {
                  this.resultText = 'content undefined error: ' + err.code;
                });
              } catch (err) {
                this.resultText = 'content undefined catch: ' + ((err as BusinessError).code);
              }
            })

          Button('controller null')
            .id('btnControllerNull')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.openCustomDialogWithController(this.contentNode!, null as ESObject, {
                  showInSubWindow: false,alignment: DialogAlignment.Center
                }).then(() => {
                  this.resultText = 'controller null success';
                }).catch((err: BusinessError) => {
                  this.resultText = 'controller null error: ' + err.code;
                });
              } catch (err) {
                this.resultText = 'controller null catch: ' + ((err as BusinessError).code);
              }
            })

          Button('controller undefined')
            .id('btnControllerUndefined')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.openCustomDialogWithController(this.contentNode!, undefined as ESObject, {
                  showInSubWindow: false,alignment: DialogAlignment.Center
                }).then(() => {
                  this.resultText = 'controller undefined success';
                }).catch((err: BusinessError) => {
                  this.resultText = 'controller undefined error: ' + err.code;
                });
              } catch (err) {
                this.resultText = 'controller undefined catch: ' + ((err as BusinessError).code);
              }
            })

          Button('options null')
            .id('btnOptionsNull')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController,
                  null as ESObject)
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
              try {
                this.promptAction.openCustomDialogWithController(this.contentNode!, this.dialogController,
                  undefined as ESObject)
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
