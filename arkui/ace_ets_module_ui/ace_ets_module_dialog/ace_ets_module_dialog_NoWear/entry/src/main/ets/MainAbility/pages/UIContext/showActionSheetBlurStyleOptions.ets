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
import { UIContext } from '@kit.ArkUI';
@Entry
@Component
struct ShowActionSheet1 {
  build() {
    Column({ space: 10 }){
      Button('ShowActionSheet_Options001')
        .id('ShowActionSheet_Options001')
        .onClick(() => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showActionSheet({
            title: 'ActionSheet title',
            message: 'message',
            autoCancel: true,
            confirm: {
              value: 'Confirm button',
              action: () => {
                console.info('Get Alert Dialog handled')
              }
            },
            cancel: () => {
              console.info('actionSheet canceled')
            },
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -10 },
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.info('apples')
                }
              },
              {
                title: 'bananas',
                action: () => {
                  console.info('bananas')
                }
              },
              {
                title: 'pears',
                action: () => {
                  console.info('pears')
                }
              }
            ],
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
          })
        })
      Button('ShowActionSheet_Options002')
        .id('ShowActionSheet_Options002')
        .onClick(() => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showActionSheet({
            title: 'ActionSheet title',
            message: 'message',
            autoCancel: true,
            confirm: {
              value: 'Confirm button',
              action: () => {
                console.info('Get Alert Dialog handled')
              }
            },
            cancel: () => {
              console.info('actionSheet canceled')
            },
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -10 },
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.info('apples')
                }
              },
              {
                title: 'bananas',
                action: () => {
                  console.info('bananas')
                }
              },
              {
                title: 'pears',
                action: () => {
                  console.info('pears')
                }
              }
            ],
            backgroundBlurStyleOptions: {
              policy:undefined,
              adaptiveColor:undefined,
              scale:undefined,
              colorMode:undefined,
              inactiveColor:undefined,
              blurOptions:undefined,
            }
          })
        })
      Button('ShowActionSheet_Options003')
        .id('ShowActionSheet_Options003')
        .onClick(() => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showActionSheet({
            title: 'ActionSheet title',
            message: 'message',
            autoCancel: true,
            confirm: {
              value: 'Confirm button',
              action: () => {
                console.info('Get Alert Dialog handled')
              }
            },
            cancel: () => {
              console.info('actionSheet canceled')
            },
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -10 },
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.info('apples')
                }
              },
              {
                title: 'bananas',
                action: () => {
                  console.info('bananas')
                }
              },
              {
                title: 'pears',
                action: () => {
                  console.info('pears')
                }
              }
            ],
            backgroundBlurStyleOptions: {
              policy:null,
              adaptiveColor:null,
              scale:null,
              colorMode:null,
              inactiveColor:null,
              blurOptions:null,
            }
          })
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}