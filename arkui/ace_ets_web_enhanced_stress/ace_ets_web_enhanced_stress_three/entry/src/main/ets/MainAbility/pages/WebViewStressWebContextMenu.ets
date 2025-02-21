/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebViewStressWebContextMenu {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  @State Permission: Boolean = false
  @State str: string = ""
  @State mixedSwitch: boolean = false
  @State access: boolean = true
  @State LinkUrl: String = ''
  @State ImageContent: boolean = false
  @State hasImageCbOnline: boolean = true;
  @State onContextMenuShowState: Boolean = false
  @State startTime: number = 0
  @State endTime: number = 0
  @State paramString: string = ''
  @State runJavaString: boolean = false
  @State callBackId: number = 0
  @State onRequest: boolean = false
  @State onRequestState: boolean = false
  @State stressTimes: number = 0;
  WebResult: WebContextMenuResult = new WebContextMenuResult;
  @State buttonKey: string = '';

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
      }
    })
  }

  onPageHide() {
    Utils.unRegisterEventPage()
  }

  build() {
    Column() {
      Row() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testWebContextMenuParamX001": {
                this.paramString = 'X'
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuParamY001": {
                this.paramString = 'Y'
                await Utils.sleep(2000)
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuParamGetLinkUrl001": {
                this.paramString = 'GetLinkUrl'
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuParamGetUnfilteredLinkUrl001": {
                this.paramString = 'GetUnfilteredLinkUrl'
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuParamGetSourceUrl001": {
                this.paramString = 'GetSourceUrl'
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuParamExistsImageContents001": {
                this.paramString = 'ExistsImageContents'
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuParamGetMediaType001": {
                this.paramString = 'GetMediaType'
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuParamGetSelectionText001": {
                this.paramString = 'GetSelectionText'
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuParamGetSourceType001": {
                this.paramString = 'GetSourceType'
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuParamGetInputFieldType001": {
                this.paramString = 'GetInputFieldType'
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuParamIsEditable001": {
                this.paramString = 'IsEditable'
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuParamGetEditStateFlags001": {
                this.paramString = 'GetEditStateFlags'
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                await Utils.sleep(2000);
                this.controller.loadUrl("resource://rawfile/indexJru.html")
                await Utils.sleep(2000);
                break;
              }
              case "testWebContextMenuResultCopyImage001": {
                this.paramString = 'copyImage'
                this.controller.loadUrl("resource://rawfile/indexJru.html")
                await Utils.sleep(2000)
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuResultCloseContextMenu001": {
                this.paramString = 'closeContextMenu'
                this.controller.loadUrl("resource://rawfile/indexJru.html")
                await Utils.sleep(2000)
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuResultCopy001": {
                this.paramString = 'copy'
                this.controller.loadUrl("resource://rawfile/indexJru.html")
                await Utils.sleep(2000)
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuResultPaste001": {
                this.paramString = 'paste'
                this.controller.loadUrl("resource://rawfile/indexJru.html")
                await Utils.sleep(2000)
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuResultCut001": {
                this.paramString = 'cut'
                this.controller.loadUrl("resource://rawfile/indexJru.html")
                await Utils.sleep(2000)
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
              case "testWebContextMenuResultSelectAll001": {
                this.paramString = 'selectAll'
                this.controller.loadUrl("resource://rawfile/indexJru.html")
                await Utils.sleep(2000)
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('WebViewStressWebContextMenuWebView'));
                await button.longClick();
                break;
              }
            }
          })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .key("WebViewStressWebContextMenuWebView")
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
        .onContextMenuShow((event) => {
          if (event) {
            switch (this.paramString) {
              case 'X': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.x()
                    Utils.stressingLog('WebContextMenuParam.x()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'Y': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.y()
                    Utils.stressingLog('WebContextMenuParam.y()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'GetLinkUrl': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.getLinkUrl()
                    Utils.stressingLog('WebContextMenuParam.getLinkUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'GetUnfilteredLinkUrl': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.getUnfilteredLinkUrl()
                    Utils.stressingLog('WebContextMenuParam.getUnfilteredLinkUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'GetSourceUrl': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.getSourceUrl()
                    Utils.stressingLog('WebContextMenuParam.getSourceUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'ExistsImageContents': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.existsImageContents()
                    Utils.stressingLog('WebContextMenuParam.existsImageContents()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'GetMediaType': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.getMediaType()
                    Utils.stressingLog('WebContextMenuParam.getMediaType()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'GetSelectionText': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.getSelectionText()
                    Utils.stressingLog('WebContextMenuParam.getSelectionText()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'GetSourceType': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.getSourceType()
                    Utils.stressingLog('WebContextMenuParam.getSourceType()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'GetInputFieldType': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.getInputFieldType()
                    Utils.stressingLog('WebContextMenuParam.getInputFieldType()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'IsEditable': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.isEditable()
                    Utils.stressingLog('WebContextMenuParam.isEditable()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'GetEditStateFlags': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.param.getEditStateFlags()
                    Utils.stressingLog('WebContextMenuParam.getEditStateFlags()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.paramString = ''
                break
              }
              case 'copyImage': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.result.copyImage()
                    Utils.stressingLog('WebContextMenuResult.copyImage()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'closeContextMenu': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.result.closeContextMenu()
                    Utils.stressingLog('WebContextMenuResult.closeContextMenu()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'copy': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.result.copy()
                    Utils.stressingLog('WebContextMenuResult.copy()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'paste': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.result.paste()
                    Utils.stressingLog('WebContextMenuResult.paste()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'cut': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.result.cut()
                    Utils.stressingLog('WebContextMenuResult.cut()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'selectAll': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.result.selectAll()
                    Utils.stressingLog('WebContextMenuResult.selectAll()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              default:
                break
            }
            console.info("onContextMenuShow x = " + event.param.x())
            console.info("onContextMenuShow y = " + event.param.y())
            console.info("onContextMenuShow getLinkUrl = " + event.param.getLinkUrl())
            console.info("onContextMenuShow getUnfilteredLinkUrl = " + event.param.getUnfilteredLinkUrl())
            console.info("onContextMenuShow getSourceUrl = " + event.param.getSourceUrl())
            console.info("onContextMenuShow existsImageContents = " + event.param.existsImageContents())
            console.info("onContextMenuShow getMediaType = " + event.param.getMediaType())
            console.info("onContextMenuShow getSelectionText = " + event.param.getSelectionText())
            console.info("onContextMenuShow getSourceType = " + event.param.getSourceType())
            console.info("onContextMenuShow getInputFieldType = " + event.param.getInputFieldType())
            console.info("onContextMenuShow isEditable = " + event.param.isEditable())
            console.info("onContextMenuShow getEditStateFlags = " + event.param.getEditStateFlags())
            Utils.sleep(2000);
            this.paramString = ''
            event.result.closeContextMenu()
          }
          return true
        })
    }
  }
}
