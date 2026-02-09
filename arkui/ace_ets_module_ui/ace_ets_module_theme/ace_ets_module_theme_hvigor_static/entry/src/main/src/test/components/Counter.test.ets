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
import { UtilsTest } from '../Util.test';
import { Driver, MouseButton, ON, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import {
  CounterKeys,
  counterThemeProperty,
  counterThemeSetProperty
} from '../../../ets/MainAbility/pages/components/CounterPage';
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

const emptyCheck: string = 'emptyCheck';
const emptyAttr: string = 'emptyAttr';

export default function counterThemeTest() {
  const SUITE: string = `CounterThemeTest`;
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let themeSet: boolean = true;

  const counterKeys: Array<string> = new Array<string>(
    CounterKeys.counterSystem,
    CounterKeys.counterSystemCustomAttrs,
    CounterKeys.counterWithTheme,
    CounterKeys.counterWithThemeCustomAttrs
  )

  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    })

    beforeEach(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/CounterPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `CounterPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>('counterThemeProperty');
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      AppStorage.setOrCreate<boolean | undefined>('counterThemeSetProperty', themeSet)
      if (changeTheme) {
        if ((AppStorage.get<CustomTheme>('counterThemeProperty'))?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate<CustomTheme>('counterThemeProperty', greenCustomTheme);
        } else {
          AppStorage.setOrCreate<CustomTheme>('counterThemeProperty', redCustomTheme);
        }
        changeTheme = false;
      }
      localTheme =
        AppStorage.get<boolean>('counterThemeSetProperty') ? AppStorage.get<CustomTheme>('counterThemeProperty') :
          undefined;
    })

    
    /**
     * @tc.number   ActsCounterThemeColors_static_0100
     * @tc.name     ActsCounterThemeColors_static_0100
     * @tc.desc     ActsCounterThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsCounterThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
      const CASE: string = `ActsCounterThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      counterKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) {
          return;
        }
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      });
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    })
    
    /**
     * @tc.number   ActsCounterThemeColors_static_0200
     * @tc.name     ActsCounterThemeColors_static_0200
     * @tc.desc     ActsCounterThemeColors_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ActsCounterThemeColors_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
      const CASE: string = `ActsCounterThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      counterKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
        }
      });
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    })
    
    /**
     * @tc.number   ActsCounterThemeColors_static_0300
     * @tc.name     ActsCounterThemeColors_static_0300
     * @tc.desc     ActsCounterThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsCounterThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
      const CASE: string = `ActsCounterThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      counterKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkWithTheme(localTheme, key,
            key.search(`CustomAttrs`) > 0, colorValues)
        }
      });
      themeSet = false;
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    })

    
    /**
     * @tc.number   ActsCounterThemeColors_static_0400
     * @tc.name     ActsCounterThemeColors_static_0400
     * @tc.desc     ActsCounterThemeColors_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ActsCounterThemeColors_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
      const CASE: string = `ActsCounterThemeColors_static_0400`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      counterKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      });
      themeSet = true;
      console.info(`${SUITE} ${CASE} END`);
} catch (err) {
          expect().assertFail()
}
      done();
    })
  })
}

function checkWithTheme(localTheme: CustomTheme | undefined, key: string, customAttrs: boolean,
  colorValues: Map<string, string> | undefined) {
  const counterJSON = inspector.getInspectorByKey(key);
  const attrsCounter = JSON.parseJsonElement(counterJSON).getElement('$attrs');
  const foregroundColor = attrsCounter?.getString('foregroundColor')?.toString().toUpperCase() ?? emptyAttr;
  const checkForegroundColor = (customAttrs ? brownCustomTheme : localTheme)?.colors?.fontPrimary
    ?? colorValues?.get(`fontPrimary`)
    ?? emptyCheck;
  ;
  expect(foregroundColor).assertEqual(checkForegroundColor);
}