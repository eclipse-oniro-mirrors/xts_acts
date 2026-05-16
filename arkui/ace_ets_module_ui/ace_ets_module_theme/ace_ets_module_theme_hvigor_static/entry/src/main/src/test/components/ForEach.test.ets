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
import {
  DataForeach,
  dataSystemGroupKey,
  dataSystemKey,
  dataWithThemeGroupKey,
  dataWithThemeKey,
  forEachThemeProperty
} from '../../../ets/MainAbility/pages/components/ForEachPage';
import { CustomTheme, Theme } from '@ohos.arkui.theme';

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
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });

    beforeEach(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/ForEachPage`,
        };
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `ForEachPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>(`forEachThemeProperty`);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
        dataSystem = AppStorage.get<DataForeach[]>('ForEachDataSystemKey');
        dataSystemGroup = AppStorage.get<DataForeach[]>('ForEachDataSystemGroupKey');
        dataWithTheme = AppStorage.get<DataForeach[]>('ForEachDataWithThemeKey');
        dataWithThemeGroup = AppStorage.get<DataForeach[]>('ForEachDataWithThemeGroupKey');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }

      if (!changeTheme) {
        return;
      }
      if ((AppStorage.get<CustomTheme>(`forEachThemeProperty`))?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        AppStorage.setOrCreate<CustomTheme>(`forEachThemeProperty`, greenCustomTheme);
      } else {
        AppStorage.setOrCreate<CustomTheme>(`forEachThemeProperty`, redCustomTheme);
      }
      localTheme = AppStorage.get<CustomTheme>(`forEachThemeProperty`);
      changeTheme = false;
    });

    
    /**
     * @tc.number   ActsForEachThemeColors_static_0100
     * @tc.name     ActsForEachThemeColors_static_0100
     * @tc.desc     ActsForEachThemeColors_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ActsForEachThemeColors_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(frameTime);
      const CASE: string = `ActsForEachThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = inspector.getInspectorByKey(dataSystem![0].title);
      const buttonAttrs = JSON.parseJsonElement(buttonJSON).getElement('$attrs');
      const backgroundColor: string = buttonAttrs.getString('backgroundColor').toString().toUpperCase();
      const checkBackgroundColor: string = colorValues?.get(`backgroundEmphasize`) ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs.getString('fontColor').toString().toUpperCase() ?? '';
      const checkFontColor: string = colorValues?.get(`fontOnPrimary`) ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      console.info(`${SUITE} ${CASE} END`)
      done();
      ;
    });
    
    /**
     * @tc.number   ActsForEachThemeColors_static_0200
     * @tc.name     ActsForEachThemeColors_static_0200
     * @tc.desc     ActsForEachThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsForEachThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsForEachThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = inspector.getInspectorByKey(dataWithTheme![0]!.title);
      const buttonAttrs = JSON.parseJsonElement(buttonJSON).getElement('$attrs');
      const backgroundColor: string = buttonAttrs.getString('backgroundColor').toString().toUpperCase();
      const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs.getString('fontColor').toString().toUpperCase();
      const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`)
      done();
      ;
    });
    
    /**
     * @tc.number   ActsForEachThemeColors_static_0300
     * @tc.name     ActsForEachThemeColors_static_0300
     * @tc.desc     ActsForEachThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ActsForEachThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsForEachThemeColors_static_0300`
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime); // update item
      await sleep(frameTime); // update theme
      const buttonJSON = inspector.getInspectorByKey(dataWithTheme![0]!.title);
      const buttonAttrs = JSON.parseJsonElement(buttonJSON).getElement('$attrs');
      const backgroundColor: string = buttonAttrs.getString('backgroundColor').toString().toUpperCase();
      const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs.getString('fontColor').toString().toUpperCase();
      const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`)
      done();
    });
    
    /**
     * @tc.number   ActsForEachThemeColors_static_0400
     * @tc.name     ActsForEachThemeColors_static_0400
     * @tc.desc     ActsForEachThemeColors_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ActsForEachThemeColors_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await sleep(frameTime);
      ;
      const CASE: string = `ActsForEachThemeColors_static_0400`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = inspector.getInspectorByKey(dataSystemGroup![0]!.title);
      const buttonAttrs = JSON.parseJsonElement(buttonJSON).getElement('$attrs');
      const backgroundColor: string = buttonAttrs.getString('backgroundColor').toString().toUpperCase();
      const checkBackgroundColor: string = colorValues?.get(`backgroundEmphasize`) ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs.getString('fontColor').toString().toUpperCase() ?? '';
      const checkFontColor: string = colorValues?.get(`fontOnPrimary`) ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      console.info(`${SUITE} ${CASE} END`)
      done();
      ;
    });
    
    /**
     * @tc.number   ActsForEachThemeColors_static_0500
     * @tc.name     ActsForEachThemeColors_static_0500
     * @tc.desc     ActsForEachThemeColors_static_0500
     * @tc.level    Level.LEVEL2
     */
it('ActsForEachThemeColors_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsForEachThemeColors_static_0500`;
      console.info(`${SUITE} ${CASE} START`);
      const buttonJSON = inspector.getInspectorByKey(dataWithThemeGroup![0]!.title);
      const buttonAttrs = JSON.parseJsonElement(buttonJSON).getElement('$attrs');
      const backgroundColor: string = buttonAttrs.getString('backgroundColor').toString().toUpperCase();
      const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs.getString('fontColor').toString().toUpperCase();
      const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`)
      done();
      ;
    });
    
    /**
     * @tc.number   ActsForEachThemeColors_static_0600
     * @tc.name     ActsForEachThemeColors_static_0600
     * @tc.desc     ActsForEachThemeColors_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ActsForEachThemeColors_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsForEachThemeColors_static_0600`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime); // update item
      const buttonJSON = inspector.getInspectorByKey(dataWithThemeGroup![0]!.title);
      const buttonAttrs = JSON.parseJsonElement(buttonJSON).getElement('$attrs');
      const backgroundColor: string = buttonAttrs.getString('backgroundColor').toString().toUpperCase();
      const checkBackgroundColor: string = localTheme?.colors?.backgroundEmphasize?.toString().toUpperCase() ?? '';
      expect(backgroundColor).assertEqual(checkBackgroundColor);
      const fontColor: string = buttonAttrs.getString('fontColor').toString().toUpperCase();
      const checkFontColor: string = localTheme?.colors?.fontOnPrimary?.toString().toUpperCase() ?? '';
      expect(fontColor).assertEqual(checkFontColor);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`)
      done();
    });
  });
}