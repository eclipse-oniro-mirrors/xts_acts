/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeEach, afterEach, it, expect , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitFetchCookieSync";
export default function webViewControllerJsunit() {
  describe('ActsAceWebDevWebViewControllerTest',  () => {
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("web afterEach start:"+emitKey);
      try {
            let backData: events_emitter.EventData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent: events_emitter.InnerEvent = {
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
     *tc.number SUB_ACE_BASIC_ETS_API_1300
     *tc.name testFetchCookieSync
     *tc.desc test for FetchCookieSync
     */
    it('testFetchCookieSync',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitFetchCookieCallback";
      Utils.registerEvent("testFetchCookieSync","a=b",126,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1400
     *tc.name testFetchCookieCallback
     *tc.desc test for FetchCookieCallback
     */
    it('testFetchCookieCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitFetchCookiePromise";
      Utils.registerEvent("testFetchCookieSync","a=c",128,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1500
     *tc.name testFetchCookiePromise
     *tc.desc test for FetchCookiePromise
     */
    it('testFetchCookiePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitConfigCookieSync";
      Utils.registerEvent("testFetchCookiePromise","a=d",130,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1600
     *tc.name testConfigCookieSync
     *tc.desc test for ConfigCookieSync
     */
    it('testConfigCookieSync',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitConfigCookieCallback";
      Utils.registerEvent("testConfigCookieSync","a=e",132,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1700
     *tc.name testConfigCookieCallback
     *tc.desc test for ConfigCookieCallback
     */
    it('testConfigCookieCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitConfigCookiePromise";
      Utils.registerEvent("testConfigCookieCallback","a=f",134,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1800
     *tc.name testConfigCookiePromise
     *tc.desc test for ConfigCookiePromise
     */
    it('testConfigCookiePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitClearAllCookiesSync";
      Utils.registerEvent("testConfigCookiePromise","a=g",136,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_1900
     *tc.name testClearAllCookiesSync
     *tc.desc test for ClearAllCookiesSync
     */
    it('testClearAllCookiesSync',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitClearAllCookiesCallback";
      Utils.registerEvent("testClearAllCookiesSync","",138,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_2000
     *tc.name testClearAllCookiesCallback
     *tc.desc test for ClearAllCookiesCallback
     */
    it('testClearAllCookiesCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitClearAllCookiesPromise";
      Utils.registerEvent("testClearAllCookiesCallback","",140,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_2100
     *tc.name testClearAllCookiesPromise
     *tc.desc test for ClearAllCookiesPromise
     */
    it('testClearAllCookiesPromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitClearSessionCookieSync";
      Utils.registerEvent("testClearAllCookiesPromise","",142,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_2200
     *tc.name testClearSessionCookieSync
     *tc.desc test for ClearSessionCookieSync
     */
    it('testClearSessionCookieSync',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitClearSessionCookieCallback";
      Utils.registerEvent("testClearSessionCookieSync","",144,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_2300
     *tc.name testClearSessionCookieCallback
     *tc.desc test for ClearSessionCookieCallback
     */
    it('testClearSessionCookieCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitClearSessionCookiePromise";
      Utils.registerEvent("testClearSessionCookieCallback","",146,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_2400
     *tc.name testClearSessionCookiePromise
     *tc.desc test for ClearSessionCookiePromise
     */
    it('testClearSessionCookiePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitPostUrl";
      Utils.registerEvent("testClearSessionCookiePromise","",148,done);
      sendEventByKey('webcomponent',10,'');
    })

  })
}