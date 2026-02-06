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

export default function ImageContentEmptyTest() {
  describe('ImageContentEmptyTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageContentEmptyTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageContent/ImageContentEmpty',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageContentEmptyTest state pages:' + JSON.stringify(pages));
        if (!('ImageContentEmpty' == pages.name)) {
          console.info('get ImageContentEmptyTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push ImageContentEmptyTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageContentEmptyTest page error:' + err);
      }
      console.info('ImageContentEmptyTest beforeEach end');
      done();
    });
    /**
     * @tc.name   ImageContentEmptyTest_001
     * @tc.number ImageContentEmptyTest_001
     * @tc.desc   To test the ImageContentEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageContentEmptyTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('ImageContentEmptyTest_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('ImageContentImage');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[ImageContentEmptyTest_001] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.src).assertEqual('');
      console.info('[ImageContentEmptyTest_001] END');
      done();
    });
  })
}
