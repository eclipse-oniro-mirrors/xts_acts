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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function monitorInvisibleAreaTest() {
    describe('monitorInvisibleAreaTest', () => {
      beforeEach(async (done: Function) => {
        console.info("monitorInvisibleAreaTest beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/ImageAnimator/monitorInvisibleArea',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get monitorInvisibleAreaTest state pages: " + JSON.stringify(pages));
          if (!("monitorInvisibleArea" == pages.name)) {
            console.info("get monitorInvisibleAreaTest state pages.name: " + JSON.stringify(pages.name));
            let result = await router.push(options);
            console.info("push monitorInvisibleAreaTest page result: " + JSON.stringify(result));
            await CommonFunc.sleep(2000);
          }
        } catch (err) {
          console.error("push monitorInvisibleAreaTest page error: " + err);
          expect().assertFail();
        }
        done();
      });

    /*
     * @tc.number       monitorInvisibleAreaTest_001
     * @tc.name         monitorInvisibleAreaTest_001
     * @tc.desic        monitorInvisibleArea(monitorInvisibleArea: boolean):true
     */
    it('monitorInvisibleAreaTest_001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_001 START');
      await CommonFunc.sleep(5000);
      let btnTrue = await driver.findComponent(ON.id('trueFlag'));
      await btnTrue.click()
      await CommonFunc.sleep(2000);

      let scroll = await driver.findComponent(ON.id('scrollFlag'));
      let rect = await scroll.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;

      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25)
      );
      await CommonFunc.sleep(6000);

      let strJson = getInspectorByKey('ImageAnimatorFlag');
      console.info("[monitorInvisibleAreaTest_001] component strJson is: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[monitorInvisibleAreaTest_001] component obj is: " + JSON.stringify(obj.$attrs));
      console.info("[monitorInvisibleAreaTest_001] component obj monitorInvisibleArea is: " + JSON.stringify(obj.$attrs.monitorInvisibleArea));
      expect(obj.$attrs.monitorInvisibleArea).assertEqual('true');

      let textStrJson = await driver.findComponent(ON.id('textFlag'));
      let text = await textStrJson.getText();
      console.info("[monitorInvisibleAreaTest_001] text: " + JSON.stringify(text));
      expect(text).assertEqual('Pause');
      console.info("[monitorInvisibleAreaTest_001] end");
      done();
    });

    /*
     * @tc.number       monitorInvisibleAreaTest_002
     * @tc.name         monitorInvisibleAreaTest_002
     * @tc.desic        monitorInvisibleArea(monitorInvisibleArea: boolean):false
     */
    it('monitorInvisibleAreaTest_002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_002 START');
      await CommonFunc.sleep(2000);
      let scroll = await driver.findComponent(ON.id('scrollFlag'));
      let rect = await scroll.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
     
      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75)
      );
      await CommonFunc.sleep(6000);

      let btnFalse = await driver.findComponent(ON.id('falseFlag'));
      await btnFalse.click()
      await CommonFunc.sleep(2000);
      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25)
      );
      await CommonFunc.sleep(6000);

      let strJson = getInspectorByKey('ImageAnimatorFlag');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[monitorInvisibleAreaTest_002] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.monitorInvisibleArea).assertEqual('false');

      let textStrJson = await driver.findComponent(ON.id('textFlag'));
      let text = await textStrJson.getText();
      console.info("[monitorInvisibleAreaTest_002] text: " + JSON.stringify(text));
      expect(text).assertEqual('Start');
      console.info("[monitorInvisibleAreaTest_002] end");
      done();
    });

    /*
     * @tc.number       monitorInvisibleAreaTest_003
     * @tc.name         monitorInvisibleAreaTest_003
     * @tc.desic        monitorInvisibleArea(monitorInvisibleArea: boolean):undefined
     */
    it('monitorInvisibleAreaTest_003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_003 START');
      await CommonFunc.sleep(2000);
      let scroll = await driver.findComponent(ON.id('scrollFlag'));
      let rect = await scroll.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      
      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75)
      );
      await CommonFunc.sleep(6000);

      let btnUndefined = await driver.findComponent(ON.id('undefinedFlag'));
      await btnUndefined.click()
      await CommonFunc.sleep(2000);
      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25)
      );
      await CommonFunc.sleep(6000);
      let strJson = getInspectorByKey('ImageAnimatorFlag');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[monitorInvisibleAreaTest_003] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.monitorInvisibleArea).assertEqual('false');

      let textStrJson = await driver.findComponent(ON.id('textFlag'));
      let text = await textStrJson.getText();
      console.info("[monitorInvisibleAreaTest_003] text: " + JSON.stringify(text));
      expect(text).assertEqual('Start');
      console.info("[monitorInvisibleAreaTest_003] end");
      done();
    });

    /*
     * @tc.number       monitorInvisibleAreaTest_004
     * @tc.name         monitorInvisibleAreaTest_004
     * @tc.desic        monitorInvisibleArea(monitorInvisibleArea: boolean):null
     */
    it('monitorInvisibleAreaTest_004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('monitorInvisibleAreaTest_004 START');
      await CommonFunc.sleep(2000);
      let scroll = await driver.findComponent(ON.id('scrollFlag'));
      let rect = await scroll.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      let middle = (top + bottom) / 2

      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75)
      );
      await CommonFunc.sleep(6000);

      let btnNull = await driver.findComponent(ON.id('nullFlag'));
      await btnNull.click()
      await CommonFunc.sleep(2000);
      await driver.swipe(
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.75),
        Math.round(left + (right - left) * 0.5),
        Math.round(top + (bottom - top) * 0.25)
      );
      await CommonFunc.sleep(6000);
      let strJson = getInspectorByKey('ImageAnimatorFlag');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[monitorInvisibleAreaTest_004] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.monitorInvisibleArea).assertEqual('false');

      let textStrJson = await driver.findComponent(ON.id('textFlag'));
      let text = await textStrJson.getText();
      console.info("[monitorInvisibleAreaTest_004] text: " + JSON.stringify(text));
      expect(text).assertEqual('Start');
      console.info("[monitorInvisibleAreaTest_004] end");
      done();
    });
  })
}
