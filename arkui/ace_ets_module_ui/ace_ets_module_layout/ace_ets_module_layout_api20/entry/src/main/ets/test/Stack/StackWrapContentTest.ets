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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function StackWrapContentTest() {
  describe('StackWrapContentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StackWrapContentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackWrapContent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackWrapContentTest state pages:" + JSON.stringify(pages));
        if (!("StackWrapContentTest" == pages.name)) {
          console.info("get StackWrapContentTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StackWrapContentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackWrapContentTest page error:" + err);
      }
      console.info("StackWrapContentTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    
     /**
      * @tc.name   StackWrapContentTest_0100
      * @tc.number StackWrapContentTest_0100
      * @tc.desc   StackWrapContentTest_0100
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('StackWrapContentTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[StackWrapContentTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let Stack_Actual1: RectValue = CommonFunc.getComponentRect('StackWrapContent1');
      let Stack_Actual_Width1 = Stack_Actual1.right - Stack_Actual1.left;
      let Stack_Actual_Height1 = Stack_Actual1.bottom - Stack_Actual1.top;
      let strJson1 = getInspectorByKey('StackWrapContent1');

      console.info('Stack_Actual_Width1:' + JSON.stringify(Stack_Actual_Width1));
      console.info('Stack_Actual_Height1:' + JSON.stringify(Stack_Actual_Height1));
      console.info('Stack_width1:' + JSON.stringify(JSON.parse(strJson1).$attrs.width));
      console.info('Stack_height1:' + JSON.stringify(JSON.parse(strJson1).$attrs.height));

      let button = await driver.findComponent(ON.id('StackButton1'));
      await button.click();
      await Utils.sleep(2000)

      let Stack_Actual2: RectValue = CommonFunc.getComponentRect('StackWrapContent1');
      let Stack_Actual_Width2 = Stack_Actual2.right - Stack_Actual2.left;
      let Stack_Actual_Height2 = Stack_Actual2.bottom - Stack_Actual2.top;
      let strJson2 = getInspectorByKey('StackWrapContent1');

      console.info('Stack_Actual_Width2:' + JSON.stringify(Stack_Actual_Width2));
      console.info('Stack_Actual_Height2:' + JSON.stringify(Stack_Actual_Height2));
      console.info('Stack_width2:' + JSON.stringify(JSON.parse(strJson2).$attrs.width));
      console.info('Stack_height2:' + JSON.stringify(JSON.parse(strJson2).$attrs.height));

      expect(Math.floor(Math.abs(Stack_Actual_Width1 - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Stack_Actual_Height1 - vp2px(50))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(Stack_Actual_Width2 - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Stack_Actual_Height2 - vp2px(100))) <= 1).assertTrue();


      console.info('[StackWrapContentTest_0100] END');
      done();
    });


  })
}