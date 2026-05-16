/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function waterFlowDefaultTest2() {
  describe('waterFlowDefaultTest2', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowDefaultTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/waterFlowDefault/waterFlowDefault2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("waterFlowDefault2" == pages.name)) {
          console.info("get waterFlowDefaultTest2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlowDefaultTest2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlowDefaultTest2 page error:" + err);
      }
      console.info("waterFlowDefaultTest2 beforeEach end");
      done();
    });
    
    // ========== enableScrollInteraction tests (boolean) ==========
    /**
     * @tc.name   waterEnableScrollInteractionNullUndefined_0100
     * @tc.number waterEnableScrollInteractionNullUndefined_0100
     * @tc.desc   Test WaterFlow enableScrollInteraction property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterEnableScrollInteractionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[waterEnableScrollInteractionNullUndefined_0100] START');

      let strJson: string = getInspectorByKey('WaterFlow_enableScrollInteraction_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterEnableScrollInteractionNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // WaterFlow enableScrollInteraction 不设置
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[waterEnableScrollInteractionNullUndefined_0100] END');
    })

    /**
     * @tc.name   waterEnableScrollInteractionNullUndefined_0200
     * @tc.number waterEnableScrollInteractionNullUndefined_0200
     * @tc.desc   Test WaterFlow enableScrollInteraction property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterEnableScrollInteractionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[waterEnableScrollInteractionNullUndefined_0200] START');

      let strJson: string = getInspectorByKey('WaterFlow_enableScrollInteraction_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterEnableScrollInteractionNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // WaterFlow enableScrollInteraction 设置null
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[waterEnableScrollInteractionNullUndefined_0200] END');
    })

    /**
     * @tc.name   waterEnableScrollInteractionNullUndefined_0300
     * @tc.number waterEnableScrollInteractionNullUndefined_0300
     * @tc.desc   Test WaterFlow enableScrollInteraction property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterEnableScrollInteractionNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[waterEnableScrollInteractionNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('WaterFlow_enableScrollInteraction_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterEnableScrollInteractionNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // WaterFlow enableScrollInteraction 设置undefined
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[waterEnableScrollInteractionNullUndefined_0300] END');
    })

    /**
     * @tc.name   waterEnableScrollInteractionNullUndefined_0400
     * @tc.number waterEnableScrollInteractionNullUndefined_0400
     * @tc.desc   Test WaterFlow enableScrollInteraction property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterEnableScrollInteractionNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[waterEnableScrollInteractionNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('WaterFlow_enableScrollInteraction_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[waterEnableScrollInteractionNullUndefined_0400] false obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // WaterFlow enableScrollInteraction 设置false
      expect(obj.$attrs.enableScrollInteraction).assertEqual(false);
      console.info('[waterEnableScrollInteractionNullUndefined_0400] END');
    })

    // ========== friction tests ==========
    /**
     * @tc.name   waterFrictionNullUndefined_0100
     * @tc.number waterFrictionNullUndefined_0100
     * @tc.desc   Test WaterFlow friction property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterFrictionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[waterFrictionNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('WaterFlow_friction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('WaterFlow_friction_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterFrictionNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.friction));
      console.info("[waterFrictionNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.friction));

      // WaterFlow friction 设置null
      expect(obj.$attrs.friction).assertEqual(objCompare.$attrs.friction);
      console.info('[waterFrictionNullUndefined_0100] END');
    })

    /**
     * @tc.name   waterFrictionNullUndefined_0200
     * @tc.number waterFrictionNullUndefined_0200
     * @tc.desc   Test WaterFlow friction property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterFrictionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[waterFrictionNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('WaterFlow_friction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('WaterFlow_friction_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterFrictionNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.friction));
      console.info("[waterFrictionNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.friction));

      // WaterFlow friction 设置undefined
      expect(obj.$attrs.friction).assertEqual(objCompare.$attrs.friction);
      console.info('[waterFrictionNullUndefined_0200] END');
    })

    // ========== cachedCount tests ==========
    /**
     * @tc.name   waterCachedCountNullUndefined_0100
     * @tc.number waterCachedCountNullUndefined_0100
     * @tc.desc   Test WaterFlow cachedCount property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterCachedCountNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[waterCachedCountNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('WaterFlow_cachedCount_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterCachedCountNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[waterCachedCountNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.cachedCount));

      // WaterFlow cachedCount 不设置，默认值1
      expect(obj.$attrs.cachedCount).assertEqual(1);
      console.info('[waterCachedCountNullUndefined_0100] END');
    })

    /**
     * @tc.name   waterCachedCountNullUndefined_0200
     * @tc.number waterCachedCountNullUndefined_0200
     * @tc.desc   Test WaterFlow cachedCount property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterCachedCountNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[waterCachedCountNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('WaterFlow_cachedCount_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterCachedCountNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[waterCachedCountNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.cachedCount));

      // WaterFlow cachedCount 设置null
      expect(obj.$attrs.cachedCount).assertEqual(1);
      console.info('[waterCachedCountNullUndefined_0200] END');
    })

    /**
     * @tc.name   waterCachedCountNullUndefined_0300
     * @tc.number SUB_ARKUI_GRID_CACHEDCOUNT_NULL_0300
     * @tc.desc   Test WaterFlow cachedCount property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterCachedCountNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[waterCachedCountNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('WaterFlow_cachedCount_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterCachedCountNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[waterCachedCountNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.cachedCount));

      // WaterFlow cachedCount 设置undefined
      expect(obj.$attrs.cachedCount).assertEqual(1);
      console.info('[waterCachedCountNullUndefined_0300] END');
    })
  })
}
