/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
export default function TextControllerTest() {
  describe('TextControllerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextControllerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextControllerTest/TextControllerTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextControllerTest state pages:" + JSON.stringify(pages));
        if (!("TextControllerTest" == pages.name)) {
          console.info("get TextControllerTest state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push TextControllerTest success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextControllerTest page error:" + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextControllerTest_0100
     * @tc.number TextControllerTest_0100
     * @tc.desc   setTextSelection test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextControllerTest_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TextControllerTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('selectedTest'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strcontent = getInspectorByKey('selectedText');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('TextControllerTest_0100 component obj is: ' + obj);
      console.info('TextControllerTest_0100 component obj.$attrs.content is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('el');
      console.info('TextControllerTest_0100 END')
      done();
    });
/**
     * @tc.name   TextControllerTest_0200
     * @tc.number TextControllerTest_0200
     * @tc.desc   setTextSelection test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextControllerTest_0200', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TextControllerTest_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('selectedTest1'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strcontent = getInspectorByKey('selectedText1');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('TextControllerTest_0200 component obj is: ' + obj);
      console.info('TextControllerTest_0200 component obj.$attrs.content is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('ll');
      console.info('TextControllerTest_0200 END')
      done();
    });
    /**
     * @tc.name   TextControllerTest_0300
     * @tc.number TextControllerTest_0300
     * @tc.desc   setTextSelection test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextControllerTest_0300', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TextControllerTest_0300 START');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('selectedTest2'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strcontent = getInspectorByKey('selectedText2');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('TextControllerTest_0300 component obj is: ' + obj);
      console.info('TextControllerTest_0300 component obj.$attrs.content is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Wor');
      console.info('TextControllerTest_0300 END')
      done();
    });
  })
}