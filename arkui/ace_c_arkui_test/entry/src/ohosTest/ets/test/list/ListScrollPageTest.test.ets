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

export default function listScrollPageTest() {

  describe('ListScrollPageTest', () => {

    /**
     * @tc.name   testListScrollPage001
     * @tc.number SUB_ARKUI_CAPI_LIST_SCROLL_PAGE_0001
     * @tc.desc   testing scroll edge for list with {0 0} value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListScrollPage001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollPageTest`);
      await Utils.clickComponent('btn2')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollPageData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      let state3Data: number[] = dataArray[3];
      console.log('testListScrollOffset001', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data[state1Data.length-1] == 4).assertEqual(true)
      expect(state2Data[state2Data.length-1] == 7).assertEqual(true)
      expect(state3Data[state3Data.length-1] == 6).assertEqual(true)
      done()
    })
    /**
     * @tc.name   testListScrollPage002
     * @tc.number SUB_ARKUI_CAPI_LIST_SCROLL_PAGE_0002
     * @tc.desc   testing scroll edge for list with {1 1} value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListScrollPage002', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollPageTest`);
      await Utils.clickComponent('btn1')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollPageData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      let state3Data: number[] = dataArray[3];
      console.log('testListScrollOffset002', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data[state1Data.length-1] == 0).assertEqual(true)
      expect(state2Data[state2Data.length-1] == 3).assertEqual(true)
      expect(state3Data[state3Data.length-1] == 2).assertEqual(true)
      done()
    })
  })
}
