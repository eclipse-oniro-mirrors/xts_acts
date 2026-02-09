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
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  OnLoadInterceptEvent,
  Row,
  Text,
  Web,
  WebKeyboardCallbackInfo,
  WebKeyboardOptions,
  RenderMode
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import web_webview from '@ohos.web.webview';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { FontWeight } from 'arkui.component.enums';
import { AppStorage } from 'arkui.stateManagement.storage.appStorage'
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = 'wholeWebPageDrawing0100';
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
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("wholeWebPageDrawing").key('wholeWebPageDrawingButton').onClick((e: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "wholeWebPageDrawing0100": {
              try {
                this.controller.webPageSnapshot({ id: "hello", size: { width: 100, height: 100 } }, (error:BusinessError | undefined | null, result)  => {
                  console.info('return id is:'+result?.id ?? '');
                  Utils.emitEvent(result?.id ?? '', 2793);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }


          }
        })
      }
      Web({ src: 'www.example.com', controller: this.controller, renderMode: RenderMode.SYNC_RENDER })
    }
  }
}
