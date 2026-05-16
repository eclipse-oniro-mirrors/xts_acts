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

export default function GrayscaleTest() {
  describe('GrayscaleTest', () => {
    beforeAll(async ():Promise<void> => {
      console.info("GrayscaleTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GrayscaleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grayscale/grayscale',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get GrayscaleTest state pages:" + JSON.stringify(pages));
        if (!("grayscale" == pages.name)) {
          console.info("get GrayscaleTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GrayscaleTest page error:" + err);
      }
      console.info("GrayscaleTest beforeEach end");
    });
    /**
     * @tc.number    GrayscaleUndefinedTest_static_0100
     * @tc.name      GrayscaleUndefinedTest_static_0100
     * @tc.desc      GrayscaleUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('GrayscaleUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GrayscaleUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('grayscaleTest');
      await CommonFunc.sleep(1000);

      console.info("[GrayscaleUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GrayscaleUndefinedTest_static_0100] grayscale: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('grayscale')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('grayscale')))
        .assertEqual('0');
      let changeBtn = await driver.findComponent(ON.id('grayscale'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GrayscaleUndefinedTest_static_0100] click grayscale");
      strJson = inspector.getInspectorByKey('grayscaleTest');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('grayscale')))
        .assertEqual('0.8');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GrayscaleUndefinedTest_static_0100] END');
      done();
    });
  })
}
