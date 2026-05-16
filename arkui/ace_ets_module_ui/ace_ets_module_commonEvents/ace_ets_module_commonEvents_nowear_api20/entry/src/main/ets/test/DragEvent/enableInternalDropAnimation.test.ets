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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function enableInternalDropAnimationTest() {
  describe('enableInternalDropAnimationTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragEvent/enableInternalDropAnimation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get enableInternalDropAnimationTest state pages: ' + JSON.stringify(pages));
        if (!('NormalEts' == pages.name)) {
          console.info('get enableInternalDropAnimationTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push enableInternalDropAnimationTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push enableInternalDropAnimationTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('enableInternalDropAnimation after each called');
    });

    /**
     * @tc.name   enableInternalDropAnimationTest_0010
     * @tc.number enableInternalDropAnimationTest_0010
     * @tc.desc   enableInternalDropAnimation interface, set useCustomDropAnimation = 0 Input parameter validation failed error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('enableInternalDropAnimationTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('enableInternalDropAnimationTest_0010 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let startDrag = await driver.findComponent(ON.id('onDropped01'));
      let endDrag = await driver.findComponent(ON.id('onDropped00'));
      await startDrag.dragTo(endDrag);
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('onDropText00');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('401');
      done();
    });

    /**
     * @tc.name   enableInternalDropAnimationTest_0020
     * @tc.number enableInternalDropAnimationTest_0020
     * @tc.desc   enableInternalDropAnimation interface, set useCustomDropAnimation = 0 system application or device type validation failed error code test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('enableInternalDropAnimationTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('enableInternalDropAnimationTest_0020 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let startDrag = await driver.findComponent(ON.id('onDropped00'));
      let endDrag = await driver.findComponent(ON.id('onDropped01'));
      await startDrag.dragTo(endDrag);
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('onDropText01');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      if (obj.$attrs.content === '202') {
        expect(obj.$attrs.content).assertEqual('202');
      } else if (obj.$attrs.content === '801') {
        expect(obj.$attrs.content).assertEqual('801');
      } else {
        throw new Error(`Unexpected value: ${obj.$attrs.content}`);
      }
      done();
    });

    /**
     * @tc.name   enableInternalDropAnimationTest_0030
     * @tc.number enableInternalDropAnimationTest_0030
     * @tc.desc   enableInternalDropAnimation interface, set useCustomDropAnimation = 1 Input parameter validation failed error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('enableInternalDropAnimationTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('enableInternalDropAnimationTest_0030 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let startDrag = await driver.findComponent(ON.id('onDropped11'));
      let endDrag = await driver.findComponent(ON.id('onDropped10'));
      await startDrag.dragTo(endDrag);
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('onDropText10');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0030] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('401');
      done();
    });

    /**
     * @tc.name   enableInternalDropAnimationTest_0040
     * @tc.number enableInternalDropAnimationTest_0040
     * @tc.desc   enableInternalDropAnimation interface, set useCustomDropAnimation = 0 system application or device type validation failed error code test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('enableInternalDropAnimationTest_0040', Level.LEVEL1, async (done: Function) => {
      console.info('enableInternalDropAnimationTest_0040 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let startDrag = await driver.findComponent(ON.id('onDropped10'));
      let endDrag = await driver.findComponent(ON.id('onDropped11'));
      await startDrag.dragTo(endDrag);
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('onDropText11');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0040] Obj: ' + JSON.stringify(obj.$attrs.content));
      if (obj.$attrs.content === '202') {
        expect(obj.$attrs.content).assertEqual('202');
      } else if (obj.$attrs.content === '801') {
        expect(obj.$attrs.content).assertEqual('801');
      } else {
        throw new Error(`Unexpected value: ${obj.$attrs.content}`);
      }
      done();
    });

    /**
     * @tc.name   enableInternalDropAnimationTest_0050
     * @tc.number enableInternalDropAnimationTest_0050
     * @tc.desc   enableInternalDropAnimation Operation not allowed for current pharse test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('enableInternalDropAnimationTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('enableInternalDropAnimationTest_0050 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let startDrag = await driver.findComponent(ON.id('onDrag'));
      let endDrag = await driver.findComponent(ON.id('onDropped10'));
      await startDrag.dragTo(endDrag);
      await CommonFunc.sleep(500);
      await endDrag.dragTo(startDrag);
      await CommonFunc.sleep(500);

      let strJson = getInspectorByKey('onDragText0');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0050] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('190003');
      strJson = getInspectorByKey('onDragText1');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('190003');
      strJson = getInspectorByKey('onDragText2');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('190003');
      strJson = getInspectorByKey('onDragText3');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('190003');
      strJson = getInspectorByKey('onDragText4');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('190003');
      done();
    });
  })
}