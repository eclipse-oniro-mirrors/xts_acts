







/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';


export default function link1() {
  describe('link1', () => {
    beforeEach(async (done: Function) => {
      console.info("link1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Zhuang/link1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get link1 state pages: " + JSON.stringify(pages));
        if (!("link1" == pages.name)) {
          console.info("get link1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push link1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push link1 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
    });


    it('link1_0100', 0, async (done: Function) => {
      console.info('link1_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('lBtn1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lBtn1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link1_0100] component obj is: " + JSON.stringify(obj));
      console.info("[link1_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[link1_0100] END');
      done();

    });

    it('link1_0200', 0, async (done: Function) => {
      console.info('link1_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('lBtn2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lBtn2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link1_0200] component obj is: " + JSON.stringify(obj));
      console.info("[link1_0200] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[link1_0200] END');
      done();

    });


    it('link1_0300', 0, async (done: Function) => {
      console.info('link1_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('lBtn3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lBtn3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link1_0300] component obj is: " + JSON.stringify(obj));
      console.info("[link1_0300] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('100.00fp');
      console.info('[link1_0300] END');
      done();

    });

    it('link1_0400', 0, async (done: Function) => {
      console.info('link1_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('lBtn4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lBtn4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link1_0400] component obj is: " + JSON.stringify(obj));
      console.info("[link1_0400] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('100.00fp');
      console.info('[link1_0400] END');
      done();

    });


    it('link1_0500', 0, async (done: Function) => {
      console.info('link1_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('zilBtn1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('zilBtn1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link1_0500] component obj is: " + JSON.stringify(obj));
      console.info("[link1_0500] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[link1_0500] END');
      done();

    });

    it('link1_0600', 0, async (done: Function) => {
      console.info('link1_0600 START');
      let driver = await UiDriver.create()
      await driver.swipe(100,500,100,100)
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(BY.key('zilBtn2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('zilBtn2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link1_0600] component obj is: " + JSON.stringify(obj));
      console.info("[link1_0600] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[link1_0600] END');
      done();

    });


    it('link1_0700', 0, async (done: Function) => {
      console.info('link1_0700 START');
      let driver = await UiDriver.create()
      await driver.swipe(100,500,100,100)
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(BY.key('zilBtn3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('zilBtn3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link1_0700] component obj is: " + JSON.stringify(obj));
      console.info("[link1_0700] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('100.00fp');
      console.info('[link1_0700] END');
      done();

    });

    it('link1_0800', 0, async (done: Function) => {
      console.info('link1_0800 START');
      let driver = await UiDriver.create()
      await driver.swipe(100,500,100,100)
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(BY.key('zilBtn4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('zilBtn4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link1_0800] component obj is: " + JSON.stringify(obj));
      console.info("[link1_0800] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('100.00fp');
      console.info('[link1_0800] END');
      done();

    });



  })
}

