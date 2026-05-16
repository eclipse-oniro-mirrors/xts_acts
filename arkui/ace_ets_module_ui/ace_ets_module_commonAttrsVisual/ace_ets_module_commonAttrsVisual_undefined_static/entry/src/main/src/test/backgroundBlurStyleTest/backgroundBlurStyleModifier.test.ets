'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import {
  Driver, ON
} from '@ohos.UiTest';

export default function BackgroundBlurStyleModifierTest() {
  describe('BackgroundBlurStyleModifierTest', () => {
    beforeAll(async ():Promise<void> => {
      console.info("BackgroundBlurStyleModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("BackgroundBlurStyleModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/backgroundBlurStyle/backgroundBlurStyleModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get BackgroundBlurStyleModifierTest state pages:" + JSON.stringify(pages));
        if (!("backgroundBlurStyleModifier" == pages.name)) {
          console.info("get BackgroundBlurStyleModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BackgroundBlurStyleModifierTest page error:" + err);
      }
      console.info("BackgroundBlurStyleModifierTest beforeEach end");
    });
    /**
     * @tc.number    BackgroundBlurStyleModifierUndefinedTest_static_0100
     * @tc.name      BackgroundBlurStyleModifierUndefinedTest_static_0100
     * @tc.desc      BackgroundBlurStyleModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('BackgroundBlurStyleModifierUndefinedTest_static_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('[BackgroundBlurStyleModifierUndefinedTest_static_0100] START');
        let driver: Driver = Driver.create()
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('backgroundBlurStyleModifierTest');
        await CommonFunc.sleep(1000);
        console.info("[BackgroundBlurStyleModifierUndefinedTest_static_0100] $attrs: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
        console.info("[BackgroundBlurStyleModifierUndefinedTest_static_0100] backgroundBlurStyleModifier: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('backgroundBlurStyle')));
        expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('backgroundBlurStyle')))
          .assertEqual('{"value":"BlurStyle.Thin","options":{"colorMode":"ThemeColorMode.Light","adaptiveColor":"AdaptiveColor.Default","policy":"BlurStyleActivePolicy.ALWAYS_ACTIVE","type":"BlurType.WITHIN_WINDOW","inactiveColor":"#00000000","scale":1}}');
        let changeBtn = await driver.findComponent(ON.id('backgroundBlurStyleModifier'));
        await (changeBtn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        console.info("[BackgroundBlurStyleModifierUndefinedTest_static_0100] click backgroundBlurStyleModifier");
        strJson = inspector.getInspectorByKey('backgroundBlurStyleModifierTest');
        await CommonFunc.sleep(1000);
        expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('backgroundBlurStyle')))
          .assertEqual('{"value":"BlurStyle.NONE","options":{"colorMode":"ThemeColorMode.System","adaptiveColor":"AdaptiveColor.Default","policy":"BlurStyleActivePolicy.ALWAYS_ACTIVE","type":"BlurType.WITHIN_WINDOW","inactiveColor":"#00000000","scale":1}}');
        console.info('[BackgroundBlurStyleModifierUndefinedTest_static_0100] END');
        done();
      });
  })
}
