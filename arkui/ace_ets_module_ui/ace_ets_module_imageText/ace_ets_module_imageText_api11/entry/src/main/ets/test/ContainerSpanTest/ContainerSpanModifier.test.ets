/**
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function ContainerSpanModifierTest() {
  describe('ContainerSpanModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ContainerSpanModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ContainerSpan/ContainerSpanModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ContainerSpanModifierTest state pages: " + JSON.stringify(pages));
        if (!("ContainerSpanModifier" == pages.name)) {
          console.info("get ContainerSpanModifierTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ContainerSpanModifierTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ContainerSpanModifierTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContainerSpanModifierTest_0010
     * @tc.name      ContainerSpanModifierTest_0010
     * @tc.desc      test ContainerSpanModifier: radius
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ContainerSpanModifierTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('ContainerSpanModifierTest_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContainerSpanModifier_get_radius');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContainerSpanModifierTest_0010] textBackgroundStyle: " + JSON.stringify(obj.$attrs.textBackgroundStyle.radius));
      expect(obj.$attrs.textBackgroundStyle.radius.topLeft).assertEqual('12.00vp');
      expect(obj.$attrs.textBackgroundStyle.radius.topRight).assertEqual('12.00vp');
      expect(obj.$attrs.textBackgroundStyle.radius.bottomLeft).assertEqual('12.00vp');
      expect(obj.$attrs.textBackgroundStyle.radius.bottomRight).assertEqual('12.00vp');
      console.info('[ContainerSpanModifierTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContainerSpanModifierTest_0020
     * @tc.name      ContainerSpanModifierTest_0020
     * @tc.desc      test type of ContainerSpanInstance: undefined
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ContainerSpanModifierTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('ContainerSpanModifierTest_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContainerSpanModifier_get_type');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContainerSpanModifierTest_0020] ContainerSpanInstance type is: " + JSON.stringify(obj.$attrs.text));
      expect(obj.$attrs.text).assertEqual('undefined');
      console.info('[ContainerSpanModifierTest_0020] END');
      done();
    });
  })
}

