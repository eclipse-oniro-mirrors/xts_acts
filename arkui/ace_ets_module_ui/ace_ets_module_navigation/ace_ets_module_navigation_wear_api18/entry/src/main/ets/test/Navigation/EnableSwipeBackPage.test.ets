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

export default function EnableSwipeBackPage() {
  describe('EnableSwipeBackPage', () => {
    beforeEach(async (done: Function) => {
      console.info('EnableSwipeBackPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/EnableSwipeBackPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get EnableSwipeBackPage state pages:' + JSON.stringify(pages));
        if (!('EnableSwipeBackPage' == pages.name)) {
          console.info('get EnableSwipeBackPage pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push EnableSwipeBackPage page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EnableSwipeBackPage page error:' + err);
      }
      console.info('EnableSwipeBackPage beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('EnableSwipeBackPage after each called');
    });


    /**
     * @tc.name   EnableSwipeBackPage_0100
     * @tc.number EnableSwipeBackPage_0100
     * @tc.desc   Test enableSwipeBack test true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableSwipeBackPage_0100', Level.LEVEL0, async (done: Function) => {
      console.info('EnableSwipeBackPage_0100 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1: Component = await driver.findComponent(ON.id('pushId'));
      await btn1.click();
      console.info('[EnableSwipeBackPage_0100] btn1 click');
      await driver.delayMs(500);

      let navComponent: Component = await driver.findComponent(ON.id('navId'));
      console.info('[EnableSwipeBackPage_0100] navComponent is ', navComponent);
      let navRect = await navComponent.getBounds();
      let right = navRect.right;
      let bottom = navRect.bottom;   
      console.info('[EnableSwipeBackPage_0100] right is ', right);
      console.info('[EnableSwipeBackPage_0100] bottom is ', bottom);
      await driver.fling({x: Math.round(vp2px(11)), y: Math.round(bottom/2)}, {x: Math.round(right/3), y: Math.round(bottom/2)}, 2, 40000);
      await driver.delayMs(1000)

      await driver.assertComponentExist(ON.id('pushId'));
      console.log('[EnableSwipeBackPage_0100] END');
      done();
    });

    /**
     * @tc.name   EnableSwipeBackPage_0200
     * @tc.number EnableSwipeBackPage_0200
     * @tc.desc   Test enableSwipeBack test false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableSwipeBackPage_0200', Level.LEVEL0, async (done: Function) => {
      console.info('EnableSwipeBackPage_0200 START');
      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1: Component = await driver.findComponent(ON.id('pushId'));
      await btn1.click();
      console.info('[EnableSwipeBackPage_0200] btn1 click');
      await driver.delayMs(500);

      let btn2: Component = await driver.findComponent(ON.id('enableId'));
      await btn2.click();
      console.info('[EnableSwipeBackPage_0200] btn2 click');
      await driver.delayMs(1000);

      let navComponent: Component = await driver.findComponent(ON.id('navId'));
      console.info('[EnableSwipeBackPage_0200] navComponent is ', navComponent);
      let navRect = await navComponent.getBounds();
      let right = navRect.right;
      let bottom = navRect.bottom;   
      console.info('[EnableSwipeBackPage_0200] right is ', right);
      console.info('[EnableSwipeBackPage_0200] bottom is ', bottom);
      await driver.fling({x: Math.round(vp2px(11)), y: Math.round(bottom/2)}, {x: Math.round(right/3), y: Math.round(bottom/2)}, 2, 40000);
      await driver.delayMs(1000)
      await driver.assertComponentExist(ON.id('enableId'));

      let btn3: Component = await driver.findComponent(ON.id('enableId'));
      await btn3.click();
      console.info('[EnableSwipeBackPage_0200] btn3 click');
      await driver.delayMs(1000);
      console.log('[EnableSwipeBackPage_0200] END');
      done();
    });

  })
}