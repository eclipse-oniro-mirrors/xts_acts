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
    * @tc.number      : SUB_WEB_INITIALSCALE_0100
    * @tc.name        : testInitialScale001
    * @tc.desc        : test initialScale from 100 to 120
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testInitialScale001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitInitialScale001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testInitialScale001", 'oldScale=100,newScale=120', 70001, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_INITIALSCALE_0200
    * @tc.name        : testInitialScale002
    * @tc.desc        : test initialScale from 100 to 80
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testInitialScale002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitInitialScale002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testInitialScale001", 'oldScale=100,newScale=90', 70003, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONSCALECHANGE_0100
    * @tc.name        : testOnScaleChange001
    * @tc.desc        : test onScaleChange
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnScaleChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnScaleChange", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnScaleChange001", 'oldScale=100,newScale=110', 70005, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_015                                                                                                                                                           
     *tc.name Zoom                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ZoomTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitZoomTwo", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("ZoomTwo", "17100004", 15, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })
  })
}
