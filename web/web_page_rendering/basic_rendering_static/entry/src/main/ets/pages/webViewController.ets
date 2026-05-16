/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { OverScrollMode, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerThree: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = 'emitGetWebId';
  @State webId: number = 0;
  @State webId2: number = 0;
  @State webId3: number = 0;
  @State webIdTol: number = 0;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;

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
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click1').key('webcomponent').onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitGetWebId': {
              try {
                this.webId = this.controller.getWebId();
                this.webId2 = this.controllerTwo.getWebId();
                this.webId3 = this.controllerThree.getWebId();
                console.log('id1:%d, id2:%d, id3:%d', this.webId, this.webId2, this.webId3);
                this.webIdTol = this.webId + this.webId2 + this.webId3;
              } catch (error: Error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              Utils.emitEvent(this.webIdTol, 100)
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/terminateRenderProcess' })
              console.log('push URL success')
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/indexCopy.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .overScrollMode(OverScrollMode.NEVER)
      Web({ src: 'resource://rawfile/indexTwo.html', controller: this.controllerTwo })
        .id('2')
        .key('web2')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
      Web({ src: 'resource://indexThree.html', controller: this.controllerThree })
        .id('3')
        .key('web3')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
    }
  }
}