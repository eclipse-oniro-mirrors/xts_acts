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

export default function dragPreviewNullAndUndefinedTest() {
  describe('dragPreviewNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("dragPreviewNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragPreview/DragPreviewNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dragPreviewNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("DragPreviewNullAndUndefined" == pages.name)) {
          console.info("get dragPreviewNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push dragPreviewNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dragPreviewNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("dragPreviewNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   dragPreviewApi11FirstParamNullV1001
     * @tc.number SUB_ARKUI_DRAGPREVIEW_PARAM_001
     * @tc.desc   Test dragPreview API11 with first param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewApi11FirstParamNullV1001', Level.LEVEL0, async () => {
      console.info('[dragPreviewApi11FirstParamNullV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('api11FirstParamNull'));
      let target = await driver.findComponent(ON.id('targetApi11FirstParamNull'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewApi11FirstParamNullV1001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('api11FirstParamNull');
      console.info('[dragPreviewApi11FirstParamNullV1001] END');
    });

    /**
     * @tc.name   dragPreviewApi11FirstParamUndefinedV1002
     * @tc.number SUB_ARKUI_DRAGPREVIEW_PARAM_002
     * @tc.desc   Test dragPreview API11 with first param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewApi11FirstParamUndefinedV1002', Level.LEVEL0, async () => {
      console.info('[dragPreviewApi11FirstParamUndefinedV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('api11FirstParamUndefined'));
      let target = await driver.findComponent(ON.id('targetApi11FirstParamUndefined'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewApi11FirstParamUndefinedV1002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('api11FirstParamUndefined');
      console.info('[dragPreviewApi11FirstParamUndefinedV1002] END');
    });

    /**
     * @tc.name   dragPreviewApi11FirstParamEmptyStringV1003
     * @tc.number SUB_ARKUI_DRAGPREVIEW_PARAM_003
     * @tc.desc   Test dragPreview API11 with first param empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewApi11FirstParamEmptyStringV1003', Level.LEVEL0, async () => {
      console.info('[dragPreviewApi11FirstParamEmptyStringV1003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('api11FirstParamEmptyString'));
      let target = await driver.findComponent(ON.id('targetApi11FirstParamEmptyString'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewApi11FirstParamEmptyStringV1003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('api11FirstParamEmptyString');
      console.info('[dragPreviewApi11FirstParamEmptyStringV1003] END');
    });

    /**
     * @tc.name   dragPreviewApi15OnlyForLiftingTrueV1004
     * @tc.number SUB_ARKUI_DRAGPREVIEW_PARAM_004
     * @tc.desc   Test dragPreview API15 with config onlyForLifting true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewApi15OnlyForLiftingTrueV1004', Level.LEVEL0, async () => {
      console.info('[dragPreviewApi15OnlyForLiftingTrueV1004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('api15OnlyForLiftingTrue'));
      let target = await driver.findComponent(ON.id('targetApi15OnlyForLiftingTrue'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewApi15OnlyForLiftingTrueV1004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('api15OnlyForLiftingTrue');
      console.info('[dragPreviewApi15OnlyForLiftingTrueV1004] END');
    });

    /**
     * @tc.name   dragPreviewApi15DelayCreatingFalseV1005
     * @tc.number SUB_ARKUI_DRAGPREVIEW_PARAM_005
     * @tc.desc   Test dragPreview API15 with config delayCreating false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewApi15DelayCreatingFalseV1005', Level.LEVEL0, async () => {
      console.info('[dragPreviewApi15DelayCreatingFalseV1005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('api15DelayCreatingFalse'));
      let target = await driver.findComponent(ON.id('targetApi15DelayCreatingFalse'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewApi15DelayCreatingFalseV1005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('api15DelayCreatingFalse');
      console.info('[dragPreviewApi15DelayCreatingFalseV1005] END');
    });

    /**
     * @tc.name   dragPreviewApi15FirstParamNullV1006
     * @tc.number SUB_ARKUI_DRAGPREVIEW_PARAM_006
     * @tc.desc   Test dragPreview API15 with first param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewApi15FirstParamNullV1006', Level.LEVEL0, async () => {
      console.info('[dragPreviewApi15FirstParamNullV1006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('api15FirstParamNull'));
      let target = await driver.findComponent(ON.id('targetApi15FirstParamNull'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewApi15FirstParamNullV1006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('api15FirstParamNull');
      console.info('[dragPreviewApi15FirstParamNullV1006] END');
    });

    /**
     * @tc.name   dragPreviewApi15FirstParamUndefinedV1007
     * @tc.number SUB_ARKUI_DRAGPREVIEW_PARAM_007
     * @tc.desc   Test dragPreview API15 with first param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewApi15FirstParamUndefinedV1007', Level.LEVEL0, async () => {
      console.info('[dragPreviewApi15FirstParamUndefinedV1007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('api15FirstParamUndefined'));
      let target = await driver.findComponent(ON.id('targetApi15FirstParamUndefined'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewApi15FirstParamUndefinedV1007] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('api15FirstParamUndefined');
      console.info('[dragPreviewApi15FirstParamUndefinedV1007] END');
    });

    /**
     * @tc.name   dragPreviewApi15SecondParamNullV1008
     * @tc.number SUB_ARKUI_DRAGPREVIEW_PARAM_008
     * @tc.desc   Test dragPreview API15 with second param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewApi15SecondParamNullV1008', Level.LEVEL0, async () => {
      console.info('[dragPreviewApi15SecondParamNullV1008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('api15SecondParamNull'));
      let target = await driver.findComponent(ON.id('targetApi15SecondParamNull'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewApi15SecondParamNullV1008] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('api15SecondParamNull');
      console.info('[dragPreviewApi15SecondParamNullV1008] END');
    });

    /**
     * @tc.name   dragPreviewApi15SecondParamUndefinedV1009
     * @tc.number SUB_ARKUI_DRAGPREVIEW_PARAM_009
     * @tc.desc   Test dragPreview API15 with second param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewApi15SecondParamUndefinedV1009', Level.LEVEL0, async () => {
      console.info('[dragPreviewApi15SecondParamUndefinedV1009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('api15SecondParamUndefined'));
      let target = await driver.findComponent(ON.id('targetApi15SecondParamUndefined'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewApi15SecondParamUndefinedV1009] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('api15SecondParamUndefined');
      console.info('[dragPreviewApi15SecondParamUndefinedV1009] END');
    });

    /**
     * @tc.name   dragPreviewApi15FirstParamEmptyStringV1010
     * @tc.number SUB_ARKUI_DRAGPREVIEW_PARAM_010
     * @tc.desc   Test dragPreview API15 with first param empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewApi15FirstParamEmptyStringV1010', Level.LEVEL0, async () => {
      console.info('[dragPreviewApi15FirstParamEmptyStringV1010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('api15FirstParamEmptyString'));
      let target = await driver.findComponent(ON.id('targetApi15FirstParamEmptyString'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewApi15FirstParamEmptyStringV1010] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('api15FirstParamEmptyString');
      console.info('[dragPreviewApi15FirstParamEmptyStringV1010] END');
    });
  })
}
