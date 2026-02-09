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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

const SLEEP_TIME = 1000;

export default function scrollSnapAnimationSpeedModifier() {
  describe('scrollSnapAnimationSpeedModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollSnapAnimationSpeedModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/scrollSnapAnimationSpeedModifier",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollSnapAnimationSpeedModifier state pages:" + JSON.stringify(pages));
        if (!("scrollSnapAnimationSpeedModifier" == pages.name)) {
          console.info("get scrollSnapAnimationSpeedModifier pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
          console.info("push scrollSnapAnimationSpeedModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollSnapAnimationSpeedModifier page error:" + err);
      }
      console.info("scrollSnapAnimationSpeedModifier beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("scrollSnapAnimationSpeedModifier after each called");
    });

    /**
     * @tc.name   testListSpeed001
     * @tc.number testListSpeed001
     * @tc.desc   input ScrollSnapAnimationSpeed.SLOW ,return ScrollSnapAnimationSpeed.SLOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListSpeed001', Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpeed001] START');
      let driver = Driver.create();
      let getKeyBtn = await driver.findComponent(ON.id('getKeyBtn'));
      await getKeyBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('speedValue');
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('ScrollSnapAnimationSpeed.SLOW');
      console.info('[testListSpeed001] END');
      done();
    });

    /**
     * @tc.name   testListSpeed002
     * @tc.number testListSpeed002
     * @tc.desc   input ScrollSnapAnimationSpeed.NORMAL ,return ScrollSnapAnimationSpeed.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListSpeed002', Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpeed002] START');
      let driver = Driver.create();
      let speedBtn = await driver.findComponent(ON.id('speedBtn'));
      await speedBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let getKeyBtn = await driver.findComponent(ON.id('getKeyBtn'));
      await getKeyBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('speedValue');
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('ScrollSnapAnimationSpeed.NORMAL');
      console.info('[testListSpeed002] END');
      done();
    });

    /**
     * @tc.name   testListSpeed003
     * @tc.number testListSpeed003
     * @tc.desc   input 1 ,return ScrollSnapAnimationSpeed.SLOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListSpeed003', Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpeed003] START');
      let driver = Driver.create();
      let speedBtn = await driver.findComponent(ON.id('speedBtn'));
      await speedBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let getKeyBtn = await driver.findComponent(ON.id('getKeyBtn'));
      await getKeyBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('speedValue');
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('ScrollSnapAnimationSpeed.SLOW');
      console.info('[testListSpeed003] END');
      done();
    });

    /**
     * @tc.name   testListSpeed004
     * @tc.number testListSpeed004
     * @tc.desc   input undefined ,return ScrollSnapAnimationSpeed.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListSpeed004', Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpeed004] START');
      let driver = Driver.create();
      let speedBtn = await driver.findComponent(ON.id('speedBtn'));
      await speedBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let getKeyBtn = await driver.findComponent(ON.id('getKeyBtn'));
      await getKeyBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('speedValue');
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('ScrollSnapAnimationSpeed.NORMAL');
      console.info('[testListSpeed004] END');
      done();
    });

    /**
     * @tc.name   testListSpeed005
     * @tc.number testListSpeed005
     * @tc.desc   input -1 ,return ScrollSnapAnimationSpeed.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListSpeed005', Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpeed005] START');
      let driver = Driver.create();
      let speedBtn = await driver.findComponent(ON.id('speedBtn'));
      await speedBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let getKeyBtn = await driver.findComponent(ON.id('getKeyBtn'));
      await getKeyBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('speedValue');
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('ScrollSnapAnimationSpeed.NORMAL');
      console.info('[testListSpeed005] END');
      done();
    });
  })
}
