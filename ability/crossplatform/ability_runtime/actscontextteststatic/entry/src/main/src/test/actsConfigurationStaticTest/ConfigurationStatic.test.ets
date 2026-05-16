/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from '../Util.test';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import configurationConstant from '@ohos.app.ability.ConfigurationConstant';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext | undefined;

export default function ConfigurationStatic() {
  describe('ConfigurationStatic', () => {

    beforeAll(async() => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.contexttest.static")
      await Utils.msSleep(2000);
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'beforeAll end');
    })


    /**
     * @tc.name   testColorModeStatic001
     * @tc.number ABILITY_TEST_COLORMODE_Static_0100
     * @tc.desc   test filed of colorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testColorModeStatic001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let colorMode = AppStorage.get<ConfigurationConstant.ColorMode>("colorMode");
        hilog.info(domain, tag, '%{public}s', `testColorModeStatic001 colorMode:` + colorMode);
        if (colorMode == configurationConstant.ColorMode.COLOR_MODE_NOT_SET) {
          expect(context!.config.colorMode).assertEqual(configurationConstant.ColorMode.COLOR_MODE_NOT_SET);
        } else if (colorMode == configurationConstant.ColorMode.COLOR_MODE_DARK) {
          expect(context!.config.colorMode).assertEqual(configurationConstant.ColorMode.COLOR_MODE_DARK);
          expect(context!.config.colorMode != configurationConstant.ColorMode.COLOR_MODE_NOT_SET).assertTrue();
          expect(context!.config.colorMode != configurationConstant.ColorMode.COLOR_MODE_LIGHT).assertTrue();
        } else if (colorMode == configurationConstant.ColorMode.COLOR_MODE_LIGHT) {
          expect(context!.config.colorMode).assertEqual(configurationConstant.ColorMode.COLOR_MODE_LIGHT);
          expect(context!.config.colorMode != configurationConstant.ColorMode.COLOR_MODE_NOT_SET).assertTrue();
          expect(context!.config.colorMode != configurationConstant.ColorMode.COLOR_MODE_DARK).assertTrue();
        }
        hilog.info(domain, tag, '%{public}s', `testColorModeStatic001 success`);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `testColorModeStatic001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testDirectionStatic001
     * @tc.number ABILITY_TEST_DIRECTION_Static_0100
     * @tc.desc   test filed of direction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectionStatic001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let direction = AppStorage.get<ConfigurationConstant.Direction>("direction");
        hilog.info(domain, tag, '%{public}s', `testDirectionStatic001 direction:` + direction);
        if (direction == configurationConstant.Direction.DIRECTION_NOT_SET) {
          expect(context!.config.direction).assertEqual(configurationConstant.Direction.DIRECTION_NOT_SET);
        } else if (direction == configurationConstant.Direction.DIRECTION_VERTICAL) {
          expect(context!.config.direction).assertEqual(configurationConstant.Direction.DIRECTION_VERTICAL);
          expect(context!.config.direction != configurationConstant.Direction.DIRECTION_NOT_SET).assertTrue();
          expect(context!.config.direction != configurationConstant.Direction.DIRECTION_HORIZONTAL).assertTrue();
        } else if (direction == configurationConstant.Direction.DIRECTION_HORIZONTAL) {
          expect(context!.config.direction).assertEqual(configurationConstant.Direction.DIRECTION_HORIZONTAL);
          expect(context!.config.direction != configurationConstant.Direction.DIRECTION_NOT_SET).assertTrue();
          expect(context!.config.direction != configurationConstant.Direction.DIRECTION_VERTICAL).assertTrue();
        }
        hilog.info(domain, tag, '%{public}s', `testDirectionStatic001 success`);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `testDirectionStatic001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0100
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0100
     * @tc.desc   colorMode is "ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0100-------------");
      expect(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT + '').assertEqual('1');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0100-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0200
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0200
     * @tc.desc   colorMode is "ConfigurationConstant.ColorMode.COLOR_MODE_DARK"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0200-------------");
      expect(ConfigurationConstant.ColorMode.COLOR_MODE_DARK + '').assertEqual('0');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0200-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0300
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0300
     * @tc.desc   colorMode is "ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0300-------------");
      expect(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET + '').assertEqual('-1');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_colorMode_Static_0300-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0100
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0100
     * @tc.desc   Direction is "ConfigurationConstant.Direction.DIRECTION_VERTICAL"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0100-------------");
      expect(ConfigurationConstant.Direction.DIRECTION_VERTICAL + '').assertEqual('0');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0100-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0200
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0200
     * @tc.desc   Direction is "ConfigurationConstant.Direction.DIRECTION_HORIZONTAL"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0200-------------");
      expect(ConfigurationConstant.Direction.DIRECTION_HORIZONTAL + '').assertEqual('1');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0200-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0300
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0300
     * @tc.desc   Direction is "ConfigurationConstant.Direction.DIRECTION_NOT_SET"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0300-------------");
      expect(ConfigurationConstant.Direction.DIRECTION_NOT_SET + '').assertEqual('-1');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_Direction_Static_0300-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0100
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0100
     * @tc.desc   ScreenDensity is "ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_SDPI"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0100-------------");
      expect(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_SDPI + '').assertEqual('120');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0100-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0200
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0200
     * @tc.desc   ScreenDensity is "ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_MDPI"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0200-------------");
      expect(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_MDPI + '').assertEqual('160');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0200-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0300
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0300
     * @tc.desc   ScreenDensity is "ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_LDPI"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0300-------------");
      expect(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_LDPI + '').assertEqual('240');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0300-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0400
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0400
     * @tc.desc   ScreenDensity is "ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XLDPI"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0400-------------");
      expect(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XLDPI + '').assertEqual('320');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0400-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0500
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0500
     * @tc.desc   ScreenDensity is "ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XXLDPI"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0500-------------");
      expect(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XXLDPI + '').assertEqual('480');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0500-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0600
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0600
     * @tc.desc   ScreenDensity is "ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XXXLDPI"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0600-------------");
      expect(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XXXLDPI + '').assertEqual('640');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0600-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0700
     * @tc.number SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0700
     * @tc.desc   ScreenDensity is "ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_NOT_SET"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0700-------------");
      expect(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_NOT_SET + '').assertEqual('0');
      done();
      console.log("------------end SUB_AA_OpenHarmony_ConfigurationConstant_ScreenDensity_Static_0700-------------");
    });

    /**
     * @tc.name   SUB_AA_OpenHarmony_Configuration_Static_0100
     * @tc.number SUB_AA_OpenHarmony_Configuration_Static_0100
     * @tc.desc   test Property of Configuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_Configuration_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("------------start SUB_AA_OpenHarmony_Configuration_Static_0100-------------");
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.language: ' + context!.config.language);
      expect(context!.config.language).not().assertUndefined();
      expect(context!.config.language).not().assertNull();
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.colorMode: ' + context!.config.colorMode);
      expect(context!.config.colorMode).not().assertUndefined();
      expect(context!.config.colorMode).not().assertNull();
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.direction: ' + context!.config.direction);
      expect(context!.config.direction).not().assertUndefined();
      expect(context!.config.direction).not().assertNull();
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.screenDensity: ' + context!.config.screenDensity);
      expect(context!.config.screenDensity).not().assertUndefined();
      expect(context!.config.screenDensity).not().assertNull();
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.displayId: ' + context!.config.displayId);
      expect(context!.config.displayId).not().assertUndefined();
      expect(context!.config.displayId).not().assertNull();
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.hasPointerDevice: ' + context!.config.hasPointerDevice);
      expect(context!.config.hasPointerDevice).not().assertUndefined();
      expect(context!.config.hasPointerDevice).not().assertNull();
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.fontId: ' + context!.config.fontId);
      expect(context!.config.fontId).not().assertUndefined();
      expect(context!.config.fontId).not().assertNull();
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.fontSizeScale: ' + context!.config.fontSizeScale);
      expect(context!.config.fontSizeScale).not().assertUndefined();
      expect(context!.config.fontSizeScale).not().assertNull();
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.fontWeightScale: ' + context!.config.fontWeightScale);
      expect(context!.config.fontWeightScale).not().assertUndefined();
      expect(context!.config.fontWeightScale).not().assertNull();
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.mcc: ' + context!.config.mcc);
      expect(context!.config.mcc).not().assertUndefined();
      expect(context!.config.mcc).not().assertNull();
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.mnc: ' + context!.config.mnc);
      expect(context!.config.mnc).not().assertUndefined();
      expect(context!.config.mnc).not().assertNull();
      hilog.info(domain, tag, 'SUB_AA_OpenHarmony_Configuration_Static_0100 config.locale: ' + context!.config.locale);
      expect(context!.config.locale).not().assertUndefined();
      expect(context!.config.locale).not().assertNull();
      done();
      console.log("------------end SUB_AA_OpenHarmony_Configuration_Static_0100-------------");
    });
  })
}
