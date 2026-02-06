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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function canOverList() {
  describe('canOverList', () => {
    beforeEach(async (done: Function) => {
      console.info("canOverList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/canOverList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get canOverList state pages:" + JSON.stringify(pages));
        if (!("canOverList" == pages.name)) {
          console.info("get canOverList pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push canOverList page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push canOverList page error:" + err);
      }
      console.info("canOverList beforeEach end");
      done();
    });

    /**
     * @tc.number    canOverList_001
     * @tc.name      canOverList_0100
     * @tc.desc      Set the canOverscroll property value to true.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('canOverList_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverList_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_list_true'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let list = CommonFunc.getComponentRectOnScreen('canOverScroll_list');
      let listItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_list_0');

      console.info(`[canOverList_0100] list.top=
        ${list.top}`);
      console.info(`[canOverList_0100] vp2px(30)=
        ${vp2px(30)}`);
      console.info(`[canOverList_0100] listItem0.top=
        ${listItem0.top}`);
      expect(Math.floor(Math.abs(listItem0.top - vp2px(30) - list.top)) <= 1).assertTrue();
      console.info('[canOverList_0100] END');
      done();
    });

    /**
     * @tc.number    canOverList_002
     * @tc.name      canOverList_0200
     * @tc.desc      Set the canOverscroll property value to false.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('canOverList_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverList_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_list_false'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let list = CommonFunc.getComponentRectOnScreen('canOverScroll_list');
      let listItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_list_0');

      console.info(`[canOverList_0100] list.top=
        ${list.top}`);
      console.info(`[canOverList_0100] listItem0.top=
        ${listItem0.top}`);
      expect(Math.abs(Math.floor(listItem0.top - list.top)) <= 1).assertTrue();
      console.info('[canOverList_0200] END');
      done();
    });

    /**
     * @tc.number    canOverList_003
     * @tc.name      canOverList_0300
     * @tc.desc      Set the canOverscroll property value to null.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('canOverList_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverList_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_list_null'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let list = CommonFunc.getComponentRectOnScreen('canOverScroll_list');
      let listItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_list_0');

      console.info(`[canOverList_0100] list.top=
        ${list.top}`);
      console.info(`[canOverList_0100] listItem0.top=
        ${listItem0.top}`);
      expect(Math.abs(Math.floor(listItem0.top - list.top)) <= 1).assertTrue();
      console.info('[canOverList_0300] END');
      done();
    });

    /**
     * @tc.number    canOverList_004
     * @tc.name      canOverList_0400
     * @tc.desc      Set the canOverscroll property value to undefined.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('canOverList_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverList_0400] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_list_ude'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let list = CommonFunc.getComponentRectOnScreen('canOverScroll_list');
      let listItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_list_0');

      console.info(`[canOverList_0100] list.top=
        ${list.top}`);
      console.info(`[canOverList_0100] listItem0.top=
        ${listItem0.top}`);
      expect(Math.abs(Math.floor(listItem0.top - list.top)) <= 1).assertTrue();
      console.info('[canOverList_0400] END');
      done();
    });
  })
}
