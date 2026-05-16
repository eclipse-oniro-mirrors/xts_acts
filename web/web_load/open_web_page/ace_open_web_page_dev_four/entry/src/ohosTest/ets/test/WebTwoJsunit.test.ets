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
import { beforeEach, describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';

const EVENT_ID_SET_EMIT_KEY = 203052;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webTwoJsunit() {
  describe('webTwoJsunit', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebTwo state success " + JSON.stringify(pages));
        if (!("WebTwo" == pages.name)) {
          console.info("get WebTwo state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebTwo page success");
        }
      } catch (err) {
        console.error("push WebTwo page error: " + err);
      }
      await driver.waitForComponent(ON.id("webTwoComponentButton"), 10000);
      console.log("waitForComponent webTwoComponentButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebTwo beforeEach start");
      done();
    })

    /**
     * @tc.name   testOnLoadInterceptCallback
     * @tc.number SUB_ACE_SUB_ONLOADINTERCEPT_CALLBACK_API_0100
     * @tc.desc   test onLoadIntercept callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnLoadInterceptCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnLoadInterceptCallback", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testOnLoadInterceptCallback", true, 26031046, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnLoadInterceptCallback", true, 26031047, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnLoadInterceptCallback", false, 26031048, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnLoadInterceptCallback", false, 26031049, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnLoadInterceptCallback", 'GET', 26031050, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webTwoComponentButton', 10, '');
    })
  })
}
