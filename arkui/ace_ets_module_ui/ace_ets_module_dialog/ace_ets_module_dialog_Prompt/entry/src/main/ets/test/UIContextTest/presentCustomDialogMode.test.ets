
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

export default function presentCustomDialogMode() {
  describe('presentCustomDialogMode', () => {
    beforeEach(async (done: Function) => {
      console.info("presentCustomDialogMode beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/presentCustomDialogMode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get presentCustomDialogMode state pages: " + JSON.stringify(pages));
        if (!("presentCustomDialogMode" == pages.name)) {
          console.info("get presentCustomDialogMode state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push presentCustomDialogMode success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push presentCustomDialogMode page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    presentCustomDialogMode_0100
     * @tc.name      presentCustomDialogMode_0100
     * @tc.desc      set levelMode: 0(LevelMode.OVERLAY),levelUniqueId: Normal value
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('presentCustomDialogMode_0100', Level.LEVEL1, async (done: Function) => {
      console.info('presentCustomDialogMode_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('levelMode: OVERLAY'));
      await btn.click();
      console.info('[presentCustomDialogMode_0100] overlay click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Normal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('presentCustomDialog'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0100] openCustomDialog click');

      let btn2: Component = await driver.findComponent(ON.id('router'));
      expect(btn2 != null).assertTrue();
      await btn2.click();
      console.info('[presentCustomDialogMode_0100] router');
      await CommonFunc.sleep(1000);
     
      let btn3: Component = await driver.findComponent(ON.id('router'));
      expect(btn3 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn4: Component = await driver.findComponent(ON.id('back'));
      await btn4.click();
      console.info('[presentCustomDialogMode_0100] back');

      let btn5: Component = await driver.findComponent(ON.id('router'));
      expect(btn5 != null).assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0100] router');

      let btn6: Component = await driver.findComponent(ON.id('close'));
      await btn6.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0100] END');
      done();
    });

    /**
     * @tc.number    presentCustomDialogMode_0200
     * @tc.name      presentCustomDialogMode_0200
     * @tc.desc      set levelMode: 1(LevelMode.EMBEDDED),levelUniqueId: Normal value
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('presentCustomDialogMode_0200', Level.LEVEL1, async (done: Function) => {
      console.info('presentCustomDialogMode_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('levelMode: EMBEDDED'));
      await btn.click();
      console.info('[presentCustomDialogMode_0200] EMBEDDED click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Normal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('presentCustomDialog'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0200] openCustomDialog click');

      let btn2: Component = await driver.findComponent(ON.id('router'));
      expect(btn2 != null).assertTrue();
      await btn2.click();
      console.info('[presentCustomDialogMode_0200] router');
      await CommonFunc.sleep(1000);
     
      let btn3: Component = await driver.findComponent(ON.id('router'));
      expect(btn3 != null).assertFalse();
      await CommonFunc.sleep(1000);

      let btn4: Component = await driver.findComponent(ON.id('back1'));
      await btn4.click();
      console.info('[presentCustomDialogMode_0200] back');

      let btn5: Component = await driver.findComponent(ON.id('router'));
      expect(btn5 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn6: Component = await driver.findComponent(ON.id('close'));
      await btn6.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0200] END');
      done();
    });

    /**
     * @tc.number    presentCustomDialogMode_0300
     * @tc.name      presentCustomDialogMode_0300
     * @tc.desc      set levelMode: 0(LevelMode.OVERLAY),levelUniqueId: Abnormal value,
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('presentCustomDialogMode_0300', Level.LEVEL1, async (done: Function) => {
      console.info('presentCustomDialogMode_0300 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('levelMode: OVERLAY'));
      await btn.click();
      console.info('[presentCustomDialogMode_0300] OVERLAY click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Abnormal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('presentCustomDialog'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0300] openCustomDialog click');

      let btn2: Component = await driver.findComponent(ON.id('router'));
      expect(btn2 != null).assertTrue();
      await btn2.click();
      console.info('[presentCustomDialogMode_0300] router');
      await CommonFunc.sleep(1000);
     
      let btn3: Component = await driver.findComponent(ON.id('router'));
      expect(btn3 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn4: Component = await driver.findComponent(ON.id('back'));
      await btn4.click();
      console.info('[presentCustomDialogMode_0300] back');

      let btn5: Component = await driver.findComponent(ON.id('router'));
      expect(btn5 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn6: Component = await driver.findComponent(ON.id('close'));
      await btn6.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0300] END');
      done();
    });

    /**
     * @tc.number    presentCustomDialogMode_0400
     * @tc.name      presentCustomDialogMode_0400
     * @tc.desc      set  set levelMode: 1(LevelMode.EMBEDDED),levelUniqueId: Abnormal value
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('presentCustomDialogMode_0400', Level.LEVEL1, async (done: Function) => {
      console.info('presentCustomDialogMode_0400 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('levelMode: EMBEDDED'));
      await btn.click();
      console.info('[presentCustomDialogMode_0400] EMBEDDED click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Abnormal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('presentCustomDialog'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0400] openCustomDialog click');

      let btn2: Component = await driver.findComponent(ON.id('router'));
      expect(btn2 != null).assertTrue();
      await btn2.click();
      console.info('[presentCustomDialogMode_0400] router');
      await CommonFunc.sleep(1000);
     
      let btn3: Component = await driver.findComponent(ON.id('router'));
      expect(btn3 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn4: Component = await driver.findComponent(ON.id('back'));
      await btn4.click();
      console.info('[presentCustomDialogMode_0400] back');

      let btn5: Component = await driver.findComponent(ON.id('router'));
      expect(btn5 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn6: Component = await driver.findComponent(ON.id('close'));
      await btn6.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0400] END');
      done();
    });


     /**
     * @tc.number    presentCustomDialogMode_0500
     * @tc.name      presentCustomDialogMode_0500
     * @tc.desc      set levelMode: 0(LevelMode.EMBEDDED),levelUniqueId: Normal value,immersiveMode:1(imMode: extend)
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('presentCustomDialogMode_0500', Level.LEVEL1, async (done: Function) => {
      console.info('presentCustomDialogMode_0500 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('levelMode: EMBEDDED'));
      await btn.click();
      console.info('[presentCustomDialogMode_0400] EMBEDDED click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Normal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);


      let button: Component = await driver.findComponent(ON.id('imMode: extend'));
      await button.click();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('presentCustomDialog'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0500] openCustomDialog click');

      let btn2: Component = await driver.findComponent(ON.text('router'));
      expect(btn2 != null).assertTrue();
      let btn3: Component = await driver.findComponent(ON.id('close'));
      await btn3.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0500] END');
      done();
    });

    
     /**
     * @tc.number    presentCustomDialogMode_0600
     * @tc.name      presentCustomDialogMode_0600
     * @tc.desc      set levelMode: 0(LevelMode.EMBEDDED),levelUniqueId: Normal value,immersiveMode:0(imMode: extend)
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('presentCustomDialogMode_0600', Level.LEVEL1, async (done: Function) => {
      console.info('presentCustomDialogMode_0600 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
     let btn: Component = await driver.findComponent(ON.id('levelMode: EMBEDDED'));
      await btn.click();
      console.info('[presentCustomDialogMode_0600] EMBEDDED click');
      await CommonFunc.sleep(1000);

       let btn0: Component = await driver.findComponent(ON.id('uniqId: Normal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);

      let button: Component = await driver.findComponent(ON.id('imMode: default'));
      await button.click();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('presentCustomDialog'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0600] openCustomDialog click');

      let btn2: Component = await driver.findComponent(ON.text('router'));
      expect(btn2 != null).assertTrue();
      let btn3: Component = await driver.findComponent(ON.id('close'));
      await btn3.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0600] END');
      done();
    });


    /**
     * @tc.number    presentCustomDialogMode_0700
     * @tc.name      presentCustomDialogMode_0700
     * @tc.desc      set levelMode: undefined,levelUniqueId: Normal value
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('presentCustomDialogMode_0700', Level.LEVEL1, async (done: Function) => {
      console.info('presentCustomDialogMode_0700 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('undefined'));
      await btn.click();
      console.info('[presentCustomDialogMode_0700] undefined click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Normal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('presentCustomDialog'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0700] openCustomDialog click');

      let btn2: Component = await driver.findComponent(ON.id('router'));
      expect(btn2 != null).assertTrue();
      await btn2.click();
      console.info('[presentCustomDialogMode_0700] router');
      await CommonFunc.sleep(1000);
     
      let btn3: Component = await driver.findComponent(ON.id('router'));
      expect(btn3 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn4: Component = await driver.findComponent(ON.id('back'));
      await btn4.click();
      console.info('[presentCustomDialogMode_0700] back');

      let btn5: Component = await driver.findComponent(ON.id('router'));
      expect(btn5 != null).assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0700] router');

      let btn6: Component = await driver.findComponent(ON.id('close'));
      await btn6.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0700] END');
      done();
    });

    /**
     * @tc.number    presentCustomDialogMode_0800
     * @tc.name      presentCustomDialogMode_0800
     * @tc.desc      set levelMode: null,levelUniqueId: Normal value
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('presentCustomDialogMode_0800', Level.LEVEL1, async (done: Function) => {
      console.info('presentCustomDialogMode_0800 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('null'));
      await btn.click();
      console.info('[presentCustomDialogMode_0800] undefined click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Normal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('presentCustomDialog'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0800] openCustomDialog click');

      let btn2: Component = await driver.findComponent(ON.id('router'));
      expect(btn2 != null).assertTrue();
      await btn2.click();
      console.info('[presentCustomDialogMode_0800] router');
      await CommonFunc.sleep(1000);
     
      let btn3: Component = await driver.findComponent(ON.id('router'));
      expect(btn3 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn4: Component = await driver.findComponent(ON.id('back'));
      await btn4.click();
      console.info('[presentCustomDialogMode_0800] back');

      let btn5: Component = await driver.findComponent(ON.id('router'));
      expect(btn5 != null).assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0800] router');

      let btn6: Component = await driver.findComponent(ON.id('close'));
      await btn6.click();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_0800] END');
      done();
    });

  })
}