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
import events_emitter from '@ohos.events.emitter';

export default function waterFlowEmptyLazy() {
  describe('waterFlowEmptyLazy', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowEmptyLazy beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlowEmptyLazy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlowEmptyLazy state pages:" + JSON.stringify(pages));
        if (!("waterFlowEmptyLazy" == pages.name)) {
          console.info("get waterFlowEmptyLazy pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlowEmptyLazy page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlowEmptyLazy page error:" + err);
      }
      console.info("waterFlowEmptyLazy beforeEach end");
      done();
    });

    /**
     * @tc.name   waterFlowEmptyLazy_0100
     * @tc.number SUB_ARKUI_WATERFLOW_EMPTYLAZYLOADING_0100
     * @tc.desc   Test supportEmptyBranchInLazyLoading of the WaterFlow set true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('waterFlowEmptyLazy_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[waterFlowEmptyLazy_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('waterFlow_emptyLazy_true');
      let obj: ESObject = JSON.parse(strJson);
      console.log('waterFlowEmptyLazy_0100 supportEmptyBranchInLazyLoading: ', obj?.$attrs?.supportEmptyBranchInLazyLoading);
      expect(obj.$attrs?.supportEmptyBranchInLazyLoading).assertEqual(true);
      console.info('[waterFlowEmptyLazy_0100] END');
      done();
    });

    /**
     * @tc.name   waterFlowEmptyLazy_0200
     * @tc.number SUB_ARKUI_WATERFLOW_EMPTYLAZYLOADING_0200
     * @tc.desc   Test supportEmptyBranchInLazyLoading of the WaterFlow set false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('waterFlowEmptyLazy_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[waterFlowEmptyLazy_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('waterFlow_emptyLazy_false');
      let obj: ESObject = JSON.parse(strJson);
      console.log('waterFlowEmptyLazy_0200 supportEmptyBranchInLazyLoading: ', obj?.$attrs?.supportEmptyBranchInLazyLoading);
      expect(obj.$attrs?.supportEmptyBranchInLazyLoading).assertEqual(false);
      console.info('[waterFlowEmptyLazy_0200] END');
      done();
    });

    /**
     * @tc.name   waterFlowEmptyLazy_0300
     * @tc.number SUB_ARKUI_WATERFLOW_EMPTYLAZYLOADING_0300
     * @tc.desc   Test supportEmptyBranchInLazyLoading of the WaterFlow set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('waterFlowEmptyLazy_0300', Level.LEVEL3, async (done: Function) => {
      console.info('[waterFlowEmptyLazy_0300] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('waterFlow_emptyLazy_null');
      let obj: ESObject = JSON.parse(strJson);
      console.log('waterFlowEmptyLazy_0300 supportEmptyBranchInLazyLoading: ', obj?.$attrs?.supportEmptyBranchInLazyLoading);
      expect(obj.$attrs?.supportEmptyBranchInLazyLoading).assertEqual(false);
      console.info('[waterFlowEmptyLazy_0300] END');
      done();
    });

    /**
     * @tc.name   waterFlowEmptyLazy_0400
     * @tc.number SUB_ARKUI_WATERFLOW_EMPTYLAZYLOADING_0400
     * @tc.desc   Test supportEmptyBranchInLazyLoading of the WaterFlow set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('waterFlowEmptyLazy_0400', Level.LEVEL3, async (done: Function) => {
      console.info('[waterFlowEmptyLazy_0400] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('waterFlow_emptyLazy_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.log('waterFlowEmptyLazy_0400 supportEmptyBranchInLazyLoading: ', obj?.$attrs?.supportEmptyBranchInLazyLoading);
      expect(obj.$attrs?.supportEmptyBranchInLazyLoading).assertEqual(false);
      console.info('[waterFlowEmptyLazy_0400] END');
      done();
    });
  })
}
