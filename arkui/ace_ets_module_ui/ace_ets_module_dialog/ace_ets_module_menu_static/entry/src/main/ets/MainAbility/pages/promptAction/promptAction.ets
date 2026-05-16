/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import {
  Blank,
  Font,
  TextAlign,
  ClickEvent,
  Divider,
  Component,
  Column,
  Button,
  AttributeModifier,
  ButtonAttribute,
  ButtonLabelStyle,
  TransitionEffect,
  FontWeight,
  wrapBuilder,
  Entry,
  Row,
  Text
} from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext';
import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, promptAction } from '@kit.ArkUI';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Component
struct CustomDialog {
  @State stateText:string = '弹窗状态';

  build() {
    Column() {
      Text('Hello')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 36 })

      Text(this.stateText)
        .key('stateText')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 36 })

      Button('点我关闭弹窗')
        .id('btnCloseDialog')
        .margin({ bottom: 36 })
        .onClick(() => {
          if (this.getDialogController()) {
            this.getDialogController()?.close();
          }
        })

      Button('点我获取状态')
        .id('btnGetStateOpen')
        .onClick(() => {
          if (this.getDialogController()) {
            this.stateText = '' + this.getDialogController()?.getState()
          }
        })

    }.backgroundColor('#FFF0F0F0')
  }
}

@Builder
function buildText() {
  CustomDialog()
}

@Entry
@Component
struct promptActionPage {
  @State stateInfo:string = '弹窗状态';
  @State onWillAppearResult: string = 'init';
  @State onDidAppearResult: string = 'init';
  @State onWillDisappearResult: string = 'init';
  @State onDidDisappearResult: string = 'init';
  private dialogController: promptAction.DialogController = new promptAction.DialogController()

  aboutToAppear() {
    try {
      let router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
      AppStorage.setOrCreate<promptAction.DialogController>('dialogController', this.dialogController);
    } catch (error) {
      console.log('error ' + error);
    }
    this.stateInfo = '' + this.dialogController.getState();
  }

  build() {
    Column() {
      Button('click me')
        .id('btnOpenDialog')
        .width('60%')
        .height('5%')
        .onClick(() => {
          let uiContext = this.getUIContext();
          let promptActionInstance = uiContext.getPromptAction();
          let contentNode = new ComponentContent<Object>(uiContext, wrapBuilder(buildText),
          );

          promptActionInstance.openCustomDialogWithController(contentNode, this.dialogController, {

            transition: TransitionEffect.OPACITY.animation({
              duration: 3000
            })
          }).then(() => {
            console.info('promptAction openCustomDialogWithController succeeded')
          })
        })

      Text(this.stateInfo)
        .width('60%')
        .height('5%')
        .key('stateInfo')
        .fontSize(36)
        .margin({ bottom: 4 })

      Button('点我获取状态')
        .width('60%')
        .height('5%')
        .id('btnGetState')
        .onClick(() => {
          this.stateInfo = '' + this.dialogController.getState();
        })

      Button('Show ActionMenu')
        .width('60%')
        .height('5%')
        .id('btnShowActionMenu')
        .margin({ top: 5, bottom: 5 })
        .onClick(() => {
          let uiContext = this.getUIContext();
          let promptActionInstance = uiContext.getPromptAction();
          let button1: promptAction.Button = {
            text: 'item1',
            color: '#666666'
          };
          let button2: promptAction.Button = {
            text: 'item2',
            color: '#000000'
          };
          let actionMenuOptions: promptAction.ActionMenuOptions = {
            title: 'ActionMenu Title',
            buttons: [button1, button2],
            onWillAppear: () => {
              this.onWillAppearResult = 'onWillAppear_called';
            },
            onDidAppear: () => {
              this.onDidAppearResult = 'onDidAppear_called';
            },
            onWillDisappear: () => {
              this.onWillDisappearResult = 'onWillDisappear_called';
            },
            onDidDisappear: () => {
              this.onDidDisappearResult = 'onDidDisappear_called';
            }
          };
          promptActionInstance.showActionMenu(actionMenuOptions).then(() => {
            console.info('showActionMenu succeeded')
          })
        })

      Text(this.onWillAppearResult)
        .width('60%')
        .height('5%')
        .key('onWillAppearResult')
        .fontSize(20)
        .margin({ bottom: 4 })

      Text(this.onDidAppearResult)
        .width('60%')
        .height('5%')
        .key('onDidAppearResult')
        .fontSize(20)
        .margin({ bottom: 4 })

      Text(this.onWillDisappearResult)
        .width('60%')
        .height('5%')
        .key('onWillDisappearResult')
        .fontSize(20)
        .margin({ bottom: 4 })

      Text(this.onDidDisappearResult)
        .width('60%')
        .height('5%')
        .key('onDidDisappearResult')
        .fontSize(20)
        .margin({ bottom: 4 })
    }
    .width('100%')
    .height('100%')
  }
}