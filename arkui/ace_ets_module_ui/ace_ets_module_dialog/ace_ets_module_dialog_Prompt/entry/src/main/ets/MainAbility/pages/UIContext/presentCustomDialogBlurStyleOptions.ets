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
import { BusinessError } from '@kit.BasicServicesKit';
import { PromptAction, promptAction } from '@kit.ArkUI';

@Entry
@Component
struct UIOpenCustomDialog1 {
  private customDialogComponentId: number = 0
  @State message: string = 'hello'
  private ctx: UIContext = this.getUIContext()
  private promptAction: PromptAction = this.ctx.getPromptAction()
  private dialogController: promptAction.DialogController = new promptAction.DialogController()
  @Builder customDialogComponent() {
    Column() {
      Text(this.message).fontSize(30)
      Row({ space: 10 }) {
        Button('通过DialogId关闭').onClick(() => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })
        Button('通过DialogController关闭').onClick(() => {
          this.dialogController.close()
        })
      }
    }.height(200).padding(5).justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder customDialogComponentWithId(dialogId: number) {
    Column() {
      Text(this.message).fontSize(30)
      Row({ space: 10 }) {
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
    Column({ space: 10 }){
      Button('UIPresentCustomDialog_Options001')
        .id('UIPresentCustomDialog_Options001')
        .onClick(() => {
          this.promptAction.presentCustomDialog(() => {
            this.customDialogComponent()
          }, this.dialogController,{
            backgroundBlurStyleOptions: {
              policy:BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
              adaptiveColor:AdaptiveColor.AVERAGE,
              scale:0,
              colorMode:ThemeColorMode.LIGHT,
              inactiveColor:Color.Pink,
              blurOptions:{
                grayscale:[20,100]
              }
            }
          }).then((dialogId: number) => {
            this.customDialogComponentId = dialogId
          })
        })
      Button('UIPresentCustomDialog_Options002')
        .id('UIPresentCustomDialog_Options002')
        .onClick(() => {
          this.promptAction.presentCustomDialog(() => {
            this.customDialogComponent()
          }, this.dialogController,{
            backgroundBlurStyleOptions: {
              policy:undefined,
              adaptiveColor:undefined,
              scale:undefined,
              colorMode:undefined,
              inactiveColor:undefined,
              blurOptions:undefined,
            }
          }).then((dialogId: number | void) => {
            this.customDialogComponentId = Number(dialogId)
          })
        })
      Button('UIPresentCustomDialog_Options003')
        .id('UIPresentCustomDialog_Options003')
        .onClick(() => {
          this.promptAction.presentCustomDialog(() => {
            this.customDialogComponent()
          }, this.dialogController,{
            backgroundBlurStyleOptions: {
              policy:null,
              adaptiveColor:null,
              scale:null,
              colorMode:null,
              inactiveColor:null,
              blurOptions:null,
            }
          }).then((dialogId: number | void) => {
            this.customDialogComponentId = Number(dialogId)
          })
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}