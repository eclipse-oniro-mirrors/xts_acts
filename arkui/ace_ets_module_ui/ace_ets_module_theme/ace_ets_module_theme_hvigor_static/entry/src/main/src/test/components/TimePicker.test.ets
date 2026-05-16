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
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
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
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import {
  timePickerIsMilitaryProperty,
  TimePickerKeys,
  timePickerThemeProperty,
  timePickerThemeSetProperty
} from '../../../ets/MainAbility/pages/components/TimePickerPage';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

const emptyCheck: string = 'emptyCheck';
const emptyAttr: string = 'emptyAttr';


export default function timePickerThemeTest() {
  const SUITE: string = `TimePickerThemeTest`;

  const timePickerKeys: string[] = [
    TimePickerKeys.timePickerSystem,
    TimePickerKeys.timePickerSystemCustomAttrs,
    TimePickerKeys.timePickerWithTheme,
    TimePickerKeys.timePickerWithThemeCustomAttrs
  ]

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let themeSet: boolean | undefined = true
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

    })

    beforeEach(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/TimePickerPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `TimePickerPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>(`timePickerThemeProperty`);
            themeSet = AppStorage.get<boolean>(`timePickerThemeSetProperty`)
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      AppStorage.setOrCreate(`timePickerThemeSetProperty`, themeSet)
      if (changeTheme) {
        if ((AppStorage.get<CustomTheme>(`timePickerThemeProperty`))?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate<CustomTheme>(`timePickerThemeProperty`, greenCustomTheme);
        } else {
          AppStorage.setOrCreate<CustomTheme>(`timePickerThemeProperty`, redCustomTheme);
        }
      }
      localTheme =
        AppStorage.get<boolean>(`timePickerThemeSetProperty`) ? AppStorage.get<CustomTheme>(`timePickerThemeProperty`) :
          undefined;
      changeTheme = false;
    });

    
    /**
     * @tc.number   ActsTimePickerThemeColors_static_0100
     * @tc.name     ActsTimePickerThemeColors_static_0100
     * @tc.desc     ActsTimePickerThemeColors_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ActsTimePickerThemeColors_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
  try {
      const CASE: string = `ActsTimePickerThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime)
      timePickerKeys.forEach((key) => {
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
     * @tc.number   ActsTimePickerThemeColors_static_0200
     * @tc.name     ActsTimePickerThemeColors_static_0200
     * @tc.desc     ActsTimePickerThemeColors_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ActsTimePickerThemeColors_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
    try {
      const CASE: string = `ActsTimePickerThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime)
      timePickerKeys.forEach((key) => {
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
     * @tc.number   ActsTimePickerThemeColors_static_0300
     * @tc.name     ActsTimePickerThemeColors_static_0300
     * @tc.desc     ActsTimePickerThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsTimePickerThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
    try {
      const CASE: string = `ActsTimePickerThemeColors_static_0300`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      timePickerKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
        }
      })
      themeSet = false
      console.info(`${SUITE} ${CASE} END`)
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsTimePickerThemeColors_static_0400
     * @tc.name     ActsTimePickerThemeColors_static_0400
     * @tc.desc     ActsTimePickerThemeColors_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ActsTimePickerThemeColors_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
    try {
      const CASE: string = `ActsTimePickerThemeColors_static_0400`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      timePickerKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = true
      AppStorage.setOrCreate(`timePickerIsMilitaryProperty`, true);
      console.info(`${SUITE} ${CASE} END`)
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsTimePickerThemeColors_static_0500
     * @tc.name     ActsTimePickerThemeColors_static_0500
     * @tc.desc     ActsTimePickerThemeColors_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ActsTimePickerThemeColors_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
    try {
      const CASE: string = `ActsTimePickerThemeColors_static_0500`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime);
      timePickerKeys.forEach((key) => {
        if (key.search(`WithTheme`) <= 0) {
          checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
        }
      })
      console.info(`${SUITE} ${CASE} END`)
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsTimePickerThemeColors_static_0600
     * @tc.name     ActsTimePickerThemeColors_static_0600
     * @tc.desc     ActsTimePickerThemeColors_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ActsTimePickerThemeColors_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
    try {
      const CASE: string = `ActsTimePickerThemeColors_static_0600`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime);
      timePickerKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
        }
      })
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`)
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsTimePickerThemeColors_static_0700
     * @tc.name     ActsTimePickerThemeColors_static_0700
     * @tc.desc     ActsTimePickerThemeColors_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ActsTimePickerThemeColors_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
    try {
      const CASE: string = `ActsTimePickerThemeColors_static_0700`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      timePickerKeys.forEach((key) => {
        if (key.search(`System`) >= 0) {
          checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
        }
      })
      themeSet = false
      AppStorage.setOrCreate(`timePickerIsMilitaryProperty`, false)
      console.info(`${SUITE} ${CASE} END`)
} catch (err) {
          expect().assertFail()
}
      done();
    });
    
    /**
     * @tc.number   ActsTimePickerThemeColors_static_0800
     * @tc.name     ActsTimePickerThemeColors_static_0800
     * @tc.desc     ActsTimePickerThemeColors_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ActsTimePickerThemeColors_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
    try {
      const CASE: string = `ActsTimePickerThemeColors_static_0800`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      timePickerKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      themeSet = false
      AppStorage.setOrCreate<boolean>(`timePickerIsMilitaryProperty`, false)
      console.info(`${SUITE} ${CASE} END`)
} catch (err) {
          expect().assertFail()
}
      done();
    });
  });
}

function checkWithTheme(localTheme: CustomTheme | undefined, key: string, customAttrs: boolean,
  colorValues: Map<string, string> | undefined) {
  const timePickerJSON = inspector.getInspectorByKey(key)
  const timePickerAttrs = JSON.parseJsonElement(timePickerJSON).getElement('$attrs');
  const selectedTextStyle = timePickerAttrs.getElement('selectedTextStyle');
  const selectedColor: string = selectedTextStyle.getString('color').toString().toUpperCase() ?? emptyAttr;
  const checkSelectedColor: string =
    (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontEmphasize?.toString().toUpperCase()
      ?? colorValues?.get(`fontEmphasize`)
      ?? emptyCheck;
  expect(selectedColor).assertEqual(checkSelectedColor);
  const textStyle = timePickerAttrs.getElement('textStyle');
  const textColor: string = textStyle.getString('color').toString().toUpperCase() ?? emptyAttr;
  const checkTextColor: string =
    (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary?.toString().toUpperCase()
      ?? colorValues?.get(`fontPrimary`)
      ?? emptyCheck;
  expect(textColor).assertEqual(checkTextColor);
  const disappearTextStyle = timePickerAttrs.getElement('disappearTextStyle')
  const disappearTextColor: string = disappearTextStyle.getString('color').toString().toUpperCase() ?? emptyAttr;
  const checkDisappearTextColor: string =
    (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary?.toString().toUpperCase()
      ?? colorValues?.get(`fontPrimary`)
      ?? emptyCheck;
  expect(disappearTextColor).assertEqual(checkDisappearTextColor);
}
