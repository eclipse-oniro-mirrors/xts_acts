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
export default function TextInputEllipsisModeTest() {
  describe('TextInputEllipsisModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputEllipsisModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EllipsisModeTest/TextInputEllipsisModeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputEllipsisModeTest state pages:" + JSON.stringify(pages));
        if (!("TextInputEllipsisModeTest" == pages.name)) {
          console.info("get TextInputEllipsisModeTest state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push TextInputEllipsisModeTest success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputEllipsisModeTest page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   TextInputEllipsisModeTest_0100
     * @tc.number TextInputEllipsisModeTest_0100
     * @tc.desc   TextInputEllipsisModeTest_0100 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputEllipsisModeTest_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TextInputEllipsisModeTest_0100 START');
      let driver = Driver.create();
        console.info('TextInputEllipsisModeTest_0100 START');
        await CommonFunc.sleep(1000);
        let textInput1 = getInspectorByKey('textInput1');
        let obj:ESObject= JSON.parse(textInput1);
        console.log('TextInputEllipsisModeTest_0100---' + obj.$attrs.ellipsisMode)
        expect(obj.$attrs.ellipsisMode).assertEqual("EllipsisMode.MULTILINE_START");
        console.info("[TextInputEllipsisModeTest_0100] end");
      done();
    });
    /**
     * @tc.name   TextInputEllipsisModeTest_0200
     * @tc.number TextInputEllipsisModeTest_0200
     * @tc.desc   TextInputEllipsisModeTest_0200 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputEllipsisModeTest_0200', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TextInputEllipsisModeTest_0200 START');
      let driver = Driver.create();
        console.info('TextInputEllipsisModeTest_0200 START');
        await CommonFunc.sleep(1000);
        let textInput2 = getInspectorByKey('textInput2');
        let obj:ESObject= JSON.parse(textInput2);
        console.log('TextInputEllipsisModeTest_0200---' + obj.$attrs.ellipsisMode)
        expect(obj.$attrs.ellipsisMode).assertEqual("EllipsisMode.MULTILINE_CENTER");
        console.info("[TextInputEllipsisModeTest_0200] end");
      done();
    });
    /**
     * @tc.name   TextInputEllipsisModeTest_0300
     * @tc.number TextInputEllipsisModeTest_0300
     * @tc.desc   TextInputEllipsisModeTest_0300 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputEllipsisModeTest_0300', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TextInputEllipsisModeTest_0300 START');
      let driver = Driver.create();
        console.info('TextInputEllipsisModeTest_0300 START');
        await CommonFunc.sleep(1000);
        let textInput3 = getInspectorByKey('textInput3');
        let obj:ESObject= JSON.parse(textInput3);
        console.log('TextInputEllipsisModeTest_0300---' + obj.$attrs.ellipsisMode)
        expect(obj.$attrs.ellipsisMode).assertEqual("EllipsisMode.END");
        console.info("[TextInputEllipsisModeTest_0300] end");
      done();
    });
  })
}