'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  DialogAlignment,
  CustomDialogController,
  CustomDialog,
  Image,
  FlexAlign
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@CustomDialog
struct CustomDialogExample {
  controller?: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

  build() {
    Column() {
      Text('Software uninstall')
        .width('70%')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 } as Margin)
      Image('/images/dialog.png')
        .width(80)
        .height(80)
      Text('Whether to uninstall a software?')
        .fontSize(16)
        .margin({ bottom: 10 } as Margin)
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel')
          .onClick((e: ClickEvent) => {
            this.controller!.close()
            this.cancel()
          })
          .backgroundColor(0xffffff)
          .fontColor(Color.Black)
        Button('confirm')
          .onClick((e: ClickEvent) => {
            this.controller?.close()
            this.confirm()
          })
          .backgroundColor(0xffffff)
          .fontColor(Color.Red)
      }.margin({ bottom: 10 } as Margin)
    }
  }
}

@Entry
@Component
struct CustomDialogUser {
  @State autoCancel: boolean = true
  @State customStyle: boolean = false
  @State alignment: DialogAlignment = DialogAlignment.Default
  @State onClickValue: boolean = false
  private stateChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info("checkboxGroup page stateChangCallBack");
    if (eventData != null) {
      console.info("checkboxGroup page state change called:" + JSON.stringify(eventData));
    }
  }

  onPageShow() {
    console.info('checkboxGroup page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 79,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({ cancel: this.onCancel, confirm: this.onAccept }),
    cancel: this.existApp,
    autoCancel: true,
    offset: {
      dx: 100,
      dy: 100
    },
  })

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  existApp() {
    console.info('Click the callback in the blank area')
  }

  build() {
    Column() {
      Button('click me')
        .onClick((e: ClickEvent) => {
          this.onClickValue = true;
          this.dialogController.open();
          try {
            let backData: emitter.EventData = {
              data: {
                "ACTION": this.onClickValue
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 236,
              priority: emitter.EventPriority.LOW
            }
            console.info("click to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("click action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .backgroundColor(0x317aff)
        .key('dialogController')
    }
    .width('100%')
    .margin({ top: 5 } as Margin)
  }
}