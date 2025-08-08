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
import router from '@ohos.router';
import { afterAll, beforeAll, beforeEach, describe, it, expect , Level} from '@ohos/hypium';
import { DividerKeys, dividerThemeProperty } from '../../MainAbility/pages/components/DividerPage';
import { colorValuesKey } from '../../MainAbility/pages/index/index';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';

export default function dividerThemeTest() {
  const SUITE: string = `DividerThemeTest`;
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let redTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/DividerPage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `DividerPage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(dividerThemeProperty);
            redTheme = AppStorage.get<Theme>(dividerThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      }
      catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })
    beforeEach(() => {
      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get(dividerThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(dividerThemeProperty, greenCustomTheme);
      }
      else {
        AppStorage.setOrCreate(dividerThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(dividerThemeProperty);
      redTheme = AppStorage.get<Theme>(dividerThemeProperty);
      changeTheme = false;
    });
    afterAll(() => {
      try {
        router.back();
      }
      catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });
    /**
      * @tc.number    : ActsDividerThemeColors_0100
      * @tc.name      : ActsDividerThemeColors_0100
      * @tc.desc      : check system colors values of the Divider component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsDividerThemeColors_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsDividerThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const dividerJSON = getInspectorByKey(DividerKeys.dividerSystem);
      const dividerAttrs: DividerAttribute = JSON.parse(dividerJSON).$attrs;
      const color: string = dividerAttrs?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = colorValues?.get(`compDivider`) ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsDividerThemeColors_0200
      * @tc.name      : ActsDividerThemeColors_0200
      * @tc.desc      : check custom colors values of the Divider component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsDividerThemeColors_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsDividerThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const dividerJSON = getInspectorByKey(DividerKeys.dividerWithTheme);
      const indexerAttrs: DividerAttribute = JSON.parse(dividerJSON).$attrs;
      const color: string = indexerAttrs?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.compDivider?.toString() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsDividerThemeColors_0300
      * @tc.name      : ActsDividerThemeColors_0300
      * @tc.desc      : check system colors values of the Divider component
      *                 after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsDividerThemeColors_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsDividerThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const dividerJSON = getInspectorByKey(DividerKeys.dividerWithTheme);
      const indexerAttrs: DividerAttribute = JSON.parse(dividerJSON).$attrs;
      const color: string = indexerAttrs?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = localTheme?.colors?.compDivider?.toString() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });

    /**
      * @tc.number    : ActsDividerThemeColors_0400
      * @tc.name      : ActsDividerThemeColors_0400
      * @tc.desc      : check custom colors values of the Divider component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsDividerThemeColors_0400`, Level.LEVEL0, async () => {
      const CASE: string = `ActsDividerThemeColors_0400`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const dividerJSON = getInspectorByKey(DividerKeys.dividerWithRedTheme);
      const indexerAttrs: DividerAttribute = JSON.parse(dividerJSON).$attrs;
      const color: string = indexerAttrs?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = redTheme?.colors?.compDivider?.toString() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsDividerThemeColors_0500
      * @tc.name      : ActsDividerThemeColors_0500
      * @tc.desc      : check system colors values of the Divider component
      *                 after change theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsDividerThemeColors_0500`, Level.LEVEL0, async () => {
      const CASE: string = `ActsDividerThemeColors_0500`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const dividerJSON = getInspectorByKey(DividerKeys.dividerWithRedTheme);
      const indexerAttrs: DividerAttribute = JSON.parse(dividerJSON).$attrs;
      const color: string = indexerAttrs?.color?.toString().toUpperCase() ?? emptyAttr;
      const checkColor: string = redTheme?.colors?.compDivider?.toString() ?? emptyCheck;
      expect(color).assertEqual(checkColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });


  })
}