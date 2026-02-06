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
import { PromptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
@Entry
@Component
struct UIShowDialog1 {
  private ctx: UIContext = this.getUIContext()
  private promptAction: PromptAction = this.ctx.getPromptAction()
  build() {
    Column({ space: 10 }){
      Button('UIShowDialog_Options001')
        .id('UIShowDialog_Options001')
        .onClick(() => {
          try {
            this.promptAction.showDialog({
              backgroundBlurStyleOptions: {
                policy:BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
                adaptiveColor:AdaptiveColor.AVERAGE,
                scale:0,
                colorMode:ThemeColorMode.LIGHT,
                inactiveColor:Color.Pink,
                blurOptions:{
                  grayscale:[20,100]
                }
              },
              title: 'Title Info',
              message: 'Message Info',
              buttons: [
                {
                  text: 'button1',
                  color: '#000000'
                },
                {
                  text: 'button2',
                  color: '#000000'
                }
              ],
            })
              .then(data => {
                console.info('showDialog success, click button: ' + data.index);
              })
              .catch((err: Error) => {
                console.info('showDialog error: ' + err);
              })
          } catch (error) {
            let message = (error as BusinessError).message
            let code = (error as BusinessError).code
            console.error(`showDialog args error code is ${code}, message is ${message}`);
          }
          ;
        })
      Button('UIShowDialog_Options002')
        .id('UIShowDialog_Options002')
        .onClick(() => {
          try {
            this.promptAction.showDialog({
              backgroundBlurStyleOptions: {
                policy:undefined,
                adaptiveColor:undefined,
                scale:undefined,
                colorMode:undefined,
                inactiveColor:undefined,
                blurOptions:undefined,
              },
              title: 'Title Info',
              message: 'Message Info',
              buttons: [
                {
                  text: 'button1',
                  color: '#000000'
                },
                {
                  text: 'button2',
                  color: '#000000'
                }
              ],
            })
              .then(data => {
                console.info('showDialog success, click button: ' + data.index);
              })
              .catch((err: Error) => {
                console.info('showDialog error: ' + err);
              })
          } catch (error) {
            let message = (error as BusinessError).message
            let code = (error as BusinessError).code
            console.error(`showDialog args error code is ${code}, message is ${message}`);
          }
          ;
        })
      Button('UIShowDialog_Options003')
        .id('UIShowDialog_Options003')
        .onClick(() => {
          try {
            this.promptAction.showDialog({
              backgroundBlurStyleOptions: {
                policy:null,
                adaptiveColor:null,
                scale:null,
                colorMode:null,
                inactiveColor:null,
                blurOptions:null,
              },
              title: 'Title Info',
              message: 'Message Info',
              buttons: [
                {
                  text: 'button1',
                  color: '#000000'
                },
                {
                  text: 'button2',
                  color: '#000000'
                }
              ],
            })
              .then(data => {
                console.info('showDialog success, click button: ' + data.index);
              })
              .catch((err: Error) => {
                console.info('showDialog error: ' + err);
              })
          } catch (error) {
            let message = (error as BusinessError).message
            let code = (error as BusinessError).code
            console.error(`showDialog args error code is ${code}, message is ${message}`);
          }
          ;
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}