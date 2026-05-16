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

export default function SweepGradientTest() {
  describe('SweepGradientTest', () => {
    beforeAll(async ():Promise<void> => {
      console.info("SweepGradientTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("SweepGradientTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/sweepGradient/sweepGradient',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SweepGradientTest state pages:" + JSON.stringify(pages));
        if (!("sweepGradient" == pages.name)) {
          console.info("get SweepGradientTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SweepGradientTest page error:" + err);
      }
      console.info("SweepGradientTest beforeEach end");
    });
    /**
     * @tc.number    SweepGradientUndefinedTest_static_0100
     * @tc.name      SweepGradientUndefinedTest_static_0100
     * @tc.desc      SweepGradientUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('SweepGradientUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SweepGradientUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('sweepGradientTest');
      await CommonFunc.sleep(1000);

      console.info("[SweepGradientUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[SweepGradientUndefinedTest_static_0100] sweepGradient: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sweepGradient')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sweepGradient')))
        .assertEqual('{"center":["50.00vp","50.00vp"],"start":"1.00px","end":"359.00px","colors":[["#FFFF0000","0.000000"],["#FF0000FF","0.300000"],["#FFFFFF00","1.000000"]],"repeating":"true"}');
      let changeBtn = await driver.findComponent(ON.id('sweepGradient'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[SweepGradientUndefinedTest_static_0100] click sweepGradient");
      strJson = inspector.getInspectorByKey('sweepGradientTest');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sweepGradient')))
        .assertEqual('{"colors":[],"repeating":"false"}');
      console.info('[SweepGradientUndefinedTest_static_0100] END');
      done();
    });
  })
}
