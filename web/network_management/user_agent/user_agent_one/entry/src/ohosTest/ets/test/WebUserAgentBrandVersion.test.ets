/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, afterEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webUserAgentBrandVersion() {

  describe('webUserAgentBrandVersion', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUserAgentBrandVersion',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webUserAgentBrandVersion state success " + JSON.stringify(pages));
        if (!("WebUserAgentBrandVersion" == pages.name)) {
          console.info("get webUserAgentBrandVersion state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webUserAgentBrandVersion page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webUserAgentBrandVersion page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebUserAgentBrandVersionButton"), 10000);
      console.log("waitForComponent WebUserAgentBrandVersionButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webUserAgentBrandVersion beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("webUserAgentBrandVersion afterEach start");
      done();
    })

    /**
     * @tc.name   testSetBrand
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETBRAND_API_0100
     * @tc.desc   test setBrand with normal string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBrand', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetBrand', 174110);
      Utils.registerBaseEvent('testSetBrand', 'TestBrand', 174120, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetBrandEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETBRAND_ERROR_401_0100
     * @tc.desc   test setBrand with empty string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetBrandEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetBrandEmpty', 174110);
      Utils.registerBaseEvent('testSetBrandEmpty', 'no_error', 174130, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetBrandNull
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETBRAND_ERROR_401_0200
     * @tc.desc   test setBrand with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetBrandNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetBrandNull', 174110);
      Utils.registerBaseEvent('testSetBrandNull', '401', 174140, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetBrandUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETBRAND_ERROR_401_0300
     * @tc.desc   test setBrand with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetBrandUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetBrandUndefined', 174110);
      Utils.registerBaseEvent('testSetBrandUndefined', '401', 174150, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testGetBrand
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_GETBRAND_API_0100
     * @tc.desc   test getBrand to return set brand value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBrand', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetBrand', 174110);
      Utils.registerBaseEvent('testGetBrand', 'TestBrand', 174160, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetMajorVersion
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETMAJORVERSION_API_0100
     * @tc.desc   test setMajorVersion with normal string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMajorVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetMajorVersion', 174110);
      Utils.registerBaseEvent('testSetMajorVersion', '1.0.0', 174170, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetMajorVersionEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETMAJORVERSION_ERROR_401_0100
     * @tc.desc   test setMajorVersion with empty string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMajorVersionEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetMajorVersionEmpty', 174110);
      Utils.registerBaseEvent('testSetMajorVersionEmpty', 'no_error', 174180, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetMajorVersionNull
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETMAJORVERSION_ERROR_401_0200
     * @tc.desc   test setMajorVersion with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMajorVersionNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetMajorVersionNull', 174110);
      Utils.registerBaseEvent('testSetMajorVersionNull', '401', 174190, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetMajorVersionUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETMAJORVERSION_ERROR_401_0300
     * @tc.desc   test setMajorVersion with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMajorVersionUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetMajorVersionUndefined', 174110);
      Utils.registerBaseEvent('testSetMajorVersionUndefined', '401', 174200, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testGetMajorVersion
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_GETMAJORVERSION_API_0100
     * @tc.desc   test getMajorVersion to return set majorVersion value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMajorVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetMajorVersion', 174110);
      Utils.registerBaseEvent('testGetMajorVersion', '1.0.0', 174210, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetFullVersion
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETFULLVERSION_API_0100
     * @tc.desc   test setFullVersion with normal string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFullVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetFullVersion', 174110);
      Utils.registerBaseEvent('testSetFullVersion', '1.0.0.0', 174220, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetFullVersionEmpty
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETFULLVERSION_ERROR_401_0100
     * @tc.desc   test setFullVersion with empty string - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetFullVersionEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetFullVersionEmpty', 174110);
      Utils.registerBaseEvent('testSetFullVersionEmpty', 'no_error', 174230, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetFullVersionNull
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETFULLVERSION_ERROR_401_0200
     * @tc.desc   test setFullVersion with null - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level 2
     */
    it('testSetFullVersionNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetFullVersionNull', 174110);
      Utils.registerBaseEvent('testSetFullVersionNull', '401', 174240, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testSetFullVersionUndefined
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_SETFULLVERSION_ERROR_401_0300
     * @tc.desc   test setFullVersion with undefined - should throw error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetFullVersionUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetFullVersionUndefined', 174110);
      Utils.registerBaseEvent('testSetFullVersionUndefined', '401', 174250, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })

    /**
     * @tc.name   testGetFullVersion
     * @tc.number SUB_ACE_WEB_USERAGENTBRANDVERSION_GETFULLVERSION_API_0100
     * @tc.desc   test getFullVersion to return set fullVersion value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFullVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetFullVersion', 174110);
      Utils.registerBaseEvent('testGetFullVersion', '1.0.0.0', 174260, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebUserAgentBrandVersionButton', 10, '');
    })
  })
}
