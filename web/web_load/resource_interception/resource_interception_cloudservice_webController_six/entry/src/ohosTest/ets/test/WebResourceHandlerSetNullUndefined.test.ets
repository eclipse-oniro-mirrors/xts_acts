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
import { beforeAll, beforeEach, expect, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 26031310;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebResourceHandlerSetNullUndefined() {
  describe('WebResourceHandlerSetNullUndefined', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/WebResourceHandlerSetNullUndefined',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get WebResourceHandlerSetNullUndefined state success " + JSON.stringify(pages));
            if (!("WebResourceHandlerSetNullUndefined" == pages.name)) {
                console.info("get WebResourceHandlerSetNullUndefined state success " + JSON.stringify(pages.name));
                await router.pushUrl(options);
                console.info("push WebResourceHandlerSetNullUndefined state success");
            }
        } catch (err) {
            console.error("push WebResourceHandlerSetNullUndefined page error:" + err);
        }
        await driver.waitForComponent(ON.id("WebResourceHandlerButton"), 10000);
        console.log("waitForComponent WebResourceHandlerSetNullUndefined");
        done()
    });
    
    beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
          console.info(`enable success`);
          }).catch((err: object) => {
          console.error(`failed to enable, ${err}`);
        })
        done();
    })

    /**
     * @tc.name   testDidReceiveResponseNull
     * @tc.number SUB_ACE_WEB_WEBRESOURCEHANDLER_DIDRECEIVERESPONSE_0100
     * @tc.desc   test WebResourceHandler didReceiveResponse set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDidReceiveResponseNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testDidReceiveResponseNull", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testDidReceiveResponseNull", "success", 26031311,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebResourceHandlerButton', 10, '');
    })

    /**
     * @tc.name   testDidReceiveResponseUndefined
     * @tc.number SUB_ACE_WEB_WEBRESOURCEHANDLER_DIDRECEIVERESPONSE_0200
     * @tc.desc   test WebResourceHandler didReceiveResponse set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDidReceiveResponseUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testDidReceiveResponseUndefined", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testDidReceiveResponseUndefined", "success", 26031312,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebResourceHandlerButton', 10, '');
    })

    /**
     * @tc.name   testDidFailNull
     * @tc.number SUB_ACE_WEB_WEBRESOURCEHANDLER_DIDFAIL_0300
     * @tc.desc   test WebResourceHandler didFail set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDidFailNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testDidFailNull", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testDidFailNull", "401", 26031313,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebResourceHandlerButton', 10, '');
    })

    /**
     * @tc.name   testDidFailUndefined
     * @tc.number SUB_ACE_WEB_WEBRESOURCEHANDLER_DIDFAIL_0400
     * @tc.desc   test WebResourceHandler didFail set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDidFailUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testDidFailUndefined", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testDidFailUndefined", "401", 26031314,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebResourceHandlerButton', 10, '');
    })

    /**
     * @tc.name   testDidFailWithCompleteIfNoResponseNull
     * @tc.number SUB_ACE_WEB_WEBRESOURCEHANDLER_DIDFAIL_0500
     * @tc.desc   test WebResourceHandler didFail(x1,x2) set x1 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDidFailWithCompleteIfNoResponseNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testDidFailWithCompleteIfNoResponseNull", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testDidFailWithCompleteIfNoResponseNull", "17100101", 26031315,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebResourceHandlerButton', 10, '');
    })

    /**
     * @tc.name   testDidFailWithCompleteIfNoResponseUndefined
     * @tc.number SUB_ACE_WEB_WEBRESOURCEHANDLER_DIDFAIL_0600
     * @tc.desc   test WebResourceHandler didFail(x1,x2) set x1 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDidFailWithCompleteIfNoResponseUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testDidFailWithCompleteIfNoResponseUndefined", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testDidFailWithCompleteIfNoResponseUndefined", "17100101", 26031316,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebResourceHandlerButton', 10, '');
    })

  })
}