'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';

export default function StackAttrsAlignContentTest() {
  describe('StackAttrsAlignContentTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("StackAttrsAlignContentTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.api14.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info('StackAttrsAlignContentTest startAbility completed');
    });

    beforeEach(async (): Promise<void> => {
      console.info("StackAttrsAlignContentTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/StackAttrsAlignContent",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get StackAttrsAlignContentTest state pages: " + JSON.stringify(pages));
        if (!("StackAttrsAlignContent" == pages.name)) {
          console.info("get StackAttrsAlignContentTest state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push StackAttrsAlignContentTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   Stack_Attrs_default_0100
     * @tc.name     Stack_Attrs_default_0100
     * @tc.desc     Test Stack with empty options (default alignment)
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Attrs_default_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Stack_Attrs_default_0100 START');
      let strJson: string = inspector.getInspectorByKey('stack_alignContent_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Stack_Attrs_default_0100] alignContent is: " + obj.getElement('$attrs').getString('alignContent'));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center');
      console.info('[Stack_Attrs_default_0100] END');
      done();
    });

    /**
     * @tc.number   Stack_Attrs_alignContent_Center_0100
     * @tc.name     Stack_Attrs_alignContent_Center_0100
     * @tc.desc     Test Stack alignContent property with Alignment.Center
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Attrs_alignContent_Center_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Stack_Attrs_alignContent_Center_0100 START');
      let strJson: string = inspector.getInspectorByKey('stack_alignContent_center');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Stack_Attrs_alignContent_Center_0100] alignContent is: " + obj.getElement('$attrs').getString('alignContent'));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center');
      console.info('[Stack_Attrs_alignContent_Center_0100] END');
      done();
    });

    /**
     * @tc.number   Stack_Attrs_alignContent_Top_0100
     * @tc.name     Stack_Attrs_alignContent_Top_0100
     * @tc.desc     Test Stack alignContent property with Alignment.Top
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Attrs_alignContent_Top_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Stack_Attrs_alignContent_Top_0100 START');
      let strJson: string = inspector.getInspectorByKey('stack_alignContent_top');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Stack_Attrs_alignContent_Top_0100] alignContent is: " + obj.getElement('$attrs').getString('alignContent'));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top');
      console.info('[Stack_Attrs_alignContent_Top_0100] END');
      done();
    });

    /**
     * @tc.number   Stack_Attrs_alignContent_Bottom_0100
     * @tc.name     Stack_Attrs_alignContent_Bottom_0100
     * @tc.desc     Test Stack alignContent property with Alignment.Bottom
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Attrs_alignContent_Bottom_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Stack_Attrs_alignContent_Bottom_0100 START');
      let strJson: string = inspector.getInspectorByKey('stack_alignContent_bottom');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Stack_Attrs_alignContent_Bottom_0100] alignContent is: " + obj.getElement('$attrs').getString('alignContent'));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
      console.info('[Stack_Attrs_alignContent_Bottom_0100] END');
      done();
    });

    /**
     * @tc.number   Stack_Attrs_alignContent_Start_0100
     * @tc.name     Stack_Attrs_alignContent_Start_0100
     * @tc.desc     Test Stack alignContent property with Alignment.Start
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Attrs_alignContent_Start_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Stack_Attrs_alignContent_Start_0100 START');
      let strJson: string = inspector.getInspectorByKey('stack_alignContent_start');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Stack_Attrs_alignContent_Start_0100] alignContent is: " + obj.getElement('$attrs').getString('alignContent'));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start');
      console.info('[Stack_Attrs_alignContent_Start_0100] END');
      done();
    });

    /**
     * @tc.number   Stack_Attrs_alignContent_End_0100
     * @tc.name     Stack_Attrs_alignContent_End_0100
     * @tc.desc     Test Stack alignContent property with Alignment.End
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Attrs_alignContent_End_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Stack_Attrs_alignContent_End_0100 START');
      let strJson: string = inspector.getInspectorByKey('stack_alignContent_end');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Stack_Attrs_alignContent_End_0100] alignContent is: " + obj.getElement('$attrs').getString('alignContent'));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End');
      console.info('[Stack_Attrs_alignContent_End_0100] END');
      done();
    });

    /**
     * @tc.number   Stack_Attrs_alignContent_TopStart_0100
     * @tc.name     Stack_Attrs_alignContent_TopStart_0100
     * @tc.desc     Test Stack alignContent property with Alignment.TopStart
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Attrs_alignContent_TopStart_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Stack_Attrs_alignContent_TopStart_0100 START');
      let strJson: string = inspector.getInspectorByKey('stack_alignContent_top_start');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Stack_Attrs_alignContent_TopStart_0100] alignContent is: " + obj.getElement('$attrs').getString('alignContent'));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart');
      console.info('[Stack_Attrs_alignContent_TopStart_0100] END');
      done();
    });

    /**
     * @tc.number   Stack_Attrs_alignContent_TopEnd_0100
     * @tc.name     Stack_Attrs_alignContent_TopEnd_0100
     * @tc.desc     Test Stack alignContent property with Alignment.TopEnd
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Attrs_alignContent_TopEnd_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Stack_Attrs_alignContent_TopEnd_0100 START');
      let strJson: string = inspector.getInspectorByKey('stack_alignContent_top_end');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Stack_Attrs_alignContent_TopEnd_0100] alignContent is: " + obj.getElement('$attrs').getString('alignContent'));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd');
      console.info('[Stack_Attrs_alignContent_TopEnd_0100] END');
      done();
    });

    /**
     * @tc.number   Stack_Attrs_alignContent_BottomStart_0100
     * @tc.name     Stack_Attrs_alignContent_BottomStart_0100
     * @tc.desc     Test Stack alignContent property with Alignment.BottomStart
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Attrs_alignContent_BottomStart_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Stack_Attrs_alignContent_BottomStart_0100 START');
      let strJson: string = inspector.getInspectorByKey('stack_alignContent_bottom_start');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Stack_Attrs_alignContent_BottomStart_0100] alignContent is: " + obj.getElement('$attrs').getString('alignContent'));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart');
      console.info('[Stack_Attrs_alignContent_BottomStart_0100] END');
      done();
    });

    /**
     * @tc.number   Stack_Attrs_alignContent_BottomEnd_0100
     * @tc.name     Stack_Attrs_alignContent_BottomEnd_0100
     * @tc.desc     Test Stack alignContent property with Alignment.BottomEnd
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Attrs_alignContent_BottomEnd_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Stack_Attrs_alignContent_BottomEnd_0100 START');
      let strJson: string = inspector.getInspectorByKey('stack_alignContent_bottom_end');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Stack_Attrs_alignContent_BottomEnd_0100] alignContent is: " + obj.getElement('$attrs').getString('alignContent'));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd');
      console.info('[Stack_Attrs_alignContent_BottomEnd_0100] END');
      done();
    });
  });
}