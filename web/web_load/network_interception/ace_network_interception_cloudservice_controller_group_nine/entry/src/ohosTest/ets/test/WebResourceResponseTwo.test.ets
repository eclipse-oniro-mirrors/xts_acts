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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver,ON } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = ""
const  driver = Driver.create();

export default function webResourceResponseTwo() {

  describe('webResourceResponseTwoTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebResourceResponsePageTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebResourceResponsePageTwo state success " + JSON.stringify(pages));
        if (!("WebResourceResponsePageTwo" == pages.name)) {
          console.info("get WebResourceResponsePageTwo state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebResourceResponsePageTwo page success");
        }
      } catch (err) {
        console.error("push WebResourceResponsePageTwo page error: " + err);
      }
      await driver.waitForComponent(ON.id("OnInterceptRequestButton"), 10000);
      console.log("waitForComponent OnInterceptRequestButton");
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebResourceResponsePageTwo beforeEach start");
      done();
    })

    /**
     * @tc.name   testOnInterceptRequestCallback01
     * @tc.number SUB_WEB_ONINTERCEPRREQUEST_CALLBACK_API_0100
     * @tc.desc   test OnInterceptRequest callback getResponseData string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnInterceptRequestCallback01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnInterceptRequestCallback01', 12788);
      Utils.registerBaseEvent("testOnInterceptRequestCallback01", 'https://www.example.com/', 26031051, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback01", true, 26031052, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback01", true, 26031053, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback01", false, 26031054, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback01", false, 26031055, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback01", 'GET', 26031056, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback01", true, 26031057, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('OnInterceptRequestButton', 10, '');
    })
    /**
     * @tc.name   testOnInterceptRequestCallback02
     * @tc.number SUB_WEB_ONINTERCEPRREQUEST_CALLBACK_API_0200
     * @tc.desc   test OnInterceptRequest callback getResponseDataEx number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnInterceptRequestCallback02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitOnInterceptRequestCallback02', 12788);
      Utils.registerBaseEvent("testOnInterceptRequestCallback02", true, 26031058, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback02", 'OK', 26031059, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback02", 200, 26031060, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback02", 'utf-8', 26031061, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback02", true, 26031062, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback02", 'text/html', 26031063, null, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent("testOnInterceptRequestCallback02", true, 26031064, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('OnInterceptRequestButton', 10, '');
    })
    /**
     * @tc.name   testOnInterceptRequestCallback03
     * @tc.number SUB_WEB_ONINTERCEPRREQUEST_CALLBACK_API_0300
     * @tc.desc   test OnInterceptRequest callback getResponseDataEx ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnInterceptRequestCallback03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitOnInterceptRequestCallback03', 12788);
      Utils.registerBaseEvent("testOnInterceptRequestCallback03", true, 26031065, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('OnInterceptRequestButton', 10, '');
    })
    /**
     * @tc.name   testOnInterceptRequestCallback04
     * @tc.number SUB_WEB_ONINTERCEPRREQUEST_CALLBACK_API_0400
     * @tc.desc   test OnInterceptRequest callback getResponseDataEx Resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnInterceptRequestCallback04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitOnInterceptRequestCallback04', 12788);
      Utils.registerBaseEvent("testOnInterceptRequestCallback04", true, 26031066, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('OnInterceptRequestButton', 10, '');
    })
    /**
     * @tc.name   testOnInterceptRequestCallback05
     * @tc.number SUB_WEB_ONINTERCEPRREQUEST_CALLBACK_API_0500
     * @tc.desc   test OnInterceptRequest callback getResponseDataEx undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnInterceptRequestCallback05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitOnInterceptRequestCallback05', 12788);
      Utils.registerBaseEvent("testOnInterceptRequestCallback05", true, 26031067, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('OnInterceptRequestButton', 10, '');
    })

  })
}
