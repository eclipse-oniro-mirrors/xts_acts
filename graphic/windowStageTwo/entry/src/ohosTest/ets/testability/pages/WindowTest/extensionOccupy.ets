/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { UIExtensionContentSession } from '@kit.AbilityKit';
import { uiExtension, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
let storage = LocalStorage.getShared()

@Entry(storage)
@Component
struct Extension {

  @State clickNum: number = 0
  @State longPressNum: number = 0
  @State message: string = ''

  build() {
    Column() {
      Text(this.clickNum + '')
        .id('clickNum')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Row(){
        Text('UEC点击次数 ：')
        Text(this.clickNum + '')
          .id('clickNum')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      Row(){
        Text('错误码验证结果 ：')
        Text(this.message + '')
          .id('longPressNum1')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      Row(){
        Text('UEC长按次数 ：')
        Text(this.longPressNum + '')
          .id('longPressNum')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }

      
      Button('独占点击事件')
        .id('button')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.occupyEvents(uiExtension.EventFlag.EVENT_CLICK |
              uiExtension.EventFlag.EVENT_LONG_PRESS |
              uiExtension.EventFlag.EVENT_PAN_GESTURE_LEFT |
              uiExtension.EventFlag.EVENT_PAN_GESTURE_RIGHT |
              uiExtension.EventFlag.EVENT_PAN_GESTURE_DOWN |
              uiExtension.EventFlag.EVENT_PAN_GESTURE_UP |
              uiExtension.EventFlag.EVENT_NONE
            )
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
          }
        })

      Button('独占点击事件401')
        .id('button401')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.occupyEvents(null)
            console.log('testUIExtensionHostOccupyEvents success')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code
          }
        })

      Button('按钮')
        .id('clickBtn')
        .onClick(() => this.clickNum++)
        .gesture(
          LongPressGesture({ repeat: true })
            .onAction((event: GestureEvent|undefined) => {
              if(event){
                if(event.repeat) {
                  this.longPressNum++
                }
              }
            })
        )

    }.width('100%').height('100%')
  }
}