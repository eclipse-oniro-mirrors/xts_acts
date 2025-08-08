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

import { afterEach,beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'
import { Driver } from '@kit.TestKit';
import nativeRender from 'libnativerender.so'

export default function listScrollOffsetTest() {

  describe('ListScrollOffsetTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0001
     * @tc.name       : testListScrollOffset001
     * @tc.desc       : testing scroll offset for list with -20,-20
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset001Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset001', JSON.stringify(dataArray))
      expect(retData[0] == 0).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 0).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0002
     * @tc.name       : testListScrollOffset002
     * @tc.desc       : testing scroll offset for list with 0,0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset002', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset002Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset002', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 0).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0003
     * @tc.name       : testListScrollOffset003
     * @tc.desc       : testing scroll offset for list with 100,100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset003', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset003Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset003', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 100).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0004
     * @tc.name       : testListScrollOffset004
     * @tc.desc       : testing scroll offset for list with 100000,100000
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset004', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset004Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset004', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 2190).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0005
     * @tc.name       : testListScrollOffset005
     * @tc.desc       : testing scroll offset for list with 0,200,-1000,ARKUI_CURVE_LINEAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset005', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset005Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset005', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0006
     * @tc.name       : testListScrollOffset006
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_LINEAR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset006', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset006Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset006', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0007
     * @tc.name       : testListScrollOffset007
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_EASE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset007', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset007Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset007', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0008
     * @tc.name       : testListScrollOffset008
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_EASE_IN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset008', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset008Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset008', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0009
     * @tc.name       : testListScrollOffset009
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_EASE_OUT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset009', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset009Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset009', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0010
     * @tc.name       : testListScrollOffset010
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_EASE_IN_OUT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset010', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset010Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset010', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0011
     * @tc.name       : testListScrollOffset011
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_FAST_OUT_SLOW_IN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset011', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset011Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset011', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0012
     * @tc.name       : testListScrollOffset012
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_LINEAR_OUT_SLOW_IN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset012', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset012Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset012', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0013
     * @tc.name       : testListScrollOffset013
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_FAST_OUT_LINEAR_IN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset013', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset013Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset013', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0014
     * @tc.name       : testListScrollOffset014
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_EXTREME_DECELERATION
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset014', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset014Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset014', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0015
     * @tc.name       : testListScrollOffset015
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_SHARP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset015', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset015Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset015', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0016
     * @tc.name       : testListScrollOffset016
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_RHYTHM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset016', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset016Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset016', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0017
     * @tc.name       : testListScrollOffset017
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_SMOOTH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset017', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset017Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset017', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0018
     * @tc.name       : testListScrollOffset018
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_FRICTION
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset018', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset018Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset018', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0019
     * @tc.name       : testListScrollOffset019
     * @tc.desc       : testing scroll offset for list with 0,200,2000,-1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset019', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset019Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset019', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0020
     * @tc.name       : testListScrollOffset020
     * @tc.desc       : testing scroll offset for list with 0,200,2000,13
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset020', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset020Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset020', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0021
     * @tc.name       : testListScrollOffset021
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_LINEAR,1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset021', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset021Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset021', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_OFFSET_0022
     * @tc.name       : testListScrollOffset022
     * @tc.desc       : testing scroll offset for list with 0,200,2000,ARKUI_CURVE_LINEAR,1,1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListScrollOffset022', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListScrollOffset022Test`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetScrollOffsetData()
      let retData: number[] = dataArray[0];
      let state1Data: number[] = dataArray[1];
      let state2Data: number[] = dataArray[2];
      console.log('testListScrollOffset022', JSON.stringify(dataArray))
      expect(retData[0] == 0 ).assertEqual(true)
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state2Data[0] == 200).assertEqual(true)
      done()
    })
  })
}
