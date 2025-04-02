/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import media from '@ohos.multimedia.media';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import { BuilderNode, FrameNode, NodeController, NodeRenderType } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';
import Utils from '../../test/Utils';
import { GlobalContext } from '../../test/GlobalContext';
import JSON from '@ohos.util.json';


interface PageBeginParam {
  url: string
}

@Entry
@Component
struct WebComponent {
  controller: WebviewController = new webview.WebviewController();
  @State showNativeMediaPlayer: boolean = false;
  @State nodeWidth : number = 300;
  @State nodeHeight : number = 150;
  @State isShouldOverlay : boolean = true;
  @State isCallback : boolean = true;


  area?: Area
  @State emitKey: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('webviewEnableBackForwardCacheButton').onClick(async () => {
          console.info('key==>' + this.emitKey)
          this.isShouldOverlay = true
          this.isCallback = false
          await Utils.sleep(2000)
          switch (this.emitKey) {
            case 'emitWebviewEnableBackForwardCache': {
              try {
                let isEnableBackForwardCache = GlobalContext.getContext().getObject('enableBackForwardCache')
                isEnableBackForwardCache = isEnableBackForwardCache || globalThis.enableBackForwardCache
                console.log('GlobalContext enableBackForwardCache===>'+isEnableBackForwardCache)
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
                isNativeEmbed = isNativeEmbed || globalThis.nativeEmbed
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
                isMediaTakeOver = isMediaTakeOver || globalThis.mediaTakeOver
                console.log('GlobalContext mediaTakeOver===>'+isMediaTakeOver)
                if (isMediaTakeOver===true) {
                  Utils.emitEvent('success', 24086)
                }
              } catch (error) {
                Utils.emitEvent('fail', 24086)
              }
              break;
            }
          }
        })
      }
      Stack() {
        Web({ src: 'https://www.baidu.com', controller: this.controller })
          .enableNativeMediaPlayer({ enable: true, shouldOverlay: this.isShouldOverlay })
          .onPageBegin(async (event: PageBeginParam) => {
            console.error('enter onPageBegin, url:' + event.url);

            console.error('exit onPageBegin');
          })
          .onPageEnd(async () => {
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


