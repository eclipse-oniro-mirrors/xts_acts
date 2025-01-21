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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';

let loadedUrl;
@Entry
@Component
struct Index {
    controller:WebController = new WebController()
    @State str:string="emitUserAgent"
    @State loadedResource:string=""
    @State progress:string=""
    @State newUrl:string=""
    @State pageBegin:string=""
    @State pageEnd:string=""
    @State console:string=""
    @State confirm:string=""
    @State alert:string=""
    @State errorReceive:string=""
    @State httpErrorReceive:number=0
    @State titleReceive:string=""
    @State isDownloadStart:boolean=false
    @State javaScriptAccess:boolean=true
    @State fileAccess:boolean=true
    @State domStorageAccess:boolean=false
    @State imageAccess:boolean=true
    @State geolocationAccess:boolean=true
    @State onlineImageAccess:boolean=true
    @State databaseAccess:boolean=true
    @State initialScale:number=100
    @State enterPageEnd:boolean=false
    @State newScale:number=0
    @State scaleChange:boolean=false
    @State geoShow:boolean=false
    @State mixedMode:MixedMode=MixedMode.All
    @State cacheMode:CacheMode=CacheMode.Default
    @State cacheError:boolean=false
    @State mixedSwitch:boolean=false
    @State mixedAllSwitch:boolean=false
    @State isProgressFinish:boolean=false
    @State isHttpErrorReceive:boolean=false
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
            Web({src:$rawfile('index.html'),controller:this.controller})
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .geolocationAccess(this.geolocationAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .cacheMode(this.cacheMode)
            .initialScale(this.initialScale)
            .mixedMode(this.mixedMode)
            .userAgent("Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36")
            .javaScriptProxy({
                object:this.jsObj,
                name:"backToEts",
                methodList:["test","toString"],
                controller:this.controller
            })
            .onUrlLoadIntercept((event)=>{
                console.info("onUrlLoadIntercept==>"+event.data)
                loadedUrl=String(event.data)
                return false
            })
            .onRenderExited((event)=>{
                console.info("onRenderExited==>"+event.renderExitReason)
                Utils.emitEvent(event.renderExitReason,106)
            })
            .onResourceLoad((event)=>{
                console.info("onResourceLoad==>"+event.url)
                this.loadedResource=event.url
            })
            .onProgressChange((event)=>{
                console.info("onProgressChange==>")
                this.progress=event.newProgress+""
            })
            .onRefreshAccessedHistory((event)=>{
                console.info("onRefreshAccessedHistory==>")
                this.newUrl=event.url
            })
            .onFocus(()=>{
                Utils.emitEvent("requestFocus",126)
            })
            .onPageBegin((event) => {
                this.pageBegin = event.url
            })
            .onPageEnd((event) => {
                this.pageEnd = event.url
                console.log("onPageEnd==>")
                if(this.enterPageEnd){
                    Utils.emitEvent(this.newScale,97)
                    this.enterPageEnd=false
                }else if(this.isProgressFinish){
                    console.info("isProgressFinish==>")
                    if(this.progress="100"){
                        Utils.emitEvent(this.progress,114)
                        this.isProgressFinish=false
                    } 
                 }
            })
            .onConsole((event) => {
                this.console = event.message.getMessage()
                let level=event.message.getMessageLevel()
                let msg=event.message.getMessage()
                console.log("html==>"+msg)
                if(this.mixedSwitch){
                    Utils.emitEvent(msg,186)
                    this.mixedSwitch=false
                }else if(this.mixedAllSwitch){
                    Utils.emitEvent(level,188)
                    this.mixedAllSwitch=false
                }
                return false
            })
            .onAlert((event) => {
                this.alert = event.message
                return false
            })
            .onConfirm((event) => {
                this.confirm = event.message
                return false
            })
            .onErrorReceive((event) => {
                this.errorReceive = event.request.getRequestUrl()
                console.log("onErrorReceive==>")
                if(this.cacheError){
                    Utils.emitEvent("cacheError",182)
                    this.cacheError=false
                }               
            })
            .onHttpErrorReceive((event) => {
                if(this.isHttpErrorReceive){
                    console.info("isHttpErrorReceive==>")
                    this.httpErrorReceive = event.response.getResponseCode()
                    Utils.emitEvent(this.httpErrorReceive,66)
                    this.isHttpErrorReceive=false
                }              
            })
            .onTitleReceive((event) => {
                this.titleReceive = event.title
            })
            .onDownloadStart((event) => {
                if(this.isDownloadStart){
                    console.info("isDownloadStart==>")
                    Utils.emitEvent(event.url,68)
                    this.isDownloadStart=false
                }
            })
            .onScaleChange((event)=>{
                console.log("onScaleChange==>")
                this.newScale=event.newScale
                if(this.scaleChange){
                    Utils.emitEvent("onScaleChange",98)
                    this.scaleChange=false
                }
            })
            .onPrompt((event)=>{
                event.result.handlePromptConfirm("onPrompt ok")
                Utils.emitEvent(event.message,178)
                return true
            })
            .onGeolocationShow(()=>{
                console.log("onGeolocationShow==>")
                if(this.geoShow){
                    Utils.emitEvent("onGeolocationShow",99)
                    this.geoShow=false
                }
            })
            .onBlur(()=>{
                console.info("onBlur==>") 
                this.controller.requestFocus()
            })
            TextInput({placeholder:"inputs your words"})
            .key('textInput')
            .type(InputType.Normal)
            .placeholderColor(Color.Blue)
            .placeholderFont({size:20,weight:FontWeight.Normal,family:"sans-serif",style:FontStyle.Normal})
            .enterKeyType(EnterKeyType.Next)
            .caretColor(Color.Green)
            .height(60)
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontFamily("cursive")
            .fontStyle(FontStyle.Italic)
            .fontColor(Color.Red)
            .maxLength(20)
            .border({width:1,color:0x317AF7,radius:10,style:BorderStyle.Solid})
            .onClick(()=>{
                console.info("TextInput click")
            })
            Row(){
                Button("web click").key('webcomponent').onClick(async ()=>{
                    console.info("key==>"+this.str)
                    switch(this.str){
                        case "emitUserAgent":{
                            this.controller.runJavaScript({script:"getUserAgent()",callback:(res)=>{
                                Utils.emitEvent(res,100)
                            }})
                            break;
                        }
                        case "emitJavaScriptProxy":{
                            this.controller.runJavaScript({script:"test()"})
                            break;
                        }
                        case "emitOnUrlLoadIntercept":{
                            this.controller.loadUrl({url:"https://gitee.com/"})
                            setTimeout(()=>{
                                Utils.emitEvent(loadedUrl,104)
                            },3000)
                            break;
                        }
                        case "emitOnRenderExited":{
                            this.controller.loadUrl({url:"chrome://crash/"})
                            break;
                        }
                        case "emitOnResourceLoad":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/second.html"});
                            setTimeout(()=>{
                                Utils.emitEvent(this.loadedResource,108)
                            },3000)
                            break;
                        }
                        case "emitLoadUrl":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"gettitle()",callback:(res)=>{
                                    console.info("gettitle1==>"+res)
                                    Utils.emitEvent(res,110)
                                }})
                            },3000)
                            break;
                        }
                        case "emitRunJavaScript":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"testRunJavaScript()",callback:(res)=>{
                                    Utils.emitEvent(res,112)
                                }})
                            },3000)
                            break;
                        }
                        case "emitOnProgressChange":{
                            this.isProgressFinish=true
                            await Utils.sleep(1000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            break;
                        }
                        case "emitOnRefreshAccessedHistory":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/second.html"});
                            setTimeout(()=>{
                                Utils.emitEvent(this.newUrl,116)
                            },3000)
                            break;
                        }
                        case "emitGetHitTest":{
                            let hitType=JSON.stringify(this.controller.getHitTest())
                            Utils.emitEvent(hitType,118)
                            break;
                        }
                        case "emitGetRequestFocus":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/second.html"});
                            await Utils.sleep(2000)
                            sendEventByKey('textInput',10,'')
                            break;
                        }
                        case "emitAccessBackward":{
                            let isCan=this.controller.accessBackward()+""
                            Utils.emitEvent(isCan,128)
                            break;
                        }
                        case "emitAccessForward":{
                            let isCan=this.controller.accessForward()+""
                            Utils.emitEvent(isCan,130)
                            break;
                        }
                        case "emitAccessStep":{
                            let isCan=this.controller.accessStep(-1)+""
                            Utils.emitEvent(isCan,132)
                            break;
                        }
                        case "emitBackward":{
                            this.controller.backward()
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"gettitle()",callback:(res)=>{
                                    Utils.emitEvent(res,134)
                                }})
                            },3000)
                            break;
                        }
                        case "emitForward":{
                            this.controller.forward()
                            setTimeout(()=>{     
                                Utils.emitEvent(this.newUrl,136)
                            },3000)
                            break;
                        }
                        case "emitGeolocationAccessFalse":{
                            this.geolocationAccess=false
                            await Utils.sleep(2000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/geo.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"getGeoResult()",callback:(res)=>{
				                    console.info("getGeoResult==>"+res)
                                    Utils.emitEvent(res,96)
                                }})
                            },3000)
                            break;
                        }
                        case "emitInitialScale":{
                            this.initialScale=120
                            await Utils.sleep(1000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/second.html"});
                            this.enterPageEnd=true
                            break;
                        }
                        case "emitOnscaleChange":{
                            this.initialScale=110
                            this.scaleChange=true
                            await Utils.sleep(2000)
                            this.controller.loadUrl({url:"https://gitee.com/"})
                            break;
                        }
                        case "emitOnGeolocationShow":{
                            this.geolocationAccess=true
                            this.geoShow=true
                            await Utils.sleep(2000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/geo.html"});
                            break;
                        }
                        case "emitDomStorageAccessFalse":{
                            this.domStorageAccess=false
                            await Utils.sleep(2000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/domApi.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"getDomResult()",callback:(res)=>{
				                    console.info("getDomResult==>"+res)
                                    Utils.emitEvent(res,144)
                                }})
                            },3000)
                            break;
                        }
                        case "emitDomStorageAccessTrue":{
                            this.domStorageAccess=true
                            await Utils.sleep(2000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/domApi.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"getDomResult()",callback:(res)=>{
				                    console.info("getDomResult==>"+res)
                                    Utils.emitEvent(res,146)
                                }})
                            },3000)
                            break;
                        }
                        case "emitImageAccessFalse":{
                            this.imageAccess=false
                            await Utils.sleep(1000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"getImgResult()",callback:(res)=>{
				                    console.info("getImgResult==>"+res)
                                    Utils.emitEvent(res,148)
                                }})
                            },3000)
                            break;
                        }
                        case "emitImageAccessTrue":{
                            this.imageAccess=true
                            await Utils.sleep(1000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"getImgResult()",callback:(res)=>{
				                    console.info("getImgResult==>"+res)
                                    Utils.emitEvent(res,150)
                                }})
                            },3000)
                            break;
                        }
                        case "emitOnlineImageAccessFalse":{
                            this.onlineImageAccess=false
                            await Utils.sleep(1000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/onlineImageAccess.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"getImageLoadResult()",callback:(res)=>{
				                    console.info("getImageLoadResult==>"+res)
                                    Utils.emitEvent(res,156)
                                }})
                            },3000)
                            break;
                        }
                        case "emitOnlineImageAccessTrue":{
                            this.onlineImageAccess=true
                            await Utils.sleep(1000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/onlineImageAccess.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"getImageLoadResult()",callback:(res)=>{
				                    console.info("getImageLoadResult==>"+res)
                                    Utils.emitEvent(res,158)
                                }})
                            },3000)
                            break;
                        }
                        case "emitDatabaseAccessTrue":{
                            this.databaseAccess=true
                            await Utils.sleep(2000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/databaseAccess.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"getDataResult()",callback:(res)=>{
				                    console.info("getDataResult==>"+res)
                                    Utils.emitEvent(res,164)
                                }})
                            },3000)
                            break;
                        }
                        case "emitOnPrompt":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"toPrompt()"})
                            },3000)
                            break;
                        }
                        case "emitCacheModeOnly":{
                            this.cacheError=true
                            this.cacheMode=CacheMode.Only
                            await Utils.sleep(2000)
                            this.controller.loadUrl({url:"https://www.openharmony.cn/mainPlay"})
                            break;
                        }
                        case "emitCacheModeDefault":{
                            this.cacheMode=CacheMode.Default
                            await Utils.sleep(2000)
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"gettitle()",callback:(res)=>{
                                    Utils.emitEvent(res,184)
                                }}) 
                            },3000)
                            break;
                        }
                        case "emitMixedModeNone":{
                            this.mixedSwitch=true
                            this.mixedMode=MixedMode.None
                            await Utils.sleep(2000)
                            this.controller.loadUrl({url:"https://mixed-script.badssl.com"})
                            break;
                        }
                        case "emitMixedModeAll":{
                            this.mixedAllSwitch=true
                            this.mixedMode=MixedMode.All
                            await Utils.sleep(2000)
                            this.controller.loadUrl({url:"https://mixed-script.badssl.com"})
                            break;
                        }
                        case "emitFileAccessTrue":{
                            this.fileAccess=true
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            this.controller.runJavaScript({script:"openRawFile()"})
                            setTimeout(()=>{
                                this.controller.runJavaScript({script:"gettitle()",callback:(res)=>{
                                    Utils.emitEvent(res,190)
                                }})
                            },3000)
                            break;
                        }
                        case "emitOnPageBegin":{                           
                            Utils.emitEvent(this.pageBegin,59)
                            break;
                        }
                        case "emitOnPageEnd":{                           
                            Utils.emitEvent(this.pageBegin,60)
                            break;
                        }
                        case "emitOnConsole":{                           
                            this.controller.runJavaScript({script:"consoleTest()"})
                            setTimeout(()=>{                          
                                Utils.emitEvent(this.console,62)
                            },3000)
                            break;
                        }
                        case "emitOnAlert":{                           
                            this.controller.runJavaScript({script:"alertTest()"})
                            setTimeout(()=>{                          
                                Utils.emitEvent(this.alert,63)
                            },3000)
                            break;
                        }
                        case "emitOnConfirm":{                           
                            this.controller.runJavaScript({script:"confirmTest()"})
                            setTimeout(()=>{                          
                                Utils.emitEvent(this.confirm,64)
                            },3000)
                            break;
                        }
                        case "emitOnErrorReceive":{                           
                            this.controller.loadUrl({url:'http://192.168.5.40:9006/sso_web/html/H5/doctor/aboutUs.html'})
                            setTimeout(()=>{     
                                this.controller.loadUrl({url:'http://192.168.5.40:9006/sso_web/html/H5/doctor/aboutUs.html'}) 
                                setTimeout(() => {
                                    Utils.emitEvent(this.errorReceive,65)
                                },3000)                                                 
                            },3000)
                            break;
                        }
                        case "emitOnHttpErrorReceive":{  
                            this.isHttpErrorReceive=true
                            await Utils.sleep(1000)
                            this.controller.loadUrl({url:'https://example1.com/path/does/not/exist/index.jsp'})
                            break;
                        }
                        case "emitOnTitleReceive":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            setTimeout(()=>{
                                Utils.emitEvent(this.titleReceive,67)
                            },3000)
                            break;
                        }
                        case "emitOnDownloadStart":{        
                            this.isDownloadStart=true
                            await Utils.sleep(1000)           
                            this.controller.loadUrl({url:"https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/mobileservices/2022/download/PC107f1b3947c942ffaa14334a879065d8.2107261020.exe"})
                            break;
                        }
                        case "emitZoom":{
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            this.controller.zoom(2)
                            setTimeout(()=>{                    
                                this.controller.runJavaScript({script:"getPageHeight()",callback:(res)=>{
                                console.info("getPageHeight++++++"+res)
                                    if(Number(res) > 1400){
                                    var zoomCalled = true
                                }
                                Utils.emitEvent(zoomCalled,77)
                                }})                                                                                                           
                            },5000)
                            break;
                        }
                        case "emitClearHistory":{                           
                            this.controller.loadUrl({url:"http://www.baidu.com/"})
                            setTimeout(()=>{    
                                this.controller.clearHistory()
                                setTimeout(() => {
                                    let clearHistoryCalled = this.controller.accessBackward()
                                    Utils.emitEvent(clearHistoryCalled,82) 
                                },5000)                                                                                                              
                            },10000)
                            break;
                        }
                        case "emitStop":{                           
                            this.controller.loadUrl({url:"http://appgallery.huawei.com/"})
                            this.controller.stop()
                            setTimeout(()=>{    
                                var stopCalled = false
                                if(this.pageEnd !== 'http://appgallery.huawei.com/'){
                                    stopCalled = true
                                }  
                                Utils.emitEvent(stopCalled,83)                                                                                                            
                            },3000)
                            break;
                        }
                        case "emitOnInactive":{       
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});                    
                            this.controller.onInactive()
                            setTimeout(()=>{    
                                this.controller.runJavaScript({script:"gettitle()",callback:(res)=>{
                                    console.info("gettitle++++++"+res)
                                    Utils.emitEvent(res,84)
                                }})                                                                                                            
                            },3000)
                            break;
                        }
                        case "emitOnActive":{                           
                            this.controller.onActive()
                            this.controller.loadUrl({url:"file:///data/storage/el1/bundle/phone/resources/rawfile/index.html"});
                            setTimeout(()=>{
                                let onActiveCalled = this.pageBegin
                                Utils.emitEvent(onActiveCalled,85)                                                                                                            
                            },5000)
                            break;
                        }
                        case "emitRegisterJavaScriptProxy":{                           
                            this.controller.registerJavaScriptProxy({object:this.jsObj,name:"objName",methodList:["test","toString","register"]})
                            this.controller.refresh()
                            setTimeout(()=>{   
                                this.controller.runJavaScript({script:"proxy()"})                                                                                                                                                                   
                            },3000)
                            break;
                        }
                        case "emitDeleteJavaScriptRegister":{                           
                            this.controller.deleteJavaScriptRegister("objName")
                            this.controller.runJavaScript({script:"registerTest()"})
                            setTimeout(()=>{  
                                if(this.console !== "web222"){
                                    let deleteEntireCookieCalled = true
                                    Utils.emitEvent(deleteEntireCookieCalled,87)
                                }                                                                                                                                                               
                            },3000)
                            break;
                        }
                        case "emitJavaScriptAccess":{                           
                            this.javaScriptAccess = false
                            setTimeout(() => {
                                this.controller.runJavaScript({script:"jsAccess()"})
                                setTimeout(()=>{  
                                    if(this.console !== "web111"){
                                        let javaScriptAccessCalled = true
                                        Utils.emitEvent(javaScriptAccessCalled,88)
                                    }                                                                                                                                                               
                                },3000)  
                            },3000)                            
                            break;
                        }
                        default:
                            console.info("can not match case")
                    }
                })
            }
        }
    }
}