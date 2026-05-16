'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Color, FontWeight, $r, Resource } from '@ohos.arkui.component'

export default function chipSizeTest() {
  describe('chipSizeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("chipSizeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("chipSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Chip/chipSizeTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get chipSizeTest state pages:" + JSON.stringify(pages));
        if (!("chipSizeTest" == pages.name)) {
          console.info("get chipSizeTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push chipSizeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push chipSizeTest page error:" + err);
      }
      console.info("chipSizeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("chipSizeTest after each called");
    });

    
    /**
     * @tc.number   chipSizeTest_static_0010
     * @tc.name     chipSizeTest_static_0010
     * @tc.desc     chipSizeTest_static_0010
     * @tc.level    Level.LEVEL1
     */
    it('chipSizeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[chipSizeTest_static_0010] START');
      await CommonFunc.sleep(1000);

      let btnElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]

      let unElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]

      console.info("[chipSizeTest_static_0010] btnElement constraintSize is: " +
        JSON.stringify(btnElement.getElement('$attrs').getString('constraintSize')));
      console.info("[chipSizeTest_static_0010] unElement constraintSize is: " +
        JSON.stringify(unElement.getElement('$attrs').getString('constraintSize')));

      let constraintSize1 = JSON.parseJsonElement(btnElement.getElement('$attrs').getString('constraintSize'))
      let constraintSizeUn = JSON.parseJsonElement(unElement.getElement('$attrs').getString('constraintSize'))
      
      expect(constraintSize1.getString('minWidth')).assertEqual(constraintSizeUn.getString('minWidth'));
      expect(constraintSize1.getString('maxWidth')).assertEqual(constraintSizeUn.getString('maxWidth'));
      expect(constraintSize1.getString('minHeight')).assertEqual(constraintSizeUn.getString('minHeight'));
      expect(constraintSize1.getString('maxHeight')).assertEqual(constraintSizeUn.getString('maxHeight'));
      console.info('[chipSizeTest_static_0010] END');
      done();
    });
    
    /**
     * @tc.number   chipSizeTest_static_0020
     * @tc.name     chipSizeTest_static_0020
     * @tc.desc     chipSizeTest_static_0020
     * @tc.level    Level.LEVEL1
     */
    it('chipSizeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[chipSizeTest_static_0020] START');
      await CommonFunc.sleep(1000);

      let btnElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]

      let unElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]

      console.info("[chipSizeTest_static_0020] btnElement constraintSize is: " +
        JSON.stringify(btnElement.getElement('$attrs').getString('constraintSize')));
      console.info("[chipSizeTest_static_0020] unElement constraintSize is: " +
        JSON.stringify(unElement.getElement('$attrs').getString('constraintSize')));

      let constraintSize1 = JSON.parseJsonElement(btnElement.getElement('$attrs').getString('constraintSize'))
      let constraintSizeUn = JSON.parseJsonElement(unElement.getElement('$attrs').getString('constraintSize'))
      
      expect(constraintSize1.getString('minWidth')).assertEqual(constraintSizeUn.getString('minWidth'));
      expect(constraintSize1.getString('maxWidth')).assertEqual(constraintSizeUn.getString('maxWidth'));
      expect(constraintSize1.getString('maxHeight')).assertEqual(constraintSizeUn.getString('maxHeight'));
      console.info('[chipSizeTest_static_0020] END');
      done();
    });

  })
}