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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct Second {
    controller:WebController = new WebController();
    controller1: web_webview.WebviewController = new web_webview.WebviewController();
    @State str:string="emitOverviewModeAccessTrue";
    @State overviewModeAccess:boolean=true;
    @State overviewScale:string="";
    @State userAgentPC:string = "";
    @State isReceive: number = -1;
    @State isComplete: number = -1;
    onPageShow(){
        let valueChangeEvent: events_emitter.InnerEvent={
            eventId:153120,
            priority:events_emitter.EventPriority.LOW
        };
        events_emitter.on(valueChangeEvent,this.valueChangeCallBack);
    }
    onPageHide() {
        events_emitter.off(153120)
    }
    private valueChangeCallBack=(eventData: events_emitter.EventData)=>{
        console.info("web page valueChangeCallBack");
        if(eventData != null){
            console.info("valueChangeCallBack:"+   JSON.stringify(eventData));
            if(eventData.data?.ACTION != null){
                this.str = eventData.data?.ACTION;
                this.isReceive = 0;
            }
        }
    }
    build(){
        Column(){
            Row(){
                Button("web click").key('webcomponenttwo').onClick(async ()=>{
                    console.info("key==>"+this.str);
                    await waitForExist(() => this.isComplete, this.str, 0);
                    await waitForExist(() => this.isReceive, this.str, 0);
                    this.isReceive = -1;
                    switch(this.str){
                        case "emitOverviewModeAccessTrue":{
                            this.isComplete = -1;
                            this.controller.loadUrl({url:"resource://rawfile/overview.html"})
                            await waitForExist(() => this.isComplete, this.str, 0);
                            this.controller.runJavaScript({script:"getViewResult()",callback:(res)=>{
                                console.info("getViewResult==>"+res);
                                this.overviewScale=res;
                                this.userAgentPC = this.controller1.getUserAgent();
                                if ((this.userAgentPC).includes("PC")) {
                                    console.info("userAgentPC==>"+this.userAgentPC)
                                    this.userAgentPC = ""
                                    Utils.emitEventTwo(0.25,"1",153130);
                                }else{
                                    Utils.emitEventTwo(res,"1",153130);
                                }
                            }});
                            break;
                        }
                        case "emitOverviewModeAccessFalse":{
                            this.overviewModeAccess=false;
                            this.overviewScale = "";
                            this.isComplete = -1;
                            this.controller.refresh();
                            await waitForExist(() => this.isComplete, this.str, 0);
                            this.controller.runJavaScript({script:"getViewResult()",callback:(res)=>{
                                console.info("getViewResult==>"+res);
                                this.userAgentPC = this.controller1.getUserAgent();
                                if ((this.userAgentPC).includes("PC")) {
                                    console.info("userAgentPC==>"+this.userAgentPC)
                                    this.userAgentPC = ""
                                    Utils.emitEventTwo(0.25,"1",153140);
                                }else{
                                    Utils.emitEventTwo(this.overviewScale,res,153140);
                                }
                            }});
                            break;
                        }
                        default:
                            console.info("can not match case");
                    }
                })
            }
            Web({src:$rawfile('overview.html'),controller:this.controller})
                .overviewModeAccess(this.overviewModeAccess)
                .onPageEnd((event) => {
                    console.log('web pageEnd==>' + event.url);
                    this.isComplete = 0;
                })
            Web({src:$rawfile('overview.html'),controller:this.controller1})
                .overviewModeAccess(this.overviewModeAccess)
                .onPageEnd((event) => {
                    console.log('web pageEnd==>' + event.url);
                    this.isComplete = 0;
                })
        }
    }
}

