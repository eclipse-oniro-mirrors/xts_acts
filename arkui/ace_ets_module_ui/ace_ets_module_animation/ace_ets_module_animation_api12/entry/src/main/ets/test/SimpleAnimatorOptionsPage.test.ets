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

import CommonFunc from '../MainAbility/utils/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter'

export default function SimpleAnimatorOptionsPage() {
  describe('SimpleAnimatorOptionsPage', () => {
    beforeEach(async (done: Function) => {
      console.info("SimpleAnimatorOptionsPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SimpleAnimatorOptionsPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SimpleAnimatorOptionsPage state pages:" + JSON.stringify(pages));
        if (!("SimpleAnimatorOptionsPage" == pages.name)) {
          console.info("get SimpleAnimatorOptionsPage pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SimpleAnimatorOptionsPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SimpleAnimatorOptionsPage page error:" + err);
      }
      console.info("SimpleAnimatorOptionsPage beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SimpleAnimatorOptionsPage after each called");
    });


    /**
     * @tc.number    SimpleAnimatorOptionsPage_0100
     * @tc.name      SimpleAnimatorOptionsPage_0100
     * @tc.desc      Test SimpleAnimatorOptions FillMode
     * @tc.level     Level 0
     */
    it('SimpleAnimatorOptionsPage_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SimpleAnimatorOptionsPage_0100 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1: Component = await driver.findComponent(ON.id('playId'));
      await btn1.click();
      console.info('[SimpleAnimatorOptionsPage_0100] btn1 click');
      await driver.delayMs(5000);

      let cubeSize: number = AppStorage.get('cube_size') as number
      console.log('SimpleAnimatorOptionsPage_0100 on cubeSize value : ' + cubeSize)
      expect(cubeSize).assertEqual(50);
      AppStorage.delete('cube_size');

      let changeFillModeBtn: Component = await driver.findComponent(ON.id('changeFillMode'));
      await changeFillModeBtn.click();
      console.info('[SimpleAnimatorOptionsPage_0100] changeFillModeBtn click');
      await driver.delayMs(1000);


      let btn2: Component = await driver.findComponent(ON.id('playId'));
      await btn2.click();
      console.info('[SimpleAnimatorOptionsPage_0100] btn2 click');
      await driver.delayMs(5000);

      let cubeSize2: number = AppStorage.get('cube_size') as number
      console.log('SimpleAnimatorOptionsPage_0100 on cubeSize2 value : ' + cubeSize2)
      expect(cubeSize2).assertEqual(100);
      AppStorage.delete('cube_size');

      let recoverBtn: Component = await driver.findComponent(ON.id('recoverId'));
      await recoverBtn.click();
      console.info('[SimpleAnimatorOptionsPage_0100] recoverBtn click');
      await driver.delayMs(1000);

      console.log('[SimpleAnimatorOptionsPage_0100] END');
      done();
    });

    /**
     * @tc.number    SimpleAnimatorOptionsPage_0200
     * @tc.name      SimpleAnimatorOptionsPage_0200
     * @tc.desc      Test SimpleAnimatorOptions delay
     * @tc.level     Level 0
     */
    it('SimpleAnimatorOptionsPage_0200', Level.LEVEL0, async (done: Function) => {
      console.info('SimpleAnimatorOptionsPage_0200 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let delayBtn: Component = await driver.findComponent(ON.id('changeDelayId'));
      await delayBtn.click();
      console.info('[SimpleAnimatorOptionsPage_0200] delayBtn click');
      await driver.delayMs(1000);

      let playBtn: Component = await driver.findComponent(ON.id('playId'));
      await playBtn.click();
      console.info('[SimpleAnimatorOptionsPage_0200] playBtn click');
      await driver.delayMs(5000);

      let testTime: number = AppStorage.get('testTime') as number
      console.log('SimpleAnimatorOptionsPage_0200 on testTime value : ' + testTime)
      expect(testTime > 2000 && testTime < 2500).assertTrue();
      AppStorage.delete('testTime');

      let recoverBtn: Component = await driver.findComponent(ON.id('recoverId'));
      await recoverBtn.click();
      console.info('[SimpleAnimatorOptionsPage_0200] recoverBtn click');
      await driver.delayMs(1000);

      console.log('[SimpleAnimatorOptionsPage_0200] END');
      done();
    });

    /**
     * @tc.number    SimpleAnimatorOptionsPage_0300
     * @tc.name      SimpleAnimatorOptionsPage_0100
     * @tc.desc      Test SimpleAnimatorOptions iterations
     * @tc.level     Level 0
     */
    it('SimpleAnimatorOptionsPage_0300', Level.LEVEL0, async (done: Function) => {
      console.info('SimpleAnimatorOptionsPage_0300 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let iterationsBtn: Component = await driver.findComponent(ON.id('changeIterationsId'));
      await iterationsBtn.click();
      console.info('[SimpleAnimatorOptionsPage_0300] iterationsBtn click');
      await driver.delayMs(1000);

      let playBtn: Component = await driver.findComponent(ON.id('playId'));
      await playBtn.click();
      console.info('[SimpleAnimatorOptionsPage_0300] playBtn click');
      await driver.delayMs(6000);

      let testTime: number = AppStorage.get('testTime') as number
      console.log('SimpleAnimatorOptionsPage_0300 on testTime value : ' + testTime)
      expect(testTime > 5000 && testTime < 5500).assertTrue();
      AppStorage.delete('testTime');

      let recoverBtn: Component = await driver.findComponent(ON.id('recoverId'));
      await recoverBtn.click();
      console.info('[SimpleAnimatorOptionsPage_0300] recoverBtn click');
      await driver.delayMs(1000);

      console.log('[SimpleAnimatorOptionsPage_0300] END');
      done();
    });

    /**
     * @tc.number    SimpleAnimatorOptionsPage_0400
     * @tc.name      SimpleAnimatorOptionsPage_0400
     * @tc.desc      Test SimpleAnimatorOptions direction
     * @tc.level     Level 0
     */
    it('SimpleAnimatorOptionsPage_0400', Level.LEVEL0, async (done: Function) => {
      console.info('SimpleAnimatorOptionsPage_0400 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let iterationsBtn: Component = await driver.findComponent(ON.id('changeIterationsId'));
      await iterationsBtn.click();
      console.info('[SimpleAnimatorOptionsPage_0400] iterationsBtn click');
      await driver.delayMs(1000);

      let directionBtn: Component = await driver.findComponent(ON.id('changeDirectionId'));
      await directionBtn.click();
      console.info('[SimpleAnimatorOptionsPage_0400] directionBtn click');
      await driver.delayMs(1000);

      let playBtn: Component = await driver.findComponent(ON.id('playId'));
      await playBtn.click();
      console.info('[SimpleAnimatorOptionsPage_0300] playBtn click');
      await driver.delayMs(6000);

      let cubeSize: number = AppStorage.get('cube_size') as number
      console.log('SimpleAnimatorOptionsPage_0400 on cubeSize value : ' + cubeSize)
      expect(cubeSize).assertEqual(100);
      AppStorage.delete('cube_size');

      console.log('[SimpleAnimatorOptionsPage_0400] END');
      done();
    });

  })
}