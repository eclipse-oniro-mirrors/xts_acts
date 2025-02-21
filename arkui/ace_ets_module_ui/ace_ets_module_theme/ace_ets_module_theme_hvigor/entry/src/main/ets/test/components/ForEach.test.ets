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
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { frameTime, sleep } from '../Utils';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import {
  dataSystemKey,
  dataSystemGroupKey,
  dataWithThemeKey,
  dataWithThemeGroupKey,
  forEachThemeProperty,
  DataForeach
} from '../../MainAbility/pages/components/ForEachPage';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

export default function forEachTest() {
  const SUITE: string = `ForEachThemeTest`;
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();
  let dataSystem: DataForeach[] | undefined = [];
  let dataSystemGroup: DataForeach[] | undefined = [];
  let dataWithTheme: DataForeach[] | undefined = [];
  let dataWithThemeGroup: DataForeach[] | undefined = [];

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/ForEachPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `ForEachPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(forEachThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
        dataSystem = AppStorage.get(dataSystemKey);
        dataSystemGroup = AppStorage.get(dataSystemGroupKey);
        dataWithTheme = AppStorage.get(dataWithThemeKey);
        dataWithThemeGroup = AppStorage.get(dataWithThemeGroupKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });
    beforeEach(() => {
      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get(forEachThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(forEachThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(forEachThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(forEachThemeProperty);
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
      * @tc.number    : ActsForEachThemeColors_0100
      * @tc.name      : ActsForEachThemeColors_0100
      * @tc.desc      : check system colors values of the LazyForEach component
      *                 isLunar = false
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsForEachThemeColors_0100`, 0, async () => {
      await sleep(frameTime);
      const CASE: string = `ActsForEachThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = getInspectorByKey(dataSystem?.[0]?.title);
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor: string = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor: string = colorValues?.get(`backgroundEmphasize`) ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs?.fontColor?.toString().toUpperCase() ?? '';
      const checkFontColor: string = colorValues?.get(`fontOnPrimary`) ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsForEachThemeColors_0200
      * @tc.name      : ActsForEachThemeColors_0200
      * @tc.desc      : check custom colors values of the LazyForEach component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsForEachThemeColors_0200`, 0, () => {
      const CASE: string = `ActsForEachThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = getInspectorByKey(dataWithTheme?.[0]?.title);
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor: string = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs?.fontColor?.toString().toUpperCase();
      const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsForEachThemeColors_0300
      * @tc.name      : ActsForEachThemeColors_0300
      * @tc.desc      : check system colors values of the LazyForEach component
      *                 after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsForEachThemeColors_0300`, 0, async () => {
      const CASE: string = `ActsForEachThemeColors_0300`
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);  // update item
      await sleep(frameTime); // update theme
      const buttonJSON = getInspectorByKey(dataWithTheme?.[0]?.title);
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor: string = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs?.fontColor?.toString().toUpperCase();
      const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`)
    });
    /**
      * @tc.number    : ActsForEachThemeColors_0400
      * @tc.name      : ActsForEachThemeColors_0400
      * @tc.desc      : check system colors values of the LazyForEach component with ListGroup
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsForEachThemeColors_0400`, 0, async () => {
      await sleep(frameTime);;
      const CASE: string = `ActsForEachThemeColors_0400`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = getInspectorByKey(dataSystemGroup?.[0]?.title);
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor: string = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor: string = colorValues?.get(`backgroundEmphasize`) ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs?.fontColor?.toString().toUpperCase() ?? '';
      const checkFontColor: string = colorValues?.get(`fontOnPrimary`) ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsForEachThemeColors_0500
      * @tc.name      : ActsForEachThemeColors_0500
      * @tc.desc      : check custom colors values of the LazyForEach component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsForEachThemeColors_0500`, 0, () => {
      const CASE: string = `ActsForEachThemeColors_0500`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = getInspectorByKey(dataWithThemeGroup?.[0]?.title);
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor: string = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs?.fontColor?.toString().toUpperCase();
      const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsForEachThemeColors_0600
      * @tc.name      : ActsForEachThemeColors_0600
      * @tc.desc      : check system colors values of the LazyForEach component
      *                 after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsForEachThemeColors_0600`, 0, async () => {
      const CASE: string = `ActsForEachThemeColors_0600`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);  // update item
      const buttonJSON = getInspectorByKey(dataWithThemeGroup?.[0]?.title);
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor: string = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs?.fontColor?.toString().toUpperCase();
      const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`)
    });
  });
}