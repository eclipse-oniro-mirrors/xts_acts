/*
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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import { ON,Driver } from '@kit.TestKit';
import business_error, { BusinessError } from '@ohos.base';
import { abilityAccessCtrl, PermissionRequestResult, common } from '@kit.AbilityKit';
const driver = Driver.create();

@Entry
@Component
struct webViewController {
  controller: webView.WebviewController = new webView.WebviewController();
  uiContext: UIContext = this.getUIContext();
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State flag:number = 1;
  @State str:string = ""
  @State newState:number = 3;
  @State CameraCaptureStateArr:CameraCaptureState[] = [CameraCaptureState.NONE,CameraCaptureState.PAUSED,CameraCaptureState.ACTIVE]
 

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 300758,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(300758)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }



  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('webViewOnCameraCaptureStateChangeButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitOnCameraCaptureStateChange001": {
              try {
                this.flag = 1;
                let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
                try {
                  let context: Context = getContext(this) as common.UIAbilityContext;
                  atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'],
                    (err: BusinessError, data: PermissionRequestResult) => {
                      console.info('data:' + JSON.stringify(data));
                      console.info('data permissions:' + data.permissions);
                      console.info('data authResults:' + data.authResults);
                    })
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                let buttonThree = await driver.waitForComponent(ON.text('允许'),10000);
                await buttonThree.click();
                let buttonOne = await driver.waitForComponent(ON.text('开启摄像头'),10000);
                await buttonOne.click();
                let buttonTwo = await driver.waitForComponent(ON.text('onConfirm'),10000);
                await buttonTwo.click();
                await Utils.sleep(1000)
                setTimeout(() => {
                  Utils.emitEvent(true, 20260201);
                },1000)

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnCameraCaptureStateChange002": {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  Utils.emitEvent(this.CameraCaptureStateArr[1], 20260202);
                } else {
                  this.controller.stopCamera();
                  setTimeout(() => {
                    Utils.emitEvent(this.CameraCaptureStateArr[this.newState], 20260202);
                  },1000)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnCameraCaptureStateChange003": {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  Utils.emitEvent(this.CameraCaptureStateArr[2], 20260203);
                } else {
                  await Utils.sleep(1000);
                  this.controller.startCamera();
                  setTimeout(() => {
                    Utils.emitEvent(this.CameraCaptureStateArr[this.newState], 20260203);
                  },500)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnCameraCaptureStateChange004": {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  Utils.emitEvent(this.CameraCaptureStateArr[0], 20260204);
                } else {
                  await Utils.sleep(1000);
                  this.controller.closeCamera();
                  setTimeout(() => {
                    Utils.emitEvent(this.CameraCaptureStateArr[this.newState], 20260204);
                  },500)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('cam.html'), controller: this.controller })
        .onPermissionRequest((event) => {
          if (event) {
            this.uiContext.showAlertDialog({
              title: 'title',
              message: 'text',
              primaryButton: {
                value: 'deny',
                action: () => {
                  event.request.deny();
                }
              },
              secondaryButton: {
                value: 'onConfirm',
                action: () => {
                  event.request.grant(event.request.getAccessibleResource());
                }
              },
              cancel: () => {
                event.request.deny();
              }
            })
          }
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
        .onCameraCaptureStateChange((info:CameraCaptureStateChangeInfo)=>{
          console.info("Camera from ", info.originalState, " to ", info.newState);
          console.info("newState" + info.newState);
          this.newState = info.newState;
        })
    }

  }
}