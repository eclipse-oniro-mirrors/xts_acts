/*
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
  Web
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import webView from '@ohos.web.webview';
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import image from '@ohos.multimedia.image'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  stringObj: StringFields = new StringFields();
  @State str: string = ''
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State pixelmap: image.PixelMap | undefined = undefined;
  @State consoleMsg: string = ''
  @State searchResultCount: number = -1
  @State consoleCorsError: boolean = false
  @State flag: boolean = false

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
    Column() {
      Row() {
        Button('WebInitTestButton').key('WebInitTestButton')
          .onClick((e: ClickEvent) => {
            switch (this.stringObj.str) {

              case 'emitGetFavicon': {
                try {
                  setTimeout(() => {
                    console.log('the result of pixelmap: test  start 0' );
                    this.pixelmap = this.controller.getFavicon();
                    console.log('the result of pixelmap: test  start 1 pixelmap: ' + this.pixelmap);
                    if ( this.pixelmap != undefined) {
                      Utils.emitEvent(true, 114)
                    }
                  }, 4000)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 114)
                }
                break;
              }

              case 'emitContextMenuEditStateFlags': {
                try {
                  Utils.emitEvent(ContextMenuEditStateFlags.NONE, 37);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitContextMenuEditStateFlags1': {

                try {
                  Utils.emitEvent(ContextMenuEditStateFlags.CAN_CUT, 38);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitContextMenuEditStateFlags2': {

                try {
                  Utils.emitEvent(ContextMenuEditStateFlags.CAN_COPY, 39);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitContextMenuEditStateFlags3': {
                try {
                  Utils.emitEvent(ContextMenuEditStateFlags.CAN_PASTE, 40);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitContextMenuEditStateFlags4': {
                try {
                  Utils.emitEvent(ContextMenuEditStateFlags.CAN_SELECT_ALL, 41);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

            }
          })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
        .onSearchResultReceive(ret => {
          console.log('on search result receive:' + '[cur]' + ret.activeMatchOrdinal +
            '[total]' + ret.numberOfMatches + '[isDone]' + ret.isDoneCounting);
          this.searchResultCount = ret.numberOfMatches
          let searchResult = ret.activeMatchOrdinal.toString() +
          ret.numberOfMatches.toString();
          console.log('searchResult' + searchResult);
          if(this.flag){
            this.controller.clearMatches();
            this.flag=false
          }
        })
    }
  }
}
