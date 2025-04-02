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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';

import testsuite from '../../test/List.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';

import testNapi from 'libentry.so';

@Entry
@Component
struct webRegisterCustomsComponent {
    
    controller: web_webview.WebviewController = new web_webview.WebviewController("scheme-handler");
    @State str: string = ""
    @State interceptUrl: string = ''
    heads: Header[] = new Array()
    @State consoleCorsError: boolean = false
    responseWeb: WebResourceResponse = new WebResourceResponse()
    @State consoleMsg: string = ''
    @State isRegister: number = -1;
    @State isSet: number = -1;
    
    aboutToAppear() {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        console.info('start run testcase!!!')
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
        console.error("ygz aboutToAppear registerCustomSchemes")
        this.isRegister = testNapi.registerCustomSchemes()
        web_webview.WebviewController.initializeWebEngine();
        this.isSet = testNapi.setSchemeHandler();
        
        console.error("ygz aboutToAppear setSchemeHandler" + this.isSet)
        console.error("aboutToAppear registerCustomSchemes End")
        
    }
    
    onPageShow(){
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
                Button("webHostingButton123").key('webHostingButton').onClick(async () => {
                    console.info("key==>" + this.str)
                    switch (this.str) {
                        case "emitRegisterCustoms": {
                            await Utils.sleep(1000);
                            
                            console.log("emitRegisterCustoms ==>" + this.isRegister);
                            
                            if (this.isRegister == 0) {
                                Utils.emitEvent(true, 7707);
                            } else {
                                Utils.emitEvent(false, 7707);
                            }
                            break;
                        }
                        
                        case "emitSetSchemeHandler": {
                            await Utils.sleep(1000);
                            
                            console.log("emitSetSchemeHandler ==>" + this.isSet);
                            
                            if (this.isSet == 0) {
                                Utils.emitEvent(true, 7708);
                            } else {
                                Utils.emitEvent(false, 7708);
                            }
                            break;
                        }
                        
                        case "emitClearSchemeHandlers": {
                            await Utils.sleep(1000);
                            
                            let result:number = testNapi.clearSchemeHandlers();
                            
                            console.log("emitClearSchemeHandlers ==>" + result);
                            
                            await Utils.sleep(1000);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7709);
                            } else {
                                Utils.emitEvent(false, 7709);
                            }
                            break;
                        }
                        
                        case "emitServiceWorkerClearSchemeHandlers": {
                            await Utils.sleep(1000);
                            
                            let result:number = testNapi.serviceWorkerClearSchemeHandlers();
                            await Utils.sleep(1000);                            
                            console.log("emitServiceWorkerClearSchemeHandlers ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7710);
                            } else {
                                Utils.emitEvent(false, 7710);
                            }
                            break;
                        }
                        
                        case "emitDestroySchemeHandler": {
                            await Utils.sleep(1000);
                            
                            let result:number = testNapi.destroySchemeHandler();                            
                            await Utils.sleep(1000);                            
                            console.log("emitDestroySchemeHandler ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7711);
                            } else {
                                Utils.emitEvent(false, 7711);
                            }
                            break;
                        }
                        
                        case "emitGetNativeAPI": {
                            await Utils.sleep(1000);       
                            console.log("emitGetNativeAPI ==>");
                            
                            let result:number = testNapi.getNativeAPI();                            
                            await Utils.sleep(1000);                            
                            console.log("emitGetNativeAPI ==>" + result);
                            
                            if (result != 0) {
                                Utils.emitEvent(true, 7712);
                            } else {
                                Utils.emitEvent(false, 7712);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetUrl": {
                            await Utils.sleep(1000);     
                            console.log("emitWebResourceRequest_GetUrl ==>");
                            
                            let result:number = testNapi.getUrl();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResourceRequest_GetUrl ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7713);
                            } else {
                                Utils.emitEvent(false, 7713);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetMethod": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResourceRequest_GetMethod ==>");
                            
                            let result:number = testNapi.getMethod();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResourceRequest_GetMethod ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7714);
                            } else {
                                Utils.emitEvent(false, 7714);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetHttpBodyStream": {
                            await Utils.sleep(1000);
                            console.log("emitWebResourceRequest_GetHttpBodyStream ==>");
                            
                            let result:number = testNapi.getHttpBodyStream();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResourceRequest_GetHttpBodyStream ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7715);
                            } else {
                                Utils.emitEvent(false, 7715);
                            }
                            break;
                        }
                        
                        case "emitWebRequestHeaderList_GetSize": {
                            await Utils.sleep(1000);  
                            console.log("emitWebRequestHeaderList_GetSize ==>");
                            
                            let result:number = testNapi.getHeaderListSize();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebRequestHeaderList_GetSize ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7716);
                            } else {
                                Utils.emitEvent(false, 7716);
                            }
                            break;
                        }
                        
                        case "emitWebRequestHeaderList_GetHeader": {
                            await Utils.sleep(1000);
                            console.log("emitWebRequestHeaderList_GetHeader ==>");
                            
                            let result:number = testNapi.getHeader();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebRequestHeaderList_GetHeader ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7717);
                            } else {
                                Utils.emitEvent(false, 7717);
                            }
                            break;
                        }
                        
                        case "emitWebRequestHeaderList_Destroy": {
                            await Utils.sleep(1000);  
                            console.log("emitWebRequestHeaderList_Destroy ==>");
                            
                            let result:number = testNapi.destroyHeaderList();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebRequestHeaderList_Destroy ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7718);
                            } else {
                                Utils.emitEvent(false, 7718);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_HasGesture": {
                            await Utils.sleep(1000);
                            console.log("emitWebResourceRequest_HasGesture ==>");
                            
                            let result:number = testNapi.hasGesture();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResourceRequest_HasGesture ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7719);
                            } else {
                                Utils.emitEvent(false, 7719);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_IsMainFrame": {
                            await Utils.sleep(1000);
                            console.log("emitWebResourceRequest_IsMainFrame ==>");
                            
                            let result:number = testNapi.isMainFrame();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResourceRequest_IsMainFrame ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7720);
                            } else {
                                Utils.emitEvent(false, 7720);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_IsRedirect": {
                            await Utils.sleep(1000);
                            console.log("emitWebResourceRequest_IsRedirect ==>");
                            
                            let result:number = testNapi.isRedirect();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResourceRequest_IsRedirect ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7721);
                            } else {
                                Utils.emitEvent(false, 7721);
                            }
                            break;
                        }
                        
                        case "emitWebSchemeHandler_GetUserData": {
                            await Utils.sleep(1000);  
                            console.log("emitWebSchemeHandler_GetUserData ==>");
                            
                            let result:number = testNapi.schemeHandlerGetUserData();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebSchemeHandler_GetUserData ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7722);
                            } else {
                                Utils.emitEvent(false, 7722);
                            }
                            break;
                        }
                        
                        case "emitWebSchemeHandler_SetUserData": {
                            await Utils.sleep(1000);  
                            console.log("emitWebSchemeHandler_SetUserData ==>");
                            
                            let result:number = testNapi.schemeHandlerSetUserData();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebSchemeHandler_SetUserData ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7723);
                            } else {
                                Utils.emitEvent(false, 7723);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetReferrer": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResourceRequest_GetReferrer ==>");
                            
                            let result:number = testNapi.getRef();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResourceRequest_GetReferrer ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7724);
                            } else {
                                Utils.emitEvent(false, 7724);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_SetUserData": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResourceRequest_SetUserData ==>");
                            
                            let result:number = testNapi.resourceRequestSetUserData();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResourceRequest_SetUserData ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7725);
                            } else {
                                Utils.emitEvent(false, 7725);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetUserData": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResourceRequest_GetUserData ==>");
                            
                            let result:number = testNapi.resourceRequestGetUserData();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResourceRequest_GetUserData ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7726);
                            } else {
                                Utils.emitEvent(false, 7726);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_Destroy": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResourceRequest_Destroy ==>");
                            
                            let result:number = testNapi.resourceRequestDestroy();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResourceRequest_Destroy ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7727);
                            } else {
                                Utils.emitEvent(false, 7727);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetUrl": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_GetUrl ==>");
                            
                            let result:number = testNapi.responseGetUrl();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_GetUrl ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7728);
                            } else {
                                Utils.emitEvent(false, 7728);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetError": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_GetError ==>");
                            
                            let result:number = testNapi.responseGetError();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_GetError ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7729);
                            } else {
                                Utils.emitEvent(false, 7729);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetStatus": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_GetStatus ==>");
                            
                            let result:number = testNapi.responseGetStatus();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_GetStatus ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7730);
                            } else {
                                Utils.emitEvent(false, 7730);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetStatusText": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_GetStatusText ==>");
                            
                            let result:number = testNapi.responseGetStatusText();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_GetStatusText ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7731);
                            } else {
                                Utils.emitEvent(false, 7731);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetMimeType": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_GetMimeType ==>");
                            
                            let result:number = testNapi.responseGetMimeType();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_GetMimeType ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7732);
                            } else {
                                Utils.emitEvent(false, 7732);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetCharset": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_GetCharset ==>");
                            
                            let result:number = testNapi.responseGetCharset();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_GetCharset ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7733);
                            } else {
                                Utils.emitEvent(false, 7733);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetHeaderByName": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_GetHeaderByName ==>");
                            
                            let result:number = testNapi.responseGetHeaderByName();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_GetHeaderByName ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7734);
                            } else {
                                Utils.emitEvent(false, 7734);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetUrl": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_SetUrl ==>");
                            
                            let result:number = testNapi.responseSetUrl();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_SetUrl ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7735);
                            } else {
                                Utils.emitEvent(false, 7735);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetError": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_SetError ==>");
                            
                            let result:number = testNapi.responseSetError();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_SetError ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7736);
                            } else {
                                Utils.emitEvent(false, 7736);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetStatus": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_SetStatus ==>");
                            
                            let result:number = testNapi.responseSetStatus();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_SetStatus ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7737);
                            } else {
                                Utils.emitEvent(false, 7737);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetStatusText": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_SetStatusText ==>");
                            
                            let result:number = testNapi.responseSetStatusText();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_SetStatusText ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7738);
                            } else {
                                Utils.emitEvent(false, 7738);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetMimeType": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_SetMimeType ==>");
                            
                            let result:number = testNapi.responseSetMimeType();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_SetMimeType ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7739);
                            } else {
                                Utils.emitEvent(false, 7739);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetCharset": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_SetCharset ==>");
                            
                            let result:number = testNapi.responseSetCharset();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_SetCharset ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7740);
                            } else {
                                Utils.emitEvent(false, 7740);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetHeaderByName": {
                            await Utils.sleep(1000);  
                            console.log("emitWebResponse_SetHeaderByName ==>");
                            
                            let result:number = testNapi.responseSetHeaderByName();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWebResponse_SetHeaderByName ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7741);
                            } else {
                                Utils.emitEvent(false, 7741);
                            }
                            break;
                        }
                        
                        case "emitWeb_CreateResponse": {
                            await Utils.sleep(1000);  
                            console.log("emitWeb_CreateResponse ==>");
                            
                            let result:number = testNapi.createResponse();                            
                            await Utils.sleep(1000);                            
                            console.log("emitWeb_CreateResponse ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7742);
                            } else {
                                Utils.emitEvent(false, 7742);
                            }
                            break;
                        }

                        case "emitWebResourceRequest_GetResourceType": {
                            await Utils.sleep(1000);
                            console.log("emitWebResourceRequest_GetResourceType ==>");

                            let result:number = testNapi.getResourceType();
                            await Utils.sleep(1000);
                            console.log("emitWebResourceRequest_GetResourceType ==>" + result);

                            if (result == 0) {
                                Utils.emitEvent(true, 7743);
                            } else {
                                Utils.emitEvent(false, 7743);
                            }
                            break;
                        }

                        case "emitWebResourceRequest_GetFrameUrl": {
                            await Utils.sleep(1000);
                            console.log("emitWebResourceRequest_GetFrameUrl ==>");

                            let result:number = testNapi.getFrameUrl();
                            await Utils.sleep(1000);
                            console.log("emitWebResourceRequest_GetFrameUrl ==>" + result);

                            if (result == 0) {
                                Utils.emitEvent(true, 7744);
                            } else {
                                Utils.emitEvent(false, 7744);
                            }
                            break;
                        }
                        
                    }
                })
            }
            Web({ src: $rawfile('index.html'), controller: this.controller })
                .height('50%')
                .width('100%')
                .javaScriptAccess(true)
                .fileAccess(true)
        }
        .height('100%')
    }    
}
