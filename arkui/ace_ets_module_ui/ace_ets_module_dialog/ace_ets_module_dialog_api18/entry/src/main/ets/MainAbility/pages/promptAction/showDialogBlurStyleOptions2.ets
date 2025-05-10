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
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
@Entry
@Component
struct showDialog3 {
  build() {
    Column({ space: 10 }){
      Button('ShowDialog_Callback_Options001')
        .id('ShowDialog_Callback_Options001')
        .onClick(() => {
          try {
            promptAction.showDialog({
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
              title: 'showDialog Title Info',
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
              ]
            }, (err, data) => {
              if (err) {
                console.error('showDialog err: ' + err);
                return;
              }
              console.info('showDialog success callback, click button: ' + data.index);
            })
          } catch (error) {
            let message = (error as BusinessError).message
            let code = (error as BusinessError).code
            console.error(`showDialog args error code is ${code}, message is ${message}`);
          };
        })
      Button('ShowDialog_Callback_Options002')
        .id('ShowDialog_Callback_Options002')
        .onClick(() => {
          try {
            promptAction.showDialog({
              backgroundBlurStyleOptions: {
                policy:undefined,
                adaptiveColor:undefined,
                scale:undefined,
                colorMode:undefined,
                inactiveColor:undefined,
                blurOptions:undefined,
              },
              title: 'showDialog Title Info',
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
              ]
            }, (err, data) => {
              if (err) {
                console.error('showDialog err: ' + err);
                return;
              }
              console.info('showDialog success callback, click button: ' + data.index);
            })
          } catch (error) {
            let message = (error as BusinessError).message
            let code = (error as BusinessError).code
            console.error(`showDialog args error code is ${code}, message is ${message}`);
          };
        })
      Button('ShowDialog_Callback_Options003')
        .id('ShowDialog_Callback_Options003')
        .onClick(() => {
          try {
            promptAction.showDialog({
              backgroundBlurStyleOptions: {
                policy:null,
                adaptiveColor:null,
                scale:null,
                colorMode:null,
                inactiveColor:null,
                blurOptions:null,
              },
              title: 'showDialog Title Info',
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
              ]
            }, (err, data) => {
              if (err) {
                console.error('showDialog err: ' + err);
                return;
              }
              console.info('showDialog success callback, click button: ' + data.index);
            })
          } catch (error) {
            let message = (error as BusinessError).message
            let code = (error as BusinessError).code
            console.error(`showDialog args error code is ${code}, message is ${message}`);
          };
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}