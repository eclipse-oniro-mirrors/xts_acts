'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import router from '@ohos.router';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import { Driver, MouseButton, ON, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { MarkStyle } from '@ohos.arkui.component'
import { CheckBoxKeys, checkBoxThemeProperty } from '../../../ets/MainAbility/pages/components/CheckboxPage';
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

export default function checkboxGroupThemeTest() {
  const SUITE: string = `CheckboxGroupThemeTest`;
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      
    })

    beforeEach(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/CheckboxPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `CheckboxPage`) {
          routerInstance.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          });
          await UtilsTest.msSleep(1000)
          localTheme = AppStorage.get<CustomTheme>('CheckBoxThemeProperty');
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      if (changeTheme) {
        if ((AppStorage.get<CustomTheme>('CheckBoxThemeProperty'))?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate<CustomTheme>('CheckBoxThemeProperty', greenCustomTheme);
        } else {
          AppStorage.setOrCreate<CustomTheme>('CheckBoxThemeProperty', redCustomTheme);
        }
        localTheme = AppStorage.get<CustomTheme>('CheckBoxThemeProperty');
        changeTheme = false;
      }
    })

    
    /**
     * @tc.number   ActsCheckBoxGroupThemeColors_static_0100
     * @tc.name     ActsCheckBoxGroupThemeColors_static_0100
     * @tc.desc     ActsCheckBoxGroupThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsCheckBoxGroupThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsCheckBoxGroupThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const checkboxJSON: string = inspector.getInspectorByKey(CheckBoxKeys.checkboxGroupSystem);
      const attrsCheckBox = JSON.parseJsonElement(checkboxJSON).getElement('$attrs')
      const selectedColor: string = attrsCheckBox.getString('selectedColor').toString().toUpperCase();
      const checkSelectedColor: string = colorValues?.get(`compBackgroundEmphasize`) ?? emptyCheck;
      expect(selectedColor).assertEqual(checkSelectedColor);
      const unselectedColor: string = attrsCheckBox.getString('unselectedColor').toString().toUpperCase();
      const checkUnselectedColor: string = colorValues?.get(`iconFourth`) ?? emptyCheck;
      expect(unselectedColor).assertEqual(checkUnselectedColor);
      const markObject = attrsCheckBox.getString('mark');
      const strokeColor: string = JSON.parseJsonElement(markObject).getString('strokeColor').toString().toUpperCase() ?? emptyCheck;
      const checkStrokeColor: string = colorValues?.get(`iconOnPrimary`) ?? emptyCheck;
      expect(strokeColor).assertEqual(checkStrokeColor);
      console.info(`${SUITE} ${CASE} END`);
      done();
    })
    
    /**
     * @tc.number   ActsCheckBoxGroupThemeColors_static_0200
     * @tc.name     ActsCheckBoxGroupThemeColors_static_0200
     * @tc.desc     ActsCheckBoxGroupThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsCheckBoxGroupThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsCheckBoxGroupThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const checkboxJSON = inspector.getInspectorByKey(CheckBoxKeys.checkboxGroupWithTheme);
      const attrsCheckBox = JSON.parseJsonElement(checkboxJSON).getElement('$attrs')
      const selectedColor: string = attrsCheckBox.getString('selectedColor').toString().toUpperCase();
      const checkSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.toString().toUpperCase()
        ?? emptyCheck;
      expect(selectedColor).assertEqual(checkSelectedColor);
      const unselectedColor: string = attrsCheckBox.getString('unselectedColor').toString().toUpperCase();
      const checkUnselectedColor: string = localTheme?.colors?.iconFourth?.toString().toUpperCase()
        ?? emptyCheck;
      expect(unselectedColor).assertEqual(checkUnselectedColor);
      const markObject = attrsCheckBox.getString('mark');
      const strokeColor: string = JSON.parseJsonElement(markObject).getString('strokeColor').toString().toUpperCase() ?? emptyAttr;
      const checkStrokeColor: string = localTheme?.colors?.iconOnPrimary?.toString().toUpperCase()
        ?? emptyCheck;
      expect(strokeColor).assertEqual(checkStrokeColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    })
    
    /**
     * @tc.number   ActsCheckBoxGroupThemeColors_static_0300
     * @tc.name     ActsCheckBoxGroupThemeColors_static_0300
     * @tc.desc     ActsCheckBoxGroupThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsCheckBoxGroupThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsCheckBoxGroupThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const checkboxJSON: string = inspector.getInspectorByKey(CheckBoxKeys.checkboxGroupWithTheme);
      const attrsCheckBox = JSON.parseJsonElement(checkboxJSON).getElement('$attrs')
      const selectedColor: string = attrsCheckBox.getString('selectedColor').toString().toUpperCase();
      const checkSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.toString().toUpperCase()
        ?? emptyCheck;
      expect(selectedColor).assertEqual(checkSelectedColor);
      const unselectedColor: string = attrsCheckBox.getString('unselectedColor').toString().toUpperCase();
      const checkUnselectedColor: string = localTheme?.colors?.iconFourth?.toString().toUpperCase()
        ?? emptyCheck;
      expect(unselectedColor).assertEqual(checkUnselectedColor);
      const markObject = attrsCheckBox.getString('mark');
      const strokeColor: string = JSON.parseJsonElement(markObject).getString('strokeColor').toString().toUpperCase() ?? emptyAttr;
      const checkStrokeColor: string = localTheme?.colors?.iconOnPrimary?.toString().toUpperCase()
        ?? emptyCheck;
      expect(strokeColor).assertEqual(checkStrokeColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    })
  })
}