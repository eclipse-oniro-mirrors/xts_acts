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

const EVENT_ID_SET_SUITE_KEY = 128001;
const driver = Driver.create();

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
          await router.pushUrl(options);
          console.info("push SetWebDebugAccess page success ");
        }
      } catch (err) {
        console.error("push SetWebDebugAccess page error: " + err);
      }
      let driver = Driver.create();
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("SetWebDebugAccess beforeEach start");
      done();
    })

    /**
     * @tc.name   testSetWebDebugAccessEnableDebugPortAllowed
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0001
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to 8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWebDebugAccessEnableDebugPortAllowed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortAllowed", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortAllowed", true, 128010, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })

    /**
     * @tc.name   testSetWebDebugAccessEnableDebugPortAllowedTwo
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0002
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to 99999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWebDebugAccessEnableDebugPortAllowedTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortAllowedTwo", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortAllowedTwo", "17100023", 128020, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })

    /**
     * @tc.name   testSetWebDebugAccessEnableDebugPortAllowedThree
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0003
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWebDebugAccessEnableDebugPortAllowedThree', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortAllowedThree", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortAllowedThree", true, 128030, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })


    /**
     * @tc.name   testSetWebDebugAccessEnableDebugPortNotAllowedOne
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0004
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to 0 not allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWebDebugAccessEnableDebugPortNotAllowedOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNotAllowedOne", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNotAllowedOne", "17100023", 128040, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })


    /**
     * @tc.name   testSetWebDebugAccessEnableDebugPortNotAllowedTwo
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0005
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to 1024 not allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWebDebugAccessEnableDebugPortNotAllowedTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNotAllowedTwo", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNotAllowedTwo", "17100023", 128050, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })

    /**
     * @tc.name   testSetWebDebugAccessEnableDebugPortNotAllowedThree
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0006
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to 888 not allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWebDebugAccessEnableDebugPortNotAllowedThree', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNotAllowedThree", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNotAllowedThree", "17100023", 128060, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })

    /**
     * @tc.name   testSetWebDebugAccessEnableDebugPortNegativeNumber
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0007
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWebDebugAccessEnableDebugPortNegativeNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNegativeNumber", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNegativeNumber", "17100023", 128070, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })

    /**
     * @tc.name   testSetWebDebugAccessEnableDebugPortEmpty
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0008
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWebDebugAccessEnableDebugPortEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortEmpty", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortEmpty", true, 128080, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })

    /**
     * @tc.name   testSetWebDebugAccessEnableDebugPortNull
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0009
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWebDebugAccessEnableDebugPortNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNull", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNull", true, 128090, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })


    /**
     * @tc.name   testSetWebDebugAccessEnableDebugPortUndefined
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0010
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWebDebugAccessEnableDebugPortUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortUndefined", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortUndefined", true, 128100, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })

    /**
     * @tc.name   testSetWebDebugAccessEnableDebugPortNaN
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0011
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWebDebugAccessEnableDebugPortNaN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessEnableDebugPortNaN", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessEnableDebugPortNaN", "17100023", 128110, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })


    /**
     * @tc.name   testSetWebDebugAccessNotEnableDebugPortAllowed
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0012
     * @tc.desc   test SetWebDebugAccess not enables debugging . set the port   8888 to allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWebDebugAccessNotEnableDebugPortAllowed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessNotEnableDebugPortAllowed", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessNotEnableDebugPortAllowed", true, 128120, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })

    /**
     * @tc.name   testSetWebDebugAccessNotEnableDebugPortNotAllowed
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0013
     * @tc.desc   test SetWebDebugAccess enables debugging . set the port number to 1024 not allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWebDebugAccessNotEnableDebugPortNotAllowed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessNotEnableDebugPortNotAllowed", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessNotEnableDebugPortNotAllowed", "17100023", 128130, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })

    /**
     * @tc.name   testSetWebDebugAccessErrorCode401
     * @tc.number SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0014
     * @tc.desc   test SetWebDebugAccess error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWebDebugAccessErrorCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitSetWebDebugAccessErrorCode401", EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testSetWebDebugAccessErrorCode401", "401", 128140, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent(driver, "setWebDebuggingAccessButton");
    })

  })
}
