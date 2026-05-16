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

import { beforeAll, beforeEach,afterEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForExist } from './WaitTest.test';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();
export default function webOnBeforeUnloadThree() {

  describe('webOnBeforeUnloadThree', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnBeforeUnloadThree',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnBeforeUnloadThree state success " + JSON.stringify(pages));
        if (!("WebOnBeforeUnloadThree" == pages.name)) {
          console.info("get WebOnBeforeUnloadThree state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnBeforeUnloadThree page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnBeforeUnloadThree page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebOnBeforeUnloadThreeButton"), 10000);
      console.log("waitForComponent WebOnBeforeUnloadThreeButton click==>")
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebOnBeforeUnloadThree beforeEach start");
      done();
    })

    /**
     * @tc.name   testOnBeforeUnloadHandlePromptConfirm
     * @tc.number SUB_ACE_WEB_ONBEFOREUNLOAD_JSRESULT_API_0300
     * @tc.desc   test onBeforeUnload jsResult handlePromptConfirm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnBeforeUnloadHandlePromptConfirm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnBeforeUnloadHandlePromptConfirm', 141420);
      Utils.registerBaseEvent('testOnBeforeUnloadHandlePromptConfirm', 0, 26031045, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebOnBeforeUnloadThreeButton', 10, '');
    })

  })
}
