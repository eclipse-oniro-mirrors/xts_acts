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

function Uint8ArrayToString(dataArray) {
  var dataString = ''
  for (var i = 0; i < dataArray.length; i++) {
    dataString += String.fromCharCode(dataArray[i])
  }
  return dataString
}

function ParseX509CertInfo(x509CertArray) {
  let res: string = 'getCertificate success: len = ' + x509CertArray.length;
  for (let i = 0; i < x509CertArray.length; i++) {
    res += ', index = ' + i + ', issuer name = '
    + Uint8ArrayToString(x509CertArray[i].getIssuerName().data) + ', subject name = '
    + Uint8ArrayToString(x509CertArray[i].getSubjectName().data) + ', valid start = '
    + x509CertArray[i].getNotBeforeTime()
    + ', valid end = ' + x509CertArray[i].getNotAfterTime()
  }
  return res
}

class Test2{
    value : number
    constructor(value : number){
        this.value =value
    }
}

let storage: LocalStorage = new LocalStorage({ 'PropA': 47 });
enum KFC{A = 1 ,B,C}



@Entry(storage)
@Component
struct Second {
    @State outputStr: string = ''
    webviewCtl: web_webview.WebviewController = new web_webview.WebviewController();
    @State str:string="emitGetCertificate"

    @LocalStorageLink('Test2') storLink2: Test2 = {value :999};
    @LocalStorageLink('LinkType') storLink3: Array<any> = [3,"enen",true,KFC.A];
    @LocalStorageProp('Bind') storProp1: number = 1;
    @LocalStorageProp('') storProp2: number = 1;
    @LocalStorageLink('LinkBind') storLinkBind: number = 1;
    @LocalStorageProp('CaseNull') storProp3: number = 1;
    @LocalStorageProp('PropBind') storProp4: Array<any> = [3,"enen",true,KFC.A];
    @LocalStorageProp('PropTest2') storProp5: Test2 = {value :999};

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
                        case "emitGetCertificate":{
                            this.webviewCtl.loadUrl('https://www.baidu.com')
                            try {
                                this.webviewCtl.getCertificate().then(x509CertArray => {
                                this.outputStr = ParseX509CertInfo(x509CertArray);
                                console.info('11111111111111'+this.outputStr)
                                Utils.emitEvent(this.outputStr,4)
                                })
                            } catch (error) {
                                this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                            }
                        break;
                        }
                        case "emitGet":{
                            AppStorage.SetOrCreate('emitGet', 47);
                            let value: number = AppStorage.Get('emitGet'); 
                            console.log("emitGet====>"+value)
                            Utils.emitEvent(value,32) 
                            break;
                        }
                        case "emitHas":{
                            AppStorage.SetOrCreate('PropA', 47);
                            console.log("emitHas====>"+AppStorage.Has('PropA'))
                            Utils.emitEvent(AppStorage.Has('PropA'),5)                                                                                              
                            break;
                        }
                        case "emitSet":{
                            AppStorage.SetOrCreate('Set', 48);
                            console.log("emitSet====>"+AppStorage.Set('Set', 47))
                            Utils.emitEvent(AppStorage.Set('Set', 47),6)                                                                                                   
                            break;
                        }
                        case "emitSetFalse":{
                            console.log("emitSet====>"+AppStorage.Set('emitSetFalse', 47))
                            Utils.emitEvent(AppStorage.Set('emitSetFalse', 47),40)                                                                                                     
                            break;
                        }
                        
                        
                        
                        
                        
       
                        case "emitGetUndefined":{
                            AppStorage.SetOrCreate('emitGetUndefined', 47);
                            let value: number = AppStorage.Get('emitGetUndefined1'); 
                            console.log("emitGetUndefined====>"+value)
                            Utils.emitEvent(value,34) 
                            await Utils.sleep(3000)
                            break;
                        }
                        case "emitIsMutable":{
                            AppStorage.SetOrCreate('emitIsMutable', 47);
                            let res: boolean = AppStorage.IsMutable('emitIsMutable');
                            console.log("emitIsMutable====>"+res)
                            Utils.emitEvent(res,36) 
                            break;
                        }
                        case "emitHasFalse":{
                            AppStorage.SetOrCreate('emitHasFalse', 47);
                            console.log("emitHasFalse====>"+AppStorage.Has('emitHasFalse11'))
                            Utils.emitEvent(AppStorage.Has('emitHasFalse11'),38)                                                                                              
                            break;
                        }
                        case "emitSetOrCreate":{
                            AppStorage.SetOrCreate('emitSetOrCreate', 121);       
                            Utils.emitEvent(AppStorage.Get('emitSetOrCreate'),42)                                                                                 
                            break;
                        }
                        case "emitSetOrCreateTwo":{
                            AppStorage.SetOrCreate('emitSetOrCreateTwo', 47);
                            AppStorage.SetOrCreate('emitSetOrCreateTwo', 121);       
                            Utils.emitEvent(AppStorage.Get('emitSetOrCreateTwo'),44)                                                                                 
                            break;
                        }
                        
                        
                        case "emitLocalStorageClear":{
                            let storage1: LocalStorage = new LocalStorage({ 'PropA': 47 });
                            Utils.emitEvent(storage1.clear(),64)  
                            break;
                        }
                        case "emitLocalStorageClearFalse":{
                            let storage2: LocalStorage = new LocalStorage({ 'PropA': 47 });
                            storage2.link('PropA');
                            Utils.emitEvent(storage2.delete('PropA'),66)  
                            break;
                        }
                        
                        case "emitLocalStorageHas":{
                            Utils.emitEvent(storage.has('PropA'),46)  
                            break;
                        }
                        case "emitLocalStorageHasNull":{
                            Utils.emitEvent(storage.has('PropAA'),48)  
                            break;
                        }
                        case "emitLocalStorageSet":{
                            Utils.emitEvent(storage.set('PropA',47),50)  
                            break;
                        }
                        case "emitLocalStorageSetNull":{
                            Utils.emitEvent(storage.set('PropAA',47),52)  
                            break;
                        }
                        case "emitLocalStoragesetOrCreate":{
                            Utils.emitEvent(storage.setOrCreate('PropA', 48),54)  
                            break;
                        }
                        case "emitLocalStoragesetOrCreateNull":{
                            Utils.emitEvent(storage.setOrCreate('PropB', 48),56)  
                            break;
                        }
                        case "emitLocalStorageLink":{
                            let linkToPropA1: SubscribedAbstractProperty<number> = storage.link('PropA');
                            let linkToPropA2: SubscribedAbstractProperty<number> = storage.link('PropA'); 
                            linkToPropA1.set(48); 
                            Utils.emitEvent(linkToPropA2.get(),58)  
                            break;
                        }
                        case "emitLocalStorageLinkNull":{
                            Utils.emitEvent(storage.link('PropAA'),60)  
                            break;
                        }
                        case "emitLocalStoragesetsetAndLink":{
                            let link1: SubscribedAbstractProperty<number> = storage.setAndLink('PropBb', 49)
                            Utils.emitEvent(link1.get(),68)  
                            break;
                        }
                        case "emitLocalStoragesetsetAndLinkTwo":{
                            let link2: SubscribedAbstractProperty<number> = storage.setAndLink('PropA', 121)
                            Utils.emitEvent(link2.get(),70)  
                            break;
                        }
                        case "emitLocalStorageProp":{
                            let prop1: SubscribedAbstractProperty<number> = storage.prop('PropA');
                            let prop2: SubscribedAbstractProperty<number> = storage.prop('PropA');
                            prop1.set(1);
                            Utils.emitEvent(prop2.get(),72) 
                            break;
                        }
                        case "emitLocalStoragePropNull":{
                            Utils.emitEvent(storage.prop('PropAaA'),74) 
                            break;
                        }
                        case "emitLocalStorageSetAndProp":{
                            let prop: SubscribedAbstractProperty<number> = storage.setAndProp('PropBbB', 49);
                            Utils.emitEvent(prop.get(),76) 
                            break;
                        }
                        case "emitLocalStorageSetAndPropTwo":{
                            let prop1: SubscribedAbstractProperty<number> = storage.setAndProp('PropA', 121);
                            Utils.emitEvent(prop1.get(),78) 
                            break;
                        }
                        case "emitLocalStorageDelete":{
                            let storage3: LocalStorage = new LocalStorage({ 'PropA': 47 });
                            Utils.emitEvent(storage3.delete('PropA'),80) 
                            break;
                        }
                        case "emitLocalStorageDeleteFalse":{
                            let storage4: LocalStorage = new LocalStorage({ 'PropA': 47 });
                            storage4.link('PropA');
                            Utils.emitEvent(storage4.delete('PropA'),82) 
                            break;
                        }
                        case "emitLocalStorageGet":{
                            Utils.emitEvent(storage.get('PropA'),84) 
                            break;
                        }
                        case "emitLocalStorageGetFalse":{
                            Utils.emitEvent(storage.get('PropAaA'),86) 
                            break;
                        }
                        case "emitLocalStorageKeys":{
                            let storage5: LocalStorage = new LocalStorage({ 'PropA': 47 });
                            let keys: IterableIterator<string> = storage5.keys();
                            
                            Utils.emitEvent(JSON.stringify(Array.from(keys)),88) 
                            break;
                        }
                        case "emitPersistPropCover":{
                            PersistentStorage.PersistProp('highScore', '0');
                            AppStorage.SetOrCreate('highScore', 666);
                            Utils.emitEvent(AppStorage.Get('highScore'),90)
                            break;
                        }
                        case "emitPersistKeys":{
                            let keys: Array<string> = PersistentStorage.Keys();
                            console.log("emitPersistKeys====>"+keys)
                            Utils.emitEvent(JSON.stringify(keys),96)
                            break;
                        }
                        case "emitPersistPropLasting":{
                            PersistentStorage.PersistProp('Lasting', '0');
                            Utils.emitEvent(AppStorage.Delete('Lasting'),92)
                            break;
                        }
                        case "emitDeleteProp":{
                            
                            PersistentStorage.PersistProp('soon', '0');
                            PersistentStorage.DeleteProp('soon');
                            let keys: Array<string> = PersistentStorage.Keys();
                            Utils.emitEvent(JSON.stringify(keys),94)
                            break;
                        }
                        case "emitPersistProps":{
                            PersistentStorage.PersistProps([{ key: 'lowScore', defaultValue: '1' }, { key: 'wightScore', defaultValue: '1' }]);
                            Utils.emitEvent(AppStorage.Get('lowScore'),98)
                            break;
                        }
                        case "emitEnvironmentKeys":{
                            Environment.EnvProps([{ key: 'aa', defaultValue: 'default' },
                                                    {key: 'bb',defaultValue: 'en'}, 
                                                    { key: 'cc', defaultValue: 'hhhh' }]);
                            let keys: Array<string> = Environment.Keys();
                            Utils.emitEvent(JSON.stringify(keys),100)
                            break;
                        }
                        case "emitGetShared":{
                            let storage: LocalStorage = LocalStorage.GetShared();
                            console.log("emitGetShared"+storage)
                            Utils.emitEvent(storage,102)
                            break;
                        }
                        case "emitLocalStoragePropBind":{
                            let storage = new LocalStorage({ 'Bind': 88 });
                            this.storProp1 += 1
                            console.log("emitLocalStorageProp1"+storage)
                            console.log("emitLocalStorageProp1"+this.storProp1)
                            Utils.emitEvent(storage.get('Bind'),104)
                            break;
                        }
                        case "emitLocalStoragePropBindTwo":{
                            let storage = new LocalStorage({ 'Bind': 88 });
                            this.storProp1 = 100
                            console.log("emitLocalStorageProp1"+storage)
                            console.log("emitLocalStorageProp1"+this.storProp1)
                            Utils.emitEvent(this.storProp1,106)
                            break;
                        }
                        case "emitLocalStoragePropBindNull":{
                            let storage = new LocalStorage({ 'Null': 88 });
                            this.storProp2 = 1
                            Utils.emitEvent(this.storProp2,108)
                            break;
                        }
                        case "emitLocalStorageLinkBind":{
                            this.storLinkBind = 1000
                            Utils.emitEvent(storage.get('LinkBind'),110)
                            break;
                        }
                        case "emitLocalStoragePropCaseNull":{
                            Utils.emitEvent(storage.get('CaseNull'),112)
                            break;
                        }
                        case "emitEnvironmentTypeString":{
                            Environment.EnvProp('one', "en");
                            Environment.EnvProp('two', 2);
                            Environment.EnvProps([{ key: 'three', defaultValue: true }, {
                                key: 'four',
                                defaultValue: KFC.A
                                }]);
                            Utils.emitEvent(AppStorage.Has('one'),114)
                            break;
                        }
                        case "emitEnvironmentTypeNum":{
                            Utils.emitEvent(AppStorage.Has('two'),116)
                            break;
                        }
                        case "emitEnvironmentTypeBoo":{
                            Utils.emitEvent(AppStorage.Has('three'),118)
                            break;
                        }
                        case "emitEnvironmentTypeEnum":{
                            Utils.emitEvent(AppStorage.Has('four'),120)
                            break;
                        }
                        case "emitLocalStorageLinkType":{
                            Utils.emitEvent(storage.has('Test2'),122)
                            break;
                        }
                        case "emitLocalStorageLinkTypeTwo":{
                            console.log("emitLocalStorageLinkTypeTwo"+storage.get('LinkType'))
                            Utils.emitEvent(storage.has('LinkType'),124)
                            
                            break;
                        }
                        case "emitLocalStoragePropTypeTwo":{
                            console.log("emitLocalStoragePropTwo"+storage.get('PropBind'))
                            Utils.emitEvent(JSON.stringify(this.storProp4),126)
                            break;
                        }
                        case "emitLocalStoragePropType":{
                            console.log("emitLocalStoragePropTwo"+this.storProp5)
                            Utils.emitEvent(storage.has('PropTest2'),128)
                            break;
                        }
                        
                        default:
                            console.info("can not match case");
                    }
                })
            }
            Web({ src: 'https://www.example.com', controller: this.webviewCtl })
            .fileAccess(true)
            .javaScriptAccess(true)
            .domStorageAccess(true)
            .onlineImageAccess(true)
            .onPageEnd((e) => {
                this.outputStr = 'onPageEnd : url = ' + e.url
            })
        }
    }
}