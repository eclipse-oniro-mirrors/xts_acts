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

import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
} from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import { BusinessError ,Callback, RecordData } from '@ohos.base'
import { Hypium } from '../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { WebNetErrorList } from '@ohos.web.netErrorList';
export class StringFields {
  public str: string = '';
}


@Entry
@Component
struct WebSchemeHandlerResponse {
  stringObj: StringFields  = new StringFields ();
  @State str: string = ""
  controller: webview.WebviewController = new webview.WebviewController(undefined)
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()

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
          Button("MediaPlaybackState").key('MediaPlaybackState').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
            switch ( this.stringObj.str) {
            case "GetMediaPlaybackState0100": {
              try {
                Utils.emitEvent(webview.MediaPlaybackState.NONE, 20260309111)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

              case "GetMediaPlaybackState0200": {
                try {
                  Utils.emitEvent(webview.MediaPlaybackState.PLAYING, 20260309222)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "GetMediaPlaybackState0300": {
                try {
                  Utils.emitEvent(webview.MediaPlaybackState.PAUSED, 20260309223)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
    }
  }
}