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

let loadedUrl;
@Entry
@Component
struct webViewScrollTo {
    controller: web_webview.WebviewController = new web_webview.WebviewController();
    @State str:string="emitScrollToOne";
    @State res:boolean = false;
    @State xNum:number = 0;
    @State yNum:number = 0;
    onPageShow(){
        let valueChangeEvent={
            eventId:10,
            priority:events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent,this.valueChangeCallBack)
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
            Row() {
                Button("web click").key('webcomponentScrolTo').onClick(async () => {
                    console.info("key==>" + this.str)
                    switch (this.str) {
                        case "emitScrollToOne" :{
                            this.controller.loadUrl($rawfile('theScroll.html'));
                            this.xNum = -10;
                            this.yNum = -10;
                            await Utils.sleep(1000);
                            try {
                                this.controller.scrollTo(this.xNum, this.yNum);
                                await Utils.sleep(1000);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("getScroll()",(error, result) => {
                                if (error) {
                                    console.info(`emitScrollToOne runJavaScript error: ` + JSON.stringify(error))
                                    return;
                                } else {
                                    console.log("emitScrollToOne runJavaScript.result: " + result);
                                }
                                Utils.emitEvent(result, 214)
                                console.info("emitScrollToOne  res: " + result);
                            })
                            break;
                        }
                        case "emitScrollToTwo" :{
                            this.controller.loadUrl($rawfile('theScroll.html'));
                            this.xNum = -10;
                            this.yNum = 3500;
                            await Utils.sleep(1000);
                            try {
                                this.controller.scrollTo(this.xNum, this.yNum);
                                await Utils.sleep(1000);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("getScroll()",(error, result) => {
                                if (error) {
                                    console.info(`emitScrollToTwo runJavaScript error: ` + JSON.stringify(error))
                                    return;
                                } else {
                                    console.log("emitScrollToTwo runJavaScript.result: " + result);
                                    if(JSON.parse(result)[0] == 0 && JSON.parse(result)[1] > 200){
                                        this.res = true;
                                    }else{
                                        this.res = false;
                                    }
                                }
                                Utils.emitEvent(this.res, 216)
                                console.info("emitScrollToTwo  res: " + result);
                            })
                            break;
                        }
                        case "emitScrollToThree" :{
                            this.controller.loadUrl($rawfile('theScroll.html'));
                            this.xNum = -10;
                            this.yNum = 200;
                            await Utils.sleep(1000);
                            try {
                                this.controller.scrollTo(this.xNum, this.yNum);
                                await Utils.sleep(1000);
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("getScroll()",(error, result) => {
                                if (error) {
                                    console.info(`emitScrollToThree runJavaScript error: ` + JSON.stringify(error))
                                    return;
                                } else {
                                    console.log("emitScrollToThree runJavaScript.result: " + result);
                                }
                                Utils.emitEvent(result, 218)
                                console.info("emitScrollToThree  res: " + result);
                            })
                            break;
                        }
                        case "emitScrollToFour" :{
                            this.controller.loadUrl($rawfile('theScroll.html'));
                            this.xNum = 200;
                            this.yNum = -10;
                            await Utils.sleep(1000);
                            try {
                                this.controller.scrollTo(this.xNum, this.yNum);
                                await Utils.sleep(1000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("getScroll()", (error, result) => {
                                if (error) {
                                    console.info(`emitScrollToFour runJavaScript error: ` + JSON.stringify(error))
                                    return;
                                } else {
                                    console.log("emitScrollToFour runJavaScript.result: " + result);
                                }
                                Utils.emitEvent(result, 220)
                                console.info("emitScrollToFour  res: " + result);
                            })
                            break;
                        }
                        case "emitScrollToFive" :{
                            this.controller.loadUrl($rawfile('theScroll.html'));
                            this.xNum = 4000;
                            this.yNum = -10;
                            await Utils.sleep(1000);
                            try {
                                this.controller.scrollTo(this.xNum, this.yNum);
                                await Utils.sleep(1000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("getScroll()", (error, result) => {
                                if (error) {
                                    console.info(`emitScrollToFive runJavaScript error: ` + JSON.stringify(error))
                                    return;
                                } else {
                                    console.log("emitScrollToFive runJavaScript.result: " + result);
                                    if(JSON.parse(result)[0] > 200 && JSON.parse(result)[1] == 0){
                                        this.res = true;
                                    }else{
                                        this.res = false;
                                    }
                                }
                                Utils.emitEvent(this.res, 222)
                                console.info("emitScrollToFive  res: " + result);
                            })
                            break;
                        }
                        case "emitScrollToSix" :{
                            this.controller.loadUrl($rawfile('theScroll.html'));
                            this.xNum = 200;
                            this.yNum = 200;
                            await Utils.sleep(1000);
                            try {
                                this.controller.scrollTo(this.xNum, this.yNum);
                                await Utils.sleep(1000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("getScroll()", (error, result) => {
                                if (error) {
                                    console.info(`emitScrollToSix runJavaScript error: ` + JSON.stringify(error))
                                    return;
                                } else {
                                    console.log("emitScrollToSix runJavaScript.result: " + result);
                                }
                                Utils.emitEvent(result, 224)
                                console.info("emitScrollToSix  res: " + result);
                            })
                            break;
                        }
                        case "emitScrollToSeven" :{
                            this.controller.loadUrl($rawfile('theScroll.html'));
                            this.xNum = 4000;
                            this.yNum = 3500;
                            await Utils.sleep(1000);
                            try {
                                this.controller.scrollTo(this.xNum, this.yNum);
                                await Utils.sleep(1000)
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            this.controller.runJavaScript("getScroll()", (error, result) => {
                                if (error) {
                                    console.info(`emitScrollToSeven runJavaScript error: ` + JSON.stringify(error))
                                    return;
                                } else {
                                    console.log("emitScrollToSeven runJavaScript.result: " + result);
                                    if(JSON.parse(result)[0] > 200 && JSON.parse(result)[1] > 200){
                                        this.res = true;
                                    }else{
                                        this.res = false;
                                    }
                                }
                                Utils.emitEvent(this.res, 226)
                                console.info("emitScrollToSeven  res: " + result);
                            })
                            break;
                        }
                    }
                })
            }
            Web({src:$rawfile('theScroll.html'),controller:this.controller})
        }
    }
}
