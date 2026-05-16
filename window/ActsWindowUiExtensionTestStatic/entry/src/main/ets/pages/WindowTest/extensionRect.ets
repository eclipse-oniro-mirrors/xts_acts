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

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'

import { UIExtensionContentSession } from '@kit.AbilityKit';
import uiExtension from '@ohos.arkui.uiExtension';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Extension {

  @State testNum: number = 0
  @State message: string = ''
  private storage: LocalStorage | undefined = this.getUIContext()?.getSharedLocalStorage();

  build() {
    Column() {
      Text(this.message + '')
        .id('errorMessage')
        .fontSize(20)
        // 
      Text(this.testNum + '')
        .id('testNum')
        .fontSize(20)
        // 
      Button('监听组件变化')
        .id('button')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.onRectChange(uiExtension.RectChangeReason.HOST_WINDOW_RECT_CHANGE,
            (data: uiExtension.RectChangeOptions) => {
              console.log('Succeeded window rect changes. Data: + ' + JSON.stringify(data))
              if (data.rect === undefined || data.reason === undefined) {
                this.testNum--
              }
              this.testNum++
            })
          } catch (err) {
            console.log('testUIExtensionHostRectChange: err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
            this.testNum = err.code
          }
        })
      Button('取消一个函数监听')
        .id('off_single')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          let cb = (data: uiExtension.RectChangeOptions) => {
            console.log('Succeeded window rect changes. Data: + ' + JSON.stringify(data))
            if (data.rect === undefined || data.reason === undefined) {
              this.testNum--
            }
            this.testNum++
          }
          let cb2 = (data: uiExtension.RectChangeOptions) => {
            console.log('Succeeded window rect changes. Data: + ' + JSON.stringify(data))
            if (data.rect === undefined || data.reason === undefined) {
              this.testNum--
            }
            this.testNum++
          }
          try {
            extensionWindow?.onRectChange(uiExtension.RectChangeReason.HOST_WINDOW_RECT_CHANGE, cb)
            extensionWindow?.onRectChange(uiExtension.RectChangeReason.HOST_WINDOW_RECT_CHANGE, cb2)
            extensionWindow?.offRectChange(cb)
          } catch (err) {
            console.log('testUIExtensionHostOffRectChange01: err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
            this.testNum = err.code
          }
        })
      Button('取消所有函数监听')
        .id('off_all')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          let cb = (data: uiExtension.RectChangeOptions) => {
            console.log('Succeeded window rect changes. Data: + ' + JSON.stringify(data))
            if (data.rect === undefined || data.reason === undefined) {
              this.testNum--
            }
            this.testNum++
          }
          let cb2 = (data: uiExtension.RectChangeOptions) => {
            console.log('Succeeded window rect changes. Data: + ' + JSON.stringify(data))
            if (data.rect === undefined || data.reason === undefined) {
              this.testNum--
            }
            this.testNum++
          }
          try {
            extensionWindow?.onRectChange(uiExtension.RectChangeReason.HOST_WINDOW_RECT_CHANGE, cb)
            extensionWindow?.onRectChange(uiExtension.RectChangeReason.HOST_WINDOW_RECT_CHANGE, cb2)
            extensionWindow?.offRectChange()
          } catch (err) {
            console.log('testUIExtensionHostOffRectChange02: err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
            this.testNum = err.code
          }
        })
    }.width('100%').height('100%')
  }
}