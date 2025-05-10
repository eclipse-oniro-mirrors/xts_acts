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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, UiDirection, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter'

export default function EnableSwipeBackRouter() {
  describe('EnableSwipeBackRouter', () => {
    beforeEach(async (done: Function) => {
      console.info('EnableSwipeBackRouter beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/EnableSwipeBackRouter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get EnableSwipeBackRouter state pages:' + JSON.stringify(pages));
        if (!('EnableSwipeBackRouter' == pages.name)) {
          console.info('get EnableSwipeBackRouter pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push EnableSwipeBackRouter page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EnableSwipeBackRouter page error:' + err);
      }
      console.info('EnableSwipeBackRouter beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('EnableSwipeBackRouter after each called');
    });


    /**
     * @tc.number    EnableSwipeBackRouter_0100
     * @tc.name      EnableSwipeBackRouter_0100
     * @tc.desc      Test enableSwipeBack test true
     * @tc.level     Level 0
     */
    it('EnableSwipeBackRouter_0100', Level.LEVEL0, async (done: Function) => {
      console.info('EnableSwipeBackRouter_0100 START');
      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1: Component = await driver.findComponent(ON.id('pushId'));
      await btn1.click();
      console.info('[EnableSwipeBackRouter_0100] btn1 click');
      await driver.delayMs(500);

      let navComponent: Component = await driver.findComponent(ON.id('columnId'));
      console.info('[EnableSwipeBackRouter_0100] navComponent is ', navComponent);
      let navRect = await navComponent.getBounds();
      let right = navRect.right;
      let bottom = navRect.bottom;   
      console.info('[EnableSwipeBackRouter_0100] right is ', right);
      console.info('[EnableSwipeBackRouter_0100] bottom is ', bottom);
      await driver.fling({x: Math.round(vp2px(11)), y: Math.round(bottom/2)}, {x: Math.round(right/3), y: Math.round(bottom/2)}, 2, 40000);
      await driver.delayMs(1000)

      await driver.assertComponentExist(ON.id('pushId'));
      console.log('[EnableSwipeBackRouter_0100] END');
      done();
    });

    /**
     * @tc.number    EnableSwipeBackRouter_0200
     * @tc.name      EnableSwipeBackRouter_0200
     * @tc.desc      Test enableSwipeBack test false
     * @tc.level     Level 0
     */
    it('EnableSwipeBackRouter_0200', Level.LEVEL0, async (done: Function) => {
      console.info('EnableSwipeBackRouter_0200 START');
      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1: Component = await driver.findComponent(ON.id('pushId'));
      await btn1.click();
      console.info('[EnableSwipeBackRouter_0200] btn1 click');
      await driver.delayMs(500);

      let btn2: Component = await driver.findComponent(ON.id('enableId'));
      await btn2.click();
      console.info('[EnableSwipeBackRouter_0200] btn2 click');
      await driver.delayMs(500);

      let navComponent: Component = await driver.findComponent(ON.id('columnId'));
      console.info('[EnableSwipeBackRouter_0200] navComponent is ', navComponent);
      let navRect = await navComponent.getBounds();
      let right = navRect.right;
      let bottom = navRect.bottom;   
      console.info('[EnableSwipeBackRouter_0200] right is ', right);
      console.info('[EnableSwipeBackRouter_0200] bottom is ', bottom);
      await driver.fling({x: Math.round(vp2px(11)), y: Math.round(bottom/2)}, {x: Math.round(right/3), y: Math.round(bottom/2)}, 2, 40000);
      await driver.delayMs(1000)
      await driver.assertComponentExist(ON.id('enableId'));

      let btn3: Component = await driver.findComponent(ON.id('enableId'));
      await btn3.click();
      console.info('[EnableSwipeBackRouter_0200] btn3 click');
      await driver.delayMs(1000);
      console.log('[EnableSwipeBackRouter_0200] END');
      done();
    });

  })
}