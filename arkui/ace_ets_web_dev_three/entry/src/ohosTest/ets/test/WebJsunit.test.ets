/*
 * Copyright (c) 2022~2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

let emitKey = "emitLoadUrl";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: 100,
          priority: events_emitter.EventPriority.LOW
        };
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_001                                                                                                                                                                     
     *tc.name LoadUrl                                                                                                                                                                                                                
     *tc.desic load contents from url
     */
    it('LoadUrl', 0, async (done: Function) => {
      emitKey = "emitLoadData";
      Utils.registerContainEvent("LoadUrl", "index", 1, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_002                                                                                                                                                                  
     *tc.name LoadData                                                                                                                                                                                                                
     *tc.desic load contents from data
     */
    it('LoadData', 0, async (done: Function) => {
      emitKey = "emitBackward";
      Utils.registerEvent("LoadData", "baidu", 2, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_003                                                                                                                                                                 
     *tc.name Backward                                                                                                                                                                                                                
     *tc.desic back to the old page
     */
    it('Backward', 0, async (done: Function) => {
      emitKey = "emitForward";
      Utils.registerEvent("Backward", "index", 3, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_004                                                                                                                                                                 
     *tc.name Forward                                                                                                                                                                                                               
     *tc.desic go to the new page
     */
    it('Forward', 0, async (done: Function) => {
      emitKey = "emitAccessBackward";
      Utils.registerEvent("Forward", "baidu", 4, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_005                                                                                                                                                                   
     *tc.name AccessBackward                                                                                                                                                                                                                
     *tc.desic return whether there is a old page
     */
    it('AccessBackward', 0, async (done: Function) => {
      emitKey = "emitAccessForward";
      Utils.registerEvent("AccessBackward", true, 5, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_006                                                                                                                                                                
     *tc.name AccessForward                                                                                                                                                                                                                
     *tc.desic return whether there is a new page
     */
    it('AccessForward', 0, async (done: Function) => {
      emitKey = "emitonInactive";
      Utils.registerEvent("AccessForward", false, 6, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_007                                                                                                                                                                 
     *tc.name onInactive                                                                                                                                                                                                               
     *tc.desic make web component inactive
     */
    it('onInactive', 0, async (done: Function) => {
      emitKey = "emitonActive";
      Utils.registerEvent("onInactive", "baidu", 7, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_008                                                                                                                                                              
     *tc.name make web component active                                                                                                                                                                                                               
     *tc.desic return whether the third party cookie is allowed
     */
    it('onActive', 0, async (done: Function) => {
      emitKey = "emitRefresh";
      Utils.registerEvent("onActive", "index", 8, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_009                                                                                                                                                              
     *tc.name Refresh                                                                                                                                                                                                               
     *tc.desic refresh current page
     */
    it('Refresh', 0, async (done: Function) => {
      emitKey = "emitAccessStep";
      Utils.registerEvent("Refresh", "index", 9, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_010                                                                                                                                                             
     *tc.name AccessStep                                                                                                                                                                                                               
     *tc.desic return whether steps can be operated
     */
    it('AccessStep', 0, async (done: Function) => {
      emitKey = "emitClearHistory";
      Utils.registerEvent("AccessStep", true, 10, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_011                                                                                                                                                             
     *tc.name ClearHistory                                                                                                                                                                                                               
     *tc.desic clear the browsing history
     */
    it('ClearHistory', 0, async (done: Function) => {
      emitKey = "emitGetHitTestValue";
      Utils.registerEvent("ClearHistory", false, 11, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_012                                                                                                                                                             
     *tc.name GetHitTestValue                                                                                                                                                                                                               
     *tc.desic get the type of th clicked component
     */
    it('GetHitTestValue', 0, async (done: Function) => {
      emitKey = "emitRegisterJavaScriptProxy";
      Utils.registerEvent("GetHitTestValue", "hitValue", 12, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_013                                                                                                                                                           
     *tc.name RegisterJavaScriptProxy                                                                                                                                                                                                               
     *tc.desic register proxy with a specific name
     */
    it('RegisterJavaScriptProxy', 0, async (done: Function) => {
      emitKey = "emitDeleteJavaScriptRegister";
      Utils.registerEvent("RegisterJavaScriptProxy", 'Web', 13, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_014                                                                                                                                                           
     *tc.name DeleteJavaScriptRegister                                                                                                                                                                                                               
     *tc.desic delet specific proxy
     */
    it('DeleteJavaScriptRegister', 0, async (done: Function) => {
      emitKey = "emitZoom";
      Utils.registerEvent("DeleteJavaScriptRegister", "17100008", 14, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_015                                                                                                                                                           
     *tc.name Zoom                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('Zoom', 0, async (done: Function) => {
      emitKey = "emitSearchAllAsync";
      Utils.registerEvent("Zoom", "17100004", 15, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_016                                                                                                                                                          
     *tc.name SearchAllAsync                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('SearchAllAsync', 0, async (done: Function) => {
      emitKey = "emitClearMatches";
      Utils.registerEvent("SearchAllAsync", "01", 16, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_017                                                                                                                                                          
     *tc.name ClearMatches                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ClearMatches', 0, async (done: Function) => {
      emitKey = "emitSearchNext";
      Utils.registerEvent("ClearMatches", "17100001", 17, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_018                                                                                                                                                         
     *tc.name SearchNext                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('SearchNext', 0, async (done: Function) => {
      emitKey = "emitClearSslCache";
      Utils.registerEvent("SearchNext", "17100001", 18, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_019                                                                                                                                                         
     *tc.name ClearSslCache                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ClearSslCache', 0, async (done: Function) => {
      emitKey = "emitClearClientAuthenticationCache";
      Utils.registerEvent("ClearSslCache", "17100001", 19, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_020
    *tc.name ClearClientAuthenticationCache
    *tc.desic zoom the current page
    */
    it('ClearClientAuthenticationCache', 0, async (done: Function) => {
      emitKey = "emitStop";
      Utils.registerEvent("ClearClientAuthenticationCache", "17100001", 20, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_021                                                                                                                                                      
     *tc.name Stop                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('Stop', 0, async (done: Function) => {
      emitKey = "emitRequestFocus";
      Utils.registerEvent("Stop", "17100001", 21, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_022                                                                                                                                                      
     *tc.name RequestFocus                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('RequestFocus', 0, async (done: Function) => {
      emitKey = "emitZoomIn";
      Utils.registerEvent("RequestFocus", "17100001", 22, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_023                                                                                                                                                      
     *tc.name ZoomIn                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ZoomIn', 0, async (done: Function) => {
      emitKey = "emitZoomOut";
      Utils.registerEvent("ZoomIn", "17100001", 23, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_024                                                                                                                                                      
     *tc.name ZoomOut                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ZoomOut', 0, async (done: Function) => {
      emitKey = "emitGetWebId";
      Utils.registerEvent("ZoomOut", "17100001", 24, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_025                                                                                                                                                    
     *tc.name GetWebId                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('GetWebId', 0, async (done: Function) => {
      emitKey = "emitGetUserAgent";
      Utils.registerEvent("GetWebId", "17100001", 25, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_026                                                                                                                                                      
     *tc.name GetUserAgent                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('GetUserAgent', 0, async (done: Function) => {
      emitKey = "emitGetPageHeigth";
      Utils.registerEvent("GetUserAgent", "17100001", 26, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_027                                                                                                                                                      
     *tc.name GetPageHeigth                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('GetPageHeigth', 0, async (done: Function) => {
      emitKey = "emitBackOrForward";
      Utils.registerEvent("GetPageHeigth", "17100001", 27, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_028                                                                                                                                                      
     *tc.name BackOrForward                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('BackOrForward', 0, async (done: Function) => {
      emitKey = "emitStoreWebArchive";
      Utils.registerEvent("BackOrForward", "17100001", 28, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_029                                                                                                                                                                     
     *tc.name StoreWebArchive                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('StoreWebArchive', 0, async (done: Function) => {
      emitKey = "emitGetUrl";
      Utils.registerContainEvent("StoreWebArchive", "/data/storage/el2/base/", 29, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_030                                                                                                                                                                     
     *tc.name GetUrl                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetUrl', 0, async (done: Function) => {
      emitKey = "emitOnce";
      Utils.registerContainEvent("GetUrl", "17100001", 30, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_031                                                                                                                                                                    
     *tc.name Once                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('Once', 0, async (done: Function) => {
      emitKey = "emitGetItemAtIndex";
      Utils.registerContainEvent("Once", "a=b", 31, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_032                                                                                                                                                                   
     *tc.name GetItemAtIndex                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetItemAtIndex', 0, async (done: Function) => {
      emitKey = "emitContextMenuMediaType";
      Utils.registerEvent("GetItemAtIndex", "index", 32, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_033                                                                                                                                                                  
     *tc.name ContextMenuMediaType                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('ContextMenuMediaType', 0, async (done: Function) => {
      emitKey = "emitContextMenuInputFieldType";
      Utils.registerEvent("ContextMenuMediaType", 1, 33, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_034                                                                                                                                                                 
     *tc.name ContextMenuInputFieldType                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('ContextMenuInputFieldType', 0, async (done: Function) => {
      emitKey = "emitContextMenuEditStateFlags";
      Utils.registerEvent("ContextMenuInputFieldType", 1, 34, done);
      Utils.registerEvent("ContextMenuInputFieldType", 4, 35, done);
      Utils.registerEvent("ContextMenuInputFieldType", 5, 36, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_035                                                                                                                                                                 
     *tc.name ContextMenuEditStateFlags                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('ContextMenuEditStateFlags', 0, async (done: Function) => {
      emitKey = "emitGetStoredGeolocation";
      Utils.registerEvent("ContextMenuEditStateFlags", 0, 37, done);
      Utils.registerEvent("ContextMenuEditStateFlags", 1, 38, done);
      Utils.registerEvent("ContextMenuEditStateFlags", 2, 39, done);
      Utils.registerEvent("ContextMenuEditStateFlags", 4, 40, done);
      Utils.registerEvent("ContextMenuEditStateFlags", 8, 41, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_036                                                                                                                                                               
     *tc.name GetStoredGeolocation                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetStoredGeolocation', 0, async (done: Function) => {
      emitKey = "emitSetHttpDnsSuccess";
      Utils.registerEvent("GetStoredGeolocation", "file:///", 120, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_037                                                                                                                                                           
     *tc.name SetHttpDnsSuccess                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('SetHttpDnsSuccess', 0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocation";
      Utils.registerEvent("SetHttpDnsSuccess", 1, 446, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_038                                                                                                                                                           
     *tc.name GetAccessibleGeolocation                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetAccessibleGeolocation', 0, async (done: Function) => {
      emitKey = "emitJsMessExtGetString";
      Utils.registerEvent("GetAccessibleGeolocation", true, 451, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_039                                                                                                                                                           
     *tc.name JsMessExtGetString                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('JsMessExtGetString', 0, async (done: Function) => {
      emitKey = "emitJsMessExtGetNum";
      Utils.registerEvent("JsMessExtGetString", "result type:string", 500, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_040                                                                                                                                                           
     *tc.name JsMessExtGetNum                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('JsMessExtGetNum', 0, async (done: Function) => {
      emitKey = "emitJsMessExtGetBoo";
      Utils.registerEvent("JsMessExtGetNum", "result type:number", 501, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_041                                                                                                                                                          
     *tc.name JsMessExtGetBoo                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('JsMessExtGetBoo', 0, async (done: Function) => {
      emitKey = "emitJsMessExtGetArrayBuffer";
      Utils.registerEvent("JsMessExtGetBoo", "result type:boolean", 502, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_042                                                                                                                                                          
     *tc.name JsMessExtGetArrayBuffer                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('JsMessExtGetArrayBuffer', 0, async (done: Function) => {
      emitKey = "emitJsMessExtGetArray";
      Utils.registerEvent("JsMessExtGetArrayBuffer", "result type:object", 503, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_043                                                                                                                                                         
     *tc.name JsMessExtGetArray                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('JsMessExtGetArray', 0, async (done: Function) => {
      emitKey = "emitWebMessExtSetString";
      Utils.registerEvent("JsMessExtGetArray", "result type:object0", 504, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_044                                                                                                                                                         
     *tc.name WebMessExtSetString                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetString', 0, async (done: Function) => {
      emitKey = "emitWebMessExtGetString";
      let result = "String:helloFromEts";
      Utils.registerEvent("WebMessExtSetString", JSON.stringify(result), 506, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_045                                                                                                                                                        
     *tc.name WebMessExtGetString                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtGetString', 0, async (done: Function) => {
      emitKey = "emitWebMessExtSetNumber";
      Utils.registerEvent("WebMessExtGetString", "result type:string", 505, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_046                                                                                                                                                        
     *tc.name WebMessExtSetNumber                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetNumber', 0, async (done: Function) => {
      emitKey = "emitWebMessExtGetNumber";
      let result = "Number:1";
      Utils.registerEvent("WebMessExtSetNumber", JSON.stringify(result), 507, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_047                                                                                                                                                  
     *tc.name WebMessExtGetNumber                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtGetNumber', 0, async (done: Function) => {
      emitKey = "emitWebMessExtSetBoolean";
      Utils.registerEvent("WebMessExtGetNumber", "result type:number0", 508, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_048                                                                                                                                                  
     *tc.name WebMessExtSetBoolean                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetBoolean', 0, async (done: Function) => {
      emitKey = "emitWebMessExtGetBoolean";
      let result = "Boolean:true";
      Utils.registerEvent("WebMessExtSetBoolean", JSON.stringify(result), 509, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_049                                                                                                                                                 
     *tc.name WebMessExtGetBoolean                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtGetBoolean', 0, async (done: Function) => {
      emitKey = "emitWebMessExtSetArray";
      Utils.registerEvent("WebMessExtGetBoolean", "result type:boolean", 510, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_050                                                                                                                                                 
     *tc.name WebMessExtSetArray                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetArray', 0, async (done: Function) => {
      emitKey = "emitWebMessExtGetArray";
      let result = "Array len:1, value:apple";
      Utils.registerEvent("WebMessExtSetArray", JSON.stringify(result), 511, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_051                                                                                                                                                 
     *tc.name WebMessExtGetArray                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtGetArray', 0, async (done: Function) => {
      emitKey = "emitWebMessExtSetArrayBuffer";
      Utils.registerEvent("WebMessExtGetArray", "result type:object", 512, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_052                                                                                                                                                 
     *tc.name WebMessExtSetArrayBuffer                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetArrayBuffer', 0, async (done: Function) => {
      emitKey = "emitWebMessExtGetArrayBuffer";
      let result = "ArrayBuffer:8";
      Utils.registerEvent("WebMessExtSetArrayBuffer", JSON.stringify(result), 513, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_053                                                                                                                                                 
     *tc.name WebMessExtGetArrayBuffer                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtGetArrayBuffer', 0, async (done: Function) => {
      emitKey = "emitWebMessExtSetError";
      Utils.registerEvent("WebMessExtGetArrayBuffer", "result getArrayBuffer byteLength:8", 514, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_054                                                                                                                                                 
     *tc.name WebMessExtSetError                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetError', 0, async (done: Function) => {
      emitKey = "emitWebMessExtGetError";
      let result = "Error:SyntaxError, msg:";
      Utils.registerEvent("WebMessExtSetError", JSON.stringify(result), 515, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_055                                                                                                                                                
     *tc.name WebMessExtGetError                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtGetError', 0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationPromise";
      Utils.registerEvent("WebMessExtGetError", "result type:object", 516, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_056                                                                                                                                                
     *tc.name GetAccessibleGeolocationPromise                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetAccessibleGeolocationPromise', 0, async (done: Function) => {
      emitKey = "emitSetHttpDnsSuccessAuto";
      Utils.registerEvent("GetAccessibleGeolocationPromise", true, 517, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_057                                                                                                                                                
     *tc.name SetHttpDnsSuccessAuto                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('SetHttpDnsSuccessAuto', 0, async (done: Function) => {
      emitKey = "emitSetHttpDnsSuccessOff";
      Utils.registerEvent("SetHttpDnsSuccessAuto", "Example Domain", 518, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_058                                                                                                                                             
     *tc.name SetHttpDnsSuccessOff                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('SetHttpDnsSuccessOff', 0, async (done: Function) => {
      emitKey = "emitGetCertificateCallback";
      Utils.registerEvent("SetHttpDnsSuccessOff", "Example Domain", 519, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_059                                                                                                                                             
     *tc.name GetCertificateCallback                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetCertificateCallback', 0, async (done: Function) => {
      emitKey = "emitGetStoredGeolocationPromise";
      Utils.registerEvent("GetCertificateCallback", 31, 520, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_060                                                                                                                                                              
     *tc.name GetStoredGeolocationPromise                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetStoredGeolocationPromise', 0, async (done: Function) => {
      emitKey = "emitGetCustomUserAgent";
      Utils.registerEvent("GetStoredGeolocationPromise", "file:///", 521, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
      *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_061                                                                                                                                                              
      *tc.name getCustomUserAgent                                                                                                                                                                                                                
      *tc.desic Save current page
      */
    it('GetCustomUserAgent', 0, async (done: Function) => {
      emitKey = "emitGetCustomUserAgent";
      Utils.registerEvent("GetCustomUserAgent", "userAgent", 522, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
