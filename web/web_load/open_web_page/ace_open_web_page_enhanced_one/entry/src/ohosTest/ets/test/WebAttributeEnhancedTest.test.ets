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

import { afterEach, beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function webAttributeEnhancedTest() {

  describe('WebAttributeEnhancedTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebAttributeEnhancedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeEnhancedTest state success " + JSON.stringify(pages));
        if (!("WebAttributeEnhancedTest" == pages.name)) {
          console.info("get WebAttributeEnhancedTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebAttributeEnhancedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeEnhancedTest page error: " + err);
      }
      await driver.waitForComponent(ON.id('OnTitleReceiveIsRealTitleButton'),10000);
      console.log('waitForComponent OnTitleReceiveIsRealTitleButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebAttributeEnhancedTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebAttributeEnhancedTest afterEach start");
      done();
    })

    /*
     * @tc.number      : SUB_WEB_ONTITLERECEIVE_ISREALTITLE_0100
     * @tc.name        : testOnTitleReceiveIsRealTitle001
     * @tc.desc        : test onTitleReceive isRealTitle rawfile title
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testOnTitleReceiveIsRealTitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnTitleReceiveIsRealTitle001', 127);
      Utils.registerBaseEvent('testOnTitleReceiveIsRealTitle001', 1, 2025071603, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('OnTitleReceiveIsRealTitleButton', 10, '');
    })

    /*
     * @tc.number      : SUB_WEB_ONTITLERECEIVE_ISREALTITLE_0200
     * @tc.name        : testOnTitleReceiveIsRealTitle002
     * @tc.desc        : test onTitleReceive isRealTitle rawfile no title
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testOnTitleReceiveIsRealTitle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnTitleReceiveIsRealTitle002', 127);
      Utils.registerBaseEvent('testOnTitleReceiveIsRealTitle002', 0, 2025071604, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('OnTitleReceiveIsRealTitleButton', 10, '');
    })
    /*
     * @tc.number      : SUB_WEB_ONTITLERECEIVE_ISREALTITLE_0300
     * @tc.name        : testOnTitleReceiveIsRealTitle003
     * @tc.desc        : test onTitleReceive isRealTitle https url title
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testOnTitleReceiveIsRealTitle003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnTitleReceiveIsRealTitle003', 127);
      Utils.registerBaseEvent('testOnTitleReceiveIsRealTitle003', 1, 2025071605, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('OnTitleReceiveIsRealTitleButton', 10, '');
    })
    /*
     * @tc.number      : SUB_WEB_ONTITLERECEIVE_ISREALTITLE_0400
     * @tc.name        : testOnTitleReceiveIsRealTitle004
     * @tc.desc        : test onTitleReceive isRealTitle invalid url title
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testOnTitleReceiveIsRealTitle004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnTitleReceiveIsRealTitle004', 127);
      Utils.registerBaseEvent('testOnTitleReceiveIsRealTitle004', 0, 2025071606, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('OnTitleReceiveIsRealTitleButton', 10, '');
    })

  })
}
