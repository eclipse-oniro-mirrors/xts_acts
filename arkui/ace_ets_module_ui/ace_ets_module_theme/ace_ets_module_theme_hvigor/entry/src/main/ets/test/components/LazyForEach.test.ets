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
import { afterAll, beforeAll, beforeEach, describe, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router'
import { colorValuesKey } from '../../MainAbility/pages/index/index'
import { frameTime, sleep } from '../Utils'
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme'
import {
  dataSystemKey,
  dataSystemGroupKey,
  dataWithThemeKey,
  dataWithThemeGroupKey,
  lazyForEachThemeProperty,
  MyDataSource
} from '../../MainAbility/pages/components/LazyForEachPage'
import { Theme, CustomTheme } from '@ohos.arkui.theme'

export default function lazyForEachTest() {
  const SUITE: string = `LazyForEachThemeTest`
  let localTheme: CustomTheme | undefined
  let changeTheme: boolean = false
  let colorValues: Map<string, string> | undefined = new Map<string, string>()
  let dataSystem: MyDataSource | undefined = new MyDataSource()
  let dataWithTheme: MyDataSource | undefined = new MyDataSource()
  let dataSystemGroup: MyDataSource | undefined = new MyDataSource()
  let dataWithThemeGroup: MyDataSource | undefined = new MyDataSource()

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/LazyForEachPage`,
        }
        const pages: router.RouterState = router.getState()
        if (pages?.name !== `LazyForEachPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(lazyForEachThemeProperty)
            console.info(`${SUITE} router.pushUrl success`)
          })
        }
        colorValues = AppStorage.get(colorValuesKey)
        dataSystem = AppStorage.get(dataSystemKey)
        dataWithTheme = AppStorage.get(dataWithThemeKey)
        dataSystemGroup = AppStorage.get(dataSystemGroupKey)
        dataWithThemeGroup = AppStorage.get(dataWithThemeGroupKey)
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err))
      }
    })

    beforeEach(() => {
      if (!changeTheme) return
      if ((AppStorage.get(lazyForEachThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(lazyForEachThemeProperty, greenCustomTheme)
      } else {
        AppStorage.setOrCreate(lazyForEachThemeProperty, redCustomTheme)
      }
      localTheme = AppStorage.get<Theme>(lazyForEachThemeProperty)
      changeTheme = false
    })

    afterAll(() => {
      try {
        router.back()
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err))
      }
    });
    /**
     * @tc.name   ActsLazyForEachThemeColors_0100
     * @tc.number ActsLazyForEachThemeColors_0100
     * @tc.desc   check system colors values of the LazyForEach component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsLazyForEachThemeColors_0100`, Level.LEVEL0, async () => {
      await sleep(frameTime);
      const CASE: string = `ActsLazyForEachThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = getInspectorByKey(dataSystem?.getData(0));
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor = colorValues?.get(`backgroundEmphasize`);
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor = buttonAttrs?.fontColor?.toString().toUpperCase();
      const checkFontColor = colorValues?.get(`fontOnPrimary`);
      expect(fontColor).assertEqual(checkFontColor);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.name   ActsLazyForEachThemeColors_0200
     * @tc.number ActsLazyForEachThemeColors_0200
     * @tc.desc   check custom colors values of the LazyForEach component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it(`ActsLazyForEachThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsLazyForEachThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = getInspectorByKey(dataWithTheme?.getData(0));
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor = localTheme?.colors?.backgroundEmphasize;
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor = buttonAttrs?.fontColor?.toString().toUpperCase();
      const checkFontColor = localTheme?.colors?.fontOnPrimary;
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.name   ActsLazyForEachThemeColors_0300
     * @tc.number ActsLazyForEachThemeColors_0300
     * @tc.desc   check system colors values of the LazyForEach component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsLazyForEachThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsLazyForEachThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);  // update item
      await sleep(frameTime);  // update theme
      const buttonJSON = getInspectorByKey(dataWithTheme?.getData(0));
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor = localTheme?.colors?.backgroundEmphasize;
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor = buttonAttrs?.fontColor?.toString().toUpperCase();
      const checkFontColor = localTheme?.colors?.fontOnPrimary;
      expect(fontColor).assertEqual(checkFontColor);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.name   ActsLazyForEachThemeColors_0400
     * @tc.number ActsLazyForEachThemeColors_0400
     * @tc.desc   check system colors values of the LazyForEach component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsLazyForEachThemeColors_0400`, Level.LEVEL0, async () => {
      await sleep(frameTime);
      const CASE: string = `ActsLazyForEachThemeColors_0400`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = getInspectorByKey(dataSystemGroup?.getData(0));
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor = colorValues?.get(`backgroundEmphasize`);
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor = buttonAttrs?.fontColor?.toString().toUpperCase();
      const checkFontColor = colorValues?.get(`fontOnPrimary`);
      expect(fontColor).assertEqual(checkFontColor);
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
     * @tc.name   ActsLazyForEachThemeColors_0500
     * @tc.number ActsLazyForEachThemeColors_0500
     * @tc.desc   check custom colors values of the LazyForEach component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it(`ActsLazyForEachThemeColors_0500`, Level.LEVEL2, () => {
      const CASE: string = `ActsLazyForEachThemeColors_0500`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = getInspectorByKey(dataWithThemeGroup?.getData(0));
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor = localTheme?.colors?.backgroundEmphasize;
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor = buttonAttrs?.fontColor?.toString().toUpperCase();
      const checkFontColor = localTheme?.colors?.fontOnPrimary;
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.name   ActsLazyForEachThemeColors_0600
     * @tc.number ActsLazyForEachThemeColors_0600
     * @tc.desc   check system colors values of the LazyForEach component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`ActsLazyForEachThemeColors_0600`, Level.LEVEL0, async () => {
      const CASE: string = `ActsLazyForEachThemeColors_0600`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);  // update item
      const buttonJSON = getInspectorByKey(dataWithThemeGroup?.getData(0));
      const buttonAttrs: ButtonAttribute = JSON.parse(buttonJSON).$attrs;
      const backgroundColor = buttonAttrs?.backgroundColor?.toString().toUpperCase();
      const checkBackgroundColor = localTheme?.colors?.backgroundEmphasize;
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor = buttonAttrs?.fontColor?.toString().toUpperCase();
      const checkFontColor = localTheme?.colors?.fontOnPrimary;
      expect(fontColor).assertEqual(checkFontColor);
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}