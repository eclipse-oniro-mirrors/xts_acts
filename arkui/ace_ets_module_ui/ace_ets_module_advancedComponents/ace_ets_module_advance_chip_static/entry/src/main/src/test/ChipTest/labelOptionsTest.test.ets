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

export default function labelOptionsTest() {
  describe('labelOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("labelOptionsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("labelOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Chip/labelOptionsTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get labelOptionsTest state pages:" + JSON.stringify(pages));
        if (!("labelOptionsTest" == pages.name)) {
          console.info("get labelOptionsTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push labelOptionsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push labelOptionsTest page error:" + err);
      }
      console.info("labelOptionsTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("labelOptionsTest after each called");
    });


    /**
     * @tc.number   labelOptionsTest_static_0010
     * @tc.name     labelOptionsTest_static_0010
     * @tc.desc     labelOptionsTest_static_0010
     * @tc.level    Level.LEVEL1
     */
    it('labelOptionsTest_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[labelOptionsTest_static_0010] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[labelOptionsTest_static_0010] btnElement content is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('content')));
      console.info("[labelOptionsTest_static_0010] btnElement fontSize is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontSize')));
      console.info("[labelOptionsTest_static_0010] btnElement fontColor is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontColor')));
      console.info("[labelOptionsTest_static_0010] btnElement fontFamily is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontFamily')));
      console.info("[labelOptionsTest_static_0010] btnElement margin is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('margin')));

      expect(btnElement.getElement('$attrs').getString('content')).assertEqual("label1");
      expect(btnElement.getElement('$attrs').getString('fontSize')).assertEqual("12.00fp");
      expect(btnElement.getElement('$attrs').getString('fontColor')).assertEqual("#FF0000FF");
      expect(btnElement.getElement('$attrs').getString('fontFamily')).assertEqual("HarmonyOS Sans");
      let margin = JSON.parseJsonElement(btnElement.getElement('$attrs').getString('margin'))
      expect(margin.getString('top')).assertEqual("0.00vp");
      expect(margin.getString('right')).assertEqual("30.00vp");
      expect(margin.getString('bottom')).assertEqual("0.00vp");
      expect(margin.getString('left')).assertEqual("20.00vp");
      console.info('[labelOptionsTest_static_0010] END');
      done();
    });

    /**
     * @tc.number   labelOptionsTest_static_0020
     * @tc.name     labelOptionsTest_static_0020
     * @tc.desc     labelOptionsTest_static_0020
     * @tc.level    Level.LEVEL1
     */
    it('labelOptionsTest_static_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[labelOptionsTest_static_002] START');
      await CommonFunc.sleep(1000);
      let btnElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[labelOptionsTest_static_0020] btnElement content is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('content')));
      console.info("[labelOptionsTest_static_0020] btnElement fontSize is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontSize')));
      console.info("[labelOptionsTest_static_0020] btnElement fontColor is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontColor')));
      console.info("[labelOptionsTest_static_0020] btnElement fontFamily is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontFamily')));
      console.info("[labelOptionsTest_static_0020] btnElement margin is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('margin')));

      let unElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[labelOptionsTest_static_0020] unElement content is: " +
      JSON.stringify(unElement.getElement('$attrs').getString('content')));
      console.info("[labelOptionsTest_static_0020] unElement fontSize is: " +
      JSON.stringify(unElement.getElement('$attrs').getString('fontSize')));
      console.info("[labelOptionsTest_static_0020] unElement fontColor is: " +
      JSON.stringify(unElement.getElement('$attrs').getString('fontColor')));
      console.info("[labelOptionsTest_static_0020] unElement fontFamily is: " +
      JSON.stringify(unElement.getElement('$attrs').getString('fontFamily')));
      console.info("[labelOptionsTest_static_0020] unElement margin is: " +
      JSON.stringify(unElement.getElement('$attrs').getString('margin')));

      expect(btnElement.getElement('$attrs').getString('content')).assertEqual("label2");
      expect(unElement.getElement('$attrs').getString('content')).assertEqual("label3");
      expect(btnElement.getElement('$attrs').getString('fontSize'))
        .assertEqual(unElement.getElement('$attrs').getString('fontSize'));
      expect(btnElement.getElement('$attrs').getString('fontColor'))
        .assertEqual(unElement.getElement('$attrs').getString('fontColor'));
      expect(btnElement.getElement('$attrs').getString('fontFamily'))
        .assertEqual(unElement.getElement('$attrs').getString('fontFamily'));

      let margin1 = JSON.parseJsonElement(btnElement.getElement('$attrs').getString('margin'))
      let marginUn = JSON.parseJsonElement(unElement.getElement('$attrs').getString('margin'))
      expect(margin1.getString('top')).assertEqual("0.00vp");
      expect(margin1.getString('bottom')).assertEqual("0.00vp");
      expect(margin1.getString('right')).assertEqual(marginUn.getString('right'));
      expect(margin1.getString('left')).assertEqual(marginUn.getString('left'));
      console.info('[labelOptionsTest_static_002] END');
      done();
    });

  })
}