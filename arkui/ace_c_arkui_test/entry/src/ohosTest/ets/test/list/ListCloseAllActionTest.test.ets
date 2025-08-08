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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver } from '@kit.TestKit';
import nativeRender from 'libnativerender.so'

async function flingComponentV(key: string, isForward: boolean, speed: number = 10, distance: number = 20) {
  let driver = Driver.create();
  let rect = Utils.getComponentRect(key);
  let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect))
  let centerY = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect))
  let Y1 = Math.round(centerY - vp2px(distance))
  let Y2 = Math.round(centerY + vp2px(distance))
  let stepLen = 20;
  if (isForward) {
    await driver.fling({
      x: centerX, y: centerY
    }, {
      x: centerX, y: Y1
    }, stepLen, speed);
  } else {
    await driver.fling({
      x: centerX, y: centerY
    }, {
      x: centerX, y: Y2
    }, stepLen, speed);
  }
}

async function flingComponentH(key: string, isLeft: boolean, speed: number = 10, distance: number = 20) {
  let driver = Driver.create();
  let rect = Utils.getComponentRect(key);
  let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect))
  let centerY = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect))
  let X1 = Math.round(centerX - vp2px(distance))
  let X2 = Math.round(centerX + vp2px(distance))
  let stepLen = 20;
  if (isLeft) {
    await driver.fling({
      x: centerX, y: centerY
    }, {
      x: X1, y: centerY
    }, stepLen, speed);
  } else {
    await driver.fling({
      x: centerX, y: centerY
    }, {
      x: X2, y: centerY
    }, stepLen, speed);
  }
}

export default function listCloseAllActionTest() {

  describe('ListCloseAllActionTest', () => {


    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_CLOSE_ALL_ACTION_0001
    * @tc.name       : testListCloseAllAction001
    * @tc.desc       : test list close action with call back
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListCloseAllAction001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListCloseAllActionTest`);
      await flingComponentH("list1", true, 1000, 100);
      await Utils.clickComponent('callbackButton0')
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetCloseAllActionRetData()
      let retData: number[] = dataArray[0];
      console.log('testListCloseAllAction001', JSON.stringify(dataArray))
      expect(retData.length == 1 && retData[0] == 0).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_CLOSE_ALL_ACTION_0002
    * @tc.name       : testListCloseAllAction002
    * @tc.desc       : test list close action without call back
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListCloseAllAction002', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListCloseAllActionTest`);
      await flingComponentH("list1", true, 1000, 100);
      await Utils.clickComponent('nullCallbackButton0')
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetCloseAllActionRetData()
      let retData: number[] = dataArray[0];
      console.log('testListCloseAllAction002', JSON.stringify(dataArray))
      expect(retData.length == 1 && retData[0] == 0).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_CLOSE_ALL_ACTION_0003
    * @tc.name       : testListCloseAllAction003
    * @tc.desc       : test list close action with call back
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListCloseAllAction003', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListCloseAllActionTest`);
      await flingComponentV("list2", true, 1000, 100);
      await Utils.clickComponent('callbackButton1')
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetCloseAllActionRetData()
      let retData: number[] = dataArray[0];
      console.log('testListCloseAllAction003', JSON.stringify(dataArray))
      expect(retData.length == 1 && retData[0] == 0).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_CLOSE_ALL_ACTION_0004
    * @tc.name       : testListCloseAllAction004
    * @tc.desc       : test list close action without call back
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListCloseAllAction004', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListCloseAllActionTest`);
      await flingComponentV("list2", true, 1000, 100);
      await Utils.clickComponent('nullCallbackButton1')
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetCloseAllActionRetData()
      let retData: number[] = dataArray[0];
      console.log('testListCloseAllAction004', JSON.stringify(dataArray))
      expect(retData.length == 1 && retData[0] == 0).assertEqual(true)
      done()
    })
  })
}
