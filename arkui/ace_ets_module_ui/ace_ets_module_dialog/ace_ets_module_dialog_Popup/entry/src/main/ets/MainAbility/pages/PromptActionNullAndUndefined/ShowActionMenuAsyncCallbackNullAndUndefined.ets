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

import { PromptAction, promptAction, UIContext, LevelMode, ImmersiveMode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ShowActionMenuAsyncCallbackNullAndUndefined {
  @State resultText: string = 'Init';
  private ctx: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.ctx.getPromptAction();

  build() {
    Column() {
      Text('ShowActionMenu AsyncCallback Test (API 11)')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height('5%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultTextShowAsyncCallback')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Button('showInSubWindow true')
            .id('btnShowInSubWindowTrue')
            .width('45%')
            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'showInSubWindow true',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                showInSubWindow: true
              }, (err: BusinessError, data: promptAction.ActionMenuSuccessResponse) => {
                if (err) {
                  this.resultText = 'showInSubWindow true error: ' + err.code;
                } else {
                  this.resultText = 'showInSubWindow true: ' + data.index;
                }
              });
            })

          Button('showInSubWindow false')
            .id('btnShowInSubWindowFalse')
            .width('45%')

            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'showInSubWindow false',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                showInSubWindow: false
              }, (err: BusinessError, data: promptAction.ActionMenuSuccessResponse) => {
                if (err) {
                  this.resultText = 'showInSubWindow false error: ' + err.code;
                } else {
                  this.resultText = 'showInSubWindow false: ' + data.index;
                }
              });
            })

          Button('isModal true')
            .id('btnIsModalTrue')
            .width('45%')

            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'isModal true',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                isModal: true
              }, (err: BusinessError, data: promptAction.ActionMenuSuccessResponse) => {
                if (err) {
                  this.resultText = 'isModal true error: ' + err.code;
                } else {
                  this.resultText = 'isModal true: ' + data.index;
                }
              });
            })

          Button('isModal false')
            .id('btnIsModalFalse')
            .width('45%')

            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'isModal false',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                isModal: false
              }, (err: BusinessError, data: promptAction.ActionMenuSuccessResponse) => {
                if (err) {
                  this.resultText = 'isModal false error: ' + err.code;
                } else {
                  this.resultText = 'isModal false: ' + data.index;
                }
              });
            })

          Button('levelMode OVERLAY')
            .id('btnLevelModeOverlay')
            .width('45%')

            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'levelMode OVERLAY',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                levelMode: LevelMode.OVERLAY
              }, (err: BusinessError, data: promptAction.ActionMenuSuccessResponse) => {
                if (err) {
                  this.resultText = 'levelMode OVERLAY error: ' + err.code;
                } else {
                  this.resultText = 'levelMode OVERLAY: ' + data.index;
                }
              });
            })

          Button('levelMode EMBEDDED')
            .id('btnLevelModeEmbedded')
            .width('45%')

            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'levelMode EMBEDDED',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                levelMode: LevelMode.EMBEDDED
              }, (err: BusinessError, data: promptAction.ActionMenuSuccessResponse) => {
                if (err) {
                  this.resultText = 'levelMode EMBEDDED error: ' + err.code;
                } else {
                  this.resultText = 'levelMode EMBEDDED: ' + data.index;
                }
              });
            })

          Button('immersiveMode DEFAULT')
            .id('btnImmersiveModeDefault')
            .width('45%')

            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'immersiveMode DEFAULT',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                immersiveMode: ImmersiveMode.DEFAULT
              }, (err: BusinessError, data: promptAction.ActionMenuSuccessResponse) => {
                if (err) {
                  this.resultText = 'immersiveMode DEFAULT error: ' + err.code;
                } else {
                  this.resultText = 'immersiveMode DEFAULT: ' + data.index;
                }
              });
            })

          Button('immersiveMode EXTEND')
            .id('btnImmersiveModeExtend')
            .width('45%')

            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'immersiveMode EXTEND',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                immersiveMode: ImmersiveMode.EXTEND
              }, (err: BusinessError, data: promptAction.ActionMenuSuccessResponse) => {
                if (err) {
                  this.resultText = 'immersiveMode EXTEND error: ' + err.code;
                } else {
                  this.resultText = 'immersiveMode EXTEND: ' + data.index;
                }
              });
            })

          Button('options null')
            .id('btnOptionsNull')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.showActionMenu(null as ESObject
                  , (err: BusinessError, data: promptAction.ActionMenuSuccessResponse) => {
                  if (err) {
                    this.resultText = 'options null error: ' + err.code;
                  } else {
                    this.resultText = 'options null success';
                  }
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
                this.promptAction.showActionMenu(undefined as ESObject
                  , (err: BusinessError, data: promptAction.ActionMenuSuccessResponse) => {
                    if (err) {
                      this.resultText = 'options undefined error: ' + err.code;
                    } else {
                      this.resultText = 'options undefined success';
                    }
                  });
              } catch (err) {
                this.resultText = 'options undefined catch: ' + ((err as BusinessError).code);
              }
            })

          Button('callback null')
            .id('btnCallbackNull')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.showActionMenu({
                  title: 'callback null',
                  buttons: [
                    { text: 'item1', color: '#666666' },
                    { text: 'item2', color: '#000000' }
                  ]
                }, null as ESObject);
                this.resultText = 'callback null success';
              } catch (err) {
                this.resultText = 'callback null error: ' + ((err as BusinessError).code);
              }
            })

          Button('callback undefined')
            .id('btnCallbackUndefined')
            .width('45%')

            .onClick(() => {
              try {
                this.promptAction.showActionMenu({
                  title: 'callback undefined',
                  buttons: [
                    { text: 'item1', color: '#666666' },
                    { text: 'item2', color: '#000000' }
                  ]
                }, undefined as ESObject);
                this.resultText = 'callback undefined success';
              } catch (err) {
                this.resultText = 'callback undefined error: ' + ((err as BusinessError).code);
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
