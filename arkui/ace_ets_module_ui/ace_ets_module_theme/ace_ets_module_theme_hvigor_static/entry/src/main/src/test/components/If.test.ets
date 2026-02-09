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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { frameTime, sleep } from '../Utils.test';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import { ifArgumentProperty, IfKeys, ifThemeProperty } from '../../../ets/MainAbility/pages/components/IfPage';
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

export default function ifThemeTest() {
  const SUITE: string = `IfThemeTest`;
  const emptyAttr = 'emptyAttr';
  const emptyCheck = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {

    beforeAll(() => {
      console.info("IfPage beforeAll start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      
    });

    beforeEach(() => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/IfPage`,
        }
        const routerInstance = AppStorage.get<Router>("router") as Router
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `IfPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>(`IfThemeProperty`);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get<CustomTheme>(`IfThemeProperty`))?.colors?.backgroundEmphasize
        == redCustomTheme?.colors?.backgroundEmphasize) {
        AppStorage.setOrCreate<CustomTheme>(`IfThemeProperty`, greenCustomTheme);
      } else {
        AppStorage.setOrCreate<CustomTheme>(`IfThemeProperty`, redCustomTheme);
      }
      localTheme = AppStorage.get<CustomTheme>(`IfThemeProperty`);
      changeTheme = false;
    });

    
    /**
     * @tc.number   ActsIfThemeColors_static_0100
     * @tc.name     ActsIfThemeColors_static_0100
     * @tc.desc     ActsIfThemeColors_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ActsIfThemeColors_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsIfThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      AppStorage.setOrCreate<boolean>(`IfArgumentProperty`, true);
      await sleep(frameTime);
      {
        const buttonJson = inspector.getInspectorByKey(IfKeys.ifSystem);
        const attrs = JSON.parseJsonElement(buttonJson).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = colorValues?.get(`backgroundEmphasize`)?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }

      AppStorage.setOrCreate<boolean>(`IfArgumentProperty`, false);
      await sleep(frameTime);
      {
        const buttonJson = inspector.getInspectorByKey(IfKeys.elseSystem);
        const attrs = JSON.parseJsonElement(buttonJson).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = colorValues?.get(`compBackgroundTertiary`)?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }
      console.info(`${SUITE} ${CASE} END`)
      done();
    });
    
    /**
     * @tc.number   ActsIfThemeColors_static_0200
     * @tc.name     ActsIfThemeColors_static_0200
     * @tc.desc     ActsIfThemeColors_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ActsIfThemeColors_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsIfThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);

      AppStorage.setOrCreate<boolean>(`IfArgumentProperty`, true)
      await sleep(frameTime);
      {
        const ifJSON = inspector.getInspectorByKey(IfKeys.ifWithTheme);
        const attrs = JSON.parseJsonElement(ifJSON).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }

      AppStorage.setOrCreate<boolean>(`IfArgumentProperty`, false)
      await sleep(frameTime);
      {
        const ifJSON = inspector.getInspectorByKey(IfKeys.elseWithTheme);
        const attrs = JSON.parseJsonElement(ifJSON).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`)
      done();
    });
    
    /**
     * @tc.number   ActsIfThemeColors_static_0300
     * @tc.name     ActsIfThemeColors_static_0300
     * @tc.desc     ActsIfThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsIfThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsIfThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);

      AppStorage.setOrCreate<boolean>(`IfArgumentProperty`, true)
      await sleep(frameTime);
      {
        const ifJSON = inspector.getInspectorByKey(IfKeys.ifWithTheme);
        const attrs = JSON.parseJsonElement(ifJSON).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }

      AppStorage.setOrCreate<boolean>(`IfArgumentProperty`, false)
      await sleep(frameTime);
      {
        const ifJSON = inspector.getInspectorByKey(IfKeys.elseWithTheme);
        const attrs = JSON.parseJsonElement(ifJSON).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
          ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
      }
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`)
      done();
    });
  });
}
