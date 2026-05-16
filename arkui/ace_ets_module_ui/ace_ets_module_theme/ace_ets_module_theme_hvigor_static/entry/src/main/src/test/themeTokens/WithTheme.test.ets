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
import { CustomTheme, Theme, ThemeControl } from '@ohos.arkui.theme';
import { Resource, ResourceColor } from '@ohos.arkui.component'
import { greenThemeColors } from '../../../ets/MainAbility/themes/customTheme/GreenCustomThemeColor';
import { customButtonTheme } from '../../../ets/MainAbility/pages/customComponents/CustomButton';
import { brownThemeColors } from '../../../ets/MainAbility/themes/customTheme/BrownCustomThemeColor';
import { customButtonNestedTheme } from '../../../ets/MainAbility/pages/customComponents/CustomButtonNested';
import {
  postfixDark,
  postfixLight,
  withThemeProperty
} from '../../../ets/MainAbility/pages/themeTokensPages/WithThemeTestPage';
import { redThemeColors } from '../../../ets/MainAbility/themes/customTheme/RedCustomThemeColor';
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { fillMap, frameTime, sleep } from '../Utils.test';
import { customButtonSystemTheme } from '../../../ets/MainAbility/pages/customComponents/CustomButtonSystem';
import { customButtonLightTheme } from '../../../ets/MainAbility/pages/customComponents/CustomColorsLight';
import { customButtonDarkTheme } from '../../../ets/MainAbility/pages/customComponents/CustomColorsDark';
import { checkColorTokens } from '../../../ets/MainAbility/themes/checkSystemTokens/CheckColorTokens';
import { Colors } from '../../../ets/MainAbility/themes/checkSystemTokens/colorValues/ColorsTokens';
import { colorsForCheck } from '../../../ets/MainAbility/pages/themeTokensPages/SystemColorsForCheck';

export default function withThemeTest() {
  const SUITE: string = 'WithTheme';
  let themeLocal: Theme | undefined;
  let themeLocalNested: Theme | undefined;
  let themeLocalSystem: Theme | undefined;
  let themeLocalLight: Theme | undefined;
  let themeLocalDark: Theme | undefined;
  let changeTheme: boolean = false;

  describe('ActsWithThemeTest', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      
    })

    beforeEach(() => {
      try {
        const options: router.RouterOptions = {
          url: "MainAbility/pages/themeTokensPages/WithThemeTestPage",
        };
        const routerInstance = AppStorage.get<Router>("router") as Router
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== "MainAbility/pages/themeTokensPages/WithThemeTestPage") {
          routerInstance.pushUrl(options).then(() => {
            themeLocal = customButtonTheme;
            themeLocalNested = customButtonNestedTheme;
            themeLocalSystem = customButtonSystemTheme;
            themeLocalLight = customButtonLightTheme;
            themeLocalDark = customButtonDarkTheme;
            console.info(`${SUITE} router.pushUrl success`);
          });
          await UtilsTest.msSleep(2000)
        }
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      if (changeTheme) {
        if ((AppStorage.get(withThemeProperty) as CustomTheme | undefined)?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate(withThemeProperty, greenCustomTheme);
        } else {
          AppStorage.setOrCreate(withThemeProperty, redCustomTheme);
        }
        changeTheme = false;
      }
    });

    afterAll(() => {
      ThemeControl.setDefaultTheme(undefined);
      const router = AppStorage.get<Router>("router") as Router
      router.back()
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_0100
     * @tc.name     ActsWithThemeColors_static_0100
     * @tc.desc     ActsWithThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsWithThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsWithThemeColors_static_0100';
      console.info(`${SUITE} ${CASE} START`);
      const checkKeys: string[] = Object.keys(greenThemeColors);
      const checkValues = (Object.values(greenThemeColors) as Object as string[]);
      const themeKeys: string[] = themeLocal?.colors === undefined ?
        [] : Object.keys(themeLocal!.colors!);
      const themeValues: string[] = themeLocal?.colors === undefined ?
        [] : (Object.values(themeLocal!.colors!) as Object as string[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, string> = new Map<string, string>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<string>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: string;
        themeToken = value;
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_0200
     * @tc.name     ActsWithThemeColors_static_0200
     * @tc.desc     ActsWithThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsWithThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsWithThemeColors_static_0200';
      console.info(`${SUITE} ${CASE} START`);
      const checkKeys: string[] = Object.keys(brownThemeColors);
      const checkValues :string[]  = (Object.values(brownThemeColors) as Object as string[]);
      const themeKeys: string[] = themeLocalNested?.colors === undefined ?
        [] : Object.keys(themeLocalNested!.colors!);
      const themeValues: string[]  = themeLocalNested?.colors === undefined ?
        [] : (Object.values(themeLocalNested!.colors!) as Object as string[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, string> = new Map<string, string>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<string>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: string;
        themeToken = value;
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_0300
     * @tc.name     ActsWithThemeColors_static_0300
     * @tc.desc     ActsWithThemeColors_static_0300
     * @tc.level    Level.LEVEL2
     */
it('ActsWithThemeColors_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsWithThemeColors_static_0300';
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      themeLocal = customButtonTheme;
      const checkKeys: string[] = Object.keys(redThemeColors);
      const checkValues :string[] = (Object.values(redThemeColors) as Object as string[]);
      const themeKeys: string[] = themeLocal?.colors === undefined ?
        [] : Object.keys(themeLocal!.colors!);
      const themeValues: string[] = themeLocal?.colors === undefined ?
        [] : Object.values(themeLocal!.colors!) as Object as string[];
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, string> = new Map<string, string>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<string>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: string;
        themeToken = value;
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_0400
     * @tc.name     ActsWithThemeColors_static_0400
     * @tc.desc     ActsWithThemeColors_static_0400
     * @tc.level    Level.LEVEL2
     */
it('ActsWithThemeColors_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsWithThemeColors_static_0400';
      console.info(`${SUITE} ${CASE} START`);
      const checkKeys: string[] = Object.keys(brownThemeColors);
      const checkValues :string[] = (Object.values(brownThemeColors) as Object as string[]);
      const themeKeys: string[] = themeLocalNested?.colors === undefined ?
        [] : Object.keys(themeLocalNested!.colors!);
      const themeValues: string[] = themeLocalNested?.colors === undefined ?
        [] : Object.values(themeLocalNested!.colors!) as Object as string[];
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, string> = new Map<string, string>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<string>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken: string;
        themeToken = value;
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_0500
     * @tc.name     ActsWithThemeColors_static_0500
     * @tc.desc     ActsWithThemeColors_static_0500
     * @tc.level    Level.LEVEL2
     */
it('ActsWithThemeColors_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = 'ActsWithThemeColors_static_0500';
      console.info(`${SUITE} ${CASE} START`);
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = Object.values(checkColorTokens) as Object as string[];
      let themeKeys: string[] = themeLocalSystem?.colors === undefined ?
      [] : Object.keys(themeLocalSystem!.colors! as Object);
      let themeValues: Resource[] = themeLocalSystem?.colors === undefined ?
      [] : Object.values(themeLocalSystem!.colors!) as Object as Resource[];
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_0600
     * @tc.name     ActsWithThemeColors_static_0600
     * @tc.desc     ActsWithThemeColors_static_0600
     * @tc.level    Level.LEVEL2
     */
it('ActsWithThemeColors_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = 'ActsWithThemeColors_static_0600';
      console.info(`${SUITE} ${CASE} START`);
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = Object.values(checkColorTokens) as Object as string[];
      let themeKeys: string[] = themeLocalLight?.colors === undefined ?
      [] : Object.keys(themeLocalLight!.colors! as Object);
      let themeValues: Resource[] = themeLocalLight?.colors === undefined ?
      [] : Object.values(themeLocalLight!.colors!) as Object as Resource[];
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_0700
     * @tc.name     ActsWithThemeColors_static_0700
     * @tc.desc     ActsWithThemeColors_static_0700
     * @tc.level    Level.LEVEL2
     */
it('ActsWithThemeColors_static_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = 'ActsWithThemeColors_static_0700';
      console.info(`${SUITE} ${CASE} START`);
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = Object.values(checkColorTokens) as Object as string[];
      let themeKeys: string[] = themeLocalDark?.colors === undefined ?
      [] : Object.keys(themeLocalDark!.colors! as Object);
      let themeValues: Resource[] = themeLocalDark?.colors === undefined ?
      [] : Object.values(themeLocalDark!.colors!) as Object as Resource[];
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_0800
     * @tc.name     ActsWithThemeColors_static_0800
     * @tc.desc     ActsWithThemeColors_static_0800
     * @tc.level    Level.LEVEL2
     */
it('ActsWithThemeColors_static_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = 'ActsWithThemeColors_static_0800'
      console.info(`${SUITE} ${CASE} START`);
      // ThemeControl.setDefaultTheme(undefined);
      themeLocalSystem = customButtonSystemTheme;
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = Object.values(checkColorTokens) as Object as string[];
      let themeKeys: string[] = themeLocalSystem?.colors === undefined ?
      [] : Object.keys(themeLocalSystem!.colors! as Object);
      let themeValues: Resource[] = themeLocalSystem?.colors === undefined ?
      [] : Object.values(themeLocalSystem!.colors!) as Object as Resource[];
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_0900
     * @tc.name     ActsWithThemeColors_static_0900
     * @tc.desc     ActsWithThemeColors_static_0900
     * @tc.level    Level.LEVEL2
     */
it('ActsWithThemeColors_static_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = 'ActsWithThemeColors_static_0900';
      console.info(`${SUITE} ${CASE} START`);
      // ThemeControl.setDefaultTheme(undefined);
      themeLocalLight = customButtonLightTheme;
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = Object.values(checkColorTokens) as Object as string[];
      let themeKeys: string[] = themeLocalLight?.colors === undefined ?
      [] : Object.keys(themeLocalLight!.colors! as Object);
      let themeValues: Resource[] = themeLocalLight?.colors === undefined ?
      [] : Object.values(themeLocalLight!.colors!) as Object as Resource[];
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_1000
     * @tc.name     ActsWithThemeColors_static_1000
     * @tc.desc     ActsWithThemeColors_static_1000
     * @tc.level    Level.LEVEL2
     */
it('ActsWithThemeColors_static_1000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = 'ActsWithThemeColors_static_1000';
      console.info(`${SUITE} ${CASE} START`);
      // ThemeControl.setDefaultTheme(undefined);
      themeLocalDark = customButtonDarkTheme;
      let checkKeys: string[] = Object.keys(checkColorTokens);
      let checkValues = Object.values(checkColorTokens) as Object as string[];
      let themeKeys: string[] = themeLocalDark?.colors === undefined ?
      [] : Object.keys(themeLocalDark!.colors! as Object);
      let themeValues: Resource[] = themeLocalDark?.colors === undefined ?
      [] : Object.values(themeLocalDark!.colors!) as Object as Resource[];
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      expect(themeMap.size).assertLarger(0);
      themeMap.forEach(((value, key) => {
        let themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_1100
     * @tc.name     ActsWithThemeColors_static_1100
     * @tc.desc     ActsWithThemeColors_static_1100
     * @tc.level    Level.LEVEL2
     */
it('ActsWithThemeColors_static_1100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsWithThemeColors_static_1100';
      console.info(`${SUITE} ${CASE} START`);
      Colors.colors.forEach((item, key): void => {
        const strJson = inspector.getInspectorByKey(`${key}${colorsForCheck}${postfixLight}`);
        const checkColor =
          (JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor') as ResourceColor)
            .toString().toUpperCase();
        const themeJson = inspector.getInspectorByKey(`${key}${postfixLight}`);
        const themeColor =
          (JSON.parseJsonElement(themeJson).getElement('$attrs').getString('backgroundColor') as ResourceColor)
            .toString().toUpperCase();
        expect(themeColor).assertEqual(checkColor);
      })
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsWithThemeColors_static_1200
     * @tc.name     ActsWithThemeColors_static_1200
     * @tc.desc     ActsWithThemeColors_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ActsWithThemeColors_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsWithThemeColors_static_1200';
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      Colors.colors.forEach((item: string, key: string): void => {
        const strJson = inspector.getInspectorByKey(`${key}${colorsForCheck}${postfixDark}`);
        const checkColor =
          (JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor') as ResourceColor)
            .toString().toUpperCase();
        const themeJson = inspector.getInspectorByKey(`${key}${postfixDark}`);
        const themeColor =
          (JSON.parseJsonElement(themeJson).getElement('$attrs').getString('backgroundColor') as ResourceColor)
            .toString().toUpperCase();
        expect(themeColor).assertEqual(checkColor);
      })
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  })
}
