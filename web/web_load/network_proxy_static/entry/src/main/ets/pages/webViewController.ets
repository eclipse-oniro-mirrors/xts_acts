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

import webview from '@ohos.web.webview'
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement'
import { Button, ClickEvent, Column, Component, Entry, Row, Text, Web } from '@ohos.arkui.component'
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import { Hypium } from '../../../hypium';
import Utils from '../../src/test/Utils.test';
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}
type OnProxyConfigChangeCallback = () => void
@Entry
@Component
struct webviewController {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State proxyConfig: webview.ProxyConfig = new webview.ProxyConfig();
  @State callbackFlag: boolean = false;

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
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("webviewController click").key('webviewController').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {
            case 'getWebId': {
              try {
                this.controller.loadUrl("www.example.com");
                setTimeout(() => {
                  let webId = this.controller.getWebId();
                  console.log('ljz-webId'+webId);
                  Utils.emitEvent(webId, 202603161);
                }, 3000)

              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'createWebMessagePorts': {
              try {
                this.controller.loadUrl("www.example.com");
                setTimeout(() => {
                  let port = this.controller.createWebMessagePorts().length;
                  console.log("createWebMessagePorts size:" + port)
                  Utils.emitEvent(port, 202603162);
                }, 3000)

              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'createWebMessagePorts2': {
              try {
                this.controller.loadUrl("www.example.com");
                setTimeout(() => {
                  let port = this.controller.createWebMessagePorts(true).length;
                  console.log("createWebMessagePorts size:" + port)
                  Utils.emitEvent(port, 202603163);
                }, 3000)

              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'createWebMessagePorts3': {
              try {
                this.controller.loadUrl("www.example.com");
                setTimeout(() => {
                  let port = this.controller.createWebMessagePorts(false).length;
                  console.log("createWebMessagePorts size:" + port)
                  Utils.emitEvent(port, 202603164);
                }, 3000)

              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'clearMatches': {
              try {
                this.controller.loadUrl("www.example.com");
                setTimeout(() => {
                  this.controller.clearMatches();
                  console.log("clearMatches")
                  Utils.emitEvent(true, 202603165);
                }, 3000)

              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'postMessage': {
              try {
                this.controller.loadUrl("www.example.com");
                setTimeout(() => {
                  let ports: webview.WebMessagePort[] = [];
                  this.controller.postMessage("",ports,"");
                  Utils.emitEvent(true, 202603166);
                }, 3000)

              } catch (error) {
                console.log("postMessage"+error.code);
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'searchNext': {
              try {
                this.controller.loadUrl("www.example.com");
                setTimeout(() => {
                  this.controller.searchNext(false);
                  console.log("clearMatches")
                  Utils.emitEvent(true, 202603167);
                }, 3000)

              } catch (error) {
                console.log("searchNext"+error.code)
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .webFixedFont(undefined)
        .webFixedFont('fixed')
        .webSansSerifFont(undefined)
        .webSansSerifFont('serif')
        .javaScriptProxy(undefined)
    }
  }
}
