'use static';
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
  $rawfile,
  AlertDialogParamWithButtons,
  Alignment,
  BarMode,
  BarPosition,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  DataChangeListener,
  Entry,
  FileSelectorResult,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  FullScreenExitHandler,
  IDataSource,
  Image,
  InputType,
  ItemAlign,
  LazyForEach,
  Margin,
  Path,
  Progress,
  Resource,
  Row,
  Search,
  SearchController,
  Stack,
  Swiper,
  SwiperController,
  TabContent,
  Tabs,
  TabsController,
  Text,
  TextAlign,
  TextArea,
  TextInput,
  TextOverflow,
  Video,
  VideoController,
  Visibility,
  Web,
  WebOptions,
  WebResourceResponse,
  WebviewController
} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import web_webview from '@ohos.web.webview';
import webview from '@ohos.web.webview';
import Utils from '../common/Utils';
import { RecordData } from '@ohos.base';

class TestObj {
  constructor() {
  }

  test(data1: string, data2: string, data3: string): string {
    console.log("data1:" + data1)
    console.log("data2:" + data2)
    console.log("data3:" + data3)
    return "AceString"
  }

  toString(): string {
    console.log('toString' + "interface instead.")
    return JSON.stringify(this)
  }
}

@Entry
@Component
struct Index {
  // add
  @State isVoid: boolean = true;
  handler: FullScreenExitHandler | null = null;
  @State atio: Int = 150;
  @State defaultSize: number = 13;
  @State defaultFixed: Int = 8;
  @State minLogicalSize: number = 1;
  @State netWorkStatus: boolean = false;
  ports: Array<web_webview.WebMessagePort> = new Array<web_webview.WebMessagePort>();
  testObj: TestObj = new TestObj()
  // message = new ConsoleMessage("1", "12", 23, MessageLevel.Debug);
  controller: WebviewController = new WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitStoreWebArchive"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  build() {
    Column() {
      // add api9
      Web({ src: 'www.baidu.com', controller: this.controller })
        .multiWindowAccess(true)
        .key('multiwindow')
        .onWindowExit(() => {
          console.log("onWindowExit...");
          setTimeout(() => {
            // Utils.emitEvent(this.isVoid,800)
          }, 1000)
        })
        .onWindowNew((event) => {
          console.log("onWindowNew...");
          let popController: web_webview.WebviewController = new web_webview.WebviewController();
          event.handler.setWebController(popController);
          setTimeout(() => {
            // Utils.emitEvent(this.isVoid,801)
          }, 1000)

        })
        .onFullScreenEnter((event) => {
          console.log("onFullScreenEnter...");
          this.handler = event.handler;
          setTimeout(() => {
            // Utils.emitEvent(this.isVoid,802)
          }, 1000)
        })
        .onFullScreenExit(() => {
          console.info("onFullScreenExit...");
          this.handler!.exitFullScreen();
        })

      Web({ src: 'www.huawei.com', controller: this.controller })
        .key('web2')
        .webStandardFont("HarmonyOS-Sans-Condensed")
        .webSerifFont("HarmonyOS-Sans-Condensed")
        .webSansSerifFont("HarmonyOS-Sans-Condensed")
        .webFixedFont("HarmonyOS-Sans-Condensed")
        .webFantasyFont("HarmonyOS-Sans-Condensed")
        .webCursiveFont("HarmonyOS-Sans-Condensed")
        .defaultFixedFontSize(this.defaultFixed)
        .defaultFontSize(16)
        // .minLogicalSize(this.minLogicalSize)
        .blockNetwork(false)
        .onSslErrorEventReceive((event) => {
          this.getUIContext().showAlertDialog({
            title: 'onSslErrorEventReceive',
            message: 'text',
            primaryButton: {
              value: 'confirm',
              action: () => {
                event.handler.handleConfirm();
              }
            },
            secondaryButton: {
              value: 'cancel',
              action: () => {
                event.handler.handleCancel();
              }
            },
            cancel: () => {
              event.handler.handleCancel();
            }
          } as AlertDialogParamWithButtons)
          setTimeout(() => {
            // Utils.emitEvent(this.isVoid,803)
          }, 1000)
        })
        .textZoomRatio(this.atio)
        .javaScriptProxy({
          jsObject: this.testObj,
          name: "objName",
          methodList: ["test", "toString"],
          controller: this.controller,
        })
        .onConsole((event) => {
          console.log('getMessage:' + event.message.getMessage());
          console.log('getSourceId:' + event.message.getSourceId());
          console.log('getLineNumber:' + event.message.getLineNumber());
          console.log('getMessageLevel:' + event.message.getMessageLevel());
          return false;
        })
        .onErrorReceive((event) => {
          event.request.getRequestMethod();
        })
        .onTouchIconUrlReceived((event) => {
          event.url;
        })
        .onFaviconReceived((event) => {
          event.favicon;
        })
        .onPageVisible((event) => {
          event.url
        })
        .onDataResubmitted((event) => {
          event.handler.resend
        })
        .onInterceptKeyEvent((e): boolean => {
          e.keyCode;
          return true
        })

      Button("web click").key('webcomponentapi9').onClick((e: ClickEvent) => {
        console.info("key==>" + this.str)
        switch (this.str) {
          // add
          case "emitGeturl":
            let url = this.controllerTwo.getUrl();
            // Utils.emitEvent(url,810);
            break;
          case "emitclearClientAuthenticationCache":
            this.controllerTwo.clearClientAuthenticationCache();
            // Utils.emitEvent(this.isVoid,811);
            break;
          case "emitclearSslCache":
            this.controllerTwo.clearSslCache();
            // Utils.emitEvent(this.isVoid,812);
            break;
          case "emitsearchNext":
            this.controllerTwo.searchNext(true);
            // Utils.emitEvent(this.isVoid,813);
            break;
          case "emitclearMatches":
            this.controllerTwo.clearMatches();
            // Utils.emitEvent(this.isVoid,814);
            break;
          case "emitDefaultUserAgent":
            let usrAgent = webview.WebviewController.getDefaultUserAgent();
            // Utils.emitEvent(usrAgent,815);
            break;
          case "emitgetWebId":
            let webId = this.controllerTwo.getWebId();
            // Utils.emitEvent(webId,816);
            break;
          case "emitpostMessage":
            let sendPortArray = new Array<web_webview.WebMessagePort>(this.ports[1]);
            // let msgEvent = new WebMessageEvent();
            // msgEvent.setData("__init_port__");
            // msgEvent.setPorts(sendPortArray);
            // this.controller.postMessage(msgEvent, "*",'https://www.baidu.com');
            break;
          case "emitcreateWebMessagePorts":
            this.ports = this.controller.createWebMessagePorts();
            console.info("createWebMessagePorts size:" + this.ports.length)
            // Utils.emitEvent(this.ports.length,817);
            break;
          case "emitdeleteSessionCookie":
            web_webview.WebCookieManager.clearSessionCookieSync();
            // Utils.emitEvent(this.isVoid,818);
            break;
          case "emitdeleteExpiredCookie":
            // web_webview.WebCookieManager.deleteExpiredCookie();
            // Utils.emitEvent(this.isVoid,810);
            break;
          case "emitexistCookie":
            let vaue = web_webview.WebCookieManager.existCookie();
            // Utils.emitEvent(vaue,820);
            break;
          case "emitgetCookie":
            let value = web_webview.WebCookieManager.fetchCookieSync('www.baidu.com');
            console.info("value: " + value);
            // Utils.emitEvent(value,821);
            break;

          case "emitsetCookie":
            web_webview.WebCookieManager.configCookieSync('www.baidu.com', 'a=b');
            // console.info("value: " + value02);
            // Utils.emitEvent(value02,822);
            break;

          case "emitsaveCookie":
            web_webview.WebCookieManager.saveCookieSync();
            // Utils.emitEvent(this.isVoid,823);
            break;
          case "emitputAcceptFileURICookieEnabled":
            web_webview.WebCookieManager.putAcceptCookieEnabled(false)
            // Utils.emitEvent(this.isVoid,824);
            break;
          case "emitputAcceptThirdPartyCookieEnabled":
            web_webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false)
            // Utils.emitEvent(this.isVoid,825);
            break;

          case "emitisFileURICookieAllowed":
            let isAll = web_webview.WebCookieManager.isCookieAllowed();
            // Utils.emitEvent(isAll,826);
            break;
          case "emitisThirdPartyCookieAllowed":
            let isThirdParty = web_webview.WebCookieManager.isThirdPartyCookieAllowed();
            // Utils.emitEvent(isThirdParty,827);
            break;
          case "hasImage":
            // let flag = true
            try {
              this.controllerTwo.hasImage((err, data) => {
                if (err) {
                  console.info("has ImageError" + JSON.stringify(err))
                }
                // Utils.emitEvent(flag,828);
              });
            } catch (error) {
              console.error(`ErrorCode:${(error as BusinessError)?.code},Message:${(error as Error)?.message}`);
            }
            break;
          case "hasImageTwo":
            let flag = true
            try {
              this.controllerTwo.hasImage().then((data) => {
                // Utils.emitEvent(flag, 829);
              })

            } catch (error) {
              console.error(`ErrorCode:${(error as BusinessError)?.code},Message:${(error as Error)?.message}`);
            }
            break;
          case "setNetworkAvailable":
            this.controllerTwo.setNetworkAvailable(this.netWorkStatus);
            // Utils.emitEvent(this.netWorkStatus,830);
            break;
          case "getFavicon":
            let icon = "baidu"
            this.controllerTwo.getFavicon();
            // Utils.emitEvent(this.icon,831);
            break;
          case "getOriginalUrl":
            // let url = "www.baidu.com"
            this.controllerTwo.getOriginalUrl();
            // Utils.emitEvent(this.netWorkStatus,832);
            break;
          case "history":
            let res = 1;
            let historyList = this.controllerTwo.getBackForwardEntries();
            webview.WebviewController.initializeWebEngine();
            let historyItem = historyList.getItemAtIndex(res);
            // historyItem.historyRawUrl
            // Utils.emitEvent(this.netWorkStatus,833);
            break;
          case "pageUp":
            // let res = true
            this.controllerTwo.pageUp(true);
            this.controllerTwo.pageDown(true);
            this.controllerTwo.removeCache(true);
            // Utils.emitEvent(this.res,834);
            break;

          default:
            console.info("can not match case")
        }
      })
    }

  }

  // private jsObj = {
  //   test: (res) => {
  //     Utils.emitEvent(res, 102);
  //   },
  //   toString: (str) => {
  //     console.info("ets toString:" + String(str));
  //   },
  //   register: (res) => {
  //     Utils.emitEvent(res, 86);
  //     return "web222"
  //   }
  // }

  private valueChangeCallBack: (eventData: events_emitter.EventData) => void =
    (eventData: events_emitter.EventData) => {
      console.info("web page valueChangeCallBack");
      if (eventData != null) {
        const data = eventData.data as Record<String,RecordData>
        console.info("valueChangeCallBack:" + JSON.stringify(eventData));
        if (data['ACTION'] != null) {
          this.str = data['ACTION'] as string;
        }
      }
    }
}
