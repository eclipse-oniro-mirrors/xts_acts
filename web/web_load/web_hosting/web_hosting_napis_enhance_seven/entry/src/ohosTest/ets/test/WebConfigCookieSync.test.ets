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
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const  driver = Driver.create();
export default function WebConfigCookieSync() {

  describe('ActsWebWebConfigCookieSyncTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebConfigCookieSync',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebConfigCookieSync state success " + JSON.stringify(pages));
        if (!("WebConfigCookieSync" == pages.name)) {
          console.info("get WebConfigCookieSync state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebConfigCookieSync page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebConfigCookieSync page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebConfigCookieSync beforeEach start");
      done();
    })

    /**
     * @tc.name   testConfigCookieSync001
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0001
     * @tc.desc   test configCookieSync Set the cache value to include \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync001", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync001", true, 147550, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync001', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync002
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0002
     * @tc.desc   test configCookieSync Set the cache value to include \t
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync002", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync002", true, 147560, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync002', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync003
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0003
     * @tc.desc   test configCookieSync Set the cache value to include \r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync003", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync003", true, 147570, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync003', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync004
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0004
     * @tc.desc   test configCookieSync Set the cache value to include \0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync004", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync004", true, 147580, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync004', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync005
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0005
     * @tc.desc   test configCookieSync Set the cache value to include \n httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync005", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync005", true, 147590, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync005', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync006
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0006
     * @tc.desc   test configCookieSync Set the cache value to include \t httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync006", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync006", true, 147600, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync006', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync007
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0007
     * @tc.desc   test configCookieSync Set the cache value to include \r httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync007", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync007", true, 147610, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync007', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync008
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0008
     * @tc.desc   test configCookieSync Set the cache value to include \0 httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync008", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync008", true, 147620, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync008', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync009
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0009
     * @tc.desc   test configCookieSync Set the cache value to include \n clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync009", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync009", true, 147630, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync009', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync010
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0010
     * @tc.desc   test configCookieSync Set the cache value to include \r httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSync010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync010", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync010", true, 147640, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync010', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync011
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0011
     * @tc.desc   test configCookieSync Set the cache value to include \0 httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync011", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync011", true, 147650, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync011', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync012
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0012
     * @tc.desc   test configCookieSync Set the cache value to include \n httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync012", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync012", true, 147660, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync012', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync013
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0013
     * @tc.desc   test configCookieSync Set the cache value to include \r httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync013", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync013", true, 147670, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync013', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync014
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0014
     * @tc.desc   test configCookieSync Set the cache value to include \0 httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync014", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync014", true, 147680, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync014', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync015
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0015
     * @tc.desc   test configCookieSync Set the cache value to include \n  enable incognito httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync015", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync015", true, 147690, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync015', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync016
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0016
     * @tc.desc   test configCookieSync Set the cache value to include \t  enable incognito httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync016", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync016", true, 147700, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync016', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync017
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0017
     * @tc.desc   test configCookieSync Set the cache value to include \r  enable incognito httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync017", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync017", true, 147710, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync017', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync018
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0018
     * @tc.desc   test configCookieSync Set the cache value to include \0  enable incognito httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync018", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync018", true, 147720, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync018', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync019
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0019
     * @tc.desc   test configCookieSync Set the cache value to include \n enable incognito httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync019", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync019", true, 147730, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync019', true,1000);
      done();
    })

  })
}
