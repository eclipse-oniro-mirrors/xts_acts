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
import window from '@ohos.window';

import { UIExtensionContentSession } from '@kit.AbilityKit';
import uiExtension from '@ohos.arkui.uiExtension';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ExtensionErrorCode {

  @State clickNum: number = 0
  @State longPressNum: number = 0
  @State message: string = ''
  @State flag: boolean = false;
  private storage: LocalStorage | undefined = this.getUIContext()?.getSharedLocalStorage();

  build() {
    Column() {

      Row(){
        Text('错误码验证结果 ：')
        Text(this.message + '')
          .id('errorMessage')
          .fontSize(20)
          
      }
      Row(){
        Text('返回值验证结果 flag：')
        Text(this.flag + '')
          .id('flag')
          .fontSize(20)
          
      }

      Button('getWindowAvoidAreaCUTOUT')
        .id('getWindowAvoidAreaCUTOUT')
        .width('90%').margin({ top: 5, bottom: 5 }).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get < UIExtensionContentSession > ('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {

            let avoidArea: window.AvoidArea | undefined = extensionWindow?.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
            console.log('success in getWindowAvoidAreaCUTOUT :' + JSON.stringify(avoidArea))
            if (avoidArea!.visible !== null && avoidArea!.topRect.width === 0 && avoidArea!.topRect.height === 0 && 
            avoidArea!.topRect.top === 0 && avoidArea!.topRect.left === 0 && 
              avoidArea!.rightRect.width === 0 && avoidArea!.rightRect.height === 0 && avoidArea!.rightRect.top === 0 && 
              avoidArea!.rightRect.left === 0 && 
              avoidArea!.bottomRect.width === 0 && avoidArea!.bottomRect.height === 0 && avoidArea!.bottomRect.top === 0 && 
              avoidArea!.bottomRect.left === 0 && 
              avoidArea!.leftRect.width === 0 && avoidArea!.leftRect.height === 0 && avoidArea!.leftRect.top === 0 && 
              avoidArea!.leftRect.left === 0
            ) {
              this.flag = true;
              console.log('success in getWindowAvoidAreaCUTOUT flag:' + this.flag)
            } else {
              return;
            }

            avoidArea = extensionWindow?.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT)
            console.log('success in getWindowAvoidAreaCUTOUT :' + JSON.stringify(avoidArea))
            if (avoidArea!.visible === false && avoidArea!.topRect.width === 0 && avoidArea!.topRect.height === 0 && 
            avoidArea!.topRect.top === 0 && avoidArea!.topRect.left === 0 && 
              avoidArea!.rightRect.width === 0 && avoidArea!.rightRect.height === 0 && avoidArea!.rightRect.top === 0 && 
              avoidArea!.rightRect.left === 0 && 
              avoidArea!.bottomRect.width === 0 && avoidArea!.bottomRect.height === 0 && avoidArea!.bottomRect.top === 0 && 
              avoidArea!.bottomRect.left === 0 && 
              avoidArea!.leftRect.width === 0 && avoidArea!.leftRect.height === 0 && avoidArea!.leftRect.top === 0 && 
              avoidArea!.leftRect.left === 0
            ) {
              this.flag = true;
              console.log('success in getWindowAvoidAreaCUTOUT flag:' + this.flag)
            }
            this.message = 'success'

          } catch (err) {
            console.log('testGetWindowAvoidArea_TYPE_CUTOUT err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

      Button('getWindowAvoidAreaGESTURE')
        .id('getWindowAvoidAreaGESTURE')
        .width('90%').margin({ top: 5, bottom: 5 }).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get < UIExtensionContentSession > ('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            let avoidArea: window.AvoidArea | undefined = extensionWindow?.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE)
            console.log('success in getWindowAvoidAreaGESTURE :' + JSON.stringify(avoidArea))
            if (avoidArea!.visible === true && avoidArea!.topRect.width === 0 && avoidArea!.topRect.height === 0 && 
            avoidArea!.topRect.top === 0 && avoidArea!.topRect.left === 0 && 
              avoidArea!.rightRect.width === 0 && avoidArea!.rightRect.height === 0 && avoidArea!.rightRect.top === 0 && 
              avoidArea!.rightRect.left === 0 && 
              avoidArea!.bottomRect.width === 0 && avoidArea!.bottomRect.height === 0 && avoidArea!.bottomRect.top === 0 && 
              avoidArea!.bottomRect.left === 0 && 
              avoidArea!.leftRect.width === 0 && avoidArea!.leftRect.height === 0 && avoidArea!.leftRect.top === 0 && 
              avoidArea!.leftRect.left === 0
            ) {
              this.flag = true;
              console.log('success in getWindowAvoidAreaGESTURE flag:' + this.flag)
            }
            this.message = 'success'

          } catch (err) {
            console.log('testGetWindowAvoidArea_TYPE_SYSTEM_GESTURE err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

      Button('getWindowAvoidAreaKEYBOARD')
        .id('getWindowAvoidAreaKEYBOARD')
        .width('90%').margin({ top: 5, bottom: 5 }).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get < UIExtensionContentSession > ('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            let avoidArea: window.AvoidArea | undefined = extensionWindow?.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD)
            console.log('success in getWindowAvoidAreaKEYBOARD :' + JSON.stringify(avoidArea))
            if (avoidArea!.visible === true && avoidArea!.topRect.width === 0 && avoidArea!.topRect.height === 0 && 
            avoidArea!.topRect.top === 0 && avoidArea!.topRect.left === 0 && 
              avoidArea!.rightRect.width === 0 && avoidArea!.rightRect.height === 0 && avoidArea!.rightRect.top === 0 && 
              avoidArea!.rightRect.left === 0 && 
              avoidArea!.bottomRect.width === 0 && avoidArea!.bottomRect.height === 0 && avoidArea!.bottomRect.top === 0 && 
              avoidArea!.bottomRect.left === 0 && 
              avoidArea!.leftRect.width === 0 && avoidArea!.leftRect.height === 0 && avoidArea!.leftRect.top === 0 && 
              avoidArea!.leftRect.left === 0
            ) {
              this.flag = true;
              console.log('success in getWindowAvoidAreaKEYBOARD flag:' + this.flag)
            }
            this.message = 'success'

          } catch (err) {
            console.log('testGetWindowAvoidArea_TYPE_KEYBOARD err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

      Button('getWindowAvoidAreaNAVIGATION_INDICATOR')
        .id('getWindowAvoidAreaNAVIGATION_INDICATOR')
        .width('90%').margin({ top: 5, bottom: 5 }).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get < UIExtensionContentSession > ('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            let avoidArea: window.AvoidArea | undefined = extensionWindow?.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
            console.log('success in getWindowAvoidAreaNAVIGATION_INDICATOR :' + JSON.stringify(avoidArea))
            if (avoidArea!.visible === true && avoidArea!.topRect.width === 0 && 
            avoidArea!.topRect.height === 0 && avoidArea!.topRect.top === 0 && 
              avoidArea!.topRect.left === 0 && avoidArea!.rightRect.width === 0 && 
              avoidArea!.rightRect.height === 0 && avoidArea!.rightRect.top === 0 && 
              avoidArea!.rightRect.left === 0 && avoidArea!.bottomRect.width === 0 && 
              avoidArea!.bottomRect.height === 0 && avoidArea!.bottomRect.top === 0 && 
              avoidArea!.bottomRect.left === 0 &&
              avoidArea!.leftRect.width === 0 && avoidArea!.leftRect.height === 0 && 
              avoidArea!.leftRect.top === 0 && avoidArea!.leftRect.left === 0
            ) {
              this.flag = true;
              console.log('success in getWindowAvoidAreaNAVIGATION_INDICATOR flag:' + this.flag)
            }
            this.message = 'success'

          } catch (err) {
            console.log('testGetWindowAvoidArea_TYPE_NAVIGATION_INDICATOR err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })
      Button('windowSizeChange')
        .id('windowSizeChange')
        .width('90%').margin({ top: 5, bottom: 5 }).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get < UIExtensionContentSession > ('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow!.onWindowSizeChange((size: window.Size) => {
              console.info(`The avoid area of the host window is: ${JSON.stringify(size)}.`);
              if(size.width>0 &&size.height>0){
                this.flag = true;
                console.log('success in getWindowAvoidAreaNAVIGATION_INDICATOR flag:' + this.flag)
              }
              
            });
            this.message = 'success'

          } catch (err) {
            console.log('testGetWindowAvoidArea_TYPE_NAVIGATION_INDICATOR err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })
        Button('offWindowSizeChange')
        .id('offWindowSizeChange')
        .width('90%').margin({ top: 5, bottom: 5 }).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get < UIExtensionContentSession > ('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            let cb = (size: window.Size) => {
              console.info(`The avoid area of the host window is: ${JSON.stringify(size)}.`);
              if(size.width>0 &&size.height>0){
                this.flag = true;
                console.log('success in getWindowAvoidAreaNAVIGATION_INDICATOR flag:' + this.flag)
              }
              
            }
            extensionWindow!.onWindowSizeChange(cb);
            extensionWindow!.offWindowSizeChange(cb);
            extensionWindow!.onWindowSizeChange(cb);
            extensionWindow!.offWindowSizeChange();
            this.message = 'success'

          } catch (err) {
            console.log('testGetWindowAvoidArea_TYPE_NAVIGATION_INDICATOR err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })
        Button('rectChange')
        .id('rectChange')
        .width('90%').margin({ top: 5, bottom: 5 }).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get < UIExtensionContentSession > ('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow!.onRectChange(uiExtension.RectChangeReason.HOST_WINDOW_RECT_CHANGE, 
              (data: uiExtension.RectChangeOptions) => {
              console.info(`Succeeded window rect changes. Data: ${JSON.stringify(data)}.`);
              if(data.reason === uiExtension.RectChangeReason.HOST_WINDOW_RECT_CHANGE &&
                data.rect.height>0&&data.rect.width > 0&&data.rect.left>0&&data.rect.top>0){
                this.flag = true;
                console.log('success in getWindowAvoidAreaNAVIGATION_INDICATOR flag:' + this.flag)
              }
              
            });
            this.message = 'success'

          } catch (err) {
            console.log('testGetWindowAvoidArea_TYPE_NAVIGATION_INDICATOR err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

      Button('按钮')
        .id('clickBtn')
        .onClick(() => { this.clickNum++ })
        .gesture(
          LongPressGesture({ repeat: true })
            .onAction((event) => {
              if (event) {
                if (event.repeat) {
                  this.longPressNum++
                }
              }
            })
        )

      Button('offAvoidAreaChange')
        .id('offAvoidAreaChange')
        .width('90%').margin({ top: 5, bottom: 5 }).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get < UIExtensionContentSession > ('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            let cb = (info: uiExtension.AvoidAreaInfo) => {
              console.info(`The avoid area of the host window is: ${JSON.stringify(info.area)}.`);
            }
            extensionWindow?.onAvoidAreaChange(cb);
            // 取消注册 extensionWindow?.offAvoidAreaChange();
            extensionWindow?.offAvoidAreaChange(cb);
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

    }.width('100%').height('100%')
  }
}