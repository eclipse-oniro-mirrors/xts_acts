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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import { Driver, ON, MouseButton,Component,Point } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
let libUtil:LibUtil = new LibUtil();
let context:UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;


async function flingComponentV(key: string, isForward: boolean, speed: Int = 500, distance: number = 40) {
  let driver = Driver.create();
  let strJson = inspector.getInspectorByKey(key);
  let obj = JSON.parseJsonElement(strJson);
  let rect = Utils.getComponentRectByObj(obj);
  let centerX = (Math.round(AppStorage.get<number>('winLeft') as number + Utils.getRectHorizontalCenterX(rect))).toInt();
  let centerY = (Math.round(AppStorage.get<number>('winTop') as number + Utils.getRectVerticalCenterY(rect))).toInt();
  let Y1 = (Math.round(centerY - context.vp2px(distance))).toInt();
  let Y2 = (Math.round(centerY + context.vp2px(distance))).toInt();
  let stepLen:Int = 20;
  if (isForward) {
    await driver.fling({
      x: centerX, y: Y2
    } as Point, {
      x: centerX, y: Y1
    } as Point, stepLen, speed);
  } else {
    await driver.fling({
      x: centerX, y: Y1
    } as Point, {
      x: centerX, y: Y2
    } as Point, stepLen, speed);
  }
}

export default function listNestedScrollEventTest() {

  describe('ListNestedScrollEventTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });
    
    
/**
     * @tc.number   testListNestedScrollEvent001
     * @tc.name     testListNestedScrollEvent001
     * @tc.desc     testListNestedScrollEvent001
     * @tc.level    Level.LEVEL1
     */
    it('testListNestedScrollEvent001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`list/ListNestedScroll001Test`, false);
      await flingComponentV("scroll1", false, 40000)
      await flingComponentV("scroll2", false, 40000)
      await flingComponentV("scroll3", false, 40000)
      await flingComponentV("scroll4", false, 40000)
      await flingComponentV("scroll5", false, 40000)
      await flingComponentV("scroll6", false, 40000)
      await flingComponentV("scroll7", true, 40000)
      await flingComponentV("scroll8", true, 40000)
      await flingComponentV("scroll9", true, 40000)
      await flingComponentV("scroll10", true, 40000)
      await flingComponentV("scroll11", true, 40000)
      await flingComponentV("scroll12", true, 40000)
      let dataArray: number[][] = libUtil.listGetNestedScrollRetData()
      let state1Data: number[] = dataArray[0];
      let state2Data: number[] = dataArray[1];
      console.log('testListNestedScrollEvent001', JSON.stringify(dataArray))
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state1Data[1] == 1).assertEqual(true)
      expect(state1Data[2] == 1).assertEqual(true)
      expect(state1Data[3] == 1).assertEqual(true)
      expect(state1Data[4] == 1).assertEqual(true)
      expect(state1Data[5] == 0).assertEqual(true)
      expect(state1Data[6] == 0).assertEqual(true)
      expect(state1Data[7] == 0).assertEqual(true)
      expect(state1Data[8] == 1).assertEqual(true)
      expect(state1Data[9] == 2).assertEqual(true)
      expect(state1Data[10] == 3).assertEqual(true)
      expect(state1Data[11] == 0).assertEqual(true)
      expect(state2Data[0] == 0).assertEqual(true)
      expect(state2Data[1] == 0).assertEqual(true)
      expect(state2Data[2] == 1).assertEqual(true)
      expect(state2Data[3] == 2).assertEqual(true)
      expect(state2Data[4] == 3).assertEqual(true)
      expect(state2Data[5] == 0).assertEqual(true)
      expect(state2Data[6] == 0).assertEqual(true)
      expect(state2Data[7] == 1).assertEqual(true)
      expect(state2Data[8] == 1).assertEqual(true)
      expect(state2Data[9] == 1).assertEqual(true)
      expect(state2Data[10] == 1).assertEqual(true)
      expect(state2Data[11] == 0).assertEqual(true)
      done()
    })
    
    
/**
     * @tc.number   testListNestedScrollEvent002
     * @tc.name     testListNestedScrollEvent002
     * @tc.desc     testListNestedScrollEvent002
     * @tc.level    Level.LEVEL1
     */
    it('testListNestedScrollEvent002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`list/ListNestedScroll002Test`, false);
      await flingComponentV("scroll1", false, 40000)
      await flingComponentV("scroll2", false, 40000)
      await flingComponentV("scroll3", false, 40000)
      await flingComponentV("scroll4", false, 40000)
      await flingComponentV("scroll5", false, 40000)
      await flingComponentV("scroll6", false, 40000)
      await flingComponentV("scroll7", true, 40000)
      await flingComponentV("scroll8", true, 40000)
      await flingComponentV("scroll9", true, 40000)
      await flingComponentV("scroll10", true, 40000)
      await flingComponentV("scroll11", true, 40000)
      await flingComponentV("scroll12", true, 40000)
      let dataArray: number[][] = libUtil.listGetNestedScrollRetData()
      let state1Data: number[] = dataArray[0];
      let state2Data: number[] = dataArray[1];
      console.log('testListNestedScrollEvent002', JSON.stringify(dataArray))
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state1Data[1] == 1).assertEqual(true)
      expect(state1Data[2] == 1).assertEqual(true)
      expect(state1Data[3] == 1).assertEqual(true)
      expect(state1Data[4] == 1).assertEqual(true)
      expect(state1Data[5] == 0).assertEqual(true)
      expect(state1Data[6] == 0).assertEqual(true)
      expect(state1Data[7] == 0).assertEqual(true)
      expect(state1Data[8] == 1).assertEqual(true)
      expect(state1Data[9] == 2).assertEqual(true)
      expect(state1Data[10] == 3).assertEqual(true)
      expect(state1Data[11] == 0).assertEqual(true)
      expect(state2Data[0] == 0).assertEqual(true)
      expect(state2Data[1] == 0).assertEqual(true)
      expect(state2Data[2] == 1).assertEqual(true)
      expect(state2Data[3] == 2).assertEqual(true)
      expect(state2Data[4] == 3).assertEqual(true)
      expect(state2Data[5] == 0).assertEqual(true)
      expect(state2Data[6] == 0).assertEqual(true)
      expect(state2Data[7] == 1).assertEqual(true)
      expect(state2Data[8] == 1).assertEqual(true)
      expect(state2Data[9] == 1).assertEqual(true)
      expect(state2Data[10] == 1).assertEqual(true)
      expect(state2Data[11] == 0).assertEqual(true)
      done()
    })
    
    
/**
     * @tc.number   testListNestedScrollEvent003
     * @tc.name     testListNestedScrollEvent003
     * @tc.desc     testListNestedScrollEvent003
     * @tc.level    Level.LEVEL1
     */
    it('testListNestedScrollEvent003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`list/ListNestedScroll003Test`, false);
      await flingComponentV("scroll1", false, 40000)
      await flingComponentV("scroll2", false, 40000)
      await flingComponentV("scroll3", false, 40000)
      await flingComponentV("scroll4", false, 40000)
      await flingComponentV("scroll5", false, 40000)
      await flingComponentV("scroll6", false, 40000)
      await flingComponentV("scroll7", true, 40000)
      await flingComponentV("scroll8", true, 40000)
      await flingComponentV("scroll9", true, 40000)
      await flingComponentV("scroll10", true, 40000)
      await flingComponentV("scroll11", true, 40000)
      await flingComponentV("scroll12", true, 40000)
      let dataArray: number[][] = libUtil.listGetNestedScrollRetData()
      let state1Data: number[] = dataArray[0];
      let state2Data: number[] = dataArray[1];
      console.log('testListNestedScrollEvent003', JSON.stringify(dataArray))
      expect(state1Data[0] == 0).assertEqual(true)
      expect(state1Data[1] == 0).assertEqual(true)
      expect(state1Data[2] == 0).assertEqual(true)
      expect(state1Data[3] == 0).assertEqual(true)
      expect(state1Data[4] == 0).assertEqual(true)
      expect(state1Data[5] == 0).assertEqual(true)
      expect(state1Data[6] == 0).assertEqual(true)
      expect(state1Data[7] == 0).assertEqual(true)
      expect(state1Data[8] == 0).assertEqual(true)
      expect(state1Data[9] == 0).assertEqual(true)
      expect(state1Data[10] == 0).assertEqual(true)
      expect(state1Data[11] == 0).assertEqual(true)
      expect(state2Data[0] == 0).assertEqual(true)
      expect(state2Data[1] == 0).assertEqual(true)
      expect(state2Data[2] == 0).assertEqual(true)
      expect(state2Data[3] == 0).assertEqual(true)
      expect(state2Data[4] == 0).assertEqual(true)
      expect(state2Data[5] == 0).assertEqual(true)
      expect(state2Data[6] == 0).assertEqual(true)
      expect(state2Data[7] == 0).assertEqual(true)
      expect(state2Data[8] == 0).assertEqual(true)
      expect(state2Data[9] == 0).assertEqual(true)
      expect(state2Data[10] == 0).assertEqual(true)
      expect(state2Data[11] == 0).assertEqual(true)
      done()
    })
  })
}