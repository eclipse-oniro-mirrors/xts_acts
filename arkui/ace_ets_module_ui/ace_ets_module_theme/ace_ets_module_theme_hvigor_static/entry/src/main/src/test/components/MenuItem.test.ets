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
import { MenuKeys, menuThemeProperty } from '../../../ets/MainAbility/pages/components/MenuPage';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

export default function menuItemThemeTest() {
  const SUITE: string = `MenuThemeTest`;
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
          url: `MainAbility/pages/components/MenuPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `MenuPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>(`MenuThemeProperty`);
            console.info(`${SUITE} router.pushUrl success`);
          });
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get<CustomTheme>(`MenuThemeProperty`))?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate<CustomTheme>(`MenuThemeProperty`, greenCustomTheme);
      } else {
        AppStorage.setOrCreate<CustomTheme>(`MenuThemeProperty`, redCustomTheme);
      }
      localTheme = AppStorage.get<CustomTheme>(`MenuThemeProperty`);
      changeTheme = false;
    })

    
    /**
     * @tc.number   ActsMenuItemThemeColors_static_0100
     * @tc.name     ActsMenuItemThemeColors_static_0100
     * @tc.desc     ActsMenuItemThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsMenuItemThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsMenuItemThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const menuJSON = inspector.getInspectorByKey(MenuKeys.menuItemSystem)
      const menuAttrs = JSON.parseJsonElement(menuJSON).getElement('$attrs')
      const color: string = menuAttrs.getString('labelFontColor').toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = colorValues?.get(`fontPrimary`)?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
    /**
     * @tc.number   ActsMenuItemThemeColors_static_0200
     * @tc.name     ActsMenuItemThemeColors_static_0200
     * @tc.desc     ActsMenuItemThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsMenuItemThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsMenuItemThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const menuJSON = inspector.getInspectorByKey(MenuKeys.menuItemWithTheme);
      const menuAttrs = JSON.parseJsonElement(menuJSON).getElement('$attrs');
      const color: string = menuAttrs.getString('labelFontColor').toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
    /**
     * @tc.number   ActsMenuItemThemeColors_static_0300
     * @tc.name     ActsMenuItemThemeColors_static_0300
     * @tc.desc     ActsMenuItemThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsMenuItemThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsMenuItemThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const menuJSON = inspector.getInspectorByKey(MenuKeys.menuItemWithTheme);
      const menuAttrs = JSON.parseJsonElement(menuJSON).getElement('$attrs');
      const color: string = menuAttrs.getString('labelFontColor').toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  });
}