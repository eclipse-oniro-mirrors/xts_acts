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

export default function webSetUrlTrustList() {

  describe('webSetUrlTrustList', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebSetUrlTrustList',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webSetUrlTrustList state success " + JSON.stringify(pages));
        if (!("webSetUrlTrustList" == pages.name)) {
          console.info("get webSetUrlTrustList state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webSetUrlTrustList page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetUrlTrustList page error: " + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebSetUrlTrustListButton"), 10000);
      console.log("waitForComponent WebSetUrlTrustListButton==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webSetUrlTrustList beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("webSetUrlTrustList afterEach start");
      console.info("webSetUrlTrustList afterEach end");
      done();
    })

    /**
     * @tc.name   testSetUrlTrustList
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_API_0100
     * @tc.desc   test setUrlTrustList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustList', 174270);
      Utils.registerBaseEvent('testSetUrlTrustList', true, 174280, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListFirstParamNull
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_ERROR_0100
     * @tc.desc   test setUrlTrustList first param null
     * @tc.type     FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListFirstParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListFirstParamNull', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListFirstParamNull', '401', 174290, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListFirstParamUndefined
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_ERROR_0200
     * @tc.desc   test setUrlTrustList first param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListFirstParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListFirstParamUndefined', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListFirstParamUndefined', '401', 174300, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListFirstParamEmpty
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_PARAMS_0100
     * @tc.desc   test setUrlTrustList first param empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUrlTrustListFirstParamEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListFirstParamEmpty', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListFirstParamEmpty', true, 26032504, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListSecondParamNull
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_ERROR_0300
     * @tc.desc   test setUrlTrustList second param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListSecondParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListSecondParamNull', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListSecondParamNull', '401', 174310, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListSecondParamaterUndefined
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_ERROR_0400
     * @tc.desc   test setUrlTrustList second param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListSecondParamaterUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListSecondParamUndefined', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListSecondParamaterUndefined', '401', 174320, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })
    /**
     * @tc.name   testSetUrlTrustListSecondParamaterFalse
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_PARAMS_0200
     * @tc.desc   test setUrlTrustList second param empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUrlTrustListSecondParamaterFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListSecondParamaterFalse', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListSecondParamaterFalse', true, 26032505, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListThirdParamNull
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_ERROR_0500
     * @tc.desc   test setUrlTrustList third param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListThirdParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListThirdParamNull', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListThirdParamNull', '401', 174330, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListThirdParamUndefined
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_ERROR_0600
     * @tc.desc   test setUrlTrustList third param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListThirdParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListThirdParamUndefined', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListThirdParamUndefined', '401', 174340, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })
    /**
     * @tc.name   testSetUrlTrustListThirdParamFalse
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_PARAMS_0300
     * @tc.desc   test setUrlTrustList third param false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUrlTrustListThirdParamFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListThirdParamFalse', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListThirdParamFalse', true, 26032506, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListInitError
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_ERROR_0700
     * @tc.desc   test setUrlTrustList init error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListInitError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListInitError', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListInitError', '17100001', 174350, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListWhitelistUrlLoad
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_FUNCTION_0200
     * @tc.desc   test setUrlTrustList function - whitelist url can load successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListWhitelistUrlLoad', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListWhitelistUrlLoad', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListWhitelistUrlLoad', true, 174370, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListWildList
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_FUNCTION_0300
     * @tc.desc   test setUrlTrustList function - non-whitelist url will be blocked and show warning page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListWildList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListWildList', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListWildList', true, 174380, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListEmpty
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_Empty_0100
     * @tc.desc   test setUrlTrustList param empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUrlTrustListEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListEmpty', 174270);
      Utils.registerBaseEvent('testSetUrlTrustListEmpty', true, 174390, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebSetUrlTrustListButton', 10, '');
    })

  })
}
