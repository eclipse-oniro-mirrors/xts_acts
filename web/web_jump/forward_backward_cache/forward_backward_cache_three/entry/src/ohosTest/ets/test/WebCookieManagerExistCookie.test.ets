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

export default function webCookieManagerExistCookie() {

  describe('WebCookieManagerExistCookie', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerExistCookie',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebCookieManagerExistCookie state success " + JSON.stringify(pages));
        if (!("WebCookieManagerExistCookie" == pages.name)) {
          console.info("get WebCookieManagerExistCookie state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebCookieManagerExistCookie page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebCookieManagerExistCookie page error: " + err);
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
      console.info("WebCookieManagerExistCookie beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0200
    * @tc.name       : testExistCookie002
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie002", true, 100302, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0300
    * @tc.name       : testExistCookie003
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie003", true, 100303, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0400
    * @tc.name       : testExistCookie004
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie004", true, 100304, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0500
    * @tc.name       : testExistCookie005
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie005", false, 100305, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0600
    * @tc.name       : testExistCookie006
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie006", false, 100306, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0700
    * @tc.name       : testExistCookie007
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie007", false, 100307, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0800
    * @tc.name       : testExistCookie008
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie008", false, 100308, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0900
    * @tc.name       : testExistCookie009
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie009", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie009", false, 100309, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1000
    * @tc.name       : testExistCookie010
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie010", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie010", false, 100310, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1100
    * @tc.name       : testExistCookie011
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie011", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie011", false, 100311, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1200
    * @tc.name       : testExistCookie012
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie012", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie012", false, 100312, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1300
    * @tc.name       : testExistCookie013
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie013", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie013", false, 100313, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1400
    * @tc.name       : testExistCookie014
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie014", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie014", false, 100314, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1500
    * @tc.name       : testExistCookie015
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie015", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie015", false, 100315, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1600
    * @tc.name       : testExistCookie016
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie016", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie016", false, 100316, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1700
    * @tc.name       : testExistCookie017
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie017", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie017", false, 100317, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1800
    * @tc.name       : testExistCookie018
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie018", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie018", false, 100318, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1900
    * @tc.name       : testExistCookie019
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie019", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie019", false, 100319, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2000
    * @tc.name       : testExistCookie020
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie020", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie020", false, 100320, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2100
    * @tc.name       : testExistCookie021
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie021", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie021", false, 100321, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2200
    * @tc.name       : testExistCookie022
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie022", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie022", false, 100322, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2300
    * @tc.name       : testExistCookie023
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie023", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie023", false, 100323, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2400
    * @tc.name       : testExistCookie024
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie024", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie024", false, 100324, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2500
    * @tc.name       : testExistCookie025
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie025", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie025", false, 100325, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2600
    * @tc.name       : testExistCookie026
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie026", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie026", false, 100326, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2700
    * @tc.name       : testExistCookie027
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie027", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie027", false, 100327, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2800
    * @tc.name       : testExistCookie028
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie028", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie028", false, 100328, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2900
    * @tc.name       : testExistCookie029
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie029", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie029", false, 100329, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_3000
    * @tc.name       : testExistCookie030
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie030", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie030", false, 100330, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_3100
    * @tc.name       : testExistCookie031
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistCookie031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistCookie031", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistCookie031", false, 100331, done);
      sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
    })

  })
}
