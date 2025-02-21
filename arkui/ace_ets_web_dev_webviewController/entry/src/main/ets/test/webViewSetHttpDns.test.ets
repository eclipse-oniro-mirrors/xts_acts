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
import {describe, beforeEach, afterEach, it, expect, beforeAll} from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
import router from '@system.router';
// @ts-nocheck
let emitKey = "emitSetHttpDnsSecureOnlyExample";
export default function webViewSetHttpDns() {
  describe('ActsAceWebDevWebViewSetHttpDnsTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/webViewSetHttpDns',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewSetHttpDns state success " + JSON.stringify(pages));
        if (!("webViewSetHttpDns" == pages.name)) {
          console.info("get webViewSetHttpDns state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewSetHttpDns page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewSetHttpDns page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewSetHttpDns beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewSetHttpDns afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0100
     *tc.name testSetHttpDnsSecureOnlyExample
     *tc.desc test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
     */
    it('testSetHttpDnsSecureOnlyExample',0,async function(done){
      emitKey="emitSetHttpDnsSecureOnlyUserDefine";
      Utils.registerEvent("testSetHttpDnsSecureOnlyExample","baidu.com",354,done);
      sendEventByKey('webViewSetHttpDns',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0200
     *tc.name testSetHttpDnsSecureOnlyUserDefine
     *tc.desc test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
     */
    it('testSetHttpDnsSecureOnlyUserDefine',0,async function(done){
      emitKey="emitSetHttpDnsAutoExample";
      Utils.registerEvent("testSetHttpDnsSecureOnlyUserDefine","success",356,done);
      sendEventByKey('webViewSetHttpDns',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0300
     *tc.name testSetHttpDnsAutoExample
     *tc.desc test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
     */
    it('testSetHttpDnsAutoExample',0,async function(done){
      emitKey="emitSetHttpDnsOffExample";
      Utils.registerEvent("testSetHttpDnsAutoExample","华为 - 构建万物互联的智能世界",358,done);
      sendEventByKey('webViewSetHttpDns',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWSETHTTPDNS_API_0400
     *tc.name testSetHttpDnsOffExample
     *tc.desc test interface of sethttpdns with parameter SetHttpDnsSecureOnlyExample
     */
    it('testSetHttpDnsOffExample',0,async function(done){
      emitKey="emitSetHttpDnsOffExample";
      Utils.registerEvent("testSetHttpDnsOffExample","OpenAtom OpenHarmony",360,done);
      sendEventByKey('webViewSetHttpDns',10,'');
    })
  })
}