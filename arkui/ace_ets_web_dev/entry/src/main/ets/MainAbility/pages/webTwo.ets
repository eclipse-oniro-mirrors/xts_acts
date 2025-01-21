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

@Entry
@Component
struct Second {
    controller:WebController = new WebController()
    @State str:string="emitOverviewModeAccessTrue"
    @State overviewModeAccess:boolean=true
    @State overviewScale:string=""
    onPageShow(){
        let valueChangeEvent={
            eventId:10,
            priority:events_emitter.EventPriority.LOW
        };
        events_emitter.on(valueChangeEvent,this.valueChangeCallBack);
    }
    private valueChangeCallBack=(eventData)=>{
        console.info("web page valueChangeCallBack");
        if(eventData != null){
             console.info("valueChangeCallBack:"+   JSON.stringify(eventData));
             if(eventData.data.ACTION != null){
                 this.str = eventData.data.ACTION;
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
                                Utils.emitEventTwo(res,"1",168);
                            }});
                        break;
                        }
                        case "emitOverviewModeAccessFalse":{
                            this.overviewModeAccess=false;
                            await Utils.sleep(2000);
                            this.controller.runJavaScript({script:"getViewResult()",callback:(res)=>{
                                console.info("getViewResult==>"+res);
                                Utils.emitEventTwo(this.overviewScale,res,170);
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
        }
    }
}