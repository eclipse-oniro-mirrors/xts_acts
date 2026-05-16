/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function pickerOnChangeModiferTest() {
  describe('pickerOnChangeModiferTest', () => {
    beforeEach(async (done: Function) => {
      console.info('pickerOnChangeModiferTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/picker/pickerOnChangeModiferTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get pickerOnChangeModiferTest state pages: ' + JSON.stringify(pages));
        if (!('pickerOnChangeModiferTest' == pages.name)) {
          console.info('get pickerOnChangeModiferTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push pickerOnChangeModiferTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push pickerOnChangeModiferTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: pickerOnChangeModiferTest_0100
    * @tc.name  : pickerOnChangeModiferTest_0100
    * @tc.desc  : To test the onScollStop interface
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('pickerOnChangeModiferTest_0100', Level.LEVEL3, async (done: Function) => {
      console.info('pickerOnChangeModiferTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('picker1'));
      let rect = await btn1.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.swipe(Math.round((rect.left + rect.right) / 2), Math.round((rect.top + rect.bottom) / 2),
        Math.round((rect.left + rect.right) / 2), Math.round((rect.top + rect.bottom) / 4), 600);
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('picker1');
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FFFF00FF");
      await CommonFunc.sleep(1000);
      console.info('[pickerOnChangeModiferTest_0100] END');
      done();
    });
  })
}

