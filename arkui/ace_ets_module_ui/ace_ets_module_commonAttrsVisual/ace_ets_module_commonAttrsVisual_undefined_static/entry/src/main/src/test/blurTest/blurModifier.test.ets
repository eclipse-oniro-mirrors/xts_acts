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

export default function BlurModifierTest() {
  describe('BlurModifierTest', () => {
    beforeAll(async ():Promise<void> => {
      console.info("BlurModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("BlurModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/blur/blurModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get BlurModifierTest state pages:" + JSON.stringify(pages));
        if (!("blurModifier" == pages.name)) {
          console.info("get BlurModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BlurModifierTest page error:" + err);
      }
      console.info("BlurModifierTest beforeEach end");
    });
    /**
     * @tc.number    BlurModifierUndefinedTest_static_0100
     * @tc.name      BlurModifierUndefinedTest_static_0100
     * @tc.desc      BlurModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('BlurModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[BlurModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blurModifierTest');
      await CommonFunc.sleep(1000);

      console.info("[BlurModifierUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[BlurModifierUndefinedTest_static_0100] blur: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('blur')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('blur')))
        .assertEqual('10');
      let changeBtn = await driver.findComponent(ON.id('blurModifier'));
      console.log("lsq: ",changeBtn);
      await ((changeBtn?.click()) as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[BlurModifierUndefinedTest_static_0100] click blur");
      strJson = inspector.getInspectorByKey('blurModifierTest');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('blur')))
        .assertEqual('0');
      console.info('[BlurModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
