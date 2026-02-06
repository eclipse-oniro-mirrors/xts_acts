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

import { beforeAll, beforeEach, expect, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 200570;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

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

    /*
     * @tc.number      : SUB_WEB_ONTITLERECEIVE_ISREALTITLE_0100
     * @tc.name        : testOnTitleReceiveIsRealTitle001
     * @tc.desc        : test onTitleReceive isRealTitle rawfile title
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testOnTitleReceiveIsRealTitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnTitleReceiveIsRealTitle001', EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerBaseEvent('testOnTitleReceiveIsRealTitle001', 1, 200580, () => { isReturn = true },
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "OnTitleReceiveIsRealTitleButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnTitleReceiveIsRealTitle001' + '_returnCheck', true, 1000)) {
        done();
      }
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
      Utils.emitEvent('emitOnTitleReceiveIsRealTitle002', EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerBaseEvent('testOnTitleReceiveIsRealTitle002', 0, 200590, () => { isReturn = true },
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "OnTitleReceiveIsRealTitleButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnTitleReceiveIsRealTitle002' + '_returnCheck', true, 1000)) {
        done();
      }
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
      Utils.emitEvent('emitOnTitleReceiveIsRealTitle003', EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerBaseEvent('testOnTitleReceiveIsRealTitle003', 1, 200600, () => { isReturn = true },
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "OnTitleReceiveIsRealTitleButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnTitleReceiveIsRealTitle003' + '_returnCheck', true, 1000)) {
        done();
      }
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
      Utils.emitEvent('emitOnTitleReceiveIsRealTitle004', EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerBaseEvent('testOnTitleReceiveIsRealTitle004', 0, 200610, () => { isReturn = true },
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "OnTitleReceiveIsRealTitleButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnTitleReceiveIsRealTitle004' + '_returnCheck', true, 1000)) {
        done();
      }
    })
    /*
     * @tc.number      : SUB_WEB_ONTITLERECEIVE_ISREALTITLE_0500
     * @tc.name        : testOnTitleReceiveIsRealTitle005
     * @tc.desc        : test onTitleReceive empty title tag
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testOnTitleReceiveIsRealTitle005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnTitleReceiveIsRealTitle005', EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerBaseEvent('testOnTitleReceiveIsRealTitle005', 0, 200611, () => { isReturn = true },
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "OnTitleReceiveIsRealTitleButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnTitleReceiveIsRealTitle005' + '_returnCheck', true, 1000)) {
        done();
      }
    })
    /*
     * @tc.number      : SUB_WEB_ONTITLERECEIVE_ISREALTITLE_0600
     * @tc.name        : testOnTitleReceiveIsRealTitle006
     * @tc.desc        : test onTitleReceive title empty string
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 1
     */
    it('testOnTitleReceiveIsRealTitle006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnTitleReceiveIsRealTitle006', EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerBaseEvent('testOnTitleReceiveIsRealTitle006', 1, 200612, () => { isReturn = true },
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "OnTitleReceiveIsRealTitleButton");
     if (await Utils.waitForExist(() => isReturn, 'testOnTitleReceiveIsRealTitle005' + '_returnCheck', true, 1000)) {
       done();
     }
    })
  })
}