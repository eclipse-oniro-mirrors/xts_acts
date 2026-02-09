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

export default function timePickerSelectedAreaTest() {
  describe('timePickerSelectedAreaTest', () => {
    beforeEach(async (done: Function) => {
      console.info('timePickerSelectedAreaTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker/timePickerSelectedArea',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get timePickerSelectedAreaTest state pages:' + JSON.stringify(pages));
        if (!('timePickerSelectedArea' == pages.name)) {
          console.info('get timePickerSelectedAreaTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push timePickerSelectedAreaTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push timePickerSelectedAreaTest page error:' + err);
      }
      console.info('timePickerSelectedAreaTest beforeEach end');
      done();
    });
    /**
     * @tc.name   timePickerSelectedAreaTest_001
     * @tc.number timePickerSelectedAreaTest_001
     * @tc.desc   To test the onEnterSelectedArea event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timePickerSelectedAreaTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerSelectedAreaTest_001 START');
      let driver = Driver.create();
      await Utils.sleep(2000);
      let timePicker = await driver.findComponent(ON.id('timePicker'));
      let rect = await timePicker.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      let middle = (top + bottom) / 2

      await driver.swipe(
        Math.round(left + (right - left) / 6),
        Math.round(top + (bottom - top) / 2),
        Math.round(left + (right - left) / 6),
        Math.round(top));
      await Utils.sleep(6000);

      let textStr = await driver.findComponent(ON.id('textFlag'));
      let eText = await textStr.getText();
      console.info("[timePickerSelectedAreaTest_001] text: " + JSON.stringify(eText));
      expect(eText).assertEqual('enter');
      console.info('[timePickerSelectedAreaTest_001] END');
      done();
    });
  })
}
