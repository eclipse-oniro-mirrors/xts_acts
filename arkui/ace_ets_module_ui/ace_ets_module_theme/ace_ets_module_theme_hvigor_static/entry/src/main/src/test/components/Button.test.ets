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
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import { frameTime, sleep } from '../Utils.test';
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { ButtonKeys, buttonThemeProperty } from '../../../ets/MainAbility/pages/components/ButtonPage';
import { CustomTheme, Theme } from '@ohos.arkui.theme';
import { ResourceColor } from '@ohos.arkui.component'

const buttonKeysSystemNormal: string[] = [
  ButtonKeys.buttonSystemNormalNormalNormal,
  ButtonKeys.buttonSystemNormalNormalSmall,
  ButtonKeys.buttonSystemErrorNormalNormal,
  ButtonKeys.buttonSystemErrorNormalSmall
];

const buttonKeysSystemEmphasized: string[] = [
  ButtonKeys.buttonSystemNormalEmphasizedNormal,
  ButtonKeys.buttonSystemNormalEmphasizedSmall,
  ButtonKeys.buttonSystemErrorEmphasizedNormal,
  ButtonKeys.buttonSystemErrorEmphasizedSmall
];

const buttonKeysSystemTextual: string[] = [
  ButtonKeys.buttonSystemNormalTextualNormal,
  ButtonKeys.buttonSystemNormalTextualSmall,
  ButtonKeys.buttonSystemErrorTextualNormal,
  ButtonKeys.buttonSystemErrorTextualSmall
];

const buttonKeyWithThemeNormal: string[] = [
  ButtonKeys.buttonWithThemeNormalNormalNormal,
  ButtonKeys.buttonWithThemeNormalNormalSmall,
  ButtonKeys.buttonWithThemeErrorNormalNormal,
  ButtonKeys.buttonWithThemeErrorNormalSmall,
];

const buttonKeyWithThemeEmphasized: string[] = [
  ButtonKeys.buttonWithThemeNormalEmphasizedNormal,
  ButtonKeys.buttonWithThemeNormalEmphasizedSmall,
  ButtonKeys.buttonWithThemeErrorEmphasizedNormal,
  ButtonKeys.buttonWithThemeErrorEmphasizedSmall
];

const buttonKeyWithThemeTextual: string[] = [
  ButtonKeys.buttonWithThemeNormalTextualNormal,
  ButtonKeys.buttonWithThemeNormalTextualSmall,
  ButtonKeys.buttonWithThemeErrorTextualSmall,
  ButtonKeys.buttonWithThemeErrorTextualSmall
];
const opacityColor = '#00000000';

export default function buttonThemeTest() {
  const SUITE: string = 'ButtonThemeTest';
  const errorKey = 'error';
  const emptyCheck = 'emptyCheck';
  const emptyAttr = 'emptyAttr';
  let localTheme: CustomTheme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      try {
        if (changeTheme) {
          if ((AppStorage.get(buttonThemeProperty) as CustomTheme | undefined)?.colors?.fontEmphasize
            == redCustomTheme?.colors?.fontEmphasize) {
            AppStorage.setOrCreate(buttonThemeProperty, greenCustomTheme);
          } else {
            AppStorage.setOrCreate(buttonThemeProperty, redCustomTheme);
          }
          localTheme = AppStorage.get<CustomTheme>(buttonThemeProperty);
          changeTheme = false;
        }

        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/ButtonPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `ButtonPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>('ButtonThemeProperty');
            console.info(`${SUITE} router.pushUrl success`);
          })
          await UtilsTest.msSleep(4000)
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues')
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });

    afterAll(() => {
      const router = AppStorage.get<Router>("router") as Router
      router.back()
    });

    
        
        
    
/**
     * @tc.number   ActsButtonThemeColors_static_0100
     * @tc.name     ActsButtonThemeColors_static_0100
     * @tc.desc     ActsButtonThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsButtonThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsButtonThemeColors_static_0100';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeysSystemNormal.forEach((buttonKey) => {
        const strJson = inspector.getInspectorByKey(buttonKey);
        const attrs = JSON.parseJsonElement(strJson).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase() ?? emptyAttr;
        const fontColor: string = attrs.getString('fontColor').toString().toUpperCase() ?? emptyAttr;
        const backgroundColorName: string = `compBackgroundTertiary`;
        const fontColorName: string = buttonKey.includes(errorKey) ? `warning` : `fontEmphasize`;
        const checkBackgroundColor: string = colorValues?.get(backgroundColorName) ?? emptyCheck;
        const checkFontColor: string = colorValues?.get(fontColorName) ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsButtonThemeColors_static_0200
     * @tc.name     ActsButtonThemeColors_static_0200
     * @tc.desc     ActsButtonThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsButtonThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsButtonThemeColors_static_0200';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeysSystemEmphasized.forEach((buttonKey) => {
        const strJson = inspector.getInspectorByKey(buttonKey);
        const attrs = JSON.parseJsonElement(strJson).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase() ?? emptyAttr;
        const fontColor: string = attrs.getString('fontColor').toString().toUpperCase();
        const backgroundColorName: string = buttonKey.includes(errorKey) ? `warning` : `fontEmphasize`;
        const fontColorName: string = 'fontOnPrimary';
        const checkBackgroundColor: string = colorValues?.get(backgroundColorName) ?? emptyCheck;
        const checkFontColor: string = colorValues?.get(fontColorName) ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsButtonThemeColors_static_0300
     * @tc.name     ActsButtonThemeColors_static_0300
     * @tc.desc     ActsButtonThemeColors_static_0300
     * @tc.level    Level.LEVEL2
     */
it('ActsButtonThemeColors_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsButtonThemeColors_static_0300';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeysSystemTextual.forEach((buttonKey) => {
        const strJson = inspector.getInspectorByKey(buttonKey);
        const attrs = JSON.parseJsonElement(strJson).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase() ?? emptyAttr;
        const fontColor: string = attrs.getString('fontColor').toString().toUpperCase() ?? emptyAttr;
        const fontColorName: string = buttonKey.includes(errorKey) ? `warning` : `fontEmphasize`;
        const checkBackgroundColor: string = opacityColor.toUpperCase();
        const checkFontColor: string = colorValues?.get(fontColorName) ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
        
        
    
/**
     * @tc.number   ActsButtonThemeColors_static_0400
     * @tc.name     ActsButtonThemeColors_static_0400
     * @tc.desc     ActsButtonThemeColors_static_0400
     * @tc.level    Level.LEVEL2
     */
it('ActsButtonThemeColors_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsButtonThemeColors_static_0400';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeyWithThemeNormal.forEach((buttonKey) => {
        const strJson = inspector.getInspectorByKey(buttonKey);
        const attrs = JSON.parseJsonElement(strJson).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase();
        const fontColor: string = attrs.getString('fontColor').toString().toUpperCase();
        const checkBackgroundColor: string =
          localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase() ?? emptyCheck;
        const checkFontColorString: ResourceColor | undefined = buttonKey.includes(errorKey) ?
          localTheme?.colors?.warning : localTheme?.colors?.fontEmphasize;
        const checkFontColor: string = checkFontColorString?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsButtonThemeColors_static_0500
     * @tc.name     ActsButtonThemeColors_static_0500
     * @tc.desc     ActsButtonThemeColors_static_0500
     * @tc.level    Level.LEVEL2
     */
it('ActsButtonThemeColors_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsButtonThemeColors_static_0500';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeyWithThemeEmphasized.forEach((buttonKey) => {
        const strJson = inspector.getInspectorByKey(buttonKey);
        const attrs = JSON.parseJsonElement(strJson).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase();
        const fontColor: string = attrs.getString('fontColor').toString().toUpperCase();
        const checkBackgroundColorString: ResourceColor | undefined = buttonKey.includes(errorKey)
          ? localTheme?.colors?.warning : localTheme?.colors?.backgroundEmphasize;
        const checkBackgroundColor: string = checkBackgroundColorString?.toString().toUpperCase() ?? emptyCheck;
        const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsButtonThemeColors_static_0600
     * @tc.name     ActsButtonThemeColors_static_0600
     * @tc.desc     ActsButtonThemeColors_static_0600
     * @tc.level    Level.LEVEL2
     */
it('ActsButtonThemeColors_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsButtonThemeColors_static_0600';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeyWithThemeTextual.forEach((buttonKey) => {
        const strJson = inspector.getInspectorByKey(buttonKey);
        const attrs = JSON.parseJsonElement(strJson).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase() ?? emptyAttr;
        const fontColor: string = attrs.getString('fontColor').toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = opacityColor.toUpperCase();
        const checkFontColorString: ResourceColor | undefined = buttonKey.includes(errorKey) ?
          localTheme?.colors?.warning : localTheme?.colors?.fontEmphasize;
        const checkFontColor: string = checkFontColorString?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
      changeTheme = true;
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsButtonThemeColors_static_0700
     * @tc.name     ActsButtonThemeColors_static_0700
     * @tc.desc     ActsButtonThemeColors_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ActsButtonThemeColors_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsButtonThemeColors_static_0700';
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      buttonKeyWithThemeNormal.forEach((buttonKey) => {
        const strJson = inspector.getInspectorByKey(buttonKey);
        const attrs = JSON.parseJsonElement(strJson).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase();
        const fontColor: string = attrs.getString('fontColor').toString().toUpperCase();
        const checkBackgroundColor: string = localTheme?.colors?.compBackgroundTertiary?.toString().toUpperCase()
          ?? emptyCheck;
        const checkFontColorString: ResourceColor | undefined = buttonKey.includes(errorKey) ?
          localTheme?.colors?.warning : localTheme?.colors?.fontEmphasize;
        const checkFontColor = checkFontColorString?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsButtonThemeColors_static_0800
     * @tc.name     ActsButtonThemeColors_static_0800
     * @tc.desc     ActsButtonThemeColors_static_0800
     * @tc.level    Level.LEVEL2
     */
it('ActsButtonThemeColors_static_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsButtonThemeColors_static_0800';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeyWithThemeEmphasized.forEach((buttonKey) => {
        const strJson = inspector.getInspectorByKey(buttonKey);
        const attrs = JSON.parseJsonElement(strJson).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase();
        const fontColor: string = attrs.getString('fontColor').toString().toUpperCase();
        const checkBackgroundColorString: ResourceColor | undefined = buttonKey.includes(errorKey) ?
          localTheme?.colors?.warning : localTheme?.colors?.backgroundEmphasize;
        const checkBackgroundColor: string = checkBackgroundColorString?.toString().toUpperCase() ?? emptyCheck;
        const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
      done();
    });


    
        
        
    
/**
     * @tc.number   ActsButtonThemeColors_static_0900
     * @tc.name     ActsButtonThemeColors_static_0900
     * @tc.desc     ActsButtonThemeColors_static_0900
     * @tc.level    Level.LEVEL2
     */
it('ActsButtonThemeColors_static_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsButtonThemeColors_static_0900';
      console.info(`${SUITE} ${CASE} START`);
      buttonKeyWithThemeTextual.forEach((buttonKey) => {
        const strJson = inspector.getInspectorByKey(buttonKey);
        const attrs = JSON.parseJsonElement(strJson).getElement('$attrs');
        const backgroundColor: string = attrs.getString('backgroundColor').toString().toUpperCase() ?? emptyAttr;
        const fontColor: string = attrs.getString('fontColor').toString().toUpperCase() ?? emptyAttr;
        const checkBackgroundColor: string = opacityColor.toUpperCase();
        const checkFontColorString: ResourceColor | undefined = buttonKey.includes(errorKey) ?
          localTheme?.colors?.warning : localTheme?.colors?.fontEmphasize;
        const checkFontColor: string = checkFontColorString?.toString().toUpperCase() ?? emptyCheck;
        expect(backgroundColor).assertEqual(checkBackgroundColor);
        expect(fontColor).assertEqual(checkFontColor);
      });
      console.info(`${SUITE} ${CASE} END`);
      changeTheme = true;
      done();
    });
  })
}