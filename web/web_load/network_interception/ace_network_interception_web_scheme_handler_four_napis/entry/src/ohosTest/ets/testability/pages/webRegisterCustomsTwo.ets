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
struct webRegisterCustomsTwoComponent {
    
    controller: web_webview.WebviewController = new web_webview.WebviewController("scheme-handler");
    @State str: string = ""
    heads: Header[] = new Array()
    @State consoleCorsError: boolean = false
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
                        
                        case "emitWebSchemeHandler_SetOnRequestStart": {
                            await Utils.sleep(1000);
                            let result:number = testNapi.schemeHandlerSetOnRequestStart();
                            await Utils.sleep(1000);
                            
                            console.log("emitWebSchemeHandler_SetOnRequestStart ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7757);
                            } else {
                                Utils.emitEvent(false, 7757);
                            }
                            break;
                        }
                        
                        case "emitWebSchemeHandler_SetOnRequestStop": {
                            await Utils.sleep(1000);
                            let result:number = testNapi.schemeHandlerSetOnRequestStop();
                            await Utils.sleep(1000);
                            
                            console.log("emitWebSchemeHandler_SetOnRequestStop ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7758);
                            } else {
                                Utils.emitEvent(false, 7758);
                            }
                            break;
                        }
                        
                        case "emitWeb_ReleaseByteArray": {
                            await Utils.sleep(1000);
                            let result:number = testNapi.releaseByteArray();
                            await Utils.sleep(1000);
                            
                            console.log("emitWeb_ReleaseByteArray ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7759);
                            } else {
                                Utils.emitEvent(false, 7759);
                            }
                            break;
                        }
                        
                        case "emitWeb_ReleaseString": {
                            await Utils.sleep(1000);
                            let result:number = testNapi.releaseString();
                            await Utils.sleep(1000);
                            
                            console.log("emitWeb_ReleaseString ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7760);
                            } else {
                                Utils.emitEvent(false, 7760);
                            }
                            break;
                        }
                        
                        case "emitWeb_DestroyResponse": {
                            await Utils.sleep(1000);
                            let result:number = testNapi.destroyResponse();
                            await Utils.sleep(1000);
                            
                            console.log("emitWeb_DestroyResponse ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7761);
                            } else {
                                Utils.emitEvent(false, 7761);
                            }
                            break;
                        }
                        
                        case "emitWeb_CreateSchemeHandler": {
                            await Utils.sleep(1000);
                            let result:number = testNapi.createSchemeHandler();
                            await Utils.sleep(1000);
                            
                            console.log("emitWeb_CreateSchemeHandler ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7762);
                            } else {
                                Utils.emitEvent(false, 7762);
                            }
                            break;
                        }
                        
                        case "emitWebResourceRequest_GetRequestHeaders": {
                            await Utils.sleep(1000);
                            
                            this.controller.runJavaScript("testxhr('custom://www.example.com/xhr/normal/')", (error, result)=> {
                                if (error) {
                                    console.info(" run JavaScript testError error:" + JSON.stringify(error));
                                    return;
                                }
                                if (result) {
                                    console.info(" run JavaScript testError return value is:" + result);
                                }
                            })
                            await Utils.sleep(1000);
                            
                            let result:number = testNapi.resourceRequestGetRequestHeaders();
                            
                            console.log("emitWebResourceRequest_GetRequestHeaders ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 7763);
                            } else {
                                Utils.emitEvent(false, 7763);
                            }
                            break;
                        }
                        
                        case "emitWebHttpBodyStream_GetUserData": {
                            await Utils.sleep(1000);
                            let result:number = testNapi.httpBodyStreamGetUserData();
                            await Utils.sleep(1000);
                            
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
        }
        .height('100%')
        
    }
    
}
