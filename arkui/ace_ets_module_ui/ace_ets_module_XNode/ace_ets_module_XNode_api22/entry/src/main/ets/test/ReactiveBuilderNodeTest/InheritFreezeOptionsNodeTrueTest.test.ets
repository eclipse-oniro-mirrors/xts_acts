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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium'
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function InheritFreezeOptionsNodeTrueTest() {
  describe('InheritFreezeOptionsNodeTrueTest', () => {
    beforeEach(async (done: Function) => {
      console.info('InheritFreezeOptionsNodeTrueTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ReactiveBuilderNode/InheritFreezeOptionsNodeTrueTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get InheritFreezeOptionsNodeTrueTest state pages:' + JSON.stringify(pages));
        if (!('InheritFreezeOptionsNodeTrueTest' == pages.name)) {
          console.info('get InheritFreezeOptionsNodeTrueTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push InheritFreezeOptionsNodeTrueTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push InheritFreezeOptionsNodeTrueTest page error:' + err);
      }
      console.info('InheritFreezeOptionsNodeTrueTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('InheritFreezeOptionsNodeTrueTest after each called');
    });

    /**
     * @tc.name   InheritFreezeOptionsNodeTrueTest_0100
     * @tc.number InheritFreezeOptionsNodeTrueTest_0100
     * @tc.desc   ReactiveBuilderNode InheritFreezeOptionsNodeTrueTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InheritFreezeOptionsNodeTrueTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('InheritFreezeOptionsNodeTrueTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let button1 = await driver.findComponent(ON.id('btn_nextPage1_id'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('btn_updateBuilderNode'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let button3 = await driver.findComponent(ON.id('btn_nextPage2_id'));
      await button3.click();
      await CommonFunc.sleep(2000);
      let button4 = await driver.findComponent(ON.id('btn_updateBuilderNode'));
      await button4.click();
      await CommonFunc.sleep(2000);
      let button5 = await driver.findComponent(ON.id('btn_backPage3_id'));
      await button5.click();
      await CommonFunc.sleep(2000);

      let strJson: string = getInspectorByKey('textBuilderLogCount2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[InheritFreezeOptionsNodeTrueTest_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[InheritFreezeOptionsNodeTrueTest_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('1');
      console.info('[InheritFreezeOptionsNodeTrueTest_0100] END');
      done();
    });
  })
}