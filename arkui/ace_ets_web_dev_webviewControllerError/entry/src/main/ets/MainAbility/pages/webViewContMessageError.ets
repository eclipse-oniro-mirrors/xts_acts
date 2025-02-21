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
// @ts-nocheck

@Entry
@Component
struct webViewContMessageError {
    controller: web_webview.WebviewController = new web_webview.WebviewController();
    controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
    ports: web_webview.WebMessagePort[];
    msgPort: web_webview.WebMessagePort[] = null;
    @State sendFromEts: string = 'Send this message from ets to HTML';
    @State receivedFromHtml: string = 'Display received message send from HTML';
    @State str:string="emitPostMessageInitErr";
    @State userAgent:string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
    @State javaScriptAccess:boolean=true;
    @State fileAccess:boolean=true;
    @State domStorageAccess:boolean=false;
    @State imageAccess:boolean=true;
    @State onlineImageAccess:boolean=true;
    @State databaseAccess:boolean=true;
    @State errorCode: string = '0';
    @State errorMsg: string = 'failed';

    onPageShow(){
        let valueChangeEvent={
            eventId:10,
            priority:events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent,this.valueChangeCallBack)
    }
    private valueChangeCallBack=(eventData)=>{
        console.info("webViewContMessageError page valueChangeCallBack");
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
                Button("messageEventErrorTest").key('webViewContMessageError').onClick(() => {
                    console.info("key==>" + this.str)
                    switch (this.str) {
                        case "emitPostMessageInitErr": {
                            try {
                                this.ports = this.controller.createWebMessagePorts();
                                this.controllerTwo.postMessage('__init_port__', [this.ports[0]], '*');
                            } catch (error) {
                                console.error(`emitPostMessageInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                                this.errorCode = error.code
                                this.errorMsg = error.message
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.errorCode, 600)
                                Utils.emitEvent(this.errorMsg, 601)
                            })
                            break;
                        }
                        case "emitPostMessageEventUnPortErr": {
                            try {
                                this.errorCode = '0';
                                this.errorMsg = 'failed';
                                this.ports = this.controller.createWebMessagePorts();
                                this.controller.postMessage('__init_port__', [this.ports[0]], '*');
                                if (this.ports && this.ports[1]) {
                                    this.ports[1].close();
                                } else {
                                    console.log("ports is null, Please initialize first");
                                }
                                this.ports[1].postMessageEvent("post message from ets to html5");
                            } catch (error) {
                                console.error(`emitPostMessageEventUnPortErr ErrorCode: ${error.code},  Message: ${error.message}`);
				this.errorCode = error.code
                                this.errorMsg = error.message
                            }
                            this.controller.runJavaScript("test()",(res) => {
                                Utils.emitEvent(this.errorCode, 602)
                                Utils.emitEvent(this.errorMsg, 603)
                            })
                            break;
                        }

                    }
                })
            }
            Web({src:$rawfile('indexEdit.html'),controller:this.controller})
                .javaScriptAccess(this.javaScriptAccess)
                .fileAccess(this.fileAccess)
                .imageAccess(this.imageAccess)
                .domStorageAccess(this.domStorageAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .databaseAccess(this.databaseAccess)
                .userAgent(this.userAgent)
        }
    }
}