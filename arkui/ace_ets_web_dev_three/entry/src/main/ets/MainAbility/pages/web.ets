/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import fileio from '@ohos.fileio';
let loadedUrl;
@Entry
@Component
struct Index {
    controller: web_webview.WebviewController = new web_webview.WebviewController();
    controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
    scheme1: web_webview.WebCustomScheme = {schemeName: "name1", isSupportCORS: true, isSupportFetch: true}
    scheme2: web_webview.WebCustomScheme = {schemeName: "name2", isSupportCORS: true, isSupportFetch: true}
    scheme3: web_webview.WebCustomScheme = {schemeName: "name3", isSupportCORS: true, isSupportFetch: true}
    responseweb: WebResourceResponse = new WebResourceResponse()
    @State str:string="emitLoadUrl"
    @State text:boolean=false
    @State num:number=0
    @State mode: WebDarkMode = WebDarkMode.Off
    @State mode1: WebDarkMode = WebDarkMode.On
    @State mode2: WebDarkMode = WebDarkMode.Auto
    ports: web_webview.WebMessagePort[];
    testObj = {
        testOne: (data) => {
            Utils.emitEvent(data,13)
            return data
        },
        toString: () => {
            console.log('Web Component toString');
        }
    }

    onPageShow(){
        let valueChangeEvent={
            eventId:100,
            priority:events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent,this.valueChangeCallBack)
    }
    private valueChangeCallBack=(eventData)=>{
        console.info("web page valueChangeCallBack");
        if(eventData != null){
             console.info("valueChangeCallBack:"+   JSON.stringify(eventData));
             if(eventData.data.ACTION != null){
                 this.str = eventData.data.ACTION;
             }
        }
    }
    aboutToAppear(){
        let abilityDelegator: any
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let abilityDelegatorArguments: any
        abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        console.info('start run testcase!!!')
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite) 
        try{
            web_webview.WebviewController.customizeSchemes([this.scheme1, this.scheme2, this.scheme3])
            web_webview.WebviewController.setWebDebuggingAccess(true)
            web_webview.once("webInited",()=>{
                web_webview.WebCookieManager.setCookie("https://www.huawei.com", "a=b");
            })
        }catch(error){
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }

    }
    build(){
        Column(){
            Row(){
                Button("web click").key('webcomponent').onClick(async ()=>{
                    console.info("key==>"+this.str)
                    switch(this.str){
                        case "emitLoadUrl":{ 
                            try {
                                setTimeout(()=>{
                                    this.controller.loadUrl("file:///data/storage/el1/bundle/phone/resources/rawfile/index.html");
                                    setTimeout(()=>{
                                        let title = this.controller.getTitle();
                                        Utils.emitEvent(title,1)
                                    },5000)
                                },3000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }                                          
                            break;
                        }
                        case "emitLoadData":{ 
                            try {
                                this.controller.loadData(
                                    "<html><head><title>baidu</title></head><body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                                    "text/html",
                                    "UTF-8"
                                );
                                setTimeout(()=>{
                                    let title1 = this.controller.getTitle();
                                    Utils.emitEvent(title1,2) 
                                },3000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }                                                                        
                            break;
                        }
                        case "emitBackward":{ 
                            try {
                                this.controller.backward();
                                setTimeout(()=>{
                                    let title2 = this.controller.getTitle();
                                    Utils.emitEvent(title2,3) 
                                },3000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }                                                                       
                            break;
                        }
                        case "emitForward":{ 
                            try {
                                this.controller.forward();
                                setTimeout(()=>{
                                    let title3 = this.controller.getTitle();
                                    Utils.emitEvent(title3,4) 
                                },3000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }                                                                     
                            break;
                        }
                        case "emitAccessBackward":{ 
                            try {
                                let result0 = this.controller.accessBackward();
                                setTimeout(()=>{
                                    Utils.emitEvent(result0,5) 
                                },3000)
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                            }                                                                       
                            break;
                        }
                        case "emitAccessForward":{ 
                            try {
                                let result1 = this.controller.accessForward();
                                setTimeout(()=>{
                                    Utils.emitEvent(result1,6) 
                                },3000)
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                            }                                                                        
                            break;
                        }
                        case "emitonInactive":{ 
                            try {
                                this.controller.onInactive();
                                setTimeout(()=>{
                                    setTimeout(()=>{
                                        this.controller.loadUrl("file:///data/storage/el1/bundle/phone/resources/rawfile/index.html")
                                    },3000)
                                    var title4 = this.controller.getTitle();
                                    Utils.emitEvent(title4,7) 
                                },3000)
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                            }                                                                 
                            break;
                        }
                        case "emitonActive":{ 
                            try {
                                this.controller.onInactive();
                                setTimeout(()=>{
                                    var title5 = this.controller.getTitle();
                                    Utils.emitEvent(title5,8) 
                                },3000)
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                            }                                                                     
                            break;
                        }
                        case "emitRefresh":{
                            try {
                                this.controller.refresh();
                                setTimeout(()=>{
                                    var title6 = this.controller.getTitle();
                                    Utils.emitEvent(title6,9) 
                                },3000) 
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                            }                                                                     
                            break;
                        }
                        case "emitAccessStep":{ 
                            try {
                                let result2 = this.controller.accessStep(-2);
                                setTimeout(()=>{
                                    Utils.emitEvent(result2,10) 
                                },3000)
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                            }                                                                     
                            break;
                        }
                        case "emitClearHistory":{ 
                            try {
                                this.controller.clearHistory()
                                setTimeout(()=>{
                                    let result3 = this.controller.accessStep(-2);
                                    setTimeout(()=>{
                                        Utils.emitEvent(result3,11) 
                                    },3000)
                                },3000)
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                            }                                                                     
                            break;
                        }
                        case "emitGetHitTestValue":{
                            try {
                                let hitValue = this.controller.getHitTestValue();
                                console.log("hitType: " + hitValue.type);
                                console.log("extra: " + hitValue.extra);
                                Utils.emitEvent("hitValue",12) 
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }                                                                   
                            break;
                        }
                        case "emitRegisterJavaScriptProxy":{
                            try {
                                this.controller.registerJavaScriptProxy(this.testObj, "objName", ["testOne", "toString"]);
                                setTimeout(()=>{
                                    this.controller.refresh()
                                    setTimeout(()=>{
                                        this.controller.runJavaScript('htmlTest()',(error,result4)=>{
                                            if (error) {
                                                console.info(`run JavaScript error: ` + JSON.stringify(error))
                                                return;
                                            }
                                            if (result4) {
                                                console.info('result:' + result4)
                                            }
                                        })
                                    },3000)
                                },3000)
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                            }                                                               
                            break;
                        }
                        case "emitDeleteJavaScriptRegister":{
                            try {
                                this.controller.deleteJavaScriptRegister("objName");
                                this.controller.deleteJavaScriptRegister("objName");
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,14) 
                            }                                                               
                            break;
                        }
                        case "emitZoom":{
                            try {
                                this.controller.zoom(1);
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,15) 
                            }                                                               
                            break;
                        }
                        case "emitSearchAllAsync":{
                            try {
                                this.controller.loadUrl("file:///data/storage/el1/bundle/phone/resources/rawfile/index.html")
                                setTimeout(()=>{
                                    this.controller.searchAllAsync("首页"); 
                                },3000)  
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                            }                                                               
                            break;
                        }
                        case "emitClearMatches":{
                            try {
                                this.controllerTwo.clearMatches();
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,17) 
                            }                                                               
                            break;
                        }
                        case "emitSearchNext":{
                            try {
                                this.controllerTwo.searchNext(true);
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,18) 
                            }                                                               
                            break;
                        }
                        case "emitClearSslCache":{
                            try {
                                this.controllerTwo.clearSslCache();
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,19) 
                            }                                                               
                            break;
                        }
                        case "emitClearClientAuthenticationCache":{
                            try {
                                this.controllerTwo.clearClientAuthenticationCache();
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,20) 
                            }                                                               
                            break;
                        }
                        case "emitStop":{
                            try {
                                this.controllerTwo.stop();
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,21) 
                            }                                                               
                            break;
                        }
                        case "emitRequestFocus":{
                            try {
                                this.controllerTwo.requestFocus();
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,22) 
                            }                                                               
                            break;
                        }
                        case "emitZoomIn":{
                            try {
                                this.controllerTwo.zoomIn();
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,23) 
                            }                                                               
                            break;
                        }
                        case "emitZoomOut":{
                            try {
                                this.controllerTwo.zoomOut();
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,24) 
                            }                                                               
                            break;
                        }
                        case "emitGetWebId":{
                            try {
                                this.controllerTwo.requestFocus();
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,25) 
                            }                                                               
                            break;
                        }
                        case "emitGetUserAgent":{
                            try {
                                this.controllerTwo.requestFocus();
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,26) 
                            }                                                               
                            break;
                        }
                        case "emitGetPageHeigth":{
                            try {
                                this.controllerTwo.getPageHeight();
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,27) 
                            }                                                               
                            break;
                        }
                        case "emitBackOrForward":{
                            try {
                                this.controllerTwo.backOrForward(-2);
                            } catch (error) {
                                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,28) 
                            }                                                               
                            break;
                        }
                        case "emitStoreWebArchive":{   
                            try {
                                this.controller.storeWebArchive("/data/storage/el2/base/", true, (error, filename) => {
                                    if (error) {
                                        console.info(`save web archive error: ` + JSON.stringify(error))
                                        return;
                                    }
                                    if (filename != null) {
                                        Utils.emitEvent(filename,29) 
                                    }
                                });
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }                                                                                                                                          
                            break;
                        }
                        case "emitGetUrl":{   
                            try {
                                let url = this.controllerTwo.getUrl();
                                console.log("url: " + url);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                Utils.emitEvent(`${error.code}`,30) 
                            }                                                                                                                                         
                            break;
                        }
                        case "emitOnce":{   
                            try {
                                let re = web_webview.WebCookieManager.getCookie("https://www.huawei.com")
                                Utils.emitEvent(re, 31)
                                console.log("result: " + re);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`); 
                            }                                                                                                                                         
                            break;
                        }
                        case "emitGetItemAtIndex":{   
                            try {
                                let res = this.controller.getBackForwardEntries()
                                let item =res.getItemAtIndex(0)
                                 Utils.emitEvent(item.title, 32)
                                console.log("result: " + item.title);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`); 
                            }                                                                                                                                         
                            break;
                        }
                        case "emitSlideScroll":{   
                            try {
                                this.controller.slideScroll(10, 10);                               
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`); 
                            }
                            try {
                                let state = this.controller.serializeWebState();
                                let path = globalThis.AbilityContext.cacheDir;
                                path += '/WebState';
                                let fd = fileio.openSync(path, 0o2 | 0o100, 0o666);
                                fileio.writeSync(fd, state.buffer);
                                fileio.closeSync(fd);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            try {
                                let path = globalThis.AbilityContext.cacheDir;
                                path += '/WebState';
                                let fd = fileio.openSync(path, 0o002, 0o666);
                                let stat = fileio.fstatSync(fd);
                                let size = stat.size;
                                let buf = new ArrayBuffer(size);
                                fileio.read(fd, buf, (err, data) => {
                                if (data) {
                                    this.controller.restoreWebState(new Uint8Array(data.buffer));
                                }
                                fileio.closeSync(fd);
                                });
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            try {
                                this.ports = this.controller.createWebMessagePorts();
                                this.ports[1].onMessageEvent((msg) => {
                                if (typeof(msg) == "string") {
                                    console.log("received string message from html5, string is:" + msg);
                                } else if (typeof(msg) == "object") {
                                    if (msg instanceof ArrayBuffer) {
                                    console.log("received arraybuffer from html5, length is:" + msg.byteLength);
                                    } else {
                                    console.log("not support");
                                    }
                                } else {
                                    console.log("not support");
                                }
                                })
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }                                                                                                                                          
                            break;
                        }
                        case "emitContextMenuMediaType":{   
                            try {
                                let con = ContextMenuMediaType.Image
                                Utils.emitEvent(con, 33)
                                console.log("result: " + con);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`); 
                            }                                                                                                                                         
                            break;
                        }
                        case "emitContextMenuInputFieldType":{   
                            try {
                                 Utils.emitEvent(ContextMenuInputFieldType.PlainText, 34)
                                 Utils.emitEvent(ContextMenuInputFieldType.Telephone, 35)
                                 Utils.emitEvent(ContextMenuInputFieldType.Other, 36)
                                console.log("result: " + ContextMenuInputFieldType.PlainText);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`); 
                            }                                                                                                                                         
                            break;
                        }
                        case "emitContextMenuEditStateFlags":{   
                            try {
                                 Utils.emitEvent(ContextMenuEditStateFlags.NONE, 37)
                                 Utils.emitEvent(ContextMenuEditStateFlags.CAN_CUT, 38)
                                 Utils.emitEvent(ContextMenuEditStateFlags.CAN_COPY, 39)
                                 Utils.emitEvent(ContextMenuEditStateFlags.CAN_PASTE, 40)
                                 Utils.emitEvent(ContextMenuEditStateFlags.CAN_SELECT_ALL, 41)
                                console.log("result: " + ContextMenuEditStateFlags.CAN_SELECT_ALL);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`); 
                            }                                                                                                                                         
                            break;
                        }
                        case "emitGetStoredGeolocation":{  
                             try {
                                web_webview.GeolocationPermissions.allowGeolocation("file:///") 
                                web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                                if (error) {
                                    console.log('getStoredGeolocationAsync error: ' + JSON.stringify(error))
                                    return;
                                }
                                if (origins) {
                                    let origins_str: string = origins.join()
                                    console.log('getStoredGeolocationAsync origins: ' + origins_str);
                                    Utils.emitEvent(origins_str, 120);
                                }
                            });
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                            }                                                                                                                                     
                            break;
                        }
                        default:
                            console.info("can not match case")
                    }
                })
            }
            Web({src:"www.example.com",controller:this.controller})
            .mediaPlayGestureAccess(true)
            .javaScriptAccess(true)
            .zoomAccess(this.text)
            .onDataResubmitted((event) => {
                console.log('onDataResubmitted')
                event.handler.resend();
            })
            .onSearchResultReceive(ret=>{
                var searchResult = ret.activeMatchOrdinal.toString() + 
                ret.numberOfMatches.toString()
                console.log("searchResult" + searchResult)
                setTimeout(()=>{
                    Utils.emitEvent(searchResult,16) 
                },3000)
            })
             .onContextMenuShow((event) => {
                console.info(event.param.getMediaType() + event.param.getSelectionText() + event.param.getSourceType())
                console.info(event.param.getInputFieldType().toString())
                console.info(event.param.isEditable().toString())
                console.info(event.param.getEditStateFlags().toString())
                event.result.paste()
                event.result.cut()
                return true
            })
            .onHttpErrorReceive((event) => {
                event.response.setResponseIsReady(true)
            })
            .darkMode(this.mode)
            .forceDarkAccess(false)
            .webSerifFont('serif')
            .webFixedFont('fixed')
            .webSansSerifFont('serif')
            .minLogicalFontSize(1)
            .horizontalScrollBarAccess(true)
            .verticalScrollBarAccess(true)
            .onTouchIconUrlReceived((event) => {
                console.log('onTouchIconUrlReceived:' + JSON.stringify(event))
            })
            .pinchSmooth(true)
        }
    }
}