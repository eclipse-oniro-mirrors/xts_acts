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
