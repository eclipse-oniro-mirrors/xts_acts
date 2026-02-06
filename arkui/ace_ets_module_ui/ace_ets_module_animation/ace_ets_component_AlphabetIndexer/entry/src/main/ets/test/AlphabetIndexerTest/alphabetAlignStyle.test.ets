/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the License);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function alphabetAlignStyleTest() {
   describe('alphabetAlignStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("alphabetAlignStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/alphabetAlignStyle",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get alphabetAlignStyleTest state pages:" + JSON.stringify(pages));
        if (!("alphabetAlignStyle" == pages.name)) {
          console.info("get alphabetAlignStyleTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push alphabetAlignStyleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alphabetAlignStyleTest page error:" + err);
      }
      console.info("alphabetAlignStyleTest beforeEach end");
      done();
    });

    /**
     * @tc.name   testAlphabetAlignStyle_001
     * @tc.number testAlphabetAlignStyle_001
     * @tc.desc   test alphabet AlignStyle START.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAlphabetAlignStyle_001', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[testAlphabetAlignStyle_001]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let startBtn: Component = await driver.findComponent(ON.id('START'));
      await startBtn.click();
      console.log(`${testName} startBtn click`);
      await driver.delayMs(1000);
      let autoBtn: Component = await driver.findComponent(ON.id('Auto'));
      await autoBtn.click();
      console.log(`${testName} autoBtn click`);
      await driver.delayMs(1000);
      let autoBBtn: Component = await driver.findComponent(ON.text('B'));
      await autoBBtn.click();
      console.log(`${testName} autoBBtn click`);
      await driver.delayMs(1000);
      let autoBaiBtnList: Component[] =  await driver.findComponents(ON.text('白'));
      let autoBaiBtn: Component = autoBaiBtnList[autoBaiBtnList.length - 1];
      let autoRect = await autoBaiBtn.getBounds();
      console.log(`${testName} autoRect :${JSON.stringify(autoRect)}`);
      await driver.delayMs(1000);
      let rtlBtn: Component = await driver.findComponent(ON.id('Rtl'));
      await rtlBtn.click();
      console.log(`${testName} rtlBtn click`);
      await driver.delayMs(1000);
      let rtlBBtn: Component = await driver.findComponent(ON.text('B'));
      await rtlBBtn.click();
      console.log(`${testName} rtlBBtn click`);
      await driver.delayMs(1000);
      let rtlBaiBtnList: Component[] =  await driver.findComponents(ON.text('白'));
      let rtlBaiBtn: Component = rtlBaiBtnList[rtlBaiBtnList.length - 1];
      let rtlRect = await rtlBaiBtn.getBounds();
      console.log(`${testName} rtlRect :${JSON.stringify(rtlRect)}`);
      await driver.delayMs(1000);
      expect(autoRect.left === rtlRect.left).assertFalse();
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   testAlphabetAlignStyle_002
     * @tc.number testAlphabetAlignStyle_002
     * @tc.desc   test alphabet AlignStyle END.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAlphabetAlignStyle_002', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[testAlphabetAlignStyle_002]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let endBtn: Component = await driver.findComponent(ON.id('END'));
      await endBtn.click();
      console.log(`${testName} endBtn click`);
      await driver.delayMs(1000);
      let autoBtn: Component = await driver.findComponent(ON.id('Auto'));
      await autoBtn.click();
      console.log(`${testName} autoBtn click`);
      await driver.delayMs(1000);
      let autoBBtn: Component = await driver.findComponent(ON.text('B'));
      await autoBBtn.click();
      console.log(`${testName} autoBBtn click`);
      await driver.delayMs(1000);
      let autoBaiBtnList: Component[] =  await driver.findComponents(ON.text('白'));
      let autoBaiBtn: Component = autoBaiBtnList[autoBaiBtnList.length - 1];
      let autoRect = await autoBaiBtn.getBounds();
      console.log(`${testName} autoRect :${JSON.stringify(autoRect)}`);
      await driver.delayMs(1000);
      let rtlBtn: Component = await driver.findComponent(ON.id('Rtl'));
      await rtlBtn.click();
      console.log(`${testName} rtlBtn click`);
      await driver.delayMs(1000);
      let rtlBBtn: Component = await driver.findComponent(ON.text('B'));
      await rtlBBtn.click();
      console.log(`${testName} rtlBBtn click`);
      await driver.delayMs(1000);
      let rtlBaiBtnList: Component[] =  await driver.findComponents(ON.text('白'));
      let rtlBaiBtn: Component = rtlBaiBtnList[rtlBaiBtnList.length - 1];
      let rtlRect = await rtlBaiBtn.getBounds();
      console.log(`${testName} rtlRect :${JSON.stringify(rtlRect)}`);
      await driver.delayMs(1000);
      expect(autoRect.left === rtlRect.left).assertFalse();
      console.log(`${testName} end`);
      done();
    });
  })
}
