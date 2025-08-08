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

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function SetWebDebugAccess() {

  describe('ActsWebSetWebDebugAccessTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/SetWebDebugAccess',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SetWebDebugAccess state success " + JSON.stringify(pages));
        if (!("SetWebDebugAccess" == pages.name)) {
          console.info("get SetWebDebugAccess state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push SetWebDebugAccess page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetWebDebugAccess page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("setWebDebuggingAccess"),10000);
      console.log("waitForComponent setWebDebuggingAccess==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("SetWebDebugAccess beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("SetWebDebugAccess afterEach start");
      await Utils.sleep(2000);
      console.info("SetWebDebugAccess afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0001
    * @tc.name       : testSetWebDebugAccessEnableDebugPortAllowed
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 8888
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSetWebDebugAccessEnableDebugPortAllowed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortAllowed", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortAllowed", true, 2025060901, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0002
    * @tc.name       : testSetWebDebugAccessEnableDebugPortAllowedTwo
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 99999999
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetWebDebugAccessEnableDebugPortAllowedTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortAllowedTwo", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortAllowedTwo", "17100023", 2025060902, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0003
    * @tc.name       : testSetWebDebugAccessEnableDebugPortAllowedThree
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 65535
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetWebDebugAccessEnableDebugPortAllowedThree', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortAllowedThree", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortAllowedThree", true, 2025060903, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })


    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0004
    * @tc.name       : testSetWebDebugAccessEnableDebugPortNotAllowedOne
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 0 not allowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetWebDebugAccessEnableDebugPortNotAllowedOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNotAllowedOne", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNotAllowedOne", "17100023", 2025060904, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })


    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0005
    * @tc.name       : testSetWebDebugAccessEnableDebugPortNotAllowedTwo
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 1024 not allowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetWebDebugAccessEnableDebugPortNotAllowedTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNotAllowedTwo", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNotAllowedTwo", "17100023", 2025060905, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0006
    * @tc.name       : testSetWebDebugAccessEnableDebugPortNotAllowedThree
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 888 not allowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testSetWebDebugAccessEnableDebugPortNotAllowedThree', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNotAllowedThree", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNotAllowedThree", "17100023", 2025060906, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0007
    * @tc.name       : testSetWebDebugAccessEnableDebugPortNegativeNumber
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to negative number
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetWebDebugAccessEnableDebugPortNegativeNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNegativeNumber", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNegativeNumber", "17100023", 2025060907, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0008
    * @tc.name       : testSetWebDebugAccessEnableDebugPortEmpty
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to empty
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetWebDebugAccessEnableDebugPortEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortEmpty", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortEmpty", true, 2025060908, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0009
    * @tc.name       : testSetWebDebugAccessEnableDebugPortNull
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to null
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetWebDebugAccessEnableDebugPortNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNull", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNull", true, 2025060909, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })


    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0010
    * @tc.name       : testSetWebDebugAccessEnableDebugPortUndefined
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to undefined
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetWebDebugAccessEnableDebugPortUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortUndefined", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortUndefined", true, 2025060910, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0011
    * @tc.name       : testSetWebDebugAccessEnableDebugPortNaN
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to NaN
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetWebDebugAccessEnableDebugPortNaN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNaN", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNaN", "17100023", 2025060911, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })


    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0012
    * @tc.name       : testSetWebDebugAccessNotEnableDebugPortAllowed
    * @tc.desc       : test SetWebDebugAccess not enables debugging . set the port   8888 to allowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetWebDebugAccessNotEnableDebugPortAllowed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessNotEnableDebugPortAllowed", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessNotEnableDebugPortAllowed", true, 2025060912, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0013
    * @tc.name       : testSetWebDebugAccessNotEnableDebugPortNotAllowed
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 1024 not allowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetWebDebugAccessNotEnableDebugPortNotAllowed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessNotEnableDebugPortNotAllowed", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessNotEnableDebugPortNotAllowed", "17100023", 2025060913, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0014
    * @tc.name       : testSetWebDebugAccessErrorCode401
    * @tc.desc       : test SetWebDebugAccess error code 401
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetWebDebugAccessErrorCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessErrorCode401", 609)
      Utils.registerBaseEvent("testSetWebDebugAccessErrorCode401", "401", 2025060914, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('setWebDebuggingAccess', 10, '');
    })

  })
}
