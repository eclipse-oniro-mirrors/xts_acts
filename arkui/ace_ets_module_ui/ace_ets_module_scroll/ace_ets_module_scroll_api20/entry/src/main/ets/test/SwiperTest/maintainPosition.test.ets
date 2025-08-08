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

export default function maintainPosition() {
  describe('maintainPosition', () => {
    beforeEach(async (done: Function) => {
      console.info("maintainPosition beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/maintainPosition",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get maintainPosition state pages:" + JSON.stringify(pages));
        if (!("maintainPosition" == pages.name)) {
          console.info("get maintainPosition pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push maintainPosition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push maintainPosition page error:" + err);
      }
      console.info("maintainPosition beforeEach end");
      done();
    });

    /**
     * @tc.number    maintainPosition_001
     * @tc.name      maintainPosition_0100
     * @tc.desc      When inserting data in front of the display area, the visible content position changes.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('maintainPosition_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[maintainPosition_0100] START');
      await CommonFunc.sleep(1000);
      //maintainVisibleContentPosition false
      let driver = Driver.create();
      await driver.assertComponentExist(ON.text('5'));

      let btnAdd = await driver.findComponent(ON.id('maintain_swiper_add'));
      await btnAdd.click();
      await CommonFunc.sleep(1500);
      console.info('[maintainPosition_0100] swiper 4');
      await driver.assertComponentExist(ON.text('4'));
      let strJson = getInspectorByKey('swiper_maintain_index');
      console.info("[maintainPosition_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Swiper: 5');

      //reset
      let btnDel = await driver.findComponent(ON.id('maintain_swiper_del'));
      await btnDel.click();
      await CommonFunc.sleep(1500);
      console.info('[maintainPosition_0100] END');
      done();
    });

    /**
     * @tc.number    maintainPosition_002
     * @tc.name      maintainPosition_0200
     * @tc.desc      Keep the visible content position unchanged when inserting data in front of the display area.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('maintainPosition_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[maintainPosition_0200] START');
      await CommonFunc.sleep(1000);
      //maintainVisibleContentPosition true
      let driver = Driver.create();
      await driver.assertComponentExist(ON.text('5'));
      
      let btnTrue = await driver.findComponent(ON.id('maintain_swiper_true'));
      await btnTrue.click();
      await CommonFunc.sleep(2000);
      let btnAdd = await driver.findComponent(ON.id('maintain_swiper_add'));
      await btnAdd.click();
      await CommonFunc.sleep(1500);
      console.info('[maintainPosition_0200] swiper 5');
      await driver.assertComponentExist(ON.text('5'));
      let strJson = getInspectorByKey('swiper_maintain_index');
      console.info("[maintainPosition_0200] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Swiper: 6');
      
      //reset
      let btnTrueDel = await driver.findComponent(ON.id('maintain_swiper_del'));
      await btnTrueDel.click();
      await CommonFunc.sleep(1500);
      console.info('[maintainPosition_0200] END');
      done();
    });
  })
}