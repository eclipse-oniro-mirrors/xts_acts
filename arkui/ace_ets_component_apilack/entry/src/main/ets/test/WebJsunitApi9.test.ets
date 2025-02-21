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

import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
let emitKey = "emitUserAgent";
export default function webJsunit() {
  describe('ActsAceWebDevTest1', function () {
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
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testmultiWindow01
     * @tc.desic         multiWindow
     */
    it('testmultiWindow01', 0, async function (done) {
      console.info('testmultiWindow01  START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('multiwindow');
      console.info("[multiwindow] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('web');
      expect(obj.$attrs.multiWindow).assertTrue();
      console.info("[testmultiWindow0010]  value :" + obj.$attrs.multiWindow);
      done();
    });

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0012
     *tc.name  testonWindowExit02
     *tc.desic onWindowExit
     */
    it('testonWindowExit02',0,async function(done){
      Utils.registerContainEvent("WindowExit",true,800,done);
      sendEventByKey('multiwindow',10,'');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0013
     *tc.name  testweb03
     *tc.desic onWindowNew
     */
    it('tesweb03',0,async function(done){
      Utils.registerContainEvent("onWindowNew",true,801,done);
      sendEventByKey('onWindowNew',10,'');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0014
     *tc.name  testweb04
     *tc.desc onFullScreen
     */
    it('tesweb04',0,async function(done){
      Utils.registerContainEvent("onFullScreen",true,802,done);
      sendEventByKey('onWindowNew',10,'');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0015
     *tc.name  testweb05
     *tc.desc onSslErrorEventReceive
     */
    it('tesweb05',0,async function(done){
      Utils.registerContainEvent("onSslErrorEventReceive",true,803,done);
      sendEventByKey('onSslErrorEventReceive',10,'');
    })

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0016
    * @tc.name         testweb06
    * @tc.desic        multiWindow
    */
    it('testweb06', 0, async function (done) {
      console.info('testmultiWindow016 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('web2');
      console.info("[multiwindow] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('web');
      expect(obj.$attrs.atio).assertEqual(150);
      console.info("[testmultiWindow0016]  value :" + obj.$attrs.multiWindow);
      done();

    });


    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0017
     * @tc.name         testweb07
     * @tc.desic        getUrl
     */
    it('testweb07', 0, async function (done) {
      emitKey="emitGeturl";
      Utils.registerContainEvent("Geturl",null,810,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0018
     * @tc.name         testweb08
     * @tc.desic        clearClientAuthenticationCache

     */
    it('testweb07', 0, async function (done) {
      emitKey="emitclearClientAuthenticationCache";
      Utils.registerContainEvent("clearClientAuthenticationCache",true,811,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0018
    * @tc.name         testweb08
    * @tc.desic        clearSslCache

    */
    it('testweb08', 0, async function (done) {
      emitKey="emitclearSslCache";
      Utils.registerContainEvent("clearSslCache",true,812,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0019
    * @tc.name         testweb09
    * @tc.desic        searchNext

    */
    it('testweb09', 0, async function (done) {
      emitKey="emitsearchNext";
      Utils.registerContainEvent("clearsearchNext",true,813,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0020
     * @tc.name         testweb10
     * @tc.desic        clearMatches
   */
    it('testweb10', 0, async function (done) {
      emitKey ="emitclearMatches";
      Utils.registerContainEvent("clearMatches",true,814,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0021
    * @tc.name         testweb11
    * @tc.desic        getDefaultUserAgent
  */
    it('testweb11', 0, async function (done) {
      emitKey ="emitDefaultUserAgent";
      Utils.registerContainEvent("getDefaultUserAgent","",815,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0022
   * @tc.name         testweb12
   * @tc.desic        getDefaultUserAgent
   */
    it('testweb12', 0, async function (done) {
      emitKey ="emitgetWebId";
      Utils.registerContainEvent("getWebId",0,816,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0022
     * @tc.name         testweb13
    * @tc.desic        getDefaultUserAgent
    */
    it('testweb13', 0, async function (done) {
      emitKey ="emitcreateWebMessagePorts";
      Utils.registerContainEvent("createWebMessagePorts",0,817,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0022
     * @tc.name         testweb14
    * @tc.desic        getDefaultUserAgent
    */
    it('testweb14', 0, async function (done) {
      emitKey = "emitdeleteSessionCookie";
      Utils.registerContainEvent("deleteSessionCookie",true,818,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0023
     * @tc.name         testweb15
    * @tc.desic        getDefaultUserAgent
    */
    it('testweb15', 0, async function (done) {
      emitKey = "emitdeleteExpiredCookie";
      Utils.registerContainEvent("deleteExpiredCookie",true,819,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0023
    * @tc.name         testweb16
    * @tc.desic        existCookie
   */
    it('testweb16', 0, async function (done) {
      emitKey = "emitexistCookie";
      Utils.registerContainEvent("existCookie",true,820,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0024
    * @tc.name         testweb17
    * @tc.desic        getCookie
   */
    it('testweb17', 0, async function (done) {
      emitKey = "emitgetCookie";
      Utils.registerContainEvent("getCookie","",821,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0024
     * @tc.name         testweb18
     * @tc.desic        getCookie
    */
    it('testweb18', 0, async function (done) {
      emitKey = "emitsetCookie";
      Utils.registerContainEvent("setCookie",true,822,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0024
     * @tc.name         testweb19
     * @tc.desic        saveCookie
    */
    it('testweb19', 0, async function (done) {
      emitKey = "emitsaveCookie";
      Utils.registerContainEvent("saveCookie",true,823,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0024
    * @tc.name         testweb20
    * @tc.desic        putAcceptFileURICookieEnabled
   */
    it('testweb20', 0, async function (done) {
      emitKey = "emitputAcceptFileURICookieEnabled";
      Utils.registerContainEvent("putAcceptFileURICookieEnabled",true,823,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0024
     * @tc.name         testweb20
     * @tc.desic        putAcceptFileURICookieEnabled
    */
    it('testweb21', 0, async function (done) {
      emitKey = "emitputAcceptThirdPartyCookieEnabled";
      Utils.registerContainEvent("putAcceptThirdPartyCookieEnabled",true,824,done);
      sendEventByKey('webcomponentapi9',10,'');
    });
    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0024
    * @tc.name         testweb22
    * @tc.desic        putAcceptFileURICookieEnabled
   */
    it('testweb22', 0, async function (done) {
      emitKey = "emitisFileURICookieAllowed";
      Utils.registerContainEvent("isFileURICookieAllowed",false,825,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0024
     * @tc.name         testweb22
    * @tc.desic        putAcceptFileURICookieEnabled
    */
    it('testweb23', 0, async function (done) {
      emitKey = "hasImage";
      Utils.registerContainEvent("isThirdPartyCookieAllowed",false,826,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0025
     * @tc.name         testweb22
     * @tc.desic        hasImageCallback
    */
    it('testweb24', 0, async function (done) {
      emitKey = "hasImageTwo";
      Utils.registerContainEvent("hasImage",true,828,done);
      sendEventByKey('webcomponentapi9',10,'');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0026
     * @tc.name         testweb22
     * @tc.desic        hasImagePromise
    */
    it('testweb25', 0, async function (done) {
      emitKey = "setNetworkAvailable";
      Utils.registerContainEvent("hasImage",true,829,done);
      sendEventByKey('webcomponentapi9',10,'');
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0027
     * @tc.name         testweb22
     * @tc.desic        setNetworkAvailable
    */
    it('testweb26', 0, async function (done) {
      emitKey = "getFavicon";
      Utils.registerContainEvent("setNetworkAvailable",false,830,done);
      sendEventByKey('webcomponentapi9',10,'');
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0028
     * @tc.name         testweb22
     * @tc.desic        getFavicon
    */
    it('testweb27', 0, async function (done) {
      emitKey = "getOriginalUrl";
      Utils.registerContainEvent("getFavicon","baidu",831,done);
      sendEventByKey('webcomponentapi9',10,'');
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0029
     * @tc.name         testweb22
     * @tc.desic        getFavicon
    */
    it('testweb28', 0, async function (done) {
      emitKey = "history";
      Utils.registerContainEvent("getOriginalUrl","www.baidu.com",832,done);
      sendEventByKey('webcomponentapi9',10,'');
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0030
     * @tc.name         testweb22
     * @tc.desic        getFavicon
    */
    it('testweb29', 0, async function (done) {
      emitKey = "pageUp";
      Utils.registerContainEvent("history",1,833,done);
      sendEventByKey('webcomponentapi9',10,'');
    });
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0031
     * @tc.name         testweb22
     * @tc.desic        getFavicon
    */
    it('testweb30', 0, async function (done) {
      emitKey = "pageUp";
      Utils.registerContainEvent("pageUp",true,834,done);
      sendEventByKey('webcomponentapi9',10,'');
    });
  })
}
