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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';

export default function List_lanes_1() {

  describe('List_lanes_1', () => {
    beforeEach(async (done: Function) => {
      console.info("List_lanes beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListChange/List_lanes_1',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get List_lanes state pages:" + JSON.stringify(pages));
        if (!("List_lanes_1" == pages.name)) {
          console.info("get List_lanes state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push List_lanes page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_lanes page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_lanes beforeEach end");
      done()
    });

    /**
     * @tc.number SUB_ACE_LIST_LANES_TEST_0100
     * @tc.name testListLanesToOne
     * @tc.desc List parent component binds the lanes property lanes(1)
     */
    it('testListLanesToOne', 0, async (done: Function) => {
      console.info('testListLanesToOne START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('List_lanes_1_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_lanes_011: RectValue = CommonFunc.getComponentRect('List_lanes_001');
      let List_lanes_012: RectValue = CommonFunc.getComponentRect('List_lanes_002');
      let List_lanes_013: RectValue = CommonFunc.getComponentRect('List_lanes_003');
      let List_lanes_014: RectValue = CommonFunc.getComponentRect('List_lanes_004');
      let List_lanes_01: RectValue = CommonFunc.getComponentRect('List_lanes_1_01');
      let width: number = List_lanes_01.right - List_lanes_01.left;
      let height: number = List_lanes_01.bottom - List_lanes_01.top;
      
      expect(Math.abs(List_lanes_011.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(List_lanes_012.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(List_lanes_013.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(List_lanes_014.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(List_lanes_011.top - List_lanes_01.top) <= 1).assertTrue();

      expect(Math.abs(Math.round(List_lanes_012.top - List_lanes_011.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_013.top - List_lanes_012.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_014.top - List_lanes_013.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_01.bottom - List_lanes_014.bottom) - Math.round(height - height*0.15*4 - 3*vp2px(20))) <= 1).assertTrue();


      expect(Math.abs(Math.round(List_lanes_011.right - List_lanes_011.left) - Math.round(width*0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_012.right - List_lanes_012.left) - Math.round(width*0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_013.right - List_lanes_013.left) - Math.round(width*0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_014.right - List_lanes_014.left) - Math.round(width*0.4)) <= 1).assertTrue();

      expect(Math.abs(Math.round(List_lanes_011.bottom - List_lanes_011.top) - Math.round(height*0.15)) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_012.bottom - List_lanes_012.top) - Math.round(height*0.15)) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_013.bottom - List_lanes_013.top) - Math.round(height*0.15)) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_014.bottom - List_lanes_014.top) - Math.round(height*0.15)) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(
        Math.round(List_lanes_013.left + ((List_lanes_013.right - List_lanes_013.left) / 2)),
        Math.round(List_lanes_013.bottom),
        Math.round(List_lanes_012.left + ((List_lanes_012.right - List_lanes_012.left) / 2)),
        Math.round(List_lanes_012.bottom));
      await CommonFunc.sleep(1000);
      let List_lanes_024: RectValue = CommonFunc.getComponentRect('List_lanes_004');
      expect(Math.abs((List_lanes_01.bottom - List_lanes_024.bottom) - Math.round(height - height*0.15*4 - 3*vp2px(20))) <= 1).assertTrue();
      console.info('testListLanesToOne END');
      done();
    });
  })
}