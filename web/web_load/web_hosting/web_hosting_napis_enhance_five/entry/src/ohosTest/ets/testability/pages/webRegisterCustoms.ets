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
import { waitForExist } from '../../test/WaitTest.test';

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
            eventId: 147301,
            priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    }
    onPageHide() {
        events_emitter.off(147301)
    }
    private valueChangeCallBack = (eventData: events_emitter.EventData) => {
        console.info("web page valueChangeCallBack");
        if (eventData != null) {
            console.info("valueChangeCallBack:" + JSON.stringify(eventData));
            if (eventData.data != null && eventData.data.ACTION != null) {
                this.str = eventData.data.ACTION;
                this.isReceive = 0;
            }
        }
    }
    
    
    build() {
        Column() {
            Row() {
                Button("webHostingButton123").key('webHostingButton').onClick(async () => {
                    console.info("key==>" + this.str)
                    await waitForExist(()=>this.isReceive, this.str, 0, 1000)
                    await waitForExist(() => testNapi.getRequestValue(), this.str, 1, 1000);
                    this.isReceive = -1;
                    switch (this.str) {
                        case "emitRegisterCustoms": {
                            console.log("emitRegisterCustoms ==>" + this.isRegister);
                            if (this.isRegister == 0) {
                                Utils.emitEvent(true, 147350);
                            } else {
                                Utils.emitEvent(false, 147350);
                            }
                            break;
                        }
                        
                        case "emitSetSchemeHandler": {
                            console.log("emitSetSchemeHandler ==>" + this.isSet);
                            if (this.isSet == 0) {
                                Utils.emitEvent(true, 147360);
                            } else {
                                Utils.emitEvent(false, 147360);
                            }
                            break;
                        }
                        
                        case "emitClearSchemeHandlers": {
                            let result:number = testNapi.clearSchemeHandlers();
                            console.log("emitClearSchemeHandlers ==>" + result);
                            if (result == 0) {
                                Utils.emitEvent(true, 147370);
                            } else {
                                Utils.emitEvent(false, 147370);
                            }
                            break;
                        }
                        
                        case "emitServiceWorkerClearSchemeHandlers": {
                            let result:number = testNapi.serviceWorkerClearSchemeHandlers();
                            console.log("emitServiceWorkerClearSchemeHandlers ==>" + result);
                            if (result == 0) {
                                Utils.emitEvent(true, 147380);
                            } else {
                                Utils.emitEvent(false, 147380);
                            }
                            break;
                        }
                        
                        case "emitDestroySchemeHandler": {
                            let result:number = testNapi.destroySchemeHandler();
                            console.log("emitDestroySchemeHandler ==>" + result);
                            if (result == 0) {
                                Utils.emitEvent(true, 147390);
                            } else {
                                Utils.emitEvent(false, 147390);
                            }
                            break;
                        }

                        case "emitWebResourceRequest_GetFrameUrl": {
                            console.log("emitWebResourceRequest_GetFrameUrl ==>");
                            let result:number = testNapi.getFrameUrl();
                            console.log("emitWebResourceRequest_GetFrameUrl ==>" + result);
                            if (result == 0) {
                                Utils.emitEvent(true, 147400);
                            } else {
                                Utils.emitEvent(false, 147400);
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
