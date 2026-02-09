/**
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import CommonFunc from '../../MainAbility/common/Common';
import router from '@ohos.router';

export default function openDialogTransitionTest() {
  describe('openDialogTransitionTest', () => {
    beforeAll(async (done: Function) => {
      console.info("OpenDialogTransition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/openDialogTransition',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'openDialogTransition') {
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error('OpenDialogTransitionTest :push OpenDialogTransition page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    beforeEach(async () => {
      console.info('OpenDialogTransitionTest beforeEach called');
      try {
        await router.replace({ url: 'MainAbility/pages/promptAction/openDialogTransition' });
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error('beforeEach: router.replace error', err);
      }
    });

    afterEach(async () => {
      console.info('OpenDialogTransitionTest afterEach called');
      let driver: Driver = Driver.create();

      try {
        let resetButtons = ['EnableTransition', 'EnableDialogTransition', 'EnableMaskTransition'];
        for (let btnId of resetButtons) {
          let btn = await driver.findComponent(ON.id(btnId));
          if (btn) {
            await btn.click();
            await CommonFunc.sleep(200);
          }
        }
      } catch (err) {
        console.warn('afterEach: failed to reset state', err);
      }

      try {
        let confirmBtn = await driver.findComponent(ON.id('Confirm'));
        if (confirmBtn) {
          await confirmBtn.click();
          await CommonFunc.sleep(200);
        }
      } catch (e) {
        console.warn('afterEach: no confirm button to click or already closed.');
      }
    });
   /**
     * @tc.number    OpenDialogTransitionTest_100
     * @tc.name      OpenDialogTransitionTest_100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('OpenDialogTransitionTest_100', Level.LEVEL2, async (done: Function) => {
      console.info('OpenDialogTransitionTest_100 start');
      let driver: Driver = Driver.create();
      let maskTransitionButton = await driver.findComponent(ON.id('EnableMaskTransition'));
      await maskTransitionButton.click();
      await CommonFunc.sleep(3000);
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await openDialogButton.click();
      await CommonFunc.sleep(3000);
      let textContent = getInspectorByKey('TextContent');
      expect(JSON.parse(textContent).$attrs.content).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await confirmButton.click();
      await CommonFunc.sleep(3000);
      await maskTransitionButton.click();
      console.info('OpenDialogTransitionTest_100 end');
      done();
    });
   /**
     * @tc.number    OpenDialogTransitionTest_200
     * @tc.name      OpenDialogTransitionTest_200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('OpenDialogTransitionTest_200', Level.LEVEL2, async (done: Function) => {
      console.info('OpenDialogTransitionTest_200 start');
      let driver: Driver = Driver.create();
      let dialogTransitionButton = await driver.findComponent(ON.id('EnableDialogTransition'));
      await dialogTransitionButton.click();
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await openDialogButton.click();
      await CommonFunc.sleep(3000);
      let textContent = getInspectorByKey('TextContent');
      expect(JSON.parse(textContent).$attrs.content).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await confirmButton.click();
      await CommonFunc.sleep(3000);
      await dialogTransitionButton.click();
      console.info('OpenDialogTransitionTest_200 end');
      done();
    });
   /**
     * @tc.number    OpenDialogTransitionTest_300
     * @tc.name      OpenDialogTransitionTest_300
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('OpenDialogTransitionTest_300', Level.LEVEL2, async (done: Function) => {
      console.info('OpenDialogTransitionTest_300 start');
      let driver: Driver = Driver.create();
      let dialogTransitionButton = await driver.findComponent(ON.id('EnableDialogTransition'));
      await dialogTransitionButton.click();
      await CommonFunc.sleep(500);
      let defaultTransitionButton = await driver.findComponent(ON.id('EnableTransition'));
      await defaultTransitionButton.click();
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await openDialogButton.click();
      await CommonFunc.sleep(3000);
      let textContent = getInspectorByKey('TextContent');
      expect(JSON.parse(textContent).$attrs.content).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await confirmButton.click();
      await CommonFunc.sleep(3000);
      await dialogTransitionButton.click();
      await CommonFunc.sleep(500);
      await defaultTransitionButton.click();
      console.info('OpenDialogTransitionTest_300 end');
      done();
    });
   /**
     * @tc.number    OpenDialogTransitionTest_400
     * @tc.name      OpenDialogTransitionTest_400
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('OpenDialogTransitionTest_400', Level.LEVEL2, async (done: Function) => {
      console.info('OpenDialogTransitionTest_400 start');
      let driver: Driver = Driver.create();
      let maskTransitionButton = await driver.findComponent(ON.id('EnableMaskTransition'));
      await maskTransitionButton.click();
      await CommonFunc.sleep(500);
      let defaultTransitionButton = await driver.findComponent(ON.id('EnableTransition'));
      await defaultTransitionButton.click();
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await openDialogButton.click();
      await CommonFunc.sleep(3000);
      let textContent = getInspectorByKey('TextContent');
      expect(JSON.parse(textContent).$attrs.content).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await confirmButton.click();
      await CommonFunc.sleep(3000);
      await maskTransitionButton.click();
      await CommonFunc.sleep(500);
      await defaultTransitionButton.click();
      console.info('OpenDialogTransitionTest_400 end');
      done();
    });
   /**
     * @tc.number    OpenDialogTransitionTest_500
     * @tc.name      OpenDialogTransitionTest_500
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('OpenDialogTransitionTest_500', Level.LEVEL2, async (done: Function) => {
      console.info('OpenDialogTransitionTest_500 start');
      let driver: Driver = Driver.create();
      let maskTransitionButton = await driver.findComponent(ON.id('EnableMaskTransition'));
      await maskTransitionButton.click();
      await CommonFunc.sleep(500);
      let dialogTransitionButton = await driver.findComponent(ON.id('EnableDialogTransition'));
      await dialogTransitionButton.click();
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await openDialogButton.click();
      await CommonFunc.sleep(3000);
      let textContent = getInspectorByKey('TextContent');
      expect(JSON.parse(textContent).$attrs.content).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await confirmButton.click();
      await CommonFunc.sleep(3000);
      await maskTransitionButton.click();
      await CommonFunc.sleep(500);
      await dialogTransitionButton.click();
      console.info('OpenDialogTransitionTest_500 end');
      done();
    });
   /**
     * @tc.number    OpenDialogTransitionTest_600
     * @tc.name      OpenDialogTransitionTest_600
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('OpenDialogTransitionTest_600', Level.LEVEL2, async (done: Function) => {
      console.info('OpenDialogTransitionTest_600 start');
      let driver: Driver = Driver.create();
      let maskTransitionButton = await driver.findComponent(ON.id('EnableMaskTransition'));
      await maskTransitionButton.click();
      await CommonFunc.sleep(500);
      let dialogTransitionButton = await driver.findComponent(ON.id('EnableDialogTransition'));
      await dialogTransitionButton.click();
      await CommonFunc.sleep(500);
      let defaultTransitionButton = await driver.findComponent(ON.id('EnableTransition'));
      await defaultTransitionButton.click();
      await CommonFunc.sleep(500);
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await openDialogButton.click();
      await CommonFunc.sleep(3000);
      let textContent = getInspectorByKey('TextContent');
      expect(JSON.parse(textContent).$attrs.content).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await confirmButton.click();
      await CommonFunc.sleep(3000);
      await maskTransitionButton.click();
      await CommonFunc.sleep(500);
      await dialogTransitionButton.click();
      await CommonFunc.sleep(500);
      await defaultTransitionButton.click();
      console.info('OpenDialogTransitionTest_600 end');
      done();
    });

  })
}