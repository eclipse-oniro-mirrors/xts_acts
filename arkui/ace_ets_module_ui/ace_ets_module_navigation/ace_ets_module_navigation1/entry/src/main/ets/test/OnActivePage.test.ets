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
import events_emitter from '@ohos.events.emitter'

export default function OnActivePage() {
  describe('OnActivePage', () => {
    beforeEach(async (done: Function) => {
      console.info("OnActivePage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/OnActivePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnActivePage state pages:" + JSON.stringify(pages));
        if (!("OnActivePage" == pages.name)) {
          console.info("get OnActivePage pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push OnActivePage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnActivePage page error:" + err);
      }
      console.info("OnActivePage beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnActivePage after each called");
    });


    /**
     * @tc.name   OnActivePage_0100
     * @tc.number OnActivePage_0100
     * @tc.desc   Test NavDestinationActiveReason.OVERLAY in onActive and onInactive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnActivePage_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('OnActivePage_0100 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1: Component = await driver.findComponent(ON.id('overLayBtnId'));
      await btn1.click();
      console.info('[OnActivePage_0100] btn1 click');
      await driver.delayMs(1000);

      let btn2: Component = await driver.findComponent(ON.id('overLayPushId'));
      await btn2.click();
      console.info('[OnActivePage_0100] btn2 click');
      await driver.delayMs(2000);

      let btn3: Component = await driver.findComponent(ON.id('openOverLayId'));
      await btn3.click();
      console.info('[OnActivePage_0100] btn3 click');
      await driver.delayMs(5000);

      let testVal: number = AppStorage.get('onInactive') as number
      console.log('OnActivePage_0100 on onInactive value : ' + testVal)
      expect(testVal).assertEqual(NavDestinationActiveReason.OVERLAY);
      AppStorage.delete('onInactive');

      let btn4: Component = await driver.findComponent(ON.id('closeOverLayId'));
      await btn4.click();
      console.info('[OnActivePage_0100] btn4 click');
      await driver.delayMs(5000);

      let testVal2: number = AppStorage.get('onActive') as number
      console.log('OnActivePage_0100 on onActive value : ' + testVal2)
      expect(testVal2).assertEqual(NavDestinationActiveReason.OVERLAY);
      AppStorage.delete('onActive');
      console.log('[OnActivePage_0100] END');
      done();
    });

    /**
     * @tc.name   OnActivePage_0200
     * @tc.number OnActivePage_0200
     * @tc.desc   Test NavDestinationActiveReason.TRANSITION in onActive and onInactive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnActivePage_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('OnActivePage_0200 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1: Component = await driver.findComponent(ON.id('baseBtnId'));
      await btn1.click();
      console.info('[OnActivePage_0200] btn1 click');
      await driver.delayMs(1000);

      let btn2: Component = await driver.findComponent(ON.id('pushId'));
      await btn2.click();
      console.info('[OnActivePage_0200] btn2 click');
      await driver.delayMs(3000);  
      let testVal: number = AppStorage.get('onInactive') as number
      console.log('OnActivePage_0200 on onInactive value : ' + testVal)
      expect(testVal).assertEqual(NavDestinationActiveReason.TRANSITION);
      AppStorage.delete('onInactive');

      let btn3: Component = await driver.findComponent(ON.id('pushId'));
      await btn3.click();
      console.info('[OnActivePage_0200] btn3 click');

      await driver.delayMs(3000);  
      let testVal2: number = AppStorage.get('onActive') as number
      console.log('OnActivePage_0200 on onActive value : ' + testVal2)
      expect(testVal2).assertEqual(NavDestinationActiveReason.TRANSITION);
      AppStorage.delete('onActive');

      console.log('[OnActivePage_0200] END');
      done();
    });

    /**
     * @tc.name   OnActivePage_0300
     * @tc.number OnActivePage_0300
     * @tc.desc   Test NavDestinationActiveReason.DIALOG in onActive and onInactive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnActivePage_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('OnActivePage_0300 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1: Component = await driver.findComponent(ON.id('dialogBtnId'));
      await btn1.click()
      console.info('[OnActivePage_0300] btn1 click');
      await driver.delayMs(1000);

      let btn2: Component = await driver.findComponent(ON.id('dialogPushId'));
      await btn2.click();
      console.info('[OnActivePage_0300] btn2 click');
      await driver.delayMs(1000);  

      let btn3: Component = await driver.findComponent(ON.id('openDialogId'));
      await btn3.click();
      console.info('[OnActivePage_0300] btn3 click');
      await driver.delayMs(3000);  

      let testVal: number = AppStorage.get('onInactive') as number
      console.log('OnActivePage_0300 on onInactive value : ' + testVal)
      expect(testVal).assertEqual(NavDestinationActiveReason.DIALOG);
      AppStorage.delete('onInactive');

      let btn4: Component = await driver.findComponent(ON.id('closeDialogId'));
      await btn4.click();
      console.info('[OnActivePage_0300] btn4 click');

      await driver.delayMs(3000);  
      let testVal2: number = AppStorage.get('onActive') as number
      console.log('OnActivePage_0300 on onActive value : ' + testVal2)
      expect(testVal2).assertEqual(NavDestinationActiveReason.DIALOG);
      AppStorage.delete('onActive');

      console.log('[OnActivePage_0300] END');
      done();
    });

    /**
     * @tc.name   OnActivePage_0400
     * @tc.number OnActivePage_0400
     * @tc.desc   Test NavDestinationActiveReason.SHEET in onActive and onInactive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnActivePage_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('OnActivePage_0400 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1: Component = await driver.findComponent(ON.id('halfBtnId'));
      await btn1.click()
      console.info('[OnActivePage_0400] btn1 click');
      await driver.delayMs(1000);

      let btn2: Component = await driver.findComponent(ON.id('sheetPushId'));
      await btn2.click();
      console.info('[OnActivePage_0400] btn2 click');
      await driver.delayMs(1000);  

      let btn3: Component = await driver.findComponent(ON.id('openSheetId'));
      await btn3.click();
      console.info('[OnActivePage_0400] btn3 click');
      await driver.delayMs(3000);  

      let testVal: number = AppStorage.get('onInactive') as number
      console.log('OnActivePage_0400 on onInactive value : ' + testVal)
      expect(testVal).assertEqual(NavDestinationActiveReason.SHEET);
      AppStorage.delete('onInactive');

      console.log('[OnActivePage_0400] END');
      done();
    });

    /**
     * @tc.name   OnActivePage_0500
     * @tc.number OnActivePage_0500
     * @tc.desc   Test NavDestinationActiveReason.CONTENT_COVER in onActive and onInactive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnActivePage_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('OnActivePage_0500 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1: Component = await driver.findComponent(ON.id('allBtnId'));
      await btn1.click()
      console.info('[OnActivePage_0500] btn1 click');
      await driver.delayMs(1000);

      let btn2: Component = await driver.findComponent(ON.id('allSheetPushId'));
      await btn2.click();
      console.info('[OnActivePage_0500] btn2 click');
      await driver.delayMs(1000);  

      let btn3: Component = await driver.findComponent(ON.id('openAllSheetId'));
      await btn3.click();
      console.info('[OnActivePage_0500] btn3 click');
      await driver.delayMs(3000);  

      let testVal: number = AppStorage.get('onInactive') as number
      console.log('OnActivePage_0500 on onInactive value : ' + testVal)
      expect(testVal).assertEqual(NavDestinationActiveReason.CONTENT_COVER);
      AppStorage.delete('onInactive');

      let btn4: Component = await driver.findComponent(ON.id('closeAllSheetId'));
      await btn4.click();
      console.info('[OnActivePage_0500] btn4 click');

      await driver.delayMs(3000);  
      let testVal2: number = AppStorage.get('onActive') as number
      console.log('OnActivePage_0500 on onActive value : ' + testVal2)
      expect(testVal2).assertEqual(NavDestinationActiveReason.CONTENT_COVER);
      AppStorage.delete('onActive');

      console.log('[OnActivePage_0500] END');
      done();
    });

    /**
     * @tc.name   OnActivePage_0600
     * @tc.number OnActivePage_0600
     * @tc.desc   Test NavDestinationActiveReason.APP_STATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnActivePage_0600',  Level.LEVEL0, async (done: Function) => {
      console.info('OnActivePage_0600 START');
      let driver = Driver.create();
      await driver.delayMs(1000);
      expect(NavDestinationActiveReason.APP_STATE).assertEqual(5);
      console.log('[OnActivePage_0600] END');
      done();
    });

  })
}