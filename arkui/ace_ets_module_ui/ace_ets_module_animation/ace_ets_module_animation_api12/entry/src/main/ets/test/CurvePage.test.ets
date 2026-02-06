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

export default function CurvePage() {
  describe('CurvePage', () => {
    beforeEach(async (done: Function) => {
      console.info("CurvePage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CurvePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CurvePage state pages:" + JSON.stringify(pages));
        if (!("CurvePage" == pages.name)) {
          console.info("get CurvePage pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CurvePage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CurvePage page error:" + err);
      }
      console.info("CurvePage beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CurvePage after each called");
    });


    /**
     * @tc.number    CurvePage_0100
     * @tc.name      CurvePage_0100
     * @tc.desc      Test Curve easeInOut
     * @tc.level     Level 0
     */
    it('CurvePage_0100', Level.LEVEL0, async (done: Function) => {
      console.info('CurvePage_0100 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1: Component = await driver.findComponent(ON.id('easeInOutId'));
      await btn1.click();
      console.info('[CurvePage_0100] btn1 click');
      await driver.delayMs(3000);

      let cubeSize: number = AppStorage.get('cube_size') as number
      console.log('CurvePage_0100 on cubeSize value : ' + cubeSize)
      expect(cubeSize).assertEqual(30);
      AppStorage.delete('cube_size');

      console.log('[CurvePage_0100] END');
      done();
    });

    /**
     * @tc.number    CurvePage_0200
     * @tc.name      CurvePage_0200
     * @tc.desc      Test Curve FastOutSlowIn
     * @tc.level     Level 0
     */
    it('CurvePage_0200', Level.LEVEL0, async (done: Function) => {
      console.info('CurvePage_0200 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn2: Component = await driver.findComponent(ON.id('fastOutSlowIn'));
      await btn2.click();
      console.info('[CurvePage_0200] btn2 click');
      await driver.delayMs(3000);

      let cubeSize1: number = AppStorage.get('cube_size') as number
      console.log('CurvePage_0200 on cubeSize1 value : ' + cubeSize1)
      expect(cubeSize1).assertEqual(50);
      AppStorage.delete('cube_size');

      console.log('[CurvePage_0200] END');
      done();
    });

    /**
     * @tc.number    CurvePage_0300
     * @tc.name      CurvePage_0100
     * @tc.desc      Test Curve springMotion
     * @tc.level     Level 0
     */
    it('CurvePage_0300', Level.LEVEL0, async (done: Function) => {
      console.info('CurvePage_0300 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn3: Component = await driver.findComponent(ON.id('springMotionId'));
      await btn3.click();
      console.info('[CurvePage_0300] btn3 click');
      await driver.delayMs(3000);

      let cubeSize2: number = AppStorage.get('cube_size') as number
      console.log('CurvePage_0300 on cubeSize2 value : ' + cubeSize2)
      expect(cubeSize2).assertEqual(20);
      AppStorage.delete('cube_size');

      console.log('[CurvePage_0300] END');
      done();
    });

    /**
     * @tc.number    CurvePage_0400
     * @tc.name      CurvePage_0400
     * @tc.desc      Test Curve responsiveSpringMotion
     * @tc.level     Level 0
     */
    it('CurvePage_0400', Level.LEVEL0, async (done: Function) => {
      console.info('CurvePage_0400 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn4: Component = await driver.findComponent(ON.id('responsiveSpringId'));
      await btn4.click();
      console.info('[CurvePage_0400] btn4 click');
      await driver.delayMs(3000);

      let cubeSize3: number = AppStorage.get('cube_size') as number
      console.log('CurvePage_0400 on cubeSize3 value : ' + cubeSize3)
      expect(cubeSize3).assertEqual(60);
      AppStorage.delete('cube_size');

      console.log('[CurvePage_0400] END');
      done();
    });

  })
}