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

import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview'
import emitter from '@ohos.events.emitter';
import { BusinessError, RecordData } from '@ohos.base';
import { State } from "@ohos.arkui.stateManagement";
import { Callback } from '@ohos.base';
import { CopyOptions,WebMediaOptions,Entry, Component, Column, Row, Button,Text,ClickEvent, Web } from "@ohos.arkui.component";

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webFantasyFont {
  stringObj: StringFields  = new StringFields ();
  @State minFontSize: number = 8
  @State defaultFontSize: number = 13
  @State minLogicalFontSize: number = 8
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State family: string = "fantasy";
  @State family2: string = "cursive";

  aboutToAppear(): void {
    console.info("Entry aboutToAppear");
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info(' Finish aboutToAppear ' + this.valueChangeCallBack);
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

  build() {
    Column() {
      Row() {
        Button('WebViewWebFantasyFontButton')
          .key('WebFantasyFontButton')
          .onClick( (e: ClickEvent) => {
            console.log('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitWebFantasyFont001': {
                    console.info('emitWebFantasyFont001 start');
                    Utils.emitEvent(0, 20253322);
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .webFantasyFont(this.family)
        .webCursiveFont(this.family2)
        .copyOptions(CopyOptions.None)
        .enableFollowSystemFontWeight(true)
    }
  }
}