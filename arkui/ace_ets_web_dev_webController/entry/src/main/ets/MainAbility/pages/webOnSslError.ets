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

@Entry
@Component
struct webOnSslError {
    controller: WebController = new WebController();
    @State str:string="emitOnsslerroreventreceiveWebC";
    @State firstId:number=420;
    @State javaScriptAccess:boolean=true;
    @State fileAccess:boolean=true;
    @State domStorageAccess:boolean=false;
    @State imageAccess:boolean=true;
    @State onlineImageAccess:boolean=true;
    @State databaseAccess:boolean=true;
    @State sslerrorText:string="no call error"
    @State userAgent:string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
    onPageShow(){
        let valueChangeEvent={
            eventId:10,
            priority:events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent,this.valueChangeCallBack)
    }
    private valueChangeCallBack=(eventData)=>{
        console.info("webOnSslError page valueChangeCallBack");
        if(eventData != null){
                console.info("valueChangeCallBack:"+   JSON.stringify(eventData));
                if(eventData.data.ACTION != null){
                    this.str = eventData.data.ACTION;
                }
        }
    }

    build() {
        Column() {
            Row() {
                Button("web click").key('webOnSslError').onClick(async () => {
                    console.info("key==>" + this.str)
                    switch (this.str) {
                        case "emitOnsslerroreventreceiveWebC": {
                            try {
                                this.controller.refresh();
                                await Utils.sleep(2000);
                                this.controller.loadUrl({ url: 'https://wrong.host.badssl.com' })
                                console.log("action of emitOnsslerroreventreceiveWebC is loadUrl");
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }                  
                    }
                })
            }
            Web({ src:'https://wrong.host.badssl.com', controller: this.controller })
                .javaScriptAccess(this.javaScriptAccess)
                .fileAccess(this.fileAccess)
                .imageAccess(this.imageAccess)
                .domStorageAccess(this.domStorageAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .databaseAccess(this.databaseAccess)
                .userAgent(this.userAgent)
                .onSslErrorEventReceive((event) => {
                    console.log("event result is :" + JSON.stringify(event.handler) + event.error);
                    this.sslerrorText = JSON.stringify(event.error)
                    Utils.emitEvent(this.sslerrorText, this.firstId)
                    return true
                })
            }
    }
}