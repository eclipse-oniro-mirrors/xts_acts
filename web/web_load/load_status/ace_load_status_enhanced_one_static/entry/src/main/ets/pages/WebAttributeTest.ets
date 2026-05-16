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

import webView from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { BusinessError, RecordData } from '@ohos.base';
import { State } from "@ohos.arkui.stateManagement"
import { Callback } from '@ohos.base'
import { OnRefreshAccessedHistoryEvent,OnPageVisibleEvent,OnLoadStartedEvent,OnLoadFinishedEvent,OnPageBeginEvent,OnPageEndEvent,OnProgressChangeEvent,Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebAttributeTest{
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  stringObj: StringFields  = new StringFields ();
  @State initialScale: number = 100
  @State geolocationAccess: boolean = true
  @State progress: string = ""
  @State pageBegin: string = ""
  @State pageEnd: string = ""
  @State loadStarted: string = ""
  @State loadFinished: string = ""
  @State pageVisible: string = ""

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION vaclue: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build(){
    Row(){
      Column(){
        Button("web click")
          .key('WebAttributeTestButton')
          .focusable(true)
          .onFocus(() => {
            console.log("onFocus==>")
          })
          .onBlur(() => {
            console.log("onBlur==>")
          })
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.stringObj.str)
            switch (this.stringObj.str) {
              case "emitOnProgressChange001": {
                try {
                  this.controller.loadUrl('resource://rawfile/second.html')
                  Utils.emitEvent(this.progress, 700012)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnLoadStarted001": {
                try {
                  setTimeout(() => {
                    Utils.emitEvent(this.loadStarted, 20260318)
                  }, 3000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnLoadFinished001": {
                try {
                  setTimeout(() => {
                    Utils.emitEvent(this.loadFinished, 20260319)
                  }, 3000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnPageVisible003": {
                try {
                  setTimeout(() => {
                    Utils.emitEvent(this.pageVisible, 20260320)
                  }, 3000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
          .key('webView')
          .height('50%')
          .fileAccess(true)
          .width('100%')
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .initialScale(this.initialScale)
          .geolocationAccess(this.geolocationAccess)
          .databaseAccess(true)
          .onPageBegin((event: OnPageBeginEvent): void => {
            if (event) {
              this.pageBegin = event.url
              console.log("onPageBegin==> event.url:" + event.url)
            }
          })
          .onProgressChange((event:OnProgressChangeEvent):void => {
            if (event) {
              this.progress = event.newProgress + "";
              console.log('onProgressChange==> this.progress:' + this.progress)
            }
          })
          .onPageEnd((event:OnPageEndEvent):void => {
            if (event) {
              this.pageEnd = event.url
              console.log("onPageEnd==> event.url:" + event.url)
              console.log("onPageEnd==> this.pageEnd:" + this.pageEnd)
            }
          })
          .onLoadStarted((event:OnLoadStartedEvent):void => {
            if (event) {
              this.loadStarted = event.url
              console.log("onLoadStarted==> event.url:" + event.url)
              console.log("onLoadStarted==> this.loadStarted:" + this.loadStarted)
            }
          })
          .onLoadFinished((event:OnLoadFinishedEvent):void => {
            if (event) {
              this.loadFinished = event.url
              console.log("onLoadFinished==> event.url:" + event.url)
              console.log("onLoadFinished==> this.loadFinished:" + this.loadFinished)
            }
          })
          .onPageVisible((event: OnPageVisibleEvent): void => {
            this.pageVisible = event.url
            console.info('onPageVisible url:' + event.url);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
