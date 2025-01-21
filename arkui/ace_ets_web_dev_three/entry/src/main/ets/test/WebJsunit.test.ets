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
let emitKey = "emitLoadUrl";
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
                eventId:100,
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
     *tc.name LoadUrl                                                                                                                                                                                                                
     *tc.desic load contents from url
     */
    it('LoadUrl',0,async function(done){
      emitKey="emitLoadData";
      Utils.registerContainEvent("LoadUrl","index",1,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_002                                                                                                                                                                  
     *tc.name LoadData                                                                                                                                                                                                                
     *tc.desic load contents from data
     */
    it('LoadData',0,async function(done){
      emitKey="emitBackward";
      Utils.registerEvent("LoadData","baidu",2,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_003                                                                                                                                                                 
     *tc.name Backward                                                                                                                                                                                                                
     *tc.desic back to the old page
     */
    it('Backward',0,async function(done){
      emitKey="emitForward";
      Utils.registerEvent("Backward","index",3,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_004                                                                                                                                                                 
     *tc.name Forward                                                                                                                                                                                                               
     *tc.desic go to the new page
     */
    it('Forward',0,async function(done){
      emitKey="emitAccessBackward";
      Utils.registerEvent("Forward","baidu",4,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_005                                                                                                                                                                   
     *tc.name AccessBackward                                                                                                                                                                                                                
     *tc.desic return whether there is a old page
     */
    it('AccessBackward',0,async function(done){
      emitKey="emitAccessForward";
      Utils.registerEvent("AccessBackward",true,5,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_006                                                                                                                                                                
     *tc.name AccessForward                                                                                                                                                                                                                
     *tc.desic return whether there is a new page
     */
    it('AccessForward',0,async function(done){
      emitKey="emitonInactive";
      Utils.registerEvent("AccessForward",false,6,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_007                                                                                                                                                                 
     *tc.name onInactive                                                                                                                                                                                                               
     *tc.desic make web component inactive
     */
     it('onInactive',0,async function(done){
      emitKey="emitonActive";
      Utils.registerEvent("onInactive","baidu",7,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_008                                                                                                                                                              
     *tc.name make web component active                                                                                                                                                                                                               
     *tc.desic return whether the third party cookie is allowed
     */
     it('onActive',0,async function(done){
      emitKey="emitRefresh";
      Utils.registerEvent("onActive","index",8,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_009                                                                                                                                                              
     *tc.name Refresh                                                                                                                                                                                                               
     *tc.desic refresh current page
     */
     it('Refresh',0,async function(done){
      emitKey="emitAccessStep";
      Utils.registerEvent("Refresh","index",9,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_010                                                                                                                                                             
     *tc.name AccessStep                                                                                                                                                                                                               
     *tc.desic return whether steps can be operated
     */
     it('AccessStep',0,async function(done){
      emitKey="emitClearHistory";
      Utils.registerEvent("AccessStep",true,10,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_011                                                                                                                                                             
     *tc.name ClearHistory                                                                                                                                                                                                               
     *tc.desic clear the browsing history
     */
     it('ClearHistory',0,async function(done){
      emitKey="emitGetHitTestValue";
      Utils.registerEvent("ClearHistory",false,11,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_012                                                                                                                                                             
     *tc.name GetHitTestValue                                                                                                                                                                                                               
     *tc.desic get the type of th clicked component
     */
     it('GetHitTestValue',0,async function(done){
      emitKey="emitRegisterJavaScriptProxy";
      Utils.registerEvent("GetHitTestValue","hitValue",12,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_013                                                                                                                                                           
     *tc.name RegisterJavaScriptProxy                                                                                                                                                                                                               
     *tc.desic register proxy with a specific name
     */
     it('RegisterJavaScriptProxy',0,async function(done){
      emitKey="emitDeleteJavaScriptRegister";
      Utils.registerEvent("RegisterJavaScriptProxy",'Web',13,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_014                                                                                                                                                           
     *tc.name DeleteJavaScriptRegister                                                                                                                                                                                                               
     *tc.desic delet specific proxy
     */
     it('DeleteJavaScriptRegister',0,async function(done){
      emitKey="emitZoom";
      Utils.registerEvent("DeleteJavaScriptRegister","17100008",14,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_015                                                                                                                                                           
     *tc.name Zoom                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('Zoom',0,async function(done){
      emitKey="emitSearchAllAsync";
      Utils.registerEvent("Zoom","17100004",15,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_016                                                                                                                                                          
     *tc.name SearchAllAsync                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('SearchAllAsync',0,async function(done){
      emitKey="emitClearMatches";
      Utils.registerEvent("SearchAllAsync","01",16,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_017                                                                                                                                                          
     *tc.name ClearMatches                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('ClearMatches',0,async function(done){
      emitKey="emitSearchNext";
      Utils.registerEvent("ClearMatches","17100001",17,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_018                                                                                                                                                         
     *tc.name SearchNext                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('SearchNext',0,async function(done){
      emitKey="emitClearSslCache";
      Utils.registerEvent("SearchNext","17100001",18,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_019                                                                                                                                                         
     *tc.name ClearSslCache                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('ClearSslCache',0,async function(done){
      emitKey="emitClearClientAuthenticationCache";
      Utils.registerEvent("ClearSslCache","17100001",19,done);
      sendEventByKey('webcomponent',10,'');
    })
     /* 
     *tc.number SUB_ACE_BASIC_ETS_API_020                                                                                                                                                      
     *tc.name ClearClientAuthenticationCache                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('ClearClientAuthenticationCache',0,async function(done){
      emitKey="emitStop";
      Utils.registerEvent("ClearClientAuthenticationCache","17100001",20,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_021                                                                                                                                                      
     *tc.name Stop                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('Stop',0,async function(done){
      emitKey="emitRequestFocus";
      Utils.registerEvent("Stop","17100001",21,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_022                                                                                                                                                      
     *tc.name RequestFocus                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('RequestFocus',0,async function(done){
      emitKey="emitZoomIn";
      Utils.registerEvent("RequestFocus","17100001",22,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_023                                                                                                                                                      
     *tc.name ZoomIn                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('ZoomIn',0,async function(done){
      emitKey="emitZoomOut";
      Utils.registerEvent("ZoomIn","17100001",23,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_024                                                                                                                                                      
     *tc.name ZoomOut                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('ZoomOut',0,async function(done){
      emitKey="emitGetWebId";
      Utils.registerEvent("ZoomOut","17100001",24,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_025                                                                                                                                                    
     *tc.name GetWebId                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('GetWebId',0,async function(done){
      emitKey="emitGetUserAgent";
      Utils.registerEvent("GetWebId","17100001",25,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_026                                                                                                                                                      
     *tc.name GetUserAgent                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('GetUserAgent',0,async function(done){
      emitKey="emitGetPageHeigth";
      Utils.registerEvent("GetUserAgent","17100001",26,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_027                                                                                                                                                      
     *tc.name GetPageHeigth                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('GetPageHeigth',0,async function(done){
      emitKey="emitBackOrForward";
      Utils.registerEvent("GetPageHeigth","17100001",27,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_028                                                                                                                                                      
     *tc.name BackOrForward                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
     it('BackOrForward',0,async function(done){
      emitKey="emitStoreWebArchive";
      Utils.registerEvent("BackOrForward","17100001",28,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_029                                                                                                                                                                     
     *tc.name StoreWebArchive                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('StoreWebArchive',0,async function(done){
      emitKey="emitGetUrl";
      Utils.registerContainEvent("StoreWebArchive","/data/storage/el2/base/",29,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_030                                                                                                                                                                     
     *tc.name GetUrl                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetUrl',0,async function(done){
      emitKey="emitOnce";
      Utils.registerContainEvent("GetUrl","17100001",30,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_031                                                                                                                                                                    
     *tc.name Once                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('Once',0,async function(done){
      emitKey="emitGetItemAtIndex";
      Utils.registerContainEvent("Once","a=b",31,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_032                                                                                                                                                                   
     *tc.name GetItemAtIndex                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetItemAtIndex',0,async function(done){
      emitKey="emitContextMenuMediaType";
      Utils.registerEvent("GetItemAtIndex","index",32,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_033                                                                                                                                                                  
     *tc.name ContextMenuMediaType                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('ContextMenuMediaType',0,async function(done){
      emitKey="emitContextMenuInputFieldType";
      Utils.registerEvent("ContextMenuMediaType",1,33,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_034                                                                                                                                                                 
     *tc.name ContextMenuInputFieldType                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('ContextMenuInputFieldType',0,async function(done){
      emitKey="emitContextMenuEditStateFlags";
      Utils.registerEvent("ContextMenuInputFieldType",1,34,done);
      Utils.registerEvent("ContextMenuInputFieldType",4,35,done);
      Utils.registerEvent("ContextMenuInputFieldType",5,36,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_035                                                                                                                                                                 
     *tc.name ContextMenuEditStateFlags                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('ContextMenuEditStateFlags',0,async function(done){
      emitKey="emitGetStoredGeolocation";
      Utils.registerEvent("ContextMenuEditStateFlags",0,37,done);
      Utils.registerEvent("ContextMenuEditStateFlags",1,38,done);
      Utils.registerEvent("ContextMenuEditStateFlags",2,39,done);
      Utils.registerEvent("ContextMenuEditStateFlags",4,40,done);
      Utils.registerEvent("ContextMenuEditStateFlags",8,41,done);
      sendEventByKey('webcomponent',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_036                                                                                                                                                               
     *tc.name GetStoredGeolocation                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetStoredGeolocation',0,async function(done){
      emitKey="emitGetStoredGeolocation";
      Utils.registerEvent("GetStoredGeolocation","file:///",120,done);
      sendEventByKey('webcomponent',10,'');
    })
  })
}