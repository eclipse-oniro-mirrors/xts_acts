/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

import { Entry, Component, $rawfile, Column, Row, Button, ClickEvent, Web, $rawfile, MicrophoneCaptureStateChangeInfo, MicrophoneCaptureState } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
import { abilityAccessCtrl, PermissionRequestResult, common } from '@kit.AbilityKit';
import { Driver, ON } from '@ohos.UiTest';
const driver = Driver.create();
export class StringFields {
  public str: string = '';
}


@Entry
@Component
struct webViewController {
  stringObj: StringFields  = new StringFields();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  uiContext: UIContext = this.getUIContext();
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State flag:number = 1;
  @State str:string = ""
  @State newState:number = 3;
  @State MicrophoneCaptureStateArr:MicrophoneCaptureState[] = [MicrophoneCaptureState.NONE,MicrophoneCaptureState.PAUSED,MicrophoneCaptureState.ACTIVE]

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
        console.info(this.stringObj.str)
      }
    }
  }



  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('webViewOnMicrophoneCaptureStateChangeButton').onClick((e:ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "emitOnMicrophoneCaptureStateChange001": {
              try {
                setTimeout(() => {
                  Utils.emitEvent(true, 20260101);
                },1000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnMicrophoneCaptureStateChange002": {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  Utils.emitEvent(MicrophoneCaptureState.PAUSED, 20251229);
                } else {
                  this.controller.pauseMicrophone();
                  setTimeout(() => {
                    Utils.emitEvent(this.newState, 20251229);
                  }, 1000)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnMicrophoneCaptureStateChange003": {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  Utils.emitEvent(MicrophoneCaptureState.ACTIVE, 20251230);
                } else {
                  this.controller.resumeMicrophone();
                  setTimeout(() => {
                    Utils.emitEvent(this.newState, 20251230);
                  },1000)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnMicrophoneCaptureStateChange004": {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  Utils.emitEvent(MicrophoneCaptureState.NONE, 20251231);
                } else {
                  this.controller.stopMicrophone();
                  setTimeout(() => {
                  Utils.emitEvent(this.newState, 20251231);
                },1000)
              }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('microphone.html'), controller: this.controller })
        .onPermissionRequest((event) => {
          if (event) {
            event.request.grant(event.request.getAccessibleResource());
          }
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
        .onMicrophoneCaptureStateChange((event:MicrophoneCaptureStateChangeInfo)=>{
          console.info("Microphone from ", event.originalState, " to ", event.newState);
          console.info("newState" + event.newState);
          this.newState = event.newState;
        })
    }

  }
}