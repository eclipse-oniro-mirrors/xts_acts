/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function accessibilitySelectedTypeTest() {
  describe('accessibilitySelectedTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('accessibilitySelectedTypeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Chip/accessibilitySelectedTypeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get accessibilitySelectedTypeTest state pages:' + JSON.stringify(pages));
        if (!('accessibilitySelectedTypeTest' == pages.name)) {
          console.info('get accessibilitySelectedTypeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push accessibilitySelectedTypeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push accessibilitySelectedTypeTest page error:' + err);
      }
      console.info('accessibilitySelectedTypeTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   accessibilitySelectedTypeTest_0100
     * @tc.number accessibilitySelectedTypeTest_0100
     * @tc.desc   accessibilitySelectedType:AccessibilitySelectedType.CLICKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('accessibilitySelectedTypeTest_0100', Level.LEVEL3, async (done: Function) => {
     console.info('[accessibilitySelectedTypeTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let strJson1 = getInspectorByKey('text');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[accessibilitySelectedTypeTest_0100] obj1.$attrs.content is: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('0');
      let btn1 = await driver.findComponent(ON.id('btn'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[accessibilitySelectedTypeTest_0100] obj2.$attrs.content is: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('1');
      await btn1.click()
      await CommonFunc.sleep(1000);
      let strJson3 = getInspectorByKey('text');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[accessibilitySelectedTypeTest_0100] obj3.$attrs.content is: ' + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('2');
      done();
    });
  })
}