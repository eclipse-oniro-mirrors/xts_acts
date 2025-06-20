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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webCookieManagerFetchCookieSync() {

  describe('WebCookieManagerFetchCookieSync', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerFetchCookieSync',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebCookieManagerFetchCookieSync state success " + JSON.stringify(pages));
        if (!("WebCookieManagerFetchCookieSync" == pages.name)) {
          console.info("get WebCookieManagerFetchCookieSync state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebCookieManagerFetchCookieSync page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebCookieManagerFetchCookieSync page error: " + err);
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
      console.info("WebCookieManagerFetchCookieSync beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0100
    * @tc.name       : testFetchCookieSync001
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testFetchCookieSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync001", 'a=b', 100101, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0200
    * @tc.name       : testFetchCookieSync002
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync002", 'a=c', 100102, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0300
    * @tc.name       : testFetchCookieSync003
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync003", 'a=d', 100103, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0400
    * @tc.name       : testFetchCookieSync004
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync004", 'a=e', 100104, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0500
    * @tc.name       : testFetchCookieSync005
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync005", '', 100105, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0600
    * @tc.name       : testFetchCookieSync006
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync006", '', 100106, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0700
    * @tc.name       : testFetchCookieSync007
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync007", '', 100107, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0800
    * @tc.name       : testFetchCookieSync008
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync008", '', 100108, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0900
    * @tc.name       : testFetchCookieSync009
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync009", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync009", '', 100109, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1000
    * @tc.name       : testFetchCookieSync010
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync010", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync010", '', 100110, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1100
    * @tc.name       : testFetchCookieSync011
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync011", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync011", '', 100111, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1200
    * @tc.name       : testFetchCookieSync012
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync012", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync012", '', 100112, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1300
    * @tc.name       : testFetchCookieSync013
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync013", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync013", '', 100113, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1400
    * @tc.name       : testFetchCookieSync014
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync014", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync014", '', 100114, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1500
    * @tc.name       : testFetchCookieSync015
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync015", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync015", '', 100115, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1600
    * @tc.name       : testFetchCookieSync016
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync016", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync016", '', 100116, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1700
    * @tc.name       : testFetchCookieSync017
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync017", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync017", '', 100117, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1800
    * @tc.name       : testFetchCookieSync018
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync018", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync018", '', 100118, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_1900
    * @tc.name       : testFetchCookieSync019
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync019", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync019", '', 100119, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2000
    * @tc.name       : testFetchCookieSync020
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync020", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync020", '', 100120, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2100
    * @tc.name       : testFetchCookieSync021
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync021", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync021", '', 100121, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2200
    * @tc.name       : testFetchCookieSync022
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync022", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync022", '', 100122, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2300
    * @tc.name       : testFetchCookieSync023
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync023", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync023", '', 100123, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2400
    * @tc.name       : testFetchCookieSync024
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync024", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync024", '', 100124, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2500
    * @tc.name       : testFetchCookieSync025
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync025", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync025", '', 100125, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2600
    * @tc.name       : testFetchCookieSync026
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync026", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync026", '', 100126, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2700
    * @tc.name       : testFetchCookieSync027
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync027", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync027", '', 100127, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2800
    * @tc.name       : testFetchCookieSync028
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync028", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync028", '', 100128, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_2900
    * @tc.name       : testFetchCookieSync029
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync029", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync029", '', 100129, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_3000
    * @tc.name       : testFetchCookieSync030
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync030", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync030", '', 100130, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_3100
    * @tc.name       : testFetchCookieSync031
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync031", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync031", '', 100131, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_3200
    * @tc.name       : testFetchCookieSync032
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieSync032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSync032", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieSync032", '', 100132, done);
      sendEventByKey('WebCookieManagerFetchCookieSyncTestButton', 10, '');
    })

  })
}
