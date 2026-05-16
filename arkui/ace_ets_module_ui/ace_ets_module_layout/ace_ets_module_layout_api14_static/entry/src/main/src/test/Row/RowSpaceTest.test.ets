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

export default function RowSpaceTest() {
  describe('RowSpaceTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("RowSpaceTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.api14.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info('RowSpaceTest startAbility completed');
    });

    beforeEach(async (): Promise<void> => {
      console.info("RowSpaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/RowSpace",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get RowSpaceTest state pages: " + JSON.stringify(pages));
        if (!("RowSpace" == pages.name)) {
          console.info("get RowSpaceTest state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RowSpaceTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   Row_default_0100
     * @tc.name     Row_default_0100
     * @tc.desc     Test Row with empty options (default behavior)
     * @tc.level    Level.LEVEL0
     */
    it('Row_default_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Row_default_0100 START');
      let strJson: string = inspector.getInspectorByKey('row_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Row_default_0100] alignContent is: " + obj.getElement('$attrs').getString('space'));
      expect(obj.getElement('$attrs').getString('space')).assertEqual('0.00px');
      console.info('[Row_default_0100] END');
      done();
    });

    /**
     * @tc.number   Row_space_number_0100
     * @tc.name     Row_space_number_0100
     * @tc.desc     Test Row with space = 10 (number type)
     * @tc.level    Level.LEVEL0
     */
    it('Row_space_number_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Row_space_number_0100 START');
      let strJson: string = inspector.getInspectorByKey('row_space_10');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Row_space_empty_0100] alignContent is: " + obj.getElement('$attrs').getString('space'));
      expect(obj.getElement('$attrs').getString('space')).assertEqual('10.00vp');
      console.info('[Row_space_number_0100] END');
      done();
    });

    /**
     * @tc.number   Row_space_string_0100
     * @tc.name     Row_space_string_0100
     * @tc.desc     Test Row with space = '20' (string type)
     * @tc.level    Level.LEVEL0
     */
    it('Row_space_string_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Row_space_string_0100 START');
      let strJson: string = inspector.getInspectorByKey('row_space_20');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Row_space_empty_0100] alignContent is: " + obj.getElement('$attrs').getString('space'));
      expect(obj.getElement('$attrs').getString('space')).assertEqual('20.00vp');
      console.info('[Row_space_string_0100] END');
      done();
    });

    /**
     * @tc.number   Row_space_empty_0100
     * @tc.name     Row_space_empty_0100
     * @tc.desc     Test Row with space = '' (empty string)
     * @tc.level    Level.LEVEL0
     */
    it('Row_space_empty_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Row_space_empty_0100 START');
      let strJson: string = inspector.getInspectorByKey('row_space_empty');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Row_space_empty_0100] alignContent is: " + obj.getElement('$attrs').getString('space'));
      expect(obj.getElement('$attrs').getString('space')).assertEqual('0.00vp');
      console.info('[Row_space_empty_0100] END');
      done();
    });
  });
}