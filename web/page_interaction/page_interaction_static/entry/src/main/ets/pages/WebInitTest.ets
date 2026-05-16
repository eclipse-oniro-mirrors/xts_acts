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

import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins // should be insert by ui-plugins
import { Button, ClickEvent, Column, Component, ContextMenuInputFieldType, ContextMenuMediaType, ContextMenuSourceType, Entry, Row, Text, TextInput, TextAttribute, Web, OnConfirmEvent, OnPromptEvent } from '@ohos.arkui.component' // TextAttribute should be insert by ui-plugins
import hilog from '@ohos.hilog'

import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import image from '@ohos.multimedia.image';
import { sendEventByKey } from '@kit.ArkUI';

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State pixelmap: image.PixelMap | undefined = undefined;
  @State consoleMsg: string = ''
  @State searchResultCount: number = -1
  @State consoleCorsError: boolean = false
  @State flag: boolean = false
  @State handleCancel: boolean = false;
  @State confirm: string = ''
  @State prompt: string = ''

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
        Button('WebInitTestButton').key('WebInitTestButton').onClick((event: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'WebInitTestButton click key==>' + this.str);
          switch (this.str) {

            case 'emitContextMenuMediaType': {
              try {
                // await Utils.sleep(1000)
                Utils.emitEvent(ContextMenuMediaType.NONE, 333);
                Utils.emitEvent(ContextMenuMediaType.IMAGE, 33);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitContextMenuInputFieldType': {
              try {
                Utils.emitEvent(ContextMenuInputFieldType.NONE, 344);
                Utils.emitEvent(ContextMenuInputFieldType.PLAIN_TEXT, 34);
                Utils.emitEvent(ContextMenuInputFieldType.PASSWORD, 355);
                Utils.emitEvent(ContextMenuInputFieldType.TELEPHONE, 35);
                Utils.emitEvent(ContextMenuInputFieldType.NUMBER_DATA, 366);
                Utils.emitEvent(ContextMenuInputFieldType.OTHER, 36);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'ContextMenuSourceType': {
              try {
                Utils.emitEvent(ContextMenuSourceType.NONE, 37);
                Utils.emitEvent(ContextMenuSourceType.MOUSE, 38);
                Utils.emitEvent(ContextMenuSourceType.LONG_PRESS, 39);
                console.log('result: ' + ContextMenuSourceType.LONG_PRESS);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitGetRequestFocus': {
              // await Utils.sleep(2000);
              Utils.clickComponent('textInput')
              break;
            }
            case 'testScrollableEleven': {
              this.controller.setScrollable(false);
              // await Utils.sleep(2000);
              try {
                let scrollEnabled = this.controller.getScrollable();
                console.log('scrollEnabled: ' + scrollEnabled);
                setTimeout(() => {
                  Utils.emitEvent(scrollEnabled, 234234)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitJsResultHandleCancel001': {
              try {
                this.handleCancel = true
                this.controller.loadUrl('resource://rawfile/confirm.html');
                // await Utils.sleep(2000)
                setTimeout(() => {
                  this.controller.runJavaScript(
                    'confirmTest()',
                    (error: BusinessError | null, result: String | undefined) => {
                      if (error) {
                        console.info('confirmTest() return error: ' + error)
                      }
                      if (result) {
                        console.info('confirmTest() return result: ' + result)
                        setTimeout(() => {
                          Utils.emitEvent(result, 70021)
                        }, 2000)
                      }
                    })
                }, 500)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitJsResultHandleConfirm001': {
              try {
                this.handleCancel = false
                this.controller.loadUrl('resource://rawfile/confirm.html');
                // await Utils.sleep(2000)
                setTimeout(() => {
                  this.controller.runJavaScript(
                    'confirmTest()',
                    (error: BusinessError | null, result: String | undefined) => {
                      if (error) {
                        console.info('confirmTest() return error: ' + error)
                      }
                      if (result) {
                        console.info('confirmTest() return result: ' + result)
                        setTimeout(() => {
                          Utils.emitEvent(result, 70023)
                        }, 2000)
                      }
                    })
                }, 500)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitJsResultHandlePromptConfirm001': {
              try {
                this.controller.loadUrl('resource://rawfile/prompt.html');
                // await Utils.sleep(2000)
                setTimeout(() => {
                  this.controller.runJavaScript(
                    'promptTest()',
                    (error: BusinessError | null, result: String | undefined) => {
                      if (error) {
                        console.info('promptTest() return error: ' + error)
                      }
                      if (result) {
                        console.info('promptTest() return result: ' + result)
                        setTimeout(() => {
                          Utils.emitEvent(result, 70025)
                        }, 2000)
                      }
                    })
                }, 500)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
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

      TextInput({ placeholder: 'inputs your words' })
        .key('textInput')
        .height(60)
        .fontSize(30)
        .fontFamily('cursive')
        .maxLength(20)
        .onClick((event: ClickEvent) => {
          console.info('TextInput click')
        })

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .onFocus(() => {
          Utils.emitEvent('requestFocus', 126);
        })
        .onBlur(() => {
          console.info('onBlur==>');
          this.controller.requestFocus();
        })
        .onConfirm((event: OnConfirmEvent): boolean => {
          if (event) {
            console.log('event.url:' + event.url)
            console.log('event.message:' + event.message)
            this.confirm = event.message;
            if (this.handleCancel) {
              event.result.handleCancel()
            } else {
              event.result.handleConfirm()
            }
          }
          return true
        })
        .onPrompt((event: OnPromptEvent): boolean => {
          if (event) {
            console.log('event.url:' + event.url)
            console.log('event.message:' + event.message)
            console.log('event.value:' + event.value)
            this.prompt = event.message;
            event.result.handlePromptConfirm('handlePromptConfirm')
          }
          return true
        })
    }
  }
}
