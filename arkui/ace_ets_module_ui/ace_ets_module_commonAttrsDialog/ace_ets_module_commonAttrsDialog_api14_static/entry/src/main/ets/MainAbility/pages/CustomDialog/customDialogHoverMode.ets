'use static';
/**
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

import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  FlexOptions,
  ColumnOptions,
  TextAlign,
  Scroll,
  Image,
  Color,
  $rawfile,
  DragEvent,
  $r,
  ResourceStr,
  HoverModeAreaType,
  DismissDialogAction,
  CustomDialog,
  CustomDialogController,
  TextInput,TextInputOptions,DismissReason,Offset
// AlertDialog
// ActionSheet
// ContextMenu
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage,Link } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';
import testsuite from '../../../../src/test/List.test'
import {
  State
} from '@ohos.arkui.stateManagement'

@CustomDialog
@Component
struct CustomDialogExample {
  @Link textValue: string;
  @Link inputValue: string;
  controller?: CustomDialogController

  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 } as Margin)
      TextInput({ placeholder: '', text: this.textValue } as TextInputOptions).height(60).width('90%')
        .onChange((value: string):void => {
          this.textValue = value;
        })
      Text('Whether to change a text?').fontSize(16).margin({ bottom: 10 } as Margin)
      Flex({ justifyContent: FlexAlign.SpaceAround } as FlexOptions) {
        Button('cancel')
          .onClick((e:ClickEvent) => {
            if (this.controller != undefined) {
              this.controller?.close();
            }
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('confirm')
          .id('confirm')
          .onClick((e:ClickEvent) => {
            if (this.controller != undefined) {
              this.inputValue = this.textValue;
              this.controller?.close();
            }
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 } as Margin)

      Button('点我打开第二个弹窗')
        .margin(20)
    }.borderRadius(10)

  }
}

@Entry
@Component
struct CustomDialogHoverMode {
  @State enableHoverMode: boolean = false
  @State hoverModeArea: HoverModeAreaType = HoverModeAreaType.TOP_SCREEN
  @State textValue: string = '';
  @State inputValue: string = 'click me';
  dialogController: CustomDialogController | null = null

  aboutToDisappear() {
    this.dialogController = null;
  }

  exitApp() {
    console.info('Click the callback in the blank area');
  }

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Button('change enableHoverMode ' + this.enableHoverMode)
        .id('btn1')
        .onClick((e:ClickEvent) => {
          this.enableHoverMode = true
        })
      Button('change hoverModeArea ' + this.hoverModeArea)
        .id('btn2')
        .onClick((e:ClickEvent) => {
          this.hoverModeArea = HoverModeAreaType.BOTTOM_SCREEN
        })
      Button('customDialog')
        .id('customDialog')
        .onClick((e:ClickEvent) => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExample({
              textValue: this.textValue,
              inputValue: this.inputValue
            }),
            cancel: this.exitApp,
            autoCancel: true,
            onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
              console.info('reason=' + JSON.stringify(dismissDialogAction.reason));
              console.log('dialog onWillDismiss');
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss();
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss();
              }
            },
            offset: { dx: 0, dy: -20 } as Offset,
            gridCount: 4,
            customStyle: false,
            cornerRadius: 10,
            enableHoverMode: this.enableHoverMode,
            hoverModeArea: this.hoverModeArea
          })

          if (this.dialogController != null) {
            this.dialogController?.open();
          }
        })

    }
    .id('col')
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}