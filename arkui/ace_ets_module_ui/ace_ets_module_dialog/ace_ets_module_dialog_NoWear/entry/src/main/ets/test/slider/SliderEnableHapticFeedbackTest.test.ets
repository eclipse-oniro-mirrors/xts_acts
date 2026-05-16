/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON, Component } from '@kit.TestKit';

export default function SliderEnableHapticFeedbackTest() {
  describe('SliderEnableHapticFeedbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SliderAddEnableHapticFeedbackApi beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider/SliderEnableHapticFeedbackTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SliderAddEnableHapticFeedbackApi state pages:' + JSON.stringify(pages));
        if (!('SliderEnableHapticFeedbackTest' == pages.name)) {
          console.info('get SliderAddEnableHapticFeedbackApi pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push SliderAddEnableHapticFeedbackApi page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SliderAddEnableHapticFeedbackApi page error:' + err);
      }
      console.info('SliderAddEnableHapticFeedbackApi beforeEach end');
      done();
    });

    /*
    * @tc.number: SliderAddEnableHapticFeedbackApi_001
    * @tc.name: SliderAddEnableHapticFeedbackApi_001
    * @tc.desc: testing EnableHpaticFeedback for slider with true value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('SliderAddEnableHapticFeedbackApi_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAddEnableHapticFeedbackApi_001] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let trueBtn: Component = await driver.findComponent(ON.id('enableHapticFeedback_true'));
      await trueBtn.click();
      await Utils.sleep(1000);
      let slider = getInspectorByKey('slider');
      console.info("[SliderAddEnableHapticFeedbackApi_001] attrs is: " +
      JSON.parse(slider).$attrs.enableHapticFeedback);
      await Utils.sleep(1000);
      expect(JSON.parse(slider).$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[SliderAddEnableHapticFeedbackApi_001] END');
      done();
    });

    /*
    * @tc.number: SliderAddEnableHapticFeedbackApi_002
    * @tc.name: SliderAddEnableHapticFeedbackApi_002
    * @tc.desc: testing EnableHpaticFeedback for slider with false value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('SliderAddEnableHapticFeedbackApi_002', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAddEnableHapticFeedbackApi_002] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let trueBtn: Component = await driver.findComponent(ON.id('enableHapticFeedback_false'));
      await trueBtn.click();
      await Utils.sleep(1000);
      let slider = getInspectorByKey('slider');
      console.info("[SliderAddEnableHapticFeedbackApi_002] attrs is: " +
      JSON.parse(slider).$attrs.enableHapticFeedback);
      await Utils.sleep(1000);
      expect(JSON.parse(slider).$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[SliderAddEnableHapticFeedbackApi_002] END');
      done();
    });

    /*
    * @tc.number: SliderAddEnableHapticFeedbackApi_003
    * @tc.name: SliderAddEnableHapticFeedbackApi_003
    * @tc.desc: testing EnableHpaticFeedback for slider with undefied value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('SliderAddEnableHapticFeedbackApi_003', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAddEnableHapticFeedbackApi_003] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let trueBtn: Component = await driver.findComponent(ON.id('enableHapticFeedback_undefied'));
      await trueBtn.click();
      await Utils.sleep(1000);
      let slider = getInspectorByKey('slider');
      console.info("[SliderAddEnableHapticFeedbackApi_003] attrs is: " +
      JSON.parse(slider).$attrs.enableHapticFeedback);
      await Utils.sleep(1000);
      expect(JSON.parse(slider).$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[SliderAddEnableHapticFeedbackApi_003] END');
      done();
    });

    /*
    * @tc.number: SliderAddEnableHapticFeedbackApi_004
    * @tc.name: SliderAddEnableHapticFeedbackApi_004
    * @tc.desc: testing EnableHpaticFeedback for slider with null value
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('SliderAddEnableHapticFeedbackApi_004', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAddEnableHapticFeedbackApi_004] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let trueBtn: Component = await driver.findComponent(ON.id('enableHapticFeedback_null'));
      await trueBtn.click();
      await Utils.sleep(1000);
      let slider = getInspectorByKey('slider');
      console.info("[SliderAddEnableHapticFeedbackApi_004] attrs is: " +
      JSON.parse(slider).$attrs.enableHapticFeedback);
      await Utils.sleep(1000);
      expect(JSON.parse(slider).$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[SliderAddEnableHapticFeedbackApi_004] END');
      done();
    });
  })
}