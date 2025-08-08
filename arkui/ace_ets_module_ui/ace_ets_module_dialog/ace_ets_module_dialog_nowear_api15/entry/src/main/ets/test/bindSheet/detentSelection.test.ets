/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function detentSelection() {
  describe('detentSelection', () => {
    beforeEach(async (done: Function) => {
      console.info("detentSelection beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/bindSheet/detentSelection",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get detentSelection state pages: " + JSON.stringify(pages));
        if (!("detentSelection" == pages.name)) {
          console.info("get detentSelection state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push detentSelection success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push detentSelection page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    detentSelection_0100
     * @tc.name      detentSelection_0100
     * @tc.desc      set detentSelection: -10
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('detentSelection_0100', Level.LEVEL1, async (done: Function) => {
      console.info('detentSelection_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bindSheet'));
      await btn.click();
      console.info('[detentSelection_0100] bindSheet click');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('text');
      let dent1: string = JSON.parse(strJson1).$attrs.content

      let btn1: Component = await driver.findComponent(ON.id('changeBtn'));
      await btn1.click();
      console.info('[detentSelection_0100] changeBtn click');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text');
      let dent2: string = JSON.parse(strJson2).$attrs.content
      expect(dent1).assertEqual(dent2);
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('[detentSelection_0100] END');
      done();
    });

    /**
     * @tc.number    detentSelection_0200
     * @tc.name      detentSelection_0200
     * @tc.desc      set detentSelection: SheetSize.LARGE
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('detentSelection_0200', Level.LEVEL1, async (done: Function) => {
      console.info('detentSelection_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bindSheet'));
      await btn.click();
      console.info('[detentSelection_0200] bindSheet click');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('text');
      let dent1: string = JSON.parse(strJson1).$attrs.content

      let btn1: Component = await driver.findComponent(ON.id('changedetent'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text');
      let dent2: string = JSON.parse(strJson2).$attrs.content
      console.info('[detentSelection_0200] dent1'+ dent1 +'dent2'+ dent2);
      expect( Number(dent1) -  Number(dent2)!=0  ).assertTrue();
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('[detentSelection_0200] END');
      done();
    });


  })
}
