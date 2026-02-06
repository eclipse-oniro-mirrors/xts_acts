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
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import events_emitter from '@ohos.events.emitter';
import { waitForComponents } from './WaitTest.test';
import { Driver } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const driver = Driver.create();

export default function webOnAudioStateChanged() {
  describe('WebOnAudioStateChangedTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnAudioStateChanged',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnAudioStateChanged state success " + JSON.stringify(pages));
        if (!("WebOnAudioStateChanged" == pages.name)) {
          console.info("get WebOnAudioStateChanged state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnAudioStateChanged page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnAudioStateChanged page error: " + err);
      }
      await waitForComponents('WebOnAudioStateChangedTestButton');
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
      console.info("WebOnAudioStateChangedTest afterEach start");
      console.info("WebOnAudioStateChangedTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONAUDIOSTATECHANGED_0100
    * @tc.name        : testOnAudioStateChanged001
    * @tc.desc        : test onAudioStateChanged when start play audio
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testOnAudioStateChanged001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitAudioStatePlay", 132650)
      Utils.registerBaseEvent("testOnAudioStateChanged001", "true_true_", 132660, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebOnAudioStateChangedTestButton');
    })

    /*
    * @tc.number      : SUB_WEB_ONAUDIOSTATECHANGED_0200
    * @tc.name        : testOnAudioStateChanged002
    * @tc.desc        : test onAudioStateChanged when pause play audio
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testOnAudioStateChanged002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitAudioStatePause", 132650)
      Utils.registerBaseEvent("testOnAudioStateChanged002", "true_false_false_", 132670, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebOnAudioStateChangedTestButton');
    })
  })
}