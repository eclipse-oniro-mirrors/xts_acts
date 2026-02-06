/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function PatternLockJsunit() {
  describe('PatternLockJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("PatternLockPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PatternLock/PatternLockPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PatternLockPage state pages: " + JSON.stringify(pages));
        if (!("PatternLockPage" == pages.name)) {
          console.info("get PatternLockPage state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PatternLock page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PatternLock page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('PatternLockJsunit_0100', Level.LEVEL2, async (done: Function) => {
      // Get the information of the PatternLock component
      console.info('[PatternLockJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lock');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PatternLockJsunit_0100'] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.sideLength).assertEqual('200.00vp');
      expect(obj.$attrs.circleRadius).assertEqual('9.00vp');
      expect(obj.$attrs.regularColor).assertEqual('#FF000000');
      expect(obj.$attrs.selectedColor).assertEqual('#FF228B22');
      expect(obj.$attrs.activeColor).assertEqual('#FFB0C4DE');
      expect(obj.$attrs.pathColor).assertEqual('#FF90EE90');
      expect(obj.$attrs.pathStrokeWidth).assertEqual('18.00vp');
      expect(obj.$attrs.autoReset).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('[PatternLockJsunit_0100] END');
      done();
    });

    it('PatternLockJsunit_0200', Level.LEVEL2, async (done: Function) => {
      // Verify the content of the message
      let driver1 = await UiDriver.create()
      let textComponent1 = await driver1.findComponent(BY.key('text'));
      let text1 = await textComponent1.getText();
      expect(text1).assertEqual('please input password!');
      console.info('[PatternLockJsunit_0200] END');
      done();
    });

    it('PatternLockJsunit_0300', Level.LEVEL2, async (done: Function) => {
      // Verify that clicking the 'Reset PatternLock' button resets
      console.info('[PatternLockJsunit_0300] START');
      // Get the component of the 'Reset PatternLock' button
      let driver = await UiDriver.create()
      let reSet = await driver.findComponent(BY.key('reSet'));
      await reSet.click();
      await CommonFunc.sleep(2000);
      // Verify the content of the message
      let driver1 = await UiDriver.create()
      let curtextrentBp = await driver1.findComponent(BY.key('text'));
      let text = await curtextrentBp.getText();
      expect(text).assertEqual('Please input password');
      console.info('[PatternLockJsunit_0300] END');
      done();
    });

    it('PatternLockJsunit_0400', Level.LEVEL2, async (done: Function) => {
      // Modify the content of the message
      console.info('[PatternLockJsunit_0400] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'message',value:'hello world'})
      await CommonFunc.sleep(1000);
      // Verify the content of the message
      let driver = await UiDriver.create()
      let textComponent = await driver.findComponent(BY.key('text'));
      let text = await textComponent.getText();
      expect(text).assertEqual('hello world');
      console.info('[PatternLockJsunit_0400] END');
      done();
    }); 

    it('PatternLockJsunit_0500', Level.LEVEL2, async (done: Function) => {
      // Modify the sideLength value of the PatternLock component
      console.info('[PatternLockJsunit_0500] START');
      globalThis.value.message.notify({name:'sideLength',value:'400'})
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lock');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PatternLockJsunit_0500'] component obj is: " + JSON.stringify(obj));
      // Verify the sideLength value of the PatternLock component
      expect(obj.$attrs.sideLength).assertEqual('400.00vp');
      console.info('[PatternLockJsunit_0500] END');
      done();
    }); 

    it('PatternLockJsunit_0600', Level.LEVEL2, async (done: Function) => {
      // Modify the circleRadius value of the PatternLock component
      console.info('[PatternLockJsunit_0600] START');
      globalThis.value.message.notify({name:'circleRadius',value:'18'})
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lock');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PatternLockJsunit_0600'] component obj is: " + JSON.stringify(obj));
      // Verify the circleRadius value of the PatternLock component
      expect(obj.$attrs.circleRadius).assertEqual('18.00vp');
      console.info('[PatternLockJsunit_0600] END');
      done();
    }); 

    it('PatternLockJsunit_0700', Level.LEVEL2, async (done: Function) => {
      // Modify the regularColor value of the PatternLock component
      console.info('[PatternLockJsunit_0700] START');
      globalThis.value.message.notify({name:'regularColor',value:'#FF0000FF'})
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lock');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PatternLockJsunit_0700'] component obj is: " + JSON.stringify(obj));
      // Verify the regularColor value of the PatternLock component
      expect(obj.$attrs.regularColor).assertEqual('#FF0000FF');
      console.info('[PatternLockJsunit_0700] END');
      done();
    }); 

    it('PatternLockJsunit_0800', Level.LEVEL2, async (done: Function) => {
      // Modify the selectedColor value of the PatternLock component
      console.info('[PatternLockJsunit_0800] START');
      globalThis.value.message.notify({name:'selectedColor',value:'#FFFF0000'})
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lock');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PatternLockJsunit_0800'] component obj is: " + JSON.stringify(obj));
      // Verify the selectedColor value of the PatternLock component
      expect(obj.$attrs.selectedColor).assertEqual('#FFFF0000');
      console.info('[PatternLockJsunit_0800] END');
      done();
    }); 

    it('PatternLockJsunit_0900', Level.LEVEL2, async (done: Function) => {
      // Modify the activeColor value of the PatternLock component
      console.info('[PatternLockJsunit_0500] START');
      globalThis.value.message.notify({name:'activeColor',value:'#FFFF0000'})
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lock');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PatternLockJsunit_0500'] component obj is: " + JSON.stringify(obj));
      // Verify the activeColor value of the PatternLock component
      expect(obj.$attrs.activeColor).assertEqual('#FFFF0000');
      console.info('[PatternLockJsunit_0500] END');
      done();
    }); 

    it('PatternLockJsunit_1000', Level.LEVEL2, async (done: Function) => {
      // Modify the pathColor value of the PatternLock component
      console.info('[PatternLockJsunit_1000] START');
      globalThis.value.message.notify({name:'pathColor',value:'#FF0000FF'})
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lock');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PatternLockJsunit_1000'] component obj is: " + JSON.stringify(obj));
      // Verify the pathColor value of the PatternLock component
      expect(obj.$attrs.pathColor).assertEqual('#FF0000FF');
      console.info('[PatternLockJsunit_1000] END');
      done();
    }); 

    it('PatternLockJsunit_1100', Level.LEVEL2, async (done: Function) => {
      // Modify the pathStrokeWidth value of the PatternLock component
      console.info('[PatternLockJsunit_1100] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'pathStrokeWidth',value:'20'})
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('lock');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PatternLockJsunit_1100'] component obj is: " + JSON.stringify(obj));
      // Verify the pathStrokeWidth value of the PatternLock component
      expect(obj.$attrs.pathStrokeWidth).assertEqual('20.00vp');
      console.info('[PatternLockJsunit_1100] END');
      done();
    }); 

    it('PatternLockJsunit_1200', Level.LEVEL2, async (done: Function) => {
      // Modify the autoReset value of the PatternLock component
      console.info('[PatternLockJsunit_1200] START');
      globalThis.value.message.notify({name:'autoReset',value:false})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('lock');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PatternLockJsunit_1200'] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      // Verify the autoReset value of the PatternLock component
      expect(obj.$attrs.autoReset).assertEqual('false');
      console.info('[PatternLockJsunit_1200] END');
      done();
    }); 

    it('PatternLockJsunit_1300', Level.LEVEL2, async (done: Function) => {
      console.info('[PatternLockJsunit_1300] START');
      let strJson = getInspectorByKey('default');
      let obj: ESObject = JSON.parse(strJson);
      let newStrJson = getInspectorByKey('PatternLock');
      let newObj: ESObject = JSON.parse(newStrJson);
      expect(obj.$attrs.sideLength).assertEqual(newObj.$attrs.sideLength);
      expect(obj.$attrs.circleRadius).assertEqual(newObj.$attrs.circleRadius);
      expect(obj.$attrs.regularColor).assertEqual(newObj.$attrs.regularColor);
      expect(obj.$attrs.selectedColor).assertEqual(newObj.$attrs.selectedColor);
      expect(obj.$attrs.activeColor).assertEqual(newObj.$attrs.activeColor);
      expect(obj.$attrs.pathColor).assertEqual(newObj.$attrs.pathColor);
      expect(obj.$attrs.pathStrokeWidth).assertEqual(newObj.$attrs.pathStrokeWidth);
      expect(obj.$attrs.autoReset).assertEqual(newObj.$attrs.autoReset);
      console.info('[PatternLockJsunit_1300] END');
      done();
    });
  })
}

