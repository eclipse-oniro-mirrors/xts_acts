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

export default function BlockDescendantsTest() {
  describe('BlockDescendantsTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/HitTestBehavior/BlockDescendants',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get BlockDescendantsTest state pages: ' + JSON.stringify(pages));
        if (!('NormalEts' == pages.name)) {
          console.info('get BlockDescendantsTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push BlockDescendantsTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push BlockDescendantsTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('BlockDescendants after each called');
    });

    /**
     * @tc.name   BlockDescendantsTest_0010
     * @tc.number BlockDescendantsTest_0010
     * @tc.desc   HitTestMode: BLOCK_DESCENDANTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BlockDescendantsTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('BlockDescendantsTest_0010 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let inner = await driver.findComponent(ON.id('inner'));
      await CommonFunc.sleep(500);
      await inner.click();

      let strJson = getInspectorByKey('grandFatherStackText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BlockDescendantsTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('grandfather stack: grandFatherStackOnTouch');

      strJson = getInspectorByKey('fatherStackText');
      obj = JSON.parse(strJson);
      console.info('[BlockDescendantsTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('father stack: fatherStackOnTouch');

      strJson = getInspectorByKey('stackText');
      obj = JSON.parse(strJson);
      console.info('[BlockDescendantsTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('stack: ');

      strJson = getInspectorByKey('textText');
      obj = JSON.parse(strJson);
      console.info('[BlockDescendantsTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('text: textOnTouch');

      strJson = getInspectorByKey('outerButtonText');
      obj = JSON.parse(strJson);
      console.info('[BlockDescendantsTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('out button: outerButtonOnTouch');

      strJson = getInspectorByKey('innerButtonText');
      obj = JSON.parse(strJson);
      console.info('[BlockDescendantsTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('inner button: ');
      console.info('[BlockDescendantsTest_0010] END');
      done();
    });
  })
}