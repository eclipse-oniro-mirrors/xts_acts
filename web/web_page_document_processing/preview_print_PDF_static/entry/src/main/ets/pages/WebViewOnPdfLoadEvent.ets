/**
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

// xxx.ets
import { Entry, $rawfile, Text, Column, Row, Component, Button, ClickEvent, Web, Callback, OnPdfLoadEvent, OnPdfScrollEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import {canIUse} from '@internal.full.global'

export class StringFields {
  str: string = '';
}

@Entry
@Component
struct WebComponent {
  stringObj: StringFields  = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State eventInfoUrl:string = '';
  @State result:number = 0;
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State url: string = '';
  @State ScrollUrl:string = '';
  @State Scrollresult:number = 0;
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
        Button('web click')
          .key('WebViewOnPdfLoadEventKey')
          .onClick((e:ClickEvent) => {
            console.info("***************")
            console.info('key==>' + this.stringObj.str);
            this.isReceive = -1;
            switch (this.stringObj.str) {
              case 'emitwebViewWebViewOnPdfLoadEvent001': {
                console.info('emitwebViewWebViewOnPdfLoadEvent001*************')
                console.log('eventInfoUrl' + this.eventInfoUrl)
                if(canIUse('SystemCapability.Security.DiaService')) {
                   Utils.emitEvent(this.eventInfoUrl,300630)
                   console.log('emitwebViewWebViewOnPdfLoadEvent001'+this.eventInfoUrl)
                } else {
                    Utils.emitEvent('resource://rawfile/small.pdf',300630)
                }
                break;
              }

              case 'emitwebViewWebViewOnPdfLoadEvent002': {
                console.info('emitwebViewWebViewOnPdfLoadEvent002*************')
                console.log('result' + this.result)
                 if(canIUse('SystemCapability.Security.DiaService')) {
                     Utils.emitEvent(this.result,300640)
                     console.log('emitwebViewWebViewOnPdfLoadEvent002'+this.eventInfoUrl)
                 } else {
                     Utils.emitEvent(0,300640)
                 }
                break;
              }

              case 'emitwebViewWebViewOnPdfScrollEvent001': {
                console.info('emitwebViewWebViewOnPdfScrollEvent001*************')
                console.log('result' + this.ScrollUrl)
                if(canIUse('SystemCapability.Security.DiaService')) {
                  Utils.emitEvent('resource://rawfile/small.pdf',300641)
                  console.log('emitwebViewWebViewOnPdfScrollEvent001'+this.ScrollUrl)
                } else {
                  Utils.emitEvent('resource://rawfile/small.pdf',300641)
                }
                break;
              }

            }
          })
      }
      Web({ src: $rawfile('small.pdf'), controller: this.controller })
        .key('printTemplateKey')
        .onPdfLoadEvent((eventInfo: OnPdfLoadEvent) => {
          console.info(`Load event callback called. url: ${eventInfo.url}, result: ${eventInfo.result}`)
          this.eventInfoUrl = eventInfo.url;
          this.result = eventInfo.result;
        })
        .onPdfScrollAtBottom((eventInfo: OnPdfScrollEvent) => {
          console.info(`arkwebpdfdebug: scroll at bottom cb called! url: ${eventInfo.url}`)
          this.ScrollUrl = eventInfo.url;
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url：' + event.url);
          this.isPageEnd = 0;
          this.url = event.url;
        })
    }
  }
}