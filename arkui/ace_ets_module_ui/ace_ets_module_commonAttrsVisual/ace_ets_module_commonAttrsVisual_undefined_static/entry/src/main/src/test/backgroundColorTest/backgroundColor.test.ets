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

export default function BackgroundColorTest() {
  describe('BackgroundColorTest', () => {
    beforeAll(async ():Promise<void> => {
      console.info("BackgroundColorTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("BackgroundColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/backgroundColor/backgroundColor',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get GridItemUndefined state pages:" + JSON.stringify(pages));
        if (!("backgroundColorUndefined" == pages.name)) {
          console.info("get backgroundColorUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push backgroundColorEventPage page error:" + err);
      }
      console.info("backgroundColorUndefinedTest beforeEach end");
    });
    /**
     * @tc.number    BackgroundColorUndefinedTest_static_0100
     * @tc.name      BackgroundColorUndefinedTest_static_0100
     * @tc.desc      BackgroundColorUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('BackgroundColorUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[BackgroundColorUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('backgroundColorTest');
      await CommonFunc.sleep(1000);

      console.info("[BackgroundColorUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[BackgroundColorUndefinedTest_static_0100] backgroundColor: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundColor')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundColor')))
        .assertEqual('\"#FF0000FF\"');
      let changeBtn = await driver.findComponent(ON.id('backgroundColor'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[BackgroundColorUndefinedTest_static_0100] click backgroundColor");
      strJson = inspector.getInspectorByKey('backgroundColorTest');
      let strJsonExp = inspector.getInspectorByKey('backgroundColorTestUndefined');
      await CommonFunc.sleep(1000);
      let backgroundColorExp =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonExp).getElement('$attrs').getElement('backgroundColor'));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundColor')))
        .assertEqual(backgroundColorExp);
      console.info('[BackgroundColorUndefinedTest_static_0100] END');
      done();
    });
  })
}

