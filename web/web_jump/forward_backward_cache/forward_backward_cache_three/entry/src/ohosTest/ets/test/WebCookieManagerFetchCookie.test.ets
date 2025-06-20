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

export default function webCookieManagerFetchCookie() {

  describe('WebCookieManagerFetchCookie', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerFetchCookie',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebCookieManagerFetchCookie state success " + JSON.stringify(pages));
        if (!("WebCookieManagerFetchCookie" == pages.name)) {
          console.info("get WebCookieManagerFetchCookie state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebCookieManagerFetchCookie page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebCookieManagerFetchCookie page error: " + err);
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
      console.info("WebCookieManagerFetchCookie beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0100
    * @tc.name       : testFetchCookie001
    * @tc.desc       : test fetchCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie001", 'a=b', 100201, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0200
    * @tc.name       : testFetchCookie002
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie002", 'a=c', 100202, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0300
    * @tc.name       : testFetchCookie003
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie003", 'a=d', 100203, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0400
    * @tc.name       : testFetchCookie004
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie004", 'a=e', 100204, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0500
    * @tc.name       : testFetchCookie005
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie005", '', 100205, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0600
    * @tc.name       : testFetchCookie006
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie006", '', 100206, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0700
    * @tc.name       : testFetchCookie007
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie007", '', 100207, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0800
    * @tc.name       : testFetchCookie008
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie008", '', 100208, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_0900
    * @tc.name       : testFetchCookie009
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie009", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie009", '', 100209, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1000
    * @tc.name       : testFetchCookie010
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie010", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie010", '', 100210, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1100
    * @tc.name       : testFetchCookie011
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie011", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie011", '', 100211, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1200
    * @tc.name       : testFetchCookie012
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie012", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie012", '', 100212, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1300
    * @tc.name       : testFetchCookie013
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie013", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie013", '', 100213, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1400
    * @tc.name       : testFetchCookie014
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie014", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie014", '', 100214, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1500
    * @tc.name       : testFetchCookie015
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie015", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie015", '', 100215, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1600
    * @tc.name       : testFetchCookie016
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie016", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie016", '', 100216, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1700
    * @tc.name       : testFetchCookie017
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie017", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie017", '', 100217, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1800
    * @tc.name       : testFetchCookie018
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie018", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie018", '', 100218, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_1900
    * @tc.name       : testFetchCookie019
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie019", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie019", '', 100219, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2000
    * @tc.name       : testFetchCookie020
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie020", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie020", '', 100220, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2100
    * @tc.name       : testFetchCookie021
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie021", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie021", '', 100221, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2200
    * @tc.name       : testFetchCookie022
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie022", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie022", '', 100222, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2300
    * @tc.name       : testFetchCookie023
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie023", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie023", '', 100223, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2400
    * @tc.name       : testFetchCookie024
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie024", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie024", '', 100224, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2500
    * @tc.name       : testFetchCookie025
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie025", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie025", '', 100225, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2600
    * @tc.name       : testFetchCookie026
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie026", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie026", '', 100226, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2700
    * @tc.name       : testFetchCookie027
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie027", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie027", '', 100227, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2800
    * @tc.name       : testFetchCookie028
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie028", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie028", '', 100228, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_2900
    * @tc.name       : testFetchCookie029
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie029", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie029", '', 100229, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3000
    * @tc.name       : testFetchCookie030
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie030", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie030", '', 100230, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3100
    * @tc.name       : testFetchCookie031
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie031", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie031", '', 100231, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3200
    * @tc.name       : testFetchCookie032
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie032", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie032", '', 100232, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3300
    * @tc.name       : testFetchCookie033
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie033", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie033", 'a=b', 100233, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3400
    * @tc.name       : testFetchCookie034
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie034", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie034", 'a=c', 100234, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3500
    * @tc.name       : testFetchCookie035
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie035", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie035", 'a=d', 100235, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3600
    * @tc.name       : testFetchCookie036
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie036", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie036", 'a=e', 100236, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3700
    * @tc.name       : testFetchCookie037
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie037", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie037", '', 100237, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3800
    * @tc.name       : testFetchCookie038
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie038", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie038", '', 100238, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_3900
    * @tc.name       : testFetchCookie039
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie039", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie039", '', 100239, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4000
    * @tc.name       : testFetchCookie040
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie040", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie040", '', 100240, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4100
    * @tc.name       : testFetchCookie041
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie041", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie041", '', 100241, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4200
    * @tc.name       : testFetchCookie042
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie042", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie042", '', 100242, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4300
    * @tc.name       : testFetchCookie043
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie043", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie043", '', 100243, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4400
    * @tc.name       : testFetchCookie044
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie044", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie044", '', 100244, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4500
    * @tc.name       : testFetchCookie045
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie045", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie045", '', 100245, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4600
    * @tc.name       : testFetchCookie046
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie046", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie046", '', 100246, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4700
    * @tc.name       : testFetchCookie047
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie047", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie047", '', 100247, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
   * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4800
   * @tc.name       : testFetchCookie048
   * @tc.desc       : test fetchCookieSync
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testFetchCookie048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie048", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie048", '', 100248, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
   * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_4900
   * @tc.name       : testFetchCookie049
   * @tc.desc       : test fetchCookieSync
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testFetchCookie049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie049", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie049", '', 100249, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5000
    * @tc.name       : testFetchCookie050
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie050", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie050", '', 100250, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5100
    * @tc.name       : testFetchCookie051
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie051", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie051", '', 100251, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5200
    * @tc.name       : testFetchCookie052
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie052", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie052", '', 100252, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5300
    * @tc.name       : testFetchCookie053
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie053", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie053", '', 100253, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5400
    * @tc.name       : testFetchCookie054
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie054", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie054", '', 100254, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5500
    * @tc.name       : testFetchCookie055
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie055", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie054", '', 100255, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5600
    * @tc.name       : testFetchCookie056
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie056", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie056", '', 100256, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5700
    * @tc.name       : testFetchCookie057
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie057", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie057", '', 100257, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5800
    * @tc.name       : testFetchCookie058
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie058", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie058", '', 100258, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_5900
    * @tc.name       : testFetchCookie059
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie059", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie059", '', 100259, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_6000
    * @tc.name       : testFetchCookie060
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie060", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie060", '', 100260, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_6100
    * @tc.name       : testFetchCookie061
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie061", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie061", '', 100261, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_6200
    * @tc.name       : testFetchCookie062
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie062", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie062", '', 100262, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_6300
    * @tc.name       : testFetchCookie063
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie063", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie063", '', 100263, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_6400
    * @tc.name       : testFetchCookie064
    * @tc.desc       : test fetchCookieSync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookie064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookie064", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookie064", '', 100264, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

  })
}
