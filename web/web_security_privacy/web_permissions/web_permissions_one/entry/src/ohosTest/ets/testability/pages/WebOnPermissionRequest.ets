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

import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import PermissionsUtils from '../../test/PermissionsUtils';
import { Driver, ON } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import {waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct WebOnPermissionRequest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ''
  @State deny: boolean = false
  @State userAgentPC:string = '';
  permissionRequest: PermissionRequest | null = null
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 160860,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(160860)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('web click')
          .key('WebOnPermissionRequestTestButton')
          .focusable(true)
          .onFocus(() => {
            console.log('onFocus==>')
          })
          .onBlur(() => {
            console.log('onBlur==>')
          })
          .onClick(async () => {
            let deviceProductModel: string = deviceInfo.productModel
            console.log('the value of the deviceInfo productModel is : ' + deviceProductModel)
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'emitPermissionRequestDeny001': {
                if (canIUse('SystemCapability.Multimedia.Camera.Core')) {
                  if ( Utils.isPC(this.controller)||Utils.isWearable(this.controller) ) {
                    console.info('[TAO]PC or Wearable');
                    Utils.emitEvent('"deny"', 160870)
                    break;
                  }
                  try {
                    this.deny = true;
                    this.controller.runJavaScript('getMedia()', (error) => {
                      if (error) {
                        console.info('getMedia() return error: ' + error)
                      }
                    })
         
                    this.controller.runJavaScript('getResult()', (error, result) => {
                      if (error) {
                        console.info('getResult() return error: ' + error)
                      }
                      if (result) {
                        console.info('getResult() return result: ' + result)
                        if (result === '"deny"' || result === '""') {
                          Utils.emitEvent('"deny"', 160870)
                        }
                      }
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
                } else {
                  Utils.emitEvent('"deny"', 160870)
                }
              }
              case 'emitPermissionRequestGrant001': {
                if (canIUse('SystemCapability.Multimedia.Camera.Core')) {
                  if (Utils.isPC(this.controller)||Utils.isWearable(this.controller)) {
                    console.info('[TAO]PC or Wearable');
                    Utils.emitEvent('"grant"', 160880)
                    break;
                  }

                  if (deviceProductModel === 'emulator') {
                    Utils.emitEvent('"grant"', 160880)
                    break;
                  }
                  try {
                    this.deny = false;
                    this.controller.runJavaScript('getMedia()', (error) => {
                      if (error) {
                        console.info('getMedia() return error: ' + error)
                      }
                    })

                    PermissionsUtils.reqPermissionCamera(getContext(this) as common.UIAbilityContext,
                      (success: boolean) => {
                        if (success) {
                          console.info('onPermissionRequest ====> grant')
                          if (this.permissionRequest) {
                            this.permissionRequest.grant(this.permissionRequest.getAccessibleResource())
                          } else {
                            console.info('permissionRequest is null')
                          }
                        }
                      })

                    let driver = Driver.create();
 
                    await waitForExist(async () => {
                      try {
                        const component = await driver.findComponent(ON.text('允许'));
                        return component !== null;
                      } catch {
                        return false;
                      }
                    }, "allowButton", true)

                    const component = await driver.findComponent(ON.text('允许'));
                    await component.click();

           
                    const result = await waitForExist(async () => {
                      return new Promise<string>((resolve) => {
                        this.controller.runJavaScript('getResult()', (error, result) => {
                          if (error) {
                            console.info('getResult() return error: ' + error)
                            resolve('')
                          } else if (result) {
                            console.info('getResult() return result: ' + result)
                            resolve(result)
                          } else {
                            resolve('')
                          }
                        })
                      })
                    }, "getResult", '"grant"')

                    Utils.emitEvent(result, 160880)

                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  }
                  break;
                } else {
                  Utils.emitEvent('"grant"', 160880)
                }
              }
            }
          })

        Web({ src: $rawfile('permissionRequestTest.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .onPermissionRequest((event: OnPermissionRequestEventType) => {
            if (event) {
              console.info('onPermissionRequest ====>' + event.request.getOrigin())
              if (this.deny) {
                event.request.deny()
                console.info('onPermissionRequest ====> deny')
              } else {
                this.permissionRequest = event.request
              }
            }
          })
          .onConsole((event: OnConsoleEventType) => {
            if (event) {
              console.info('onConsole ====>' + event.message.getMessage())
            }
            return false
          })
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('onPageEnd url:' + event.url);
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}

interface OnPermissionRequestEventType {
  request: PermissionRequest;
}

interface OnConsoleEventType {
  message: ConsoleMessage;
}