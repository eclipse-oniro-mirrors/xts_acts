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
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import {
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
  LargestContentfulPaint,
  Flex,
  Image,
  Builder,
  Text,
  FlexDirection,
  FlexAlign,
  ItemAlign,
  ForEach,
  Alignment,
  Divider,
  $r,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Callback } from '@ohos.base'


class StringFields {
  str: string = '';
}



@Entry
@Component
struct WebViewEnumAndFontLibrary {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State Permission: Boolean = false
  @State str: string = ''
  @State webResult: string = ''
  @State count: string = ''
  @State javaScriptAccess: boolean = true
  @State mixedSwitch: boolean = false
  @State mixedAllSwitch: boolean = false
  @State access: boolean = true
  @State menuX: Number = 0
  @State menuY: Number = 0
  @State LinkUrl: String = ''
  @State ImageContent: boolean = false
  @State MediaType: Number = 0
  @State SourceType: Number = 0
  @State InputFieldType: Number = 0
  @State isEditable: boolean = false
  @State EditStateFlags: Number = 0
  @State SourceUrl: String | null = null
  @State SelectionText: String = ''
  @State FileSelectorMode: Number = 0
  @State RenderExitReason: String = ''
  @State fontSize: number = 13
  @State minFontSize: int = 1
  @State webId: number = 0
  @State zoomCount: number = 100
  @State webResultText: string = ''
  @State outputStr: string = ''
  @State hasImageCbOnline: boolean = true;
  @State onContextMenuShowState: Boolean = false
  @State minLogicalFontSize: int = 13
  @State databaseAccess: boolean = true
  @State PermissionRequestState: boolean = false
  @State userAgentPC:string = '';

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
          .key('buttonEnumAndFontLibrary')
          .onClick((e: ClickEvent) => {
            console.info("key==>" +this.stringObj.str)
            switch (this.stringObj.str) {

            case 'emitFileSelectorModeFileOpenMode': {
                Utils.emitEvent(0, 861)
              break;
            }

          }
        })
      }


      Row() {
        Text(this.webResultText).fontSize(20)
      }

      Web({src: 'resource://rawfile/indexJru.html', controller: this.controller })
        .overviewModeAccess(true)
        .key('webCenter')
        .minFontSize(this.minFontSize)
        .minLogicalFontSize(this.minLogicalFontSize)
        .forceDarkAccess(this.access)
        .fileAccess(true)
    }
  }
}
