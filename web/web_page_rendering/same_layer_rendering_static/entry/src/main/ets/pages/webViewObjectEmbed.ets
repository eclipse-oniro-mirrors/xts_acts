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
import {Entry, Component, Column, Row, Button, ClickEvent, Web ,Stack,NativeEmbedDataInfo,NativeEmbedTouchInfo,NativeEmbedStatus} from '@ohos.arkui.component'
import web_webview from '@ohos.web.webview';
import webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement'
import Utils from '../../src/test/Util.test';
import { BusinessError, RecordData } from '@ohos.base'
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct webViewObjectEmbed {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = '';
  @State embedStatus:string = '';
  @State isChange: boolean = false;

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
        Button('web click')
          .key('webViewObjectEmbedButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.str)
            this.controller.refresh();

            switch (this.str) {
              case 'emitWebViewObjectEmbed01': {
                this.controller.loadUrl('resource://rawfile/object1.html');
                Utils.emitEvent('success', 8014);
                break;
              }
              case 'emitWebViewObjectEmbed04': {
                this.controller.loadUrl('resource://rawfile/objectMultiple.html');
                Utils.emitEvent('success', 8017);
                break;
              }
            }
          })
      }
      Stack() {
        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .enableNativeEmbedMode(true)
        .onNativeEmbedGestureEvent((event: NativeEmbedTouchInfo): void => {
          event.result?.setGestureEventResult(true, true);
          hilog.info(0x0000, 'testTag', 'onNativeEmbedGestureEvent: ' + JSON.stringify(event));
        })
        .onNativeEmbedLifecycleChange((event: NativeEmbedDataInfo):void => {
          if (event.status == NativeEmbedStatus.CREATE) {
            this.embedStatus = 'Create';
            this.isChange = true;
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
          hilog.info(0x0000, 'testTag', 'onNativeEmbedLifecycleChange: ' + JSON.stringify(event));
          hilog.info(0x0000, 'testTag', 'onNativeEmbedLifecycleChange:[status]:' + event.status);
          hilog.info(0x0000, 'testTag', 'onNativeEmbedLifecycleChange:[surfaceId]:' + event.surfaceId);
          hilog.info(0x0000, 'testTag', 'onNativeEmbedLifecycleChange:[info]:' + event.info);

        })
        .onNativeEmbedGestureEvent((event: NativeEmbedTouchInfo): void => {
          hilog.info(0x0000, 'testTag', 'onNativeEmbedGestureEvent: ' + JSON.stringify(event));
        })
      }
    }
  }
}
