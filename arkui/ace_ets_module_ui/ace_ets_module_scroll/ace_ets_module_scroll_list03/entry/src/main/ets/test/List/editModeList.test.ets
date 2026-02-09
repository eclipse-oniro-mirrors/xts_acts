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

export default function editModeList() {
  describe('editModeList', () => {
    beforeEach(async (done: Function) => {
      console.info("editModeList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/editModeList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get editModeList state pages:" + JSON.stringify(pages));
        if (!("editModeList" == pages.name)) {
          console.info("get editModeList pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push editModeList page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push editModeList page error:" + err);
      }
      console.info("editModeList beforeEach end");
      done();
    });

    /**
     * @tc.name   editModeList_0100
     * @tc.number editModeList_0100
     * @tc.desc   Enabling the animation for converging multiple selected items through the editModeOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('editModeList_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[editModeList_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('list_editMode_1'));
      await btn.longClick();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('list_editMode');
      console.info("[editModeList_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      expect(JSON.parse(strJson).$type).assertEqual("List");
      let btnMenu: Component = await driver.findComponent(ON.id('list_editMode_menu'));
      await btnMenu.click();
      await CommonFunc.sleep(1500);
      console.info('[editModeList_0100] END');
      done();
    });

    /**
     * @tc.name   editModeList_0200
     * @tc.number editModeList_0200
     * @tc.desc   Disable the collapse animation through the editModeOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('editModeList_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[editModeList_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btnFalse: Component = await driver.findComponent(ON.id('list_editMode_false'));
      await btnFalse.click();
      await CommonFunc.sleep(1500);
      let btn: Component = await driver.findComponent(ON.id('list_editMode_1'));
      await btn.longClick();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('list_editMode');
      console.info("[editModeList_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      expect(JSON.parse(strJson).$type).assertEqual("List");
      let btnMenu: Component = await driver.findComponent(ON.id('list_editMode_menu'));
      await btnMenu.click();
      await CommonFunc.sleep(1500);
      console.info('[editModeList_0200] END');
      done();
    });
  })
}
