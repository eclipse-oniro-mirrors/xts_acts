'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';

import { $r, Color } from '@ohos.arkui.component'
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';

let emitKey = "emitUserAgent";

export default function webJsunit1() {
  describe('ActsAceWebDevTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
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
          } as Record<String,RecordData>
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
     * @tc.number   storeWebArchive_static
     * @tc.name     storeWebArchive_static
     * @tc.desc     storeWebArchive_static
     * @tc.level    Level.LEVEL0
     */
it('storeWebArchive_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitAllowGeolocation";
        // //Utils.registerContainEvent("storeWebArchive", "/data/storage/el2/base/", 400);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   allowGeolocation_static
     * @tc.name     allowGeolocation_static
     * @tc.desc     allowGeolocation_static
     * @tc.level    Level.LEVEL0
     */
it('allowGeolocation_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitDeleteGeolocation";
        //Utils.registerEvent("allowGeolocation", "file:///, result: true", 402);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   deletGeolocation_static
     * @tc.name     deletGeolocation_static
     * @tc.desc     deletGeolocation_static
     * @tc.level    Level.LEVEL0
     */
it('deletGeolocation_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitDeleteAllGeolocation";
        //Utils.registerEvent("deletGeolocation", "", 404);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   deletAllGeolocation_static
     * @tc.name     deletAllGeolocation_static
     * @tc.desc     deletAllGeolocation_static
     * @tc.level    Level.LEVEL0
     */
it('deletAllGeolocation_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitIsCookieAllowed";
        //Utils.registerEvent("deletAllGeolocation", "", 406);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   isCookieAllowed_static
     * @tc.name     isCookieAllowed_static
     * @tc.desc     isCookieAllowed_static
     * @tc.level    Level.LEVEL0
     */
it('isCookieAllowed_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitSaveCookieAsync";
        //Utils.registerEvent("isCookieAllowed", false, 408);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   saveCookieAsync_static
     * @tc.name     saveCookieAsync_static
     * @tc.desc     saveCookieAsync_static
     * @tc.level    Level.LEVEL0
     */
it('saveCookieAsync_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitIsThirdPartyCookieAllowed";
        //Utils.registerEvent("saveCookieAsync", true, 410);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   isThirdPartyCookieAllowed_static
     * @tc.name     isThirdPartyCookieAllowed_static
     * @tc.desc     isThirdPartyCookieAllowed_static
     * @tc.level    Level.LEVEL0
     */
it('isThirdPartyCookieAllowed_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitExistCookie";
        //Utils.registerEvent("isThirdPartyCookieAllowed", false, 412);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   existCookie_static
     * @tc.name     existCookie_static
     * @tc.desc     existCookie_static
     * @tc.level    Level.LEVEL0
     */
it('existCookie_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitOnConsole";
        //Utils.registerEvent("existCookie", false, 414);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   getLineNumber_static
     * @tc.name     getLineNumber_static
     * @tc.desc     getLineNumber_static
     * @tc.level    Level.LEVEL0
     */
it('getLineNumber_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitOnConsole";
        //Utils.registerEvent("getLineNumber", "51", 420);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   getSourceId_static
     * @tc.name     getSourceId_static
     * @tc.desc     getSourceId_static
     * @tc.level    Level.LEVEL0
     */
it('getSourceId_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitLoaData";
        //Utils.registerEvent("getSourceId", "file:///data/storage/el1/bundle/phone/resources/rawfile/index.html", 422);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   loadData_static
     * @tc.name     loadData_static
     * @tc.desc     loadData_static
     * @tc.level    Level.LEVEL0
     */
it('loadData_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitZoomAccess";
        //Utils.registerEvent("loadData", "index", 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   zoomAccess_static
     * @tc.name     zoomAccess_static
     * @tc.desc     zoomAccess_static
     * @tc.level    Level.LEVEL0
     */
it('zoomAccess_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitSaveHttpAuthCredentials";
        //Utils.registerEvent("zoomAccess", false, 428);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   saveHttpAuthCredentials_static
     * @tc.name     saveHttpAuthCredentials_static
     * @tc.desc     saveHttpAuthCredentials_static
     * @tc.level    Level.LEVEL0
     */
it('saveHttpAuthCredentials_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitGetHttpAuthCredentials";
        //Utils.registerEvent("saveHttpAuthCredentials", true, 442);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   getHttpAuthCredentials_static
     * @tc.name     getHttpAuthCredentials_static
     * @tc.desc     getHttpAuthCredentials_static
     * @tc.level    Level.LEVEL0
     */
it('getHttpAuthCredentials_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitDeleteHttpAuthCredentials";
        //Utils.registerEvent("getHttpAuthCredentials", "Stromgol", 444);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   deleteHttpAuthCredentials_static
     * @tc.name     deleteHttpAuthCredentials_static
     * @tc.desc     deleteHttpAuthCredentials_static
     * @tc.level    Level.LEVEL0
     */
it('deleteHttpAuthCredentials_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitSearchAllAsync";
        //Utils.registerEvent("deleteHttpAuthCredentials", false, 446);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   searchAllAsync_static
     * @tc.name     searchAllAsync_static
     * @tc.desc     searchAllAsync_static
     * @tc.level    Level.LEVEL0
     */
it('searchAllAsync_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitSearchAllAsync";
        //Utils.registerEvent("searchAllAsync", "01", 426);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })


    
    /**
     * @tc.number   deleteAllData_static
     * @tc.name     deleteAllData_static
     * @tc.desc     deleteAllData_static
     * @tc.level    Level.LEVEL0
     */
it('deleteAllData_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitdeleteAllData";
        //Utils.registerEvent("deleteAllData", "01", 426);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })


    
    /**
     * @tc.number   deleteOrigin_static
     * @tc.name     deleteOrigin_static
     * @tc.desc     deleteOrigin_static
     * @tc.level    Level.LEVEL0
     */
it('deleteOrigin_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitdeleteOringin";
        //Utils.registerEvent("deleteOrigin", "index", 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })


    
    /**
     * @tc.number   getOrigins_static
     * @tc.name     getOrigins_static
     * @tc.desc     getOrigins_static
     * @tc.level    Level.LEVEL0
     */
it('getOrigins_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitgetOringin";
        //Utils.registerEvent("getOrigins", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })


    
    /**
     * @tc.number   getOriginQuota_static
     * @tc.name     getOriginQuota_static
     * @tc.desc     getOriginQuota_static
     * @tc.level    Level.LEVEL0
     */
it('getOriginQuota_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitgetOringinQuota";
        //Utils.registerEvent("getOriginQuota", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })


    
    /**
     * @tc.number   getOriginUsage_static
     * @tc.name     getOriginUsage_static
     * @tc.desc     getOriginUsage_static
     * @tc.level    Level.LEVEL0
     */
it('getOriginUsage_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitgetOringinUsage";
        //Utils.registerEvent("getOriginUsage", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })


    
    /**
     * @tc.number   close_static
     * @tc.name     close_static
     * @tc.desc     close_static
     * @tc.level    Level.LEVEL0
     */
it('close_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitclose";
        //Utils.registerEvent("close", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })


    
    /**
     * @tc.number   postMessageEvent_static_01
     * @tc.name     postMessageEvent_static_01
     * @tc.desc     postMessageEvent_static_01
     * @tc.level    Level.LEVEL0
     */
it('postMessageEvent_static_01', Level.LEVEL0, async () => {
      try {
        emitKey = "emitpostMessageEvent";
        //Utils.registerEvent("postMessageEvent", 'index', 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })


    
    /**
     * @tc.number   onMessageEvent_static
     * @tc.name     onMessageEvent_static
     * @tc.desc     onMessageEvent_static
     * @tc.level    Level.LEVEL0
     */
it('onMessageEvent_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitonMessageEvent";
        //Utils.registerEvent("onMessageEvent", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   getUserAgent_static
     * @tc.name     getUserAgent_static
     * @tc.desc     getUserAgent_static
     * @tc.level    Level.LEVEL0
     */
it('getUserAgent_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitgetUserAgent";
        //Utils.registerEvent("getUserAgent", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   createWebMessagePorts_static
     * @tc.name     createWebMessagePorts_static
     * @tc.desc     createWebMessagePorts_static
     * @tc.level    Level.LEVEL0
     */
it('createWebMessagePorts_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitcreateWebMessagePorts";
        //Utils.registerEvent("createWebMessagePorts", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   clearMatches_static
     * @tc.name     clearMatches_static
     * @tc.desc     clearMatches_static
     * @tc.level    Level.LEVEL0
     */
it('clearMatches_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitclearMatches";
        //Utils.registerEvent("clearMatches", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   searchNext_static
     * @tc.name     searchNext_static
     * @tc.desc     searchNext_static
     * @tc.level    Level.LEVEL0
     */
it('searchNext_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitsearchNext";
        //Utils.registerEvent("searchNext", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   clearSslCache_static
     * @tc.name     clearSslCache_static
     * @tc.desc     clearSslCache_static
     * @tc.level    Level.LEVEL0
     */
it('clearSslCache_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitclearSslCache";
        //Utils.registerEvent("clearSslCache", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   clearClientAuthenticationCache_static
     * @tc.name     clearClientAuthenticationCache_static
     * @tc.desc     clearClientAuthenticationCache_static
     * @tc.level    Level.LEVEL0
     */
it('clearClientAuthenticationCache_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitclearClientAuthenticationCache";
        //Utils.registerEvent("clearClientAuthenticationCache", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   getUrl_static
     * @tc.name     getUrl_static
     * @tc.desc     getUrl_static
     * @tc.level    Level.LEVEL0
     */
it('getUrl_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitgetUrl";
        //Utils.registerEvent("getUrl", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   postMessageEvent_static
     * @tc.name     postMessageEvent_static
     * @tc.desc     postMessageEvent_static
     * @tc.level    Level.LEVEL0
     */
it('postMessageEvent_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitpostMessageEvent1";
        //Utils.registerEvent("postMessageEvent", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   getData_static
     * @tc.name     getData_static
     * @tc.desc     getData_static
     * @tc.level    Level.LEVEL0
     */
it('getData_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitgetData";
        //Utils.registerEvent("getData", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   setData_static
     * @tc.name     setData_static
     * @tc.desc     setData_static
     * @tc.level    Level.LEVEL0
     */
it('setData_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitsetData";
        //Utils.registerEvent("setData", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   getPorts_static
     * @tc.name     getPorts_static
     * @tc.desc     getPorts_static
     * @tc.level    Level.LEVEL0
     */
it('getPorts_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitgetPorts";
        //Utils.registerEvent("getPorts", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   getPorts_static_01
     * @tc.name     getPorts_static_01
     * @tc.desc     getPorts_static_01
     * @tc.level    Level.LEVEL0
     */
it('getPorts_static_01', Level.LEVEL0, async () => {
      try {
        emitKey = "emitgetPorts";
        //Utils.registerEvent("getPorts", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   fullscreen_static
     * @tc.name     fullscreen_static
     * @tc.desc     fullscreen_static
     * @tc.level    Level.LEVEL0
     */
it('fullscreen_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitexitfullscreen";
        //Utils.registerEvent("exitfullscreen", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   postMessage_static
     * @tc.name     postMessage_static
     * @tc.desc     postMessage_static
     * @tc.level    Level.LEVEL0
     */
it('postMessage_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitpostMessage";
        //Utils.registerEvent("postMessage", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   constructor_static_01
     * @tc.name     constructor_static_01
     * @tc.desc     constructor_static_01
     * @tc.level    Level.LEVEL0
     */
it('constructor_static_01', Level.LEVEL0, async () => {
      try {
        emitKey = "emitAsyncControllerconstructor";
        //Utils.registerEvent("constructor", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   deleteSessionCookie_static
     * @tc.name     deleteSessionCookie_static
     * @tc.desc     deleteSessionCookie_static
     * @tc.level    Level.LEVEL0
     */
it('deleteSessionCookie_static', Level.LEVEL0, async () => {
      try {
        emitKey = "emitdeleteSessionCookie";
        //Utils.registerEvent("deleteSessionCookie", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })


    
    /**
     * @tc.number   constructor_static_02
     * @tc.name     constructor_static_02
     * @tc.desc     constructor_static_02
     * @tc.level    Level.LEVEL0
     */
it('constructor_static_02', Level.LEVEL0, async () => {
      try {
        emitKey = "emitonFullScreenExitconstructor";
        //Utils.registerEvent("constructor", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })


    
    /**
     * @tc.number   constructor_static_03
     * @tc.name     constructor_static_03
     * @tc.desc     constructor_static_03
     * @tc.level    Level.LEVEL0
     */
it('constructor_static_03', Level.LEVEL0, async () => {
      try {
        emitKey = "emitWebMessageEventconstructor";
        //Utils.registerEvent("constructor", 1, 424);
        inspector.sendEventByKey('webcomponent', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })
  })
}
