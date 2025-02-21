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

@Entry
@Component
struct WebViewEnumAndFontLibrary {
  @State listData: number[] = [0, 0, 0]

  @Builder MenuBuilder() {
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
  @State MediaType: Number = 0
  @State SourceType: Number = 0
  @State InputFieldType: Number = 0
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
  WebResult: WebContextMenuResult = new WebContextMenuResult;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('buttonEnumAndFontLibrary').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitTextZoomRatio": {
              this.fontSize = 13
              this.zoomCount = 150
              this.controller.loadUrl("resource://rawfile/indexJru.html")
              await Utils.sleep(2000)
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                let changeFontSize = this.fontSize * 1.5 + 'px'
                let changeResult = result.substring(1, result.length - 1)
                console.log("changeFontSize >>>", changeFontSize, "result >>>", changeResult)
                console.log("font-size :" + changeFontSize + "result :" + changeResult + error)
                if (changeResult == changeFontSize) {
                  Utils.emitEvent(true, 1231)
                }
              })
              break;
            }
            case "emitWebContextMenuParamX": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(this.menuX >= 0, 801)
              break;
            }
            case "emitWebContextMenuParamY": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(this.menuY >= 0, 802)
              break;
            }
            case "emitWebContextMenuParamGetLinkUrl": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(String(this.LinkUrl), 803)
              break;
            }
            case "emitWebContextMenuParamGetUnfilteredLinkUrl": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(String(this.LinkUrl), 804)
              break;
            }
            case "emitWebContextMenuParamGetSourceUrl": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(String(this.SourceUrl), 805)
              break;
            }
            case "emitWebContextMenuParamExistsImageContents": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(this.ImageContent, 806)
              break;
            }
            case "emitWebContextMenuParamGetMediaType": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(Number(this.MediaType), 807)
              this.MediaType = 0
              break;
            }
            case "emitWebContextMenuParamGetSelectionText": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(String(this.SelectionText), 808)
              break;
            }
            case "emitWebContextMenuParamGetSourceType": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(Number(this.SourceType), 809)
              break;
            }
            case "emitWebContextMenuParamGetInputFieldType": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(Number(this.InputFieldType), 810)
              break;
            }
            case "emitWebContextMenuParamIsEditable": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(this.isEditable, 811)
              break;
            }
            case "emitWebContextMenuParamGetEditStateFlags": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.sleep(2000);
              Utils.emitEvent(Number(this.EditStateFlags), 812)
              this.controller.loadUrl("resource://rawfile/indexJru.html")
              await Utils.sleep(2000);
              this.FileSelectorMode = 0
              break;
            }
            case "emitContextMenuInputFieldTypeNone": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.sleep(2000);
              Utils.emitEvent(Number(this.InputFieldType), 831)
              break;
            }
            case "emitContextMenuSourceTypeLongPress": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.sleep(2000);
              Utils.emitEvent(Number(this.SourceType), 841)
              break;
            }
            case "emitContextMenuEditStateFlags": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.sleep(2000);
              Utils.emitEvent(Number(this.EditStateFlags), 851)
              this.controller.loadUrl("resource://rawfile/indexJru.html")
              await Utils.sleep(2000);
              break;
            }
            case "emitFileSelectorModeFileOpenMode": {
              this.controller.loadUrl("resource://rawfile/indexFile.html")
              await Utils.sleep(2000);
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.click();
              await Utils.sleep(2000);
              Utils.emitEvent(Number(this.FileSelectorMode), 861)
              this.FileSelectorMode = 0
              this.controller.loadUrl("resource://rawfile/indexJru.html")
              await Utils.sleep(2000);
              break;
            }
            case "emitContextMenuMediaTypeNone": {
              await Utils.sleep(2000);
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              await Utils.sleep(2000);
              Utils.emitEvent(Number(this.MediaType), 881)
              this.MediaType = 0
              this.controller.loadUrl("resource://rawfile/indexJru.html")
              await Utils.sleep(2000);
              break;
            }
            case "emitProtectedResourceType": {
              this.PermissionRequestState = true
              this.controller.loadUrl("resource://rawfile/indexVideo.html")
              await Utils.sleep(2000);
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.click();
              break;
            }
            case "emitOnPermissionRequestGetOrigin": {
              this.PermissionRequestState = false
              this.controller.loadUrl("resource://rawfile/indexVideo.html")
              await Utils.sleep(2000);
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.click();
              break;
            }
            case "emitOnPermissionRequest": {
              this.Permission = true
              this.controller.loadUrl("resource://rawfile/indexVideo.html")
              await Utils.sleep(2000);
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.click();
              break;
            }
            case "emitMessageLevelDebug": {
              this.controller.runJavaScript("getMessageLevelDebug()")
              await Utils.sleep(2000);
              Utils.emitEvent(this.count.toString(), 601)
              break;
            }
            case "emitMessageLevelInfo": {
              this.controller.runJavaScript("getMessageLevelInfo()")
              await Utils.sleep(2000);
              Utils.emitEvent(this.count.toString(), 602)
              break;
            }
            case "emitMessageLevelWarn": {
              this.controller.runJavaScript("getMessageLevelWarn()")
              await Utils.sleep(2000);
              Utils.emitEvent(this.count.toString(), 603)
              break;
            }
            case "emitMessageLevelError": {
              this.controller.runJavaScript("getMessageLevelError()")
              await Utils.sleep(2000);
              Utils.emitEvent(this.count.toString(), 604)
              break;
            }
            case "emitMessageLevelLog": {
              this.controller.runJavaScript("getMessageLevelLog()")
              await Utils.sleep(2000);
              Utils.emitEvent(this.count.toString(), 605)
              break;
            }
            case "emitRenderExitReasonProcessCrashed": {
              console.log("RenderExitReason0", RenderExitReason.ProcessAbnormalTermination)
              console.log("RenderExitReason1", RenderExitReason.ProcessWasKilled)
              console.log("RenderExitReason2", RenderExitReason.ProcessCrashed)
              console.log("RenderExitReason3", RenderExitReason.ProcessOom)
              console.log("RenderExitReason4", RenderExitReason.ProcessExitUnknown)
              await Utils.sleep(2000)
              this.controller.loadUrl("chrome://crash/")
              await Utils.sleep(2000)
              break;
            }
            case "emitDefaultFontSize": {
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                console.log("error" + error)
                Utils.emitEvent(result, 1202)
              })
              break;
            }
            case "emitDefaultFontSizeMax": {
              this.fontSize = 75
              await Utils.sleep(2000);
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                console.log("error" + error)
                Utils.emitEvent(result, 1203)
              })
              break;
            }
            case "emitDefaultFontSizeMin": {
              this.fontSize = -5
              await Utils.sleep(2000);
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                console.log("error" + error)
                Utils.emitEvent(result, 1204)
              })
              break;
            }
            case "emitMinFontSize": {
              this.minFontSize = 18
              this.controller.loadUrl("resource://rawfile/indexFontSize.html")
              await Utils.sleep(2000);
              this.controller.runJavaScript("getPageFontSize()", (error, result) => {
                console.log("error" + error)
                let count: number = Number(result)
                if (this.minFontSize > 13 && this.minFontSize == count) {
                  Utils.emitEvent(Number(result), 1205)
                  this.minFontSize = 13
                }
              })
              break;
            }
            case "emitDatabaseAccessTrue": {
              this.databaseAccess = true
              await Utils.sleep(2000)
              this.controller.loadUrl("resource://rawfile/databaseAccess.html");
              await Utils.sleep(2000)
              this.controller.runJavaScript("getDataResult()", (error, result) => {
                console.log("error" + error)
                console.info("getDataResult==>" + result)
                Utils.emitEvent(result, 1301)
              })
              break;
            }
            case "emitOnControllerAttached": {
              Utils.emitEvent(this.webId > 0, 1221)
              break;
            }
            case "emitMixedModeNone": {
              this.javaScriptAccess = true
              await Utils.sleep(2000)
              this.mixedSwitch = true
              this.mode = MixedMode.None
              await Utils.sleep(2000)
              this.controller.loadUrl("https://mixed-script.badssl.com/")
              await Utils.sleep(2000)
              break;
            }
            case "emitMixedModeAll": {
              this.mixedAllSwitch = true
              this.mode = MixedMode.All
              await Utils.sleep(2000)
              this.controller.loadUrl("https://mixed-script.badssl.com/")
              await Utils.sleep(2000)
              break;
            }

            case "emitRunJavaScript": {
              if (this.webResultText == '"This value is from indexJru.html"') {
                Utils.emitEvent(true, 1241)
              }
              break;
            }

            case "testRunJavaScript002": {
              try {
                let title = 'null'
                this.javaScriptAccess = false
                await Utils.sleep(2000);
                this.controller.runJavaScript(
                  'webTest()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      Utils.emitEvent(error.code, 10001)
                      return;
                    }
                    if (result) {
                      this.webResult = result
                      console.info(`The test() return value is: ${this.webResult}`)
                      Utils.emitEvent(this.webResult, 10001)
                      return;
                    }
                  });
                Utils.emitEvent(title, 10001)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 10001)
              }
              break;
            }

            case "testRunJavaScript003": {
              try {
                this.javaScriptAccess = true
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile("indexJru.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript('webTest()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(result, 10002)
                    return;
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.error("error: " + e);
                    Utils.emitEvent(e.code, 10002)
                    return;
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 10002)
              }
              break;
            }

            case "testRunJavaScript004": {
              try {
                this.javaScriptAccess = false
                await Utils.sleep(2000);
                this.controller.runJavaScript('webTest()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(String(result), 10003)
                    return;
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.error("error: " + e);
                    Utils.emitEvent(e.code, 10003)
                    return;
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 10003)
              }
              break;
            }

            case "testRunJavaScriptExt001": {
              try {
                this.javaScriptAccess = true
                await Utils.sleep(4000);
                this.controller.runJavaScriptExt(
                  'webTest()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      return;
                    }
                    if (result) {
                      console.info(`run runJavaScriptExt : ` + result.getString())
                      Utils.emitEvent(result.getString(), 10004)
                      return;
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testRunJavaScriptExt002": {
              try {
                this.javaScriptAccess = false
                await Utils.sleep(4000);
                this.controller.runJavaScriptExt(
                  'webTest()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      return;
                    }
                    Utils.emitEvent(result.getString() != "This value is from indexJru.html", 10005)
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testRunJavaScriptExt003": {
              try {
                this.javaScriptAccess = true
                await Utils.sleep(4000);
                this.controller.runJavaScriptExt('webTest()')
                  .then((result) => {
                    console.info(`run runJavaScriptExt : ` + result.getString())
                    Utils.emitEvent(result.getString(), 10006)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testRunJavaScriptExt004": {
              try {
                this.javaScriptAccess = false
                await Utils.sleep(4000);
                this.controller.runJavaScriptExt('webTest()')
                  .then((result) => {
                    console.info(`run runJavaScriptExt : ` + result)
                    Utils.emitEvent(result.getString() != "This value is from indexJru.html", 10007)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.error("error: " + e);
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "emitHasImage": {
              this.javaScriptAccess = true
              await Utils.sleep(4000);
              this.controller.loadUrl($rawfile('hasImageOne.html'))
              try {
                this.controller.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImageCbOnline error: ` + JSON.stringify(error))
                    return;
                  }
                  this.hasImageCbOnline = data;
                  console.info("hasImageCbOnline: " + data);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              Utils.emitEvent(this.hasImageCbOnline, 1251);
              break;
            }
            case "onContextMenuShow": {
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenter'));
              await button.longClick();
              Utils.emitEvent(Boolean(this.onContextMenuShowState), 1252);
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
            let driver = Driver.create();
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
        .onPermissionRequest((event) => {
          console.log("emitProtectedResourceType >>>111")
          if (this.Permission) {
            Utils.emitEvent(true, 1103)
            this.Permission = false
          }
          if (event) {
            let returnArray = event?.request?.getAccessibleResource()
            if (this.PermissionRequestState) {
              Utils.emitEvent(String(returnArray), 1101)
            } else {
              console.log("emitProtectedResourceType >>>> " + event.request.getOrigin())
              Utils.emitEvent(String(event.request.getOrigin()), 1102)
            }
          }
        })
        .onRenderExited((event) => {
          if (event) {
            this.controller.loadUrl("resource://rawfile/indexJru.html")
            Utils.emitEvent(event.renderExitReason, 901)
          }
        })
        .onErrorReceive((event) => {
          console.log("error", event)
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
            if (this.mixedSwitch) {
              Utils.emitEvent(event.message.getMessageLevel(), 186)
              this.controller.loadUrl("resource://rawfile/indexJru.html")
              this.mixedSwitch = false
            } else if (this.mixedAllSwitch) {
              Utils.emitEvent(event.message.getMessageLevel(), 188)
              this.controller.loadUrl("resource://rawfile/indexJru.html")
              this.mixedAllSwitch = false
            }
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
            Utils.sleep(2000);
          }
          return true
        })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(false)
        .onlineImageAccess(false)
        .databaseAccess(this.databaseAccess)
    }
  }
}
