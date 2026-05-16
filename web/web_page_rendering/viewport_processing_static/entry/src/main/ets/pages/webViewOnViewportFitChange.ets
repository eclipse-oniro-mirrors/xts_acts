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
import {  Entry, Component, Column, Row, Button,ClickEvent, Web ,ViewportFit} from '@ohos.arkui.component'
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError, RecordData } from '@ohos.base'
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { WebLayoutMode } from '@ohos.arkui.component'

@Entry
@Component
struct onCreateNativeMediaPlayer {

  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = '';
  @State stateRst: string = 'undefined';
  @State isCreateSuccess: string = 'fail';
  mode: WebLayoutMode = WebLayoutMode.FIT_CONTENT;

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
          .key('webViewOnViewportFitChange')
          .onClick((e: ClickEvent) => {
            hilog.info(0X0000,'testTag','result' + this.str)
            this.stateRst = this.isCreateSuccess;
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'emitWebViewOnViewportFitChange': {
                hilog.info(0X0000,'testTag','result' +this.str)
                break;
              }
            }
          })
      }
      Web({ src: 'resource://rawfile/onViewportFitChanged.html', controller: this.controller })
        .overviewModeAccess(true)
        .onViewportFitChanged((data: ViewportFit):void =>{
          setTimeout(() => {
          console.info('success in onViewportFitChanged viewportFit:  ' + data + ViewportFit.COVER)
          try{
            if (data === ViewportFit.COVER) {
              Utils.emitEvent(true, 1340)
            }
          } catch(error){
            hilog.info(0X0000,'testTag','error:' + error)
          }
          }, 2000)
        })
    }
  }
}
