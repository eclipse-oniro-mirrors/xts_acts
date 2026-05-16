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
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import {
  RadioKeys,
  radioThemeProperty,
  radioThemeSetProperty
} from '../../../ets/MainAbility/pages/components/RadioPage';
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

const EMPTY_CHECK: string = 'emptyCheck';
const EMPTY_ATTR: string = 'emptyAttr';

export default function RadioThemeTest() {
  const SUITE: string = `RadioThemeTest`;

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let themeSet = true;

  const radioKeys: string [] = [
    RadioKeys.radioSystem,
    RadioKeys.radioSystemCustomAttrs,
    RadioKeys.radioWithTheme,
    RadioKeys.radioWithThemeCustomAttrs
  ]

  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });

    beforeEach(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/RadioPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `RadioPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>(`RadioThemeProperty`);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      AppStorage.setOrCreate(`RadioThemeSetProperty`, themeSet)
      if (changeTheme) {
        if ((AppStorage.get<CustomTheme>(`RadioThemeProperty`))?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate<CustomTheme>(`RadioThemeProperty`, greenCustomTheme);
        } else {
          AppStorage.setOrCreate<CustomTheme>(`RadioThemeProperty`, redCustomTheme);
        }
        changeTheme = false;
      }
      localTheme =
        AppStorage.get<boolean>(`RadioThemeSetProperty`) ? AppStorage.get<CustomTheme>(`RadioThemeProperty`) : undefined;
    });

    
    /**
     * @tc.number   ActsRadioThemeColors_static_0100
     * @tc.name     ActsRadioThemeColors_static_0100
     * @tc.desc     ActsRadioThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsRadioThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
          try {
      const CASE: string = `ActsRadioThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      radioKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) {
          return;
        }
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsRadioThemeColors_static_0200
     * @tc.name     ActsRadioThemeColors_static_0200
     * @tc.desc     ActsRadioThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsRadioThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
          try {
      const CASE: string = `ActsRadioThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      radioKeys.forEach((key) => {
        if (key.search(`System`) > 0) {
          return;
        }
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsRadioThemeColors_static_0300
     * @tc.name     ActsRadioThemeColors_static_0300
     * @tc.desc     ActsRadioThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsRadioThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
          try {
      const CASE: string = `ActsRadioThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      radioKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues);
        }
      });
      themeSet = false;
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsRadioThemeColors_static_0400
     * @tc.name     ActsRadioThemeColors_static_0400
     * @tc.desc     ActsRadioThemeColors_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ActsRadioThemeColors_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
          try {
      const CASE: string = `ActsRadioThemeColors_static_0400`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      radioKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues);
      });
      themeSet = true;
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
  });
}

function checkWithTheme(localTheme: CustomTheme | undefined, key: string, customAttrs: boolean,
  colorValues: Map<string, string> | undefined) {
  const RadioJSON = inspector.getInspectorByKey(key);
  const attrsRadio = JSON.parseJsonElement(RadioJSON).getElement('$attrs');
  const style = JSON.parseJsonElement(attrsRadio.getString('radioStyle'));
  console.log('radioStyle: ' + style )
  const checkedBackgroundColor: string =
    style.getString('checkedBackgroundColor').toString().toUpperCase() ?? EMPTY_ATTR;
  const checkCheckedBackgroundColor: string =
    ((customAttrs ? brownCustomTheme : localTheme)?.colors?.compBackgroundEmphasize
      ?? colorValues?.get(`compBackgroundEmphasize`))?.toString().toUpperCase()
      ?? EMPTY_CHECK;
  expect(checkedBackgroundColor).assertEqual(checkCheckedBackgroundColor);
  const uncheckedBorderColor: string = style.getString('uncheckedBorderColor').toString().toUpperCase() ?? EMPTY_ATTR;
  const checkunCheckedBackgroundColor: string = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.iconFourth
    ?? colorValues?.get(`iconFourth`))?.toString().toUpperCase()
    ?? EMPTY_CHECK;
  expect(uncheckedBorderColor).assertEqual(checkunCheckedBackgroundColor);
  const indicatorColor: string = style.getString('indicatorColor').toString().toUpperCase() ?? EMPTY_ATTR;
  const checkIndicatorColor: string = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.iconOnPrimary
    ?? colorValues?.get(`iconOnPrimary`))?.toString().toUpperCase()
    ?? EMPTY_CHECK;
  expect(indicatorColor).assertEqual(checkIndicatorColor);
}