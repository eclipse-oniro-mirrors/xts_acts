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

import { expect, describe, it, afterEach } from '@ohos/hypium'
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
  let dragStartPoint1: Point = { x: (rect.left + rect.right) / 2, y: (rect.top + rect.bottom) / 2 };
  for (let i = 0; i < 990; i++) {
    point.setPoint(0, i, dragStartPoint1);
  }
  point.setPoint(0, 990, { x: (rect.left + rect.right) / 2, y: (rect.top + rect.bottom) / 2 + 20});
  point.setPoint(0, 991, { x: (rect.left + rect.right) / 2, y: (rect.top + rect.bottom) / 2 + 40});
  point.setPoint(0, 992, { x: (rect.left + rect.right) / 2, y: (rect.top + rect.bottom) / 2 + 60});
  point.setPoint(0, 993, { x: (rect.left + rect.right) / 2, y: (rect.top + rect.bottom) / 2 + 80});
  point.setPoint(0, 994, { x: (rect.left + rect.right) / 2, y: (rect.top + rect.bottom) / 2 + 100});
  point.setPoint(0, 995, { x: (rect.left + rect.right) / 2, y: (rect.top + rect.bottom) / 2 + 120});
  point.setPoint(0, 996, { x: (rect.left + rect.right) / 2, y: (rect.top + rect.bottom) / 2 + 140});
  point.setPoint(0, 997, { x: (rect.left + rect.right) / 2, y: (rect.top + rect.bottom) / 2 + 160});
  point.setPoint(0, 998, { x: (rect.left + rect.right) / 2, y: (rect.top + rect.bottom) / 2 + 200});
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
     * @tc.level      : Level 1
     */
    it('UDMFCaseTest001', 0, async (done: Function) => {
        let PAGE_TAG = 'DragCaseTest1';
        await Utils.pushPage(`drag/${PAGE_TAG}`);
        await panAndPinchGesture('image');
        let dataArray: number[] = nativeRender.GetResult();
        console.log('UDMFCaseTest001', dataArray[0]);
        expect( dataArray[0] == 0 ).assertEqual(true);
        done();
    })

    /*
     * @tc.number     : SUB_UDMFndk_CASE_002
     * @tc.name       : 002
     * @tc.desc       : testing List contentStartOffset And contentAndOffset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('UDMFCaseTest002', 0, async (done: Function) => {
        let PAGE_TAG = 'DragCaseTest2';
        await Utils.pushPage(`drag/${PAGE_TAG}`);
        await panAndPinchGesture('image');
        let dataArray: number[] = nativeRender.GetResult();
        console.log('UDMFCaseTest002', dataArray[0]);
        expect( dataArray[0] == 0 ).assertEqual(true);
        done();
    })

    /*
     * @tc.number     : SUB_UDMFndk_CASE_003
     * @tc.name       : UDMFCaseTest003
     * @tc.desc       : testing List maintainVisibleContentPosition
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('UDMFCaseTest003', 0, async (done: Function) => {
        let PAGE_TAG = 'DragCaseTest3';
        await panAndPinchGesture('image');
        let dataArray: number[] = nativeRender.GetResult();
        console.log('UDMFCaseTest003', dataArray[0]);
        expect( dataArray[0] == 0 ).assertEqual(true);
        done();
    })
  })
}