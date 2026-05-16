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
struct ShowActionSheet2 {
  build() {
    Column({ space: 10 }){
      Button('ShowActionSheet_Effect001')
        .id('ShowActionSheet_Effect001')
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
            backgroundEffect: {
              radius: 40,
              saturation: 25,
              brightness: 2,
              color: Color.Pink,
              adaptiveColor: AdaptiveColor.DEFAULT,
              policy:BlurStyleActivePolicy.ALWAYS_ACTIVE,
              inactiveColor:Color.Blue,
              blurOptions: {
                grayscale: [20,20]
              }
            }
          })
        })
      Button('ShowActionSheet_Effect002')
        .id('ShowActionSheet_Effect002')
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
            backgroundEffect: {
              radius: undefined,
              saturation: undefined,
              brightness: undefined,
              color: undefined,
              adaptiveColor: undefined,
              policy:undefined,
              inactiveColor:undefined,
              blurOptions: undefined,
            }
          })
        })
      Button('ShowActionSheet_Effect003')
        .id('ShowActionSheet_Effect003')
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
            backgroundEffect: {
              radius: null,
              saturation: null,
              brightness: null,
              color: null,
              adaptiveColor: null,
              policy:null,
              inactiveColor:null,
              blurOptions: null,
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