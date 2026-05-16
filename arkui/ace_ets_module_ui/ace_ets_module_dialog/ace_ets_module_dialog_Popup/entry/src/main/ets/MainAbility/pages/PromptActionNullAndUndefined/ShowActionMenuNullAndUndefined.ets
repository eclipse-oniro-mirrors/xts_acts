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
struct ShowActionMenuNullAndUndefined {
  @State resultText: string = 'Init';
  private ctx: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.ctx.getPromptAction();

  build() {
    Column() {
      Text('ShowActionMenu Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)
        .height('5%')

      Text(this.resultText)
        .id('resultTextShow')
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
              }).then((data: promptAction.ActionMenuSuccessResponse) => {
                this.resultText = 'showInSubWindow true: ' + data.index;
              }).catch((err: BusinessError) => {
                this.resultText = 'showInSubWindow true error: ' + err.code;
              });
            })

          Button('showInSubWindow false')
            .id('btnShowInSubWindowFalse')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'showInSubWindow false',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                showInSubWindow: false
              }).then((data: promptAction.ActionMenuSuccessResponse) => {
                this.resultText = 'showInSubWindow false: ' + data.index;
              }).catch((err: BusinessError) => {
                this.resultText = 'showInSubWindow false error: ' + err.code;
              });
            })

          Button('isModal true')
            .id('btnIsModalTrue')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'isModal true',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                isModal: true
              }).then((data: promptAction.ActionMenuSuccessResponse) => {
                this.resultText = 'isModal true: ' + data.index;
              }).catch((err: BusinessError) => {
                this.resultText = 'isModal true error: ' + err.code;
              });
            })

          Button('isModal false')
            .id('btnIsModalFalse')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'isModal false',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                isModal: false
              }).then((data: promptAction.ActionMenuSuccessResponse) => {
                this.resultText = 'isModal false: ' + data.index;
              }).catch((err: BusinessError) => {
                this.resultText = 'isModal false error: ' + err.code;
              });
            })

          Button('levelMode OVERLAY')
            .id('btnLevelModeOverlay')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'levelMode OVERLAY',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                levelMode: LevelMode.OVERLAY
              }).then((data: promptAction.ActionMenuSuccessResponse) => {
                this.resultText = 'levelMode OVERLAY: ' + data.index;
              }).catch((err: BusinessError) => {
                this.resultText = 'levelMode OVERLAY error: ' + err.code;
              });
            })

          Button('levelMode EMBEDDED')
            .id('btnLevelModeEmbedded')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'levelMode EMBEDDED',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                levelMode: LevelMode.EMBEDDED
              }).then((data: promptAction.ActionMenuSuccessResponse) => {
                this.resultText = 'levelMode EMBEDDED: ' + data.index;
              }).catch((err: BusinessError) => {
                this.resultText = 'levelMode EMBEDDED error: ' + err.code;
              });
            })

          Button('immersiveMode DEFAULT')
            .id('btnImmersiveModeDefault')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'immersiveMode DEFAULT',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                immersiveMode: ImmersiveMode.DEFAULT
              }).then((data: promptAction.ActionMenuSuccessResponse) => {
                this.resultText = 'immersiveMode DEFAULT: ' + data.index;
              }).catch((err: BusinessError) => {
                this.resultText = 'immersiveMode DEFAULT error: ' + err.code;
              });
            })

          Button('immersiveMode EXTEND')
            .id('btnImmersiveModeExtend')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              this.promptAction.showActionMenu({
                title: 'immersiveMode EXTEND',
                buttons: [
                  { text: 'item1', color: '#666666' },
                  { text: 'item2', color: '#000000' }
                ],
                immersiveMode: ImmersiveMode.EXTEND
              }).then((data: promptAction.ActionMenuSuccessResponse) => {
                this.resultText = 'immersiveMode EXTEND: ' + data.index;
              }).catch((err: BusinessError) => {
                this.resultText = 'immersiveMode EXTEND error: ' + err.code;
              });
            })

          Button('options null')
            .id('btnOptionsNull')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.promptAction.showActionMenu(null as ESObject)
                  .then((data: promptAction.ActionMenuSuccessResponse) => {
                    this.resultText = 'options null success';
                  })
                  .catch((err: BusinessError) => {
                    this.resultText = 'options null error: ' + err.code;
                  });
              } catch (err) {
                this.resultText = 'options null catch: ' + ((err as BusinessError).code);
              }
            })

          Button('options undefined')
            .id('btnOptionsUndefined')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.promptAction.showActionMenu(undefined as ESObject)
                  .then((data: promptAction.ActionMenuSuccessResponse) => {
                    this.resultText = 'options undefined success';
                  })
                  .catch((err: BusinessError) => {
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
