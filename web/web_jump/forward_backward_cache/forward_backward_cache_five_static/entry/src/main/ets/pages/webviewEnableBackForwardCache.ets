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

import { Entry, Text,Column, Component, Button, ClickEvent, Web, Row, Stack } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Area, OnPageBeginEvent } from '@ohos.arkui.component'
import Utils from '../../src/test/Utils.test';
import hilog from '@ohos.hilog';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData, BusinessError } from '@ohos.base'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { GlobalContext } from '../../src/test/GlobalContext';
import webview from '@ohos.web.webview';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State isShouldOverlay : boolean = true;
  @State isCallback : boolean = true;
  @State str : string = '';
  area?: Area

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
        Button('web click').key('webviewEnableBackForwardCacheButton') .onClick( (e:ClickEvent) => {
          console.info('key==>' +  this.str)
          this.isShouldOverlay = true
          this.isCallback = false
          switch (this.str) {
            case 'emitWebviewEnableBackForwardCache': {
              try {

                let isEnableBackForwardCache = GlobalContext.getContext().getObject('enableBackForwardCache')
                console.log('GlobalContext enableBackForwardCache===>' +isEnableBackForwardCache)
                if (isEnableBackForwardCache===true) {
                  Utils.emitEvent('success', 24084)
                }
              } catch (error) {
                Utils.emitEvent('fail', 24084)
              }
              break;
            }
            case 'emitWebviewBFCacheNativeEmbed': {
              try {
                let isNativeEmbed = GlobalContext.getContext().getObject('nativeEmbed')
                console.log('GlobalContext nativeEmbed===>'+isNativeEmbed)
                if (isNativeEmbed===true) {
                  Utils.emitEvent('success', 24085)
                }
              } catch (error) {
                Utils.emitEvent('fail', 24085)
              }
              break;
            }
            case 'emitWebviewBFCacheMediaTakeOver': {
              try {
                let isMediaTakeOver = GlobalContext.getContext().getObject('mediaTakeOver')
                console.log('GlobalContext mediaTakeOver===>'+isMediaTakeOver)
                if (isMediaTakeOver===true) {
                  Utils.emitEvent('success', 24086)
                }
              } catch (error) {
                Utils.emitEvent('fail', 24086)
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webviewSetBackForwardCacheOptions' })
              console.log('push URL success')
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
