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

@Entry
@Component
struct webViewOnFirstContFour {
    controller: web_webview.WebviewController = new web_webview.WebviewController();
    @State str:string="emitRefreshOnfirstcontentfulpaint";
    @State firstId:number=328;
    @State firstcontentfulpaint:boolean=false;
    @State javaScriptAccess:boolean=true;
    @State fileAccess:boolean=true;
    @State domStorageAccess:boolean=false;
    @State imageAccess:boolean=true;
    @State onlineImageAccess:boolean=true;
    @State databaseAccess:boolean=true;
    @State userAgent:string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
    @State firstBoo:boolean=false;
    onPageShow(){
        let valueChangeEvent={
            eventId:10,
            priority:events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent,this.valueChangeCallBack)
    }
    private valueChangeCallBack=(eventData)=>{
        console.info("webViewOnFirstContFour page valueChangeCallBack");
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
                Button("web click").key('webViewOnFirstContFour').onClick(() => {
                    console.info("key==>" + this.str)
                    switch (this.str) {
                        case "emitRefreshOnfirstcontentfulpaint": {
                            try {
                                this.controller.refresh();
                                this.firstBoo = true
                                console.log("action of emitRefreshOnfirstcontentfulpaint is refresh");
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }
                    }
                })
            }
            Web({ src:'www.baidu.com', controller: this.controller })
                .javaScriptAccess(this.javaScriptAccess)
                .fileAccess(this.fileAccess)
                .imageAccess(this.imageAccess)
                .domStorageAccess(this.domStorageAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .databaseAccess(this.databaseAccess)
                .userAgent(this.userAgent)
                .onFirstContentfulPaint(event => {
                    console.log("onFirstContentfulPaint:" + "[navigationStartTick]:" + 
                        event.navigationStartTick + ", [firstContentfulPaintMs]:" + event.firstContentfulPaintMs + this.firstId)
                    if (event.firstContentfulPaintMs > 0 && event.firstContentfulPaintMs < 5000) {
                        this.firstcontentfulpaint = true;
                        console.error("result of onFirstContentfulPaint is: "+ this.firstcontentfulpaint + this.firstId);
                    }
                })
                .onPageEnd((event) => {
                    console.log('url' + event.url + this.firstcontentfulpaint + this.firstId);
                    if (this.firstBoo) {
                        Utils.emitEvent(this.firstcontentfulpaint, this.firstId)
                    }
                })
            }
    }
}