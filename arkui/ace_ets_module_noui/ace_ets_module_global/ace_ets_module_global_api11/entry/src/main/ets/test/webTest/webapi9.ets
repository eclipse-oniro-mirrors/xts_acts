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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';


@Entry
@Component
struct Index {
  // add
  @State isVoid: boolean = true;
  handler: FullScreenExitHandler = null;
  @State atio: number = 150;
  @State defaultSize: number = 13;
  @State defaultFixed: number = 8;
  @State minLogicalSize: number = 1;
  @State netWorkStatus: boolean = false;
  ports: WebMessagePort[] = null;
  testObj = {
    test: (data1, data2, data3) => {
      console.log("data1:" + data1);
      console.log("data2:" + data2);
      console.log("data3:" + data3);
      return "AceString";
    },
    toString: () => {
      console.log('toString' + "interface instead.");
    }
  }
  message = new ConsoleMessage("1", "12", 23, MessageLevel.Debug);
  controller: WebController = new WebController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  responseweb: WebResourceResponse = new WebResourceResponse()
  @State str: string = "emitStoreWebArchive"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  private jsObj = {
    test: (res) => {
      Utils.emitEvent(res, 102);
    },
    toString: (str) => {
      console.info("ets toString:" + String(str));
    },
    register: (res) => {
      Utils.emitEvent(res, 86);
      return "web222"
    }
  }

  aboutToAppear() {
    let abilityDelegator;
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments;
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
            // add api9
            Web({ src: 'www.baidu.com', controller: this.controller })
                .multiWindowAccess(true).key('multiwindow')
                .onWindowExit(() => {
                    console.log("onWindowExit...");
                    setTimeout(()=>{
                        Utils.emitEvent(this.isVoid,800)
                    },1000)
                }).
               onWindowNew((event) => {
                console.log("onWindowNew...");
                let popController: web_webview.WebviewController = new web_webview.WebviewController();
                event.handler.setWebController(popController);
                setTimeout(()=>{
                    Utils.emitEvent(this.isVoid,801)
                },1000)

               }).onFullScreenEnter((event) => {
                 console.log("onFullScreenEnter...");
                 this.handler = event.handler;
                 setTimeout(()=>{
                    Utils.emitEvent(this.isVoid,802)
                },1000)
               }).onFullScreenExit(() => {
                  console.info("onFullScreenExit...");
                  this.handler.exitFullScreen();
                })

            Web({ src: 'www.baidu.com', controller: this.controller }).key('web2')
            .webStandardFont("HarmonyOS-Sans-Condensed")
            .webSeriFont("HarmonyOS-Sans-Condensed")
            .webSanSeriFont("HarmonyOS-Sans-Condensed")
            .webFixedFont("HarmonyOS-Sans-Condensed")
            .webFantasyFont("HarmonyOS-Sans-Condensed")
            .webCursiveFont("HarmonyOS-Sans-Condensed")
            .defaultFixedFontSize(this.defaultFixed)
            .defaultFontSize(this.defaultFontSize)
            .minLogicalSize(this.minLogicalSize)
            .blockNetwork(false)
            .defaultFontSize()
                .onSslErrorEventReceive((event) => {
                    AlertDialog.show({
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
                    })
                    setTimeout(()=>{
                        Utils.emitEvent(this.isVoid,803)
                    },1000)
                    return true;
                }).textZoomAtio(this.atio).tableData(true)
                .javaScriptProxy({
                    object: this.testObj,
                    name: "objName",
                    methodList: ["test", "toString"],
                    controller: this.controller,
                 }).onConsole((event) => {
                      console.log('getMessage:' + event.message.getMessage());
                      console.log('getSourceId:' + event.message.getSourceId());
                      console.log('getLineNumber:' + event.message.getLineNumber());
                     console.log('getMessageLevel:' + event.message.getMessageLevel());
                    return false;
                })
                .onErrorReceive((event)=>{
                    event.request.getRequestMethod();
                })
                .onTouchIconUrlRecevied((event)=>{
                    event.url;
                })
                .onFaviconReceived((event)=>{
                    event.favicon;
                })
                .onPageVisible((event)=>{
                    event.url
                })
                .onDataResubmitted((event)=>{
                    event.handler.resend
                })
                .onInterceptKeyEvent((e)=>{
                    e.keyCode;
                })

            Button("web click").key('webcomponentapi9').onClick(async ()=>{
                console.info("key==>"+this.str)
                switch(this.str){
                    // add
                    case "emitGeturl":
                         let url = this.controllerTwo.getUrl();
                         Utils.emitEvent(url,810);
                         break;
                    case "emitclearClientAuthenticationCache":
                        this.controllerTwo.clearClientAuthenticationCache();
                        Utils.emitEvent(this.isVoid,811);
                        break;
                    case "emitclearSslCache":
                        this.controllerTwo.clearSslCache();
                        Utils.emitEvent(this.isVoid,812);
                        break;
                    case "emitsearchNext":
                        this.controllerTwo.searchNext(true);
                        Utils.emitEvent(this.isVoid,813);
                        break;
                    case "emitclearMatches":
                        this.controllerTwo.clearMatches();
                        Utils.emitEvent(this.isVoid,814);
                        break;
                    case "emitDefaultUserAgent":
                        let usrAgent = this.controller.getDefaultUserAgent();
                        Utils.emitEvent(usrAgent,815);
                        break;
                    case "emitgetWebId":
                        let webId = this.controllerTwo.getWebId();
                        Utils.emitEvent(webId,816);
                        break;
                    case "emitpostMessage":
                        let sendPortArray = new Array(this.ports[1]);
                        let msgEvent = new WebMessageEvent();
                        msgEvent.setData("__init_port__");
                        msgEvent.setPorts(sendPortArray);
                        this.controller.postMessage({message: msgEvent, url: "*"});
                        break;
                    case "emitcreateWebMessagePorts":
                        this.ports = this.controller.createWebMessagePorts();
                        console.info("createWebMessagePorts size:" + this.ports.length)
                        Utils.emitEvent(this.ports.length,817);
                        break;
                    case "emitdeleteSessionCookie":
                        web_webview.WebCookieManager.deleteSessionCookie();
                        Utils.emitEvent(this.isVoid,818);
                        break;
                    case "emitdeleteExpiredCookie":
                        web_webview.WebCookieManager.deleteExpiredCookie();
                        Utils.emitEvent(this.isVoid,810);
                        break;
                    case "emitexistCookie":
                        let vaue = web_webview.WebCookieManager.existCookie();
                        Utils.emitEvent(vaue,820);
                        break;
                    case "emitgetCookie":
                        let value = web_webview.WebCookieManager.getCookie('www.baidu.com');
                        console.info("value: " + value);
                        Utils.emitEvent(value,821);
                        break;

                    case "emitsetCookie":
                        let value02 = web_webview.WebCookieManager.setCookie('www.baidu.com','a=b');
                        console.info("value: " + value02);
                        Utils.emitEvent(value02,822);
                        break;

                    case "emitsaveCookie":
                        web_webview.WebCookieManager.saveCookie();
                        Utils.emitEvent(this.isVoid,823);
                        break;
                    case "emitputAcceptFileURICookieEnabled":
                        web_webview.WebCookieManager.putAcceptFileURICookieEnabled(false)
                        Utils.emitEvent(this.isVoid,824);
                        break;
                    case "emitputAcceptThirdPartyCookieEnabled":
                        web_webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false)
                        Utils.emitEvent(this.isVoid,825);
                        break;

                    case "emitisFileURICookieAllowed":
                        let isAll = web_webview.WebCookieManager.isFileURICookieAllowed();
                        Utils.emitEvent(isAll,826);
                        break;
                    case "emitisThirdPartyCookieAllowed":
                        let isThirdParty = web_webview.WebCookieManager.isThirdPartyCookieAllowed();
                        Utils.emitEvent(isThirdParty,827);
                        break;
                    case "hasImage":
                        // let flag = true
                        try{
                            thid.controllerTwo.hasImage((err.data)=>{
                                if(err) {
                                    console.info("has ImageError" + JSON.stringfy(err))
                                    return;
                                }
                                Utils.emitEvent(flag,828);
                            });
                        }catch(error){
                            console.error(`ErrorCode:${error.code},Message:${error.message}`);
                        }
                        break;
                    case "hasImageTwo":
                        let flag = true
                        try{
                            thid.controllerTwo.hasImage().then((data)=>{
                                Utils.emitEvent(flag,829);
                            })
                            .catch(function(error)) {
                                console.error("error" +error)
                            }

                        }catch(error){
                            console.error(`ErrorCode:${error.code},Message:${error.message}`);
                        }
                        break;
                    case "setNetworkAvailable":
                        this.controllerTwo.setNetworkAvailable(this.netWorkStatus);
                        Utils.emitEvent(this.netWorkStatus,830);
                        break;
                    case "getFavicon":
                        let icon = "baidu"
                        this.controllerTwo.getFavicon();
                        Utils.emitEvent(this.icon,831);
                        break;
                    case "getOriginalUrl":
                        let url = "www.baidu.com"
                        this.controllerTwo.getOriginalUrl();
                        Utils.emitEvent(this.netWorkStatus,832);
                        break;
                    case "history":
                        let res = 1;
                        let historyList = this.controllerTwo.getBackForwardEntries();
                        this.controllerTwo.initializeWebEngine();
                        let historyItem = historyList.getItemIndex(this.res);
                        historyItem.historyRawUrl
                        Utils.emitEvent(this.netWorkStatus,833);
                        break;
                    case "pageUp":
                        let res = true
                        this.controllerTwo.pageUp(true);
                        this.controllerTwo.pageDown(true);
                        this.controllerTwo.removeCache(true);
                        Utils.emitEvent(this.res,834);
                        break;

                    default:
                        console.info("can not match case")
                }
            })
        }

  }
}
