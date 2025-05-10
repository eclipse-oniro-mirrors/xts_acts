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

export default function webAttributeTest() {

  describe('WebAttributeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeTest state success " + JSON.stringify(pages));
        if (!("WebAttributeTest" == pages.name)) {
          console.info("get WebAttributeTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebAttributeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebAttributeTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebAttributeTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONPAGEEND_0100
    * @tc.name        : testOnPageEnd001
    * @tc.desc        : test onPageEnd normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testOnPageEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnPageEnd001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnPageEnd001", "resource://rawfile/second.html", 70007, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONPAGEEND_0200
    * @tc.name        : testOnPageEnd002
    * @tc.desc        : test onPageEnd with iframe
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnPageEnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPageEnd002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnPageEnd002", "resource://rawfile/iframe.html", 70008, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONPAGEBEGIN_0100
    * @tc.name        : testOnPageBegin001
    * @tc.desc        : test onPageBegin normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnPageBegin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPageBegin001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnPageBegin001", "resource://rawfile/second.html", 70009, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONPAGEBEGIN_0200
    * @tc.name        : testOnPageBegin002
    * @tc.desc        : test onPageBegin with iframe
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnPageBegin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPageBegin002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnPageBegin002", "resource://rawfile/iframe.html", 70010, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONPROGRESSCHANGE_0100
    * @tc.name        : testOnProgressChange001
    * @tc.desc        : test onProgressChange normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnProgressChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnProgressChange001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnProgressChange001", "100", 700012, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })
  })
}
