/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitRegisterJavaScriptProxy";
// let emitKey = "emitRunJavaScript";
export default function webRegisterJavaScriptProxyJsunit() {

  describe('NdkRegisterJavaScriptProxyTest', () => {
    beforeEach(async (done:Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("httpAuthHandler beforeEach start");
      done();
    })

    afterEach(async (done:Function) => {
      console.info("web afterEach start:"+emitKey);
      try {
        let backData :emitter.EventData= {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent:events_emitter.InnerEvent= {
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
     *@tc.number SUB_ACE_WEB_BASIC_ETS_NAPI_001
     *@tc.name testRegisterJavaScriptProxyTestcase001
     *@tc.desc Injects the JavaScript object into window and invoke the function in window
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('RegisterJavaScriptProxy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done:Function)=>{
      emitKey="emitRunJavaScript";
      Utils.registerEvent("RegisterJavaScriptProxy","RunSuccess",23,done);
      sendEventByKey('webcomponent',10,'');
    })

    /*
     *@tc.number SUB_ACE_WEB_BASIC_ETS_NAPI_002
     *@tc.name testRunJavaScriptTestcase001
     *@tc.desc Injects the JavaScript object into window and invoke the function in window
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('RunJavaScript',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function)=>{
      emitKey="emitUnregisterJavaScriptProxy";
      Utils.registerEvent("RunJavaScript","RunSuccess",24,done);
      sendEventByKey('webcomponent',10,'');
    })

    /*
     *@tc.number SUB_ACE_WEB_BASIC_ETS_NAPI_003
     *@tc.name testUnregisterJavaScriptProxyTestcase001
     *@tc.desc Injects the JavaScript object into window and invoke the function in window
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('UnregisterJavaScriptProxy',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function)=>{
      emitKey="emitSetJavaScriptProxyValidCallback";
      Utils.registerEvent("UnregisterJavaScriptProxy","RunSuccess",25,done);
      sendEventByKey('webcomponent',10,'');
    })

    /*
     *@tc.number SUB_ACE_WEB_BASIC_ETS_NAPI_004
     *@tc.name testSetJavaScriptProxyValidCallbackTestcase001
     *@tc.desc Injects the JavaScript object into window and invoke the function in window
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('SetJavaScriptProxyValidCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function)=>{
      emitKey="emitGetJavaScriptProxyValidCallback";
      Utils.registerEvent("SetJavaScriptProxyValidCallback","RunSuccess",26,done);
      sendEventByKey('webcomponent',10,'');
    })


    /*
     *@tc.number SUB_ACE_WEB_BASIC_ETS_NAPI_005
     *@tc.name testGetJavaScriptProxyValidCallbackTestcase001
     *@tc.desc Injects the JavaScript object into window and invoke the function in window
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('GetJavaScriptProxyValidCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function)=>{
      emitKey="emitSetDestroyCallback";
      Utils.registerEvent("GetJavaScriptProxyValidCallback","RunSuccess",27,done);
      sendEventByKey('webcomponent',10,'');
    })

    /*
     *@tc.number SUB_ACE_WEB_BASIC_ETS_NAPI_006
     *@tc.name testSetDestroyCallbackTestcase001
     *@tc.desc Injects the JavaScript object into window and invoke the function in window
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('SetDestroyCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function)=>{
      emitKey="emitGetDestroyCallback";
      Utils.registerEvent("SetDestroyCallback","RunSuccess",28,done);
      sendEventByKey('webcomponent',10,'');
    })

    /*
     *@tc.number SUB_ACE_WEB_BASIC_ETS_NAPI_007
     *@tc.name testGetDestroyCallbackTestcase001
     *@tc.desc Injects the JavaScript object into window and invoke the function in window
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 2
     */
    it('GetDestroyCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:Function)=>{
      emitKey="emitGetDestroyCallback";
      Utils.registerEvent("GetDestroyCallback","RunSuccess",29,done);
      sendEventByKey('webcomponent',10,'');
    })
  })
}
