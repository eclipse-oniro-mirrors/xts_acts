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


@Entry
@Component
struct Second {
    controller:WebController = new WebController();
    controller1: web_webview.WebviewController = new web_webview.WebviewController();
    @State str:string="emitOverviewModeAccessTrue";
    @State overviewModeAccess:boolean=true;
    @State overviewScale:string="";
    @State userAgentPC:string = "";
    onPageShow(){
        let valueChangeEvent: events_emitter.InnerEvent={
            eventId:10,
            priority:events_emitter.EventPriority.LOW
        };
        events_emitter.on(valueChangeEvent,this.valueChangeCallBack);
    }
    private valueChangeCallBack=(eventData: events_emitter.EventData)=>{
        console.info("web page valueChangeCallBack");
        if(eventData != null){
             console.info("valueChangeCallBack:"+   JSON.stringify(eventData));
             if(eventData.data?.ACTION != null){
                 this.str = eventData.data?.ACTION;
             }
        }
    }
    build(){
        Column(){
            Row(){
                Button("web click").key('webcomponenttwo').onClick(async ()=>{
                    console.info("key==>"+this.str);
                    switch(this.str){
                        case "emitOverviewModeAccessTrue":{
                            this.controller.loadUrl({url:"resource://rawfile/overview.html"})
                            this.controller.runJavaScript({script:"getViewResult()",callback:(res)=>{
                                console.info("getViewResult==>"+res);
                                this.overviewScale=res;
                                this.userAgentPC = this.controller1.getUserAgent();
                                if ((this.userAgentPC).includes("PC")) {
                                    console.info("userAgentPC==>"+this.userAgentPC)
                                    this.userAgentPC = ""
                                    Utils.emitEventTwo(0.25,"1",168);
                                }else{
                                    Utils.emitEventTwo(res,"1",168);
                                }
                            }});
                        break;
                        }
                        case "emitOverviewModeAccessFalse":{
                            this.overviewModeAccess=false;
                            await Utils.sleep(2000);
                            this.controller.runJavaScript({script:"getViewResult()",callback:(res)=>{
                                console.info("getViewResult==>"+res);
                                this.userAgentPC = this.controller1.getUserAgent();
                                if ((this.userAgentPC).includes("PC")) {
                                    console.info("userAgentPC==>"+this.userAgentPC)
                                    this.userAgentPC = ""
                                    Utils.emitEventTwo(0.25,"1",170);
                                }else{
                                    Utils.emitEventTwo(this.overviewScale,res,170);
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
            Web({src:$rawfile('overview.html'),controller:this.controller1})
            .overviewModeAccess(this.overviewModeAccess)
        }
    }
}

