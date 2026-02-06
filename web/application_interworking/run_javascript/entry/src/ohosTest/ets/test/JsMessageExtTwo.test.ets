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

export default function jsMessageExtTwo() {

  describe('JsMessageExtTwoTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/jsMessageExtTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get jsMessageExtTwo state success " + JSON.stringify(pages));
        if (!("jsMessageExtTwo" == pages.name)) {
          console.info("get jsMessageExtTwo state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push jsMessageExtTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push jsMessageExtTwo page error: " + err);
      }
      await waitForComponent("JsMessageExtTwoButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("jsMessageExtTwo beforeEach start");
      done();
    })

    /**
     * @tc.name   testPromiseJsMessageExtGetErrorDescription001
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_PROMISE_0100
     * @tc.desc   test Promise JsMessageExt getErrorDescription exception length < 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseJsMessageExtGetErrorDescription001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseJsMessageExtGetErrorDescription001", 142)
      Utils.registerBaseEvent("testPromiseJsMessageExtGetErrorDescription001", true, 25112105, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })
    /**
     * @tc.name   testPromiseJsMessageExtGetErrorDescription002
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_PROMISE_0200
     * @tc.desc   test Promise JsMessageExt getErrorDescription exception length = 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseJsMessageExtGetErrorDescription002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseJsMessageExtGetErrorDescription002", 142)
      Utils.registerBaseEvent("testPromiseJsMessageExtGetErrorDescription002", true, 25112106, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })
    /**
     * @tc.name   testPromiseJsMessageExtGetErrorDescription003
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_PROMISE_0300
     * @tc.desc   test Promise JsMessageExt getErrorDescription exception length > 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseJsMessageExtGetErrorDescription003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseJsMessageExtGetErrorDescription003", 142)
      Utils.registerBaseEvent("testPromiseJsMessageExtGetErrorDescription003", true, 25112107, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })
    /**
     * @tc.name   testPromiseJsMessageExtGetErrorDescription004
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_PROMISE_0400
     * @tc.desc   test Promise JsMessageExt getErrorDescription object length < 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseJsMessageExtGetErrorDescription004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseJsMessageExtGetErrorDescription004", 142)
      Utils.registerBaseEvent("testPromiseJsMessageExtGetErrorDescription004", true, 25112108, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })
    /**
     * @tc.name   testPromiseJsMessageExtGetErrorDescription005
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_PROMISE_0500
     * @tc.desc   test Promise JsMessageExt getErrorDescription object length = 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseJsMessageExtGetErrorDescription005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseJsMessageExtGetErrorDescription005", 142)
      Utils.registerBaseEvent("testPromiseJsMessageExtGetErrorDescription005", true, 25112109, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })
    /**
     * @tc.name   testPromiseJsMessageExtGetErrorDescription006
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_PROMISE_0600
     * @tc.desc   test Promise JsMessageExt getErrorDescription object length > 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseJsMessageExtGetErrorDescription006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseJsMessageExtGetErrorDescription006", 142)
      Utils.registerBaseEvent("testPromiseJsMessageExtGetErrorDescription006", true, 25112110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })

    /**
     * @tc.name   testCallbackJsMessageExtGetErrorDescription001
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_CALLBACK_0100
     * @tc.desc   test Callback JsMessageExt getErrorDescription exception length < 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackJsMessageExtGetErrorDescription001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackJsMessageExtGetErrorDescription001", 142)
      Utils.registerBaseEvent("testCallbackJsMessageExtGetErrorDescription001", true, 25112111, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })
    /**
     * @tc.name   testCallbackJsMessageExtGetErrorDescription002
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_CALLBACK_0200
     * @tc.desc   test Callback JsMessageExt getErrorDescription exception length = 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackJsMessageExtGetErrorDescription002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackJsMessageExtGetErrorDescription002", 142)
      Utils.registerBaseEvent("testCallbackJsMessageExtGetErrorDescription002", true, 25112112, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })
    /**
     * @tc.name   testCallbackJsMessageExtGetErrorDescription003
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_CALLBACK_0300
     * @tc.desc   test Callback JsMessageExt getErrorDescription exception length > 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackJsMessageExtGetErrorDescription003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackJsMessageExtGetErrorDescription003", 142)
      Utils.registerBaseEvent("testCallbackJsMessageExtGetErrorDescription003", true, 25112113, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })
    /**
     * @tc.name   testCallbackJsMessageExtGetErrorDescription004
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_CALLBACK_0400
     * @tc.desc   test Callback JsMessageExt getErrorDescription object length < 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackJsMessageExtGetErrorDescription004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackJsMessageExtGetErrorDescription004", 142)
      Utils.registerBaseEvent("testCallbackJsMessageExtGetErrorDescription004", true, 25112114, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })
    /**
     * @tc.name   testCallbackJsMessageExtGetErrorDescription005
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_CALLBACK_0500
     * @tc.desc   test Callback JsMessageExt getErrorDescription object length = 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackJsMessageExtGetErrorDescription005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackJsMessageExtGetErrorDescription005", 142)
      Utils.registerBaseEvent("testCallbackJsMessageExtGetErrorDescription005", true, 25112115, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })
    /**
     * @tc.name   testCallbackJsMessageExtGetErrorDescription006
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETERRORDESCRIPTION_CALLBACK_0600
     * @tc.desc   test Callback JsMessageExt getErrorDescription object length > 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackJsMessageExtGetErrorDescription006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackJsMessageExtGetErrorDescription006", 142)
      Utils.registerBaseEvent("testCallbackJsMessageExtGetErrorDescription006", true, 25112116, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtTwoButton', 10, '');
    })


  })
}
