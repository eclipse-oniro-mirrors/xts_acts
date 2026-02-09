/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextStyle() {
  describe('TextStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("TextStyle beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStyle state pages:" + JSON.stringify(pages));
        if (!("TextStyle" == pages.name)) {
          console.info("get  TextStyle pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Text/TextStyle"})
          await CommonFunc.sleep(2000);
          console.info("push TextStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextStyle page error:" + err);
      }
      console.info("TextStyle foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextStyle after each called");
    });


    /**
     * @tc.name   TextStyle_001
     * @tc.number TextStyle_001
     * @tc.desc   TextStyle_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextStyle_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextStyle_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('getStyle'));
      await button1.click();
      console.info("TextStyle_001 click success");

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textStyle1');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextStyle_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('030#FF0000FF');
      console.info('[TextStyle_001] END');
      done();

    });


    /**
     * @tc.name   TextStyle_002
     * @tc.number TextStyle_002
     * @tc.desc   TextStyle_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextStyle_002',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextStyle_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('subStyledString'));
      await button1.click();
      console.info("TextStyle_002 click success");

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textStyle1');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextStyle_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('{}');
      console.info('[TextStyle_002] END');
      done();

    });


    /**
     * @tc.name   TextStyle_003
     * @tc.number TextStyle_003
     * @tc.desc   TextStyle_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextStyle_003',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextStyle_003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('replaceStyle'));
      await button1.click();
      console.info("TextStyle_003 click success");

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textStyle2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextStyle_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('030#FFFFC0CB');
      console.info('[TextStyle_003] END');
      done();

    });


    /**
     * @tc.name   TextStyle_004
     * @tc.number TextStyle_004
     * @tc.desc   TextStyle_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextStyle_004',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextStyle_004] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('replaceString'));
      await button1.click();
      console.info("TextStyle_004 click success");

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textStyle2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextStyle_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('030#FFFFC0CB');
      console.info('[TextStyle_004] END');
      done();

    });


    /**
     * @tc.name   TextStyle_005
     * @tc.number TextStyle_005
     * @tc.desc   TextStyle_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextStyle_005',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextStyle_005] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('insertString'));
      await button1.click();
      console.info("TextStyle_005 click success");

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textStyle2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextStyle_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('040#FFFFC0CB');
      console.info('[TextStyle_005] END');
      done();

    });


    /**
     * @tc.name   TextStyle_006
     * @tc.number TextStyle_006
     * @tc.desc   TextStyle_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextStyle_006',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextStyle_006] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('removeString'));
      await button1.click();
      console.info("TextStyle_006 click success");

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textStyle2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextStyle_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('030#FFFFC0CB');
      console.info('[TextStyle_006] END');
      done();

    });




  })
}
