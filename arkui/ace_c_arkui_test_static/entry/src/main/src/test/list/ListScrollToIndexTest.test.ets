'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level, beforeAll, afterEach } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import { ScrollAlign } from '@ohos.arkui.component'
import { ListScrollToIndexData } from '../../../ets/pages/list/ListScrollToIndexTest'

let libUtil: LibUtil = new LibUtil();


export default function listScrollToIndex() {

  describe('ListScrollToIndex', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });
    afterEach(async () => {
      await Utils.pushPage(`list/ListEmptyTest`)
    })

    
    
/**
     * @tc.number   testListScrollToIndex001
     * @tc.name     testListScrollToIndex001
     * @tc.desc     testListScrollToIndex001
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollToIndex001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest001', 30, ScrollAlign.START)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = libUtil.listGetOnScrollIndexData()
      console.log('testListScrollToIndex001', JSON.stringify(dataArray))
      console.log('testListScrollToIndex001', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex001', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(30)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(33)
      done()
    })

    
    
/**
     * @tc.number   testListScrollToIndex002
     * @tc.name     testListScrollToIndex002
     * @tc.desc     testListScrollToIndex002
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollToIndex002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest002', -100, ScrollAlign.START)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = libUtil.listGetOnScrollIndexData()
      console.log('testListScrollToIndex002', JSON.stringify(dataArray))
      console.log('testListScrollToIndex002', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex002', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(0)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(3)
      done()
    })

    
    
/**
     * @tc.number   testListScrollToIndex003
     * @tc.name     testListScrollToIndex003
     * @tc.desc     testListScrollToIndex003
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollToIndex003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest003', 100, ScrollAlign.START)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = libUtil.listGetOnScrollIndexData()
      console.log('testListScrollToIndex003', JSON.stringify(dataArray))
      console.log('testListScrollToIndex003', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex003', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(0)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(3)
      done()
    })

    
    
/**
     * @tc.number   testListScrollToIndex004
     * @tc.name     testListScrollToIndex004
     * @tc.desc     testListScrollToIndex004
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollToIndex004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest004', 40, ScrollAlign.CENTER)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = libUtil.listGetOnScrollIndexData()
      console.log('testListScrollToIndex004', JSON.stringify(dataArray))
      console.log('testListScrollToIndex004', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex004', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(38)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(42)
      done()
    })

    
    
/**
     * @tc.number   testListScrollToIndex005
     * @tc.name     testListScrollToIndex005
     * @tc.desc     testListScrollToIndex005
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollToIndex005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest005', 20, ScrollAlign.END)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = libUtil.listGetOnScrollIndexData()
      console.log('testListScrollToIndex005', JSON.stringify(dataArray))
      console.log('testListScrollToIndex005', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex005', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(17)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(20)
      done()
    })

    
    
/**
     * @tc.number   testListScrollToIndex006
     * @tc.name     testListScrollToIndex006
     * @tc.desc     testListScrollToIndex006
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollToIndex006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let option: ListScrollToIndexData =
        new ListScrollToIndexData('ListScrollToIndexTest006', 40, ScrollAlign.AUTO)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = libUtil.listGetOnScrollIndexData()
      console.log('testListScrollToIndex006', JSON.stringify(dataArray))
      console.log('testListScrollToIndex006', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex006', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(37)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(40)
      done()
    })

    
    
/**
     * @tc.number   testListScrollToIndex007
     * @tc.name     testListScrollToIndex007
     * @tc.desc     testListScrollToIndex007
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollToIndex007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let option: ListScrollToIndexData = new ListScrollToIndexData('ListScrollToIndexTest007', 20, -1)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = libUtil.listGetOnScrollIndexData()
      console.log('testListScrollToIndex007', JSON.stringify(dataArray))
      console.log('testListScrollToIndex007', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex007', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(20)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(23)
      done()
    })

    
    
/**
     * @tc.number   testListScrollToIndex008
     * @tc.name     testListScrollToIndex008
     * @tc.desc     testListScrollToIndex008
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollToIndex008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let option: ListScrollToIndexData = new ListScrollToIndexData('ListScrollToIndexTest008', 40, 4)
      await Utils.pushPageByParams(`list/ListScrollToIndexTest`, option)
      await Utils.sleep(1500)
      let dataArray = libUtil.listGetOnScrollIndexData()
      console.log('testListScrollToIndex008', JSON.stringify(dataArray))
      console.log('testListScrollToIndex008', JSON.stringify(dataArray[0][dataArray[0].length - 1]))
      console.log('testListScrollToIndex008', JSON.stringify(dataArray[1][dataArray[1].length - 1]))
      expect(dataArray[0][dataArray[0].length - 1]).assertEqual(40)
      expect(dataArray[1][dataArray[1].length - 1]).assertEqual(43)
      done()
    })
  })
}
