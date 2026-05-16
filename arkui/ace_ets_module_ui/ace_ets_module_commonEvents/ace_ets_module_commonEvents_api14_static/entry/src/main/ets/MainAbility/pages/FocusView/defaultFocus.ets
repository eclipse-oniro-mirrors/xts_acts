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
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {CustomDialog,Entry,Column,Text,Button,CustomDialogController,ClickEvent,Component,Margin, Color} from '@ohos.arkui.component'
@CustomDialog
struct CustomDialogExample {
  controller?: CustomDialogController
  build() {
    Column() {
      Text('这是自定义弹窗')
        .fontSize(30)
        .height(100)
      Text('弹窗不能主动获取焦点')
        .fontSize(20)
        .height(100)
      Button('点我关闭弹窗')
        .onClick((e: ClickEvent) => {
          if (this.controller != undefined) {
            this.controller?.close()
          }
        })
        .margin(20)
    }
  }
}
@Entry
@Component
struct CustomDialogUser {
  @State setFocus: boolean = false
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample({}),
  })
  aboutToDisappear() {
    this.dialogController = null
  }

  build() {
    Column() {
      Text('' + this.setFocus).id('text')
      Button('change setAutoFocusTransfer')
            .id('btn')
            .onClick((e: ClickEvent)=>{
            this.setFocus =!this.setFocus
          })
      Button('click me')
        .onClick((e: ClickEvent) => {
          if (this.dialogController != null) {
            this.dialogController?.open()
          }
        }).backgroundColor(Color.Red)
    }.width('100%').margin({ top: 5 } as Margin)
    .onFocus(()=>{this.getUIContext().getFocusController().setAutoFocusTransfer(this.setFocus)})
  }
}