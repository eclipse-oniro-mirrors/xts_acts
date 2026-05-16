/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Component, Driver, On, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../common/Common';
import Utils from '../common/Utils';
const SLEEP_TIME_100 = 100;
const SLEEP_TIME_500 = 500;
const SLEEP_TIME_1000 = 1000
export default function GridDragTest() {

  console.info('push page export');
  describe('GridDragTest', () => {
    console.info('push page trying');
    afterEach(async (done: Function) => {
      await Utils.sleep(SLEEP_TIME_100)
      done()
    })

    /**
     * @tc.number   GridDragTest001
     * @tc.name     GridDragTest001
     * @tc.desc     GridItem drag Start, Move, Leave, Drop callback
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('GridDragTest001', Level.LEVEL1, async (done: Function) => {
      console.info('GridDragTest001 START');
      let PAGE_TAG = 'GridDragTest';
      await Utils.pushPage(`grid/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME_1000)
      let driver = Driver.create();
      let grid = await driver.findComponent(ON.id('DraggableGrid'));
      let gridItem = await driver.findComponent(ON.id('DraggableItem'));
      let rectGrid = await grid.getBounds();
      let gridLeft = rectGrid.left
      let rectItem = await gridItem.getBounds();
      let top = rectItem.top;
      let left = rectItem.left;
      let right = rectItem.right;
      let bottom = rectItem.bottom;
      let height = bottom - top;
      let width = right - left;
      let startX = Math.round(left + width / 2);
      let startY = Math.round(top + height / 2);
      let outX = Math.round(gridLeft - width/10);
      let outY = startY;
      driver.mouseDrag({x:startX,y:startY},{x:outX,y:outY}, 200)
      await Utils.sleep(4000);
      let DragStart = await driver.findComponent(ON.id("DragStart"));
      let DragMove = await driver.findComponent(ON.id("DragMove"));
      let DragLeave = await driver.findComponent(ON.id("DragLeave"));
      let Drop = await driver.findComponent(ON.id("Drop"));
      let DragStartTest = await DragStart.getText()
      let DragMoveTest = await DragMove.getText()
      let DragLeaveTest = await DragLeave.getText()
      let DropTest = await Drop.getText()

      expect(DragStartTest).assertEqual('1');
      expect(Number(DragMoveTest)).assertLarger(0);
      expect(DragLeaveTest).assertEqual('1');
      expect(DropTest).assertEqual('1');
      done();
    })

    /**
     * @tc.number   GridDragTest002
     * @tc.name     GridDragTest002
     * @tc.desc     GridItem drag Select
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('GridDragTest002', Level.LEVEL1, async (done: Function) => {
      console.info('GridDragTest002 START');
      let PAGE_TAG = 'GridDragTest';
      await Utils.pushPage(`grid/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME_1000)
      let driver = Driver.create();
      let gridItem_2 = await driver.findComponent(ON.id('DraggableItem_2'));
      let bottom_2 = (await gridItem_2.getBounds()).bottom+1;
      let right_2 = (await gridItem_2.getBounds()).right+1;
      let top_2 = (await gridItem_2.getBounds()).top;
      let left_2 = (await gridItem_2.getBounds()).left;
      driver.mouseDrag({x:right_2,y:bottom_2},{x:left_2,y:top_2},200)
      await Utils.sleep(4000);
      let Select = await driver.findComponent(ON.id("Select"));
      let SelectTest = await Select.getText()
      expect(SelectTest).assertEqual('1');
      done();
    })
  })
}
