/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect, beforeAll} from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import router from '@system.router';
import Utils from './Utils.ets';
let emitKey = "emitGetCertificate";
export default function stateTwoJsunit() {
  describe('ActsAceStateTwoTest', function () {
    
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/stateTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stateTwo state success " + JSON.stringify(pages));
        if (!("stateTwo" == pages.name)) {
          console.info("get stateTwo state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push stateTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stateTwo page error: " + err);
      }
      done()
    });

    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("stateTwo beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("stateTwo afterEach start:"+emitKey);
      try {
            let backData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent = {
                eventId:10,
                priority:events_emitter.EventPriority.LOW
            }
            console.info("start send emitKey");
            events_emitter.emit(backEvent, backData);
      } catch (err) {
            console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_001                                                                                                                                                                     
     *tc.name GetCertificate                                                                                                                                                                                                                 
     *tc.desic Sets allow the Web access overview mode
     */
    it('GetCertificate',0,async function(done){
      emitKey="emitGet";
      Utils.registerEvent("GetCertificate","getCertificate success: len = 0",4,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('Get',0,async function(done){
      emitKey="emitHas";
      Utils.registerEvent("Get",47,32,done);
      sendEventByKey('webcomponenttwo',10,'');
    })


    it('Has',0,async function(done){
      emitKey="emitSet";
      Utils.registerEvent("Has",true,5,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('Set',0,async function(done){
      emitKey="emitSetFalse";
      Utils.registerEvent("Set",true,6,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('SetFalse',0,async function(done){
      emitKey="emitGetUndefined";
      Utils.registerEvent("SetFalse",false,40,done);
      sendEventByKey('webcomponenttwo',10,'');
    })

    

    it('GetUndefined',0,async function(done){
      emitKey="emitIsMutable";
      Utils.registerEvent("GetUndefined",undefined,34,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('IsMutable',0,async function(done){
      emitKey="emitHasFalse";
      Utils.registerEvent("IsMutable",true,36,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('HasFalse',0,async function(done){
      emitKey="emitSetOrCreate";
      Utils.registerEvent("HasFalse",false,38,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('SetOrCreate',0,async function(done){
      emitKey="emitSetOrCreateTwo";
      Utils.registerEvent("SetOrCreate",121,42,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('SetOrCreateTwo',0,async function(done){
      emitKey="emitLocalStorageClear";
      Utils.registerEvent("SetOrCreateTwo",121,44,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    
    
    it('LocalStorageClear',0,async function(done){
      emitKey="emitLocalStorageClearFalse";
      Utils.registerEvent("LocalStorageClear",true,64,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageClearFalse',0,async function(done){
      emitKey="emitLocalStorageHas";
      Utils.registerEvent("LocalStorageClearFalse",false,66,done);
      sendEventByKey('webcomponenttwo',10,'');
    })

    it('LocalStorageHas',0,async function(done){
      emitKey="emitLocalStorageHasNull";
      Utils.registerEvent("LocalStorageHas",true,46,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageHasNull',0,async function(done){
      emitKey="emitLocalStorageSet";
      Utils.registerEvent("LocalStorageHasNull",false,48,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageSet',0,async function(done){
      emitKey="emitLocalStorageSetNull";
      Utils.registerEvent("LocalStorageSet",true,50,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageSetNull',0,async function(done){
      emitKey="emitLocalStoragesetOrCreate";
      Utils.registerEvent("LocalStorageSetNull",false,52,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStoragesetOrCreate',0,async function(done){
      emitKey="emitLocalStoragesetOrCreateNull";
      Utils.registerEvent("LocalStoragesetOrCreate",true,54,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStoragesetOrCreateNull',0,async function(done){
      emitKey="emitLocalStorageLink";
      Utils.registerEvent("LocalStoragesetOrCreateNull",true,56,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageLink',0,async function(done){
      emitKey="emitLocalStorageLinkNull";
      Utils.registerEvent("LocalStorageLink",48,58,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageLinkNull',0,async function(done){
      emitKey="emitLocalStoragesetsetAndLink";
      Utils.registerEvent("LocalStorageLinkNull",undefined,60,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStoragesetsetAndLink',0,async function(done){
      emitKey="emitLocalStoragesetsetAndLinkTwo";
      Utils.registerEvent("LocalStoragesetsetAndLink",49,68,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStoragesetsetAndLinkTwo',0,async function(done){
      emitKey="emitLocalStorageProp";
      Utils.registerEvent("LocalStoragesetsetAndLinkTwo",48,70,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageProp',0,async function(done){
      emitKey="emitLocalStoragePropNull";
      Utils.registerEvent("LocalStorageProp",48,72,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStoragePropNull',0,async function(done){
      emitKey="emitLocalStorageSetAndProp";
      Utils.registerEvent("LocalStoragePropNull",undefined,74,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageSetAndProp',0,async function(done){
      emitKey="emitLocalStorageSetAndPropTwo";
      Utils.registerEvent("LocalStorageSetAndProp",49,76,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageSetAndPropTwo',0,async function(done){
      emitKey="emitLocalStorageDelete";
      Utils.registerEvent("LocalStorageSetAndPropTwo",48,78,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageDelete',0,async function(done){
      emitKey="emitLocalStorageDeleteFalse";
      Utils.registerEvent("LocalStorageDelete",true,80,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageDeleteFalse',0,async function(done){
      emitKey="emitLocalStorageGet";
      Utils.registerEvent("LocalStorageDeleteFalse",false,82,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageGet',0,async function(done){
      emitKey="emitLocalStorageGetFalse";
      Utils.registerEvent("LocalStorageGet",48,84,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageGetFalse',0,async function(done){
      emitKey="emitLocalStorageKeys";
      Utils.registerEvent("LocalStorageGetFalse",undefined,86,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageKeys',0,async function(done){
      emitKey="emitPersistPropCover";
      let result = ["PropA"]
      Utils.registerEvent("LocalStorageKeys",JSON.stringify(result),88,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('PersistPropCover',0,async function(done){
      emitKey="emitPersistKeys";
      Utils.registerEvent("PersistPropCover",666,90,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('PersistKeys',0,async function(done){
      emitKey="emitPersistPropLasting";
      let persistKeys=["highScore"]
      Utils.registerEvent("PersistKeys",JSON.stringify(persistKeys),96,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('PersistPropLasting',0,async function(done){
      emitKey="emitDeleteProp";
      Utils.registerEvent("PersistPropLasting",false,92,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('DeleteProp',0,async function(done){
      emitKey="emitPersistProps";
      let deleteProp=["highScore","Lasting"]
      Utils.registerEvent("DeleteProp",JSON.stringify(deleteProp),94,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('PersistProps',0,async function(done){
      emitKey="emitEnvironmentKeys";
      Utils.registerEvent("PersistProps","1",98,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('EnvironmentKeys',0,async function(done){
      emitKey="emitGetShared";
      let environmentKeys = ["aa","bb","cc"]
      Utils.registerEvent("EnvironmentKeys",JSON.stringify(environmentKeys),100,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('GetShared',0,async function(done){
      emitKey="emitLocalStoragePropBind";
      Utils.registerEvent("GetShared",undefined,102,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStoragePropBind',0,async function(done){
      emitKey="emitLocalStoragePropBindTwo";
      Utils.registerEvent("LocalStoragePropBind",88,104,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStoragePropBindTwo',0,async function(done){
      emitKey="emitLocalStoragePropBindNull";
      Utils.registerEvent("LocalStoragePropBindTwo",100,106,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStoragePropBindNull',0,async function(done){
      emitKey="emitLocalStorageLinkBind";
      Utils.registerEvent("LocalStoragePropBindNull",1,108,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageLinkBind',0,async function(done){
      emitKey="emitLocalStoragePropCaseNull";
      Utils.registerEvent("LocalStorageLinkBind",1000,110,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStoragePropCaseNull',0,async function(done){
      emitKey="emitEnvironmentTypeString";
      Utils.registerEvent("LocalStoragePropCaseNull",1,112,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('EnvironmentTypeString',0,async function(done){
      emitKey="emitEnvironmentTypeNum";
      Utils.registerEvent("EnvironmentTypeString",true,114,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('EnvironmentTypeNum',0,async function(done){
      emitKey="emitEnvironmentTypeBoo";
      Utils.registerEvent("EnvironmentTypeNum",true,116,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('EnvironmentTypeBoo',0,async function(done){
      emitKey="emitEnvironmentTypeEnum";
      Utils.registerEvent("EnvironmentTypeBoo",true,118,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('EnvironmentTypeEnum',0,async function(done){
      emitKey="emitLocalStorageLinkType";
      Utils.registerEvent("EnvironmentTypeEnum",true,120,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageLinkType',0,async function(done){
      emitKey="emitLocalStorageLinkTypeTwo";
      Utils.registerEvent("LocalStorageLinkType",true,122,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageLinkTypeTwo',0,async function(done){
      emitKey="emitLocalStoragePropTypeTwo";
      Utils.registerEvent("LocalStorageLinkTypeTwo",true,124,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStoragePropTwo',0,async function(done){
      emitKey="emitLocalStoragePropType";
      let LocalStoragePropTwo=[3,"enen",true,1]
      Utils.registerEvent("LocalStoragePropTwo",JSON.stringify(LocalStoragePropTwo),126,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    it('LocalStorageLinkTypeTwo',0,async function(done){
      emitKey="emitLocalStoragePropType";
      Utils.registerEvent("LocalStorageLinkTypeTwo",true,128,done);
      sendEventByKey('webcomponenttwo',10,'');
    })

  })
}