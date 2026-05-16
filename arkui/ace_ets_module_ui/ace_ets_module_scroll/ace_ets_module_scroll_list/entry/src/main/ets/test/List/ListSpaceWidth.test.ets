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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
const SLEEP_TIME = 1000;

export default function ListSpaceWidthTest() {
  describe('ListSpaceWidthTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ListSpaceWidthTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListSpaceWidth',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListSpaceWidthTest state pages:" + JSON.stringify(pages));
        if (!("ListSpaceWidth" == pages.name)) {
          console.info("get ListSpaceWidthTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ListSpaceWidthTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListSpaceWidthTest page error:" + err);
      }
      console.info("ListSpaceWidthTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("ListSpaceWidthTest after each called");
    });
    /**
     * @tc.number SUB_ARKUI_LIST_SPACEWIDTH_TEST_0100
     * @tc.name   SUB_ARKUI_LIST_SPACEWIDTH_TEST_0100
     * @tc.desc   Set the value return 200.00vp.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('SUB_ARKUI_LIST_SPACEWIDTH_TEST_0100', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('changeSpaceWListValue0'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('listSpaceWidthId');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ARKUI_LIST_SPACEWIDTH_TEST_0100] List spaceWidth: " + JSON.stringify(obj.$attrs.spaceWidth));
      let strJsonItem = getInspectorByKey('listItemGroupSpaceWidthId');
      let objItem: ESObject = JSON.parse(strJsonItem);
      console.info("[SUB_ARKUI_LIST_SPACEWIDTH_TEST_0100] ListItem spaceWidth: " + JSON.stringify(objItem.$attrs.spaceWidth));
      expect(obj.$attrs.spaceWidth).assertEqual('200.00vp');
      expect(objItem.$attrs.spaceWidth).assertEqual('200.00vp');
      console.info('[SUB_ARKUI_LIST_SPACEWIDTH_TEST_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_LIST_SPACEWIDTH_TEST_0200
     * @tc.name   SUB_ARKUI_LIST_SPACEWIDTH_TEST_0200
     * @tc.desc   Set the value return 0.00vp.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('SUB_ARKUI_LIST_SPACEWIDTH_TEST_0200', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('changeSpaceWListValue1'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('listSpaceWidthId');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ARKUI_LIST_SPACEWIDTH_TEST_0200] List spaceWidth: " + JSON.stringify(obj.$attrs.spaceWidth));
      let strJsonItem = getInspectorByKey('listItemGroupSpaceWidthId');
      let objItem: ESObject = JSON.parse(strJsonItem);
      console.info("[SUB_ARKUI_LIST_SPACEWIDTH_TEST_0200] ListItem spaceWidth: " + JSON.stringify(objItem.$attrs.spaceWidth));
      expect(obj.$attrs.spaceWidth).assertEqual('0.00vp');
      expect(objItem.$attrs.spaceWidth).assertEqual('0.00vp');
      console.info('[SUB_ARKUI_LIST_SPACEWIDTH_TEST_0200] END');
      done();
    });
  })
}