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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';
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
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';

export default function List_lanes() {

  describe('List_lanes', () => {
    beforeEach(async (done: Function) => {
      console.info("List_lanes beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListChange/List_lanes',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get List_lanes state pages:" + JSON.stringify(pages));
        if (!("List_lanes" == pages.name)) {
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

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_lanes after each called");
    });

    /**
     * @tc.number SUB_ACE_LIST_LANES_TEST_0200
     * @tc.name testListLanesToTwo
     * @tc.desc List parent component binds the lanes property lanes(2)
     */
    it('testListLanesToTwo',  Level.LEVEL0, async (done: Function) => {
      console.info('testListLanesToTwo START');
      globalThis.value.message.notify({
        name: 'addLanes', value: 2
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('List_lanes_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_lanes_011: RectValue = CommonFunc.getComponentRect('List_lanes_011');
      let List_lanes_012: RectValue = CommonFunc.getComponentRect('List_lanes_012');
      let List_lanes_013: RectValue = CommonFunc.getComponentRect('List_lanes_013');
      let List_lanes_014: RectValue = CommonFunc.getComponentRect('List_lanes_014');
      let List_lanes_01: RectValue = CommonFunc.getComponentRect('List_lanes_01');
      expect(Math.abs(List_lanes_011.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(List_lanes_012.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.top - List_lanes_011.bottom) - vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.top - List_lanes_012.bottom) - vp2px(20))) <= 1).assertTrue();

      expect(Math.abs(List_lanes_011.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(List_lanes_013.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(Math.round((List_lanes_012.left - List_lanes_011.right) * 10) / 10 - Math.round(vp2px(75) * 10) / 10) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((List_lanes_014.left - List_lanes_013.right) * 10) / 10 - Math.round(vp2px(75) * 10) / 10) <= 1)
        .assertTrue();

      expect(Math.abs(Math.floor((List_lanes_011.right - List_lanes_011.left) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_012.right - List_lanes_012.left) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.right - List_lanes_013.left) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.right - List_lanes_014.left) - vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.floor((List_lanes_011.bottom - List_lanes_011.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_012.bottom - List_lanes_012.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.bottom - List_lanes_013.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.bottom - List_lanes_014.top) - vp2px(100))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(100, 120, 100, 0);
      await CommonFunc.sleep(1000);
      let List_lanes_024: RectValue = CommonFunc.getComponentRect('List_lanes_013');
      expect(Math.abs(Math.floor((List_lanes_024.top - List_lanes_01.top) - vp2px(120))) <= 1).assertTrue();
      console.info('testListLanesToTwo END');
      done();
    });
    /**
     * @tc.number SUB_ACE_LIST_LANES_TEST_0300
     * @tc.name testListLanesToRange01
     * @tc.desc List parent component binds the lanes property lanes({minLength:100,maxLength:150})
     */
    it('testListLanesToRange01',  Level.LEVEL0, async (done: Function) => {
      console.info('testListLanesToRange01 START');
      globalThis.value.message.notify({
        name: 'addLanes', value: {
          minLength: 100, maxLength: 150
        }
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('List_lanes_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_lanes_011: RectValue = CommonFunc.getComponentRect('List_lanes_011');
      let List_lanes_012: RectValue = CommonFunc.getComponentRect('List_lanes_012');
      let List_lanes_013: RectValue = CommonFunc.getComponentRect('List_lanes_013');
      let List_lanes_014: RectValue = CommonFunc.getComponentRect('List_lanes_014');
      let List_lanes_01: RectValue = CommonFunc.getComponentRect('List_lanes_01');
      expect(Math.abs(List_lanes_011.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(List_lanes_012.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(List_lanes_013.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(List_lanes_014.top - List_lanes_011.bottom - Math.round(vp2px(20))) <= 1).assertTrue();

      expect(Math.abs(List_lanes_011.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(List_lanes_014.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(Math.round((List_lanes_012.left - List_lanes_011.right) -(vp2px(50 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((List_lanes_013.left - List_lanes_012.right) -(vp2px(50 / 3)))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(List_lanes_011.right - List_lanes_011.left) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_012.right - List_lanes_012.left) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_013.right - List_lanes_013.left) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_014.right - List_lanes_014.left) - Math.round(vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.round(List_lanes_011.bottom - List_lanes_011.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_012.bottom - List_lanes_012.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_013.bottom - List_lanes_013.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_lanes_014.bottom - List_lanes_014.top) - Math.round(vp2px(100))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(100, 120, 100, 0);
      await CommonFunc.sleep(1000);
      let List_lanes_024: RectValue = CommonFunc.getComponentRect('List_lanes_014');
      expect(Math.abs(List_lanes_024.top - List_lanes_01.top - Math.round(vp2px(120))) <= 1).assertTrue();
      console.info('testListLanesToRange01 END');
      done();
    });
    /**
     * @tc.number SUB_ACE_LIST_LANES_TEST_0400
     * @tc.name testListLanesToRange02
     * @tc.desc List parent component binds the lanes property lanes({minLength:150,maxLength:200})
     */
    it('testListLanesToRange02',  Level.LEVEL0, async (done: Function) => {
      console.info('testListLanesToRange02 START');
      globalThis.value.message.notify({
        name: 'addLanes', value: {
          minLength: 150, maxLength: 200
        }
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('List_lanes_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_lanes_011: RectValue = CommonFunc.getComponentRect('List_lanes_011');
      let List_lanes_012: RectValue = CommonFunc.getComponentRect('List_lanes_012');
      let List_lanes_013: RectValue = CommonFunc.getComponentRect('List_lanes_013');
      let List_lanes_014: RectValue = CommonFunc.getComponentRect('List_lanes_014');
      let List_lanes_01: RectValue = CommonFunc.getComponentRect('List_lanes_01');
      expect(Math.abs(List_lanes_011.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(List_lanes_012.top - List_lanes_01.top) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.top - List_lanes_011.bottom) - vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.top - List_lanes_012.bottom) - vp2px(20))) <= 1).assertTrue();

      expect(Math.abs(List_lanes_011.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(List_lanes_013.left - List_lanes_01.left) <= 1).assertTrue();
      expect(Math.abs(Math.round((List_lanes_012.left - List_lanes_011.right) * 10) / 10 - Math.round(vp2px(75) * 10) / 10) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((List_lanes_014.left - List_lanes_013.right) * 10) / 10 - Math.round(vp2px(75) * 10) / 10) <= 1)
        .assertTrue();

      expect(Math.abs(Math.floor((List_lanes_011.right - List_lanes_011.left) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_012.right - List_lanes_012.left) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.right - List_lanes_013.left) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.right - List_lanes_014.left) - vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.floor((List_lanes_011.bottom - List_lanes_011.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_012.bottom - List_lanes_012.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_013.bottom - List_lanes_013.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_lanes_014.bottom - List_lanes_014.top) - vp2px(100))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(100, 120, 100, 0);
      await CommonFunc.sleep(1000);
      let List_lanes_024: RectValue = CommonFunc.getComponentRect('List_lanes_013');
      expect(Math.abs(Math.floor((List_lanes_024.top - List_lanes_01.top) - vp2px(120))) <= 1).assertTrue();
      console.info('testListLanesToRange02 END');
      done();
    });
  })
}