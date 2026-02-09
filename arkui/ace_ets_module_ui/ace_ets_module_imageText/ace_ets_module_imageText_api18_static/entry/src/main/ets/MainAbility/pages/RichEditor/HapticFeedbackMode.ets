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
import { Entry, Component, Column, Builder, RichEditorController, RichEditorOptions,
  Text, RichEditor, Button, Row, Color, ImageFit, ImageSpanAlignment, TextAlign,
  ClickEvent,RichEditorSpanType,RichEditorResponseType,HapticFeedbackMode,
  CopyOptions,$r
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Callback } from '../../common/MessageManager'

@Entry
@Component
struct HapticFeedbackMode1 {
  controllerR: RichEditorController = new RichEditorController() as RichEditorController
  optionsR: RichEditorOptions = { controller: this.controllerR } as RichEditorOptions
  controllerR2: RichEditorController = new RichEditorController() as RichEditorController
  optionsR2: RichEditorOptions = { controller: this.controllerR2 } as RichEditorOptions
  controllerR3: RichEditorController = new RichEditorController() as RichEditorController
  optionsR3: RichEditorOptions = { controller: this.controllerR3 } as RichEditorOptions
  @State onMenuShow: string = '';
  @State onMenuHide: string = '';
  @State value1: string = "init"

  build() {
    Column() {

      RichEditor(this.optionsR)
        .id('HapticFeedbackMode.ENABLED')
        .onReady((): void => {
          this.controllerR.addTextSpan('测试文本', {
            style: {
              fontSize: '15vp'
            }
          });

        })
        .bindSelectionMenu(RichEditorSpanType.DEFAULT, this.panel, RichEditorResponseType.DEFAULT, {
          onDisappear: () => {
            console.info(`自定义选择菜单关闭时回调`);
          },
          onAppear: () => {
            console.info(`自定义选择菜单弹出时回调`);
          },
          onMenuShow: () => {
            console.log(' onMenuShow succ');
            this.onMenuShow = 'succ';
          },
          onMenuHide: () => {
            console.log(' onMenuHide succ');
            this.onMenuHide = 'succ';
          },
          previewMenuOptions:{
            hapticFeedbackMode:HapticFeedbackMode.ENABLED
          }
        })
        .copyOptions(CopyOptions.InApp)
        .height('10%').width('100%')

      RichEditor(this.optionsR2)
        .id('HapticFeedbackMode.DISABLED')
        .onReady((): void => {
          this.controllerR2.addImageSpan($r("app.media.icon"),
            {
              imageStyle:
              {
                size: ['50vp', '50vp'],
                objectFit: ImageFit.Fill,
                verticalAlign: ImageSpanAlignment.CENTER
              }
            })
          this.controllerR2.updateParagraphStyle({ start: -1, end: -1,
            style: {
              textAlign: TextAlign.Center,
            }
          })
        })
        .bindSelectionMenu(RichEditorSpanType.DEFAULT, this.panel, RichEditorResponseType.DEFAULT, {
          onDisappear: () => {
            console.info(`自定义选择菜单关闭时回调`);
          },
          onAppear: () => {
            console.info(`自定义选择菜单弹出时回调`);
          },
          onMenuShow: () => {
            console.log(' onMenuShow succ');
            this.onMenuShow = 'succ';
          },
          onMenuHide: () => {
            console.log(' onMenuHide succ');
            this.onMenuHide = 'succ';
          },
          previewMenuOptions:{
            hapticFeedbackMode:HapticFeedbackMode.DISABLED
          }
        })
        .copyOptions(CopyOptions.InApp)
        .height('10%').width('90vp')

      RichEditor(this.optionsR3)
        .id('HapticFeedbackMode.AUTO')
        .onReady((): void => {
          this.controllerR3.addTextSpan('测试文本', {
            style: {
              fontSize: '15vp'
            }
          });
          this.controllerR3.addImageSpan($r("app.media.icon"),
            {
              imageStyle:
              {
                size: ['50vp', '50vp'],
                objectFit: ImageFit.Fill,
                verticalAlign: ImageSpanAlignment.CENTER
              }
            })

        })
        .bindSelectionMenu(RichEditorSpanType.DEFAULT, this.panel, RichEditorResponseType.DEFAULT, {
          onDisappear: () => {
            console.info(`自定义选择菜单关闭时回调`);
          },
          onAppear: () => {
            console.info(`自定义选择菜单弹出时回调`);
          },
          onMenuShow: () => {
            console.log(' onMenuShow succ');
            this.onMenuShow = 'succ';
          },
          onMenuHide: () => {
            console.log(' onMenuHide succ');
            this.onMenuHide = 'succ';
          },
          previewMenuOptions:{
            hapticFeedbackMode:HapticFeedbackMode.AUTO
          }
        })
        .copyOptions(CopyOptions.InApp)
        .height('15%').width('100%')

      Row(){
        Text(this.onMenuShow).fontSize(10).textAlign(TextAlign.Center).height('5%').id('onMenuShow').width('45%')
        Text(this.onMenuHide).fontSize(10).textAlign(TextAlign.Center).height('5%').id('onMenuHide').width('45%')
      }

      Button('update')
        .id('update_Button')
        .onClick((e:ClickEvent): void => {
          this.controllerR.updateParagraphStyle({ start: -1, end: -1,
            style: {
              textAlign: TextAlign.Center,
            }
          })
          this.controllerR3.updateParagraphStyle({ start: -1, end: -1,
            style: {
              textAlign: TextAlign.Center,
            }
          })
        })
        .width('45%')
    }
    .height('100%')
  }

  @Builder
  panel() {
    Column() {
      Text('HapticFeedbackMode')
    }.width(100).height(20).backgroundColor(Color.Red)
  }
}