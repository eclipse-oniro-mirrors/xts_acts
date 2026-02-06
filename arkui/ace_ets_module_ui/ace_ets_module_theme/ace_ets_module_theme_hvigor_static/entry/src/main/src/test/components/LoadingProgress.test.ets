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
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import { CustomTheme, Theme } from '@ohos.arkui.theme';
import {
  LoadingProgressKeys,
  loadingProgressThemeProperty
} from '../../../ets/MainAbility/pages/components/LoadingProgressPage';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';

export default function loadingProgressThemeTest() {
  const SUITE: string = `loadingProgressThemeTest`;
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
          url: `MainAbility/pages/components/LoadingProgressPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `LoadingProgressPage`) {
          routerInstance.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
          await UtilsTest.msSleep(1000)
          localTheme = AppStorage.get<CustomTheme>('LoadingProgressThemeProperty');
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get<CustomTheme>('LoadingProgressThemeProperty'))?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate<CustomTheme>('LoadingProgressThemeProperty', greenCustomTheme);
      } else {
        AppStorage.setOrCreate<CustomTheme>('LoadingProgressThemeProperty', redCustomTheme);
      }
      localTheme = AppStorage.get<CustomTheme>('LoadingProgressThemeProperty');
      changeTheme = false;
    });

    
    /**
     * @tc.number   ActsLoadingProgressThemeColors_static_0100
     * @tc.name     ActsLoadingProgressThemeColors_static_0100
     * @tc.desc     ActsLoadingProgressThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsLoadingProgressThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsloadingProgressThemeColors_static_0100`
      console.info(`${SUITE} ${CASE} START`)
      const loadingProgressJSON = inspector.getInspectorByKey(LoadingProgressKeys.loadingProgressSystem)
      const attrsLoadingProgress = JSON.parseJsonElement(loadingProgressJSON).getElement('$attrs')
      const foregroundColor: string =
        attrsLoadingProgress.getString('foregroundColor').toString().toUpperCase() ?? emptyAttr
      const checkForegroundColor: string = colorValues?.get(`iconSecondary`)?.toString().toUpperCase() ?? emptyCheck
      expect(foregroundColor).assertEqual(checkForegroundColor)
      console.info(`${SUITE} ${CASE} END`);
      done();
    })
    
    /**
     * @tc.number   ActsLoadingProgressThemeColors_static_0200
     * @tc.name     ActsLoadingProgressThemeColors_static_0200
     * @tc.desc     ActsLoadingProgressThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsLoadingProgressThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsLoadingProgressThemeColors_static_0200`
      console.info(`${SUITE} ${CASE} START`);
      const loadingProgressJSON = inspector.getInspectorByKey(LoadingProgressKeys.loadingProgressWithTheme)
      const attrsLoadingProgress = JSON.parseJsonElement(loadingProgressJSON).getElement('$attrs')
      const foregroundColor: string =
        attrsLoadingProgress.getString('foregroundColor').toString().toUpperCase() ?? emptyAttr;
      const checkForegroundColor: string = localTheme?.colors?.iconSecondary?.toString().toUpperCase() ?? emptyCheck;
      expect(foregroundColor).assertEqual(checkForegroundColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    })
    
    /**
     * @tc.number   ActsLoadingProgressThemeColors_static_0300
     * @tc.name     ActsLoadingProgressThemeColors_static_0300
     * @tc.desc     ActsLoadingProgressThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsLoadingProgressThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsLoadingProgressThemeColors_static_0300`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      const loadingProgressJSON = inspector.getInspectorByKey(LoadingProgressKeys.loadingProgressWithTheme)
      const attrsLoadingProgress = JSON.parseJsonElement(loadingProgressJSON).getElement('$attrs')
      const foregroundColor: string =
        attrsLoadingProgress.getString('foregroundColor').toString().toUpperCase() ?? emptyAttr;
      const checkForegroundColor: string = localTheme?.colors?.iconSecondary?.toString().toUpperCase() ?? emptyCheck;
      expect(foregroundColor).assertEqual(checkForegroundColor);
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`)
      done();
    })
  })
}