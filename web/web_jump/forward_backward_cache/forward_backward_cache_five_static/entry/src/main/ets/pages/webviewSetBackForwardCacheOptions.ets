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
import { Entry, Text,  Column, Component, Button,  ClickEvent,  Web, Row, Stack } from '@ohos.arkui.component'
import { State} from '@ohos.arkui.stateManagement'
import { Area, OnPageBeginEvent } from '@ohos.arkui.component'
import Utils from '../../src/test/Utils.test';
import hilog from '@ohos.hilog';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import common from '@ohos.app.ability.common';
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
interface PageBeginParam {
  url: string
}
@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State showNativeMediaPlayer: boolean = false;
  @State nodeWidth : number = 300;
  @State nodeHeight : number = 150;
  @State isShouldOverlay : boolean = true;
  @State isCallback : boolean = true;
  @State str : string = '';
  area?: Area
  @State emitKey: string = '';

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('webviewSetBackForwardCacheOptionsButton').onClick((): void => {
          console.info('key==>' + this.str)
          this.isShouldOverlay = true
          this.isCallback = false

          switch (this.str) {
            case 'emitWebviewSetBackForwardCacheOptions': {
              try {
                let options = new webview.BackForwardCacheOptions();
                options.size = 3;
                options.timeToLive = 10;
                this.controller.setBackForwardCacheOptions(options);
                Utils.emitEvent('success', 24087)
              } catch (error) {
                Utils.emitEvent('fail', 24087)
              }
              break;
            }
          }
        })
      }

      Stack() {
        Web({ src: 'https://www.baidu.com', controller: this.controller })
          .enableNativeMediaPlayer({ enable: true, shouldOverlay: this.isShouldOverlay })
          .onPageBegin((event: OnPageBeginEvent): void => {
            console.error('enter onPageBegin, url:' + event.url);
            console.error('exit onPageBegin');
          })
          .onPageEnd((): void => {
          })
          .width('100%')
          .height('100%')
          .onAreaChange((oldValue: Area, newValue: Area) => {
            oldValue;
            this.area = newValue;
          })
      }
    }
  }
}
