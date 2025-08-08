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

import { describe, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';

export default function checkBoxGroupTest() {
  describe('checkBoxGroupTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/checkBoxGroup",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CheckBoxGroup state success " + JSON.stringify(pages));
        if (!("checkBoxGroup" == pages.name)) {
          console.info("get CheckBoxGroup state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await Utils.sleep(2000);
          console.info("push CheckBoxGroup page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CheckBoxGroup page error " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000
     * @tc.name Test the properties of components
     * @tc.desc Set mark values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_CheckboxGroup_1000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info('ArkUX_Stage_CheckboxGroup_1000 START');
        let strJson = getInspectorByKey('checkboxNO');
        console.info('ArkUX_Stage_CheckboxGroup_1000 START  :' + JSON.stringify(strJson));
        expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeWidth).assertEqual("15.00vp");
        expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual("10.00vp");
        expect(JSON.parse(JSON.parse(strJson).$attrs.mark).strokeColor).assertEqual('#FFFF00FF');
        console.info('ArkUX_Stage_CheckboxGroup_1000 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_CheckboxGroup_1000 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1001
     * @tc.name Test the properties of components
     * @tc.desc Set unselectedColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1001', Level.LEVEL0, async (done: Function) => {
      try {
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1001 START');
        let strJson = getInspectorByKey('checkboxNO');
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1001 START  :' + JSON.stringify(strJson));
        expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual('#FF123456');
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1001 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1001 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002
     * @tc.name Test the properties of components
     * @tc.desc Set selectAll values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002 START');
      let strJson = getInspectorByKey('checkboxNO');
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002 START  :' + JSON.stringify(strJson));
      expect(JSON.parse(strJson).$attrs.selectAll).assertEqual('false');
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1002 END ');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003
     * @tc.name Test the properties of components
     * @tc.desc Set selectedColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003', Level.LEVEL0, async (done: Function) => {
      try {
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003 START');
        let strJson = getInspectorByKey('checkboxNO');
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003 START  :' + JSON.stringify(strJson));
        expect(JSON.parse(strJson).$attrs.selectedColor).assertEqual('#FF321456');
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1003 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.number ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004
     * @tc.name Test the properties of components
     * @tc.desc Change unselectedColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('checkboxNO');
      console.info("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs));
      expect(JSON.parse(strJsonNew).$attrs.unselectedColor).assertEqual('#FF121212');
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1004 END');
      done();
    });
  })
}
