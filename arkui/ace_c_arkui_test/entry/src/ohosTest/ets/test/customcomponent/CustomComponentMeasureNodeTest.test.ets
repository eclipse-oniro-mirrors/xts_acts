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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeRender from 'libnativerender.so'

export default function customComponentMeasureNodeTest() {

  describe('CustomComponentMeasureNodeTest', () => {

    let PAGE_TAG = 'CustomComponentMeasureNodeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MEASURE_NODE_001
    * @tc.name       : testCustomComponentMeasureNode001
    * @tc.desc       : test custom event callback
    * @tc.size       : MediumTest
    
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentMeasureNode001', Level.LEVEL1, async (done: Function) => {
      let dataArray: number[][] = nativeRender.getMeasureNodeData();
      let measureNodeData: number[] = dataArray[0];
      console.log('testCustomComponentMeasureNode001', JSON.stringify(dataArray))
      expect(measureNodeData[0] == 40 && measureNodeData[1] == 140).assertEqual(true)
      expect(measureNodeData[2] == 110 && measureNodeData[3] == 30).assertEqual(true)
      expect(measureNodeData[4] == 110 && measureNodeData[5] == 140).assertEqual(true)
      done()
    })
  })
}
