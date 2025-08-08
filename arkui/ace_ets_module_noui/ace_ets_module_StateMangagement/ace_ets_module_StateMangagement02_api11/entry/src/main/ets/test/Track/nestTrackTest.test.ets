/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function nestTrackTest() {
  describe('nestTrackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("nestTrackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Track/nestTrack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get nestTrackTest state pages: " + JSON.stringify(pages));
        if (!("nestTrack" == pages.name)) {
          console.info("get nestTrackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push nestTrackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push nestTrackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('nestTrack_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
    });
    /**
     * @tc.number SUB_ACE_nestTrackTest_0100
     * @tc.name nestTrackTest_0100
     * @tc.desc nestTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nestTrackTest_0100', 0, async (done: Function) => {
      console.info('nestTrackTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('nestTrack_reset'));
      await button1.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
      let button = await driver.findComponent(ON.id('nestTrack_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('nestTrack_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nestTrackTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[nestTrackTest_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('a1=30');
      console.info('[nestTrackTest_0100] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_nestTrackTest_0200
     * @tc.name nestTrackTest_0200
     * @tc.desc nestTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nestTrackTest_0200', 0, async (done: Function) => {
      console.info('nestTrackTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('nestTrack_reset'));
      await button1.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
      let button = await driver.findComponent(ON.id('nestTrack_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('nestTrack_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nestTrackTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[nestTrackTest_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('a1=50');
      console.info('[nestTrackTest_0200] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_nestTrackTest_0300
     * @tc.name nestTrackTest_0300
     * @tc.desc nestTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nestTrackTest_0300', 0, async (done: Function) => {

      console.info('nestTrackTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('nestTrack_reset'));
      await button1.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
      let button = await driver.findComponent(ON.id('nestTrack_3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('nestTrack_3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nestTrackTest_0300] component obj is: " + JSON.stringify(obj));
      console.info("[nestTrackTest_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('b1=30');
      console.info('[nestTrackTest_0300] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_nestTrackTest_0400
     * @tc.name nestTrackTest_0400
     * @tc.desc nestTrack
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nestTrackTest_0400', 0, async (done: Function) => {
      console.info('nestTrackTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('nestTrack_reset'));
      await button1.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
      let button = await driver.findComponent(ON.id('nestTrack_4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('nestTrack_4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nestTrackTest_0400] component obj is: " + JSON.stringify(obj));
      console.info("[nestTrackTest_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('b1=50');
      console.info('[nestTrackTest_0400] END');
      done();
    });
  })
}

