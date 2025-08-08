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

export default function precompileJavaScriptTest() {

  describe('precompileJavaScriptTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/precompileJavaScriptTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get precompileJavaScriptTest state success " + JSON.stringify(pages));
        if (!("precompileJavaScriptTest" == pages.name)) {
          console.info("get precompileJavaScriptTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(900);
          console.info("push precompileJavaScriptTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push precompileJavaScriptTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(500);
      console.info("precompileJavaScriptTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0200
    * @tc.name       : testPrecompileJavaScript002
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript002", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript002", -1, 10093, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0300
    * @tc.name       : testPrecompileJavaScript003
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript003", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript003", -1, 10094, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0400
    * @tc.name       : testPrecompileJavaScript004
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript004", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript004", -1, 10095, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0700
    * @tc.name       : testPrecompileJavaScript007
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript007", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript007", 0, 10098, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0800
    * @tc.name       : testPrecompileJavaScript008
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript008", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript008", 0, 10099, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0900
    * @tc.name       : testPrecompileJavaScript009
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript009", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript009", "401", 10100, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1000
    * @tc.name       : testPrecompileJavaScript010
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript010", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript010", "401", 10101, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1200
    * @tc.name       : testPrecompileJavaScript012
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript012", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript012", 0, 10103, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1300
    * @tc.name       : testPrecompileJavaScript013
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript013", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript013", 0, 10104, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1400
    * @tc.name       : testPrecompileJavaScript014
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript014", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript014", 0, 10105, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1500
    * @tc.name       : testPrecompileJavaScript015
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript015", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript015", 0, 10106, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1600
    * @tc.name       : testPrecompileJavaScript016
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript016", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript016", 0, 10107, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1700
    * @tc.name       : testPrecompileJavaScript017
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript017", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript017", 0, 10108, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1800
    * @tc.name       : testPrecompileJavaScript018
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript018", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript018", 0, 10109, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1900
    * @tc.name       : testPrecompileJavaScript019
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript019", 10)
      await Utils.sleep(500);
      Utils.registerEvent("testPrecompileJavaScript019", -1, 10110, done);
      sendEventByKey('precompileJavaScriptTestButton', 10, '');
    })
  })
}
