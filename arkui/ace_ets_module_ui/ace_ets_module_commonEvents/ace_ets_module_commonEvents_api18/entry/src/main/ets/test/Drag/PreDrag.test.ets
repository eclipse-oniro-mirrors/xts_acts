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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function PreDrag() {
  describe('PreDragTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Drag/PreDrag',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get PreDragTest state pages: ' + JSON.stringify(pages));
        if (!('PreDrag' == pages.name)) {
          console.info('get PreDragTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push PreDragTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PreDragTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PreDragTest after each called');
    });

    /**
     * @tc.number    PreDrag_0010
     * @tc.name      PreDrag
     * @tc.desc      api PreDrag
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('PreDragTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('PreDragTest_0010 START');
      let driver = await Driver.create();
      let grid = await driver.findComponent(ON.id('drag'));
      let button = await driver.findComponent(ON.id('button'));
      await grid.dragTo(button);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('drag');
      let obj: ESObject = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('button');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[PreDragTest_0010] PreDrag: ' + JSON.stringify(obj));
      console.info('[PreDragTest_0010] PreDrag: ' + JSON.stringify(obj.$attrs));
      expect(obj1.$attrs.label).assertEqual('350s');
      console.info('[PreDragTest_0010] END');
      done();
    });
  })
}