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

import CommonFunc from '../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { display } from '@kit.ArkUI';

export default function PreferredOrientation() {
  describe('PreferredOrientation', () => {
    let initRotation: number = display.getDefaultDisplaySync().orientation;
    beforeEach(async (done: Function) => {
      console.info('PreferredOrientation beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PreferredOrientation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get PreferredOrientation state pages:' + JSON.stringify(pages));
        if (!('PreferredOrientation' == pages.name)) {
          console.info('get PreferredOrientation pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push PreferredOrientation page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PreferredOrientation page error:' + err);
      }
      console.info('PreferredOrientation beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PreferredOrientation after each called');
    });


    /**
     * @tc.number    PreferredOrientation_0100
     * @tc.name      PreferredOrientation_0100
     * @tc.desc      Test 
     * @tc.level     Level 2
     */
    it('PreferredOrientation_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PreferredOrientation_0100 START');
      if (globalThis.winLeft == 0) {
        await CommonFunc.sleep(500);
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1: Component = await driver.findComponent(ON.id('getPortraitPage'));
        await btn1.click();
        await driver.delayMs(2000);

        let rotation: number = AppStorage.get('testOrientation') as number
        console.info('[PreferredOrientation_0100] rotation is ', rotation);
        expect(rotation == 0 || rotation == initRotation).assertTrue();
        AppStorage.delete('testOrientation');
      }
      console.info('PreferredOrientation_0100 END');
      done();
    });

    /**
     * @tc.number    PreferredOrientation_0200
     * @tc.name      PreferredOrientation_0200
     * @tc.desc      Test 
     * @tc.level     Level 2
     */
    it('PreferredOrientation_0200', Level.LEVEL0, async (done: Function) => {
      console.info('PreferredOrientation_0200 START');
      if (globalThis.winLeft == 0) {
        await CommonFunc.sleep(500);
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1: Component = await driver.findComponent(ON.id('landscapeId'));
        await btn1.click()
        console.info('[PreferredOrientation_0200] btn1 click');
        await driver.delayMs(1000);

        let btn2: Component = await driver.findComponent(ON.id('getLandscapePage'));
        await btn2.click();
        await driver.delayMs(2000);

        let rotation: number = AppStorage.get('testOrientation') as number
        console.info('[PreferredOrientation_0200] rotation is ', rotation);
        expect(rotation == 1 || rotation == 3 || rotation == initRotation).assertTrue();
        AppStorage.delete('testOrientation');
      }
      console.info('PreferredOrientation_0200 END');
      done();
    });

    /**
     * @tc.number    PreferredOrientation_0300
     * @tc.name      PreferredOrientation_0300
     * @tc.desc      Test 
     * @tc.level     Level 2
     */
    it('PreferredOrientation_0300', Level.LEVEL0, async (done: Function) => {
      console.info('PreferredOrientation_0300 START');
      if (globalThis.winLeft == 0) {
        await CommonFunc.sleep(500);
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1: Component = await driver.findComponent(ON.id('unspecifiedId'));
        await btn1.click()
        console.info('[PreferredOrientation_0300] btn1 click');
        await driver.delayMs(1000);

        let btn2: Component = await driver.findComponent(ON.id('getUnspecifiedPage'));
        await btn2.click();
        await driver.delayMs(2000);

        let rotation: number = AppStorage.get('testOrientation') as number
        console.info('[PreferredOrientation_0300] rotation is ', rotation);
        let navigation: Component = await driver.findComponent(ON.type('Navigation'));
        let rect = await navigation.getBounds();
        let navigationWidth = rect.right;
        console.info('[PreferredOrientation_0300] navigationWidth is ', navigationWidth);
        if (navigationWidth < 1500) {
          expect(rotation == 0 || rotation == initRotation).assertTrue();
        }
        AppStorage.delete('testOrientation');
      }
      console.info('PreferredOrientation_0300 END');
      done();
    });

    /**
     * @tc.number    PreferredOrientation_0400
     * @tc.name      PreferredOrientation_0400
     * @tc.desc      Test 
     * @tc.level     Level 2
     */
    it('PreferredOrientation_0400', Level.LEVEL0, async (done: Function) => {
      console.info('PreferredOrientation_0400 START');
      if (globalThis.winLeft == 0) {
        await CommonFunc.sleep(500);
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1: Component = await driver.findComponent(ON.id('portraitInvertedId'));
        await btn1.click()
        console.info('[PreferredOrientation_0400] btn1 click');
        await driver.delayMs(1000);

        let btn2: Component = await driver.findComponent(ON.id('getPortraitInvertedPage'));
        await btn2.click();
        await driver.delayMs(2000);

        let rotation: number = AppStorage.get('testOrientation') as number
        console.info('[PreferredOrientation_0400] rotation is ', rotation);
        expect(rotation == 2 || rotation == initRotation).assertTrue();
        AppStorage.delete('testOrientation');
      }
      console.info('PreferredOrientation_0400 END');
      done();
    });

    /**
     * @tc.number    PreferredOrientation_0500
     * @tc.name      PreferredOrientation_0500
     * @tc.desc      Test 
     * @tc.level     Level 2
     */
    it('PreferredOrientation_0500', Level.LEVEL0, async (done: Function) => {
      console.info('PreferredOrientation_0500 START');
      if (globalThis.winLeft == 0) {
        await CommonFunc.sleep(500);
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1: Component = await driver.findComponent(ON.id('lanscapeInvertedId'));
        await btn1.click()
        console.info('[PreferredOrientation_0500] btn1 click');
        await driver.delayMs(1000);

        let btn3: Component = await driver.findComponent(ON.id('getLandscapInvertedPage'));
        await btn3.click();
        await driver.delayMs(2000);

        let rotation: number = AppStorage.get('testOrientation') as number
        console.info('[PreferredOrientation_0500] rotation is ', rotation);
        expect(rotation == 1 || rotation == 3 || rotation == initRotation).assertTrue();
        AppStorage.delete('testOrientation');
      }
      console.info('PreferredOrientation_0500 END');
      done();
    });

  })
}