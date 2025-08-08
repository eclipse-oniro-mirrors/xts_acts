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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeRender from 'libnativerender.so'

export default function waterFlowScrollOffsetTest() {

  describe('WaterFlowScrollOffsetTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_SCROLL_OFFSET_2000
    * @tc.name       : testWaterFlowScrollOffset020
    * @tc.desc       : scroll offset
    * @tc.size       : MediumTest
    * @tc.type       : Render
    * @tc.level      : Level 1
    */
    it('testScrollOffset020', 0, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowScrollOffsetTest`, () => setTimeout(() => {
      }, 1000));
      await Utils.sleep(5000)
      let dataArray: number[][] = nativeRender.waterFlowScrollOffsetData();
      let waterFlowOffsetInfo: number[] = dataArray[0];
      expect(waterFlowOffsetInfo[0] == 0 && waterFlowOffsetInfo[1] == 0).assertEqual(true)
      expect(waterFlowOffsetInfo[2] == 150 && waterFlowOffsetInfo[3] == 0).assertEqual(true)
      expect(waterFlowOffsetInfo[4] == 130 && waterFlowOffsetInfo[5] == 0).assertEqual(true)
      expect(waterFlowOffsetInfo[6] > 1381 && waterFlowOffsetInfo[6] < 1382 && waterFlowOffsetInfo[7] == 0).assertEqual(true)
      expect(waterFlowOffsetInfo[8] == 0 && waterFlowOffsetInfo[9] == 0).assertEqual(true)
      expect(waterFlowOffsetInfo[10] == 0 && waterFlowOffsetInfo[11] == 150).assertEqual(true)
      expect(waterFlowOffsetInfo[12] == 0 && waterFlowOffsetInfo[13] == 130).assertEqual(true)
      expect(waterFlowOffsetInfo[14] == 0 && waterFlowOffsetInfo[15] > 1291 && waterFlowOffsetInfo[15] < 1292).assertEqual(true)
      expect(waterFlowOffsetInfo[16] == 0 && waterFlowOffsetInfo[17] == 130).assertEqual(true)
      expect(waterFlowOffsetInfo[18] == 130 && waterFlowOffsetInfo[19] == 0).assertEqual(true)
      done();
    })

  })
}
