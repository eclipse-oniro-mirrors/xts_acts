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
import { AsyncCallback, BusinessError } from '@ohos.base';
import { PromptAction, UIContext } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction';
import {
  $r,
  AdaptiveColor,
  BlurStyleActivePolicy,
  Builder,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  FlexAlign,
  Row,
  RowOptions,
  SizeOptions,
  Text
} from '@ohos.arkui.component';
import { Link, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct UIOpenCustomDialog2 {
  @State message: string = 'hello'
  private customDialogComponentId: int = 0
  private ctx: UIContext = this.getUIContext()
  private promptAction: PromptAction = this.ctx.getPromptAction()
  private dialogController: promptAction.DialogController = new promptAction.DialogController()

  @Builder
  customDialogComponent() {
    Column() {
      Text(this.message).fontSize(30)
      Row({ space: 10 } as RowOptions) {
        Button('通过DialogId关闭').onClick(() => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })
        Button('通过DialogController关闭').onClick(() => {
          this.dialogController.close()
        })
      }
    }.height(200).padding(5).justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder
  customDialogComponentWithId(dialogId: int) {
    Column() {
      Text(this.message).fontSize(30)
      Row({ space: 10 } as RowOptions) {
        Button('通过DialogId关闭').onClick(() => {
          this.promptAction.closeCustomDialog(dialogId)
        })
        Button('通过DialogController关闭').onClick(() => {
          this.dialogController.close()
        })
      }
    }.height(200).padding(5).justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('UIPresentCustomDialog_Effect001')
        .id('UIPresentCustomDialog_Effect001')
        .onClick(() => {
          this.promptAction.presentCustomDialog(() => {
            this.customDialogComponent()
          }, this.dialogController, {
            backgroundEffect: {
              radius: 40,
              saturation: 25,
              brightness: 2,
              color: Color.Pink,
              adaptiveColor: AdaptiveColor.DEFAULT,
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
              inactiveColor: Color.Blue,
              blurOptions: {
                grayscale: [20, 20]
              }
            }
          }).then((dialogId: int) => {
            this.customDialogComponentId = dialogId
          })
        })
      Button('UIPresentCustomDialog_Effect002')
        .id('UIPresentCustomDialog_Effect002')
        .onClick(() => {
          this.promptAction.presentCustomDialog(() => {
            this.customDialogComponent()
          }, this.dialogController, {
            backgroundEffect: {
              radius: 0.0,
              saturation: undefined,
              brightness: undefined,
              color: undefined,
              adaptiveColor: undefined,
              policy: undefined,
              inactiveColor: undefined,
              blurOptions: undefined,
            }
          }).then((dialogId: int) => {
            this.customDialogComponentId = dialogId
          })
        })
      Button('UIPresentCustomDialog_Effect003')
        .id('UIPresentCustomDialog_Effect003')
        .onClick(() => {
          this.promptAction.presentCustomDialog(() => {
            this.customDialogComponent()
          }, this.dialogController, {
            backgroundEffect: {
              radius: 0.0,
              saturation: undefined,
              brightness: undefined,
              color: undefined,
              adaptiveColor: undefined,
              policy: undefined,
              inactiveColor: undefined,
              blurOptions: undefined,
            }
          }).then((dialogId: int) => {
            this.customDialogComponentId = dialogId
          })
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}