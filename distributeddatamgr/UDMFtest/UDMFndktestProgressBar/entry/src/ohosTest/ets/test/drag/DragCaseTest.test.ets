/*
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

import { expect, describe, it, afterEach, TestType, Size, Level } from '@ohos/hypium'
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest'
import { Point } from '@ohos.UiTest';
import Utils from '../common/Utils'
import nativeRender from 'libnativerender.so'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel'
 
let TAG = '[ttt]'

async function panAndPinchGesture(id: string) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  let point: PointerMatrix = PointerMatrix.create(1, 999);
  let point_x = Math.ceil((rect.left + rect.right) / 2);
  let point_y = Math.ceil((rect.top + rect.bottom) / 2 )
  let dragStartPoint1: Point = { x: point_x, y: point_y};
  console.log(TAG, 'dragStartPoint1=' + JSON.stringify(dragStartPoint1));
  for (let i = 0; i < 990; i++) {
    point.setPoint(0, i, dragStartPoint1);
  }
 
  point.setPoint(0, 990, { x: point_x, y: point_y + 20});
  point.setPoint(0, 991, { x: point_x, y: point_y + 40});
  point.setPoint(0, 992, { x: point_x, y: point_y + 60});
  point.setPoint(0, 993, { x: point_x, y: point_y + 80});
  point.setPoint(0, 994, { x: point_x, y: point_y + 100});
  point.setPoint(0, 995, { x: point_x, y: point_y + 120});
  point.setPoint(0, 996, { x: point_x, y: point_y + 140});
  point.setPoint(0, 997, { x: point_x, y: point_y + 160});
  point.setPoint(0, 998, { x: point_x, y: point_y + 200});
  await driver.injectMultiPointerAction(point);
}

export default function DragTest(){

  describe('DragTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })
    /*
     * @tc.number     : SUB_UDMFndk_CASE_001
     * @tc.name       : UDMFCaseTest001
     * @tc.desc       : testing List lanes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('UDMFCaseTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let PAGE_TAG:string = 'DragCaseTest1';
      await Utils.pushPage(`drag/${PAGE_TAG}`);
      await panAndPinchGesture('image');
      await Utils.sleep(100);
      let button = await driver.findComponent(ON.text('取消'));
      await button?.click();
      await Utils.sleep(100);
      let dataArray: number[] = nativeRender.GetResult();
      console.log('UDMFCaseTest001', dataArray[0]);
      expect( dataArray[0] == 0 ).assertEqual(true);
      done();
    })

    /*
     * @tc.number     : SUB_UDMFndk_CASE_002
     * @tc.name       : UDMFCaseTest002
     * @tc.desc       : testing List contentStartOffset And contentAndOffset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('UDMFCaseTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      let PAGE_TAG:string = 'DragCaseTest2';
      await Utils.pushPage(`drag/${PAGE_TAG}`);
      await panAndPinchGesture('image');
      await Utils.sleep(100);
      let button = await driver.findComponent(ON.text('取消'));
      await button?.click();
      await Utils.sleep(100);
      let dataArray: number[] = nativeRender.GetResult();
      console.log('UDMFCaseTest002', dataArray[0]);
      expect( dataArray[0] == 0 ).assertEqual(true);
      done();
    })

    /**
     * @tc.number     : SUB_UDMFndk_CASE_003
     * @tc.name       : UDMFCaseTest003
     * @tc.desc       : testing List maintainVisibleContentPosition
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('UDMFCaseTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      let PAGE_TAG:string = 'DragCaseTest3';
      await panAndPinchGesture('image');
      await Utils.sleep(100);
      let button = await driver.findComponent(ON.text('取消'));
      await button?.click();
      await Utils.sleep(100);
      let dataArray: number[] = nativeRender.GetResult();
      console.log('UDMFCaseTest003', dataArray[0]);
      expect( dataArray[0] == 0 ).assertEqual(true);
      done();
    })

    /**
     * @tc.number     : SUB_UDMFndk_CASE_004
     * @tc.name       : SUB_UDMFndk_CASE_004
     * @tc.desc       : testing List maintainVisibleContentPosition
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_UDMFndk_CASE_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      let PAGE_TAG:string = 'ContentCardTest1';
      await Utils.pushPage(`drag/${PAGE_TAG}`);
      let button = await driver.findComponent(ON.id('card'));
      await Utils.sleep(100);
      await button?.click();
      await Utils.sleep(10000);
      let smallCard = await driver.findComponent(ON.id('smallCard'));
      let strJson = getInspectorByKey('smallCard');
      let obj: ESObject = JSON.parse(strJson);
      expect( JSON.stringify(obj) != '').assertEqual(true);
      done();
    })
    /**
     * @tc.number     : SUB_UDMFndk_CASE_005
     * @tc.name       : SUB_UDMFndk_CASE_005
     * @tc.desc       : testing List maintainVisibleContentPosition
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_UDMFndk_CASE_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      let PAGE_TAG:string = 'ContentCardTest2';
      await Utils.pushPage(`drag/${PAGE_TAG}`);
      let button = await driver.findComponent(ON.id('card'));
      await Utils.sleep(100);
      await button?.click();
      await Utils.sleep(10000);
      let midCard = await driver.findComponent(ON.id('midCard'));
      let strJson = getInspectorByKey('midCard');
      let obj: ESObject = JSON.parse(strJson);
      expect( JSON.stringify(obj) != '').assertEqual(true);
      done();
    })
    /**
     * @tc.number     : SUB_UDMFndk_CASE_006
     * @tc.name       : SUB_UDMFndk_CASE_006
     * @tc.desc       : testing List maintainVisibleContentPosition
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_UDMFndk_CASE_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      let PAGE_TAG:string = 'ContentCardTest3';
      await Utils.pushPage(`drag/${PAGE_TAG}`);
      let button = await driver.findComponent(ON.id('card'));
      await Utils.sleep(100);
      await button?.click();
      await Utils.sleep(10000);
      let bigCard = await driver.findComponent(ON.id('bigCard'));
      let strJson = getInspectorByKey('bigCard');
      let obj: ESObject = JSON.parse(strJson);
      expect( JSON.stringify(obj) != '').assertEqual(true);
      done();
    })

    /*
     * @tc.number     : SUB_UDMFndk_CASE_007
     * @tc.name       : SUB_UDMFndk_CASE_007
     * @tc.desc       : testing List contentStartOffset And contentAndOffset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_UDMFndk_CASE_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      let PAGE_TAG:string = 'DragCaseTest4';
      await Utils.pushPage(`drag/${PAGE_TAG}`);
      await panAndPinchGesture('image');
      await Utils.sleep(100);
      let button = await driver.findComponent(ON.text('取消'));
      await button?.click();
      await Utils.sleep(100);
      let dataArray: number[] = nativeRender.GetResult();
      console.log('UDMFCaseTest004', dataArray[0]);
      expect( dataArray[0] == 0 ).assertEqual(true);
      done();
    })
  })
}