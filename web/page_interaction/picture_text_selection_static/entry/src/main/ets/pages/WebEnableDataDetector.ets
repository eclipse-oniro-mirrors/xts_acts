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
// Index.ets
import {
  ContextMenuMediaType,
  ContextMenuInputFieldType,
  ContextMenuEditStateFlags,
  OnRenderExitedEvent,
  OnPageBeginEvent,
  RenderProcessNotRespondingReason,
  RenderProcessNotRespondingData,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  $rawfile,
  TextDataDetectorType,
  TextDecorationType,
  TextDecorationStyle,
  Color
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import webView from '@ohos.web.webview';
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import image from '@ohos.multimedia.image'
import { canIUse } from '@internal.full.global'

const EVENT_ID_SET_SUITE_KEY = 176101;
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebOnFirstContentfulPaint1 {
  stringObj: StringFields = new StringFields();
  webController: webView.WebviewController = new webView.WebviewController(undefined);
  @State message: string = 'Hello World'
  @State isReceive: number = -1;
  @State str:string = ''
  @State isPageEnd: number = -1;

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
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("web click")
          .key("WebEnableDataDetectorButton")
          .onClick((e:ClickEvent) => {
            console.info("key==>" + this.stringObj.str)
            switch (this.stringObj.str) {
              case "emitWebEnableDataDetector": {
                try {
                  if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    Utils.emitEvent(true, 176110)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

            }
          })


        Web({ src: $rawfile("WebEnableDataDetector.html"), controller: this.webController })
          .enableSelectedDataDetector(true)
          .enableDataDetector(true)
          .dataDetectorConfig({
            types: [
              TextDataDetectorType.PHONE_NUMBER,
              TextDataDetectorType.EMAIL
            ],
            color: Color.Red,
            decoration: {
              type: TextDecorationType.LineThrough,
              color: Color.Green,
              style: TextDecorationStyle.WAVY
            }
          })
          .offset({x: 0, y: 0})
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 1;
          })
      }
      .width('100%')
    }

  }
}
