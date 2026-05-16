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

export default function jsMessageExtThree() {

  describe('JsMessageExtThreeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/jsMessageExtThree',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get jsMessageExtThree state success " + JSON.stringify(pages));
        if (!("jsMessageExtThree" == pages.name)) {
          console.info("get jsMessageExtThree state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push jsMessageExtThree page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push jsMessageExtThree page error: " + err);
      }
      await waitForComponent("JsMessageExtThreeButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("jsMessageExtThree beforeEach start");
      done();
    })

    /**
     * @tc.name   testPromiseGetErrorDescriptionNull001
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_PROMISE_NULL_0100
     * @tc.desc   test Promise getErrorDescription null getType STRING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseGetErrorDescriptionNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseGetErrorDescriptionNull001", 143)
      Utils.registerBaseEvent("testPromiseGetErrorDescriptionNull001", true, 25112117, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtThreeButton', 10, '');
    })
    /**
     * @tc.name   testPromiseGetErrorDescriptionNull002
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_PROMISE_NULL_0200
     * @tc.desc   test Promise getErrorDescription null getType NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseGetErrorDescriptionNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseGetErrorDescriptionNull002", 143)
      Utils.registerBaseEvent("testPromiseGetErrorDescriptionNull002", true, 25112118, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtThreeButton', 10, '');
    })
    /**
     * @tc.name   testPromiseGetErrorDescriptionNull003
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_PROMISE_NULL_0300
     * @tc.desc   test Promise getErrorDescription null getType BOOLEAN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseGetErrorDescriptionNull003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseGetErrorDescriptionNull003", 143)
      Utils.registerBaseEvent("testPromiseGetErrorDescriptionNull003", true, 25112119, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtThreeButton', 10, '');
    })
    /**
     * @tc.name   testPromiseGetErrorDescriptionNull004
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_PROMISE_NULL_0400
     * @tc.desc   test Promise getErrorDescription null getType ARRAY_BUFFER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseGetErrorDescriptionNull004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseGetErrorDescriptionNull004", 143)
      Utils.registerBaseEvent("testPromiseGetErrorDescriptionNull004", true, 25112120, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtThreeButton', 10, '');
    })
    /**
     * @tc.name   testPromiseGetErrorDescriptionNull005
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_PROMISE_NULL_0500
     * @tc.desc   test Promise getErrorDescription null getType ARRAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseGetErrorDescriptionNull005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseGetErrorDescriptionNull005", 143)
      Utils.registerBaseEvent("testPromiseGetErrorDescriptionNull005", true, 25112121, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtThreeButton', 10, '');
    })
    /**
     * @tc.name   testCallbackGetErrorDescriptionNull001
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_CALLBACK_NULL_0100
     * @tc.desc   test callback getErrorDescription null getType STRING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackGetErrorDescriptionNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackGetErrorDescriptionNull001", 143)
      Utils.registerBaseEvent("testCallbackGetErrorDescriptionNull001", true, 25112122, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtThreeButton', 10, '');
    })
    /**
     * @tc.name   testCallbackGetErrorDescriptionNull002
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_CALLBACK_NULL_0200
     * @tc.desc   test callback getErrorDescription null getType NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackGetErrorDescriptionNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackGetErrorDescriptionNull002", 143)
      Utils.registerBaseEvent("testCallbackGetErrorDescriptionNull002", true, 25112123, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtThreeButton', 10, '');
    })
    /**
     * @tc.name   testCallbackGetErrorDescriptionNull003
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_CALLBACK_NULL_0300
     * @tc.desc   test callback getErrorDescription null getType BOOLEAN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackGetErrorDescriptionNull003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackGetErrorDescriptionNull003", 143)
      Utils.registerBaseEvent("testCallbackGetErrorDescriptionNull003", true, 25112124, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtThreeButton', 10, '');
    })
    /**
     * @tc.name   testCallbackGetErrorDescriptionNull004
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_CALLBACK_NULL_0400
     * @tc.desc   test callback getErrorDescription null getType ARRAY_BUFFER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackGetErrorDescriptionNull004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackGetErrorDescriptionNull004", 143)
      Utils.registerBaseEvent("testCallbackGetErrorDescriptionNull004", true, 25112125, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtThreeButton', 10, '');
    })
    /**
     * @tc.name   testCallbackGetErrorDescriptionNull005
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_CALLBACK_NULL_0500
     * @tc.desc   test callback getErrorDescription null getType ARRAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackGetErrorDescriptionNull005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackGetErrorDescriptionNull005", 143)
      Utils.registerBaseEvent("testCallbackGetErrorDescriptionNull005", true, 25112126, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtThreeButton', 10, '');
    })



  })
}
