/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webGetProgressTest() {

  describe('webGetProgressTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebGetProgress',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebGetProgress state success ' + JSON.stringify(pages));
        if (!('WebGetProgress' == pages.name)) {
          console.info('get WebGetProgress state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebGetProgress page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebGetProgress page error: ' + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id("WebGetProgressButton"),10000);
      console.log('waitForComponent WebGetProgressButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebGetProgress beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebGetProgress afterEach start');
      done();
    })

    /**
     * @tc.name   testGetProgressErrorCode001
     * @tc.number SUB_ACE_WEB_GETPROGRESS_ERRORCODE_API_0100
     * @tc.desc   test getProgress error code 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetProgressErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetProgressErrorCode001', 118);
      Utils.registerBaseEvent('testGetProgressErrorCode001', true, 2025090201, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebGetProgressButton', 10, '');
    })
  })
}
