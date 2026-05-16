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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function ContainerSpanModifierTest() {
  describe('ContainerSpanModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ContainerSpanModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/ContainerSpanModifierTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ContainerSpanModifierTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("ContainerSpanModifierTest" == pages.name)) {
          console.info("get ContainerSpanModifierTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push ContainerSpanModifierTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ContainerSpanModifierTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ContainerSpanModifierTest after each called");
    });

    /**
     * @tc.name   ContainerSpanModifierTest0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   ContainerSpanModifierTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContainerSpanModifierTest0001',  Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      console.info('ContainerSpanModifierTest0001 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContainerSpanModifierText');
      let obj: ESObject = JSON.parse(strJson);
      console.log('ContainerSpanModifierText-----' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('I\'m ContainerSpan attributeModifier');
      console.info("[ContainerSpanModifierTest0001] end");
      done();
    });
  })
}