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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function textPickerSelectedAreaTest() {
  describe('textPickerSelectedAreaTest', () => {
    beforeEach(async (done: Function) => {
      console.info('textPickerSelectedAreaTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/textPickerSelectedArea',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get textPickerSelectedAreaTest state pages:' + JSON.stringify(pages));
        if (!('textPickerSelectedArea' == pages.name)) {
          console.info('get textPickerSelectedAreaTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push textPickerSelectedAreaTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textPickerSelectedAreaTest page error:' + err);
      }
      console.info('textPickerSelectedAreaTest beforeEach end');
      done();
    });
    /* *
    * @tc.number: textPickerSelectedAreaTest_001
    * @tc.name  : textPickerSelectedAreaTest_001
    * @tc.desc  : To test the onEnterSelectedArea event
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('textPickerSelectedAreaTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('textPickerSelectedAreaTest_001 START');
      let driver = Driver.create();
      await Utils.sleep(2000);
      let textPicker = await driver.findComponent(ON.id('textPicker'));
      let rect = await textPicker.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      let middle = (top + bottom) / 2

      await driver.swipe(
        Math.round(left + (right - left) / 2),
        Math.round(top + (bottom - top) / 2),
        Math.round(left + (right - left) / 2),
        Math.round(top));
      await Utils.sleep(6000);

      let textStr = await driver.findComponent(ON.id('textFlag'));
      let eText = await textStr.getText();
      console.info("[textPickerSelectedAreaTest_001] text: " + JSON.stringify(eText));
      expect(eText).assertEqual('enter');
      console.info('[textPickerSelectedAreaTest_001] END');
      done();
    });
  })
}
