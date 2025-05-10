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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webHitTestTypeEnumTest() {

  describe('WebHitTestTypeEnumTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebHitTestTypeEnumTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebHitTestTypeEnumTest state success " + JSON.stringify(pages));
        if (!("WebHitTestTypeEnumTest" == pages.name)) {
          console.info("get WebHitTestTypeEnumTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebHitTestTypeEnumTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebHitTestTypeEnumTest page error: " + err);
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
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebHitTestTypeEnumTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebHitTestTypeEnumTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBHITTESTTYPE_ENUM_0100
    * @tc.name        : testWebHitTestTypeEnum001
    * @tc.desc        : test the value of WebHitTestType.EditText is 0
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebHitTestTypeEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebHitTestTypeEnum001", 0, 70143, done);
      sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBHITTESTTYPE_ENUM_0200
    * @tc.name        : testWebHitTestTypeEnum002
    * @tc.desc        : test the value of WebHitTestType.Email is 1
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebHitTestTypeEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebHitTestTypeEnum002", 1, 70144, done);
      sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBHITTESTTYPE_ENUM_0300
    * @tc.name        : testWebHitTestTypeEnum003
    * @tc.desc        : test the value of WebHitTestType.HttpAnchor is 2
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebHitTestTypeEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebHitTestTypeEnum003", 2, 70145, done);
      sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBHITTESTTYPE_ENUM_0400
    * @tc.name        : testWebHitTestTypeEnum004
    * @tc.desc        : test the value of WebHitTestType.HttpAnchorImg is 3
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebHitTestTypeEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebHitTestTypeEnum004", 3, 70146, done);
      sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBHITTESTTYPE_ENUM_0500
    * @tc.name        : testWebHitTestTypeEnum005
    * @tc.desc        : test the value of WebHitTestType.Img is 4
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebHitTestTypeEnum005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebHitTestTypeEnum005", 4, 70147, done);
      sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBHITTESTTYPE_ENUM_0600
    * @tc.name        : testWebHitTestTypeEnum006
    * @tc.desc        : test the value of WebHitTestType.Map is 5
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebHitTestTypeEnum006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebHitTestTypeEnum006", 5, 70148, done);
      sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBHITTESTTYPE_ENUM_0700
    * @tc.name        : testWebHitTestTypeEnum007
    * @tc.desc        : test the value of WebHitTestType.Phone is 6
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebHitTestTypeEnum007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebHitTestTypeEnum007", 6, 70149, done);
      sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBHITTESTTYPE_ENUM_0800
    * @tc.name        : testWebHitTestTypeEnum008
    * @tc.desc        : test the value of WebHitTestType.Unknown is 7
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebHitTestTypeEnum008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebHitTestTypeEnum008", 7, 70150, done);
      sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
    })
  })
}
