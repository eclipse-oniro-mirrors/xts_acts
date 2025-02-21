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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
let emitKey = "emitAllowGeolocation";
export default function webJsunit() {
  describe('ActsAceWebDevTest', function () {
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("web afterEach start:"+emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_API_067                                                                                                                                                                   
     *tc.name allowGeolocation                                                                                                                                                                                                                
     *tc.desic allow specific url to access the geolocation
     */
    it('allowGeolocation',0,async function(done){
      emitKey="emitDeleteGeolocation";
      Utils.registerEvent("allowGeolocation","file:///, result: true",402,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_068                                                                                                                                                                   
     *tc.name deleteGeolocation                                                                                                                                                                                                                
     *tc.desic delete specific restored geolocation
     */
    it('deletGeolocation',0,async function(done){
      emitKey="emitDeleteAllGeolocation";
      Utils.registerEvent("deletGeolocation","",404,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_069                                                                                                                                                                   
     *tc.name deletAllGeolocation                                                                                                                                                                                                                
     *tc.desic delete all restored geolocation
     */
    it('deletAllGeolocation',0,async function(done){
      emitKey="emitIsCookieAllowed";
      Utils.registerEvent("deletAllGeolocation","",406,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_070                                                                                                                                                                   
     *tc.name isCookieAllowed                                                                                                                                                                                                                
     *tc.desic return whether the cookie is allowed
     */
    it('isCookieAllowed',0,async function(done){
      emitKey="emitSaveCookieAsync";
      Utils.registerEvent("isCookieAllowed",false,408,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_071                                                                                                                                                                   
     *tc.name saveCookieAsync                                                                                                                                                                                                                
     *tc.desic return whether the cookie is allowed
     */
    it('saveCookieAsync',0,async function(done){
      emitKey="emitIsThirdPartyCookieAllowed";
      Utils.registerEvent("saveCookieAsync","result",410,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_072                                                                                                                                                                   
     *tc.name isThirdPartyCookieAllowed                                                                                                                                                                                                                
     *tc.desic return whether the third party cookie is allowed
     */
    it('isThirdPartyCookieAllowed',0,async function(done){
      emitKey="emitLoaData";
      Utils.registerEvent("isThirdPartyCookieAllowed",false,412,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_078                                                                                                                                                                  
     *tc.name loadData                                                                                                                                                                                                              
     *tc.desic load specific strings
     */
    it('loadData',0,async function(done){
      emitKey="emitZoomAccess";
      Utils.registerEvent("loadData","\"index\"",424,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_080                                                                                                                                                                  
     *tc.name zoomAccess                                                                                                                                                                                                              
     *tc.desic set whether it is allowed to zoom
     */
    it('zoomAccess',0,async function(done){
      emitKey="emitSaveHttpAuthCredentials";
      Utils.registerEvent("zoomAccess",false,428,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_087                                                                                                                                                               
     *tc.name saveHttpAuthCredentials                                                                                                                                                                                                              
     *tc.desic save credentials
     */
    it('saveHttpAuthCredentials',0,async function(done){
      emitKey="emitGetHttpAuthCredentials";
      Utils.registerEvent("saveHttpAuthCredentials",true,442,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_088                                                                                                                                                                
     *tc.name getHttpAuthCredentials                                                                                                                                                                                                              
     *tc.desic delete credentials
     */
    it('getHttpAuthCredentials',0,async function(done){
      emitKey="emitDeleteHttpAuthCredentials";
      Utils.registerEvent("getHttpAuthCredentials","Stromgol",444,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_089                                                                                                                                                                
     *tc.name deleteHttpAuthCredentials                                                                                                                                                                                                              
     *tc.desic delete credentials
     */
    it('deleteHttpAuthCredentials',0,async function(done){
      emitKey="emitDeleteHttpAuthCredentials";
      Utils.registerEvent("deleteHttpAuthCredentials",false,446,done);
      sendEventByKey('webcomponent',10,'');
    })
  })
}
