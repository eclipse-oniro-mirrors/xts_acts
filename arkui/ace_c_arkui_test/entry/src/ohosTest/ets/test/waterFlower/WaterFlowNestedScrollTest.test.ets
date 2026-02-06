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
  let centerX = Utils.getRectHorizontalCenterX(rect)
  let centerY = Utils.getRectVerticalCenterY(rect)
  let Y1 = centerY - distance;
  let Y2 = centerY + distance;
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

export default function waterFlowNestedScrollTest() {

  describe('WaterFlowNestedScrollTest', () => {

    /**
     * @tc.name   testWaterFlowNestedScroll001
     * @tc.number SUB_ARKUI_CAPI_WATER_FLOW_NESTED_SCROLL_0100
     * @tc.desc   testing nested scroll info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlowNestedScroll001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowNestedScroll1Test`, ()=>{
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
      let dataArray: number[][] = nativeRender.waterFlowGetNestedScrollData()
      let state1Data: number[] = dataArray[0];
      let state2Data: number[] = dataArray[1];
      console.log('testWaterFlowNestedScroll001', JSON.stringify(dataArray))
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
     * @tc.name   testWaterFlowNestedScroll002
     * @tc.number SUB_ARKUI_CAPI_WATER_FLOW_NESTED_SCROLL_0200
     * @tc.desc   testing nested scroll info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlowNestedScroll002', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowNestedScroll2Test`, ()=>{
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
      let dataArray: number[][] = nativeRender.waterFlowGetNestedScrollData()
      let state1Data: number[] = dataArray[0];
      let state2Data: number[] = dataArray[1];
      console.log('testWaterFlowNestedScroll002', JSON.stringify(dataArray))
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
     * @tc.name   testWaterFlowNestedScroll003
     * @tc.number SUB_ARKUI_CAPI_WATER_FLOW_NESTED_SCROLL_0300
     * @tc.desc   testing nested scroll info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlowNestedScroll003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowNestedScroll3Test`, ()=>{
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
      let dataArray: number[][] = nativeRender.waterFlowGetNestedScrollData()
      let state1Data: number[] = dataArray[0];
      let state2Data: number[] = dataArray[1];
      console.log('testWaterFlowNestedScroll003', JSON.stringify(dataArray))
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