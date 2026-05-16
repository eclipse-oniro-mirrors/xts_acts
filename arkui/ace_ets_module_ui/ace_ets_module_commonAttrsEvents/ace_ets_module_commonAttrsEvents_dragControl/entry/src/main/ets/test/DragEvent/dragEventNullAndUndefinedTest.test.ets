/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function dragEventNullAndUndefinedTest() {
  describe('dragEventNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("dragEventNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragEvent/DragEventNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dragEventNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("DragEventNullAndUndefined" == pages.name)) {
          console.info("get dragEventNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push dragEventNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dragEventNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("dragEventNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   onDragStartNullV1001
     * @tc.number SUB_ARKUI_DRAGEVENT_PARAM_001
     * @tc.desc   Test onDragStart with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDragStartNullV1001', Level.LEVEL0, async () => {
      console.info('[onDragStartNullV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onDragStartNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onDragStartNullV1001] onDragStart is: " + JSON.stringify(obj.$attrs.onDragStart));
      expect(obj.$attrs.onDragStart).assertEqual(undefined);
      console.info('[onDragStartNullV1001] END');
    });

    /**
     * @tc.name   onDragStartUndefinedV1002
     * @tc.number SUB_ARKUI_DRAGEVENT_PARAM_002
     * @tc.desc   Test onDragStart with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDragStartUndefinedV1002', Level.LEVEL0, async () => {
      console.info('[onDragStartUndefinedV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onDragStartUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onDragStartUndefinedV1002] onDragStart is: " + JSON.stringify(obj.$attrs.onDragStart));
      expect(obj.$attrs.onDragStart).assertEqual(undefined);
      console.info('[onDragStartUndefinedV1002] END');
    });

    /**
     * @tc.name   onDropDisableDataPrefetchTrueV1003
     * @tc.number SUB_ARKUI_DRAGEVENT_PARAM_003
     * @tc.desc   Test onDrop with disableDataPrefetch true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDropDisableDataPrefetchTrueV1003', Level.LEVEL0, async () => {
      console.info('[onDropDisableDataPrefetchTrueV1003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('onDropDisableTrue'));
      let target = await driver.findComponent(ON.id('targetOnDropDisableTrue'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onDropDisableDataPrefetchTrueV1003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('onDropDisableTrue');
      console.info('[onDropDisableDataPrefetchTrueV1003] END');
    });

    /**
     * @tc.name   onDropDisableDataPrefetchFalseV1004
     * @tc.number SUB_ARKUI_DRAGEVENT_PARAM_004
     * @tc.desc   Test onDrop with disableDataPrefetch false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDropDisableDataPrefetchFalseV1004', Level.LEVEL0, async () => {
      console.info('[onDropDisableDataPrefetchFalseV1004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('onDropDisableFalse'));
      let target = await driver.findComponent(ON.id('targetOnDropDisableFalse'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onDropDisableDataPrefetchFalseV1004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('onDropDisableFalse');
      console.info('[onDropDisableDataPrefetchFalseV1004] END');
    });

    /**
     * @tc.name   onDropSecondParamNullV1005
     * @tc.number SUB_ARKUI_DRAGEVENT_PARAM_005
     * @tc.desc   Test onDrop with second param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDropSecondParamNullV1005', Level.LEVEL0, async () => {
      console.info('[onDropSecondParamNullV1005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('onDropSecondParamNull'));
      let target = await driver.findComponent(ON.id('targetOnDropSecondParamNull'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onDropSecondParamNullV1005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('onDropSecondParamNull');
      console.info('[onDropSecondParamNullV1005] END');
    });

    /**
     * @tc.name   onDropSecondParamUndefinedV1006
     * @tc.number SUB_ARKUI_DRAGEVENT_PARAM_006
     * @tc.desc   Test onDrop with second param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onDropSecondParamUndefinedV1006', Level.LEVEL0, async () => {
      console.info('[onDropSecondParamUndefinedV1006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('onDropSecondParamUndefined'));
      let target = await driver.findComponent(ON.id('targetOnDropSecondParamUndefined'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onDropSecondParamUndefinedV1006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('onDropSecondParamUndefined');
      console.info('[onDropSecondParamUndefinedV1006] END');
    });
  })
}
