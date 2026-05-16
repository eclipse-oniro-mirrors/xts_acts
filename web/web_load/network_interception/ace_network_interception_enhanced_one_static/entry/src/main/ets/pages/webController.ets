/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, $rawfile, Visibility, CacheMode } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct webController {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = 'testStop001'
  @State pageEnd: string = ""
  @State console: string = ""
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true
  @State domStorageAccess: boolean = false
  @State imageAccess: boolean = true
  @State geolocationAccess: boolean = true
  @State onlineImageAccess: boolean = true
  @State databaseAccess: boolean = true
  @State initialScale: number = 100
  @State cacheMode: CacheMode = CacheMode.DEFAULT
  @State webVisibility: Visibility = Visibility.Visible
  @State registerJavaScriptProxyFlag: boolean = false

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
        Button('WebController click').id('WebControllerButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testStop001': {
              try {
                let stopCalled = false
                setTimeout(() => {
                this.controller.loadUrl( 'http://appgallery.huawei.com/' )
                }, 3000)
                this.controller.stop()
                if (this.pageEnd !== 'http://appgallery.huawei.com/') {
                  stopCalled = true
                }
                Utils.emitEvent(stopCalled, 31007)
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31007)
              }
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/webPart1index.html', controller: this.controller })
        .visibility(this.webVisibility)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .geolocationAccess(this.geolocationAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .cacheMode(this.cacheMode)
        .initialScale(this.initialScale)
    }
  }
}
