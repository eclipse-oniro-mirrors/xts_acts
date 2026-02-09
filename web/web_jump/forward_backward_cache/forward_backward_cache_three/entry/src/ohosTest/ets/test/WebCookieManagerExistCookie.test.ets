/**
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

import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver: Driver = Driver.create();

export default function webCookieManagerExistCookie() {
  describe('WebCookieManagerExistCookie', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerExistCookie',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebCookieManagerExistCookie state success ' + JSON.stringify(pages));
        if (!('WebCookieManagerExistCookie' == pages.name)) {
          console.info('get WebCookieManagerExistCookie state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebCookieManagerExistCookie page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebCookieManagerExistCookie page error: ' + err);
      }
      await driver.waitForComponent(ON.id('WebCookieManagerExistCookieTestButton'), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebCookieManagerExistCookie beforeEach start');
      done();
    })

    /**
     * @tc.name   testExistCookie002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0200
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie002', 135550)
      Utils.registerEvent('testExistCookie002', true, 135560, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie002');
    })

    /**
     * @tc.name   testExistCookie003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0300
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie003', 135550)
      Utils.registerEvent('testExistCookie003', true, 135570, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie003');
    })

    /**
     * @tc.name   testExistCookie004
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0400
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie004', 135550)
      Utils.registerEvent('testExistCookie004', true, 135580, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie004');
    })

    /**
     * @tc.name   testExistCookie005
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0500
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie005', 135550)
      Utils.registerEvent('testExistCookie005', false, 135590, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie005');
    })

    /**
     * @tc.name   testExistCookie006
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0600
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie006', 135550)
      Utils.registerEvent('testExistCookie006', false, 135600, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie006');
    })

    /**
     * @tc.name   testExistCookie007
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0700
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie007', 135550)
      Utils.registerEvent('testExistCookie007', false, 135610, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie007');
    })

    /**
     * @tc.name   testExistCookie008
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0800
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie008', 135550)
      Utils.registerEvent('testExistCookie008', false, 135620, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie008');
    })

    /**
     * @tc.name   testExistCookie009
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0900
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie009', 135550)
      Utils.registerEvent('testExistCookie009', false, 135630, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie009');
    })

    /**
     * @tc.name   testExistCookie010
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1000
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie010', 135550)
      Utils.registerEvent('testExistCookie010', false, 135640, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie010');
    })

    /**
     * @tc.name   testExistCookie011
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1100
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie011', 135550)
      Utils.registerEvent('testExistCookie011', false, 135650, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie011');
    })


    /**
     * @tc.name   testExistCookie012
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1200
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie012', 135550)
      Utils.registerEvent('testExistCookie012', false, 135660, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie012');
    })

    /**
     * @tc.name   testExistCookie013
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1300
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie013', 135550)
      Utils.registerEvent('testExistCookie013', false, 135670, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie013');
    })

    /**
     * @tc.name   testExistCookie014
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1400
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie014', 135550)
      Utils.registerEvent('testExistCookie014', false, 135680, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie014');
    })

    /**
     * @tc.name   testExistCookie015
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1500
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie015', 135550)
      Utils.registerEvent('testExistCookie015', false, 135690, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie015');
    })

    /**
     * @tc.name   testExistCookie016
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1600
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie016', 135550)
      Utils.registerEvent('testExistCookie016', false, 135700, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie016');
    })

    /**
     * @tc.name   testExistCookie017
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1700
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie017', 135550)
      Utils.registerEvent('testExistCookie017', false, 135710, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie017');
    })

    /**
     * @tc.name   testExistCookie018
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1800
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie018', 135550)
      Utils.registerEvent('testExistCookie018', false, 135720, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie018');
    })

    /**
     * @tc.name   testExistCookie019
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1900
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie019', 135550)
      Utils.registerEvent('testExistCookie019', false, 135730, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie019');
    })

    /**
     * @tc.name   testExistCookie020
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2000
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie020', 135550)
      Utils.registerEvent('testExistCookie020', false, 135740, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie020');
    })

    /**
     * @tc.name   testExistCookie021
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2100
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie021', 135550)
      Utils.registerEvent('testExistCookie021', false, 135750, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie021');
    })

    /**
     * @tc.name   testExistCookie022
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2200
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie022', 135550)
      Utils.registerEvent('testExistCookie022', false, 135760, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie022');
    })

    /**
     * @tc.name   testExistCookie023
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2300
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie023', 135550)
      Utils.registerEvent('testExistCookie023', false, 135770, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie023');
    })

    /**
     * @tc.name   testExistCookie024
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2400
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie024', 135550)
      Utils.registerEvent('testExistCookie024', false, 135780, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie024');
    })

    /**
     * @tc.name   testExistCookie025
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2500
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie025', 135550)
      Utils.registerEvent('testExistCookie025', false, 135790, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie025');
    })

    /**
     * @tc.name   testExistCookie026
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2600
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie026', 135550)
      Utils.registerEvent('testExistCookie026', false, 135800, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie026');
    })

    /**
     * @tc.name   testExistCookie027
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2700
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie027', 135550)
      Utils.registerEvent('testExistCookie027', false, 135810, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie027');
    })

    /**
     * @tc.name   testExistCookie028
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2800
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie028', 135550)
      Utils.registerEvent('testExistCookie028', false, 135820, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie028');
    })

    /**
     * @tc.name   testExistCookie029
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_2900
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie029', 135550)
      Utils.registerEvent('testExistCookie029', false, 135830, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie029');
    })

    /**
     * @tc.name   testExistCookie030
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_3000
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie030', 135550)
      Utils.registerEvent('testExistCookie030', false, 135840, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie030');
    })

    /**
     * @tc.name   testExistCookie031
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_3100
     * @tc.desc   test existCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExistCookie031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testExistCookie031', 135550)
      Utils.registerEvent('testExistCookie031', false, 135850, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerExistCookieTestButton', 'testExistCookie031');
    })
  })
}
