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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import events_emitter from '@ohos.events.emitter'
export default function AnimateToImmediatelyNullUndefined() {
  describe('AnimateToImmediatelyNullUndefined', () => {
    beforeEach(async (done:Function) =>{
      console.info("AnimateToImmediatelyNullUndefined beforeEach start");
      let options:router.RouterOptions= {
        url: 'MainAbility/pages/global/AnimateToImmediatelyNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AnimateToImmediatelyNullUndefined state pages: " + JSON.stringify(pages));
        if (!("AnimateToImmediatelyNullUndefined" == pages.name)) {
          console.info("get AnimateToImmediatelyNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AnimateToImmediatelyNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AnimateToImmediatelyNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AnimateToImmediatelyNullUndefined_0100
     * @tc.number AnimateToImmediatelyNullUndefined_0100
     * @tc.desc   test animateToImmediately curve empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AnimateToImmediatelyNullUndefined_0100', Level.LEVEL0, async (done:Function) => {
      console.info('AnimateToImmediatelyNullUndefined_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('columnId');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AnimateToImmediatelyNullUndefined_0100] 1 opacity :' + obj1.$attrs.opacity);
      expect(obj1.$attrs.opacity == 0).assertTrue();
 
      let btn: Component = await driver.findComponent(ON.id('changeId'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('columnId');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AnimateToImmediatelyNullUndefined_0100] 2 opacity: ' + obj2.$attrs.opacity);
      expect(obj2.$attrs.opacity == 1).assertTrue();
      console.info('[AnimateToImmediatelyNullUndefined_0100] END');
      done();
    })

    /**
     * @tc.name   AnimateToImmediatelyNullUndefined_0200
     * @tc.number AnimateToImmediatelyNullUndefined_0200
     * @tc.desc   test animateToImmediately null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AnimateToImmediatelyNullUndefined_0200', Level.LEVEL0, async (done:Function) => {
      console.info('AnimateToImmediatelyNullUndefined_0200 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('change2Id'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('columnId');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AnimateToImmediatelyNullUndefined_0200] 1 height :' + obj1.$attrs.height);
      expect(obj1.$attrs.height == '20.00%').assertTrue();
 
      let btn2: Component = await driver.findComponent(ON.id('clearId'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let btn3: Component = await driver.findComponent(ON.id('change3Id'));
      await btn3.click();
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('columnId');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AnimateToImmediatelyNullUndefined_0200] 2 height :' + obj2.$attrs.height);
      expect(obj2.$attrs.height == '20.00%').assertTrue();
      console.info('[AnimateToImmediatelyNullUndefined_0200] END');
      done();
    })
 })
}