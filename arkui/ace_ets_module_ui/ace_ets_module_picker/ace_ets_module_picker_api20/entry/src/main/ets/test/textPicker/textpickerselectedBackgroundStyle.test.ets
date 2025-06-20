/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import { BY, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function TextPickerPage() {
  describe('TextPickerPage', () => {
    beforeEach(async (done: Function) => {
      console.info('TextPickerPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/textpickerselectedBackgroundStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerPage state pages:' + JSON.stringify(pages));
        if (!('textpickerselectedBackgroundStyle' == pages.name)) {
          console.info('get TextPickerPage pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TextPickerPage page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerPage page error:' + err);
      }
      console.info('TextPickerPage beforeEach end');
      done();
    });

    /* *
     * @tc.number: textPickerselectedBackgroundStyle001
     * @tc.name  : textPickerselectedBackgroundStyle001
     * @tc.desc  : To test the selectedBackgroundStyle interface color
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
     */
    it('textPickerselectedBackgroundStyle001', Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textPicker1');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      let obj1 :string = obj.$attrs.selectedBackgroundStyle.color;
      expect(obj1.toLowerCase()).assertEqual(Color.Red);
      done();
    });
  })
}