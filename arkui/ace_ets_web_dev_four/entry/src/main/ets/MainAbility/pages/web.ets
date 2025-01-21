/*
 * Copyright (c) 2021~2023 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import fileio from '@ohos.fileio';
import prompt from '@system.prompt';

let loadedUrl: string;

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State outputStr: string = '';
  @State playing: boolean = false;
  @State str: string = "emitOnLoadIntercept";
  @State arrid: number = 0;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info('start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnLoadIntercept": {
              this.controller.loadUrl("https://www.baidu.com/");
              break;
            }
            case "emitOnControllerAttached": {
              Utils.emitEvent(this.arrid, 7);
              break;
            }

            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: "www.example.com", controller: this.controller })
        .onLoadIntercept((event) => {
          console.log('url:' + event.data.getRequestUrl());
          Utils.emitEvent(event.data.getRequestUrl(), 2);
          console.log('isMainFrame:' + event.data.isMainFrame());
          console.log('isRedirect:' + event.data.isRedirect());
          console.log('isRequestGesture:' + event.data.isRequestGesture());
          return false;
        })

        .onErrorReceive((event) => {
          console.log('getErrorInfo:' + event.error.getErrorInfo());
          Utils.emitEvent(event.error.getErrorInfo(), 3);
        })

        .onScreenCaptureRequest((event) => {
          AlertDialog.show({
            title: 'title: ' + event.handler.getOrigin(),
            message: 'text',
            primaryButton: {
              value: 'deny',
              action: () => {
                event.handler.deny();
              }
            },
            secondaryButton: {
              value: 'onConfirm',
              action: () => {
                event.handler.grant({ captureMode: WebCaptureMode.HOME_SCREEN });
              }
            },
            cancel: () => {
              event.handler.deny();
            }
          })
        })

        .onControllerAttached(() => {
          try {
            this.arrid = this.controller.getWebId();
            console.log("id++++++: " + this.arrid);

          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })

        .onOverScroll((event) => {
          console.info("x = " + event.xOffset);
          console.info("y = " + event.yOffset);
        })

        .onClientAuthenticationRequest((event) => {
          console.log('onClientAuthenticationRequest' + event.keyTypes)
          console.log('onClientAuthenticationRequest' + event.issuers)
          AlertDialog.show({
            title: 'onClientAuthenticationRequest',
            message: 'text',
            primaryButton: {
              value: 'confirm',
              action: () => {
                event.handler.confirm("/system/etc/user.pk8", "/system/etc/chain-user.pem")
              }
            },
            secondaryButton: {
              value: 'cancel',
              action: () => {
                event.handler.cancel();
              }
            },
            cancel: () => {
              event.handler.ignore();
            }
          })
        })

    }
  }
}