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

export default function BlockHierarchyTest() {
  describe('BlockHierarchyTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/HitTestBehavior/BlockHierarchy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get BlockHierarchyTest state pages: ' + JSON.stringify(pages));
        if (!('NormalEts' == pages.name)) {
          console.info('get BlockHierarchyTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push BlockHierarchyTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push BlockHierarchyTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('BlockHierarchy after each called');
    });

    /**
     * @tc.number    BlockHierarchyTest_0010
     * @tc.name      BlockHierarchyTest_0010
     * @tc.desc      HitTestMode: BLOCK_HIERARCHY
     * @tc.level:    Level 0
     */
    it('BlockHierarchyTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('BlockHierarchyTest_0010 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let Button30 = await driver.findComponent(ON.id('Button30'));
      await CommonFunc.sleep(500);
      await Button30.click();

      let strJson = getInspectorByKey('grandFatherStackText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BlockHierarchyTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('grandfather stack: ');

      strJson = getInspectorByKey('fatherStackText');
      obj = JSON.parse(strJson);
      console.info('[BlockHierarchyTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('father stack: ');

      strJson = getInspectorByKey('stackText');
      obj = JSON.parse(strJson);
      console.info('[BlockHierarchyTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('stack: stackOnTouch');

      strJson = getInspectorByKey('textText');
      obj = JSON.parse(strJson);
      console.info('[BlockHierarchyTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('text: textOnTouch');

      strJson = getInspectorByKey('outerButtonText');
      obj = JSON.parse(strJson);
      console.info('[BlockHierarchyTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('out button: ');

      strJson = getInspectorByKey('Button70Text');
      obj = JSON.parse(strJson);
      console.info('[BlockHierarchyTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('button70: Button70OnTouch');

      strJson = getInspectorByKey('Button50Text');
      obj = JSON.parse(strJson);
      console.info('[BlockHierarchyTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('button50: Button50OnTouch');

      strJson = getInspectorByKey('Button30Text');
      obj = JSON.parse(strJson);
      console.info('[BlockHierarchyTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('button30: Button30OnTouch');
      console.info('[BlockHierarchyTest_0010] END');
      done();
    });
  })
}