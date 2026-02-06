/*
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

import { describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver } from '@kit.TestKit';
import nativeRender from 'libnativerender.so'

async function flingComponentV(key: string, isForward: boolean, speed: number = 500, distance: number = 40) {
  let driver = Driver.create();
  let rect = Utils.getComponentRect(key);
  let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
  let centerY = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
  let Y1 = Math.round(centerY - vp2px(distance));
  let Y2 = Math.round(centerY + vp2px(distance));
  let stepLen = 20;
  if (isForward) {
    await driver.fling({
      x: centerX, y: Y2
    }, {
      x: centerX, y: Y1
    }, stepLen, speed);
  } else {
    await driver.fling({
      x: centerX, y: Y1
    }, {
      x: centerX, y: Y2
    }, stepLen, speed);
  }
}

export default function listNestedScrollEventTest() {

  describe('ListNestedScrollEventTest', () => {

    /**
     * @tc.name   testListNestedScrollEvent001
     * @tc.number SUB_ARKUI_CAPI_LIST_NESTED_SCROLL_EVENT_0001
     * @tc.desc   testing list nested scroll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedScrollEvent001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListNestedScroll001Test`, ()=>{
        setTimeout(()=>{}, 7000);
      });
      await flingComponentV("scroll1", false, 40000)
      await flingComponentV("scroll2", false, 40000)
      await flingComponentV("scroll3", false, 40000)
      await flingComponentV("scroll4", false, 40000)
      await flingComponentV("scroll5", false, 40000)
      await flingComponentV("scroll6", false, 40000)
      await flingComponentV("scroll7", true, 40000)
      await flingComponentV("scroll8", true, 40000)
      await flingComponentV("scroll9", true, 40000)
      await flingComponentV("scroll10", true, 40000)
      await flingComponentV("scroll11", true, 40000)
      await flingComponentV("scroll12", true, 40000)
      let dataArray: number[][] = nativeRender.listGetNestedScrollRetData()
      let state1Data: number[] = dataArray[0];
      let state2Data: number[] = dataArray[1];
      console.log('testListNestedScrollEvent001', JSON.stringify(dataArray))
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state1Data[1] == 1).assertEqual(true)
      expect(state1Data[2] == 1).assertEqual(true)
      expect(state1Data[3] == 1).assertEqual(true)
      expect(state1Data[4] == 1).assertEqual(true)
      expect(state1Data[5] == 0).assertEqual(true)
      expect(state1Data[6] == 0).assertEqual(true)
      expect(state1Data[7] == 0).assertEqual(true)
      expect(state1Data[8] == 1).assertEqual(true)
      expect(state1Data[9] == 2).assertEqual(true)
      expect(state1Data[10] == 3).assertEqual(true)
      expect(state1Data[11] == 0).assertEqual(true)
      expect(state2Data[0] == 0).assertEqual(true)
      expect(state2Data[1] == 0).assertEqual(true)
      expect(state2Data[2] == 1).assertEqual(true)
      expect(state2Data[3] == 2).assertEqual(true)
      expect(state2Data[4] == 3).assertEqual(true)
      expect(state2Data[5] == 0).assertEqual(true)
      expect(state2Data[6] == 0).assertEqual(true)
      expect(state2Data[7] == 1).assertEqual(true)
      expect(state2Data[8] == 1).assertEqual(true)
      expect(state2Data[9] == 1).assertEqual(true)
      expect(state2Data[10] == 1).assertEqual(true)
      expect(state2Data[11] == 0).assertEqual(true)
      done()
    })
    /**
     * @tc.name   testListNestedScrollEvent002
     * @tc.number SUB_ARKUI_CAPI_LIST_NESTED_SCROLL_EVENT_0002
     * @tc.desc   testing list nested scroll small
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedScrollEvent002', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListNestedScroll002Test`, ()=>{
        setTimeout(()=>{}, 7000);
      });
      await flingComponentV("scroll1", false, 40000)
      await flingComponentV("scroll2", false, 40000)
      await flingComponentV("scroll3", false, 40000)
      await flingComponentV("scroll4", false, 40000)
      await flingComponentV("scroll5", false, 40000)
      await flingComponentV("scroll6", false, 40000)
      await flingComponentV("scroll7", true, 40000)
      await flingComponentV("scroll8", true, 40000)
      await flingComponentV("scroll9", true, 40000)
      await flingComponentV("scroll10", true, 40000)
      await flingComponentV("scroll11", true, 40000)
      await flingComponentV("scroll12", true, 40000)
      let dataArray: number[][] = nativeRender.listGetNestedScrollRetData()
      let state1Data: number[] = dataArray[0];
      let state2Data: number[] = dataArray[1];
      console.log('testListNestedScrollEvent002', JSON.stringify(dataArray))
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state1Data[1] == 1).assertEqual(true)
      expect(state1Data[2] == 1).assertEqual(true)
      expect(state1Data[3] == 1).assertEqual(true)
      expect(state1Data[4] == 1).assertEqual(true)
      expect(state1Data[5] == 0).assertEqual(true)
      expect(state1Data[6] == 0).assertEqual(true)
      expect(state1Data[7] == 0).assertEqual(true)
      expect(state1Data[8] == 1).assertEqual(true)
      expect(state1Data[9] == 2).assertEqual(true)
      expect(state1Data[10] == 3).assertEqual(true)
      expect(state1Data[11] == 0).assertEqual(true)
      expect(state2Data[0] == 0).assertEqual(true)
      expect(state2Data[1] == 0).assertEqual(true)
      expect(state2Data[2] == 1).assertEqual(true)
      expect(state2Data[3] == 2).assertEqual(true)
      expect(state2Data[4] == 3).assertEqual(true)
      expect(state2Data[5] == 0).assertEqual(true)
      expect(state2Data[6] == 0).assertEqual(true)
      expect(state2Data[7] == 1).assertEqual(true)
      expect(state2Data[8] == 1).assertEqual(true)
      expect(state2Data[9] == 1).assertEqual(true)
      expect(state2Data[10] == 1).assertEqual(true)
      expect(state2Data[11] == 0).assertEqual(true)
      done()
    })
    /**
     * @tc.name   testListNestedScrollEvent003
     * @tc.number SUB_ARKUI_CAPI_LIST_NESTED_SCROLL_EVENT_0003
     * @tc.desc   testing list nested scroll resetAttribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedScrollEvent003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListNestedScroll003Test`, ()=>{
        setTimeout(()=>{}, 7000);
      });
      await flingComponentV("scroll1", false, 40000)
      await flingComponentV("scroll2", false, 40000)
      await flingComponentV("scroll3", false, 40000)
      await flingComponentV("scroll4", false, 40000)
      await flingComponentV("scroll5", false, 40000)
      await flingComponentV("scroll6", false, 40000)
      await flingComponentV("scroll7", true, 40000)
      await flingComponentV("scroll8", true, 40000)
      await flingComponentV("scroll9", true, 40000)
      await flingComponentV("scroll10", true, 40000)
      await flingComponentV("scroll11", true, 40000)
      await flingComponentV("scroll12", true, 40000)
      let dataArray: number[][] = nativeRender.listGetNestedScrollRetData()
      let state1Data: number[] = dataArray[0];
      let state2Data: number[] = dataArray[1];
      console.log('testListNestedScrollEvent003', JSON.stringify(dataArray))
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state1Data[1] == 0).assertEqual(true)
      expect(state1Data[2] == 0).assertEqual(true)
      expect(state1Data[3] == 0).assertEqual(true)
      expect(state1Data[4] == 0).assertEqual(true)
      expect(state1Data[5] == 0).assertEqual(true)
      expect(state1Data[6] == 0).assertEqual(true)
      expect(state1Data[7] == 0).assertEqual(true)
      expect(state1Data[8] == 0).assertEqual(true)
      expect(state1Data[9] == 0).assertEqual(true)
      expect(state1Data[10] == 0).assertEqual(true)
      expect(state1Data[11] == 0).assertEqual(true)
      expect(state2Data[0] == 0).assertEqual(true)
      expect(state2Data[1] == 0).assertEqual(true)
      expect(state2Data[2] == 0).assertEqual(true)
      expect(state2Data[3] == 0).assertEqual(true)
      expect(state2Data[4] == 0).assertEqual(true)
      expect(state2Data[5] == 0).assertEqual(true)
      expect(state2Data[6] == 0).assertEqual(true)
      expect(state2Data[7] == 0).assertEqual(true)
      expect(state2Data[8] == 0).assertEqual(true)
      expect(state2Data[9] == 0).assertEqual(true)
      expect(state2Data[10] == 0).assertEqual(true)
      expect(state2Data[11] == 0).assertEqual(true)
      done()
    })
  })
}