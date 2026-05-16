/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData} from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import inspector from '@ohos.arkui.inspector';
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebOnFullScreenEnter {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  handler?: FullScreenExitHandler
  videoWidth?: int;
  videoHeight?: int;
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State onFullScreenEnterCalled: boolean = false;
  @State handlerExitFullScreenCalled: boolean = false;
  @State checkEleResult: string = '';

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
        Button('web click').key('OnFullScreenEnterTestButton').onClick( (e:ClickEvent) => {
          console.info('key==>' +  this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitOnFullScreenEnter': {
              try {
                inspector.sendEventByKey('OnFullScreenEnterTestWeb', 10, '');
                setTimeout(() => {
                  Utils.emitEvent(this.onFullScreenEnterCalled , 442)
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnFullScreenEnter_handler': {
              try {
                setTimeout(() => {
                  console.log('this.handler: ' + this.handler)
                  Utils.emitEvent((this.handler ?? 0) != 0 , 443)
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnFullScreenEnter_handler_exitFullScreen': {
              try {
                setTimeout(() => {
                  console.log('this.handlerExitFullScreenCalled: ' + this.handlerExitFullScreenCalled)
                  Utils.emitEvent(this.handlerExitFullScreenCalled , 444)
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnFullScreenEnter_videoWidth': {
              try {
                setTimeout(() => {
                  console.log('this.videoWidth: ' + this.videoWidth)
                  Utils.emitEvent((this.videoWidth ?? 0) > 0 , 445)
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnFullScreenEnter_videoHeight': {
              try {
                setTimeout(() => {
                  console.log('this.videoHeight: ' + this.videoHeight)
                  Utils.emitEvent((this.videoHeight ?? 0) > 0 , 446)
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
            }
            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebMediaPlayGestureAccess' })
              console.log('push URL success')
              break;
            }
          }
        })
      }
      Web({ src: 'resource://rawfile/videoTest1.html', controller: this.controller })
        .key('OnFullScreenEnterTestWeb')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onFullScreenEnter((event: FullScreenEnterEvent): void => {
          console.log('onFullScreenEnter...')
          this.handler = event.handler
          this.videoWidth = event.videoWidth
          this.videoHeight = event.videoHeight
          console.log('event.handler: ' + JSON.stringify(event.handler))
          console.log('event.videoWidth: ' + JSON.stringify(event.videoWidth))
          console.log('event.videoHeight: ' + JSON.stringify(event.videoHeight))
          this.onFullScreenEnterCalled = true
          try {
            setTimeout(() => {
              this.handler?.exitFullScreen()
              this.handlerExitFullScreenCalled = true
            }, 2000)
          } catch (error) {
            error = error as BusinessError;
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
        .onFullScreenExit((): void => {
          console.log('onFullScreenExit...')
        })
    }
  }
}
