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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
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

export default function ListOffSet01Jsunit() {

  describe('ListOffSet01Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ListOffSet01Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/listOffSet01',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListOffSet01Jsunit state pages:" + JSON.stringify(pages));
        if (!("listOffSet01" == pages.name)) {
          console.info("get ListOffSet01Jsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ListOffSet01Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListOffSet01Jsunit page error:" + err);
      }
      console.info("ListOffSet01Jsunit beforeEach end");
      done();
    });

    /**
     * @tc.name   ListOffSet01Jsunit_0010
     * @tc.number ListOffSet01Jsunit_0010
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListOffSet01Jsunit_0010',  Level.LEVEL0, async (done: Function) => {
      console.info('[ListOffSet01Jsunit_0010] START');// end set -2
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_End_Negative2'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_Bottom'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ListoffSet01_Textend');
      console.info("[ListOffSet01Jsunit_0010] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parse(strJson).$attrs.content))-100)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0010] END');
      done();
    });

    /**
     * @tc.name   ListOffSet01Jsunit_0020
     * @tc.number ListOffSet01Jsunit_0020
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListOffSet01Jsunit_0020',  Level.LEVEL0, async (done: Function) => {
      console.info('[ListOffSet01Jsunit_0020] START');// end set 5
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_End5'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_Bottom'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ListoffSet01_Textend');
      console.info("[ListOffSet01Jsunit_0020] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parse(strJson).$attrs.content))-95)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0020] END');
      done();
    });

    /**
     * @tc.name   ListOffSet01Jsunit_0030
     * @tc.number ListOffSet01Jsunit_0030
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListOffSet01Jsunit_0030',  Level.LEVEL0, async (done: Function) => {
      console.info('[ListOffSet01Jsunit_0030] START');// end set 10,start set 10
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_End10'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_Start10'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('ListoffSet01_Top'));
      await btn3.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('ListoffSet01_Text01');
      console.info("[ListOffSet01Jsunit_0030] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(Math.abs(Math.round(Number(JSON.parse(strJson1).$attrs.content))-10)<=1).assertTrue();
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id('ListoffSet01_Bottom'));
      await btn4.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ListoffSet01_Textend');

      console.info("[ListOffSet01Jsunit_0030] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parse(strJson).$attrs.content))-90)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0030] END');
      done();
    });

    /**
     * @tc.name   ListOffSet01Jsunit_0040
     * @tc.number ListOffSet01Jsunit_0040
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListOffSet01Jsunit_0040',  Level.LEVEL0, async (done: Function) => {
      console.info('[ListOffSet01Jsunit_0040] START');// start set -2
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_Start_Negative2'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_Top'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ListoffSet01_Text01');

      console.info("[ListOffSet01Jsunit_0040] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parse(strJson).$attrs.content)))<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0040] END');
      done();
    });

    /**
     * @tc.name   ListOffSet01Jsunit_0050
     * @tc.number ListOffSet01Jsunit_0050
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListOffSet01Jsunit_0050',  Level.LEVEL0, async (done: Function) => {
      console.info('[ListOffSet01Jsunit_0050] START');// start set 5
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_Start5'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_Top'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ListoffSet01_Text01');
      console.info("[ListOffSet01Jsunit_0050] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parse(strJson).$attrs.content))-5)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0050] END');
      done();
    });

    /**
     * @tc.name   ListOffSet01Jsunit_0060
     * @tc.number ListOffSet01Jsunit_0060
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListOffSet01Jsunit_0060',  Level.LEVEL0, async (done: Function) => {
      // start set 5 , end set 0 , padding set 5
      console.info('[ListOffSet01Jsunit_0060] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_Start5'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_End0'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('ListoffSet01_Padding5'));
      await btn3.click();
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id('ListoffSet01_Top'));
      await btn4.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ListoffSet01_Text01');
      console.info("[ListOffSet01Jsunit_0060] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parse(strJson).$attrs.content))-10)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0060] END');
      done();
    });

    /**
     * @tc.name   ListOffSet01Jsunit_0070
     * @tc.number ListOffSet01Jsunit_0070
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListOffSet01Jsunit_0070',  Level.LEVEL0, async (done: Function) => {
      // start set 0 , end set 5 , padding set 5
      console.info('[ListOffSet01Jsunit_0070] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_Start0'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_End5'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('ListoffSet01_Padding5'));
      await btn3.click();
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id('ListoffSet01_Bottom'));
      await btn4.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ListoffSet01_Textend');
      console.info("[ListOffSet01Jsunit_0070] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parse(strJson).$attrs.content))-90)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0070] END');
      done();
    });

    /**
     * @tc.name   ListOffSet01Jsunit_0080
     * @tc.number ListOffSet01Jsunit_0080
     * @tc.desc   Test List components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListOffSet01Jsunit_0080',  Level.LEVEL0, async (done: Function) => {
      // start set 10 , end set 10 , padding set 0 , get currentOffset value
      console.info('[ListOffSet01Jsunit_0080] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_Start10'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_End10'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('ListoffSet01_Padding0'));
      await btn3.click();
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id('ListoffSet01_Top'));
      await btn4.click();
      await CommonFunc.sleep(1000);
      let btn5 = await driver.findComponent(ON.id('ListoffSet01_Get'));
      await btn5.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ListoffSet01_Text02');
      console.info("[ListOffSet01Jsunit_0080] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parse(strJson).$attrs.content))-(-10))<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0080] END');
      done();
    });
  })
}
