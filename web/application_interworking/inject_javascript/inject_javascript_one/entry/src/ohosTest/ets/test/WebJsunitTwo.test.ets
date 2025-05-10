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

import { beforeAll, afterEach, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "emitRegisterJavaScriptProxy";

export default function webJsunitTwo() {
  describe('webJsunitTwoTest', () => {
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/webtwo"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webtwo state success " + JSON.stringify(pages));
        if (!("webtwo" == pages.name)) {
          console.info("get webtwo state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webtwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webtwo error: " + err);
      }
      done()
    });
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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_013                                                                                                                                                           
     *tc.name RegisterJavaScriptProxy                                                                                                                                                                                                               
     *tc.desic register proxy with a specific name
     */
    it('RegisterJavaScriptProxy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDeleteJavaScriptRegister";
      Utils.registerEvent("RegisterJavaScriptProxy", 'Web', 13, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_014                                                                                                                                                           
     *tc.name DeleteJavaScriptRegister                                                                                                                                                                                                               
     *tc.desic delet specific proxy
     */
    it('DeleteJavaScriptRegister', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessExtGetString";
      Utils.registerEvent("DeleteJavaScriptRegister", "17100008", 14, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_039                                                                                                                                                           
     *tc.name JsMessExtGetString                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('JsMessExtGetString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessExtGetNum";
      Utils.registerEvent("JsMessExtGetString", "result type:string", 500, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_040                                                                                                                                                           
     *tc.name JsMessExtGetNum                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('JsMessExtGetNum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessExtGetBoo";
      Utils.registerEvent("JsMessExtGetNum", "result type:number", 501, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_041                                                                                                                                                          
     *tc.name JsMessExtGetBoo                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('JsMessExtGetBoo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessExtGetArrayBuffer";
      Utils.registerEvent("JsMessExtGetBoo", "result type:boolean", 502, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_042                                                                                                                                                          
     *tc.name JsMessExtGetArrayBuffer                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('JsMessExtGetArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitJsMessExtGetArray";
      Utils.registerEvent("JsMessExtGetArrayBuffer", "result type:object", 503, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_043                                                                                                                                                         
     *tc.name JsMessExtGetArray                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('JsMessExtGetArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessExtSetString";
      Utils.registerEvent("JsMessExtGetArray", "result type:object0", 504, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_044                                                                                                                                                         
     *tc.name WebMessExtSetString                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
    it('WebMessExtGetString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessExtSetNumber";
      Utils.registerEvent("WebMessExtGetString", "result type:string", 505, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_046                                                                                                                                                        
     *tc.name WebMessExtSetNumber                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
    it('WebMessExtGetNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessExtSetBoolean";
      Utils.registerEvent("WebMessExtGetNumber", "result type:number0", 508, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_048                                                                                                                                                  
     *tc.name WebMessExtSetBoolean                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
    it('WebMessExtGetBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessExtSetArray";
      Utils.registerEvent("WebMessExtGetBoolean", "result type:boolean", 510, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_050                                                                                                                                                 
     *tc.name WebMessExtSetArray                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
    it('WebMessExtGetArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessExtSetArrayBuffer";
      Utils.registerEvent("WebMessExtGetArray", "result type:object", 512, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_052                                                                                                                                                 
     *tc.name WebMessExtSetArrayBuffer                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
    it('WebMessExtGetArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebMessExtSetError";
      Utils.registerEvent("WebMessExtGetArrayBuffer", "result getArrayBuffer byteLength:8", 514, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_054                                                                                                                                                 
     *tc.name WebMessExtSetError                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('WebMessExtSetError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
    it('WebMessExtGetError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationPromise";
      Utils.registerEvent("WebMessExtGetError", "result type:object", 516, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
