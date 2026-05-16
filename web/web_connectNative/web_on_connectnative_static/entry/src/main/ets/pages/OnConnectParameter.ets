/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, Row, Button, ClickEvent, Web,FullScreenEnterEvent,FullScreenExitHandler} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import webView from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, Level, it, expect } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData} from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
import inspector from '@ohos.arkui.inspector';
class ConnectionCallback implements webNativeMessagingExtensionManager.WebExtensionConnectionCallback  {

  constructor() {
  }
  onConnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo){
    console.info(`OnConnectParameter001 onConnect called`);
  }
  onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo){
    console.info(`OnConnectParameter001 onDisconnect called`);
  }
  onFailed(code: webNativeMessagingExtensionManager.NmErrorCode,
    errMsg: string){
    console.info(`OnConnectParameter001 onDisconnect code: ${code} errMsg: ${errMsg}`);
  }
}
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebOnConnectParameter {
  stringObj: StringFields  = new StringFields();
  controller: webView.WebviewController = new webView.WebviewController(undefined);

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
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('OnConnectParameter click')
          .key('OnConnectParameterTestButton')
          .onClick( (e:ClickEvent) => {
          console.info('key==>' +  this.stringObj.str)
          switch (this.stringObj.str) {
            case 'OnConnectParameter001': {
              try {
                let callback = new ConnectionCallback()
                let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
                  connectionId: 1,
                  bundleName: "com.example.extension",
                  extensionOrigin: "chrome-extension://test/",
                  extensionPid: 1234
                };

                callback.onConnect(mockConnection);
                console.log(`mockConnection.connectionId: ${mockConnection.connectionId}`);
                console.log(`mockConnection.bundleName: ${mockConnection.bundleName}`);
                console.log(`mockConnection.extensionOrigin: ${mockConnection.extensionOrigin}`);
                console.log(`mockConnection.extensionPid: ${mockConnection.extensionPid}`);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }
      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}
