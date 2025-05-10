/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function alphabetBorderRadiusTest() {
  describe('alphabetBorderRadiusTest', () => {
    beforeEach(async (done: Function) => {
      console.info("alphabetBorderRadiusTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/alphabetBorderRadius",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get alphabetBorderRadiusTest state pages:" + JSON.stringify(pages));
        if (!("alphabetBorderRadius" == pages.name)) {
          console.info("get alphabetBorderRadiusTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push alphabetBorderRadiusTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alphabetBorderRadiusTest page error:" + err);
      }
      console.info("alphabetBorderRadiusTest beforeEach end");
      done();
    });

    /**
     * @tc.number    alphabetBorderRadiusTest_001
     * @tc.name      alphabetBorderRadiusTest_001
     * @tc.desc      Support touch feedback.
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('alphabetBorderRadiusTest_001', 0, async (done: Function) => {
      console.info('[alphabetBorderRadiusTest_001] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('alphabet_borderRadius');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[alphabetBorderRadiusTest_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.itemBorderRadius).assertEqual('10.00vp');
      expect(obj.$attrs.indexerBorderRadius).assertEqual('14.00vp');
      console.info('[alphabetBorderRadiusTest_001] END');
      done();
    });

    /**
     * @tc.number    alphabetBorderRadiusTest_002
     * @tc.name      alphabetBorderRadiusTest_002
     * @tc.desc      Support touch feedback.
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('alphabetBorderRadiusTest_002', 0, async (done: Function) => {
      console.info('[alphabetBorderRadiusTest_002] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('alphabet_borderRadius');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[alphabetBorderRadiusTest_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.popupItemBorderRadius).assertEqual('10.00vp');
      expect(obj.$attrs.popupBorderRadius).assertEqual('14.00vp');
      console.info('[alphabetBorderRadiusTest_002] END');
      done();
    });
    /**
     * @tc.number    alphabetBorderRadiusTest_003
     * @tc.name      alphabetBorderRadiusTest_003
     * @tc.desc      Support touch feedback.
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('alphabetBorderRadiusTest_003', 0, async (done: Function) => {
      console.info('[alphabetBorderRadiusTest_003] START');
      await CommonFunc.sleep(1000);

      let indexerOffset = CommonFunc.getComponentRectOnScreen('alphabet_borderRadius2');
      let height = indexerOffset.bottom - indexerOffset.top;
      let width = indexerOffset.right - indexerOffset.left;
      console.info("alphabetBorderRadiusTest_003 value : width is" + width + " height is "  + height);

      let strJson = getInspectorByKey('alphabet_borderRadius2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[alphabetBorderRadiusTest_003] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.itemBorderRadius).assertEqual('16.00vp');
      console.info('[alphabetBorderRadiusTest_003] END');
      done();
    });

    /**
     * @tc.number    alphabetBorderRadiusTest_004
     * @tc.name      alphabetBorderRadiusTest_004
     * @tc.desc      Support touch feedback.
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('alphabetBorderRadiusTest_004', 0, async (done: Function) => {
      console.info('[alphabetBorderRadiusTest_004] START');
      await CommonFunc.sleep(1000);

      let indexerOffset = CommonFunc.getComponentRectOnScreen('alphabet_borderRadius3');
      let height = indexerOffset.bottom - indexerOffset.top;
      let width = indexerOffset.right - indexerOffset.left;
      console.info("alphabetBorderRadiusTest_004 value : width is" + width + " height is "  + height);

      let strJson = getInspectorByKey('alphabet_borderRadius3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[alphabetBorderRadiusTest_004] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.itemBorderRadius).assertEqual('24.00vp');
      console.info('[alphabetBorderRadiusTest_004] END');
      done();
    });

    /**
     * @tc.number    alphabetBorderRadiusTest_005
     * @tc.name      alphabetBorderRadiusTest_005
     * @tc.desc      Support touch feedback.
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('alphabetBorderRadiusTest_005', 0, async (done: Function) => {
      console.info('[alphabetBorderRadiusTest_005] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('layout_indexer'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let indexerOffset = CommonFunc.getComponentRectOnScreen('alphabet_borderRadius2');
      let height = indexerOffset.bottom - indexerOffset.top;
      let width = indexerOffset.right - indexerOffset.left;
      console.info("alphabetBorderRadiusTest_005 value : width is" + width + " height is "  + height);

      let strJson = getInspectorByKey('alphabet_borderRadius2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[alphabetBorderRadiusTest_005] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.itemBorderRadius).assertEqual('16.00vp');
      console.info('[alphabetBorderRadiusTest_005] END');
      done();
    });

    /**
     * @tc.number    alphabetBorderRadiusTest_006
     * @tc.name      alphabetBorderRadiusTest_006
     * @tc.desc      Support touch feedback.
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('alphabetBorderRadiusTest_006', 0, async (done: Function) => {
      console.info('[alphabetBorderRadiusTest_006] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('layout_indexer'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let indexerOffset = CommonFunc.getComponentRectOnScreen('alphabet_borderRadius3');
      let height = indexerOffset.bottom - indexerOffset.top;
      let width = indexerOffset.right - indexerOffset.left;
      console.info("alphabetBorderRadiusTest_006 value : width is" + width + " height is "  + height);

      let strJson = getInspectorByKey('alphabet_borderRadius3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[alphabetBorderRadiusTest_006] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.itemBorderRadius).assertEqual('24.00vp');
      console.info('[alphabetBorderRadiusTest_006] END');
      done();
    });
  })
}
