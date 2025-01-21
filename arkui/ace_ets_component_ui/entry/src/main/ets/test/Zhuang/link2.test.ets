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


export default function link2() {
  describe('link2', () => {
    beforeEach(async (done: Function) => {
      console.info("link2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Zhuang/link2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get link2 state pages: " + JSON.stringify(pages));
        if (!("link2" == pages.name)) {
          console.info("get link2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push link2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push link2 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
    });

    it('link2_0100', 0, async (done: Function) => {
      console.info('link2_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('liBtn1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('liBtn1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link2_0100] component obj is: " + JSON.stringify(obj));
      console.info("[link2_0100] title: " + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('ButtonType.Capsule');
      console.info('[link2_0100] END');
      done();

    });

    it('link2_0200', 0, async (done: Function) => {
      console.info('link2_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('liBtn2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('liBtn2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link2_0200] component obj is: " + JSON.stringify(obj));
      console.info("[link2_0200] title: " + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('ButtonType.Capsule');
      console.info('[link2_0200] END');
      done();

    });


    it('link2_0300', 0, async (done: Function) => {
      console.info('link2_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('liBtn3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('liBtn3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link2_0300] component obj is: " + JSON.stringify(obj));
      console.info("[link2_0300] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
      console.info('[link2_0300] END');
      done();

    });

    it('link2_0400', 0, async (done: Function) => {
      console.info('link2_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('liBtn4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('liBtn4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link2_0400] component obj is: " + JSON.stringify(obj));
      console.info("[link2_0400] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
      console.info('[link2_0400] END');
      done();

    });


    it('link2_0500', 0, async (done: Function) => {
      console.info('link2_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('linkBtn1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('linkBtn1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link2_0500] component obj is: " + JSON.stringify(obj));
      console.info("[link2_0500] title: " + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('ButtonType.Capsule');
      console.info('[link2_0500] END');
      done();

    });

    it('link2_0600', 0, async (done: Function) => {
      console.info('link2_0600 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('linkBtn2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('linkBtn2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link2_0600] component obj is: " + JSON.stringify(obj));
      console.info("[link2_0600] title: " + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('ButtonType.Capsule');
      console.info('[link2_0600] END');
      done();

    });


    it('link2_0700', 0, async (done: Function) => {
      console.info('link2_0700 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('linkBtn3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('linkBtn3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link2_0700] component obj is: " + JSON.stringify(obj));
      console.info("[link2_0700] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
      console.info('[link2_0700] END');
      done();

    });

    it('link2_0800', 0, async (done: Function) => {
      console.info('link2_0800 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('linkBtn4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('linkBtn4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[link2_0800] component obj is: " + JSON.stringify(obj));
      console.info("[link2_0800] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('16.00fp');
      console.info('[link2_0800] END');
      done();

    });



  })
}

