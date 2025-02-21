/*
 * Copyright (c) 2021~2023 Huawei Device Co., Ltd.
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
import fileio from '@ohos.fileio';
import prompt from '@system.prompt';
let loadedUrl;

let storage: LocalStorage = new LocalStorage({ 'PropA': 47 });

@Entry
@Component

struct Index {
    controller: web_webview.WebviewController = new web_webview.WebviewController();
    @State outputStr: string = ''
    @State playing: boolean = false
    @State str:string="emitOnLoadIntercept"
    


    
    
    

    
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
                        case "emitOnLoadIntercept":{  
                                this.controller.loadUrl("https://www.baidu.com/")                                                                                                                          
                            break;
                        }
                        case "emitClear":{
                            AppStorage.SetOrCreate('PropA', 47);
                            let res: boolean = AppStorage.Clear();
                            console.log("emitClear====>"+res)
                            Utils.emitEvent(res,6) 
                            break;
                        }
                        case "emitKeys":{
                            AppStorage.SetOrCreate('PropA', 48);
                            let keys: IterableIterator<string> = AppStorage.Keys();
                            Utils.emitEvent(JSON.stringify(Array.from(keys)),8) 
                            break;
                        }
                        case "emitSize":{
                            AppStorage.SetOrCreate('PropA', 48);
                            let res: number = AppStorage.Size();        
                            console.log("emitSize====>"+res)
                            Utils.emitEvent(res,10) 
                            await Utils.sleep(3000)
                            console.log("emitSize"+AppStorage.Delete('emitSize'))
                            break;
                        }
                        case "emitLocalStorageSize":{
                            Utils.emitEvent(storage.size(),12)  
                            break;
                        }
                        case "emitLink":{
                            AppStorage.SetOrCreate('Link', 47);
                            let linkToPropA1 = AppStorage.Link('Link');
                            let linkToPropA2 = AppStorage.Link('Link');
                            linkToPropA1.set(48);
                            Utils.emitEvent(linkToPropA2.get(),14)
                            break;
                        }
                        case "emitLinkUndefined":{
                            AppStorage.SetOrCreate('LinkUndefined', 47);
                            Utils.emitEvent(AppStorage.Link('PropB'),16)
                            break;
                        }
                        case "emitSetAndLinkCreate":{
                            let link:SubscribedAbstractProperty<number> = AppStorage.SetAndLink('LinkCreate', 49);
                            Utils.emitEvent(link.get(),18)
                            break;
                        }
                        case "emitProp":{
                            AppStorage.SetOrCreate('Prop', 47);
                            let prop1 = AppStorage.Prop('Prop');
                            let prop2 = AppStorage.Prop('Prop');
                            prop1.set(1);
                            console.log("emitProp====>"+prop2.get())
                            Utils.emitEvent(prop2.get(),20)  
                            break;
                        }
                        case "emitPropUndefined":{
                            Utils.emitEvent(AppStorage.Prop('xxxxxx'),22)  
                            break;
                        }
                        case "emitSetAndLink":{
                            AppStorage.SetOrCreate('SetAndLink', 47);
                            let link: SubscribedAbstractProperty<number> = AppStorage.SetAndLink('SetAndLink', 50);
                            console.log("emitSetAndLink====>"+link.get())
                            Utils.emitEvent(link.get(),24)
                            break;
                        }
                        
                        case "emitSetAndPropNull":{
                            AppStorage.SetOrCreate('SetAndPropNull', 47);
                            let prop: SubscribedAbstractProperty<number> = AppStorage.SetAndProp('SetAndPropNull1', 49);
                            console.log("emitSetAndPropNull====>"+prop.get())
                            Utils.emitEvent(prop.get(),26)  
                            break;
                        }
                        case "emitSetAndProp":{
                            AppStorage.SetOrCreate('SetAndProp', 47);
                            let prop: SubscribedAbstractProperty<number> = AppStorage.SetAndProp('SetAndProp', 49);
                            console.log("emitSetAndProp====>"+prop.get())
                            Utils.emitEvent(prop.get(),28) 
                            break;
                        }
                        case "emitDelete":{
                            AppStorage.SetOrCreate('Delete', 48);
                            let res: boolean = AppStorage.Delete('Delete');
                            console.log("emitDelete====>"+res)
                            Utils.emitEvent(res,30)  
                            break;
                        }
                    

                        
                        


                        default:
                            console.info("can not match case")
                    }
                })
            }
            Web({src:"www.example.com",controller:this.controller})
            .onLoadIntercept((event) => {
                console.log('url:' + event.data.getRequestUrl())
                Utils.emitEvent(event.data.getRequestUrl(),2)
                console.log('isMainFrame:' + event.data.isMainFrame())
                console.log('isRedirect:' + event.data.isRedirect())
                console.log('isRequestGesture:' + event.data.isRequestGesture())
                return false
            })

            .onErrorReceive((event) => {
                console.log('getErrorInfo:' + event.error.getErrorInfo())
                Utils.emitEvent(event.error.getErrorInfo(),3)
            })
           
        }
    }
}