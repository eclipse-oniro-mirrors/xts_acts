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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, } from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import { BusinessError } from '@ohos.base'
import image from '@ohos.multimedia.image';
import { BusinessError, Callback, RecordData } from '@ohos.base'
import appManager from '@ohos.app.ability.appManager';
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Hypium } from '../../../hypium/index';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  stringObj: StringFields = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ""
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true
  @State domStorageAccess: boolean = false
  @State imageAccess: boolean = true
  @State geolocationAccess: boolean = true
  @State onlineImageAccess: boolean = true
  @State databaseAccess: boolean = true
  @State removeRom: boolean = true
  @State cachePath: string = Utils.getSandboxCacheDir() + 'web/Cache/Cache_Data/'
  @State buttonStart: boolean = false;

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
        Button("WebViewControllerRemoveCacheTestButton")
          .key('WebViewControllerRemoveCacheTestButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.stringObj.str)
            switch (this.stringObj.str) {
              case "testRemoveCache002": {
                try {
                  this.buttonStart = true;
                  console.log('buttonStart==>' + this.buttonStart);
                  this.removeRom = false
                  this.controller.loadUrl('https://openharmony.cn/')
                } catch (error) {
                  console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                }
                break;
              }
            }
          })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .geolocationAccess(this.geolocationAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onPageEnd((event) => {
          if (event) {
            if (this.buttonStart) {
              console.log('onPageEnd buttonStart==>' + this.buttonStart);
              setTimeout(async () => {
                let filesBeforeRemove = Utils.listFile(this.cachePath)
                let memorySizeBeforeRemove = await appManager.getAppMemorySize()
                console.info('memorySizeBeforeRemove:' + memorySizeBeforeRemove)
                this.controller.removeCache(this.removeRom)
                let filesAfterRemove = Utils.listFile(this.cachePath)
                let memorySizeAfterRemove = await appManager.getAppMemorySize()
                console.info('memorySizeAfterRemove:' + memorySizeAfterRemove)
                Utils.emitEvent(filesAfterRemove.length == filesBeforeRemove.length, 77202)
              }, 100)
            }
          }
        })
    }
  }
}
