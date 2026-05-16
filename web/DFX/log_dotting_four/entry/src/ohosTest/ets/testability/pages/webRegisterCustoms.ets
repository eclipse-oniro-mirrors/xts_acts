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
import {waitForExist} from '../../test/WaitTest';

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
    @State isPageEnd: number = -1;
    
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
            eventId: 118010,
            priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    }
    onPageHide() {
        events_emitter.off(118010)
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
                    await waitForExist(()=>this.isPageEnd, 'webHostingButtonIsPageEnd', 0);
                    await waitForExist(()=>this.isReceive, 'webHostingButtonIsReceive', 0);
                    console.info('key==>' + this.str);
                    this.isReceive = -1;
                    switch (this.str) {
                        case "emitWebResponse_GetError": {
                            console.log("emitWebResponse_GetError ==>");
                            
                            let result:number = testNapi.responseGetError();
                            await waitForExist(() => result, 'responseGetErrorResult', 0, 300, 10);
                            console.log("emitWebResponse_GetError ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 118020);
                            } else {
                                Utils.emitEvent(false, 118020);
                            }
                            break;
                        }
                        case "emitWebResponse_SetError": {
                            console.log("emitWebResponse_SetError ==>");
                            
                            let result:number = testNapi.responseSetError();
                            await waitForExist(() => result, 'responseGetErrorResult', 0, 300, 10);
                            console.log("emitWebResponse_SetError ==>" + result);
                            
                            if (result == 0) {
                                Utils.emitEvent(true, 118030);
                            } else {
                                Utils.emitEvent(false, 118030);
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
                .onPageEnd(()=>{
                    this.isPageEnd = 0;
                })
        }
        .height('100%')
    }    
}
