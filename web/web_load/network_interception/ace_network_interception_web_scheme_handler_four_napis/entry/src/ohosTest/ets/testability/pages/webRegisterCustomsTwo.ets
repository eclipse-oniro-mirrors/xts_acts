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
const EVENT_ID_SET_EIMIT_KEY = 142600;

@Entry
@Component
struct webRegisterCustomsTwoComponent {
    
    controller: web_webview.WebviewController = new web_webview.WebviewController("scheme-handler");
    @State str: string = ""
    heads: Header[] = new Array()
    @State consoleCorsError: boolean = false
    @State isReceive: number = -1;
    @State isPageEnd: number = -1;
    responseWeb: WebResourceResponse = new WebResourceResponse()
    
    aboutToAppear() {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        console.info('start run testcase!!!')
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
        console.error("aboutToAppear registerCustomSchemes")
        testNapi.registerCustomSchemes()
        web_webview.WebviewController.initializeWebEngine();
        testNapi.setSchemeHandler();
        
        console.error("aboutToAppear setSchemeHandler")
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
                    await Utils.waitForExist(()=>this.isPageEnd, this.str, 1);
                    console.info("key==>" + this.str)
                    this.isReceive = -1;
                    switch (this.str) {
                        
                        case "emitWebSchemeHandler_SetOnRequestStart": {

                            let result:number = testNapi.schemeHandlerSetOnRequestStart();

                            
                            console.log("emitWebSchemeHandler_SetOnRequestStart ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142610);
                            } else {
                                Utils.emitEvent(false, 142610);
                            }
                            break;
                        }
                        
                        case "emitWebSchemeHandler_SetOnRequestStop": {

                            let result:number = testNapi.schemeHandlerSetOnRequestStop();

                            console.log("emitWebSchemeHandler_SetOnRequestStop ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142620);
                            } else {
                                Utils.emitEvent(false, 142620);
                            }
                            break;
                        }
                        
                        case "emitWeb_ReleaseByteArray": {

                            let result:number = testNapi.releaseByteArray();

                            
                            console.log("emitWeb_ReleaseByteArray ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142630);
                            } else {
                                Utils.emitEvent(false, 142630);
                            }
                            break;
                        }
                        
                        case "emitWeb_ReleaseString": {

                            let result:number = testNapi.releaseString();

                            
                            console.log("emitWeb_ReleaseString ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142640);
                            } else {
                                Utils.emitEvent(false, 142640);
                            }
                            break;
                        }
                        
                        case "emitWeb_DestroyResponse": {

                            let result:number = testNapi.destroyResponse();

                            
                            console.log("emitWeb_DestroyResponse ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142650);
                            } else {
                                Utils.emitEvent(false, 142650);
                            }
                            break;
                        }
                        
                        case "emitWeb_CreateSchemeHandler": {

                            let result:number = testNapi.createSchemeHandler();

                            
                            console.log("emitWeb_CreateSchemeHandler ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142660);
                            } else {
                                Utils.emitEvent(false, 142660);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetRequestHeaders": {

                            this.controller.runJavaScript("testxhr('custom://www.example.com/xhr/normal/')", (error, result)=> {
                                if (error) {
                                    console.info(" run JavaScript testError error:" + JSON.stringify(error));
                                    return;
                                }
                                if (result) {
                                    console.info(" run JavaScript testError return value is:" + result);
                                }
                            })

                            await Utils.waitForExist(()=>testNapi.getRequestValue(), this.str, 1);
                            let result:number = testNapi.resourceRequestGetRequestHeaders();

                            console.log("emitWebResourceRequest_GetRequestHeaders ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 142670);
                            } else {
                                Utils.emitEvent(false, 142670);
                            }
                            break;
                        }
                        
                        case "emitWebHttpBodyStream_GetUserData": {

                            let result:number = testNapi.httpBodyStreamGetUserData();

                            console.log("emitWebHttpBodyStream_GetUserData ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7764);
                            } else {
                                Utils.emitEvent(false, 7764);
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
                .onPageEnd(() => {
                    this.isPageEnd = 1;
                })
        }
        .height('100%')
        
    }
    
}
