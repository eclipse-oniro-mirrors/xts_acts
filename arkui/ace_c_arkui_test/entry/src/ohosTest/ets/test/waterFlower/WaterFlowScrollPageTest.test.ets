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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'
import nativeRender from 'libnativerender.so'

export default function waterFlowScrollPageTest() {

  describe('WaterFlowScrollPageTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_PAGE_0100
     * @tc.name       : testWaterFlowScrollPage001
     * @tc.desc       : testing scroll edge for list with {0 0} value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollPage001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowScrollPageTest`);
      await Utils.clickComponent('btn2')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.waterFlowGetScrollPageData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testWaterFlowScrollPage001', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data[state1Data.length-1] == 8).assertEqual(true)
      expect(state2Data[state2Data.length-1] == 15).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_PAGE_0200
     * @tc.name       : testWaterFlowScrollPage002
     * @tc.desc       : testing scroll edge for list with {1 1} value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollPage002', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowScrollPageTest`);
      await Utils.clickComponent('btn1')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.waterFlowGetScrollPageData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testWaterFlowScrollPage002', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data[state1Data.length-1] == 0).assertEqual(true)
      expect(state2Data[state2Data.length-1] == 7).assertEqual(true)
      done()
    })
  })
}