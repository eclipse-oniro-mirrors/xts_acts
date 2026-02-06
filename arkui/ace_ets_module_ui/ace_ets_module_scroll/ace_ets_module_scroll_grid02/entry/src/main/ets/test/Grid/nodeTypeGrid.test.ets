/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export default function nodeTypeGrid() {
  describe('nodeTypeGrid', () => {
    beforeEach(async (done: Function) => {
      console.info("nodeTypeGrid beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/nodeTypeGrid',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get nodeTypeGrid state pages: " + JSON.stringify(pages));
        if (!("nodeTypeGrid" == pages.name)) {
          console.info("get nodeTypeGrid state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push nodeTypeGrid success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push nodeTypeGrid page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" nodeTypeGrid after each called");
    });

    /**
     * @tc.name   nodeTypeGrid_0100
     * @tc.number SUB_ACE_TYPENODE_GRID_0100
     * @tc.desc   Grid type FrameNode node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeTypeGrid_0100', Level.LEVEL1, async (done: Function) => {
      console.info('nodeTypeGrid_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.type('Grid'));
      let type1 = await button.getType();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('grid_node');
      console.info("[nodeTypeGrid_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual(type1);
      console.info('[nodeTypeGrid_0100] END');
      done();
    });

    /**
     * @tc.name   nodeTypeGrid_0200
     * @tc.number SUB_ACE_TYPENODE_LISTITEM_0100
     * @tc.desc   GridItem type FrameNode node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeTypeGrid_0200', Level.LEVEL1, async (done: Function) => {
      console.info('nodeTypeGrid_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('gridItem_node');
      console.info("[nodeTypeGrid_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('GridItem');
      console.info('[nodeTypeGrid_0200] END');
      done();
    });

  })
}