/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function setKeyProcessingModeTest() {
  describe('setKeyProcessingModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("setKeyProcessingModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/setKeyProcessingModeTest/setKeyProcessingModeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setKeyProcessingModeTest state pages:" + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("setKeyProcessingModeTest" == pages.name)) {
          console.info("get setKeyProcessingModeTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push setKeyProcessingModeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setKeyProcessingModeTest page error:" + err);
      }
      console.info("setKeyProcessingModeTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("setKeyProcessingModeTest after each called");
    });


    /**
     * @tc.number    setKeyProcessingModeTest_0100
     * @tc.name      setKeyProcessingModeTest_0100
     * @tc.desc      Test setKeyProcessingMode   FOCUS_NAVIGATION
     * @tc.level     Level 1
     * @tc.type      Function
     * @tc.size      MediumTest
     */
    it('setKeyProcessingModeTest_0100', 0, async (done: Function) => {
      console.info('setKeyProcessingModeTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('FOCUS_NAVIGATION'));
      await btn.click()
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let obj = getInspectorByKey('focus');
      let focus:string = JSON.parse(obj).$attrs.content;
      console.log('setKeyProcessingModeTest_0100---' + focus)
      expect(focus).assertEqual('Button3');
      console.info('setKeyProcessingModeTest_0100 END');
      done();
    });

    /**
     * @tc.number    setKeyProcessingModeTest_0200
     * @tc.name      setKeyProcessingModeTest_0200
     * @tc.desc      Test setKeyProcessingMode   ANCESTOR_EVENT
     * @tc.level     Level 1
     * @tc.type      Function
     * @tc.size      MediumTest
     */
    it('setKeyProcessingModeTest_0200', 0, async (done: Function) => {
      console.info('setKeyProcessingModeTest_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('ANCESTOR_EVENT'));
      await btn.click()
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let obj = getInspectorByKey('focus');
      let focus:string = JSON.parse(obj).$attrs.content;
      console.log('setKeyProcessingModeTest_0200---' + focus)
      expect(focus).assertEqual('Button1');
      console.info('setKeyProcessingModeTest_0200 END');
      done();
    });

    /**
     * @tc.number    setKeyProcessingModeTest_0300
     * @tc.name      setKeyProcessingModeTest_0300
     * @tc.desc      Test setKeyProcessingMode  undefined
     * @tc.level     Level 1
     * @tc.type      Function
     * @tc.size      MediumTest
     */
    it('setKeyProcessingModeTest_0300', 0, async (done: Function) => {
      console.info('setKeyProcessingModeTest_0300 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ANCESTOR_EVENT'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('undefined'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let obj = getInspectorByKey('focus');
      let focus:string = JSON.parse(obj).$attrs.content;
      console.log('setKeyProcessingModeTest_0300---' + focus)
      expect(focus).assertEqual('Button1');
      console.info('setKeyProcessingModeTest_0300 END');
      done();
    });
  })
}