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
import {OnScreenCaptureRequestEvent, Entry, Component, Column, Row, Button, ClickEvent, Web, WebCaptureMode } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Callback } from '@ohos.base'
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON, On } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium/index';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct ScreenCapture {
  @State str: string = ''
  @State text: string = ''
  controller: webView.WebviewController = new webView.WebviewController(undefined);

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear');
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && (eventData.data as Record<string , RecordData>)?.['ACTION'] != null) {
        this.str = '' + (eventData.data as Record<string , RecordData>)?.['ACTION'];
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('ScreenCapture').key('ScreenCaptureConfig').onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitScreenCaptureConfigGetOrigin001': {
              this.text = 'getOrigin'
                this.controller.loadUrl('resource://rawfile/screenCaptureTest.html');
              setTimeout(() => {
               this.controller.runJavaScript('getScreenStream()')
              }, 5000)
                setTimeout(() => {
                 Utils.longClickComponent('btn')
              }, 5500)
              break;
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/indexJru.html', controller: this.controller })
        .key('btn')
        .onScreenCaptureRequest((event: OnScreenCaptureRequestEvent): void => {
          if (event) {
                event.handler.getOrigin()
                Utils.emitEvent(true, 4202)
          }
        })
    }
  }
}
