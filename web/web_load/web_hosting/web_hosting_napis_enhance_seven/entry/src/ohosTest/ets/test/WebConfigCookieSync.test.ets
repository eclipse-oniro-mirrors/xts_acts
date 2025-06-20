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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

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
          await Utils.sleep(2000);
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
      await Utils.sleep(2000);
      console.info("WebConfigCookieSync beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebConfigCookieSync afterEach start");
      await Utils.sleep(2000);
      console.info("WebConfigCookieSync afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0001
    * @tc.name       : testConfigCookieSync001
    * @tc.desc       : test configCookieSync Set the cache value to include \n
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testConfigCookieSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync001", 612)
      Utils.registerBaseEvent("testConfigCookieSync001", true, 2025061201, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0002
    * @tc.name       : testConfigCookieSync002
    * @tc.desc       : test configCookieSync Set the cache value to include \t
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync002", 612)
      Utils.registerBaseEvent("testConfigCookieSync002", true, 2025061202, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0003
    * @tc.name       : testConfigCookieSync003
    * @tc.desc       : test configCookieSync Set the cache value to include \r
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync003", 612)
      Utils.registerBaseEvent("testConfigCookieSync003", true, 2025061203, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0004
    * @tc.name       : testConfigCookieSync004
    * @tc.desc       : test configCookieSync Set the cache value to include \0
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync004", 612)
      Utils.registerBaseEvent("testConfigCookieSync003", true, 2025061204, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0005
    * @tc.name       : testConfigCookieSync005
    * @tc.desc       : test configCookieSync Set the cache value to include \n httpOnly
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testConfigCookieSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync005", 612)
      Utils.registerBaseEvent("testConfigCookieSync005", true, 2025061205, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0006
    * @tc.name       : testConfigCookieSync006
    * @tc.desc       : test configCookieSync Set the cache value to include \t httpOnly
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync006", 612)
      Utils.registerBaseEvent("testConfigCookieSync006", true, 2025061206, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0007
    * @tc.name       : testConfigCookieSync007
    * @tc.desc       : test configCookieSync Set the cache value to include \r httpOnly
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync007", 612)
      Utils.registerBaseEvent("testConfigCookieSync007", true, 2025061207, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0008
    * @tc.name       : testConfigCookieSync008
    * @tc.desc       : test configCookieSync Set the cache value to include \0 httpOnly
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync008", 612)
      Utils.registerBaseEvent("testConfigCookieSync008", true, 2025061208, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0009
     * @tc.name       : testConfigCookieSync009
     * @tc.desc       : test configCookieSync Set the cache value to include \n clearAllCookiesSync success
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync009", 612)
      Utils.registerBaseEvent("testConfigCookieSync009", true, 2025061209, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0010
     * @tc.name       : testConfigCookieSync010
     * @tc.desc       : test configCookieSync Set the cache value to include \r httpOnly clearAllCookiesSync success
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieSync010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync010", 612)
      Utils.registerBaseEvent("testConfigCookieSync010", true, 2025061210, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0011
     * @tc.name       : testConfigCookieSync011
     * @tc.desc       : test configCookieSync Set the cache value to include \0 httpOnly clearAllCookiesSync success
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testConfigCookieSync011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync011", 612)
      Utils.registerBaseEvent("testConfigCookieSync011", true, 2025061211, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0012
     * @tc.name       : testConfigCookieSync012
     * @tc.desc       : test configCookieSync Set the cache value to include \n httpOnly clearAllCookiesSync success
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testConfigCookieSync012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync012", 612)
      Utils.registerBaseEvent("testConfigCookieSync012", true, 2025061212, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0013
     * @tc.name       : testConfigCookieSync013
     * @tc.desc       : test configCookieSync Set the cache value to include \r httpOnly clearAllCookiesSync success
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testConfigCookieSync013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync013", 612)
      Utils.registerBaseEvent("testConfigCookieSync013", true, 2025061213, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0014
     * @tc.name       : testConfigCookieSync014
     * @tc.desc       : test configCookieSync Set the cache value to include \0 httpOnly clearAllCookiesSync success
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testConfigCookieSync014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync014", 612)
      Utils.registerBaseEvent("testConfigCookieSync014", true, 2025061214, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0015
     * @tc.name       : testConfigCookieSync015
     * @tc.desc       : test configCookieSync Set the cache value to include \n  enable incognito httpOnly clearAllCookiesSync success
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testConfigCookieSync015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync015", 612)
      Utils.registerBaseEvent("testConfigCookieSync015", true, 2025061215, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0016
     * @tc.name       : testConfigCookieSync016
     * @tc.desc       : test configCookieSync Set the cache value to include \t  enable incognito httpOnly
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testConfigCookieSync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync016", 612)
      Utils.registerBaseEvent("testConfigCookieSync016", true, 2025061216, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0017
     * @tc.name       : testConfigCookieSync017
     * @tc.desc       : test configCookieSync Set the cache value to include \r  enable incognito httpOnly clearAllCookiesSync success
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testConfigCookieSync017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync017", 612)
      Utils.registerBaseEvent("testConfigCookieSync017", true, 2025061217, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
     * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0018
     * @tc.name       : testConfigCookieSync018
     * @tc.desc       : test configCookieSync Set the cache value to include \0  enable incognito httpOnly clearAllCookiesSync success
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testConfigCookieSync018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync018", 612)
      Utils.registerBaseEvent("testConfigCookieSync018", true, 2025061218, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0019
    * @tc.name       : testConfigCookieSync019
    * @tc.desc       : test configCookieSync Set the cache value to include \n enable incognito httpOnly
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testConfigCookieSync019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync019", 612)
      Utils.registerBaseEvent("testConfigCookieSync019", true, 2025061219, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ConfigCookieSync', 10, '');
    })

  })
}
