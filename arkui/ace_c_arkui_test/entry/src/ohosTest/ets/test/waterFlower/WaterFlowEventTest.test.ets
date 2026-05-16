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
import { Driver } from '@kit.TestKit';
import { WaterFlowScrollFrameBeginData } from '../../MainAbility/pages/waterflow/WaterFlowOnScrollFrameBeginTest'
import nativeRender from 'libnativerender.so'

async function flingComponentV(key: string, isForward: boolean, speed: number = 500, distance: number = 20,
  offsetX: number = 0) {
  let driver = Driver.create();
  let rect = Utils.getComponentRect(key);
  let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect) + vp2px(offsetX));
  let centerY = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
  let Y1 = Math.round(centerY - vp2px(distance));
  let Y2 = Math.round(centerY + vp2px(distance));
  let stepLen = 20;
  if (isForward) {
    await driver.fling({
      x: centerX, y: Y2
    }, {
      x: centerX, y: Y1
    }, stepLen, speed);
  } else {
    await driver.fling({
      x: centerX, y: Y1
    }, {
      x: centerX, y: Y2
    }, stepLen, speed);
  }
}

async function mouseScrollV(key: string, isDown: boolean, done?: Function) {
  let driver = Driver.create();
  let rect = Utils.getComponentRect(key);
  let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
  let centerY = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
  await driver.mouseScroll({
    x: centerX, y: centerY
  }, isDown, 1);
  if (done) {
    done();
  }
}

export default function waterFlowEventTest() {

  describe('WaterFlowEventTest', () => {

    /**
     * @tc.name   testWaterFlowOnReachStart001
     * @tc.number SUB_ARKUI_CAPI_WATERFLOW_ONREACHSTART_0100
     * @tc.desc   test onReachStart event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlowOnReachStart001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnReachStartTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('waterFlow').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /**
     * @tc.name   testWaterFlowOnReachEnd001
     * @tc.number SUB_ARKUI_CAPI_WATERFLOW_ONREACHEND_0100
     * @tc.desc   test onReachEndTest event not callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlowOnReachEnd001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnReachEndTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('waterFlow').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /**
     * @tc.name   testWaterFlowOnScrollStop001
     * @tc.number SUB_ARKUI_CAPI_WATERFLOW_ONSCROLLSTOP_0100
     * @tc.desc   test onScrollStop event not callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlowOnScrollStop001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnScrollStopTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('waterFlow').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /**
     * @tc.name   testWaterFlowOnWillDidScroll003
     * @tc.number SUB_ARKUI_CAPI_WATERFLOW_ONWILLDIDSCROLL_0300
     * @tc.desc   test Scroll the mouse backwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlowOnWillDidScroll003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowEmptyTest`)
      await Utils.sleep(2000)
      await Utils.pushPage(`waterflow/WaterFlowOnWillDidScrollTest`);
      // Scroll the mouse backwards
      await mouseScrollV('waterFlow', true, () => {
        setTimeout(() => {
        }, 4000)
      })
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.getOnWillDidScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      let didOffsetData: number[] = dataArray[3];
      let didStateData: number[] = dataArray[4];
      console.log('testWaterFlowOnWillDidScroll003', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 1 && willStateData[0] == ScrollState.Scroll).assertEqual(true)
      expect(willSourceData.length == 1 && willSourceData[0] == ScrollSource.OTHER_USER_INPUT).assertEqual(true)
      expect(didOffsetData.length == 1 && didOffsetData[0] > 0).assertEqual(true)
      expect(didStateData.length == 2 && didStateData[0] == ScrollState.Scroll && didStateData[1] == ScrollState.Idle)
        .assertEqual(true)
      done()
    })

    /**
     * @tc.name   testWaterFlowOnWillDidScroll005
     * @tc.number SUB_ARKUI_CAPI_WATERFLOW_ONWILLDIDSCROLL_0500
     * @tc.desc   test Page flipping and scrolling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlowOnWillDidScroll005', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnWillDidScrollTest`);
      {
        await Utils.clickComponent('btn1')
        await Utils.sleep(3000)
        // Scroll down with animation
        let dataArray: number[][] = nativeRender.getOnWillDidScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        let didOffsetData: number[] = dataArray[3];
        let didStateData: number[] = dataArray[4];
        console.log('testWaterFlowOnWillDidScroll005', JSON.stringify(dataArray))
        expect(willOffsetData.length == 1 && willOffsetData[0] < 0).assertEqual(true)
        expect(willStateData.length == 1 && willStateData[0] == ScrollState.Fling).assertEqual(true)
        expect(willSourceData.length == 1 && willSourceData[0] == ScrollSource.SCROLLER_ANIMATION).assertEqual(true)
        expect(didOffsetData.length == 1 && didOffsetData[0] < 0).assertEqual(true)
        expect(didStateData.length == 2 && didStateData[0] == ScrollState.Fling && didStateData[1] == ScrollState.Idle)
          .assertEqual(true)
      }
      {
        await Utils.clickComponent('btn2')
        await Utils.sleep(3000)
        // Page up without animation
        let dataArray: number[][] = nativeRender.getOnWillDidScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        let didOffsetData: number[] = dataArray[3];
        let didStateData: number[] = dataArray[4];
        console.log('testWaterFlowOnWillDidScroll005', JSON.stringify(dataArray))
        expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
        expect(willStateData.length == 1 && willStateData[0] == ScrollState.Idle).assertEqual(true)
        expect(willSourceData.length == 1 && willSourceData[0] == ScrollSource.SCROLLER).assertEqual(true)
        expect(didOffsetData.length == 1 && didOffsetData[0] > 0).assertEqual(true)
        expect(didStateData.length == 1 && didStateData[0] == ScrollState.Idle).assertEqual(true)
      }
      done()
    })

    /**
     * @tc.name   testWaterFlowOnWillDidScroll006
     * @tc.number SUB_ARKUI_CAPI_WATERFLOW_ONWILLDIDSCROLL_0600
     * @tc.desc   test Interrupt animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlowOnWillDidScroll006', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnWillDidScrollTest`);
      await flingComponentV('waterFlow', true)
      await Utils.clickComponent('waterFlow')
      await Utils.sleep(1500)
      // Scroll down with animation
      let dataArray: number[][] = nativeRender.getOnWillDidScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      let didOffsetData: number[] = dataArray[3];
      let didStateData: number[] = dataArray[4];
      console.log('testWaterFlowOnWillDidScroll006', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 2 && willStateData[0] == ScrollState.Scroll &&
        willStateData[1] == ScrollState.Fling).assertEqual(true)
      expect(willSourceData.length == 2 && willSourceData[0] == ScrollSource.DRAG &&
        willSourceData[1] == ScrollSource.FLING).assertEqual(true)
      expect(didOffsetData.length == 1 && didOffsetData[0] > 0).assertEqual(true)
      expect(didStateData.length == 3 && didStateData[0] == ScrollState.Scroll &&
        didStateData[1] == ScrollState.Fling && didStateData[2] == ScrollState.Idle)
        .assertEqual(true)
      done()
    })

    /**
     * @tc.name   testWaterFlowOnScrollFrameBegin004
     * @tc.number SUB_ARKUI_CAPI_WATERFLOW_ON_SCROLL_FRAME_BEGIN_0400
     * @tc.desc   test OnScrollFrameBegin event use scroll controller when upForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWaterFlowOnScrollFrameBegin004', Level.LEVEL1, async (done: Function) => {
      let option: WaterFlowScrollFrameBeginData =
        new WaterFlowScrollFrameBeginData('WaterFlowOnScrollFrameBeginTest004', 10)
      await Utils.pushPageByParams(`waterflow/WaterFlowOnScrollFrameBeginTest`, option)
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray = nativeRender.getOnWillDidScrollData();
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let scrollArray = nativeRender.getOnScrollIndexData()
      let firstArray: number[] = scrollArray[0];
      let lastArray: number[] = scrollArray[1];
      console.log('testWaterFlowOnScrollFrameBegin004', JSON.stringify(dataArray), JSON.stringify(scrollArray))
      expect(willOffsetData.length == 0).assertEqual(true)
      expect(willStateData.length == 0).assertEqual(true)
      expect(firstArray[firstArray.length - 1] == 4 && lastArray[lastArray.length - 1] == 9).assertEqual(true)
      done()
    })
  })
}