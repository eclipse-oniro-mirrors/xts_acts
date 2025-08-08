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
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_066                                                                                                                                                                      
     *tc.name storeWebArchive                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('storeWebArchive', Level.LEVEL0, async () => {
      emitKey = "emitAllowGeolocation";
      Utils.registerContainEvent("storeWebArchive", "/data/storage/el2/base/", 400);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_067                                                                                                                                                                   
     *tc.name allowGeolocation                                                                                                                                                                                                                
     *tc.desic allow specific url to access the geolocation
     */
    it('allowGeolocation', Level.LEVEL0, async () => {
      emitKey = "emitDeleteGeolocation";
      Utils.registerEvent("allowGeolocation", "file:///, result: true", 402);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_068                                                                                                                                                                   
     *tc.name deleteGeolocation                                                                                                                                                                                                                
     *tc.desic delete specific restored geolocation
     */
    it('deletGeolocation', Level.LEVEL0, async () => {
      emitKey = "emitDeleteAllGeolocation";
      Utils.registerEvent("deletGeolocation", "", 404);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_069                                                                                                                                                                   
     *tc.name deletAllGeolocation                                                                                                                                                                                                                
     *tc.desic delete all restored geolocation
     */
    it('deletAllGeolocation', Level.LEVEL0, async () => {
      emitKey = "emitIsCookieAllowed";
      Utils.registerEvent("deletAllGeolocation", "", 406);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_070                                                                                                                                                                   
     *tc.name isCookieAllowed                                                                                                                                                                                                                
     *tc.desic return whether the cookie is allowed
     */
    it('isCookieAllowed', Level.LEVEL0, async () => {
      emitKey = "emitSaveCookieAsync";
      Utils.registerEvent("isCookieAllowed", false, 408);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_071                                                                                                                                                                   
     *tc.name saveCookieAsync                                                                                                                                                                                                                
     *tc.desic return whether the cookie is allowed
     */
    it('saveCookieAsync', Level.LEVEL0, async () => {
      emitKey = "emitIsThirdPartyCookieAllowed";
      Utils.registerEvent("saveCookieAsync", true, 410);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_072                                                                                                                                                                   
     *tc.name isThirdPartyCookieAllowed                                                                                                                                                                                                                
     *tc.desic return whether the third party cookie is allowed
     */
    it('isThirdPartyCookieAllowed', Level.LEVEL0, async () => {
      emitKey = "emitExistCookie";
      Utils.registerEvent("isThirdPartyCookieAllowed", false, 412);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_073                                                                                                                                                                   
     *tc.name existCookie                                                                                                                                                                                                               
     *tc.desic return whether there exits cookie
     */
    it('existCookie', Level.LEVEL0, async () => {
      emitKey = "emitOnConsole";
      Utils.registerEvent("existCookie", false, 414);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_076                                                                                                                                                                  
     *tc.name getLineNumber                                                                                                                                                                                                              
     *tc.desic return the number of console message lines
     */
    it('getLineNumber', Level.LEVEL0, async () => {
      emitKey = "emitOnConsole";
      Utils.registerEvent("getLineNumber", "51", 420);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_077                                                                                                                                                                  
     *tc.name getSourceId                                                                                                                                                                                                              
     *tc.desic return the source url
     */
    it('getSourceId', Level.LEVEL0, async () => {
      emitKey = "emitLoaData";
      Utils.registerEvent("getSourceId", "file:///data/storage/el1/bundle/phone/resources/rawfile/index.html", 422);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_078                                                                                                                                                                  
     *tc.name loadData                                                                                                                                                                                                              
     *tc.desic load specific strings
     */
    it('loadData', Level.LEVEL0, async () => {
      emitKey = "emitZoomAccess";
      Utils.registerEvent("loadData", "index", 424);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_080                                                                                                                                                                  
     *tc.name zoomAccess                                                                                                                                                                                                              
     *tc.desic set whether it is allowed to zoom
     */
    it('zoomAccess', Level.LEVEL0, async () => {
      emitKey = "emitSaveHttpAuthCredentials";
      Utils.registerEvent("zoomAccess", false, 428);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_087                                                                                                                                                               
     *tc.name saveHttpAuthCredentials                                                                                                                                                                                                              
     *tc.desic save credentials
     */
    it('saveHttpAuthCredentials', Level.LEVEL0, async () => {
      emitKey = "emitGetHttpAuthCredentials";
      Utils.registerEvent("saveHttpAuthCredentials", true, 442);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_088                                                                                                                                                                
     *tc.name getHttpAuthCredentials                                                                                                                                                                                                              
     *tc.desic delete credentials
     */
    it('getHttpAuthCredentials', Level.LEVEL0, async () => {
      emitKey = "emitDeleteHttpAuthCredentials";
      Utils.registerEvent("getHttpAuthCredentials", "Stromgol", 444);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_089                                                                                                                                                                
     *tc.name deleteHttpAuthCredentials                                                                                                                                                                                                              
     *tc.desic delete credentials
     */
    it('deleteHttpAuthCredentials', Level.LEVEL0, async () => {
      emitKey = "emitSearchAllAsync";
      Utils.registerEvent("deleteHttpAuthCredentials", false, 446);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_079                                                                                                                                                                  
     *tc.name searchAllAsync                                                                                                                                                                                                              
     *tc.desic search specific words
     */
    it('searchAllAsync', Level.LEVEL0, async () => {
      emitKey = "emitSearchAllAsync";
      Utils.registerEvent("searchAllAsync", "01", 426);
      sendEventByKey('webcomponent', 10, '');
    })

    it('deleteAllData', Level.LEVEL0, async () => {
      emitKey = "emitdeleteAllData";
      Utils.registerEvent("deleteAllData", "01", 426);
      sendEventByKey('webcomponent', 10, '');
    })

    it('deleteOrigin', Level.LEVEL0, async () => {
      emitKey = "emitdeleteOringin";
      Utils.registerEvent("deleteOrigin", "index", 424);
      sendEventByKey('webcomponent', 10, '');
    })

    it('getOrigins', Level.LEVEL0, async () => {
      emitKey = "emitgetOringin";
      Utils.registerEvent("getOrigins", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    it('getOriginQuota', Level.LEVEL0, async () => {
      emitKey = "emitgetOringinQuota";
      Utils.registerEvent("getOriginQuota", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    it('getOriginUsage', Level.LEVEL0, async () => {
      emitKey = "emitgetOringinUsage";
      Utils.registerEvent("getOriginUsage", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    it('close', Level.LEVEL0, async () => {
      emitKey = "emitclose";
      Utils.registerEvent("close", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    it('postMessageEvent', Level.LEVEL0, async () => {
      emitKey = "emitpostMessageEvent";
      Utils.registerEvent("postMessageEvent", 'index', 424);
      sendEventByKey('webcomponent', 10, '');
    })

    it('onMessageEvent', Level.LEVEL0, async () => {
      emitKey = "emitonMessageEvent";
      Utils.registerEvent("onMessageEvent", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('getUserAgent', Level.LEVEL0, async () => {
      emitKey = "emitgetUserAgent";
      Utils.registerEvent("getUserAgent", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('createWebMessagePorts', Level.LEVEL0, async () => {
      emitKey = "emitcreateWebMessagePorts";
      Utils.registerEvent("createWebMessagePorts", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('clearMatches', Level.LEVEL0, async () => {
      emitKey = "emitclearMatches";
      Utils.registerEvent("clearMatches", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('searchNext', Level.LEVEL0, async () => {
      emitKey = "emitsearchNext";
      Utils.registerEvent("searchNext", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('clearSslCache', Level.LEVEL0, async () => {
      emitKey = "emitclearSslCache";
      Utils.registerEvent("clearSslCache", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('clearClientAuthenticationCache', Level.LEVEL0, async () => {
      emitKey = "emitclearClientAuthenticationCache";
      Utils.registerEvent("clearClientAuthenticationCache", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('getUrl', Level.LEVEL0, async () => {
      emitKey = "emitgetUrl";
      Utils.registerEvent("getUrl", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('postMessageEvent', Level.LEVEL0, async () => {
      emitKey = "emitpostMessageEvent1";
      Utils.registerEvent("postMessageEvent", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('getData', Level.LEVEL0, async () => {
      emitKey = "emitgetData";
      Utils.registerEvent("getData", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('setData', Level.LEVEL0, async () => {
      emitKey = "emitsetData";
      Utils.registerEvent("setData", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('getPorts', Level.LEVEL0, async () => {
      emitKey = "emitgetPorts";
      Utils.registerEvent("getPorts", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('getPorts', Level.LEVEL0, async () => {
      emitKey = "emitgetPorts";
      Utils.registerEvent("getPorts", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('fullscreen', Level.LEVEL0, async () => {
      emitKey = "emitexitfullscreen";
      Utils.registerEvent("exitfullscreen", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('postMessage', Level.LEVEL0, async () => {
      emitKey = "emitpostMessage";
      Utils.registerEvent("postMessage", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('constructor', Level.LEVEL0, async () => {
      emitKey = "emitAsyncControllerconstructor";
      Utils.registerEvent("constructor", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
    it('deleteSessionCookie', Level.LEVEL0, async () => {
      emitKey = "emitdeleteSessionCookie";
      Utils.registerEvent("deleteSessionCookie", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    it('constructor', Level.LEVEL0, async () => {
      emitKey = "emitonFullScreenExitconstructor";
      Utils.registerEvent("constructor", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })

    it('constructor', Level.LEVEL0, async () => {
      emitKey = "emitWebMessageEventconstructor";
      Utils.registerEvent("constructor", 1, 424);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
