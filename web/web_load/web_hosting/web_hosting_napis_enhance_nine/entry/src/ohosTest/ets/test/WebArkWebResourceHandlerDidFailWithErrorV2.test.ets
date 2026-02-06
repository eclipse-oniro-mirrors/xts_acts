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

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function WebArkWebResourceHandlerDidFailWithErrorV2() {

  describe('ActsWebArkWebResourceHandlerDidFailWithErrorV2Test', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebArkWebResourceHandlerDidFailWithErrorV2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebArkWebResourceHandlerDidFailWithErrorV2 state success " + JSON.stringify(pages));
        if (!("WebConfigCookieSync" == pages.name)) {
          console.info("get WebArkWebResourceHandlerDidFailWithErrorV2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebArkWebResourceHandlerDidFailWithErrorV2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebArkWebResourceHandlerDidFailWithErrorV2 page error: " + err);
      }
      await driver.waitForComponent(ON.id("ArkWebResourceHandlerDidFailWithErrorV2Test"),10000);
      console.log("waitForComponent ArkWebResourceHandlerDidFailWithErrorV2Test==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("WebArkWebResourceHandlerDidFailWithErrorV2 beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebArkWebResourceHandlerDidFailWithErrorV2 afterEach");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0001
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_001
    * @tc.desc       : test 有response,先调用didReceiveResponse,再调用DidFailWithErrorV2(-1,true)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_001", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_001", 0, 2025082101, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0002
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_002
    * @tc.desc       : test 有response,先调用didReceiveResponse,再调用DidFailWithErrorV2(-1,false)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_002", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_002", 0, 2025082102, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0003
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_003
    * @tc.desc       : test 有response,先调用didReceiveResponse,再调用DidFailWithErrorV2(-1,5)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_003", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_003", 0, 2025082103, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0004
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_004
    * @tc.desc       : test 有response,直接调用DidFailWithErrorV2(-1,true)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_004", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_004", 0, 2025082104, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0005
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_005
    * @tc.desc       : test 有response,直接调用DidFailWithErrorV2(-1,false)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_005", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_005", 0, 2025082105, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0006
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_006
    * @tc.desc       : test 有response,直接调用DidFailWithErrorV2(-1,5)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_006", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_006", 0, 2025082106, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0007
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_007
    * @tc.desc       : test 无response,先调用didReceiveResponse,再调用DidFailWithErrorV2(-1,true)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_007", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_007", 0, 2025082107, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0008
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_008
    * @tc.desc       : test 无response,先调用didReceiveResponse,再调用DidFailWithErrorV2(-1,false)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_008", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_008", 0, 2025082108, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0009
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_009
    * @tc.desc       : test 无response,先调用didReceiveResponse,再调用DidFailWithErrorV2(-1,5)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_009", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_009", 0, 2025082109, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })


    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0010
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_010
    * @tc.desc       : test 无response,直接调用DidFailWithErrorV2(-1,true)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_010", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_010", 0, 2025082110, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0011
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_011
    * @tc.desc       : test 无response,直接调用DidFailWithErrorV2(-1,false)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_011", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_011", 0, 2025082111, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0012
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_012
    * @tc.desc       : test 无response,直接调用DidFailWithErrorV2(-1,5)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_012", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_012", 0, 2025082112, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0013
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_013
    * @tc.desc       : test 无response的错误请求,resourceHandler=nullptr
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_013", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_013", 17100101, 2025082113, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0014
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_014
    * @tc.desc       : test 无response的错误请求,errorCode=ARKWEB_NET_OK true
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_014", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_014", 0, 2025082114, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ArkWebResourceHandler_DidFailWithErrorV2_0015
    * @tc.name       : testOH_ArkWebResourceHandler_DidFailWithErrorV2_015
    * @tc.desc       : test 无response的错误请求,errorCode=ARKWEB_NET_OK false
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebResourceHandler_DidFailWithErrorV2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebResourceHandler_DidFailWithErrorV2_015", 821)
      Utils.registerBaseEvent("testOH_ArkWebResourceHandler_DidFailWithErrorV2_015", 0, 2025082115, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebResourceHandlerDidFailWithErrorV2Test', 10, '');
    })

  })
}
