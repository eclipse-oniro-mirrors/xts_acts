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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ONREACHSTART_0100
    * @tc.name       : testWaterFlowOnReachStart001
    * @tc.desc       : test onReachStart event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnReachStart001', 0, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnReachStartTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('waterFlow').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ONREACHEND_0100
    * @tc.name       : testWaterFlowOnReachEnd001
    * @tc.desc       : test onReachEndTest event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnReachEnd001', 0, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnReachEndTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('waterFlow').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ONSCROLLSTOP_0100
    * @tc.name       : testWaterFlowOnScrollStop001
    * @tc.desc       : test onScrollStop event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnScrollStop001', 0, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnScrollStopTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('waterFlow').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ONWILLDIDSCROLL_0100
    * @tc.name       : testWaterFlowOnWillDidScroll001
    * @tc.desc       : test onWillScroll and onDidScroll event callback with rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnWillDidScroll001', 0, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnWillDidScrollTest`);
      // Fingers rolling upwards with rebound
      {
        await flingComponentV('waterFlow', true, 1000, 20)
        await Utils.sleep(3000)
        nativeRender.getOnWillDidScrollData()
        await flingComponentV('waterFlow', true, 40000, 95)
        await Utils.sleep(3000)
        let dataArray: number[][] = nativeRender.getOnWillDidScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        let didOffsetData: number[] = dataArray[3];
        let didStateData: number[] = dataArray[4];
        console.log('testWaterFlowOnWillDidScroll001', JSON.stringify(dataArray))
        expect(willOffsetData.length == 2 && willOffsetData[0] > 0 && willOffsetData[1] < 0).assertEqual(true)
        expect(willStateData.length == 2 && willStateData[0] == ScrollState.Scroll &&
          willStateData[1] == ScrollState.Fling).assertEqual(true)
        expect(willSourceData.length == 3 && willSourceData[0] == ScrollSource.DRAG &&
          willSourceData[1] == ScrollSource.FLING && willSourceData[2] == ScrollSource.EDGE_EFFECT)
          .assertEqual(true)
        expect(didOffsetData.length == 2 && didOffsetData[0] > 0 && didOffsetData[1] < 0).assertEqual(true)
        expect(didStateData.length == 3 && didStateData[0] == ScrollState.Scroll &&
          didStateData[1] == ScrollState.Fling && didStateData[2] == ScrollState.Idle)
          .assertEqual(true)
      }
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ONWILLDIDSCROLL_0700
    * @tc.name       : testWaterFlowOnWillDidScroll007
    * @tc.desc       : test onWillScroll and onDidScroll event callback with rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnWillDidScroll007', 0, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnWillDidScrollTest`);
      // Fingers rolling downwards with rebound
      {
        await flingComponentV('waterFlow', false, 1000, 20)
        await Utils.sleep(3000)
        nativeRender.getOnWillDidScrollData()
        await flingComponentV('waterFlow', false, 40000, 95)
        await Utils.sleep(3000)
        let dataArray: number[][] = nativeRender.getOnWillDidScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        let didOffsetData: number[] = dataArray[3];
        let didStateData: number[] = dataArray[4];
        let timeData: number[] = dataArray[5];
        console.log('testWaterFlowOnWillDidScroll007', JSON.stringify(dataArray))
        expect(willOffsetData.length == 2 && willOffsetData[0] < 0 && willOffsetData[1] > 0).assertEqual(true)
        expect(willStateData.length == 2 && willStateData[0] == ScrollState.Scroll &&
          willStateData[1] == ScrollState.Fling).assertEqual(true)
        expect(willSourceData.length == 3 && willSourceData[0] == ScrollSource.DRAG &&
          willSourceData[1] == ScrollSource.FLING && willSourceData[2] == ScrollSource.EDGE_EFFECT)
          .assertEqual(true)
        expect(didOffsetData.length == 2 && didOffsetData[0] < 0 && didOffsetData[1] > 0).assertEqual(true)
        expect(didStateData.length == 3 && didStateData[0] == ScrollState.Scroll &&
          didStateData[1] == ScrollState.Fling && didStateData[2] == ScrollState.Idle)
          .assertEqual(true)
        console.log('testWaterFlowOnWillDidScroll007', timeData.length)
        expect(timeData[timeData.length - 1] == 2 && timeData[0] == 1).assertEqual(true)
      }
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ONWILLDIDSCROLL_0200
    * @tc.name       : testWaterFlowOnWillDidScroll002
    * @tc.desc       : test onWillScroll and onDidScroll event callback without rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnWillDidScroll002', 0, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnWillDidScrollTest`);
      // Fingers rolling upwards without rebound
      await flingComponentV('waterFlow', true, 200, 20)
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.getOnWillDidScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      let didOffsetData: number[] = dataArray[3];
      let didStateData: number[] = dataArray[4];
      console.log('testWaterFlowOnWillDidScroll002', JSON.stringify(dataArray))
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ONWILLDIDSCROLL_0300
    * @tc.name       : testWaterFlowOnWillDidScroll003
    * @tc.desc       : test Scroll the mouse backwards
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnWillDidScroll003', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ONWILLDIDSCROLL_0400
    * @tc.name       : testWaterFlowOnWillDidScroll004
    * @tc.desc       : test Drag the scrollbar downwards with your fingers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnWillDidScroll004', 0, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnWillDidScrollTest`);
      // Drag the scrollbar downwards with your fingers
      await flingComponentV('waterFlow', false, 100, 60, 135)
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.getOnWillDidScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      let didOffsetData: number[] = dataArray[3];
      let didStateData: number[] = dataArray[4];
      console.log('testWaterFlowOnWillDidScroll004', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 2 && willStateData[0] == ScrollState.Scroll &&
        willStateData[1] == ScrollState.Fling).assertEqual(true)
      expect(willSourceData.length == 2 && willSourceData[0] == ScrollSource.SCROLL_BAR &&
        willSourceData[1] == ScrollSource.SCROLL_BAR_FLING).assertEqual(true)
      expect(didOffsetData.length == 1 && didOffsetData[0] > 0).assertEqual(true)
      expect(didStateData.length == 3 && didStateData[0] == ScrollState.Scroll &&
        didStateData[1] == ScrollState.Fling && didStateData[2] == ScrollState.Idle)
        .assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ONWILLDIDSCROLL_0500
    * @tc.name       : testWaterFlowOnWillDidScroll005
    * @tc.desc       : test Page flipping and scrolling
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnWillDidScroll005', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ONWILLDIDSCROLL_0600
    * @tc.name       : testWaterFlowOnWillDidScroll006
    * @tc.desc       : test Interrupt animation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnWillDidScroll006', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ON_SCROLL_INDEX_0100
    * @tc.name       : testWaterFlowOnScrollIndex001
    * @tc.desc       : test onScrollIndex event when forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnScrollIndex001', 0, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnScrollIndexTest`);
      await flingComponentV('waterFlow', true, 4000, 95)
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.getOnScrollIndexData()
      let firstArray: number[] = dataArray[0].map((value, index) => value - (dataArray[0][index - 1] || 0));
      let lastArray: number[] = dataArray[1].map((value, index) => value - (dataArray[1][index - 1] || 0));
      console.log('testWaterFlowOnScrollIndex001', JSON.stringify(dataArray))
      expect(firstArray.length == lastArray.length && firstArray.length != 0).assertEqual(true)
      expect(firstArray[0] == 0 && lastArray[0] == 7)
      for (let i = 1; i < firstArray.length; i++) {
        expect(Math.abs(firstArray[i]) % 2 == 0).assertEqual(true)
        if (firstArray[i] == 0) {
          continue
        }
        expect(Number.isInteger(firstArray[i] / 2)).assertEqual(true)
      }
      for (let i = 1; i < lastArray.length; i++) {
        expect(Math.abs(lastArray[i]) % 2 == 0).assertEqual(true)
        if (lastArray[i] == 0) {
          continue
        }
        expect(Number.isInteger(lastArray[i] / 2)).assertEqual(true)
      }
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ON_SCROLL_INDEX_0200
    * @tc.name       : testWaterFlowOnScrollIndex002
    * @tc.desc       : test onScrollIndex event when down
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnScrollIndex002', 0, async (done: Function) => {
      await Utils.pushPage(`waterflow/WaterFlowOnScrollIndexTest`);
      await flingComponentV('waterFlow', false, 10000, 50)
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.getOnScrollIndexData()
      let firstArray: number[] = dataArray[0].map((value, index) => value - (dataArray[0][index - 1] || 0));
      let lastArray: number[] = dataArray[1].map((value, index) => value - (dataArray[1][index - 1] || 0));
      console.log('testWaterFlowOnScrollIndex002', JSON.stringify(dataArray))
      expect(firstArray.length == lastArray.length && firstArray.length != 0).assertEqual(true)
      for (let i = 1; i < firstArray.length; i++) {
        expect(Math.abs(firstArray[i]) % 2 == 0).assertEqual(true)
        if (firstArray[i] == 0) {
          continue
        }
        expect(Number.isInteger(firstArray[i] / 2)).assertEqual(true)
      }
      for (let i = 1; i < lastArray.length; i++) {
        expect(Math.abs(lastArray[i]) % 2 == 0).assertEqual(true)
        if (lastArray[i] == 0) {
          continue
        }
        expect(Number.isInteger(lastArray[i] / 2)).assertEqual(true)
      }
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ON_SCROLL_FRAME_BEGIN_0100
    * @tc.name       : testWaterFlowOnScrollFrameBegin001
    * @tc.desc       : test OnScrollFrameBegin event when downForward without rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnScrollFrameBegin001', 0, async (done: Function) => {
      let option: WaterFlowScrollFrameBeginData =
        new WaterFlowScrollFrameBeginData('WaterFlowOnScrollFrameBeginTest001', 10)
      await Utils.pushPageByParams(`waterflow/WaterFlowOnScrollFrameBeginTest`, option)
      await flingComponentV('waterFlow', false, 500, 15)
      await Utils.sleep(1500)
      let dataArray = nativeRender.getOnWillDidScrollData();
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let scrollArray = nativeRender.getOnScrollIndexData()
      let firstArray: number[] = scrollArray[0];
      let lastArray: number[] = scrollArray[1];
      console.log('testWaterFlowOnScrollFrameBegin001', JSON.stringify(dataArray), JSON.stringify(scrollArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] < 0).assertEqual(true)
      expect(willStateData.length == 2 && willStateData[0] == ScrollState.Scroll &&
        willStateData[1] == ScrollState.Fling).assertEqual(true)
      expect(((lastArray[lastArray.length - 1] - firstArray[firstArray.length - 1]) == 7 ||
        (lastArray[lastArray.length - 1] - firstArray[firstArray.length - 1]) == 9) &&
        lastArray[lastArray.length - 1] != 39 && firstArray[firstArray.length - 1] != 0).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ON_SCROLL_FRAME_BEGIN_0200
    * @tc.name       : testWaterFlowOnScrollFrameBegin002
    * @tc.desc       : test OnScrollFrameBegin event when upForward with rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnScrollFrameBegin002', 0, async (done: Function) => {
      let option: WaterFlowScrollFrameBeginData =
        new WaterFlowScrollFrameBeginData('WaterFlowOnScrollFrameBeginTest002', 10)
      await Utils.pushPageByParams(`waterflow/WaterFlowOnScrollFrameBeginTest`, option)
      await flingComponentV('waterFlow', true, 100, 20)
      await Utils.sleep(3000)
      let dataArray = nativeRender.getOnWillDidScrollData();
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let scrollArray = nativeRender.getOnScrollIndexData()
      let firstArray: number[] = scrollArray[0];
      let lastArray: number[] = scrollArray[1];
      console.log('testWaterFlowOnScrollFrameBegin002', JSON.stringify(dataArray), JSON.stringify(scrollArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 2 && willStateData[0] == ScrollState.Scroll &&
        willStateData[1] == ScrollState.Fling).assertEqual(true)
      expect(firstArray[firstArray.length - 1] == 32 && lastArray[lastArray.length - 1] == 39).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ON_SCROLL_FRAME_BEGIN_0300
    * @tc.name       : testWaterFlowOnScrollFrameBegin003
    * @tc.desc       : test OnScrollFrameBegin event use scrollbar when upForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnScrollFrameBegin003', 0, async (done: Function) => {
      let option: WaterFlowScrollFrameBeginData =
        new WaterFlowScrollFrameBeginData('WaterFlowOnScrollFrameBeginTest003', 10)
      await Utils.pushPageByParams(`waterflow/WaterFlowOnScrollFrameBeginTest`, option)
      let speed: number = 100
      let distance: number = 80
      let offsetX: number = 135
      await flingComponentV('waterFlow', true, speed, distance, offsetX)
      await Utils.sleep(1500)
      let dataArray = nativeRender.getOnWillDidScrollData();
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let scrollArray = nativeRender.getOnScrollIndexData()
      let firstArray: number[] = scrollArray[0];
      let lastArray: number[] = scrollArray[1];
      console.log('testWaterFlowOnScrollFrameBegin003', JSON.stringify(dataArray), JSON.stringify(scrollArray))
      expect(willOffsetData.length == 0).assertEqual(true)
      expect(willStateData.length == 0).assertEqual(true)
      expect(firstArray[firstArray.length - 1] == 0 && lastArray[lastArray.length - 1] == 7).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ON_SCROLL_FRAME_BEGIN_0400
    * @tc.name       : testWaterFlowOnScrollFrameBegin004
    * @tc.desc       : test OnScrollFrameBegin event use scroll controller when upForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnScrollFrameBegin004', 0, async (done: Function) => {
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
      expect(firstArray[firstArray.length - 1] == 4 && lastArray[lastArray.length - 1] == 11).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_ON_SCROLL_FRAME_BEGIN_0500
    * @tc.name       : testWaterFlowOnScrollFrameBegin005
    * @tc.desc       : test OnScrollFrameBegin event when upForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWaterFlowOnScrollFrameBegin005', 0, async (done: Function) => {
      let option: WaterFlowScrollFrameBeginData =
        new WaterFlowScrollFrameBeginData('WaterFlowOnScrollFrameBeginTest005', -10)
      await Utils.pushPageByParams(`waterflow/WaterFlowOnScrollFrameBegin2Test`, option)
      await flingComponentV('waterFlow', true, 100, 20)
      await Utils.sleep(3000)
      let dataArray = nativeRender.getOnWillDidScrollData();
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let scrollArray = nativeRender.getOnScrollIndexData()
      let firstArray: number[] = scrollArray[0];
      let lastArray: number[] = scrollArray[1];
      console.log('testWaterFlowOnScrollFrameBegin005', JSON.stringify(dataArray), JSON.stringify(scrollArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 2 && willStateData[0] == ScrollState.Scroll &&
        willStateData[1] == ScrollState.Fling).assertEqual(true)
      expect(firstArray[firstArray.length - 1] == 0 && lastArray[lastArray.length - 1] == 7).assertEqual(true)
      done()
    })
  })
}
