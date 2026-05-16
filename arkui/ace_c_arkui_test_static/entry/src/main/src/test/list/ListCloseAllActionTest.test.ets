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


async function flingComponentV(key: string, isForward: boolean, speed: Int = 10, distance: number = 20) {
  let driver = Driver.create();
  let strJson = inspector.getInspectorByKey(key);
  let obj = JSON.parseJsonElement(strJson);
  let rect = Utils.getComponentRectByObj(obj);
  let centerX = (Math.round(AppStorage.get<number>('winLeft') as number + Utils.getRectHorizontalCenterX(rect))).toInt()
  let centerY = (Math.round(AppStorage.get<number>('winTop') as number + Utils.getRectVerticalCenterY(rect))).toInt()
  let Y1 = (Math.round(centerY - context.vp2px(distance))).toInt()
  let Y2 = (Math.round(centerY + context.vp2px(distance))).toInt()
  let stepLen:Int = 20;
  if (isForward) {
    await driver.fling({
      x: centerX, y: centerY
    } as Point, {
      x: centerX, y: Y1
    } as Point, stepLen, speed);
  } else {
    await driver.fling({
      x: centerX, y: centerY
    } as Point, {
      x: centerX, y: Y2
    } as Point, stepLen, speed);
  }
}

async function flingComponentH(key: string, isLeft: boolean, speed: Int = 10, distance: number = 20) {
  let driver = Driver.create();
  let strJson = inspector.getInspectorByKey(key);
  let obj = JSON.parseJsonElement(strJson);
  let rect = Utils.getComponentRectByObj(obj);
  let centerX = (Math.round(AppStorage.get<number>('winLeft') as number + Utils.getRectHorizontalCenterX(rect))).toInt()
  let centerY = (Math.round(AppStorage.get<number>('winTop') as number + Utils.getRectVerticalCenterY(rect))).toInt()
  let X1 = (Math.round(centerX - context.vp2px(distance))).toInt()
  let X2 = (Math.round(centerX + context.vp2px(distance))).toInt()
  let stepLen:Int = 20;
  if (isLeft) {
    await driver.fling({
      x: centerX, y: centerY
    } as Point, {
      x: X1, y: centerY
    } as Point, stepLen, speed);
  } else {
    await driver.fling({
      x: centerX, y: centerY
    } as Point, {
      x: X2, y: centerY
    } as Point, stepLen, speed);
  }
}

export default function listCloseAllActionTest() {

  describe('ListCloseAllActionTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListCloseAllAction001
     * @tc.name     testListCloseAllAction001
     * @tc.desc     testListCloseAllAction001
     * @tc.level    Level.LEVEL1
     */
    it('testListCloseAllAction001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`list/ListCloseAllActionTest`);
      await flingComponentH("list1", true, 1000, 100);
      await Utils.clickComponent('callbackButton0')
      await Utils.sleep(3000)
      let dataArray: number[][] = libUtil.listGetCloseAllActionRetData()
      let retData: number[] = dataArray[0];
      console.log('testListCloseAllAction001', JSON.stringify(dataArray))
      expect(retData.length == 1 && retData[0] == 0).assertEqual(true)
      done()
    })

    
    
/**
     * @tc.number   testListCloseAllAction002
     * @tc.name     testListCloseAllAction002
     * @tc.desc     testListCloseAllAction002
     * @tc.level    Level.LEVEL1
     */
    it('testListCloseAllAction002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`list/ListCloseAllActionTest`);
      await flingComponentH("list1", true, 1000, 100);
      await Utils.clickComponent('nullCallbackButton0')
      await Utils.sleep(3000)
      let dataArray: number[][] = libUtil.listGetCloseAllActionRetData()
      let retData: number[] = dataArray[0];
      console.log('testListCloseAllAction002', JSON.stringify(dataArray))
      expect(retData.length == 1 && retData[0] == 0).assertEqual(true)
      done()
    })

    
    
/**
     * @tc.number   testListCloseAllAction003
     * @tc.name     testListCloseAllAction003
     * @tc.desc     testListCloseAllAction003
     * @tc.level    Level.LEVEL1
     */
    it('testListCloseAllAction003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`list/ListCloseAllActionTest`);
      await flingComponentV("list2", true, 1000, 100);
      await Utils.clickComponent('callbackButton1')
      await Utils.sleep(3000)
      let dataArray: number[][] = libUtil.listGetCloseAllActionRetData()
      let retData: number[] = dataArray[0];
      console.log('testListCloseAllAction003', JSON.stringify(dataArray))
      expect(retData.length == 1 && retData[0] == 0).assertEqual(true)
      done()
    })

    
    
/**
     * @tc.number   testListCloseAllAction004
     * @tc.name     testListCloseAllAction004
     * @tc.desc     testListCloseAllAction004
     * @tc.level    Level.LEVEL1
     */
    it('testListCloseAllAction004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`list/ListCloseAllActionTest`);
      await flingComponentV("list2", true, 1000, 100);
      await Utils.clickComponent('nullCallbackButton1')
      await Utils.sleep(3000)
      let dataArray: number[][] = libUtil.listGetCloseAllActionRetData()
      let retData: number[] = dataArray[0];
      console.log('testListCloseAllAction004', JSON.stringify(dataArray))
      expect(retData.length == 1 && retData[0] == 0).assertEqual(true)
      done()
    })
  })
}
