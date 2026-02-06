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

import { afterEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { WaterFlowScrollToIndexData } from '../../MainAbility/pages/waterflow/WaterFlowScrollToIndexTest'
import nativeRender from 'libnativerender.so'

export default function waterFlowScrollToIndex() {

  describe('WaterFlowScrollToIndex', () => {

    afterEach(async () => {
      await Utils.pushPage(`waterflow/WaterFlowEmptyTest`)
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_SCROLL_TO_INDEX_0100
    * @tc.name       : testWaterFlowScrollToIndex001
    * @tc.desc       : test scrollToIndex normal index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowScrollToIndex001', Level.LEVEL1, async (done: Function) => {
      let option: WaterFlowScrollToIndexData =
        new WaterFlowScrollToIndexData('WaterFlowScrollToIndexTest001', 30, ScrollAlign.START)
      await Utils.pushPageByParams(`waterflow/WaterFlowScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.getOnScrollIndexData()
      console.log('testWaterFlowScrollToIndex001', JSON.stringify(dataArray))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(30)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(35)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_SCROLL_TO_INDEX_0200
    * @tc.name       : testWaterFlowScrollToIndex002
    * @tc.desc       : test scrollToIndex downOverflow index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowScrollToIndex002', Level.LEVEL1, async (done: Function) => {
      let option: WaterFlowScrollToIndexData =
        new WaterFlowScrollToIndexData('WaterFlowScrollToIndexTest002', -100, ScrollAlign.START)
      await Utils.pushPageByParams(`waterflow/WaterFlowScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.getOnScrollIndexData()
      console.log('testWaterFlowScrollToIndex002', JSON.stringify(dataArray))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(0)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(5)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_SCROLL_TO_INDEX_0300
    * @tc.name       : testWaterFlowScrollToIndex003
    * @tc.desc       : test scrollToIndex upOverflow index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowScrollToIndex003', Level.LEVEL1, async (done: Function) => {
      let option: WaterFlowScrollToIndexData =
        new WaterFlowScrollToIndexData('WaterFlowScrollToIndexTest003', 100, ScrollAlign.START)
      await Utils.pushPageByParams(`waterflow/WaterFlowScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.getOnScrollIndexData()
      console.log('testWaterFlowScrollToIndex003', JSON.stringify(dataArray))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(0)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(5)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_SCROLL_TO_INDEX_0400
    * @tc.name       : testWaterFlowScrollToIndex004
    * @tc.desc       : test scrollToIndex normal index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowScrollToIndex004', Level.LEVEL1, async (done: Function) => {
      let option: WaterFlowScrollToIndexData =
        new WaterFlowScrollToIndexData('WaterFlowScrollToIndexTest004', 40, ScrollAlign.CENTER)
      await Utils.pushPageByParams(`waterflow/WaterFlowScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.getOnScrollIndexData()
      console.log('testWaterFlowScrollToIndex004', JSON.stringify(dataArray))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(38)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(43)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_SCROLL_TO_INDEX_0500
    * @tc.name       : testWaterFlowScrollToIndex005
    * @tc.desc       : test scrollToIndex normal index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowScrollToIndex005', Level.LEVEL1, async (done: Function) => {
      let option: WaterFlowScrollToIndexData =
        new WaterFlowScrollToIndexData('WaterFlowScrollToIndexTest005', 20, ScrollAlign.END)
      await Utils.pushPageByParams(`waterflow/WaterFlowScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.getOnScrollIndexData()
      console.log('testWaterFlowScrollToIndex005', JSON.stringify(dataArray))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(16)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(21)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_SCROLL_TO_INDEX_0600
    * @tc.name       : testWaterFlowScrollToIndex006
    * @tc.desc       : test scrollToIndex normal index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowScrollToIndex006', Level.LEVEL1, async (done: Function) => {
      let option: WaterFlowScrollToIndexData =
        new WaterFlowScrollToIndexData('WaterFlowScrollToIndexTest006', 40, ScrollAlign.AUTO)
      await Utils.pushPageByParams(`waterflow/WaterFlowScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.getOnScrollIndexData()
      console.log('testWaterFlowScrollToIndex006', JSON.stringify(dataArray))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(36)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(41)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_SCROLL_TO_INDEX_0700
    * @tc.name       : testWaterFlowScrollToIndex007
    * @tc.desc       : test scrollToIndex normal index and downOverflow align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowScrollToIndex007', Level.LEVEL1, async (done: Function) => {
      let option: WaterFlowScrollToIndexData = new WaterFlowScrollToIndexData('WaterFlowScrollToIndexTest007', 20, -1)
      await Utils.pushPageByParams(`waterflow/WaterFlowScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.getOnScrollIndexData()
      console.log('testWaterFlowScrollToIndex007', JSON.stringify(dataArray))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(20)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(25)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_SCROLL_TO_INDEX_0800
    * @tc.name       : testWaterFlowScrollToIndex008
    * @tc.desc       : test scrollToIndex normal index and upOverflow align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowScrollToIndex008', Level.LEVEL1, async (done: Function) => {
      let option: WaterFlowScrollToIndexData = new WaterFlowScrollToIndexData('WaterFlowScrollToIndexTest008', 40, 4)
      await Utils.pushPageByParams(`waterflow/WaterFlowScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.getOnScrollIndexData()
      console.log('testWaterFlowScrollToIndex008', JSON.stringify(dataArray))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(40)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(45)
      done()
    })
  })
}
