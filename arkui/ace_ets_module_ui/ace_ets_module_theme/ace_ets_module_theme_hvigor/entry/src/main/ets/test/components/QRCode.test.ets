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
import { QRCodeKeys, qrCodeThemeProperty } from '../../MainAbility/pages/components/QRCodePage';
import { greenCustomTheme, redCustomTheme } from '../../MainAbility/themes/CustomTheme';
import { frameTime, sleep } from '../Utils';
import { Theme, CustomTheme } from '@ohos.arkui.theme';
import { colorValuesKey } from '../../MainAbility/pages/index/index';

export default function qrCodeThemeTest() {
  const SUITE: string = `QRCodeThemeTest`;
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/QRCodePage`,
        };
        const pages: router.RouterState = router.getState();
        if (pages?.name !== `QRCodePage`) {
          await router.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(qrCodeThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          });
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });
    beforeEach(() => {
      if (!changeTheme) return
      if ((AppStorage.get(qrCodeThemeProperty) as Theme)?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate(qrCodeThemeProperty, greenCustomTheme);
      } else {
        AppStorage.setOrCreate(qrCodeThemeProperty, redCustomTheme);
      }
      localTheme = AppStorage.get<Theme>(qrCodeThemeProperty);
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
      * @tc.number    : ActsQRCodeThemeColors_0100
      * @tc.name      : ActsQRCodeThemeColors_0100
      * @tc.desc      : Check system colors values of QRCode component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsQRCodeThemeColors_0100`, 0, () => {
      const CASE: string = `ActsQRCodeThemeColors_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const qrCodeJSON = getInspectorByKey(QRCodeKeys.qrCodeSystem);
      const attrsQRCode = (JSON.parse(qrCodeJSON)?.$attrs as QRCodeAttribute);
      const backgroundColor = attrsQRCode?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkBackgroundColor = colorValues?.get(`backgroundPrimary`)?.toString().toUpperCase()
        ?? emptyCheck;
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
      * @tc.number    : ActsQRCodeThemeColors_0200
      * @tc.name      : ActsQRCodeThemeColors_0200
      * @tc.desc      : Check custom colors values of QRCode component
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsQRCodeThemeColors_0200`, 0, () => {
      const CASE: string = `ActsQRCodeThemeColors_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const qrCodeJSON = getInspectorByKey(QRCodeKeys.qrCodeWithTheme);
      const attrsQRCode = (JSON.parse(qrCodeJSON)?.$attrs as QRCodeAttribute);
      const backgroundColor = attrsQRCode?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkBackgroundColor = localTheme?.colors?.backgroundPrimary?.toString().toUpperCase()
        ?? emptyCheck;
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    })

    /**
      * @tc.number    : ActsQRCodeThemeColors_0300
      * @tc.name      : ActsQRCodeThemeColors_0300
      * @tc.desc      : Check custom colors values of QRCode component
      *                 after changing the theme
      * @tc.level     : Level 2
      * @tc.size      : MediumTest
      * @tc.type      : Function
      */
    it(`ActsQRCodeThemeColors_0300`, 0, async () => {
      const CASE: string = `ActsQRCodeThemeColors_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const qrCodeJSON = getInspectorByKey(QRCodeKeys.qrCodeWithTheme);
      const attrsQRCode = (JSON.parse(qrCodeJSON)?.$attrs as QRCodeAttribute);
      const backgroundColor = attrsQRCode?.backgroundColor?.toString().toUpperCase() ?? emptyAttr;
      const checkBackgroundColor = localTheme?.colors?.backgroundPrimary?.toString().toUpperCase()
        ?? emptyCheck;
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    });
  });
}