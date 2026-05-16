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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
import { RecordData } from '@ohos.base';


let emitKey = "emitUserAgent";

export default function webJsunit() {
  describe('ActsAceWebDevTest1', () => {
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
     * @tc.number   testmultiWindow_static_01
     * @tc.name     testmultiWindow_static_01
     * @tc.desc     testmultiWindow_static_01
     * @tc.level    Level.LEVEL0
     */
it('testmultiWindow_static_01', Level.LEVEL0, async () => {
      console.info('testmultiWindow01  START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('multiwindow');
      console.info("[multiwindow] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('web');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('multiWindow')).assertTrue();
      console.info("[testmultiWindow0010]  value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('multiWindow'));

    });

    
    /**
     * @tc.number   testonWindowExit_static_02
     * @tc.name     testonWindowExit_static_02
     * @tc.desc     testonWindowExit_static_02
     * @tc.level    Level.LEVEL0
     */
it('testonWindowExit_static_02', Level.LEVEL0, async () => {
      try {
        //Utils.registerContainEvent("WindowExit", true, 800);
        inspector.sendEventByKey('multiwindow', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   tesweb_static_03
     * @tc.name     tesweb_static_03
     * @tc.desc     tesweb_static_03
     * @tc.level    Level.LEVEL0
     */
it('tesweb_static_03', Level.LEVEL0, async () => {
      try {
        //Utils.registerContainEvent("onWindowNew", true, 801,);
        inspector.sendEventByKey('onWindowNew', 10, '');
      } catch (error) {
        expect().assertFail();
      }

    })

    
    /**
     * @tc.number   tesweb_static_04
     * @tc.name     tesweb_static_04
     * @tc.desc     tesweb_static_04
     * @tc.level    Level.LEVEL0
     */
it('tesweb_static_04', Level.LEVEL0, async () => {
      try {
        //Utils.registerContainEvent("onFullScreen", true, 802,);
        inspector.sendEventByKey('onWindowNew', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   tesweb_static_05
     * @tc.name     tesweb_static_05
     * @tc.desc     tesweb_static_05
     * @tc.level    Level.LEVEL0
     */
it('tesweb_static_05', Level.LEVEL0, async () => {
      try {
        //Utils.registerContainEvent("onSslErrorEventReceive", true, 803,);
        inspector.sendEventByKey('onSslErrorEventReceive', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    })

    
    /**
     * @tc.number   testweb_static_06
     * @tc.name     testweb_static_06
     * @tc.desc     testweb_static_06
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_06', Level.LEVEL0, async () => {
      console.info('testmultiWindow016 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('web2');
      console.info("[multiwindow] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('web');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('atio')).assertEqual(150);
      console.info("[testmultiWindow0016]  value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('atio'));
    });


    
    /**
     * @tc.number   testweb_static_07
     * @tc.name     testweb_static_07
     * @tc.desc     testweb_static_07
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_07', Level.LEVEL0, async () => {
      try {
        emitKey = "emitGeturl";
        //Utils.registerContainEvent("Geturl", null, 810,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_08
     * @tc.name     testweb_static_08
     * @tc.desc     testweb_static_08
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_08', Level.LEVEL0, async () => {
      try {
        emitKey = "emitclearClientAuthenticationCache";
        //Utils.registerContainEvent("clearClientAuthenticationCache", true, 811,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_09
     * @tc.name     testweb_static_09
     * @tc.desc     testweb_static_09
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_09', Level.LEVEL0, async () => {
      try {
        emitKey = "emitclearSslCache";
        //Utils.registerContainEvent("clearSslCache", true, 812,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_10
     * @tc.name     testweb_static_10
     * @tc.desc     testweb_static_10
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_10', Level.LEVEL0, async () => {
      try {
        emitKey = "emitsearchNext";
        //Utils.registerContainEvent("clearsearchNext", true, 813,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_11
     * @tc.name     testweb_static_11
     * @tc.desc     testweb_static_11
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_11', Level.LEVEL0, async () => {
      try {
        emitKey = "emitclearMatches";
        //Utils.registerContainEvent("clearMatches", true, 814,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_12
     * @tc.name     testweb_static_12
     * @tc.desc     testweb_static_12
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_12', Level.LEVEL0, async () => {
      try {
        emitKey = "emitDefaultUserAgent";
        //Utils.registerContainEvent("getDefaultUserAgent", "", 815,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_13
     * @tc.name     testweb_static_13
     * @tc.desc     testweb_static_13
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_13', Level.LEVEL0, async () => {
      try {
        emitKey = "emitgetWebId";
        //Utils.registerContainEvent("getWebId", 0, 816,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_14
     * @tc.name     testweb_static_14
     * @tc.desc     testweb_static_14
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_14', Level.LEVEL0, async () => {
      try {
        emitKey = "emitcreateWebMessagePorts";
        //Utils.registerContainEvent("createWebMessagePorts", 0, 817,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_15
     * @tc.name     testweb_static_15
     * @tc.desc     testweb_static_15
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_15', Level.LEVEL0, async () => {
      try {
        emitKey = "emitdeleteSessionCookie";
        //Utils.registerContainEvent("deleteSessionCookie", true, 818,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_16
     * @tc.name     testweb_static_16
     * @tc.desc     testweb_static_16
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_16', Level.LEVEL0, async () => {
      try {
        emitKey = "emitdeleteExpiredCookie";
        //Utils.registerContainEvent("deleteExpiredCookie", true, 819,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_17
     * @tc.name     testweb_static_17
     * @tc.desc     testweb_static_17
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_17', Level.LEVEL0, async () => {
      try {
        emitKey = "emitexistCookie";
        //Utils.registerContainEvent("existCookie", true, 820,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_18
     * @tc.name     testweb_static_18
     * @tc.desc     testweb_static_18
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_18', Level.LEVEL0, async () => {
      try {
        emitKey = "emitgetCookie";
        //Utils.registerContainEvent("getCookie", "", 821,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_19
     * @tc.name     testweb_static_19
     * @tc.desc     testweb_static_19
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_19', Level.LEVEL0, async () => {
      try {
        emitKey = "emitsetCookie";
        //Utils.registerContainEvent("setCookie", true, 822,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_20
     * @tc.name     testweb_static_20
     * @tc.desc     testweb_static_20
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_20', Level.LEVEL0, async () => {
      try {
        emitKey = "emitsaveCookie";
        //Utils.registerContainEvent("saveCookie", true, 823,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_21
     * @tc.name     testweb_static_21
     * @tc.desc     testweb_static_21
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_21', Level.LEVEL0, async () => {
      try {
        emitKey = "emitputAcceptFileURICookieEnabled";
        //Utils.registerContainEvent("putAcceptFileURICookieEnabled", true, 823,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_22
     * @tc.name     testweb_static_22
     * @tc.desc     testweb_static_22
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_22', Level.LEVEL0, async () => {
      try {
        emitKey = "emitputAcceptThirdPartyCookieEnabled";
        //Utils.registerContainEvent("putAcceptThirdPartyCookieEnabled", true, 824,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_23
     * @tc.name     testweb_static_23
     * @tc.desc     testweb_static_23
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_23', Level.LEVEL0, async () => {
      try {
        emitKey = "emitisFileURICookieAllowed";
        //Utils.registerContainEvent("isFileURICookieAllowed", false, 825,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_24
     * @tc.name     testweb_static_24
     * @tc.desc     testweb_static_24
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_24', Level.LEVEL0, async () => {
      try {
        emitKey = "hasImage";
        //Utils.registerContainEvent("isThirdPartyCookieAllowed", false, 826,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_25
     * @tc.name     testweb_static_25
     * @tc.desc     testweb_static_25
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_25', Level.LEVEL0, async () => {
      try {
        emitKey = "hasImageTwo";
        //Utils.registerContainEvent("hasImage", true, 828,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_26
     * @tc.name     testweb_static_26
     * @tc.desc     testweb_static_26
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_26', Level.LEVEL0, async () => {
      try {
        emitKey = "setNetworkAvailable";
        //Utils.registerContainEvent("hasImage", true, 829,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_27
     * @tc.name     testweb_static_27
     * @tc.desc     testweb_static_27
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_27', Level.LEVEL0, async () => {
      try {
        emitKey = "getFavicon";
        //Utils.registerContainEvent("setNetworkAvailable", false, 830,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_28
     * @tc.name     testweb_static_28
     * @tc.desc     testweb_static_28
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_28', Level.LEVEL0, async () => {
      try {
        emitKey = "getOriginalUrl";
        //Utils.registerContainEvent("getFavicon", "baidu", 831,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_29
     * @tc.name     testweb_static_29
     * @tc.desc     testweb_static_29
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_29', Level.LEVEL0, async () => {
      try {
        emitKey = "history";
        //Utils.registerContainEvent("getOriginalUrl", "www.baidu.com", 832,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_30
     * @tc.name     testweb_static_30
     * @tc.desc     testweb_static_30
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_30', Level.LEVEL0, async () => {
      try {
        emitKey = "pageUp";
        //Utils.registerContainEvent("history", 1, 833,);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testweb_static_31
     * @tc.name     testweb_static_31
     * @tc.desc     testweb_static_31
     * @tc.level    Level.LEVEL0
     */
it('testweb_static_31', Level.LEVEL0, async () => {
      try {
        emitKey = "pageUp";
        //Utils.registerContainEvent("pageUp", true, 834);
        inspector.sendEventByKey('webcomponentapi9', 10, '');
      } catch (error) {
        expect().assertFail();
      }
    });
  })
}
