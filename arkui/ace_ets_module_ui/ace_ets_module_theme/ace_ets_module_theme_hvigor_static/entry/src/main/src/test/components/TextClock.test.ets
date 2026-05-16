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
  textClockFontColor,
  textClockThemeProperty,
  textClockThemeSetProperty
} from '../../../ets/MainAbility/pages/components/TextClockPage';
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import { CustomTheme, Theme } from '@ohos.arkui.theme';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';

export default function textClockThemeTest() {
  const SUITE: string = `textClockThemeTest`;
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

  const textClockKeys: string [] = [
    `TextClock_System`,
    `TextClock_WithTheme`,
    `TextClock_System_CustomAttrs`,
    `TextClock_WithTheme_CustomAttrs`
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
          url: `MainAbility/pages/components/TextClockPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `TextClockPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>('TextClockThemeProperty');
            themeSet = AppStorage.get<boolean>(`TextClockThemeSetProperty`)
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      if (changeTheme) {
        if ((AppStorage.get<CustomTheme>('TextClockThemeProperty'))?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate<CustomTheme>('TextClockThemeProperty', greenCustomTheme)
        } else {
          AppStorage.setOrCreate<CustomTheme>('TextClockThemeProperty', redCustomTheme)
        }
        changeTheme = false
      }
      AppStorage.setOrCreate<boolean | undefined>(`TextClockThemeSetProperty`, themeSet);
      localTheme =
        AppStorage.get<boolean>(`TextClockThemeSetProperty`) ? AppStorage.get<CustomTheme>('TextClockThemeProperty') :
          undefined
    })

    
    /**
     * @tc.number   ActsTextClockThemeColors_static_0100
     * @tc.name     ActsTextClockThemeColors_static_0100
     * @tc.desc     ActsTextClockThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsTextClockThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsTextClockThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      textClockKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) {
          return;
        }
        const textClockJSON = inspector.getInspectorByKey(key);
        const attrsTextClock = JSON.parseJsonElement(textClockJSON).getElement('$attrs');
        const fontColor: string = attrsTextClock.getString('fontColor').toString().toUpperCase() ?? EMPTY_ATTR;
        const checkFontColor: string = (key.search(`CustomAttrs`) > 0 ? textClockFontColor :
        colorValues?.get(`fontSecondary`))?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        expect(fontColor).assertEqual(checkFontColor);
      })
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ActsTextClockThemeColors_static_0200
     * @tc.name     ActsTextClockThemeColors_static_0200
     * @tc.desc     ActsTextClockThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsTextClockThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsTextClockThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      textClockKeys.forEach((key) => {
        if (key.search(`System`) > 0) {
          return
        }
        const textClockJSON = inspector.getInspectorByKey(key);
        const attrsTextClock = JSON.parseJsonElement(textClockJSON).getElement('$attrs');
        const fontColor: string = attrsTextClock.getString('fontColor').toString().toUpperCase() ?? EMPTY_ATTR;
        const checkFontColor: string = (key.search(`CustomAttrs`) > 0 ? textClockFontColor :
          localTheme?.colors?.fontSecondary)?.toString().toUpperCase() ?? EMPTY_CHECK;
        expect(fontColor).assertEqual(checkFontColor);
      })
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ActsTextClockThemeColors_static_0300
     * @tc.name     ActsTextClockThemeColors_static_0300
     * @tc.desc     ActsTextClockThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsTextClockThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsTextClockThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime)
      textClockKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          const textClockJSON = inspector.getInspectorByKey(key);
          const attrsTextClock = JSON.parseJsonElement(textClockJSON).getElement('$attrs');
          const fontColor: string = attrsTextClock.getString('fontColor').toString().toUpperCase() ?? EMPTY_ATTR;
          const checkFontColor: string = (key.search(`CustomAttrs`) > 0 ? textClockFontColor :
            localTheme?.colors?.fontSecondary)?.toString().toUpperCase() ?? EMPTY_CHECK;
          expect(fontColor).assertEqual(checkFontColor);
        }
      })
      themeSet = false;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ActsTextClockThemeColors_static_0400
     * @tc.name     ActsTextClockThemeColors_static_0400
     * @tc.desc     ActsTextClockThemeColors_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ActsTextClockThemeColors_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsTextClockThemeColors_static_0400`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime)
      textClockKeys.forEach((key) => {
        const textClockJSON = inspector.getInspectorByKey(key);
        const attrsTextClock = JSON.parseJsonElement(textClockJSON).getElement('$attrs');
        const fontColor: string = attrsTextClock.getString('fontColor').toString().toUpperCase() ?? EMPTY_ATTR;
        const checkFontColor: string = (key.search(`CustomAttrs`) > 0 ? textClockFontColor :
        colorValues?.get(`fontSecondary`))?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        expect(fontColor).assertEqual(checkFontColor);
      })
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  });
}