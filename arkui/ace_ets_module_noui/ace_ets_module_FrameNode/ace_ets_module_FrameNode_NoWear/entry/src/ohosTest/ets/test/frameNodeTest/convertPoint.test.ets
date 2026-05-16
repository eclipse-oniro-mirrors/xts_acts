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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import { UiComponent, UiDriver, Component, Driver, ON, BY, UiDirection, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function convertPoint() {
  describe('ConvertPointTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/convertPoint',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ConvertPointTest state pages: ' + JSON.stringify(pages));
        if (!('convertPoint' == pages.name)) {
          console.info('get ConvertPointTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push ConvertPointTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ConvertPointTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PreDragTest after each called');
    });

    /**
     * @tc.number    ConvertPointTest_0010
     * @tc.name      convertPointTest
     * @tc.desc      api axisPinch
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('convertPointTest', Level.LEVEL1, async (done: Function) => {
      let driver:Driver = Driver.create();
      let button1: Component = await driver.findComponent(ON.id('button1'));
      let button2: Component = await driver.findComponent(ON.id('button2'));
      await button1.click();
      await CommonFunc.sleep(1000);
      await button2.click();
      let strJson1 = getInspectorByKey('text1');
      let strJson2 = getInspectorByKey('text2');
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      AppStorage.setOrCreate('text1', obj1.$attrs.content)
      AppStorage.setOrCreate('text2', obj2.$attrs.content)
      console.info('[ConvertPointTest_0010] PreDrag: ' + JSON.stringify(obj1));
      console.info('[ConvertPointTest_0010] PreDrag: ' + JSON.stringify(obj1.$attrs));
      console.info('[ConvertPointTest_0010] PreDrag: ' + JSON.stringify(obj2));
      console.info('[ConvertPointTest_0010] PreDrag: ' + JSON.stringify(obj2.$attrs));
      expect(AppStorage.get('text1')).assertEqual(AppStorage.get('text2'));
      await CommonFunc.sleep(1000);
      console.info('[ConvertPointTest_0010] END');
      done();
    });
  })
}