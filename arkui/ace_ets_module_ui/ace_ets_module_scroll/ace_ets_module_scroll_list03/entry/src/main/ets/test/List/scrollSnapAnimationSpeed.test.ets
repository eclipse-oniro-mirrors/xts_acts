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

export default function scrollSnapAnimationSpeed() {
  describe('scrollSnapAnimationSpeed', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollSnapAnimationSpeed beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/scrollSnapAnimationSpeed",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollSnapAnimationSpeed state pages:" + JSON.stringify(pages));
        if (!("scrollSnapAnimationSpeed" == pages.name)) {
          console.info("get scrollSnapAnimationSpeed pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
          console.info("push scrollSnapAnimationSpeed page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollSnapAnimationSpeed page error:" + err);
      }
      console.info("scrollSnapAnimationSpeed beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("scrollSnapAnimationSpeed after each called");
    });

    /**
     * @tc.name   testListSpeed01
     * @tc.number testListSpeed01
     * @tc.desc   input ScrollSnapAnimationSpeed.NORMAL ,return ScrollSnapAnimationSpeed.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListSpeed01', Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpeed01] START');
      let driver = Driver.create();
      let speedBtn = await driver.findComponent(ON.id('speedBtn'));
      await speedBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let getKeyBtn = await driver.findComponent(ON.id('getKeyBtn'));
      await getKeyBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('speedValue');
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('ScrollSnapAnimationSpeed.NORMAL');
      console.info('[testListSpeed01] END');
      done();
    });

    /**
     * @tc.name   testListSpeed02
     * @tc.number testListSpeed02
     * @tc.desc   input 1 ,return ScrollSnapAnimationSpeed.SLOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListSpeed02', Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpeed02] START');
      let driver = Driver.create();
      let speedBtn = await driver.findComponent(ON.id('speedBtn'));
      await speedBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let getKeyBtn = await driver.findComponent(ON.id('getKeyBtn'));
      await getKeyBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('speedValue');
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('ScrollSnapAnimationSpeed.SLOW');
      console.info('[testListSpeed02] END');
      done();
    });

    /**
     * @tc.name   testListSpeed03
     * @tc.number testListSpeed03
     * @tc.desc   input undefined ,return ScrollSnapAnimationSpeed.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListSpeed03', Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpeed03] START');
      let driver = Driver.create();
      let speedBtn = await driver.findComponent(ON.id('speedBtn'));
      await speedBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let getKeyBtn = await driver.findComponent(ON.id('getKeyBtn'));
      await getKeyBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('speedValue');
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('ScrollSnapAnimationSpeed.NORMAL');
      console.info('[testListSpeed03] END');
      done();
    });

    /**
     * @tc.name   testListSpeed04
     * @tc.number testListSpeed04
     * @tc.desc   input -1 ,return ScrollSnapAnimationSpeed.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListSpeed04', Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpeed04] START');
      let driver = Driver.create();
      let speedBtn = await driver.findComponent(ON.id('speedBtn'));
      await speedBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let getKeyBtn = await driver.findComponent(ON.id('getKeyBtn'));
      await getKeyBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('speedValue');
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('ScrollSnapAnimationSpeed.NORMAL');
      console.info('[testListSpeed04] END');
      done();
    });

    /**
     * @tc.name   testListSpeed05
     * @tc.number testListSpeed05
     * @tc.desc   input ScrollSnapAnimationSpeed.SLOW ,return ScrollSnapAnimationSpeed.SLOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListSpeed05', Level.LEVEL0, async (done: Function) => {
      console.info('[testListSpeed05] START');
      let driver = Driver.create();
      let speedBtn = await driver.findComponent(ON.id('speedBtn'));
      await speedBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let getKeyBtn = await driver.findComponent(ON.id('getKeyBtn'));
      await getKeyBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew:string = getInspectorByKey('speedValue');
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('ScrollSnapAnimationSpeed.SLOW');
      console.info('[testListSpeed05] END');
      done();
    });
  })
}
