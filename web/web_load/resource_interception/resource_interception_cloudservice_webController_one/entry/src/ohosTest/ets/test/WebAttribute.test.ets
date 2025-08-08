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
export default function webAttribute() {

  describe('WebAttributeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webAttribute',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webAttribute state success " + JSON.stringify(pages));
        if (!("webAttribute" == pages.name)) {
          console.info("get webAttribute state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webAttribute page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webAttribute page error: " + err);
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
      console.info("webAttribute beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_GEOLOCATIONACCESS_0100
    * @tc.name       : testGeolocationAccess001
    * @tc.desc       : test geolocationAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGeolocationAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGeolocationAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGeolocationAccess001", "\"位置服务被拒绝\"", 31020, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONRESOURCELOAD_0100
    * @tc.name       : testOnResourceLoad001
    * @tc.desc       : test onResourceLoad
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnResourceLoad001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnResourceLoad001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnResourceLoad001", "resource://rawfile/geolocation.html", 31021, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONWINDOWNEW_0100
    * @tc.name       : testOnWindowNew001
    * @tc.desc       : test onWindowNew
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnWindowNew001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnWindowNew001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnWindowNew001", true, 30071, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONWINDOWNEW_0200
    * @tc.name       : testOnWindowNew002
    * @tc.desc       : test onWindowNew
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnWindowNew002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnWindowNew002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnWindowNew002", false, 30072, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONWINDOWNEW_0300
    * @tc.name       : testOnWindowNew003
    * @tc.desc       : test onWindowNew
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnWindowNew003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnWindowNew003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnWindowNew003", false, 30073, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MULTIWINDOWACCESS_0100
    * @tc.name       : testMultiWindowAccess001
    * @tc.desc       : test multiWindowAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMultiWindowAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testMultiWindowAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMultiWindowAccess001", false, 30074, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JAVASCRIPTACCESS_0100
    * @tc.name       : testJavaScriptAccess001
    * @tc.desc       : test javaScriptAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJavaScriptAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJavaScriptAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJavaScriptAccess001", true, 32019, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })
  })

}
