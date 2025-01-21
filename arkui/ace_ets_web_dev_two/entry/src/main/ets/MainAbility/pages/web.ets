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
 import UIAbility from '@ohos.app.ability.UIAbility';
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

export default class EntryAbility extends UIAbility {
    onCreate(want, launchParam) {
        console.log("EntryAbility onCreate")
        web_webview.WebviewController.initializeWebEngine()
        globalThis.abilityWant = want
        console.log("EntryAbility onCreate done")
    }
}

let loadedUrl;
@Entry
@Component
struct Index {
    controller:WebController = new WebController()
    responseweb: WebResourceResponse = new WebResourceResponse()
    @State str:string="emitAllowGeolocation"
    @State text:string=""
    @State textRatio:number=100
    @State zoomAccessValue:boolean=true
    host: string = "www.spincast.org"
    realm: string = "protected example"
    username_password: string[]
    origin: string="resource://rawfile/"
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
            Row(){
                Button("web click").key('webcomponent').onClick(async ()=>{
                    console.info("key==>"+this.str)
                    switch(this.str){                                                                                
                        case "emitAllowGeolocation":{
                            try {
                                web_webview.GeolocationPermissions.allowGeolocation("resource://rawfile/");
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                            }                                                                                 
                            web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                                if (error) {
                                    console.log('error:' + JSON.stringify(error));
                                    this.text = this.origin + ",error ," + JSON.stringify(error);
                                    return;
                                }
                                this.text = this.origin + ", result: " + result;
                                Utils.emitEvent(this.text,402) 
                            })                                                            
                            break;
                        }
                        case "emitDeleteGeolocation":{                                                                                 
                            web_webview.GeolocationPermissions.deleteGeolocation("resource://rawfile/")
                            web_webview.GeolocationPermissions.getStoredGeolocation((error,origins) => {
                                if (error) {
                                    console.log('error:' + JSON.stringify(error));
                                    this.text = origins + ",error ," + JSON.stringify(error);
                                    return;
                                }
                                this.text = origins.join();
                                Utils.emitEvent(this.text,404) 
                            })                                                            
                            break;
                        }
                        case "emitDeleteAllGeolocation":{                                                                                 
                            web_webview.GeolocationPermissions.allowGeolocation("resource://rawfile/")
                            web_webview.GeolocationPermissions.deleteAllGeolocation()    
                            web_webview.GeolocationPermissions.getStoredGeolocation((error,origins) => {
                                if (error) {
                                    console.log('error:' + JSON.stringify(error));
                                    this.text = origins + ",error ," + JSON.stringify(error);
                                    return;
                                }
                                this.text = origins.join();
                                Utils.emitEvent(this.text,406) 
                            })                                                              
                            break;
                        }
                        case "emitIsCookieAllowed":{
                            web_webview.WebCookieManager.putAcceptCookieEnabled(false);
                            setTimeout(()=>{  
                                Utils.emitEvent(web_webview.WebCookieManager.isCookieAllowed(),408)
                            },3000)                                           
                            break;
                        }
                        case "emitSaveCookieAsync":{ 
                            web_webview.WebCookieManager.saveCookieAsync(function(result){
                                Utils.emitEvent("result",410)   
                            })                                                                                 
                            break;
                        }
                        case "emitIsThirdPartyCookieAllowed":{ 
                            web_webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
                            setTimeout(()=>{  
                                var result = web_webview.WebCookieManager.isThirdPartyCookieAllowed();
                                console.log(result.toString()); 
                                Utils.emitEvent(web_webview.WebCookieManager.isThirdPartyCookieAllowed(),412)
                            },3000)                                                                                      
                            break;
                        }
                        case "emitOnConsole":{                           
                            this.controller.runJavaScript({script:"consoleTest()"})
                            break;
                        }
                        case "emitLoaData":{ 
                            this.controller.loadUrl({url:"resource://rawfile/index.html"})
                            setTimeout(()=>{
                                this.controller.loadData({
                                data: "<html><head><title>index</title></head><body bgcolor=\"white\">Source:<pre>source</pre</body><script>function gettitle(){return document.title}</script></html>",
                                mimeType: "text/html",
                                encoding: "UTF-8"
                                })
                            },3000)
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"gettitle()",callback:(res)=>{
                                    Utils.emitEvent(res,424)
                                }})
                                },4000)                                                                                     
                            break ;
                        }
                        case "emitZoomAccess":{ 
                            this.zoomAccessValue = false
                            this.controller.refresh() 
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"getPageHeight()",callback:(res1)=>{
                                var zoomInCalled = false
                                this.controller.runJavaScript({script:"getPageHeight()",callback:(res)=>{
                                    console.info("getPageHeight==>"+res)
                                    if (Number(res) > Number(res1)) {
                                    zoomInCalled = true
                                }
                                Utils.emitEvent(zoomInCalled,428);
                                    }})
                                }})                                                                                
                            },3000);                                                                                  
                            break ;
                        }
                        case "emitSaveHttpAuthCredentials":{ 
                            web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "Stromgol", "Laroche");
                            setTimeout(()=>{
                                let result = web_webview.WebDataBase.existHttpAuthCredentials();
                                Utils.emitEvent(result,442)
                            },3000)                                                                        
                            break;
                        }
                        case "emitGetHttpAuthCredentials":{ 
                            this.username_password = web_webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                            setTimeout(()=>{
                                let result = this.username_password[0];
                                Utils.emitEvent(result,444)
                            },5000)                                                                           
                            break;
                        }
                        case "emitDeleteHttpAuthCredentials":{ 
                            web_webview.WebDataBase.deleteHttpAuthCredentials();
                            setTimeout(()=>{
                                let result = web_webview.WebDataBase.existHttpAuthCredentials();
                                Utils.emitEvent(result,446)
                            },3000)                                                                               
                            break;
                        }
                        default:
                            console.info("can not match case")
                    }
                })
            }
            Web({src:$rawfile('index.html'),controller:this.controller})
            .databaseAccess(true)
            .zoomAccess(this.zoomAccessValue)
            .textZoomRatio(this.textRatio)
            .onConsole((event) => {
                let level = event.message.getMessageLevel()
                let msg = event.message.getMessage()
                let lineNumber = event.message.getLineNumber().toString()
                let sourceId = event.message.getSourceId()
                console.log("lineNumber:" + lineNumber)
                setTimeout(()=>{ 
                    Utils.emitEvent(lineNumber,420)
                },3000)
                setTimeout(()=>{ 
                    Utils.emitEvent(sourceId,422)
                },3000)
                return false
            })
        }
    }
}
