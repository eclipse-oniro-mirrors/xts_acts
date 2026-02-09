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
import {
  datePickerIsLunarProperty,
  DatePickerKeys,
  datePickerThemeProperty,
  datePickerThemeSetProperty
} from '../../../ets/MainAbility/pages/components/DatePickerPage';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

const emptyCheck = 'emptyCheck';
const emptyAttr = 'emptyAttr';

export default function datePickerThemeTest() {
  const SUITE: string = `DatePickerThemeTest`;

  const datePickerKeys: string[] = [
    DatePickerKeys.datePickerSystem,
    DatePickerKeys.datePickerSystemCustomAttrs,
    DatePickerKeys.datePickerWithTheme,
    DatePickerKeys.datePickerWithThemeCustomAttrs
  ]

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let themeSet: boolean | undefined = true
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });

    beforeEach(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/DatePickerPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `DatePickerPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>(`datePickerThemeProperty`);
            themeSet = AppStorage.get<boolean>(`datePickerThemeSetProperty`)
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      AppStorage.setOrCreate<boolean | undefined>(`datePickerThemeSetProperty`, themeSet)
      if (changeTheme) {
        if ((AppStorage.get<CustomTheme>(`datePickerThemeProperty`))?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate<CustomTheme>(`datePickerThemeProperty`, greenCustomTheme);
        } else {
          AppStorage.setOrCreate<CustomTheme>(`datePickerThemeProperty`, redCustomTheme);
        }
      }
      localTheme =
        AppStorage.get<boolean>(`datePickerThemeSetProperty`) ? AppStorage.get<CustomTheme>(`datePickerThemeProperty`) :
          undefined
      changeTheme = false;
    });

    
    /**
     * @tc.number   ActsDatePickerThemeColors_static_0100
     * @tc.name     ActsDatePickerThemeColors_static_0100
     * @tc.desc     ActsDatePickerThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsDatePickerThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
  try{
      const CASE: string = `ActsDatePickerThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      datePickerKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) {
          return
        }
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
            console.info(`${SUITE} ${CASE} END`);
  }
  catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsDatePickerThemeColors_static_0200
     * @tc.name     ActsDatePickerThemeColors_static_0200
     * @tc.desc     ActsDatePickerThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsDatePickerThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
  try {
      const CASE: string = `ActsDatePickerThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      datePickerKeys.forEach((key) => {
        if (key.search(`System`) > 0) {
          return;
        }
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      changeTheme = true
            console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsDatePickerThemeColors_static_0300
     * @tc.name     ActsDatePickerThemeColors_static_0300
     * @tc.desc     ActsDatePickerThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsDatePickerThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
  try {
      const CASE: string = `ActsDatePickerThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      datePickerKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkWithTheme(localTheme, key,
            key.search(`CustomAttrs`) > 0, colorValues)
        }
      })
      themeSet = false
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsDatePickerThemeColors_static_0400
     * @tc.name     ActsDatePickerThemeColors_static_0400
     * @tc.desc     ActsDatePickerThemeColors_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ActsDatePickerThemeColors_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
  try {
      const CASE: string = `ActsDatePickerThemeColors_static_0400`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      datePickerKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = true
      AppStorage.setOrCreate(`datePickerIsLunarProperty`, true);
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsDatePickerThemeColors_static_0500
     * @tc.name     ActsDatePickerThemeColors_static_0500
     * @tc.desc     ActsDatePickerThemeColors_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ActsDatePickerThemeColors_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
  try {
      const CASE: string = `ActsDatePickerThemeColors_static_0500`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      datePickerKeys.forEach((key) => {
        if (key.search(`WithTheme`) <= 0) {
          checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
        }
      })
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsDatePickerThemeColors_static_0600
     * @tc.name     ActsDatePickerThemeColors_static_0600
     * @tc.desc     ActsDatePickerThemeColors_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ActsDatePickerThemeColors_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
  try {
      const CASE: string = `ActsDatePickerThemeColors_static_0600`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      datePickerKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
        }
      })
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsDatePickerThemeColors_static_0700
     * @tc.name     ActsDatePickerThemeColors_static_0700
     * @tc.desc     ActsDatePickerThemeColors_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ActsDatePickerThemeColors_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
  try {
      const CASE: string = `ActsDatePickerThemeColors_static_0700`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      datePickerKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
        }
      })
      themeSet = false
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsDatePickerThemeColors_static_0800
     * @tc.name     ActsDatePickerThemeColors_static_0800
     * @tc.desc     ActsDatePickerThemeColors_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ActsDatePickerThemeColors_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
  try {
      const CASE: string = `ActsDatePickerThemeColors_static_0800`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime * 2);
      datePickerKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = true
      AppStorage.setOrCreate<boolean>(`datePickerIsLunarProperty`, false);
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
  const datePickerJSON = inspector.getInspectorByKey(key)
  const datePickerAttrs = JSON.parseJsonElement(datePickerJSON).getElement('$attrs');
  const selectedTextStyle = datePickerAttrs.getElement('selectedTextStyle');
  const selectedColor: string = selectedTextStyle.getString('color').toString().toUpperCase() ?? emptyAttr;
  const checkSelectedColor: string =
    (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontEmphasize?.toString().toUpperCase()
      ?? colorValues?.get(`fontEmphasize`)
      ?? emptyCheck;
  expect(selectedColor).assertEqual(checkSelectedColor);
  const textStyle = datePickerAttrs.getElement('textStyle');
  const textColor: string = textStyle.getString('color').toString().toUpperCase() ?? emptyAttr;
  const checkTextColor: string =
    (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary?.toString().toUpperCase()
      ?? colorValues?.get(`fontPrimary`)
      ?? emptyCheck;
  expect(textColor).assertEqual(checkTextColor);
  const disappearTextStyle = datePickerAttrs.getElement('disappearTextStyle')
  const disappearTextColor: string = disappearTextStyle.getString('color').toString().toUpperCase() ?? emptyAttr;
  const checkDisappearTextColor: string =
    (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary?.toString().toUpperCase()
      ?? colorValues?.get(`fontPrimary`)
      ?? emptyCheck;
  expect(disappearTextColor).assertEqual(checkDisappearTextColor);
}