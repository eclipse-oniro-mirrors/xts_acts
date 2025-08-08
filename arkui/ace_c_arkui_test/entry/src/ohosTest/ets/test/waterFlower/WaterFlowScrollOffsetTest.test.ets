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
      await Utils.pushPage(`waterflow/WaterFlowScrollOffsetTest`, () => setTimeout(() => {
      }, 1000));
      await Utils.sleep(5000)
      let dataArray: number[][] = nativeRender.waterFlowScrollOffsetData();
      let waterFlowOffsetInfo: number[] = dataArray[0];
      console.log('testScrollOffset020', JSON.stringify(dataArray))
      console.log('testScrollOffset020', JSON.stringify(waterFlowOffsetInfo))
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-15]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-15])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-14]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-14])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-12]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-12])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-10]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-10])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-9]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-9])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-8]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-8])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-7]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-7])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-6]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-6])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-5]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-5])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-4]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-4])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-3]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-3])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-2]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-2])
      console.log('testScrollOffset020 waterFlowOffsetInfo[waterFlowOffsetInfo.length-1]: '+ waterFlowOffsetInfo[waterFlowOffsetInfo.length-1])
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-15] == 0).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-14] > 931 && waterFlowOffsetInfo[waterFlowOffsetInfo.length-14] < 933).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-13] == 0 && waterFlowOffsetInfo[waterFlowOffsetInfo.length-12] == 0).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-11] == 0 && waterFlowOffsetInfo[waterFlowOffsetInfo.length-10] == 0).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-9] == 120).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-8] == 0).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-7] == 130).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-6] == 0).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-5] > 921 && waterFlowOffsetInfo[waterFlowOffsetInfo.length-5] < 923).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-4] == 0).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-3] == 130).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-2] == 130).assertTrue()
      expect(waterFlowOffsetInfo[waterFlowOffsetInfo.length-1] == 0).assertTrue()
      done();
    })

  })
}
