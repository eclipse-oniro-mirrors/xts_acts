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

export default function InheritFreezeOptionsContentTrueTest() {
  describe('InheritFreezeOptionsContentTrueTest', () => {
    beforeEach(async (done: Function) => {
      console.info('InheritFreezeOptionsContentTrueTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ReactiveComponentContent/InheritFreezeOptionsContentTrueTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get InheritFreezeOptionsContentTrueTest state pages:' + JSON.stringify(pages));
        if (!('InheritFreezeOptionsContentTrueTest' == pages.name)) {
          console.info('get InheritFreezeOptionsContentTrueTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push InheritFreezeOptionsContentTrueTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push InheritFreezeOptionsContentTrueTest page error:' + err);
      }
      console.info('InheritFreezeOptionsContentTrueTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('InheritFreezeOptionsContentTrueTest after each called');
    });

    /**
     * @tc.name   InheritFreezeOptionsContentTrueTest_0100
     * @tc.number InheritFreezeOptionsContentTrueTest_0100
     * @tc.desc   ReactiveComponentContent InheritFreezeOptionsContentTrueTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InheritFreezeOptionsContentTrueTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('InheritFreezeOptionsContentTrueTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let button1 = await driver.findComponent(ON.id('btn_nextPage1_id'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('btn_updateComponentContent'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let button3 = await driver.findComponent(ON.id('btn_nextPage2_id'));
      await button3.click();
      await CommonFunc.sleep(2000);
      let button4 = await driver.findComponent(ON.id('btn_updateComponentContent'));
      await button4.click();
      await CommonFunc.sleep(2000);
      let button5 = await driver.findComponent(ON.id('btn_backPage3_id'));
      await button5.click();
      await CommonFunc.sleep(2000);

      let strJson: string = getInspectorByKey('textBuilderLogCount2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[InheritFreezeOptionsContentTrueTest_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[InheritFreezeOptionsContentTrueTest_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('1');
      console.info('[InheritFreezeOptionsContentTrueTest_0100] END');
      done();
    });
  })
}