/**
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
const  driver = Driver.create();
export default function ActsAceWebViewSdkSchemeHandlerThree() {
  describe('ActsAceWebViewSdkSchemeHandlerThree', () => {
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkSchemeHandlerThree',
        }
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerThree state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandlerThree" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerThree state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewSdkSchemeHandlerThree state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerThree page error:" + err);
        }
      console.log("waitForComponent webViewSdkSchemeHandlerThreeButton==>");
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewSdkSchemeHandlerThree beforeEach start");
      done();
    })

    /**
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_completeIfNoResponse_API_0100
     *@tc.name testSchemeHandlerDidFailCompleteIfNoResponse001
     *@tc.desc test didFail didReceiveResponse completeIfNoResponse true
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testSchemeHandlerDidFailCompleteIfNoResponse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSchemeHandlerDidFailCompleteIfNoResponse001", 142401);
      let isReturn = false;
      Utils.registerBaseEvent("testSchemeHandlerDidFailCompleteIfNoResponse001", -1, 142430, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webViewSdkSchemeHandlerThreeButton",driver)
      await waitForExist(()=>isReturn, "testSchemeHandlerDidFailCompleteIfNoResponse001", true,1000);
      done();
    })
    /**
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_completeIfNoResponse_API_0200
     *@tc.name testSchemeHandlerDidFailCompleteIfNoResponse002
     *@tc.desc test didFail didReceiveResponse completeIfNoResponse false
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testSchemeHandlerDidFailCompleteIfNoResponse002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSchemeHandlerDidFailCompleteIfNoResponse002", 142401);
      let isReturn = false;
      Utils.registerBaseEvent("testSchemeHandlerDidFailCompleteIfNoResponse002", -1, 142440, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webViewSdkSchemeHandlerThreeButton",driver)
      await waitForExist(()=>isReturn, "testSchemeHandlerDidFailCompleteIfNoResponse002", true,1000);
      done();
    })
    /**
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_completeIfNoResponse_API_0300
     *@tc.name testSchemeHandlerDidFailCompleteIfNoResponse003
     *@tc.desc test didFail completeIfNoResponse true
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testSchemeHandlerDidFailCompleteIfNoResponse003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSchemeHandlerDidFailCompleteIfNoResponse003", 142401);
      let isReturn = false;
      Utils.registerBaseEvent("testSchemeHandlerDidFailCompleteIfNoResponse003", 0, 142450, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webViewSdkSchemeHandlerThreeButton",driver)
      await waitForExist(()=>isReturn, "testSchemeHandlerDidFailCompleteIfNoResponse003", true,1000);
      done();
    })
    /**
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_completeIfNoResponse_API_0400
     *@tc.name testSchemeHandlerDidFailCompleteIfNoResponse004
     *@tc.desc test didFail completeIfNoResponse false
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testSchemeHandlerDidFailCompleteIfNoResponse004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSchemeHandlerDidFailCompleteIfNoResponse004", 142401);
      let isReturn = false;
      Utils.registerBaseEvent("testSchemeHandlerDidFailCompleteIfNoResponse004", 0, 142460, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webViewSdkSchemeHandlerThreeButton",driver)
      await waitForExist(()=>isReturn, "testSchemeHandlerDidFailCompleteIfNoResponse003", true,1000);
      done();
    })
    /**
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_completeIfNoResponse_API_0500
     *@tc.name testSchemeHandlerDidFailCompleteIfNoResponse005
     *@tc.desc test didFail completeIfNoResponse true errorCode 17100021
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testSchemeHandlerDidFailCompleteIfNoResponse005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSchemeHandlerDidFailCompleteIfNoResponse005", 142401);
      let isReturn = false;
      Utils.registerBaseEvent("testSchemeHandlerDidFailCompleteIfNoResponse005", "17100021", 142470, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webViewSdkSchemeHandlerThreeButton",driver)
      await waitForExist(()=>isReturn, "testSchemeHandlerDidFailCompleteIfNoResponse003", true,1000);
      done();
    })
    /**
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_completeIfNoResponse_API_0600
     *@tc.name testSchemeHandlerDidFailCompleteIfNoResponse006
     *@tc.desc test didFail completeIfNoResponse false errorCode 17100021
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testSchemeHandlerDidFailCompleteIfNoResponse006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSchemeHandlerDidFailCompleteIfNoResponse006", 142401);
      let isReturn = false;
      Utils.registerBaseEvent("testSchemeHandlerDidFailCompleteIfNoResponse006", "17100021", 142480, ()=>{isReturn = true},
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent("webViewSdkSchemeHandlerThreeButton",driver)
      await waitForExist(()=>isReturn, "testSchemeHandlerDidFailCompleteIfNoResponse003", true,1000);
      done();
    })
    /**
     *@tc.number       SUB_ACE_WEB_SdkSchemeHandler_didFail_completeIfNoResponse_API_0700
     *@tc.name         testSchemeHandlerDidFailCompleteIfNoResponse007
     *@tc.desc         test didFail completeIfNoResponse true errorCode 17100101
     *@tc.size         MediumTest
     *@tc.type         Function
     *@tc.level        Level 2
     */
    it('testSchemeHandlerDidFailCompleteIfNoResponse007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSchemeHandlerDidFailCompleteIfNoResponse007', 142401);
      Utils.registerBaseEvent('testSchemeHandlerDidFailCompleteIfNoResponse007', 17100101, 142490, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewSdkSchemeHandlerThreeButton', 10, '');
    })
    /**
     *@tc.number       SUB_ACE_WEB_SdkSchemeHandler_didFail_completeIfNoResponse_API_0800
     *@tc.name         testSchemeHandlerDidFailCompleteIfNoResponse008
     *@tc.desc         test didFail completeIfNoResponse false errorCode 17100101
     *@tc.size         MediumTest
     *@tc.type         Function
     *@tc.level        Level 2
     */
    it('testSchemeHandlerDidFailCompleteIfNoResponse008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSchemeHandlerDidFailCompleteIfNoResponse008', 142401);
      Utils.registerBaseEvent('testSchemeHandlerDidFailCompleteIfNoResponse008', 17100101, 142500, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewSdkSchemeHandlerThreeButton', 10, '');
    })
  })
}
