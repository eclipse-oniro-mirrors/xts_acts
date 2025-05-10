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
import { PromptAction } from '@kit.ArkUI'
@Entry
@Component
struct UIOpenCustomDialog1 {
  private customDialogComponentId: number = 0
  private ctx: UIContext = this.getUIContext()
  private promptAction: PromptAction = this.ctx.getPromptAction()
  @Builder
  customDialogComponent() {
    Column() {
      Text('弹窗').fontSize(30)
      Row({ space: 50 }) {
        Button('确认').onClick(() => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })
        Button('取消').onClick(() => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })
      }
    }.height(200).padding(5).justifyContent(FlexAlign.SpaceBetween)
  }
  build() {
    Column({ space: 10 }){
      Button('UIOpenCustomDialog_Options001')
        .id('UIOpenCustomDialog_Options001')
        .onClick(() => {
          this.promptAction.openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
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
      Button('UIOpenCustomDialog_Options002')
        .id('UIOpenCustomDialog_Options002')
        .onClick(() => {
          this.promptAction.openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
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
      Button('UIOpenCustomDialog_Options003')
        .id('UIOpenCustomDialog_Options003')
        .onClick(() => {
          this.promptAction.openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
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