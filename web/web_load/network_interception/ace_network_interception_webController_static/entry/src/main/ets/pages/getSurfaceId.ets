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
import {
  RenderMode,
  OnSearchResultReceiveEvent,
  Entry,
  Image,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  LoadCommittedDetails
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import webView from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import image from '@ohos.multimedia.image';

class StringFields {
  public str: string = 'emitSetUrlTrustList0100';
}
@Entry
@Component
struct WebOnDataResubmitted {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerOne: webView.WebviewController = new webView.WebviewController(undefined);
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State test: boolean = false
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isFrameResourceType: boolean = false
  @State checkResult: number = 0;
  urltrustList: string = '{"UrlPermissionList":[{"host":"www.example.com"}]}'
  urltrustListTwo: string = '{"UrlPermissionList":[{"scheme":"http", "host":"www.test.com", "port":80, "path":"test"}]}'
  urltrustListThree: string = '{"UrlPermissionList":[{"scheme":"https", "host":"www.163.com", "port":443, "path":"test"}]}'
  urltrustListFour: string = '{"UrlPermissionList":[{"scheme":"https", "host":"www.163.com", "port":443, "path":"test"},{"scheme":"http", "host":"www.163.com", "port":80, "path":"test"}]}'
  urltrustListFive: string = '{"UrlPermissionList":[{"scheme":"http", "port":80, "path":"test"}]}'
  urltrustListSix: string = '{"UrlPermissionList":[{"host":"www.baidu.com"},{"host":"www.163.com", "port":80, "path":"test"}]}'

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
        Button('getSurfaceId').key('getSurfaceIdButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitSetUrlTrustList0100': {
              try {
                this.controller.setUrlTrustList(this.urltrustList);
                this.controller.loadUrl('www.example.com');
                setTimeout(() => {
                 if( this.test = true ) {
                   this.test = false;
                 }
                  this.controller.loadUrl('www.baidu.com');
                }, 4000)
                setTimeout(() => {
                Utils.emitEvent(this.test, 28931)
                }, 7000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }

          }
        })
      }

      Web({src: 'resource://rawfile/index.html', controller: this.controller, renderMode: RenderMode.ASYNC_RENDER})
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onNavigationEntryCommitted((event:LoadCommittedDetails) => {
          console.log('onNavigationEntryCommitted: [isMainFrame]= ' + event.isMainFrame +
            ', [isSameDocument]=' + event.isSameDocument +
            ', [didReplaceEntry]=' + event.didReplaceEntry +
            ', [navigationType]=' + event.navigationType +
            ', [url]=' + event.url);
        })
    }
  }
}
