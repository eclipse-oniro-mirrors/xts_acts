'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { Hypium } from '../../../../../hypium/index';

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import promptAction from '@ohos.promptAction';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  TextInputController,
  CustomDialogController,
  FlexAlign,
  CustomDialog,
  DialogAlignment,
  AlertDialogParamWithConfirm,
  ActionSheetOptions,
  AlertDialogParamWithOptions,
} from '@ohos.arkui.component';
import { State, AppStorage, Link } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext, Router, PromptAction } from '@ohos.arkui.UIContext';

@Entry
@Component
struct Index {
  controller: TextInputController = new TextInputController();
  @State text: string = ''
  Controller: TextInputController = new TextInputController();
  uiContext: UIContext = this.getUIContext()
  promptAction: PromptAction = this.getUIContext().getPromptAction();

  aboutToAppear() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');

  }

  @State textValue: string = '';
  @State inputValue: string = 'click me';

  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: this.onCancel,
      confirm: this.onAccept,
      // textValue: $textValue,
      // inputValue: $inputValue
      textValue: this.textValue,
      inputValue: this.inputValue
    }),
    cancel: this.existApp,
    autoCancel: true,
    alignment: DialogAlignment.CenterStart,
    gridCount: 2,
    showInSubWindow: true,
    isModal: true,
    customStyle: false
  })

  // 在自定义组件即将析构销毁时将dialogControlle置空
  aboutToDisappear() {
    this.dialogController = null; // 将dialogController置空
  }

  onCancel() {
    console.info('Callback when the first button is clicked');
  }

  onAccept() {
    console.info('Callback when the second button is clicked');
  }

  existApp() {
    console.info('Click the callback in the blank area');
  }

  build() {
    Column() {
      Button('one button dialog')
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog(
            {
              showInSubWindow: true,
              isModal: true,
              title: 'title',
              message: '1',
              autoCancel: true,
              alignment: DialogAlignment.CenterStart,
              offset: { dx: 0, dy: 0 },
              confirm: {
                value: 'button',
                action: () => {
                  console.info('Button-clicking callback')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              }
            } as AlertDialogParamWithConfirm
          )
        })
      Button('Click to Show ActionSheet')
        .onClick((e: ClickEvent) => {
          this.uiContext.showActionSheet({
            // showInSubWindow: true,
            // isModal: true,
            title: 'ActionSheet title',
            subtitle: 'ActionSheet subtitle',
            message: 'message',
            autoCancel: true,
            confirm: {
              defaultFocus: true,
              value: 'Confirm button',
              action: () => {
                console.log('Get Alert Dialog handled')
              }
            },
            cancel: () => {
              console.log('actionSheet canceled')
            },
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -10 },
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.log('apples')
                }
              },
              {
                title: 'bananas',
                action: () => {
                  console.log('bananas')
                }
              },
              {
                title: 'pears',
                action: () => {
                  console.log('pears')
                }
              }
            ]
          } as ActionSheetOptions)
        })
        .key("ArkUX_Dialog_Visual_0060")
        .fontSize(20)
        .margin(10);
      Button('showInSubWindow true autoCancel true')
        .margin(20)
        .onClick((e: ClickEvent) => {
          if (this.dialogController != undefined) {
            this.dialogController!.open()
          }
        })
        .backgroundColor(0x317aff)
        .fontSize(20)
        .margin(10);
      Button('one button dialog')
        .onClick((e: ClickEvent) => {
          this.promptAction.showActionMenu({
            showInSubWindow: true,
            isModal: true,
            title: 'Title Info',
            buttons: [
              {
                text: 'item1',
                color: '#666666'
              } as promptAction.Button,
              {
                text: 'item2',
                color: '#000000'
              }as promptAction.Button,
            ] as promptAction.PromptActionDoubleButtons
          } as promptAction.ActionMenuOptions, (err:BusinessError|null, data:promptAction.ActionMenuSuccessResponse|undefined) => {
            if (err) {
              console.info('showActionMenu err: ' + err);
              return;
            }
            console.info('showActionMenu success callback, click button: ' + data?.index);
          })
        });
      Button('promptAction.showDialog')
        .onClick((e: ClickEvent) => {
          this.promptAction.showDialog({
            showInSubWindow: true,
            isModal: true,
            title: 'showDialog Title Info',
            message: 'Message Info',
            buttons: [
              {
                text: 'button1',
                color: '#000000'
              } as promptAction.Button,
              {
                text: 'button2',
                color: '#000000'
              } as promptAction.Button
            ]
          } as promptAction.ShowDialogOptions, (err:BusinessError|null, data:promptAction.ShowDialogSuccessResponse|undefined)=> {
            if (err) {
              console.info('showDialog err: ' + err);
              return;
            }
            console.info('showDialog success callback, click button: ' + data?.index);
          });
        });
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}

@CustomDialog
struct CustomDialogExample {
  @Link textValue: string;
  @Link inputValue: string;
  controller?: CustomDialogController;
  // 若尝试在CustomDialog中传入多个其他的Controller，以实现在CustomDialog中打开另一个或另一些CustomDialog，那么此处需要将指向自己的controller放在最后
  cancel: () => void = () => {
  };
  confirm: () => void = () => {
  };

  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 } as Margin)
      Text('Whether to change a text?').fontSize(16).margin({ bottom: 10 } as Margin)
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel')
          .onClick((e: ClickEvent) => {
            this.controller?.close()
            this.cancel()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('confirm')
          .onClick((e: ClickEvent) => {
            this.inputValue = this.textValue
            this.controller?.close()
            this.confirm()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 } as Margin)
    }

    // dialog默认的borderRadius为24vp，如果需要使用border属性，请和borderRadius属性一起使用。
  }
}