/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import image from "@ohos.multimedia.image"
import business_error from '@ohos.base'
let loadedUrl;

class testObj {
  constructor() {
  }

  test(str: string): ArrayBuffer {
    let buf = new ArrayBuffer(str.length);
    let buff = new Uint8Array(buf);

    for (let i = 0; i < str.length; i++) {
      buff[i] = str.charCodeAt(i);
    }
    return buf;
  }
}

@Entry
@Component
struct Index {
    controller: web_webview.WebviewController = new web_webview.WebviewController();
    controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
    controllerThree: web_webview.WebviewController = new web_webview.WebviewController();
    delegate: web_webview.WebDownloadDelegate = new web_webview.WebDownloadDelegate();
    failedDownload: Uint8Array;
    @State str:string="emitGetWebId";
    @State webId:number=0;
    @State webId2:number=0;
    @State webId3:number=0;
    @State webIdTol:number=0;
    @State userAgent:string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
    @State userAgent2:string = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " Chrome/86.0.4240.198 Safari/537.36";
    @State userAgentAll:string = "";
    @State userAgentCheck:string = "";
    @State pageResult:boolean=false;
    @State pageResult2:boolean=false;
    @State indexUrl:string = "//rawfile/indexCopy.html";
    @State indexUrlTwo:string = "//rawfile/indexTwo.html";
    @State indexUrlAll:string = "//rawfile/indexCopy.html";
    @State pixelmap: image.PixelMap = undefined;
    @State javaScriptAccess:boolean=true;
    @State fileAccess:boolean=true;
    @State domStorageAccess:boolean=false;
    @State imageAccess:boolean=true;
    @State onlineImageAccess:boolean=true;
    @State databaseAccess:boolean=true;
    @State checkEleResult: Object = {};
    @State checkEleResultAgain: Object = {};
    @State checkEleResult1: Object = {};
    @State checkEleResult2: Object = {};
    @State checkEleResult3: Object = {};
    @State cookieResult:string = "";
    @State testObjtest: testObj = new testObj();
    onPageShow(){
        let valueChangeEvent={
            eventId:10,
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
    private jsObj={
        test:(res)=>{
            Utils.emitEvent(res,102);
        },
        toString:(str)=>{
            console.info("ets toString:"+String(str));
        },
        register:(res)=>{
            Utils.emitEvent(res,86);
            return "web222"
        }
    }
    aboutToAppear(){
        let abilityDelegator: any
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let abilityDelegatorArguments: any
        abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        console.info('start run testcase!!!')
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    }
    build(){
        Column(){
            Row() {
                Button("web click").key('webcomponent').onClick(async () => {
                    console.info("key==>" + this.str)
                    switch (this.str) {
                        case "emitGetWebId": {
                            try {
                                this.webId = this.controller.getWebId();
                                this.webId2 = this.controllerTwo.getWebId();
                                this.webId3 = this.controllerThree.getWebId();
                                console.log("id: " + this.webId + this.webId2 + this.webId);
                                this.webIdTol = this.webId + this.webId2 + this.webId3;
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.webIdTol, 100)
                            })
                            break;
                        }
                        case "emitFetchCookieSync": {
                            try {
                                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                                    if (error) {
                                        console.log("error: " + JSON.stringify(error));
                                    }
                                })
                                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                                console.log("fetchCookieSync cookie = " + this.cookieResult);
                                Utils.emitEvent(this.cookieResult, 126)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitFetchCookieCallback": {
                            try {
                                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=c", (error) => {
                                    if (error) {
                                        console.log("error: " + JSON.stringify(error));
                                    }
                                })
                                web_webview.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                                    if (error) {
                                        console.log('error: ' + JSON.stringify(error));
                                        return;
                                    }
                                    if (cookie) {
                                        console.log('fetchCookie cookie = ' + cookie);
                                        Utils.emitEvent(cookie, 128)
                                    }
                                })
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitFetchCookiePromise": {
                            try {
                                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=d", (error) => {
                                    if (error) {
                                        console.log("error: " + JSON.stringify(error));
                                    }
                                })
                                web_webview.WebCookieManager.fetchCookie('https://www.example.com')
                                .then(cookie => {
                                    console.log("emitFetchCookiePromise cookie = " + cookie);
                                    Utils.emitEvent(cookie, 130)
                                })
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitConfigCookieSync": {
                            try {
                                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=e');
                                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                                console.log("emitConfigCookieSync cookie = " + this.cookieResult);
                                Utils.emitEvent(this.cookieResult, 132)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitConfigCookieCallback": {
                            try {
                                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=f", (error) => {
                                    if (error) {
                                        console.log("error: " + JSON.stringify(error));
                                    }
                                })
                                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                                console.log("emitConfigCookieCallback cookie = " + this.cookieResult);
                                Utils.emitEvent(this.cookieResult, 134)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitConfigCookiePromise": {
                            try {
                                web_webview.WebCookieManager.configCookie('https://www.example.com', 'a=g')
                                .then(() => {
                                    console.log('configCookie success!');
                                })
                                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                                console.log("emitConfigCookiePromise cookie = " + this.cookieResult);
                                Utils.emitEvent(this.cookieResult, 136)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitClearAllCookiesSync": {
                            try {
                                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                                web_webview.WebCookieManager.clearAllCookiesSync();
                                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                                console.log("emitClearAllCookiesSync cookie = " + this.cookieResult);
                                Utils.emitEvent(this.cookieResult, 138)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitClearAllCookiesCallback": {
                            try {
                                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                                web_webview.WebCookieManager.clearAllCookies((error) => {
                                if (error) {
                                    console.log("error: " + error);
                                    }
                                })
                                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                                console.log("emitClearAllCookiesCallback cookie = " + this.cookieResult);
                                Utils.emitEvent(this.cookieResult, 140)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitClearAllCookiesPromise": {
                            try {
                                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                                web_webview.WebCookieManager.clearAllCookies()
                                    .then(() => {
                                        console.log("clearAllCookies success!");
                                    })
                                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                                console.log("emitClearAllCookiesPromise cookie = " + this.cookieResult);
                                Utils.emitEvent(this.cookieResult, 142)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitClearSessionCookieSync": {
                            try {
                                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                                web_webview.WebCookieManager.clearSessionCookieSync();
                                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                                console.log("emitClearSessionCookieSync cookie = " + this.cookieResult);
                                Utils.emitEvent(this.cookieResult, 144)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitClearSessionCookieCallback": {
                            try {
                                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                                web_webview.WebCookieManager.clearSessionCookie((error) => {
                                if (error) {
                                    console.log("error: " + error);
                                    }
                                })
                                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                                console.log("emitClearSessionCookieCallback cookie = " + this.cookieResult);
                                Utils.emitEvent(this.cookieResult, 146)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitClearSessionCookiePromise": {
                            try {
                                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                                web_webview.WebCookieManager.clearSessionCookie()
                                    .then(() => {
                                        console.log("clearSessionCookie success!");
                                    })
                                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                                console.log("emitClearSessionCookiePromise cookie = " + this.cookieResult);
                                Utils.emitEvent(this.cookieResult, 148)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitPostUrl": {
                            try {
                                let postData = this.testObjtest.test("Name=test&Password=test");
                                this.controller.postUrl('www.example.com', postData);
                                let url = this.controller.getUrl();
                                console.log("emitPostUrl: " + url);
                                Utils.emitEvent(url, 150)
                            } catch (error) {
                                let e: business_error.BusinessError = error as business_error.BusinessError;
                                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            }
                            break;
                        }
                        case "emitUseless": {
                            try {
                                web_webview.WebviewController.setConnectionTimeout(5);
                                this.delegate.onBeforeDownload((webDownloadItem: web_webview.WebDownloadItem) => {
                                console.log("will start a download， method:" + webDownloadItem.getMethod());
                                console.log("will start a download， mime type:" + webDownloadItem.getMimeType());
                                console.log("will start a download, suggest name:" + webDownloadItem.getSuggestedFileName());
                                })
                                this.delegate.onDownloadUpdated((webDownloadItem: web_webview.WebDownloadItem) => {
                                console.log("download update guid: " + webDownloadItem.getGuid());
                                console.log("download update percent complete: " + webDownloadItem.getPercentComplete());
                                console.log("download update current speed: " + webDownloadItem.getCurrentSpeed());
                                console.log("download update total bytes: " + webDownloadItem.getTotalBytes());
                                console.log("download error code: " + webDownloadItem.getLastErrorCode());
                                console.log("download update received bytes: " + webDownloadItem.getReceivedBytes());
                                console.log("download finish full path: " + webDownloadItem.getFullPath());
                                })
                                this.delegate.onDownloadFailed((webDownloadItem: web_webview.WebDownloadItem) => {
                                this.failedDownload = webDownloadItem.serialize();
                                })
                                this.delegate.onDownloadFinish((webDownloadItem: web_webview.WebDownloadItem) => {
                                console.log("download finish guid: " + webDownloadItem.getGuid());
                                })
                                web_webview.WebDownloadManager.resumeDownload(web_webview.WebDownloadItem.deserialize(this.failedDownload));
                                Utils.emitEvent(true, 152)
                                
                            } catch (error) {
                                let e:business_error.BusinessError = error as business_error.BusinessError;
                                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            }
                            break;
                        }
                        case "emitgetUserAgent": {
                            try {
                                this.controller.loadUrl($rawfile('indexCopy.html'));
                                this.userAgent = this.controller.getUserAgent();
                                console.log("userAgent: " + this.userAgent);
                                this.userAgent2 = this.controllerTwo.getUserAgent();
                                console.log("userAgent2: " + this.userAgent2);
                                this.userAgentAll = this.userAgent + this.userAgent2;
                                console.log("userAgentAll: " + this.userAgentAll);
                                if ((this.userAgentAll).includes("Mozilla")) {
                                    this.userAgentAll = 'success'
                                }
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.userAgentAll, 1020)
                            })
                            break;
                        }
                        case "emitgetUserAgentAgain": {
                            try {
                                this.userAgentCheck = this.controllerThree.getUserAgent();
                                console.log("userAgentCheck: " + this.userAgentCheck);
                                this.controllerThree.runJavaScript("getUserAgent()",(error, result) => {
                                    this.userAgentCheck = result
                                    console.log(`The controllerThree.getUserAgent() return value is: ${result}`);
                                })
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                if ((this.userAgentCheck).includes("Mozilla")) {
                                    this.userAgentCheck = 'success'
                                }
                                Utils.emitEvent(this.userAgentCheck, 104)
                            })
                            break;
                        }
                        case "emitpageDown": {
                            try {
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResult = JSON.parse(result)
                                    console.log(`The checkVIsible() return value is: ${result}`);
                                })                                
                                this.controller.pageDown(false);
                                await Utils.sleep(1000)
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResultAgain = JSON.parse(result)
                                    console.log(`The checkVIsible() again return value is: ${result}`);
                                    if (this.checkEleResult[3] < JSON.parse(result)[3] && JSON.parse(result)[3] <
                                    (JSON.parse(result)[1]/2)) {
                                        this.pageResult = true;
                                        console.log('emitpageDown result is :' + this.pageResult);
                                    }else {
                                        this.pageResult = false;
                                        console.log('emitpageDown result is :' + this.pageResult);
                                    }
                                })                                   
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.pageResult = false;
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.pageResult, 106)
                            })
                            break;
                        }
                        case "emitpageUp": {
                            try {
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResult = JSON.parse(result)
                                    console.log(`The checkVIsible() return value is: ${result}`);
                                })                               
                                this.controller.pageUp(false);
                                await Utils.sleep(1000)
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResultAgain = JSON.parse(result)
                                    console.log(`The checkVIsible() again return value is: ${result}`);
                                    if (JSON.parse(result)[3] == 0 && this.checkEleResult[3] >
                                    (JSON.parse(result)[1]/4)) {
                                        this.pageResult = true;
                                        console.log('emitpageUp result is :' + this.pageResult);
                                    }else {
                                        this.pageResult = false;
                                        console.log('emitpageUp result is :' + this.pageResult);
                                    }
                                })                                 
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.pageResult = false;
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.pageResult, 108)
                            })
                            break;
                        }
                        case "emitpageDownAgain": {
                            try {
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResult = JSON.parse(result)
                                    console.log(`The checkVIsible() return value is: ${result}`);
                                })                               
                                this.controller.pageDown(true);
                                await Utils.sleep(1000)
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResultAgain = JSON.parse(result)
                                    console.log(`The checkVIsible() again return value is: ${result}`);
                                    if ((JSON.parse(result)[1]/2) < JSON.parse(result)[3] && JSON.parse(result)[3] <
                                    JSON.parse(result)[1]) {
                                        this.pageResult = true;
                                        console.log('emitpageDownAgain result is :' + this.pageResult);
                                    }else {
                                        this.pageResult = false;
                                        console.log('emitpageDownAgain result is :' + this.pageResult);
                                    }
                                })                                   
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.pageResult = false;
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.pageResult, 110)
                            })
                            break;
                        }
                        case "emitpageUpAgain": {
                            try {
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResult = JSON.parse(result)
                                    console.log(`The checkVIsible() return value is: ${result}`);
                                })                                
                                this.controller.pageUp(true);
                                await Utils.sleep(1000)
                                this.controller.runJavaScript("checkVIsible()",(error, result) => {
                                    this.checkEleResultAgain = JSON.parse(result)
                                    console.log(`The checkVIsible() again return value is: ${result}`);
                                    if (JSON.parse(result)[3] == 0 && this.checkEleResult[3] > (JSON.parse(result)[1]/2)) {
                                        this.pageResult = true;
                                        console.log('emitpageUpAgain result is :' + this.pageResult);
                                    }else {
                                        this.pageResult = false;
                                        console.log('emitpageUpAgain result is :' + this.pageResult);
                                    }
                                })                                  
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.pageResult = false;
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.pageResult, 112)
                            })
                            break;
                        }
                        case "emitGetFavicon": {
                            try {
                                this.controller.loadUrl($rawfile('indexCopy.html'))
                                this.pixelmap = this.controller.getFavicon();
                                this.pixelmap.getImageInfo().then(imageInfo => {
                                    if (imageInfo == undefined) {
                                        console.error("Failed to obtain the image pixel map information.");
                                    }
                                    console.log("the result of pixelmap: " + JSON.stringify(imageInfo));
                                    Utils.emitEvent(Object.getOwnPropertyNames(imageInfo).length, 114)
                                })
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                Utils.emitEvent(this.pixelmap, 114)
                            }
                            break;
                        }
                        case "emitGetFaviconAgain": {
                            try {
                                this.controller.loadUrl($rawfile('secondCopy.html'))
                                await Utils.sleep(1000)
                                this.pixelmap = this.controller.getFavicon();
                                this.pixelmap.getImageInfo().then(imageInfo => {
                                    if (imageInfo == undefined) {
                                        console.error("Failed to obtain the image pixel map information.");
                                    }
                                    console.log("the result of pixelmap: " + JSON.stringify(imageInfo));
                                    if (Object.getOwnPropertyNames(imageInfo).length > 1) {
                                        Utils.emitEvent(true, 116)
                                    }
                                })
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                        case "emitGetOriginalUrl": {
                            try {
                                this.controller.loadUrl($rawfile('secondCopy.html'))
                                let indexUrl = this.controller.getOriginalUrl();
                                console.log("original url: " + this.indexUrl);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.indexUrl, 118)
                            })
                            break;
                        }
                        case "emitGetOriginalUrlTwo": {
                            try {
                                this.controller.loadUrl($rawfile('secondCopy.html'))
                                let indexUrl = this.controller.getOriginalUrl();
                                console.log("original url: " + this.indexUrl);
                                this.controllerTwo.loadUrl($rawfile('secondCopy.html'))
                                let indexUrlTwo = this.controller.getOriginalUrl();
                                console.log("original urlTwo: " + this.indexUrlTwo);
                                this.indexUrlAll = this.indexUrl + this.indexUrlTwo;
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.indexUrlAll, 120)
                            })
                            break;
                        }
                        case "emitSetNetworkAvailable": {
                            try {
                                this.controller.loadUrl($rawfile('indexCopy.html'))
                                this.controller.setNetworkAvailable(false);
                                await Utils.sleep(3000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("getNavigatorOnLine()",(error,result) => {
                                if (error) {
                                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                                    return;
                                }
                                if (result) {
                                    console.log("result:"+result+JSON.stringify(result))
                                    let pageResult2 = result;
                                    console.log("the status of navigator.onLine: " + this.pageResult2 + result);
                                }
                                Utils.emitEvent(this.pageResult2, 122)
                            })
                            break;
                        }
                        case "emitSetNetworkAvailableAgain": {
                            try {
                                this.controller.loadUrl($rawfile('indexCopy.html'))
                                this.controller.setNetworkAvailable(true);
                                await Utils.sleep(3000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("getNavigatorOnLine()",(error,result) => {
                                if (error) {
                                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                                    return;
                                }
                                if (result) {
                                    console.log("result:"+result+JSON.stringify(result))
                                    let pageResult = result;
                                    console.log("the status of navigator.onLine: " + this.pageResult + result);
                                }
                                Utils.emitEvent(this.pageResult, 124)
                            })
                            break;
                        }
                    }
                })
            }
            Web({src:$rawfile('indexCopy.html'),controller:this.controller})
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .userAgent(this.userAgent)
            .overScrollMode(OverScrollMode.NEVER)

            Web({src:$rawfile('indexTwo.html'),controller:this.controllerTwo}).id('2').key('web2')
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .userAgent(this.userAgent2)

            Web({src:$rawfile('indexThree.html'),controller:this.controllerThree}).id('3').key('web3')
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .userAgent(this.userAgentAll)
            .userAgent(this.userAgent)
            .userAgent(this.userAgent2)
        }
    }
}