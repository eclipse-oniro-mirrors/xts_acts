/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, Row, Button, ClickEvent, Web,  $rawfile, SslErrorEvent, OnClientAuthenticationEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'


export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct clientAuthenticationHandlerTest {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = '';
  @State isPageEnd: number = -1;
  @State confirm:boolean = false;
  @State isError: number = -1;
  @State ignore:boolean = false;
  @State cancel:boolean = false;
  @State host:string = '';
  @State port:int = 0;
  @State handlerLength:int = 0;
  @State issuersLength:int = 0;
  @State keyTypesLength:int = 0;


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
        Button('clientAuthenticationHandler').key('clientAuthenticationHandlerButton').onClick((e:ClickEvent) => {
          console.info('key==>' + this.stringObj.str);
          switch (this.stringObj.str) {
            case 'emitClientAuthenticationHandlerConfirmType001': {
              try {
                this.controller.clearClientAuthenticationCache();
                this.controller.loadUrl('https://client.badssl.com');
                console.log(this.stringObj.str + ' result==>' + this.confirm);
                Utils.emitEvent(this.confirm, 25121101);
              } catch (error) {
                console.log(this.stringObj.str + 'errorInfo==>' + error.toString());
              }
              break;
            }
            case 'emitClientAuthenticationHandlerCancel001': {
              try {
                this.controller.clearClientAuthenticationCache();
                this.controller.loadUrl('https://client.badssl.com');
                console.log(this.stringObj.str + ' result==>' + this.cancel);
                Utils.emitEvent(this.cancel, 25121102);
              } catch (error) {
                console.log(this.stringObj.str + 'errorInfo==>' + error.toString());
              }
              break;
            }
            case 'emitClientAuthenticationHandlerIgnore001': {
              try {
                this.controller.clearClientAuthenticationCache();
                this.controller.loadUrl('https://client.badssl.com');
                console.log(this.stringObj.str + ' result==>' + this.ignore);
                Utils.emitEvent(this.ignore, 25121103);
              } catch (error) {
                console.log(this.stringObj.str + 'errorInfo==>' + error.toString());
              }
              break;
            }
            case 'emitOnClientAuthenticationEvent001': {
              Utils.emitEvent(this.host, 25121104);
              break;
            }
            case 'emitOnClientAuthenticationEvent002': {
              Utils.emitEvent(this.port, 25121105);
              break;
            }
            case 'emitOnClientAuthenticationEvent003': {
              Utils.emitEvent(this.handlerLength, 25121106);
              break;
            }
            case 'emitOnClientAuthenticationEvent004': {
              Utils.emitEvent(this.issuersLength, 25121107);
              break;
            }
            case 'emitOnClientAuthenticationEvent005': {
              Utils.emitEvent(this.keyTypesLength, 25121108);
              break;
            }
            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/clientAuthenticationHandlerTwo' })
              console.log('push URL success')
            }
          }
        }).margin(10)
 
      }
      Web({ src: 'https://client.badssl.com', controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url==>' + event.url);
          this.isPageEnd = 1;
        })
        .onClientAuthenticationRequest((event) => {
          console.log('onClientAuthenticationRequest==>');
          console.log('onClientAuthenticationRequest: ' + event.host)
          console.log('onClientAuthenticationRequest: ' + event.port)
          console.log('onClientAuthenticationRequest: ' + JSON.stringify(event.handler).length)
          console.log('onClientAuthenticationRequest: ' + JSON.stringify(event.issuers).length)
          console.log('onClientAuthenticationRequest: ' + JSON.stringify(event.keyTypes).length)
          this.host = event.host
          this.port = event.port
          this.handlerLength = JSON.stringify(event.handler).length
          this.issuersLength = JSON.stringify(event.issuers).length
          this.keyTypesLength = JSON.stringify(event.keyTypes).length
          try {
            event.handler.confirm('222', '333');
            event.handler.cancel();
            event.handler.ignore();
            this.cancel = true;
            this.ignore = true;
            this.confirm = true;
          } catch(error){
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
      }
  }
}
