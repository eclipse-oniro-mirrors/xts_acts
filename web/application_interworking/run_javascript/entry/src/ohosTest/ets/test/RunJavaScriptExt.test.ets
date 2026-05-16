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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function runJavaScriptExt() {

  describe('runJavaScriptExtTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/runJavaScriptExt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get runJavaScriptExt state success " + JSON.stringify(pages));
        if (!("runJavaScriptExt" == pages.name)) {
          console.info("get runJavaScriptExt state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push runJavaScriptExt page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push runJavaScriptExt page error: " + err);
      }
      await waitForComponent("runJavaScriptExtButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("runJavaScriptExt beforeEach start");
      done();
    })

    /**
     * @tc.name   testRunJavaScriptExtPromiseGetType001
     * @tc.number SUB_WEB_RUNJAVASCRIPTEXT_GETTYPE_0100
     * @tc.desc   test runJavaScriptExt promise getType STRING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptExtPromiseGetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScriptExtPromiseGetType001", 261010)
      Utils.registerBaseEvent("testRunJavaScriptExtPromiseGetType001", 1, 26031005, null,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.registerBaseEvent("testRunJavaScriptExtPromiseGetType001", '"hello, world"', 26031006, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptExtButton', 10, '');
    })

    /**
     * @tc.name   testRunJavaScriptExtPromiseGetType002
     * @tc.number SUB_WEB_RUNJAVASCRIPTEXT_GETTYPE_0200
     * @tc.desc   test runJavaScriptExt promise getType NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptExtPromiseGetType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScriptExtPromiseGetType002", 261010)
      Utils.registerBaseEvent("testRunJavaScriptExtPromiseGetType002", 2, 26031007, null,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.registerBaseEvent("testRunJavaScriptExtPromiseGetType002", 1, 26031008, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptExtButton', 10, '');
    })

    /**
     * @tc.name   testRunJavaScriptExtPromiseGetType003
     * @tc.number SUB_WEB_RUNJAVASCRIPTEXT_GETTYPE_0300
     * @tc.desc   test runJavaScriptExt promise getType BOOLEAN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptExtPromiseGetType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScriptExtPromiseGetType003", 261010)
      Utils.registerBaseEvent("testRunJavaScriptExtPromiseGetType003", 3, 26031009, null,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.registerBaseEvent("testRunJavaScriptExtPromiseGetType003", true, 26031010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptExtButton', 10, '');
    })

    /**
     * @tc.name   testRunJavaScriptExtPromiseGetType004
     * @tc.number SUB_WEB_RUNJAVASCRIPTEXT_GETTYPE_0400
     * @tc.desc   test runJavaScriptExt promise getType ARRAY_BUFFER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptExtPromiseGetType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScriptExtPromiseGetType004", 261010)
      Utils.registerBaseEvent("testRunJavaScriptExtPromiseGetType004", 4, 26031011, null,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.registerBaseEvent("testRunJavaScriptExtPromiseGetType004", true, 26031012, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptExtButton', 10, '');
    })

    /**
     * @tc.name   testRunJavaScriptExtPromiseGetType005
     * @tc.number SUB_WEB_RUNJAVASCRIPTEXT_GETTYPE_0500
     * @tc.desc   test runJavaScriptExt promise getType ARRAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptExtPromiseGetType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScriptExtPromiseGetType005", 261010)
      Utils.registerBaseEvent("testRunJavaScriptExtPromiseGetType005", 5, 26031013, null,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.registerBaseEvent("testRunJavaScriptExtPromiseGetType005", true, 26031014, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptExtButton', 10, '');
    })
  })
}
