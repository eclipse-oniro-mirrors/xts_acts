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
struct Index {
    controller: web_webview.WebviewController = new web_webview.WebviewController();
    controller2: web_webview.WebviewController = new web_webview.WebviewController();
    @State str:string="emitRunJsCallback";
    @State webId:number=0;
    @State webResult:string=' ';
    @State proResult:string=' ';
    @State webFilename:string=' ';
    @State errorResult:string=' ';
    @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
    @State pageResult:boolean=false;
    @State javaScriptAccess:boolean=true;
    @State fileAccess:boolean=true;
    @State domStorageAccess:boolean=false
    @State imageAccess:boolean=true
    @State onlineImageAccess:boolean=true
    @State databaseAccess:boolean=true
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
                Button("web test").key('webcomponent01').onClick(async () => {
                    console.info("key==>" + this.str)
                    switch (this.str) {
                        case "emitRunJsCallback": {
                                  try {
                                    console.info('Running testcaes emitRunJsCallback!!!')
                                    this.controller.runJavaScript(
                                      'testRunJavaScript()',
                                      (error, result) => {
                                        if (error) {
                                          console.info(`run JavaScript error: ` + JSON.stringify(error))
                                          return;
                                        }
                                        if (result) {
                                          this.webResult = 'testRunJavaScript'
                                          Utils.emitEvent(this.webResult, 126)
                                          console.info(`The test() return value is: ${result}`)
                                        }
                                      });
                                  } catch (error) {
                                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                                  }
                        }
                        case "emitRunJsPromise": {
                              try {
                                    this.controller.runJavaScript('testRunJavaScript()')
                                      .then(function (proResult) {
                                      Utils.emitEvent(proResult, 128)
                                        console.log('proResult: ' + proResult);
                                      })
                                      .catch(function (error) {
                                        console.error("error: " + error);
                                      })
                                  } catch (error) {
                                    console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                                   }
                        }
                    }
                })
            }
            Web({src:$rawfile('index.html'),controller:this.controller})
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
