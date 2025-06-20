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
import nativeRender from 'libnativerender.so'

export default function waterFlowScrollByTest() {

  describe('WaterFlowScrollByTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_BY_0100
     * @tc.name       : testWaterFlowScrollBy001
     * @tc.desc       : testing scroll by for waterFlow with {0 0} value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollBy001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowScrollBy001Test`);
      await Utils.clickComponent('btn1')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.waterFlowGetScrollByData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testWaterFlowScrollBy001', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data.length-1 == 0).assertEqual(true)
      expect(state2Data.length-1 == 0).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_BY_0200
     * @tc.name       : testWaterFlowScrollBy002
     * @tc.desc       : testing scroll by for waterFlow with {100 100} value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollBy002', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowScrollBy002Test`);
      await Utils.clickComponent('btn2')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.waterFlowGetScrollByData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testWaterFlowScrollBy002', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data[state1Data.length-1] == 4).assertEqual(true)
      expect(state2Data[state2Data.length-1] == 11).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_BY_0300
     * @tc.name       : testWaterFlowScrollBy003
     * @tc.desc       : testing scroll by for waterFlow with {100000 100000} value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollBy003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowScrollBy003Test`);
      await Utils.clickComponent('btn3')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.waterFlowGetScrollByData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testWaterFlowScrollBy003', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data[state1Data.length-1] == 32).assertEqual(true)
      expect(state2Data[state2Data.length-1] == 39).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_BY_0400
     * @tc.name       : testWaterFlowScrollBy004
     * @tc.desc       : testing scroll by for waterFlow with {-100 -100} value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollBy004', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowScrollBy004Test`);
      await Utils.clickComponent('btn2')
      await Utils.clickComponent('btn2')
      await Utils.clickComponent('btn4')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.waterFlowGetScrollByData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testWaterFlowScrollBy004', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data[state1Data.length-1] == 4).assertEqual(true)
      expect(state2Data[state2Data.length-1] == 11).assertEqual(true)
      done()
    })
  })
}