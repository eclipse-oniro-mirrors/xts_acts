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

export default function DataPanelContentModifierTest() {
  describe('DataPanelContentModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('DataPanelContentModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/DataPanelContentModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DataPanelContentModifierTest state pages:' + JSON.stringify(pages));
        if (!('DataPanelContentModifier' == pages.name)) {
          console.info('get DataPanelContentModifierTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push DataPanelContentModifierTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DataPanelContentModifierTest page error:' + err);
      }
      console.info('DataPanelContentModifierTest beforeEach end');
      done();
    });
    /**
     * @tc.name   DataPanelContentModifierTest_001
     * @tc.number DataPanelContentModifierTest_001
     * @tc.desc   To test the contentModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DataPanelContentModifierTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('DataPanelContentModifierTest_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('DataPanelContentModifier_max');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[DataPanelContentModifierTest_001] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Max=140');
      console.info('[DataPanelContentModifierTest_001] END');
      done();
    });
  })
}
