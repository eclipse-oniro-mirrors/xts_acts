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
import { SwiperKeys, swiperThemeProperty } from '../../../ets/MainAbility/pages/components/SwiperPage'
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1'
import { frameTime, sleep } from '../Utils.test'
import { CustomTheme, Theme } from '@ohos.arkui.theme'
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';

export default function swiperThemeTest() {
  const SUITE: string = `SwiperThemeTest`
  const EMPTY_CHECK: string = 'emptyCheck';
  const EMPTY_ATTR: string = 'emptyAttr';

  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      console.info("SwiperPage beforeAll start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });

    beforeEach(() => {
      try {
        let options: router.RouterOptions = {
          url: `MainAbility/pages/components/SwiperPage`,
        };
        const routerInstance = AppStorage.get<Router>("router") as Router
        let pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `SwiperPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>('SwiperThemeProperty');
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>(colorValuesKey)
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      if (!changeTheme) {
        return
      }
      if ((AppStorage.get<CustomTheme>('SwiperThemeProperty'))?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate<CustomTheme>('SwiperThemeProperty', greenCustomTheme);
      } else {
        AppStorage.setOrCreate<CustomTheme>('SwiperThemeProperty', redCustomTheme);
      }
      localTheme = AppStorage.get<CustomTheme>('SwiperThemeProperty');
      changeTheme = false;
    });

    
    /**
     * @tc.number   ActsSwiperThemeColors_static_0100
     * @tc.name     ActsSwiperThemeColors_static_0100
     * @tc.desc     ActsSwiperThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsSwiperThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsSwiperThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      {
        const json = inspector.getInspectorByKey(SwiperKeys.dotIndicatorSystem);
        const indicatorJson = JSON.parseJsonElement(json).getElement('$attrs').getString('indicator').toString();
        const indicatorColor =
          JSON.parseJsonElement(indicatorJson).getString('color').toString().toUpperCase() ?? EMPTY_ATTR;
        const indicatorSelectedColor =
          JSON.parseJsonElement(indicatorJson).tryGetString('selectedColor').toUpperCase()
            ?? EMPTY_ATTR;
        const arrowColor = JSON.parseJsonElement(json)
          .getElement('$attrs')
          .tryGetString('selectedColor')
          .toUpperCase() ?? EMPTY_ATTR;
        const arrowBackgroundColor = JSON.parseJsonElement(json)
          .getElement('$attrs')
          .getString('arrowBackgroundColor')
          .toString()
          .toUpperCase()
          ?? EMPTY_ATTR;

        const checkIndicatorColor: string = colorValues?.get(`compBackgroundSecondary`)?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        const checkIndicatorSelectedColor: string = colorValues?.get(`compBackgroundEmphasize`)?.
        toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowColor: string = colorValues?.get(`iconPrimary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowBackgroundColor: string = colorValues?.get(`compBackgroundSecondary`)?.toString().toUpperCase()
          ?? EMPTY_CHECK;

        expect(indicatorColor).assertEqual(checkIndicatorColor);
        expect(indicatorSelectedColor).assertEqual(checkIndicatorSelectedColor);
        expect(arrowColor).assertEqual(checkArrowColor);
        expect(arrowBackgroundColor).assertEqual(checkArrowBackgroundColor);
      }

      {
        const json = inspector.getInspectorByKey(SwiperKeys.digitIndicatorSystem);
        const indicatorJson = JSON.parseJsonElement(json).getElement('$attrs').getString('indicator');
        const fontColor =
          JSON.parseJsonElement(indicatorJson).getString('fontColor').toString().toUpperCase() ?? EMPTY_ATTR;
        const selectedFontColor =
          JSON.parseJsonElement(indicatorJson).getString('selectedFontColor').toString().toUpperCase() ?? EMPTY_ATTR;

        const checkFontColor: string = colorValues?.get(`fontPrimary`)?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkSelectedFontColor: string = colorValues?.get(`fontPrimary`)?.toString().toUpperCase()
          ?? EMPTY_CHECK;

        expect(fontColor).assertEqual(checkFontColor);
        expect(selectedFontColor).assertEqual(checkSelectedFontColor);
      }

      console.info(`${SUITE} ${CASE} END`)
      done();
    });

    
    /**
     * @tc.number   ActsSwiperThemeColors_static_0200
     * @tc.name     ActsSwiperThemeColors_static_0200
     * @tc.desc     ActsSwiperThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsSwiperThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = `ActsSwiperThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      {
        const json = inspector.getInspectorByKey(SwiperKeys.dotIndicatorWithTheme);
        const indicatorJson = JSON.parseJsonElement(json).getElement('$attrs').getString('indicator').toString();
        const indicatorColor =
          JSON.parseJsonElement(indicatorJson).getString('color').toString().toUpperCase() ?? EMPTY_ATTR;
        const indicatorSelectedColor =
          JSON.parseJsonElement(indicatorJson).tryGetString('selectedColor').toUpperCase()
            ?? EMPTY_ATTR;
        const arrowColor = JSON.parseJsonElement(json)
          .getElement('$attrs')
          .tryGetString('selectedColor')
          .toUpperCase() ?? EMPTY_ATTR;
        const arrowBackgroundColor = JSON.parseJsonElement(json)
          .getElement('$attrs')
          .getString('arrowBackgroundColor')
          .toString()
          .toUpperCase()
          ?? EMPTY_ATTR;

        const checkIndicatorColor: string = localTheme?.colors?.compBackgroundSecondary?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        const checkIndicatorSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.
        toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowColor: string = localTheme?.colors?.iconPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowBackgroundColor: string = localTheme?.colors?.compBackgroundSecondary?.toString().toUpperCase()
          ?? EMPTY_CHECK;

        expect(indicatorColor).assertEqual(checkIndicatorColor);
        expect(indicatorSelectedColor).assertEqual(checkIndicatorSelectedColor);
        expect(arrowColor).assertEqual(checkArrowColor);
        expect(arrowBackgroundColor).assertEqual(checkArrowBackgroundColor);
      }

      {
        const json = inspector.getInspectorByKey(SwiperKeys.digitIndicatorWithTheme);
        const indicatorJson = JSON.parseJsonElement(json).getElement('$attrs').getString('indicator').toString();
        const fontColor =
          JSON.parseJsonElement(indicatorJson).getString('fontColor').toString().toUpperCase() ?? EMPTY_ATTR;
        const selectedFontColor =
          JSON.parseJsonElement(indicatorJson).getString('selectedFontColor').toString().toUpperCase()
            ?? EMPTY_ATTR;

        const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkSelectedFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase()
          ?? EMPTY_CHECK;

        expect(fontColor).assertEqual(checkFontColor);
        expect(selectedFontColor).assertEqual(checkSelectedFontColor);
      }

      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ActsSwiperThemeColors_static_0300
     * @tc.name     ActsSwiperThemeColors_static_0300
     * @tc.desc     ActsSwiperThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsSwiperThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsSwiperThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      {
        const json = inspector.getInspectorByKey(SwiperKeys.dotIndicatorWithTheme)
        const indicatorJson = JSON.parseJsonElement(json).getElement('$attrs').getString('indicator').toString()
        const indicatorColor =
          JSON.parseJsonElement(indicatorJson).getString('color').toString().toUpperCase() ?? EMPTY_ATTR;
        const indicatorSelectedColor =
          JSON.parseJsonElement(indicatorJson).tryGetString('selectedColor').toUpperCase()
            ?? EMPTY_ATTR;
        const arrowColor = JSON.parseJsonElement(json)
          .getElement('$attrs')
          .tryGetString('selectedColor')
          .toUpperCase() ?? EMPTY_ATTR;
        const arrowBackgroundColor = JSON.parseJsonElement(json)
          .getElement('$attrs')
          .getString('arrowBackgroundColor')
          .toUpperCase()
          ?? EMPTY_ATTR;

        const checkIndicatorColor: string = localTheme?.colors?.compBackgroundSecondary?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        const checkIndicatorSelectedColor: string = localTheme?.colors?.compBackgroundEmphasize?.
        toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowColor: string = localTheme?.colors?.iconPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkArrowBackgroundColor: string = localTheme?.colors?.compBackgroundSecondary?.toString().toUpperCase()
          ?? EMPTY_CHECK;

        expect(indicatorColor).assertEqual(checkIndicatorColor);
        expect(indicatorSelectedColor).assertEqual(checkIndicatorSelectedColor);
        expect(arrowColor).assertEqual(checkArrowColor);
        expect(arrowBackgroundColor).assertEqual(checkArrowBackgroundColor);
      }

      {
        const json = inspector.getInspectorByKey(SwiperKeys.digitIndicatorWithTheme);
        const indicatorJson = JSON.parseJsonElement(json).getElement('$attrs').getString('indicator').toString();
        const fontColor = JSON.parseJsonElement(indicatorJson).getString('fontColor').toString();
        const selectedFontColor = JSON.parseJsonElement(indicatorJson).getString('selectedFontColor').toString();

        const checkFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase() ?? EMPTY_CHECK;
        const checkSelectedFontColor: string = localTheme?.colors?.fontPrimary?.toString().toUpperCase()
          ?? EMPTY_CHECK;
        expect(fontColor).assertEqual(checkFontColor);
        expect(selectedFontColor).assertEqual(checkSelectedFontColor);
      }

      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  });
}