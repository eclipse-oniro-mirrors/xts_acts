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

export default function jsMessageExtFour() {

  describe('JsMessageExtFourTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/jsMessageExtFour',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get jsMessageExtFour state success " + JSON.stringify(pages));
        if (!("jsMessageExtFour" == pages.name)) {
          console.info("get jsMessageExtFour state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push jsMessageExtFour page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push jsMessageExtFour page error: " + err);
      }
      await waitForComponent("JsMessageExtFourButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("jsMessageExtFour beforeEach start");
      done();
    })

    /**
     * @tc.name   testPromiseJavascriptProxyGetErrorDescription001
     * @tc.number SUB_WEB_JAVASCRIPTPROXY_GETERRORDESCRIPTION_PROMISE_0100
     * @tc.desc   test Promise javascriptProxy getErrorDescription object length < 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseJavascriptProxyGetErrorDescription001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseJavascriptProxyGetErrorDescription001", 144)
      Utils.registerBaseEvent("testPromiseJavascriptProxyGetErrorDescription001", true, 25112127, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtFourButton', 10, '');
    })
    /**
     * @tc.name   testPromiseJavascriptProxyGetErrorDescription002
     * @tc.number SUB_WEB_JAVASCRIPTPROXY_GETERRORDESCRIPTION_PROMISE_0200
     * @tc.desc   test Promise javascriptProxy getErrorDescription object length = 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseJavascriptProxyGetErrorDescription002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseJavascriptProxyGetErrorDescription002", 144)
      Utils.registerBaseEvent("testPromiseJavascriptProxyGetErrorDescription002", true, 25112128, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtFourButton', 10, '');
    })
    /**
     * @tc.name   testPromiseJavascriptProxyGetErrorDescription003
     * @tc.number SUB_WEB_JAVASCRIPTPROXY_GETERRORDESCRIPTION_PROMISE_0300
     * @tc.desc   test Promise javascriptProxy getErrorDescription object length > 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPromiseJavascriptProxyGetErrorDescription003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPromiseJavascriptProxyGetErrorDescription003", 144)
      Utils.registerBaseEvent("testPromiseJavascriptProxyGetErrorDescription003", true, 25112129, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtFourButton', 10, '');
    })
    /**
     * @tc.name   testCallbackJavascriptProxyGetErrorDescription001
     * @tc.number SUB_WEB_JAVASCRIPTPROXY_GETERRORDESCRIPTION_CALLBACK_0100
     * @tc.desc   test Callback javascriptProxy getErrorDescription object length < 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackJavascriptProxyGetErrorDescription001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackJavascriptProxyGetErrorDescription001", 144)
      Utils.registerBaseEvent("testCallbackJavascriptProxyGetErrorDescription001", true, 25112130, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtFourButton', 10, '');
    })
    /**
     * @tc.name   testCallbackJavascriptProxyGetErrorDescription002
     * @tc.number SUB_WEB_JAVASCRIPTPROXY_GETERRORDESCRIPTION_CALLBACK_0200
     * @tc.desc   test Callback javascriptProxy getErrorDescription object length = 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackJavascriptProxyGetErrorDescription002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackJavascriptProxyGetErrorDescription002", 144)
      Utils.registerBaseEvent("testCallbackJavascriptProxyGetErrorDescription002", true, 25112131, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtFourButton', 10, '');
    })
    /**
     * @tc.name   testCallbackJavascriptProxyGetErrorDescription003
     * @tc.number SUB_WEB_JAVASCRIPTPROXY_GETERRORDESCRIPTION_CALLBACK_0300
     * @tc.desc   test Callback javascriptProxy getErrorDescription object length > 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallbackJavascriptProxyGetErrorDescription003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCallbackJavascriptProxyGetErrorDescription003", 144)
      Utils.registerBaseEvent("testCallbackJavascriptProxyGetErrorDescription003", true, 25112132, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('JsMessageExtFourButton', 10, '');
    })

  })
}
