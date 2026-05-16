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
export default function webOnBeforeUnloadTwo() {

  describe('webOnBeforeUnloadTwo', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnBeforeUnloadTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnBeforeUnloadTwo state success " + JSON.stringify(pages));
        if (!("WebOnBeforeUnloadTwo" == pages.name)) {
          console.info("get WebOnBeforeUnloadTwo state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnBeforeUnloadTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnBeforeUnloadTwo page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebOnBeforeUnloadTwoButton"), 10000);
      console.log("waitForComponent WebOnBeforeUnloadTwoButton click==>")
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebOnBeforeUnloadTwo beforeEach start");
      done();
    })

    /**
     * @tc.name   testOnBeforeUnloadHandleConfirm
     * @tc.number SUB_ACE_WEB_ONBEFOREUNLOAD_JSRESULT_API_0100
     * @tc.desc   test onBeforeUnload jsResult handleConfirm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnBeforeUnloadHandleConfirm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnBeforeUnloadHandleConfirm', 141419);
      Utils.registerBaseEvent('testOnBeforeUnloadHandleConfirm', 0, 26031043, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebOnBeforeUnloadTwoButton', 10, '');
    })
    /**
     * @tc.name   testOnBeforeUnloadHandleCancel
     * @tc.number SUB_ACE_WEB_ONBEFOREUNLOAD_JSRESULT_API_0200
     * @tc.desc   test onBeforeUnload jsResult handleCancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnBeforeUnloadHandleCancel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnBeforeUnloadHandleCancel', 141419);
      Utils.registerBaseEvent('testOnBeforeUnloadHandleCancel', 0, 26031044, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebOnBeforeUnloadTwoButton', 10, '');
    })
  })
}
