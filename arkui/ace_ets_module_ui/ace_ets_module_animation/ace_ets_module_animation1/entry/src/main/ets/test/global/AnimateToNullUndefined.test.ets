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
export default function AnimateToNullUndefined() {
  describe('AnimateToNullUndefined', () => {
    beforeEach(async (done:Function) =>{
      console.info("AnimateToNullUndefined beforeEach start");
      let options:router.RouterOptions= {
        url: 'MainAbility/pages/global/AnimateToNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AnimateToNullUndefined state pages: " + JSON.stringify(pages));
        if (!("AnimateToNullUndefined" == pages.name)) {
          console.info("get AnimateToNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AnimateToNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AnimateToNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AnimateToNullUndefined_0100
     * @tc.number AnimateToNullUndefined_0100
     * @tc.desc   test animateTo undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AnimateToNullUndefined_0100', Level.LEVEL0, async (done:Function) => {
      console.info('AnimateToNullUndefined_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('greenId'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('greenId');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AnimateToNullUndefined_0100] green height :' + obj1.$attrs.height);
      expect(obj1.$attrs.height == '20.00%').assertTrue();
 
      let btn2: Component = await driver.findComponent(ON.id('redId'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('redId');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AnimateToNullUndefined_0100] red height: ' + obj2.$attrs.height);
      expect(obj2.$attrs.height == '20.00%').assertTrue();
      console.info('[AnimateToNullUndefined_0100] END');
      done();
    })

    /**
     * @tc.name   AnimateToNullUndefined_0200
     * @tc.number AnimateToNullUndefined_0200
     * @tc.desc   test animateTo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AnimateToNullUndefined_0200', Level.LEVEL0, async (done:Function) => {
      console.info('AnimateToNullUndefined_0200 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('blueId'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('blueId');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AnimateToNullUndefined_0200] blue height :' + obj1.$attrs.height);
      expect(obj1.$attrs.height == '10.00%').assertTrue();
      console.info('[AnimateToNullUndefined_0200] END');
      done();
    })
 })
}