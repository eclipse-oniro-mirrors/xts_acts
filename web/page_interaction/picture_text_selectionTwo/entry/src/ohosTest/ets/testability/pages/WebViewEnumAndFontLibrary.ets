/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';
import business_error, { BusinessError } from '@ohos.base';

class TestObj {
  constructor() {
  }

  test(): string {
    return "ArkUI Web Component"
  }

  toString(): void {
    console.log('Web Component toString')
  }
}

const EVENT_ID_SET_SUITE_KEY = 183201;
let driver = Driver.create();

@Entry
@Component
struct WebViewEnumAndFontLibrary {
  @State listData: number[] = [0, 0, 0]

  @Builder
  MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      ForEach(this.listData, (index: number | undefined) => {
        Column() {
          Row() {
            Image($r("app.media.icon")).width(20).height(20).margin({ right: 5 })
            Text(`Menu${index}`).fontSize(20)
          }
          .width('100%')
          .height(30)
          .justifyContent(FlexAlign.Center)
          .align(Alignment.Center)
          .onClick((event) => {
            console.info(`imageClicked!` + event)
          })

          if (index != this.listData.length - 1) {
            Divider().height(10).width('80%').color('#ccc')
          }
        }.padding(5).height(40)
      })
    }.width(100)
  }

  controller: webView.WebviewController = new webView.WebviewController();
  testObj: TestObj = new TestObj()
  @State Permission: Boolean = false
  @State str: string = ""
  @State webResult: string = ''
  @State count: string = ""
  @State javaScriptAccess: boolean = true
  @State mode: MixedMode = MixedMode.Compatible
  @State mixedSwitch: boolean = false
  @State mixedAllSwitch: boolean = false
  @State model: WebDarkMode = WebDarkMode.Auto
  @State access: boolean = true
  @State menuX: Number = 0
  @State menuY: Number = 0
  @State LinkUrl: String = ''
  @State ImageContent: boolean = false
  @State MediaType: ContextMenuMediaType = ContextMenuMediaType.None
  @State SourceType: ContextMenuSourceType = ContextMenuSourceType.None
  @State InputFieldType: ContextMenuInputFieldType = ContextMenuInputFieldType.None
  @State isEditable: boolean = false
  @State EditStateFlags: Number = 0
  @State SourceUrl: String | null = null
  @State SelectionText: String = ""
  @State FileSelectorMode: Number = 0
  @State RenderExitReason: String = ''
  @State fontSize: number = 13
  @State minFontSize: number = 1
  @State webId: number = 0
  @State zoomCount: number = 100
  @State webResultText: string = ''
  @State outputStr: string = ''
  @State hasImageCbOnline: boolean = true;
  @State onContextMenuShowState: Boolean = false
  @State minLogicalFontSize: number = 13
  @State databaseAccess: boolean = true
  @State PermissionRequestState: boolean = false
  @State userAgentPC:string = "";
  WebResult: WebContextMenuResult = new WebContextMenuResult;
  @State SourceTypeArr:ContextMenuSourceType[] = [ContextMenuSourceType.None,ContextMenuSourceType.Mouse,ContextMenuSourceType.LongPress]
  @State MediaTypeArr:ContextMenuMediaType[] = [ContextMenuMediaType.None,ContextMenuMediaType.Image]
  @State FieldTypeArr:ContextMenuInputFieldType[] = [ContextMenuInputFieldType.None,ContextMenuInputFieldType.PlainText,ContextMenuInputFieldType.Password,ContextMenuInputFieldType.Number,ContextMenuInputFieldType.Telephone,ContextMenuInputFieldType.Other ]

  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isOnContextMenuShowEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('buttonEnumAndFontLibrary').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitWebContextMenuParamX": {
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str, driver)
              Utils.emitEvent(this.menuX >= 0, 183210)
              break;
            }
            case "emitWebContextMenuParamY": {
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str, driver)
              Utils.emitEvent(this.menuY >= 0, 183220)
              break;
            }
            case "emitWebContextMenuParamGetLinkUrl": {
              let button = await driver.findComponent(ON.id('webCenter'));
              this.isOnContextMenuShowEnd = -1
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str, driver)
              await Utils.waitForExist(()=>this.isOnContextMenuShowEnd, this.str+' isOnContextMenuShowEnd', 1, 500);
              Utils.emitEvent(String(this.LinkUrl), 183230)
              break;
            }
            case "emitWebContextMenuParamGetUnfilteredLinkUrl": {
              let button = await driver.findComponent(ON.id('webCenter'));
              this.isOnContextMenuShowEnd = -1
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str, driver)
              await Utils.waitForExist(()=>this.isOnContextMenuShowEnd, this.str+' isOnContextMenuShowEnd', 1, 500);
              Utils.emitEvent(String(this.LinkUrl), 183240)
              break;
            }
            case "emitWebContextMenuParamGetSourceUrl": {
              let button = await driver.findComponent(ON.id('webCenter'));
              this.isOnContextMenuShowEnd = -1
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str, driver)
              await Utils.waitForExist(()=>this.isOnContextMenuShowEnd, this.str+' isOnContextMenuShowEnd', 1, 500);
              Utils.emitEvent(String(this.SourceUrl), 183250)
              break;
            }
            case "emitWebContextMenuParamExistsImageContents": {
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str, driver)
              Utils.emitEvent(this.ImageContent, 183260)
              break;
            }
            case "emitWebContextMenuParamGetMediaType": {
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str, driver)
              Utils.emitEvent(this.MediaTypeArr[this.MediaType], 183270)
              this.MediaType = 0
              break;
            }
            case "emitWebContextMenuParamGetSelectionText": {
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str, driver)
              Utils.emitEvent(String(this.SelectionText), 183280)
              break;
            }
            case "emitWebContextMenuParamGetSourceType": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.SourceTypeArr[ContextMenuSourceType.LongPress], 183290)
                  break;
                }

              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str, driver)
              Utils.emitEvent(this.SourceTypeArr[this.SourceType], 183290)
              break;
            }
            case "emitWebContextMenuParamGetSourceTypeNone": {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(this.SourceTypeArr[ContextMenuSourceType.None], 183300)
                break;
              }

              await driver.triggerCombineKeys(2047, 2099);
              await Utils.waitForReleaseDriver(this.str, driver)
              Utils.emitEvent(this.SourceTypeArr[this.SourceType], 183300)
              break;
            }

            case "emitWebContextMenuParamGetInputFieldType": {

              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str, driver)
              Utils.emitEvent(this.FieldTypeArr[this.InputFieldType], 183310)
              break;
            }
            case "emitWebContextMenuParamIsEditable": {

              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str, driver)
              Utils.emitEvent(this.isEditable, 183320)
              break;
            }
            case "emitWebContextMenuParamGetEditStateFlags": {

              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str,driver)
              Utils.emitEvent(Number(this.EditStateFlags), 183330)
              this.isPageEnd = -1
              this.controller.loadUrl("resource://rawfile/indexJru.html")
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.FileSelectorMode = 0
              break;
            }
            case "emitContextMenuInputFieldTypeNone": {

              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str,driver)
              Utils.emitEvent(this.FieldTypeArr[this.InputFieldType], 183340)
              break;
            }
            case "emitContextMenuSourceTypeLongPress": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 183350)
                  break;
                }

              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str,driver)
              Utils.emitEvent(this.SourceTypeArr[this.SourceType], 183350)
              break;
            }
            case "emitContextMenuEditStateFlags": {

              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str,driver)
              Utils.emitEvent(Number(this.EditStateFlags), 183360)
              this.isPageEnd = -1
              this.controller.loadUrl("resource://rawfile/indexJru.html")
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              break;
            }
            case "emitContextMenuMediaTypeNone": {
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str,driver)
              Utils.emitEvent(this.MediaTypeArr[this.MediaType], 183370)
              this.MediaType = 0
              this.isPageEnd = -1
              this.controller.loadUrl("resource://rawfile/indexJru.html")
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              break;
            }
            case "onContextMenuShow": {
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.waitForReleaseDriver(this.str,driver)
              Utils.emitEvent(Boolean(this.onContextMenuShowState), 183380);
              break;
            }

          }
        })
      }

      Row() {
        Image("media/icon.png")
          .width(110)
          .height(110)
          .border({ width: 1 })
          .overlay('jpg', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .key("images")
          .bindMenu(this.MenuBuilder)
          .onClick(async () => {
            let button = await driver.findComponent(ON.type('webCenter'));
            await button.longClick();
          })
      }

      Row() {
        Text(this.webResultText).fontSize(20)
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .onControllerAttached(() => {
          try {
            let id = this.controller.getWebId();
            this.webId = id
          } catch (error) {
            let code = (error as BusinessError).code;
            let message = (error as BusinessError).message;
            console.error(`ErrorCode: ${code},  Message: ${message}`);
          }
        })
        .password(true)
        .tableData(true)
        .wideViewModeAccess(true)
        .overviewModeAccess(true)
        .textZoomAtio(this.zoomCount)
        .textZoomRatio(this.zoomCount)
        .defaultFontSize(this.fontSize)
        .key("webCenter")
        .mixedMode(this.mode)
        .darkMode(this.model)
        .minFontSize(this.minFontSize)
        .minLogicalFontSize(this.minLogicalFontSize)
        .forceDarkAccess(this.access)
        .onPageEnd(() => {
          this.controller.runJavaScript("webTest()", (error, result) => {
            console.log("error" + error)
            this.webResultText = result
          })
        })
        .onShowFileSelector((event) => {
          if (event) {
            let fileSelectorObj: FileSelectorParam = event.fileSelector
            this.FileSelectorMode = fileSelectorObj.getMode()
          }
          return true
        })
        .onErrorReceive((event) => {
          console.
          log("error", event)
          if (event) {
            console.log('getErrorInfo:' + event.error.getErrorInfo())
            console.log('getErrorCode:' + event.error.getErrorCode())
            console.log('url:' + event.request.getRequestUrl())
            console.log('isMainFrame:' + event.request.isMainFrame())
            console.log('isRedirect:' + event.request.isRedirect())
            console.log('isRequestGesture:' + event.request.isRequestGesture())
            console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString())
            let result = event.request.getRequestHeader()
            console.log('The request header result size is ' + result.length)
            for (let i of result) {
              console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue)
            }
          }
        })
        .onConsole((event) => {
          if (event) {
            console.log('getMessage:' + event.message?.getMessage())
            console.log('getSourceId:' + event.message?.getSourceId())
            console.log('getLineNumber:' + event.message?.getLineNumber())
            console.log('getMessageLevel:' + event.message?.getMessageLevel())
            this.count = event.message.getMessageLevel().toString()
            console.log("mixed>>>:", event.message.getMessage(), event.message.getMessageLevel())
          }
          return false
        })
        .onContextMenuShow((event) => {
          if (event) {
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
            this.isOnContextMenuShowEnd = 1
          }
          return true
        })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(false)
        .onlineImageAccess(false)
        .databaseAccess(this.databaseAccess)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
