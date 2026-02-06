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

import { beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webControllerBackOrForwardTest() {

  describe('webControllerBackOrForwardTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webControllerBackOrForward',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webControllerBackOrForward state success " + JSON.stringify(pages));
        if (!("webControllerBackOrForward" == pages.name)) {
          console.info("get webControllerBackOrForward state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webControllerBackOrForward page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webControllerBackOrForward page error: " + err);
      }
      await waitForComponent("webControllerBackOrForwardButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webControllerBackOrForward beforeEach start");
      done();
    })


    /**
    * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ACCESSBACKWARD_FALSE_0100
    * @tc.name   testAccessBackwardFalse
    * @tc.desc   test accessBackward false
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  Level 0
    */
    it('testAccessBackwardFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitAccessBackwardFalse", 121)
      Utils.registerBaseEvent("testAccessBackwardFalse", false, 2025102103,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webControllerBackOrForwardButton', 10, '');
    })
    /**
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ACCESSFORWARD_FALSE_0100
     * @tc.name   testAccessForwardFalse
     * @tc.desc   test accessForward false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAccessForwardFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitAccessForwardFalse", 121)
      Utils.registerBaseEvent("testAccessForwardFalse", false, 2025102104,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webControllerBackOrForwardButton', 10, '');
    })
    /**
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_FALSE_0100
     * @tc.name   testAccessStepFalse
     * @tc.desc   test accessStep false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAccessStepFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitAccessStepFalse", 121)
      Utils.registerBaseEvent("testAccessStepFalse", false, 2025102111,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webControllerBackOrForwardButton', 10, '');
    })
    /**
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ACCESSBACKWARD_TRUE_0100
     * @tc.name   testAccessBackwardTrue
     * @tc.desc   test accessBackward true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAccessBackwardTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitAccessBackwardTrue", 121)
      Utils.registerBaseEvent("testAccessBackwardTrue", true, 2025102105,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webControllerBackOrForwardButton', 10, '');
    })
    /**
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ACCESSFORWARD_TRUE_0100
     * @tc.name   testAccessForwardTrue
     * @tc.desc   test accessForward true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAccessForwardTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitAccessForwardTrue", 121)
      Utils.registerBaseEvent("testAccessForwardTrue", true, 2025102106,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webControllerBackOrForwardButton', 10, '');
    })
    /**
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ACCESSSTEP_TRUE_0100
     * @tc.name   testAccessStepTrue
     * @tc.desc   test accessStep true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAccessStepTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitAccessStepTrue", 121)
      Utils.registerBaseEvent("testAccessStepTrue", true, 2025102112,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webControllerBackOrForwardButton', 10, '');
    })

  })
}
