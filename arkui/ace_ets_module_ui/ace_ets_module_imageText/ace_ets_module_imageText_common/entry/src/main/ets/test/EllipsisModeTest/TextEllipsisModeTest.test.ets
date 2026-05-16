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
export default function TextEllipsisModeTest() {
  describe('TextEllipsisModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextEllipsisModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EllipsisModeTest/TextEllipsisModeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextEllipsisModeTest state pages:" + JSON.stringify(pages));
        if (!("TextEllipsisModeTest" == pages.name)) {
          console.info("get TextEllipsisModeTest state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push TextEllipsisModeTest success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextEllipsisModeTest page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   TextEllipsisModeTest_0100
     * @tc.number TextEllipsisModeTest_0100
     * @tc.desc   TextEllipsisModeTest_0100 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextEllipsisModeTest_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TextEllipsisModeTest_0100 START');
      let driver = Driver.create();
        console.info('TextEllipsisModeTest_0100 START');
        await CommonFunc.sleep(1000);
        let test1 = getInspectorByKey('test1');
        let obj:ESObject= JSON.parse(test1);
        console.log('TextEllipsisModeTest_0100---' + obj.$attrs.ellipsisMode)
        expect(obj.$attrs.ellipsisMode).assertEqual("EllipsisMode.MULTILINE_START");
        console.info("[TextEllipsisModeTest_0100] end");
      done();
    });
    /**
     * @tc.name   TextEllipsisModeTest_0200
     * @tc.number TextEllipsisModeTest_0200
     * @tc.desc   TextEllipsisModeTest_0200 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextEllipsisModeTest_0200', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TextEllipsisModeTest_0200 START');
      let driver = Driver.create();
        console.info('TextEllipsisModeTest_0200 START');
        await CommonFunc.sleep(1000);
        let text2 = getInspectorByKey('text2');
        let obj:ESObject= JSON.parse(text2);
        console.log('TextEllipsisModeTest_0200---' + obj.$attrs.ellipsisMode)
        expect(obj.$attrs.ellipsisMode).assertEqual("EllipsisMode.MULTILINE_CENTER");
        console.info("[TextEllipsisModeTest_0200] end");
      done();
    });
    /**
     * @tc.name   TextEllipsisModeTest_0300
     * @tc.number TextEllipsisModeTest_0300
     * @tc.desc   TextEllipsisModeTest_0300 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextEllipsisModeTest_0300', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TextEllipsisModeTest_0300 START');
      let driver = Driver.create();
        console.info('TextEllipsisModeTest_0300 START');
        await CommonFunc.sleep(1000);
        let text3 = getInspectorByKey('text3');
        let obj:ESObject= JSON.parse(text3);
        console.log('TextEllipsisModeTest_0300---' + obj.$attrs.ellipsisMode)
        expect(obj.$attrs.ellipsisMode).assertEqual("undefined");
        console.info("[TextAreaEllipsisModeTest_0300] end");
      done();
    });
  })
}