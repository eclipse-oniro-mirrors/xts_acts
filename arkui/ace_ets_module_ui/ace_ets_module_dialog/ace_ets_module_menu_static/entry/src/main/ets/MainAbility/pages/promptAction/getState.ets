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

'use static'

import {
  Blank,
  Font,
  TextAlign,
  ClickEvent,
  Divider,
  Component,
  Column,
  Button,
  FlexAlign,
  AttributeModifier,
  ButtonAttribute,
  CustomDialog,
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
import { State } from '@ohos.arkui.stateManagement';
import { CustomDialogController } from '@ohos.arkui.component';

@CustomDialog
struct CustomDialogExample {
  controller?: CustomDialogController

  build() {
    Column() {
      Text('dialogState')
        .fontSize(20)
    }.height(60).justifyContent(FlexAlign.Center)
  }
}

@Entry
@Component
struct CustomDialogUser {
  @State stateInfo:string = '弹窗状态';

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample(),
  })

  build() {
    Column() {
      Text(this.stateInfo)
        .id('customText')
        .fontSize(10)
        .maxLines(2)
        .width('100%')
        .textAlign(TextAlign.Center)
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '30%' })

      Button('打开')
        .id('btnGetCustomDialogOpen')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '30%' })
        .fontSize(10)
        .onClick(() => {
          this.dialogController.open();
        })

      Button('状态')
        .id('btnGetCustomState')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '30%' })
        .fontSize(10)
        .onClick(() => {
          this.stateInfo = '' + this.dialogController.getState();
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({ left: '3%', right: '3%', top: '2%', bottom: '2%' })
  }
}