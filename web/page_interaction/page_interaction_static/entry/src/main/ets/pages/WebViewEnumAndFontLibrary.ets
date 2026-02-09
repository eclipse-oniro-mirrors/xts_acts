'use static'

/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'

import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Web, Row, ContextMenuMediaType, ContextMenuInputFieldType, ContextMenuSourceType, OnContextMenuShowEvent, WebContextMenuResult } from '@ohos.arkui.component'
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import image from '@ohos.multimedia.image';
import { Driver, ON } from '@ohos.UiTest';

@Entry
@Component
struct WebViewEnumAndFontLibrary {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State menuX: Number = 0
  @State menuY: Number = 0
  @State LinkUrl: String = ''
  @State ImageContent: boolean = false
  @State MediaType: ContextMenuMediaType = ContextMenuMediaType.NONE
  @State SourceType: ContextMenuSourceType = ContextMenuSourceType.NONE
  @State InputFieldType: ContextMenuInputFieldType = ContextMenuInputFieldType.NONE
  @State isEditable: boolean = false
  @State EditStateFlags: Number = 0
  @State SourceUrl: String | null = null
  @State SelectionText: String = ''
  @State onContextMenuShowState: Boolean = false
  @State result: WebContextMenuResult | null = null
  @State SourceTypeArr:ContextMenuSourceType[] = [ContextMenuSourceType.NONE,ContextMenuSourceType.MOUSE,ContextMenuSourceType.LONG_PRESS]
  @State MediaTypeArr:ContextMenuMediaType[] = [ContextMenuMediaType.NONE,ContextMenuMediaType.IMAGE]
  @State FieldTypeArr:ContextMenuInputFieldType[] =
  [ContextMenuInputFieldType.NONE,ContextMenuInputFieldType.PLAIN_TEXT,ContextMenuInputFieldType.PASSWORD,ContextMenuInputFieldType.NUMBER_DATA,ContextMenuInputFieldType.TELEPHONE,ContextMenuInputFieldType.OTHER	]

  private valueChangeCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
      }
    }
    console.log('valueChangeCallBack str: ' + this.str)
  }
  aboutToAppear() {
    console.log('aboutToAppear')
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('buttonEnumAndFontLibrary').onClick((event: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'buttonEnumAndFontLibrary click key==>' + this.str);
          console.info('key==>' + this.str)
          switch (this.str) {

            case 'emitWebContextMenuParamGetInputFieldType': {
              Utils.longClickComponent('webCenter')
              setTimeout(() => {
                Utils.emitEvent(this.FieldTypeArr[this.InputFieldType], 810)
              }, 2500)
              break;
            }
            case 'emitWebContextMenuParamGetSourceType': {
              if (this.controller.getUserAgent().includes('PC')) {
                Utils.emitEvent(this.SourceTypeArr[ContextMenuSourceType.LONG_PRESS], 809)
                break;
              }
              Utils.longClickComponent('webCenter')
              setTimeout(() => {
                Utils.emitEvent(this.SourceTypeArr[this.SourceType], 809)
              }, 2500)
              break;
            }
            case 'emitWebContextMenuParamGetMediaType': {
              Utils.longClickComponent('webCenter')
              setTimeout(() => {
                Utils.emitEvent(this.MediaTypeArr[this.MediaType], 807)
              }, 2500)
              break;
            }
            case 'emitWebContextMenuParamGetUnfilteredLinkUrl': {
              Utils.longClickComponent('webCenter')
              setTimeout(() => {
                Utils.emitEvent(String(this.LinkUrl), 804)
              }, 2500)
              break;
            }
            case 'emitWebContextMenuParamGetLinkUrl': {
              Utils.longClickComponent('webCenter')
              setTimeout(() => {
                Utils.emitEvent(String(this.LinkUrl), 803)
              }, 2500)
              break;
            }
            case 'emitWebContextMenuResultCopy': {
              Utils.longClickComponent('webCenter')
              // await Utils.sleep(2000)
              setTimeout(() => {
                this.result?.copy()
                Utils.emitEvent('copy', 1252);
              }, 2500)
              break;
            }
            case 'emitWebContextMenuResultCut': {
              Utils.longClickComponent('webCenter')
              // await Utils.sleep(2000)
              setTimeout(() => {
                this.result?.cut()
                Utils.emitEvent('cut', 1253);
              }, 2500)
              break;
            }
            case 'emitWebContextMenuResultCopyImage': {
              Utils.longClickComponent('webCenter')
              // await Utils.sleep(2000)
              setTimeout(() => {
                this.result?.copyImage()
                Utils.emitEvent('copyImage', 1254);
              }, 2500)
              break;
            }
            case 'emitWebContextMenuResultSelectAll': {
              Utils.longClickComponent('webCenter')
              // await Utils.sleep(2000)
              setTimeout(() => {
                this.result?.selectAll()
                Utils.emitEvent('selectAll', 1255);
              }, 2500)
              break;
            }
            case 'emitWebContextMenuResultCloseContextMenu': {
              Utils.longClickComponent('webCenter')
              // await Utils.sleep(2000)
              setTimeout(() => {
                this.result?.closeContextMenu()
                Utils.emitEvent('closeContextMenu', 1256);
              }, 2500)
              break;
            }

            case 'back': {
              try {
                this.getUIContext().getRouter().back()
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/indexJru.html', controller: this.controller }).key('webCenter')
        .onContextMenuShow((event: OnContextMenuShowEvent): boolean => {
          if (event) {
            console.info('onContextMenuShow x = ' + event.param.x())
            console.info('onContextMenuShow y = ' + event.param.y())
            console.info('onContextMenuShow getLinkUrl = ' + event.param.getLinkUrl())
            console.info('onContextMenuShow getUnfilteredLinkUrl = ' + event.param.getUnfilteredLinkUrl())
            console.info('onContextMenuShow getSourceUrl = ' + event.param.getSourceUrl())
            console.info('onContextMenuShow existsImageContents = ' + event.param.existsImageContents())
            console.info('onContextMenuShow getMediaType = ' + event.param.getMediaType())
            console.info('onContextMenuShow getSelectionText = ' + event.param.getSelectionText())
            console.info('onContextMenuShow getSourceType = ' + event.param.getSourceType())
            console.info('onContextMenuShow getInputFieldType = ' + event.param.getInputFieldType())
            console.info('onContextMenuShow isEditable = ' + event.param.isEditable())
            console.info('onContextMenuShow getEditStateFlags = ' + event.param.getEditStateFlags())
            this.result = event.result
            this.onContextMenuShowState = true
            this.menuX = event.param.x()
            this.menuY = event.param.y()
            this.LinkUrl = event.param.getLinkUrl()
            this.ImageContent = event.param.existsImageContents()
            this.MediaType = event.param.getMediaType()
            this.SourceType = event.param.getSourceType()
            this.InputFieldType = event.param.getInputFieldType()
            this.isEditable = event.param.isEditable()
            this.EditStateFlags = event.param.getEditStateFlags()
            this.SourceUrl = event.param.getSourceUrl()
            this.SelectionText = event.param.getSelectionText()
          }
          return true
        })
    }
  }
}
