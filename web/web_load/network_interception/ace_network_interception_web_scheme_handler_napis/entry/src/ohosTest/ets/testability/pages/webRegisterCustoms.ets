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
const EVENT_ID_SET_EIMIT_KEY = 142700;

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
    @State isReceive: number = -1;
    @State isRequest: number = -1;
    
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
            eventId: EVENT_ID_SET_EIMIT_KEY,
            priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    }
    onPageHide() {
        events_emitter.off(EVENT_ID_SET_EIMIT_KEY)
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
                Button("webHostingButton123").key('webHostingButton').onClick(async () => {
                    await Utils.waitForExist(()=>this.isReceive, this.str, 1);
                    if (this.str != 'emitGetNativeAPI') {
                        await Utils.waitForExist(()=>testNapi.getRequestValue(), this.str, 1);
                    }
                    console.info("key==>" + this.str)
                    this.isReceive = -1;
                    switch (this.str) {
                        
                        case "emitGetNativeAPI": {

                            console.log("emitGetNativeAPI ==>");

                            let result:number = testNapi.getNativeAPI();

                            console.log("emitGetNativeAPI ==>" + result);
                            
                            if (result != 0) {
                                Utils.emitEvent(true, 142710);
                            } else {
                                Utils.emitEvent(false, 142710);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetUrl": {

                            console.log("emitWebResourceRequest_GetUrl ==>");

                            let result:number = testNapi.getUrl();

                            console.log("emitWebResourceRequest_GetUrl ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142720);
                            } else {
                                Utils.emitEvent(false, 142720);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetMethod": {

                            console.log("emitWebResourceRequest_GetMethod ==>");

                            let result:number = testNapi.getMethod();

                            console.log("emitWebResourceRequest_GetMethod ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142730);
                            } else {
                                Utils.emitEvent(false, 142730);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetHttpBodyStream": {

                            console.log("emitWebResourceRequest_GetHttpBodyStream ==>");

                            let result:number = testNapi.getHttpBodyStream();                            

                            console.log("emitWebResourceRequest_GetHttpBodyStream ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142740);
                            } else {
                                Utils.emitEvent(false, 142740);
                            }
                            break;
                        }
                        
                        case "emitWebRequestHeaderList_GetSize": {

                            console.log("emitWebRequestHeaderList_GetSize ==>");

                            let result:number = testNapi.getHeaderListSize();                            

                            console.log("emitWebRequestHeaderList_GetSize ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142750);
                            } else {
                                Utils.emitEvent(false, 142750);
                            }
                            break;
                        }
                        
                        case "emitWebRequestHeaderList_GetHeader": {

                            console.log("emitWebRequestHeaderList_GetHeader ==>");

                            let result:number = testNapi.getHeader();                            

                            console.log("emitWebRequestHeaderList_GetHeader ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142760);
                            } else {
                                Utils.emitEvent(false, 142760);
                            }
                            break;
                        }
                        
                        case "emitWebRequestHeaderList_Destroy": {

                            console.log("emitWebRequestHeaderList_Destroy ==>");

                            let result:number = testNapi.destroyHeaderList();                            

                            console.log("emitWebRequestHeaderList_Destroy ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142770);
                            } else {
                                Utils.emitEvent(false, 142770);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_HasGesture": {

                            console.log("emitWebResourceRequest_HasGesture ==>");

                            let result:number = testNapi.hasGesture();                            

                            console.log("emitWebResourceRequest_HasGesture ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142780);
                            } else {
                                Utils.emitEvent(false, 142780);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_IsMainFrame": {

                            console.log("emitWebResourceRequest_IsMainFrame ==>");

                            let result:number = testNapi.isMainFrame();                            

                            console.log("emitWebResourceRequest_IsMainFrame ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142790);
                            } else {
                                Utils.emitEvent(false, 142790);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_IsRedirect": {

                            console.log("emitWebResourceRequest_IsRedirect ==>");

                            let result:number = testNapi.isRedirect();                            

                            console.log("emitWebResourceRequest_IsRedirect ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142701);
                            } else {
                                Utils.emitEvent(false, 142701);
                            }
                            break;
                        }
                        
                        case "emitWebSchemeHandler_GetUserData": {

                            console.log("emitWebSchemeHandler_GetUserData ==>");

                            let result:number = testNapi.schemeHandlerGetUserData();                            

                            console.log("emitWebSchemeHandler_GetUserData ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142711);
                            } else {
                                Utils.emitEvent(false, 142711);
                            }
                            break;
                        }
                        
                        case "emitWebSchemeHandler_SetUserData": {

                            console.log("emitWebSchemeHandler_SetUserData ==>");

                            let result:number = testNapi.schemeHandlerSetUserData();                            

                            console.log("emitWebSchemeHandler_SetUserData ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142721);
                            } else {
                                Utils.emitEvent(false, 142721);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetReferrer": {

                            console.log("emitWebResourceRequest_GetReferrer ==>");

                            let result:number = testNapi.getRef();                            

                            console.log("emitWebResourceRequest_GetReferrer ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142731);
                            } else {
                                Utils.emitEvent(false, 142731);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_SetUserData": {

                            console.log("emitWebResourceRequest_SetUserData ==>");

                            let result:number = testNapi.resourceRequestSetUserData();                            

                            console.log("emitWebResourceRequest_SetUserData ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142741);
                            } else {
                                Utils.emitEvent(false, 142741);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetUserData": {

                            console.log("emitWebResourceRequest_GetUserData ==>");

                            let result:number = testNapi.resourceRequestGetUserData();                            

                            console.log("emitWebResourceRequest_GetUserData ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142751);
                            } else {
                                Utils.emitEvent(false, 142751);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_Destroy": {

                            console.log("emitWebResourceRequest_Destroy ==>");

                            let result:number = testNapi.resourceRequestDestroy();                            

                            console.log("emitWebResourceRequest_Destroy ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142761);
                            } else {
                                Utils.emitEvent(false, 142761);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetUrl": {

                            console.log("emitWebResponse_GetUrl ==>");

                            let result:number = testNapi.responseGetUrl();                            

                            console.log("emitWebResponse_GetUrl ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142771);
                            } else {
                                Utils.emitEvent(false, 142771);
                            }
                            break;
                        }

                        
                        case "emitWebResponse_GetStatus": {

                            console.log("emitWebResponse_GetStatus ==>");

                            let result:number = testNapi.responseGetStatus();                            

                            console.log("emitWebResponse_GetStatus ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142781);
                            } else {
                                Utils.emitEvent(false, 142781);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetStatusText": {

                            console.log("emitWebResponse_GetStatusText ==>");

                            let result:number = testNapi.responseGetStatusText();                            

                            console.log("emitWebResponse_GetStatusText ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142791);
                            } else {
                                Utils.emitEvent(false, 142791);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetMimeType": {

                            console.log("emitWebResponse_GetMimeType ==>");

                            let result:number = testNapi.responseGetMimeType();                            

                            console.log("emitWebResponse_GetMimeType ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142702);
                            } else {
                                Utils.emitEvent(false, 142702);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetCharset": {

                            console.log("emitWebResponse_GetCharset ==>");

                            let result:number = testNapi.responseGetCharset();                            

                            console.log("emitWebResponse_GetCharset ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142712);
                            } else {
                                Utils.emitEvent(false, 142712);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_GetHeaderByName": {

                            console.log("emitWebResponse_GetHeaderByName ==>");

                            let result:number = testNapi.responseGetHeaderByName();                            

                            console.log("emitWebResponse_GetHeaderByName ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142722);
                            } else {
                                Utils.emitEvent(false, 142722);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetUrl": {

                            console.log("emitWebResponse_SetUrl ==>");

                            let result:number = testNapi.responseSetUrl();                            

                            console.log("emitWebResponse_SetUrl ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142732);
                            } else {
                                Utils.emitEvent(false, 142732);
                            }
                            break;
                        }

                        
                        case "emitWebResponse_SetStatus": {

                            console.log("emitWebResponse_SetStatus ==>");

                            let result:number = testNapi.responseSetStatus();                            

                            console.log("emitWebResponse_SetStatus ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142742);
                            } else {
                                Utils.emitEvent(false, 142742);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetStatusText": {

                            console.log("emitWebResponse_SetStatusText ==>");

                            let result:number = testNapi.responseSetStatusText();                            

                            console.log("emitWebResponse_SetStatusText ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142752);
                            } else {
                                Utils.emitEvent(false, 142752);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetMimeType": {

                            console.log("emitWebResponse_SetMimeType ==>");

                            let result:number = testNapi.responseSetMimeType();                            

                            console.log("emitWebResponse_SetMimeType ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142762);
                            } else {
                                Utils.emitEvent(false, 142762);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetCharset": {

                            console.log("emitWebResponse_SetCharset ==>");

                            let result:number = testNapi.responseSetCharset();                            

                            console.log("emitWebResponse_SetCharset ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142772);
                            } else {
                                Utils.emitEvent(false, 142772);
                            }
                            break;
                        }
                        
                        case "emitWebResponse_SetHeaderByName": {

                            console.log("emitWebResponse_SetHeaderByName ==>");

                            let result:number = testNapi.responseSetHeaderByName();                            

                            console.log("emitWebResponse_SetHeaderByName ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142782);
                            } else {
                                Utils.emitEvent(false, 142782);
                            }
                            break;
                        }
                        
                        case "emitWeb_CreateResponse": {

                            console.log("emitWeb_CreateResponse ==>");

                            let result:number = testNapi.createResponse();                            

                            console.log("emitWeb_CreateResponse ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142792);
                            } else {
                                Utils.emitEvent(false, 142792);
                            }
                            break;
                        }

                        case "emitWebResourceRequest_GetResourceType": {

                            console.log("emitWebResourceRequest_GetResourceType ==>");

                            let result:number = testNapi.getResourceType();

                            console.log("emitWebResourceRequest_GetResourceType ==>" + result);

                            if (result == 0) {
                                Utils.emitEvent(true, 142703);
                            } else {
                                Utils.emitEvent(false, 142703);
                            }
                            break;
                        }

                        case "emitWebResourceRequest_GetFrameUrl": {

                            console.log("emitWebResourceRequest_GetFrameUrl ==>");

                            let result:number = testNapi.getFrameUrl();

                            console.log("emitWebResourceRequest_GetFrameUrl ==>" + result);

                            if (result == 0) {
                                Utils.emitEvent(true, 142713);
                            } else {
                                Utils.emitEvent(false, 142713);
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
