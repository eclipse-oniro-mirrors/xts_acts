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

export default function ProgressContentModifierTest() {
  describe('ProgressContentModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ProgressContentModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/ProgressContentModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ProgressContentModifierTest state pages:' + JSON.stringify(pages));
        if (!('ProgressContentModifier' == pages.name)) {
          console.info('get ProgressContentModifierTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push ProgressContentModifierTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ProgressContentModifierTest page error:' + err);
      }
      console.info('ProgressContentModifierTest beforeEach end');
      done();
    });
    /**
     * @tc.name   ProgressContentModifierTest_001
     * @tc.number ProgressContentModifierTest_001
     * @tc.desc   To test the contentModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ProgressContentModifierTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('ProgressContentModifierTest_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('ProgressContentModifier_total');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[ProgressContentModifierTest_001] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Current progress is：0/3');
      console.info('[ProgressContentModifierTest_001] END');
      done();
    });
  })
}
