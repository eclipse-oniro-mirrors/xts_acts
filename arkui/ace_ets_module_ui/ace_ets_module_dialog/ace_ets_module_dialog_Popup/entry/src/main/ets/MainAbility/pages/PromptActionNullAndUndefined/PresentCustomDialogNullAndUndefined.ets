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

@Entry
@Component
struct PresentCustomDialogNullAndUndefined {
  @State resultText: string = 'Init';
  @State dialogId: number = -1;
  private ctx: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.ctx.getPromptAction();
  private dialogController: promptAction.DialogController = new promptAction.DialogController();

  @Builder
  customDialogBuilder() {
    Column() {
      Text('Custom Dialog')
        .fontWeight(FontWeight.Bold).height('50%').width('100%')
      Button('Close')
        .onClick(() => {
          this.dialogController.close();
        }).height('50%').width('100%')
    }.backgroundColor('#FFF0F0F0').height('5%').width('10%')
  }

  build() {
    Column() {
      Text('PresentCustomDialog Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)
        .height('5%')

      Text(this.resultText)
        .id('resultTextPresent')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Button('Present with Controller')
            .id('btnPresentWithController')
            .width('45%')
            .onClick(() => {
              this.promptAction.presentCustomDialog(() => {
                this.customDialogBuilder()
              }, this.dialogController).then((id: number) => {
                this.dialogId = id;
                this.resultText = 'present with controller success, ' + id;
              }).catch((err: BusinessError) => {
                this.resultText = 'present with controller error: ' + err.code;
              });
            })

          Button('Present without Controller')
            .id('btnPresentWithoutController')
            .width('45%')

            .onClick(() => {
              this.promptAction.presentCustomDialog(() => {
                this.customDialogBuilder()
              }).then((id: number) => {
                this.dialogId = id;
                this.resultText = 'present without controller success, ' + id;
              }).catch((err: BusinessError) => {
                this.resultText = 'present without controller error: ' + err.code;
              });
            })

          Button('builder null')
            .id('btnBuilderNull')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.presentCustomDialog(null as ESObject, this.dialogController).then((id: number) => {
                  this.resultText = 'builder null success';
                }).catch((err: BusinessError) => {
                  this.resultText = 'builder null error: ' + err.code;
                });
              } catch (err) {
                this.resultText = 'builder null catch: ' + ((err as BusinessError).code);
              }
            })

          Button('builder undefined')
            .id('btnBuilderUndefined')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.presentCustomDialog(undefined as ESObject, this.dialogController)
                  .then((id: number) => {
                    this.resultText = 'builder undefined success';
                  })
                  .catch((err: BusinessError) => {
                    this.resultText = 'builder undefined error: ' + err.code;
                  });
              } catch (err) {
                this.resultText = 'builder undefined catch: ' + ((err as BusinessError).code);
              }
            })

          Button('controller null')
            .id('btnControllerNull')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.presentCustomDialog(() => {
                  this.customDialogBuilder()
                }, null as ESObject).then((id: number) => {
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
                this.promptAction.presentCustomDialog(() => {
                  this.customDialogBuilder()
                }, undefined as ESObject).then((id: number) => {
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
                this.promptAction.presentCustomDialog(() => {
                  this.customDialogBuilder()
                }, this.dialogController, null as ESObject).then((id: number) => {
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
                this.promptAction.presentCustomDialog(() => {
                  this.customDialogBuilder()
                }, this.dialogController, undefined as ESObject).then((id: number) => {
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
