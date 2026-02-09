/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Row, Button, ClickEvent, Web, FullScreenExitHandler } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { BusinessError } from '@ohos.base';
import { UIContext } from '@ohos.arkui.UIContext'
import {
  AlertDialogParamWithButtons,
  WebCaptureMode,
  OnLoadInterceptEvent,
  OnScreenCaptureRequestEvent,
  OnOverScrollEvent,
  OnClientAuthenticationEvent
} from '@ohos.arkui.component';

let loadedUrl: string;

@Entry
@Component
struct Index {
  webviewController: webview.WebviewController = new webview.WebviewController(undefined);
  uiContext: UIContext = this.getUIContext();
  @State outputStr: string = '';
  @State playing: boolean = false;
  @State str: string = 'emitOnLoadIntercept';
  @State arrid: number = 0;
  @State handler: FullScreenExitHandler | null = null;

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
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('webcomponent').onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitOnLoadIntercept': {
              this.webviewController.loadUrl('https://www.baidu.com/');
              break;
            }
            default:
              console.info('can not match case');
          }
        })
      }

      Web({ src: 'https://client.badssl.com/', controller: this.webviewController })
        .key('center')
        .onClientAuthenticationRequest((event: OnClientAuthenticationEvent): void => {
          console.log('onClientAuthenticationRequest: ' + event.host)
          console.log('onClientAuthenticationRequest: ' + event.port)
          console.log('onClientAuthenticationRequest: ' + event.handler)
          console.log('onClientAuthenticationRequest: ' + event.issuers)
          console.log('onClientAuthenticationRequest: ' + event.keyTypes)
          console.log('onClientAuthenticationRequest success')
          if (event) {
            try {
              event.handler.confirm('/system/etc/user.pk8', '/system/etc/chain-user.pem');
              event.handler.confirm('/system/etc/user.pk8');
              event.handler.cancel();
              event.handler.ignore();
              console.log('onClientAuthenticationRequest confirm,cancel,ignore success')
            } catch (error) {
              console.log('Error:' + error.toString())
            }
          }
        })

        .onLoadIntercept((event: OnLoadInterceptEvent): boolean => {
          console.log('url:' + event.data.getRequestUrl());
          Utils.emitEvent(event.data.getRequestUrl(), 2);
          console.log('isMainFrame: ' + event.data.isMainFrame());
          console.log('isRedirect: ' + event.data.isRedirect());
          console.log('isRequestGesture:' + event.data.isRequestGesture());
          return false;
        })

        .onScreenCaptureRequest((event: OnScreenCaptureRequestEvent): void => {
          if (event) {
            this.uiContext.showAlertDialog({
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
            } as AlertDialogParamWithButtons)
          }
        })

        .onControllerAttached(() => {
          try {
            this.arrid = this.webviewController.getWebId();
            console.log('this.arrid : ' + this.arrid);

          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

        .onOverScroll((event: OnOverScrollEvent): void => {
          console.info('x = ' + event.xOffset);
          console.info('y = ' + event.yOffset);
        })
    }
  }
}
