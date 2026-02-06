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
import nativeRender from 'libnativerender.so'

export default function waterFlowScrollOffsetTest() {

  describe('WaterFlowScrollOffsetTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowEmptyTest`)
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
    it('testScrollOffset020', Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      await Utils.pushPage(`waterflow/WaterFlowScrollOffsetTest`, () => setTimeout(() => {
      }, 1000));
      await Utils.sleep(2000)
      let dataArray: number[][] = nativeRender.waterFlowScrollOffsetData();
      await Utils.sleep(2000)
      let waterFlowOffsetInfo: number[] = dataArray[0];
      console.log('testScrollOffset020', JSON.stringify(dataArray))
      console.log('testScrollOffset020', JSON.stringify(waterFlowOffsetInfo))
      console.log('testScrollOffset020 waterFlowOffsetInfo[2]: '+ waterFlowOffsetInfo[2])
      console.log('testScrollOffset020 waterFlowOffsetInfo[4]: '+ waterFlowOffsetInfo[4])
      console.log('testScrollOffset020 waterFlowOffsetInfo[6]: '+ waterFlowOffsetInfo[6])
      console.log('testScrollOffset020 waterFlowOffsetInfo[11]: '+ waterFlowOffsetInfo[11])
      console.log('testScrollOffset020 waterFlowOffsetInfo[13]: '+ waterFlowOffsetInfo[13])
      console.log('testScrollOffset020 waterFlowOffsetInfo[15]: '+ waterFlowOffsetInfo[15])
      console.log('testScrollOffset020 waterFlowOffsetInfo[17]: '+ waterFlowOffsetInfo[17])
      console.log('testScrollOffset020 waterFlowOffsetInfo[18]: '+ waterFlowOffsetInfo[18])
      expect(waterFlowOffsetInfo[0] == 0 && waterFlowOffsetInfo[1] == 0).assertTrue()
      expect(waterFlowOffsetInfo[2] == 120 && waterFlowOffsetInfo[3] == 0).assertTrue()
      expect(waterFlowOffsetInfo[4] == 130 && waterFlowOffsetInfo[5] == 0).assertTrue()
      expect(waterFlowOffsetInfo[6] > 931 && waterFlowOffsetInfo[6] < 933 && waterFlowOffsetInfo[7] == 0).assertTrue()
      expect(waterFlowOffsetInfo[8] == 0 && waterFlowOffsetInfo[9] == 0).assertTrue()
      expect(waterFlowOffsetInfo[10] == 0 && waterFlowOffsetInfo[11] == 120).assertTrue()
      expect(waterFlowOffsetInfo[12] == 0 && waterFlowOffsetInfo[13] == 130).assertTrue()
      expect(waterFlowOffsetInfo[14] == 0 && waterFlowOffsetInfo[15] > 921 && waterFlowOffsetInfo[15] < 923).assertTrue()
      expect(waterFlowOffsetInfo[16] == 0 && waterFlowOffsetInfo[17] == 130).assertTrue()
      expect(waterFlowOffsetInfo[18] == 130 && waterFlowOffsetInfo[19] == 0).assertTrue()
      done();
    })

  })
}
