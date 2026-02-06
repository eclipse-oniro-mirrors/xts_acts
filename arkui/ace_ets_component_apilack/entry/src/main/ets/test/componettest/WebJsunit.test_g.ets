/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';;
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

let emitKey = "emitUserAgent";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeEach(async () => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
    })
    afterEach(async () => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
    })
    /**
     * @tc.name   storeWebArchive
     * @tc.number SUB_ACE_BASIC_ETS_API_066
     * @tc.desc   storeWebArchive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storeWebArchive', Level.LEVEL0, async () => {
      emitKey = "emitAllowGeolocation";
      Utils.registerContainEvent("storeWebArchive", "/data/storage/el2/base/", 400);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   allowGeolocation
     * @tc.number SUB_ACE_BASIC_ETS_API_067
     * @tc.desc   allowGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('allowGeolocation', Level.LEVEL0, async () => {
      emitKey = "emitDeleteGeolocation";
      Utils.registerEvent("allowGeolocation", "file:///, result: true", 402);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   deletGeolocation
     * @tc.number SUB_ACE_BASIC_ETS_API_068
     * @tc.desc   deletGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deletGeolocation', Level.LEVEL0, async () => {
      emitKey = "emitDeleteAllGeolocation";
      Utils.registerEvent("deletGeolocation", "", 404);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   deletAllGeolocation
     * @tc.number SUB_ACE_BASIC_ETS_API_069
     * @tc.desc   deletAllGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deletAllGeolocation', Level.LEVEL0, async () => {
      emitKey = "emitIsCookieAllowed";
      Utils.registerEvent("deletAllGeolocation", "", 406);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   isCookieAllowed
     * @tc.number SUB_ACE_BASIC_ETS_API_070
     * @tc.desc   isCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isCookieAllowed', Level.LEVEL0, async () => {
      emitKey = "emitSaveCookieAsync";
      Utils.registerEvent("isCookieAllowed", false, 408);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   saveCookieAsync
     * @tc.number SUB_ACE_BASIC_ETS_API_071
     * @tc.desc   saveCookieAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('saveCookieAsync', Level.LEVEL0, async () => {
      emitKey = "emitIsThirdPartyCookieAllowed";
      Utils.registerEvent("saveCookieAsync", true, 410);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   isThirdPartyCookieAllowed
     * @tc.number SUB_ACE_BASIC_ETS_API_072
     * @tc.desc   isThirdPartyCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isThirdPartyCookieAllowed', Level.LEVEL0, async () => {
      emitKey = "emitExistCookie";
      Utils.registerEvent("isThirdPartyCookieAllowed", false, 412);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   existCookie
     * @tc.number SUB_ACE_BASIC_ETS_API_073
     * @tc.desc   existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('existCookie', Level.LEVEL0, async () => {
      emitKey = "emitOnConsole";
      Utils.registerEvent("existCookie", false, 414);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   getLineNumber
     * @tc.number SUB_ACE_BASIC_ETS_API_076
     * @tc.desc   getLineNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLineNumber', Level.LEVEL0, async () => {
      emitKey = "emitOnConsole";
      Utils.registerEvent("getLineNumber", "51", 420);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   getSourceId
     * @tc.number SUB_ACE_BASIC_ETS_API_077
     * @tc.desc   getSourceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSourceId', Level.LEVEL0, async () => {
      emitKey = "emitLoaData";
      Utils.registerEvent("getSourceId", "file:///data/storage/el1/bundle/phone/resources/rawfile/index.html", 422);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   loadData
     * @tc.number SUB_ACE_BASIC_ETS_API_078
     * @tc.desc   loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('loadData', Level.LEVEL0, async () => {
      emitKey = "emitZoomAccess";
      Utils.registerEvent("loadData", "index", 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   zoomAccess
     * @tc.number SUB_ACE_BASIC_ETS_API_080
     * @tc.desc   zoomAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('zoomAccess', Level.LEVEL0, async () => {
      emitKey = "emitSaveHttpAuthCredentials";
      Utils.registerEvent("zoomAccess", false, 428);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   saveHttpAuthCredentials
     * @tc.number SUB_ACE_BASIC_ETS_API_087
     * @tc.desc   saveHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('saveHttpAuthCredentials', Level.LEVEL0, async () => {
      emitKey = "emitGetHttpAuthCredentials";
      Utils.registerEvent("saveHttpAuthCredentials", true, 442);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   getHttpAuthCredentials
     * @tc.number SUB_ACE_BASIC_ETS_API_088
     * @tc.desc   getHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getHttpAuthCredentials', Level.LEVEL0, async () => {
      emitKey = "emitDeleteHttpAuthCredentials";
      Utils.registerEvent("getHttpAuthCredentials", "Stromgol", 444);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   deleteHttpAuthCredentials
     * @tc.number SUB_ACE_BASIC_ETS_API_089
     * @tc.desc   deleteHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deleteHttpAuthCredentials', Level.LEVEL0, async () => {
      emitKey = "emitSearchAllAsync";
      Utils.registerEvent("deleteHttpAuthCredentials", false, 446);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   searchAllAsync
     * @tc.number SUB_ACE_BASIC_ETS_API_079
     * @tc.desc   searchAllAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchAllAsync', Level.LEVEL0, async () => {
      emitKey = "emitSearchAllAsync";
      Utils.registerEvent("searchAllAsync", "01", 426);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   deleteAllData
     * @tc.number deleteAllData
     * @tc.desc   deleteAllData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deleteAllData', Level.LEVEL0, async () => {
      emitKey = "emitdeleteAllData";
      Utils.registerEvent("deleteAllData", "01", 426);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   deleteOrigin
     * @tc.number deleteOrigin
     * @tc.desc   deleteOrigin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deleteOrigin', Level.LEVEL0, async () => {
      emitKey = "emitdeleteOringin";
      Utils.registerEvent("deleteOrigin", "index", 424);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   getOrigins
     * @tc.number getOrigins
     * @tc.desc   getOrigins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOrigins', Level.LEVEL0, async () => {
      emitKey = "emitgetOringin";
      Utils.registerEvent("getOrigins", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   getOriginQuota
     * @tc.number getOriginQuota
     * @tc.desc   getOriginQuota
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOriginQuota', Level.LEVEL0, async () => {
      emitKey = "emitgetOringinQuota";
      Utils.registerEvent("getOriginQuota", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   getOriginUsage
     * @tc.number getOriginUsage
     * @tc.desc   getOriginUsage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOriginUsage', Level.LEVEL0, async () => {
      emitKey = "emitgetOringinUsage";
      Utils.registerEvent("getOriginUsage", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   close
     * @tc.number close
     * @tc.desc   close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('close', Level.LEVEL0, async () => {
      emitKey = "emitclose";
      Utils.registerEvent("close", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   postMessageEvent
     * @tc.number postMessageEvent
     * @tc.desc   postMessageEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postMessageEvent', Level.LEVEL0, async () => {
      emitKey = "emitpostMessageEvent";
      Utils.registerEvent("postMessageEvent", 'index', 424);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   onMessageEvent
     * @tc.number onMessageEvent
     * @tc.desc   onMessageEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onMessageEvent', Level.LEVEL0, async () => {
      emitKey = "emitonMessageEvent";
      Utils.registerEvent("onMessageEvent", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   getUserAgent
     * @tc.number getUserAgent
     * @tc.desc   getUserAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getUserAgent', Level.LEVEL0, async () => {
      emitKey = "emitgetUserAgent";
      Utils.registerEvent("getUserAgent", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   createWebMessagePorts
     * @tc.number createWebMessagePorts
     * @tc.desc   createWebMessagePorts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createWebMessagePorts', Level.LEVEL0, async () => {
      emitKey = "emitcreateWebMessagePorts";
      Utils.registerEvent("createWebMessagePorts", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   clearMatches
     * @tc.number clearMatches
     * @tc.desc   clearMatches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('clearMatches', Level.LEVEL0, async () => {
      emitKey = "emitclearMatches";
      Utils.registerEvent("clearMatches", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   searchNext
     * @tc.number searchNext
     * @tc.desc   searchNext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchNext', Level.LEVEL0, async () => {
      emitKey = "emitsearchNext";
      Utils.registerEvent("searchNext", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   clearSslCache
     * @tc.number clearSslCache
     * @tc.desc   clearSslCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('clearSslCache', Level.LEVEL0, async () => {
      emitKey = "emitclearSslCache";
      Utils.registerEvent("clearSslCache", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   clearClientAuthenticationCache
     * @tc.number clearClientAuthenticationCache
     * @tc.desc   clearClientAuthenticationCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('clearClientAuthenticationCache', Level.LEVEL0, async () => {
      emitKey = "emitclearClientAuthenticationCache";
      Utils.registerEvent("clearClientAuthenticationCache", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   getUrl
     * @tc.number getUrl
     * @tc.desc   getUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getUrl', Level.LEVEL0, async () => {
      emitKey = "emitgetUrl";
      Utils.registerEvent("getUrl", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   postMessageEvent
     * @tc.number postMessageEvent
     * @tc.desc   postMessageEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postMessageEvent', Level.LEVEL0, async () => {
      emitKey = "emitpostMessageEvent1";
      Utils.registerEvent("postMessageEvent", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   getData
     * @tc.number getData
     * @tc.desc   getData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getData', Level.LEVEL0, async () => {
      emitKey = "emitgetData";
      Utils.registerEvent("getData", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   setData
     * @tc.number setData
     * @tc.desc   setData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setData', Level.LEVEL0, async () => {
      emitKey = "emitsetData";
      Utils.registerEvent("setData", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   getPorts
     * @tc.number getPorts
     * @tc.desc   getPorts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPorts', Level.LEVEL0, async () => {
      emitKey = "emitgetPorts";
      Utils.registerEvent("getPorts", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   getPorts
     * @tc.number getPorts
     * @tc.desc   getPorts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPorts', Level.LEVEL0, async () => {
      emitKey = "emitgetPorts";
      Utils.registerEvent("getPorts", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   fullscreen
     * @tc.number fullscreen
     * @tc.desc   fullscreen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fullscreen', Level.LEVEL0, async () => {
      emitKey = "emitexitfullscreen";
      Utils.registerEvent("exitfullscreen", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   postMessage
     * @tc.number postMessage
     * @tc.desc   postMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postMessage', Level.LEVEL0, async () => {
      emitKey = "emitpostMessage";
      Utils.registerEvent("postMessage", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   constructor
     * @tc.number constructor
     * @tc.desc   constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('constructor', Level.LEVEL0, async () => {
      emitKey = "emitAsyncControllerconstructor";
      Utils.registerEvent("constructor", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   deleteSessionCookie
     * @tc.number deleteSessionCookie
     * @tc.desc   deleteSessionCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deleteSessionCookie', Level.LEVEL0, async () => {
      emitKey = "emitdeleteSessionCookie";
      Utils.registerEvent("deleteSessionCookie", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   constructor
     * @tc.number constructor
     * @tc.desc   constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('constructor', Level.LEVEL0, async () => {
      emitKey = "emitonFullScreenExitconstructor";
      Utils.registerEvent("constructor", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    /**
     * @tc.name   constructor
     * @tc.number constructor
     * @tc.desc   constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('constructor', Level.LEVEL0, async () => {
      emitKey = "emitWebMessageEventconstructor";
      Utils.registerEvent("constructor", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
