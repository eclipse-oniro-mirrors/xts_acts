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

import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Entry, Web, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, OnGeolocationShowEvent, JsGeolocation} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State, MutableState, stateOf, observableProxy } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import { setTimeout } from '@internal.full.global';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  message: string = 'var';
  changeValue() {
    this.stateVar+='~'
  }

  webviewController: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State geoAccess: boolean = false;
  @State geoShow: boolean = false;
  @State geoHide: boolean = false;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data?.['ACTION'] != null) {
        this.str = '' + eventData.data?.['ACTION'];
      }
    }
  }

  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button("WebAttributeTest Button")
        .key('WebAttributeTestButton')
        .onClick((e: ClickEvent) => {
          console.info(0x0000, 'testTag', "key==>" + this.str);
          switch (this.str) {
            case "GeolocationAccess": {
              try {
                this.webviewController.loadUrl("resource://rawfile/geo.html")
                setTimeout(() => {
                  Utils.emitEvent(this.geoAccess, 101);
                }, 5000)
              } catch (error) {
                console.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "OnGeolocationShow": {
              try {
                this.webviewController.loadUrl("resource://rawfile/geo.html")
                setTimeout(() => {
                    Utils.emitEvent(this.geoShow, 102);
                }, 5000)
              } catch (error) {
                console.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
          }
        })

      Button("WebviewContrllerTest Button")
        .key('WebviewContrllerTestButton')
        .onClick((e: ClickEvent) => {
          console.info(0x0000, 'testTag', "key==>" + this.str);
          switch(this.str) {
            case "Constructor": {
              try {
                let geo = new JsGeolocation();
                Utils.emitEvent("done", 103);
              } catch (error) {
                console.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
          }
        })

      Web({ src: "resource://rawfile/geo.html", controller: this.webviewController })
        .key('webView')
        .width('100%')
        .databaseAccess(true)
        .geolocationAccess(true)
        .onGeolocationShow((event: OnGeolocationShowEvent): void => {
          if (event) {
            this.geoAccess = true
            console.info(0x0000, 'testTag', 'onGeolocationShow==> geoAccess:' + this.geoAccess)
            let geo : JsGeolocation = new JsGeolocation();
            geo = event.geolocation;
            geo.invoke(event.origin, true, false);
            this.geoShow = true
            console.info(0x0000, 'testTag', 'onGeolocationShow==> geoShow:' + this.geoShow)
          }
        })
        .onGeolocationHide(() => {
          this.geoHide = true
          console.info(0x0000, 'testTag', 'onGeolocationHide==> geoHide:' + this.geoHide)
        })
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize(50)
  }
}
