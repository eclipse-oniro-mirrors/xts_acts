/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { afterAll, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { CustomTheme, Theme } from '@ohos.arkui.theme';
import { LoadingProgressKeys, loadingProgressThemeProperty } from '../../MainAbility/pages/components/LoadingProgressPage';
import { colorValuesKey } from '../../MainAbility/pages/index/index';

export default function loadingProgressThemeTest() {
  const SUITE: string = `loadingProgressThemeTest`;
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/LoadingProgressPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `LoadingProgressPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(loadingProgressThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })

    beforeEach(() => {
      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get(loadingProgressThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(loadingProgressThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(loadingProgressThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(loadingProgressThemeProperty);
      changeTheme = false;
    });

    afterAll(() => {
      try {
        router.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });
    /**
      * @tc.number    : ActsloadingProgressThemeColors_0100
      * @tc.name      : ActsloadingProgressThemeColors_0100
      * @tc.desc      : Check system colors values of TextClock component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsLoadingProgressThemeColors_0100`, 0, () => {
      const CASE: string = `ActsloadingProgressThemeColors_0100`
      console.info(`${SUITE} ${CASE} START`)
      const loadingProgressJSON = getInspectorByKey(LoadingProgressKeys.loadingProgressSystem)
      const attrsLoadingProgress = (JSON.parse(loadingProgressJSON)?.$attrs as LoadingProgressAttribute)
      const foregroundColor: string = attrsLoadingProgress?.foregroundColor?.toString().toUpperCase() ?? emptyAttr
      const checkForegroundColor: string = colorValues?.get(`iconSecondary`)?.toString().toUpperCase() ?? emptyCheck
      expect(foregroundColor).assertEqual(checkForegroundColor)
      console.info(`${SUITE} ${CASE} END`)
    })
    /**
      * @tc.number    : ActsLoadingProgressThemeColors_0200
      * @tc.name      : ActsLoadingProgressThemeColors_0200
      * @tc.desc      : Check custom colors values of TextClock component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsLoadingProgressThemeColors_0200`, 0, () => {
      const CASE: string = `ActsLoadingProgressThemeColors_0200`
      console.info(`${SUITE} ${CASE} START`);
      const loadingProgressJSON = getInspectorByKey(LoadingProgressKeys.loadingProgressWithTheme)
      const attrsLoadingProgress = (JSON.parse(loadingProgressJSON)?.$attrs as LoadingProgressAttribute)
      const foregroundColor: string = attrsLoadingProgress?.foregroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkForegroundColor: string = localTheme?.colors?.iconSecondary?.toString().toUpperCase() ?? emptyCheck;
      expect(foregroundColor).assertEqual(checkForegroundColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
      * @tc.number    : ActsLoadingProgressThemeColors_0300
      * @tc.name      : ActsLoadingProgressThemeColors_0300
      * @tc.desc      : Check custom colors values of TextClock component
      *                 after changing the theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsLoadingProgressThemeColors_0300`, 0, async () => {
      const CASE: string = `ActsLoadingProgressThemeColors_0300`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      const loadingProgressJSON = getInspectorByKey(LoadingProgressKeys.loadingProgressWithTheme)
      const attrsLoadingProgress = (JSON.parse(loadingProgressJSON)?.$attrs as LoadingProgressAttribute)
      const foregroundColor: string = attrsLoadingProgress?.foregroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkForegroundColor: string = localTheme?.colors?.iconSecondary?.toString().toUpperCase() ?? emptyCheck;
      expect(foregroundColor).assertEqual(checkForegroundColor);
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`)
    })
  })
}