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

export default function listScrollByTest() {

  describe('ListScrollByTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_BY_0001
     * @tc.name       : testListScrollBy001
     * @tc.desc       : testing scroll by for list with {0 0} value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBy001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollBy001Test`);
      await Utils.clickComponent('btn1')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollByData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      let state3Data: number[] = dataArray[3];
      console.log('testListScrollBy001', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data.length-1 == 0).assertEqual(true)
      expect(state2Data.length-1 == 0).assertEqual(true)
      expect(state3Data.length-1 == 0).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_BY_0002
     * @tc.name       : testListScrollBy002
     * @tc.desc       : testing scroll by for list with {100 100} value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBy002', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollBy002Test`);
      await Utils.clickComponent('btn2')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollByData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      let state3Data: number[] = dataArray[3];
      console.log('testListScrollBy002', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data[state1Data.length-1] == 2).assertEqual(true)
      expect(state2Data[state2Data.length-1] == 5).assertEqual(true)
      expect(state3Data[state3Data.length-1] == 4).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_BY_0003
     * @tc.name       : testListScrollBy003
     * @tc.desc       : testing scroll by for list with {100000 100000} value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBy003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollBy003Test`);
      await Utils.clickComponent('btn3')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollByData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      let state3Data: number[] = dataArray[3];
      console.log('testListScrollBy003', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data[state1Data.length-1] == 36).assertEqual(true)
      expect(state2Data[state2Data.length-1] == 39).assertEqual(true)
      expect(state3Data[state3Data.length-1] == 37).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_BY_0004
     * @tc.name       : testListScrollBy004
     * @tc.desc       : testing scroll by for list with {-100 -100} value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollBy004', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollBy004Test`);
      await Utils.clickComponent('btn2')
      await Utils.clickComponent('btn2')
      await Utils.clickComponent('btn4')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollByData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      let state3Data: number[] = dataArray[3];
      console.log('testListScrollBy004', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data[state1Data.length-1] == 2).assertEqual(true)
      expect(state2Data[state2Data.length-1] == 5).assertEqual(true)
      expect(state3Data[state3Data.length-1] == 4).assertEqual(true)
      done()
    })
  })
}
