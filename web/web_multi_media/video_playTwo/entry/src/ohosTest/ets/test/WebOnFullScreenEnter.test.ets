/**
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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest.test';
import { Driver } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webOnFullScreenEnter() {
  describe('WebOnFullScreenEnterTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnFullScreenEnter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnFullScreenEnter state success " + JSON.stringify(pages));
        if (!("WebOnFullScreenEnter" == pages.name)) {
          console.info("get WebOnFullScreenEnter state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnFullScreenEnter page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnFullScreenEnter page error: " + err);
      }
      await waitForComponents('OnFullScreenEnterTestButton');
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
      console.info("WebOnFullScreenEnterTest afterEach start");
      console.info("WebOnFullScreenEnterTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONFULLSCREENENTER_0100
    * @tc.name        : testOnFullScreenEnter001
    * @tc.desc        : test onFullScreenEnter
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testOnFullScreenEnter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitOnFullScreenEnter", 300750)
      Utils.registerBaseEvent("testOnFullScreenEnter001", "true_\"true\"", 300760, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver,'OnFullScreenEnterTestButton')
    })
  })
}