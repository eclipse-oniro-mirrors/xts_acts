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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function lazyForEachTest() {
  describe('lazyForEachTest', () => {
    beforeEach(async (done: Function) => {
      console.info("lazyForEachTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/lazyForEachTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info("get lazyForEachTest state pages:" + JSON.stringify(pages));
        if (!("lazyForEachTest" == pages.name)) {
          console.info("get lazyForEachTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push lazyForEachTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push lazyForEachTest page error:" + err);
      }
      console.info("lazyForEachTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("lazyForEachTest after each called");
    });
    /**
     * @tc.number    lazyForEachTest_0100
     * @tc.name      lazyForEachTest_0100
     * @tc.desc      Test expand
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('lazyForEachTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('lazyForEachTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_expand'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson1: string = getInspectorByKey('getChildValue');
      let strJson2: string = getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[lazyForEachTest_0100] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[lazyForEachTest_0100] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[lazyForEachTest_0100] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('LazyForEachListItem_TTT3');
      expect(obj2.$attrs.content).assertEqual('0');
      expect(obj3.$attrs.content).assertEqual('10');
      console.info('[lazyForEachTest_0100] END');
      done();
    });
    /**
     * @tc.number    lazyForEachTest_0200
     * @tc.name      lazyForEachTest_0200
     * @tc.desc      Test not expand
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('lazyForEachTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('lazyForEachTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_not_expand'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson1: string = getInspectorByKey('getChildValue');
      let strJson2: string = getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[lazyForEachTest_0200] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[lazyForEachTest_0200] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[lazyForEachTest_0200] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('LazyForEachListItem_TTT3');
      expect(obj2.$attrs.content).assertEqual('0');
      expect(obj3.$attrs.content).assertEqual('3');
      console.info('[lazyForEachTest_0200] END');
      done();
    });
    /**
     * @tc.number    lazyForEachTest_0300
     * @tc.name      lazyForEachTest_0300
     * @tc.desc      Test lazy expand
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('lazyForEachTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('lazyForEachTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_lazy_expand'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson1: string = getInspectorByKey('getChildValue');
      let strJson2: string = getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[lazyForEachTest_0300] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[lazyForEachTest_0300] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[lazyForEachTest_0300] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('LazyForEachListItem_TTT3');
      expect(obj2.$attrs.content).assertEqual('0');
      expect(obj3.$attrs.content).assertEqual('3');
      console.info('[lazyForEachTest_0300] END');
      done();
    });
    /**
     * @tc.number    lazyForEachTest_0400
     * @tc.name      lazyForEachTest_0400
     * @tc.desc      Test expand null
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('lazyForEachTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('lazyForEachTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_expand_null'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson1: string = getInspectorByKey('getChildValue');
      let strJson2: string = getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[lazyForEachTest_0400] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[lazyForEachTest_0400] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[lazyForEachTest_0400] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('LazyForEachListItem_TTT3');
      expect(obj2.$attrs.content).assertEqual('0');
      expect(obj3.$attrs.content).assertEqual('10');
      console.info('[lazyForEachTest_0400] END');
      done();
    });
    /**
     * @tc.number    lazyForEachTest_0500
     * @tc.name      lazyForEachTest_0500
     * @tc.desc      Test expand undefined
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('lazyForEachTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('lazyForEachTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_expand_undefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson1: string = getInspectorByKey('getChildValue');
      let strJson2: string = getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[lazyForEachTest_0500] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[lazyForEachTest_0500] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[lazyForEachTest_0500] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('LazyForEachListItem_TTT3');
      expect(obj2.$attrs.content).assertEqual('0');
      expect(obj3.$attrs.content).assertEqual('10');
      console.info('[lazyForEachTest_0500] END');
      done();
    });
    /**
     * @tc.number    lazyForEachTest_0600
     * @tc.name      lazyForEachTest_0600
     * @tc.desc      Test expand Out of bounds
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('lazyForEachTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('lazyForEachTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_expand_out'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson1: string = getInspectorByKey('getChildValue');
      let strJson2: string = getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[lazyForEachTest_0600] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[lazyForEachTest_0600] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[lazyForEachTest_0600] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('undefined');
      expect(obj2.$attrs.content).assertEqual('0');
      expect(obj3.$attrs.content).assertEqual('10');
      console.info('[lazyForEachTest_0600] END');
      done();
    });
    /**
     * @tc.number    lazyForEachTest_0700
     * @tc.name      lazyForEachTest_0700
     * @tc.desc      Test lazy expand Out of bounds
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('lazyForEachTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('lazyForEachTest_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_lazy_expand_out'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson1: string = getInspectorByKey('getChildValue');
      let strJson2: string = getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[lazyForEachTest_0700] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[lazyForEachTest_0700] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[lazyForEachTest_0700] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('undefined');
      expect(obj2.$attrs.content).assertEqual('0');
      expect(obj3.$attrs.content).assertEqual('10');
      console.info('[lazyForEachTest_0700] END');
      done();
    });
    /**
     * @tc.number    lazyForEachTest_0800
     * @tc.name      lazyForEachTest_0800
     * @tc.desc      Test not expand Out of bounds
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('lazyForEachTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('lazyForEachTest_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_not_expand_out'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson1: string = getInspectorByKey('getChildValue');
      let strJson2: string = getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[lazyForEachTest_0800] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[lazyForEachTest_0800] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[lazyForEachTest_0800] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('undefined');
      expect(obj2.$attrs.content).assertEqual('0');
      expect(obj3.$attrs.content).assertEqual('3');
      console.info('[lazyForEachTest_0800] END');
      done();
    });
  })
}