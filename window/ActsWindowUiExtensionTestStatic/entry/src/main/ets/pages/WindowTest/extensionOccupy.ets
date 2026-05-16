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

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent, Row, LongPressGesture } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'

import { UIExtensionContentSession } from '@kit.AbilityKit';
import uiExtension from '@ohos.arkui.uiExtension';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Extension {

  @State clickNum: number = 0
  @State longPressNum: number = 0
  @State message: string = ''
  private storage: LocalStorage | undefined = this.getUIContext()?.getSharedLocalStorage();

  build() {
    Column() {
      Text(this.clickNum + '')
        .id('clickNum')
        .fontSize(20)
        
      Row(){
        Text('UEC点击次数 ：')
        Text(this.clickNum + '')
          .id('clickNum')
          .fontSize(20)
          
      }
      Row(){
        Text('错误码验证结果 ：')
        Text(this.message + '')
          .id('longPressNum1')
          .fontSize(20)
          
      }
      Row(){
        Text('UEC长按次数 ：')
        Text(this.longPressNum + '')
          .id('longPressNum')
          .fontSize(20)
          
      }

      
      Button('独占点击事件')
        .id('button')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get<UIExtensionContentSession>('session1');
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

      Button('按钮')
        .id('clickBtn')
        .onClick(() => { this.clickNum++ })
        .gesture(
          LongPressGesture({ repeat: true })
            .onAction((event) => {
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