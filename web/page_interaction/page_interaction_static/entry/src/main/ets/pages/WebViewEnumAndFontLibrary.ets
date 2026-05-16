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

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent,TextMenuItem,TextRange,TextMenuItemId,EditMenuOptions} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
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
  controller2: webView.WebviewController = new webView.WebviewController(undefined);
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
  @State onContextMenuHideState: Boolean = false
  @State OnContextMenuShowUndefined: boolean = false
  @State OnContextMenuHideUndefined: boolean = false
  @State EditMenuOptions: boolean = false
  @State EditMenuOptionsUndefined: boolean = false
  @State result: WebContextMenuResult | null = null
  @State SourceTypeArr:ContextMenuSourceType[] = [ContextMenuSourceType.NONE,ContextMenuSourceType.MOUSE,ContextMenuSourceType.LONG_PRESS]
  @State MediaTypeArr:ContextMenuMediaType[] = [ContextMenuMediaType.NONE,ContextMenuMediaType.IMAGE]
  @State FieldTypeArr:ContextMenuInputFieldType[] =
  [ContextMenuInputFieldType.NONE,ContextMenuInputFieldType.PLAIN_TEXT,ContextMenuInputFieldType.PASSWORD,ContextMenuInputFieldType.NUMBER_DATA,ContextMenuInputFieldType.TELEPHONE,ContextMenuInputFieldType.OTHER	]
  onCreateMenu(menuItems: Array<TextMenuItem>) {
    menuItems!.forEach((value, index) => {
      value.icon = "resource://rawfile/icon.png";
      if (value.id.equals(TextMenuItemId.COPY)) {
        value.content = '复制change'
      }
      if (value.id.equals(TextMenuItemId.SELECT_ALL)) {
        value.content = '全选change'
      }
      if (value.id.equals(TextMenuItemId.CUT)) {
        value.content = 'CUT'
      }
      if (value.id.equals(TextMenuItemId.PASTE)) {
        value.content = 'PASTE'
      }
      if (value.id.equals(TextMenuItemId.COLLABORATION_SERVICE)) {
        value.content = 'COLLABORATION_SERVICE'
      }
      if (value.id.equals(TextMenuItemId.CAMERA_INPUT)) {
        value.content = 'CAMERA_INPUT'
      }
    })
    let item1: TextMenuItem = {
      content: 'custom1',
      icon: "resource://rawfile/icon.png",
      id: TextMenuItemId.of('custom1'),
    }
    let item2: TextMenuItem = {
      content: 'custom2',
      id: TextMenuItemId.of('custom2'),
      icon: "resource://rawfile/icon.png",
    }
    menuItems.push(item1)
    menuItems.unshift(item2)
    return menuItems
  }
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

            case 'emitWebContextMenuResultPaste': {
              Utils.longClickComponent('webCenter')
              console.log("start Paste test");
              setTimeout(() => {
                this.result?.paste()
                Utils.emitEvent('paste', 12521);
              }, 2500)
              break;
            }

            case 'emitWebContextMenuResultRedo': {
              Utils.longClickComponent('webCenter')
              console.log("start redo test");
              setTimeout(() => {
                this.result?.redo()
                Utils.emitEvent('redo', 12522);
              }, 2500)
              break;
            }

            case 'emitWebContextMenuResultUndo': {
              Utils.longClickComponent('webCenter')
              console.log("start undo test");
              setTimeout(() => {
                this.result?.undo()
                Utils.emitEvent('undo', 12523);
              }, 2500)
              break;
            }

            case 'emitWebContextMenuResultPasteAndMatchStyle': {
              Utils.longClickComponent('webCenter')
              console.log("start pasteAndMatchStyle test");
              setTimeout(() => {
                this.result?.pasteAndMatchStyle()
                Utils.emitEvent('pasteAndMatchStyle', 12524);
              }, 2500)
              break;
            }

            case 'emitWebContextMenuResultRequestPasswordAutoFill': {
              Utils.longClickComponent('webCenter')
              console.log("start requestPasswordAutoFill test");
              setTimeout(() => {
                this.result?.requestPasswordAutoFill()
                Utils.emitEvent('requestPasswordAutoFill', 12525);
              }, 2500)
            }

            case 'emitOnContextMenuShowUndefined': {
              try {
                this.controller2.loadUrl('resource://rawfile/indexJru.html');
                Utils.clickComponent('webCenter2')
                setTimeout(() => {
                  Utils.emitEvent(this.OnContextMenuShowUndefined, 1257)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 1257)
              }
              break;
            }

            case 'emitOnContextMenuShow001': {
              try {
                this.controller.loadUrl('resource://rawfile/indexJru.html');
                Utils.clickComponent('webCenter')
                setTimeout(() => {
                  Utils.emitEvent(this.onContextMenuShowState, 1258)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 1258)
              }
              break;
            }

            case 'emitOnContextMenuHide001': {
              try {
                this.controller.loadUrl('resource://rawfile/indexJru.html');
                Utils.clickComponent('webCenter')
                setTimeout(() => {
                  Utils.emitEvent(this.onContextMenuHideState, 1259)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 1259)
              }
              break;
            }

            case 'emitOnContextMenuHideUndefined': {
              try {
                this.controller2.loadUrl('resource://rawfile/indexJru.html');
                Utils.clickComponent('webCenter2')
                setTimeout(() => {
                  Utils.emitEvent(this.OnContextMenuHideUndefined, 1260)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 1260)
              }
              break;
            }

            case 'emitEditMenuOptions001': {
              try {
                this.controller.loadUrl('resource://rawfile/indexJru.html');
                Utils.clickComponent('webCenter')
                setTimeout(() => {
                  Utils.emitEvent(this.EditMenuOptions, 1261)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 1261)
              }
              break;
            }

            case 'emitEditMenuOptionsUndefined': {
              try {
                this.controller2.loadUrl('resource://rawfile/indexJru.html');
                Utils.clickComponent('webCenter2')
                setTimeout(() => {
                  Utils.emitEvent(this.EditMenuOptionsUndefined, 1262)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 1262)
              }
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
        .editMenuOptions({
          onCreateMenu: this.onCreateMenu, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end)
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end)
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end)
              return false;
            }
            return false;
          }
        })
        .onControllerAttached(() => {
          this.EditMenuOptions = true;
        })
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

        .onContextMenuHide(() => {
            console.log("onContextMenuHide success");
          this.onContextMenuHideState = true;
        })

      Web({ src: 'resource://rawfile/indexJru.html', controller: this.controller2 })
        .onContextMenuShow(undefined)
        .onContextMenuHide(undefined)
        .editMenuOptions(undefined)
        .onControllerAttached(() => {
          this.OnContextMenuShowUndefined = true;
          this.OnContextMenuHideUndefined = true;
          this.EditMenuOptionsUndefined = true;
        })
    }
  }
}
