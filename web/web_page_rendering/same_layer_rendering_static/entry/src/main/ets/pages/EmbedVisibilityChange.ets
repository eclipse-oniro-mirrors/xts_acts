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
import { Color,NativeEmbedDataInfo,  Entry, Component, Column, Row, Button, ClickEvent,Web } from '@ohos.arkui.component'
import web_webview from '@ohos.web.webview';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { State} from '@ohos.arkui.stateManagement'
import Utils from '../../src/test/Util.test';
import { BusinessError, RecordData } from '@ohos.base'
import {NativeEmbedDataInfo,Position ,NativeEmbedTouchInfo} from '@ohos.arkui.component'
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {NativeEmbedVisibilityInfo,NativeEmbedStatus} from '@ohos.arkui.component';
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct WebEmbedVisibilityChange  {
  browserTabController: webView.WebviewController = new webView.WebviewController(undefined)
  @State onNativeEmbedLifecycleChange: boolean = false;
  @State onNativeEmbedGestureEvent:boolean = false;
  @State embedStatus:string = '';
  @State str: string = ''
  controller: webView.WebviewController = new webView.WebviewController(undefined);

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
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
        Button('emitEmbedVisibilityChange001')
          .key('WebViewEmbedVisibilityChangeButton')
          .onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitEmbedVisibilityChange001': {
              this.controller.loadUrl('resource://rawfile/onNativeEmbedGestureEvent_onNativeEmbedVisibilityChange.html')
              break;
            }

            case 'emitonSwitchNextPage1': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewControllerPart2' })
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
          .enableNativeEmbedMode(true)
          .onNativeEmbedGestureEvent((event: NativeEmbedTouchInfo): void => {
            event.result?.setGestureEventResult(true);
            console.log("event.result:", event.result);
            hilog.info(0x0000, 'testTag', 'onNativeEmbedGestureEvent: ' + JSON.stringify(event));
          })
          .onNativeEmbedLifecycleChange((event: NativeEmbedDataInfo):void => {
            if (event.status == NativeEmbedStatus.CREATE) {
              this.embedStatus = 'Create';
            }
            if (event.status == NativeEmbedStatus.UPDATE) {
              this.embedStatus = 'Update';
            }
            if (event.status == NativeEmbedStatus.DESTROY) {
              this.embedStatus = 'Destroy';
            }
            if (event.status == NativeEmbedStatus.ENTER_BFCACHE) {
              this.embedStatus = 'Enter BFCache';
            }
            if (event.status == NativeEmbedStatus.LEAVE_BFCACHE) {
              this.embedStatus = 'Leave BFCache';
            }
            console.info('onNativeEmbedLifecycleChange==>' + JSON.stringify(event));
            console.info('onNativeEmbedLifecycleChange==>[status]:' + event.status);
            console.info('onNativeEmbedLifecycleChange==>[surfaceId]:' + event.surfaceId);
            console.info('onNativeEmbedLifecycleChange==>[info]:' + event.info);

          })
          .onNativeEmbedVisibilityChange((event: NativeEmbedVisibilityInfo):void => {
            console.info('onNativeEmbedVisibilityChange==>'  + JSON.stringify(event));
            console.info('onNativeEmbedVisibilityChange==>'  + event.embedId);
            console.info('onNativeEmbedVisibilityChange==>'  + event.visibility);
             Utils.emitEvent(true, 16571657)
          })
    }
  }
}
