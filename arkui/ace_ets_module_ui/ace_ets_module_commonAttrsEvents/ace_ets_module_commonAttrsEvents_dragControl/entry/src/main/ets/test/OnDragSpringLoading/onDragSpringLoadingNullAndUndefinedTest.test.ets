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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function commonMethodOnDragSpringLoadingNullAndUndefinedTest() {
  describe('commonMethodOnDragSpringLoadingNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("commonMethodOnDragSpringLoadingNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/onDragSpringLoadingNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get commonMethodOnDragSpringLoadingNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("onDragSpringLoadingNullAndUndefined" == pages.name)) {
          console.info("get commonMethodOnDragSpringLoadingNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push commonMethodOnDragSpringLoadingNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonMethodOnDragSpringLoadingNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonMethodOnDragSpringLoadingNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   commonMethodOnDragSpringLoadingNullV1001
     * @tc.number SUB_ARKUI_COMMONMETHOD_ONDRAGSPRINGLOADING_PARAM_001
     * @tc.desc   Test CommonMethod onDragSpringLoading with null/undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodOnDragSpringLoadingNullV1001', Level.LEVEL1, async (done: Function) => {
      console.info('commonMethodOnDragSpringLoadingNullV1001 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let startDrag = await driver.findComponent(ON.id('image'));
      let endDrag1 = await driver.findComponent(ON.id('column1'));
      let endDrag2 = await driver.findComponent(ON.id('column2'));
      let endDrag3 = await driver.findComponent(ON.id('column3'));
      let endDrag4 = await driver.findComponent(ON.id('column4'));
      await startDrag.dragTo(endDrag1);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0030] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('当前状态是： 0');

      await startDrag.dragTo(endDrag2);
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('text1');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0030] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('当前状态是： 0');

      await startDrag.dragTo(endDrag3);
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('text1');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0030] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('当前状态是： 0');

      await startDrag.dragTo(endDrag4);
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('text1');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0030] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('当前状态是： 0');
      done();
    });
  })
}
