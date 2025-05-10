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

import { afterEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import { ListScrollToIndexData } from '../../MainAbility/pages/list/ListScrollToIndexTest'
import nativeRender from 'libnativerender.so'

export default function listScrollToIndex() {

  describe('ListScrollToIndex', () => {

    afterEach(async () => {
      await Utils.pushPage(`list/ListEmptyTest`)
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_TO_INDEX_0001
    * @tc.name       : testListScrollToIndex001
    * @tc.desc       : test scrollToIndex normal index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListScrollToIndex001', 0, async (done: Function) => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest001', 30, ScrollAlign.START)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnScrollIndexData()
      console.log('testListScrollToIndex001', JSON.stringify(dataArray))
      console.log('testListScrollToIndex001', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex001', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(30)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(33)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_TO_INDEX_0002
    * @tc.name       : testListScrollToIndex002
    * @tc.desc       : test scrollToIndex downOverflow index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListScrollToIndex002', 0, async (done: Function) => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest002', -100, ScrollAlign.START)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnScrollIndexData()
      console.log('testListScrollToIndex002', JSON.stringify(dataArray))
      console.log('testListScrollToIndex002', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex002', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(0)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(3)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_TO_INDEX_0003
    * @tc.name       : testListScrollToIndex003
    * @tc.desc       : test scrollToIndex upOverflow index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListScrollToIndex003', 0, async (done: Function) => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest003', 100, ScrollAlign.START)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnScrollIndexData()
      console.log('testListScrollToIndex003', JSON.stringify(dataArray))
      console.log('testListScrollToIndex003', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex003', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(0)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(3)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_TO_INDEX_0004
    * @tc.name       : testListScrollToIndex004
    * @tc.desc       : test scrollToIndex normal index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListScrollToIndex004', 0, async (done: Function) => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest004', 40, ScrollAlign.CENTER)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnScrollIndexData()
      console.log('testListScrollToIndex004', JSON.stringify(dataArray))
      console.log('testListScrollToIndex004', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex004', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(38)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(42)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_TO_INDEX_0005
    * @tc.name       : testListScrollToIndex005
    * @tc.desc       : test scrollToIndex normal index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListScrollToIndex005', 0, async (done: Function) => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest005', 20, ScrollAlign.END)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnScrollIndexData()
      console.log('testListScrollToIndex005', JSON.stringify(dataArray))
      console.log('testListScrollToIndex005', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex005', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(17)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(20)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_TO_INDEX_0006
    * @tc.name       : testListScrollToIndex006
    * @tc.desc       : test scrollToIndex normal index and normal align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListScrollToIndex006', 0, async (done: Function) => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest006', 40, ScrollAlign.AUTO)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnScrollIndexData()
      console.log('testListScrollToIndex006', JSON.stringify(dataArray))
      console.log('testListScrollToIndex006', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex006', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(37)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(40)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_TO_INDEX_0007
    * @tc.name       : testListScrollToIndex007
    * @tc.desc       : test scrollToIndex normal index and downOverflow align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListScrollToIndex007', 0, async (done: Function) => {
      let option: ListScrollToIndexData = new ListScrollToIndexData('ListScrollToIndexTest007', 20, -1)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnScrollIndexData()
      console.log('testListScrollToIndex007', JSON.stringify(dataArray))
      console.log('testListScrollToIndex007', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex007', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(20)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(23)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_SCROLL_TO_INDEX_0008
    * @tc.name       : testListScrollToIndex008
    * @tc.desc       : test scrollToIndex normal index and upOverflow align
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListScrollToIndex008', 0, async (done: Function) => {
      let option: ListScrollToIndexData = new ListScrollToIndexData('ListScrollToIndexTest008', 40, 4)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnScrollIndexData()
      console.log('testListScrollToIndex008', JSON.stringify(dataArray))
      console.log('testListScrollToIndex008', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex008', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(40)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(43)
      done()
    })
  })
}
