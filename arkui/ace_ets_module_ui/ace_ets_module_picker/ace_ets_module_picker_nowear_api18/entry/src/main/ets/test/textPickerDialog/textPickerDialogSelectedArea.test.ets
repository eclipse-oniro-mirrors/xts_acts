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

export default function textPickerDialogSelectedAreaTest() {
  describe('textPickerDialogSelectedAreaTest', () => {
    beforeEach(async (done: Function) => {
      console.info('textPickerDialogSelectedAreaTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/textPickerDialogSelectedArea',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get textPickerDialogSelectedAreaTest state pages:' + JSON.stringify(pages));
        if (!('textPickerDialogSelectedArea' == pages.name)) {
          console.info('get textPickerDialogSelectedAreaTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push textPickerDialogSelectedAreaTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textPickerDialogSelectedAreaTest page error:' + err);
      }
      console.info('textPickerDialogSelectedAreaTest beforeEach end');
      done();
    });
    /* *
    * @tc.number: textPickerDialogSelectedAreaTest_001
    * @tc.name  : textPickerDialogSelectedAreaTest_001
    * @tc.desc  : To test the onEnterSelectedArea event
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('textPickerDialogSelectedAreaTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('textPickerDialogSelectedAreaTest_001 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('showTextPickerDialog'));
      await btn.click()
      await Utils.sleep(2000);

      let textPickerDialog = await driver.findComponent(ON.id('colComponent'));
      let rect = await textPickerDialog.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      let middle = (top + bottom) / 2

      await driver.swipe(
        Math.round(left + (right - left) / 2),
        Math.round(top + (bottom - top) / 2),
        Math.round(left + (right - left) / 2),
        Math.round(top)
      );
      await Utils.sleep(6000);

      let btn1 = await driver.findComponent(ON.text('确定'));
      await Utils.sleep(500);
      await btn1?.click();
      await Utils.sleep(500);

      let textStr = await driver.findComponent(ON.id('textFlag'));
      let eText = await textStr.getText();
      console.info("[textPickerDialogSelectedAreaTest_001] text: " + JSON.stringify(eText));
      expect(eText).assertEqual('enter');
      console.info('[textPickerDialogSelectedAreaTest_001] END');
      done();
    });
  })
}