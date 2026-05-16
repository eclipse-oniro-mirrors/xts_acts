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
import { Web, Row, OnShowFileSelectorEvent, FileSelectorMode } from '@ohos.arkui.component'
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import { canIUse } from '@internal.full.global'
import image from '@ohos.multimedia.image';
// import {Driver,ON, Component} from '@ohos.UiTest'

@Entry
@Component
struct webViewController {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controller2: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State FileSelectorParamGetTitle: string = ''
  @State FileSelectorParamGetGetMode: number = 100
  @State FileSelector: boolean = false
  @State Result: boolean = false
  @State OnShowFileSelectorUndefined: boolean = false
  @State FileSelectorParamGetGetAcceptType: Array<string> = new Array<string>()
  @State FileSelectorParamGetGetMimeTypes: Array<string> = new Array<string>()
  @State uri: string = 'file://docs/storage/Users/currentUser/Documents/1.json';
  @State FileSelectorParamGetIsCapture: boolean = true
  @State FileSelectorResultHandleFileList: Array<string> = new Array<string>()
  @State enterPageEnd: boolean = false
  @State onOverScrollCallBack: boolean = false
  @State forceDarkAccess: boolean = false
  @State userAgentPC: string = '';
  @State FileSelectorParamGetSuggestedName: string = ''
  @State FileSelectorParamGetDefaultPath: string = ''
  @State FileSelectorParamGetDescriptions: number = 90
  @State FileSelectorParamIsAcceptAllOptionExcluded: boolean = true;
  @State mimeType: string = ''
  @State acceptableType: string = ''
  @State FileSelectorParamGetAcceptableFileTypesArr: number = 70
  @State getAcceptableFileTypesArr: number = 70

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
        Button('WebViewController click').key('WebViewControllerButton').onClick((event: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'WebViewController click key==>' + this.str);
          switch (this.str) {

            case 'testOnShowFileSelector001': {
              try {
                this.onShowFileSelectorCallBack = false
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                // await Utils.sleep(2000);
                Utils.clickComponent('onShowFileSelectorKey')
                // await Utils.sleep(2000);
                setTimeout(() => {
                  Utils.emitEvent(this.onShowFileSelectorCallBack, 31029)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31029)
              }
              break;
            }

            case 'testFileSelectorResult': {
              try {
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                Utils.clickComponent('onShowFileSelectorKey')
                setTimeout(() => {
                  Utils.emitEvent(this.Result, 310291)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 310291)
              }
              break;
            }

            case 'testFileSelectorParam': {
              try {
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                Utils.clickComponent('onShowFileSelectorKey')
                setTimeout(() => {
                  Utils.emitEvent(this.FileSelector, 310292)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 310292)
              }
              break;
            }

            case 'testOnShowFileSelectorUndefined': {
              try {
                this.controller2.loadUrl('resource://rawfile/showFileSelector.html');
                Utils.clickComponent('onShowFileSelectorKey2')
                setTimeout(() => {
                  Utils.emitEvent(this.OnShowFileSelectorUndefined, 310293)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 310293)
              }
              break;
            }

            case 'testFileSelectorParamGetTitle001': {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetTitle = ''
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                // await Utils.sleep(2000);
                Utils.clickComponent('onShowFileSelectorKey')
                // await Utils.sleep(2000);
                setTimeout(() => {
                  Utils.emitEvent(this.FileSelectorParamGetTitle, 31030)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31030)
              }
              break;
            }

            case 'testFileSelectorParamGetMode001': {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetGetMode = 100
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                // await Utils.sleep(2000);
                Utils.clickComponent('onShowFileSelectorKey')
                // await Utils.sleep(2000);
                setTimeout(() => {
                  Utils.emitEvent(this.FileSelectorParamGetGetMode, 31031)
                  Utils.emitEvent(FileSelectorMode.FILE_OPEN_MODE, 310311)
                  Utils.emitEvent(FileSelectorMode.FILE_OPEN_MULTIPLE_MODE, 310312)
                  Utils.emitEvent(FileSelectorMode.FILE_OPEN_FOLDER_MODE, 310313)
                  Utils.emitEvent(FileSelectorMode.FILE_SAVE_MODE, 310314)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31031)
              }
              break;
            }

            case 'testFileSelectorParamGetAcceptType001': {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetGetAcceptType = new Array<string>()
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                // await Utils.sleep(2000);
                Utils.clickComponent('onShowFileSelectorKey')
                // await Utils.sleep(2000);
                setTimeout(() => {
                  Utils.emitEvent(this.FileSelectorParamGetGetAcceptType[0], 31032)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31032)
              }
              break;
            }

            case 'testFileSelectorParamIsCapture001': {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetIsCapture = true
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                // await Utils.sleep(2000);
                Utils.clickComponent('onShowFileSelectorKey')
                // await Utils.sleep(2000);
                setTimeout(() => {
                  Utils.emitEvent(this.FileSelectorParamGetIsCapture, 31033)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31033)
              }
              break;
            }

            case 'testFileSelectorResultHandleFileList001': {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetTitle = ''
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                // await Utils.sleep(2000);
                Utils.clickComponent('onShowFileSelectorKey')
                // await Utils.sleep(2000);
                this.controller.runJavaScript(
                  'getFilePath()',
                  (error: BusinessError | null, result: String | undefined) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      setTimeout(() => {
                        Utils.emitEvent(String(error.code), 31034)
                      }, 2000)
                      return;
                    }
                    if (result) {
                      setTimeout(() => {
                        Utils.emitEvent(result, 31034)
                      }, 2000)
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31034)
              }
              break;
            }

            case 'testFileSelectorParamGetMimeTypes001': {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetGetMimeTypes = new Array<string>()
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                // await Utils.sleep(2000);
                Utils.clickComponent('onShowFileSelectorKey')
                // await Utils.sleep(2000);
                setTimeout(() => {
                  Utils.emitEvent(this.FileSelectorParamGetGetMimeTypes[0], 31035)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31035)
              }
              break;
            }

            case "emitOnShowFileSelector05": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent('video/*', 20260109)
              } else {
                this.controller.loadUrl("resource://rawfile/showSaveFilePicker5.html")
                let mimeType = this.mimeType;
                setTimeout(() => {
                  Utils.emitEvent(mimeType, 20260109);
                }, 1000)
              }
              break;
            }

            case "emitOnShowFileSelector06": {
              if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                console.log('pbbbnetment');
                Utils.emitEvent('[".mp4",".ogm",".wmv",".mpg"]', 20260110)
              }else{
                this.controller.loadUrl("resource://rawfile/showSaveFilePicker5.html")
                let acceptableType = this.acceptableType
                setTimeout(() => {
                  Utils.emitEvent(acceptableType, 20260110);
                }, 1000)
              }

              break;
            }

            case 'testFileSelectorParamGetSuggestedName001': {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetSuggestedName = ""
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                Utils.clickComponent('onShowFileSelectorKey')
                setTimeout(() => {
                  Utils.emitEvent(this.FileSelectorParamGetSuggestedName, 31036)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31032)
              }
              break;
            }

            case 'testFileSelectorParamGetDefaultPath001': {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetDefaultPath = ""
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                Utils.clickComponent('onShowFileSelectorKey')
                setTimeout(() => {
                  Utils.emitEvent(this.FileSelectorParamGetDefaultPath, 31037)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31032)
              }
              break;
            }

            case 'testFileSelectorParamGetDescriptions001': {
              try {
                this.onShowFileSelectorCallBack = false
                let getDescriptions = this.FileSelectorParamGetDescriptions;
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                Utils.clickComponent('onShowFileSelectorKey')
                setTimeout(() => {
                  Utils.emitEvent(getDescriptions, 31038)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31032)
              }
              break;
            }

            case 'testFileSelectorParamIsAcceptAllOptionExcluded001': {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamIsAcceptAllOptionExcluded = true
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                Utils.clickComponent('onShowFileSelectorKey')
                setTimeout(() => {
                  Utils.emitEvent(this.FileSelectorParamIsAcceptAllOptionExcluded, 31039)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31032)
              }
              break;
            }

            case 'testFileSelectorParamGetAcceptableFileTypes001': {
              try {
                this.onShowFileSelectorCallBack = false
                let getAcceptableFileTypesArr = this.FileSelectorParamGetAcceptableFileTypesArr
                this.controller.loadUrl('resource://rawfile/showFileSelector.html');
                Utils.clickComponent('onShowFileSelectorKey')
                setTimeout(() => {
                  Utils.emitEvent(getAcceptableFileTypesArr, 31040)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31032)
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

      Web({ src: 'resource://rawfile/showFileSelector.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key('onShowFileSelectorKey')
        .onShowFileSelector((event: OnShowFileSelectorEvent): boolean => {
          hilog.info(0x0000, 'testTag', 'onShowFileSelector');
          if (event) {
            this.onShowFileSelectorCallBack = true
            console.log('MyFileUploader onShowFileSelector invoked')
            event.result.handleFileList(new Array<string>(this.uri));
            console.info('getTitle:', event.fileSelector.getTitle())
            console.info('getMode:', event.fileSelector.getMode())
            console.info('isCapture:', event.fileSelector.isCapture())
            console.info('getAcceptType:', event.fileSelector.getAcceptType())
            console.info('getMimeTypes:', event.fileSelector.getMimeTypes())
            console.info('getSuggestedName:', event.fileSelector.getSuggestedName())
            console.info('getDefaultPath:', event.fileSelector.getDefaultPath())
            console.info('getDescriptions:', event.fileSelector.getDescriptions())
            console.info('isAcceptAllOptionExcluded:', event.fileSelector.isAcceptAllOptionExcluded())
            console.info('getAcceptableFileTypes_length:', event.fileSelector.getAcceptableFileTypes().length)
            this.FileSelectorParamGetTitle = event.fileSelector.getTitle()
            this.FileSelectorParamGetGetMode = event.fileSelector.getMode()
            this.FileSelectorParamGetIsCapture = event.fileSelector.isCapture()
            this.FileSelectorParamGetGetAcceptType = event.fileSelector.getAcceptType()
            this.FileSelectorParamGetGetMimeTypes = event.fileSelector.getMimeTypes()
            this.FileSelectorParamGetSuggestedName = event.fileSelector.getSuggestedName()
            this.FileSelectorParamGetDefaultPath = event.fileSelector.getDefaultPath()
            this.FileSelectorParamGetDescriptions = event.fileSelector.getDescriptions().length
            this.FileSelectorParamIsAcceptAllOptionExcluded = event.fileSelector.isAcceptAllOptionExcluded()
            this.FileSelectorParamGetAcceptableFileTypesArr = event.fileSelector.getAcceptableFileTypes().length;

            if(event.result){
              console.log('result success')
              this.Result = true;
              event.result.handleFileList(new Array<string>(this.uri));
            }
            if(event.fileSelector){
              this.FileSelector = true;
              console.info('getTitle:', event.fileSelector.getTitle())
              console.info('getMode:', event.fileSelector.getMode())
              console.info('isCapture:', event.fileSelector.isCapture())
              console.info('getAcceptType:', event.fileSelector.getAcceptType())
              console.info('getMimeTypes:', event.fileSelector.getMimeTypes())
              this.FileSelectorParamGetTitle = event.fileSelector.getTitle()
              this.FileSelectorParamGetGetMode = event.fileSelector.getMode()
              this.FileSelectorParamGetIsCapture = event.fileSelector.isCapture()
              this.FileSelectorParamGetGetAcceptType = event.fileSelector.getAcceptType()
              this.FileSelectorParamGetGetMimeTypes = event.fileSelector.getMimeTypes()
              let accepts = event.fileSelector.getAcceptableFileTypes();
              this.getAcceptableFileTypesArr = event.fileSelector.getAcceptableFileTypes().length;
              console.info('getAcceptableFileTypesArr:'+ this.getAcceptableFileTypesArr)
              for (let i = 0; i < accepts.length; i++) {
                for (let j = 0; j < accepts[i].length; j++) {
                  this.mimeType = accepts[i][j].mimeType;
                  this.acceptableType = JSON.stringify(accepts[i][j].acceptableType);
                  console.log('tian onShowFileSelector getAcceptType.MimeType is ' + accepts[i][j].mimeType);
                  console.log('tian onShowFileSelector getAcceptType,AcceptType is ' + accepts[i][j].acceptableType);
                }
              };
            }
          }
          return true
        })

      Web({ src: 'resource://rawfile/showFileSelector.html', controller: this.controller2 })
        .onShowFileSelector(undefined)
        .key('onShowFileSelectorKey2')
        .onControllerAttached(() => {
          this.OnShowFileSelectorUndefined = true;
        })
    }
    .key('RowSize')
  }
}
