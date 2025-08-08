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

export default function webDataBase() {

  describe('WebDataBaseTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webDataBase',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webDataBase state success " + JSON.stringify(pages));
        if (!("webDataBase" == pages.name)) {
          console.info("get webDataBase state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webDataBase page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webDataBase page error: " + err);
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
      console.info("webDataBase beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_SAVEHTTPAUTHCREDENTIALS_0100
    * @tc.name       : testSaveHttpAuthCredentials001
    * @tc.desc       : test saveHttpAuthCredentials
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSaveHttpAuthCredentials001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSaveHttpAuthCredentials001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSaveHttpAuthCredentials001", true, 30040, done);
      sendEventByKey('WebDataBaseButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETHTTPAUTHCREDENTIALS_0100
    * @tc.name       : testGetHttpAuthCredentials001
    * @tc.desc       : test getHttpAuthCredentials
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetHttpAuthCredentials001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetHttpAuthCredentials001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHttpAuthCredentials001", "StrOmgGol", 30045, done);
      sendEventByKey('WebDataBaseButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_EXISTHTTPAUTHCREDENTIALS_0100
    * @tc.name       : testExistHttpAuthCredentials001
    * @tc.desc       : test existHttpAuthCredentials
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testExistHttpAuthCredentials001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testExistHttpAuthCredentials001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testExistHttpAuthCredentials001", true, 30046, done);
      sendEventByKey('WebDataBaseButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DELETEHTTPAUTHCREDENTIALS_0100
    * @tc.name       : testDeleteHttpAuthCredentials001
    * @tc.desc       : test deleteHttpAuthCredentials
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDeleteHttpAuthCredentials001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDeleteHttpAuthCredentials001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteHttpAuthCredentials001", false, 30050, done);
      sendEventByKey('WebDataBaseButton', 10, '');
    })

  })
}
