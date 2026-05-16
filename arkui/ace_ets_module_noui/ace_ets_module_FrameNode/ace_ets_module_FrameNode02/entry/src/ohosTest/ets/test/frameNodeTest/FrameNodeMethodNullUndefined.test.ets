/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function FrameNodeMethodNullUndefinedTest() {
  describe('FrameNodeMethodNullUndefinedTest', () => {
    
    beforeEach(async (done: Function) => {
      console.info('FrameNodeMethodNullUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/FrameNodeMethodNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get FrameNodeMethodNullUndefined state pages:' + JSON.stringify(pages));
        if (!('FrameNodeMethodNullUndefined' == pages.name)) {
          console.info('get FrameNodeMethodNullUndefined pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(1000);
          console.info('push FrameNodeMethodNullUndefined page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push FrameNodeMethodNullUndefined page error:' + err);
      }
      console.info('FrameNodeMethodNullUndefined beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('FrameNodeMethodNullUndefined after each called');
    });

    /**
     * @tc.name   FrameNodeMethodNullUndefinedTest_0100
     * @tc.number FrameNodeMethodNullUndefinedTest_0100
     * @tc.desc   test appendChild with null/undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FrameNodeMethodNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeMethodNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('FrameNodeMethodNullUndefinedTest_0100 Check appendChild(null)');
      let btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_appendChild_1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getChildNumber'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_1');
 	    let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0100] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('1');
 	    
      console.info('FrameNodeMethodNullUndefinedTest_0100 Check appendChild(undefined)');
      btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_appendChild_2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getChildNumber'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_1');
      obj = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0100] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('1');

      console.info('[FrameNodeMethodNullUndefinedTest_0100] END');
      done();
    });

    /**
     * @tc.name   FrameNodeMethodNullUndefinedTest_0200
     * @tc.number FrameNodeMethodNullUndefinedTest_0200
     * @tc.desc   test insertChildAfter parameter 1 with null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FrameNodeMethodNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeMethodNullUndefinedTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('FrameNodeMethodNullUndefinedTest_0200 Check insertChildAfter(null, childNode)');
      let btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_insertChildAfter_1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getChildNumber'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_1');
 	    let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0200] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('1');
 	    
      console.info('FrameNodeMethodNullUndefinedTest_0200 Check insertChildAfter(undefined, childNode)');
      btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_insertChildAfter_2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getChildNumber'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_1');
      obj = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0200] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('1');

      console.info('[FrameNodeMethodNullUndefinedTest_0200] END');
      done();
    });

    /**
     * @tc.name   FrameNodeMethodNullUndefinedTest_0300
     * @tc.number FrameNodeMethodNullUndefinedTest_0300
     * @tc.desc   test insertChildAfter parameter 2 with null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FrameNodeMethodNullUndefinedTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeMethodNullUndefinedTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('FrameNodeMethodNullUndefinedTest_0300 Check insertChildAfter(insertNode, null)');
      let btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_insertChildAfter_3'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getChildNumber'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_1');
 	    let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0300] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('2');
 	    
      console.info('FrameNodeMethodNullUndefinedTest_0300 Check insertChildAfter(insertNode, undefined)');
      btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_insertChildAfter_4'));
      await btn.click();
      await CommonFunc.sleep(1000);

      btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getChildNumber'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_1');
      obj = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0300] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('3');

      console.info('[FrameNodeMethodNullUndefinedTest_0300] END');
      done();
    });

    /**
     * @tc.name   FrameNodeMethodNullUndefinedTest_0400
     * @tc.number FrameNodeMethodNullUndefinedTest_0400
     * @tc.desc   test removeChild with null/undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FrameNodeMethodNullUndefinedTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeMethodNullUndefinedTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('FrameNodeMethodNullUndefinedTest_0400 Check removeChild(null)');
      let btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_appendChild_1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getChildNumber'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_1');
 	    let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0400] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('1');
 	    
      console.info('FrameNodeMethodNullUndefinedTest_0400 Check removeChild(undefined)');
      btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_appendChild_2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getChildNumber'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_1');
      obj = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0400] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('1');

      console.info('[FrameNodeMethodNullUndefinedTest_0400] END');
      done();
    });

    /**
     * @tc.name   FrameNodeMethodNullUndefinedTest_0500
     * @tc.number FrameNodeMethodNullUndefinedTest_0500
     * @tc.desc   test moveTo parameter 1 with null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FrameNodeMethodNullUndefinedTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeMethodNullUndefinedTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('FrameNodeMethodNullUndefinedTest_0500 Check moveTo(null, 0)');
      let btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_moveTo_1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getFrameNodeChildId'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_3');
 	    let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0500] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('stackNodeTest');
 	    
      console.info('FrameNodeMethodNullUndefinedTest_0500 Check moveTo(undefined, 0)');
      btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_moveTo_2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getFrameNodeChildId'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_3');
      obj = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0500] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('stackNodeTest');

      console.info('[FrameNodeMethodNullUndefinedTest_0500] END');
      done();
    });

    /**
     * @tc.name   FrameNodeMethodNullUndefinedTest_0600
     * @tc.number FrameNodeMethodNullUndefinedTest_0600
     * @tc.desc   test moveTo parameter 2 with null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FrameNodeMethodNullUndefinedTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('FrameNodeMethodNullUndefinedTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('FrameNodeMethodNullUndefinedTest_0600 Check moveTo(rootNode, null)');
      let btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_moveTo_3'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getFrameNodeChildId'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_3');
 	    let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0600] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('rowNodeTest');
 	    
      console.info('FrameNodeMethodNullUndefinedTest_0600 Check moveTo(rootNode, undefined)');
      btn = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_moveTo_4'));
      await btn.click();
      await CommonFunc.sleep(1000);

      btn2 = await driver.findComponent(ON.id('FrameNodeMethodNullUndefinedTest_getFrameNodeChildId'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('FrameNodeMethodNullUndefinedTest_text_3');
      obj = JSON.parse(strJson);
      console.info('[FrameNodeMethodNullUndefinedTest_0600] obj.$attrs.content:' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('rowNodeTest');

      console.info('[FrameNodeMethodNullUndefinedTest_0600] END');
      done();
    });
  })
}