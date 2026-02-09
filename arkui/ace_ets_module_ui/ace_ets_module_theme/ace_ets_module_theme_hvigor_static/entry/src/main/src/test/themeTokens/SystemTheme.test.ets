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
import { Resource, ResourceColor } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { systemTheme } from '../../../ets/MainAbility/pages/themeTokensPages/SystemThemeTestPage';
import { frameTime, sleep } from '../Utils.test'
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import { checkColorTokens, ColorsValues } from '../../../ets/MainAbility/themes/checkSystemTokens/CheckColorTokens.ets';
import { colorTheme } from '../../../ets/MainAbility/pages/customComponents/CustomColorList';
import { CustomTheme, Theme } from '@ohos.arkui.theme';
import { fillMap } from '../Utils.test';

export default function systemThemeTest() {
  const SUITE: string = 'SystemTokens';
  let themeLocal: Theme | undefined;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe('ActsSystemTest', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });

    beforeEach(() => {
      try {
        const options: router.RouterOptions = {
          url: "MainAbility/pages/themeTokensPages/SystemThemeTestPage",
        };
        const routerInstance = AppStorage.get<Router>("router") as Router
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== "SystemThemeTestPage") {
          routerInstance.pushUrl(options).then(() => {
            themeLocal = systemTheme;
            console.info(`${SUITE} SystemThemeTestPage router.pushUrl success`);
          })
          await UtilsTest.msSleep(2000)
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues')
        console.log('test colorValues test' + colorValues)
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    })

    afterAll(() => {
      const router = AppStorage.get<Router>("router") as Router
      router.back()
    });

    
        
        
    
/**
     * @tc.number   ActsSystemThemeColors_static_0100
     * @tc.name     ActsSystemThemeColors_static_0100
     * @tc.desc     ActsSystemThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsSystemThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsSystemThemeColors_static_0100';
      console.info(`${SUITE} ${CASE} START`);
      expect(colorValues?.size).assertLarger(0); // ensure that colorValues is not empty
      colorValues?.forEach((value, key): void => {
        const strJson = inspector.getInspectorByKey(`${key}${colorTheme}`);
        const backgroundColor =
          (JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor') as ResourceColor)
            .toString().toUpperCase();
        const checkColor = value;
        expect(backgroundColor).assertEqual(checkColor);
      })
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    
        
        
    
/**
     * @tc.number   ActsSystemThemeColors_static_0200
     * @tc.name     ActsSystemThemeColors_static_0200
     * @tc.desc     ActsSystemThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsSystemThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsSystemThemeColors_0200';
      const checkKeys: string[] = Object.keys(checkColorTokens);
      const checkValues = (Object.values(checkColorTokens) as Object as string[]);
      const themeKeys: string[] = themeLocal?.colors === undefined ?
        [] : Object.keys(themeLocal!.colors!);
      const themeValues: Resource[] = themeLocal?.colors === undefined ?
        [] : (Object.values(themeLocal!.colors!) as Object as Resource[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      themeMap.forEach(((value, key) => {
        let themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  })
}