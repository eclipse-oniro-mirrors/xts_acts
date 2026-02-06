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
import nativeRender from 'libnativerender.so'

async function flingComponentV(key: string, isForward: boolean, speed: number = 500, distance: number = 20,
  offsetX: number = 0, distanceEnd: number | null = null) {
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
      x: centerX, y: (distanceEnd !== null ? Math.round(centerY - vp2px(distanceEnd)) : Y1)
    }, stepLen, speed);
  } else {
    await driver.fling({
      x: centerX, y: Y1
    }, {
      x: centerX, y: (distanceEnd !== null ? Math.round(centerY + vp2px(distanceEnd)) : Y2)
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

export default function listEventTest() {

  describe('ListEventTest', () => {

    /**
     * @tc.name   testListOnScroll003
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_SCROLL_0003
     * @tc.desc   test Scroll the mouse backwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnScroll003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListEmptyTest`)
      await Utils.sleep(2000)
      await Utils.pushPage(`list/ListOnScrollTest`);
      // Scroll the mouse backwards
      await mouseScrollV('list', true, () => {
        setTimeout(() => {
        }, 4000)
      })
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      console.log('testListOnScroll003 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 1 && willStateData[0] < 0.000001).assertEqual(true)
      done()
    })

    /**
     * @tc.name   testListOnScroll005
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_SCROLL_0005
     * @tc.desc   test Page flipping and scrolling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnScroll005', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollTest`);
      {
        await Utils.clickComponent('btn1')
        await Utils.sleep(3000)
        // Scroll down with animation
        let dataArray: number[][] = nativeRender.listGetOnScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        console.log('testListOnScroll005 dataArray =', JSON.stringify(dataArray))
        expect(willOffsetData.length == 1 && willOffsetData[0] < 0).assertEqual(true)
        expect(willStateData.length == 1 && willStateData[0] < 0.000001).assertEqual(true)
      }
      {
        await Utils.clickComponent('btn2')
        await Utils.sleep(3000)
        // Page up without animation
        let dataArray: number[][] = nativeRender.listGetOnScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        console.log('testListOnScroll005 dataArray =', JSON.stringify(dataArray))
        expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      }
      done()
    })

    /**
     * @tc.name   testListOnScroll006
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_SCROLL_0006
     * @tc.desc   test Interrupt animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnScroll006', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollTest`);
      await flingComponentV('list', true)
      await Utils.clickComponent('list')
      await Utils.sleep(1500)
      // Scroll down with animation
      let dataArray: number[][] = nativeRender.listGetOnScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      console.log('testListOnScroll006 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 1 && willStateData[0] < 0.000001).assertEqual(true)
      done()
    })

    /**
     * @tc.name   testListOnScrollStop001
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_SCROLL_STOP_0001
     * @tc.desc   test onScrollStop event not callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnScrollStop001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollStopTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('list').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /**
     * @tc.name   testListOnScrollStart001
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_SCROLL_START_0001
     * @tc.desc   test onScrollStart event not callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnScrollStart001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollStartTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('list').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /**
     * @tc.name   testListOnReachStart001
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_REACH_START_0001
     * @tc.desc   test onReachStart event not callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnReachStart001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnReachStartTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('list').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /**
     * @tc.name   testListOnReachEnd001
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_REACH_END_0001
     * @tc.desc   test onReachEndTest event not callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnReachEnd001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnReachEndTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('list').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /**
     * @tc.name   testListOnWillDidScroll003
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_WILL_DID_SCROLL_0003
     * @tc.desc   test Scroll the mouse backwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnWillDidScroll003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListEmptyTest`)
      await Utils.sleep(2000)
      await Utils.pushPage(`list/ListOnWillDidScrollTest`);
      // Scroll the mouse backwards
      await mouseScrollV('list', true, () => {
        setTimeout(() => {
        }, 4000)
      })
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnWillDidScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      let didOffsetData: number[] = dataArray[3];
      let didStateData: number[] = dataArray[4];
      console.log('testListOnWillDidScroll003 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 1 && willStateData[0] == ScrollState.Scroll).assertEqual(true)
      expect(willSourceData.length == 1 && willSourceData[0] == ScrollSource.OTHER_USER_INPUT).assertEqual(true)
      expect(didOffsetData.length == 1 && didOffsetData[0] > 0).assertEqual(true)
      expect(didStateData.length == 2 && didStateData[0] == ScrollState.Scroll && didStateData[1] == ScrollState.Idle)
        .assertEqual(true)
      done()
    })

    /**
     * @tc.name   testListOnWillDidScroll005
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_WILL_DID_SCROLL_0005
     * @tc.desc   test Page flipping and scrolling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnWillDidScroll005', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillDidScrollTest`);
      {
        await Utils.clickComponent('btn1')
        await Utils.sleep(3000)
        // Scroll down with animation
        let dataArray: number[][] = nativeRender.listGetOnWillDidScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        let didOffsetData: number[] = dataArray[3];
        let didStateData: number[] = dataArray[4];
        console.log('testListOnWillDidScroll005 dataArray =', JSON.stringify(dataArray))
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
        let dataArray: number[][] = nativeRender.listGetOnWillDidScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        let didOffsetData: number[] = dataArray[3];
        let didStateData: number[] = dataArray[4];
        console.log('testListOnWillDidScroll005 dataArray =', JSON.stringify(dataArray))
        expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
        expect(willStateData.length == 1 && willStateData[0] == ScrollState.Idle).assertEqual(true)
        expect(willSourceData.length == 1 && willSourceData[0] == ScrollSource.SCROLLER).assertEqual(true)
        expect(didOffsetData.length == 1 && didOffsetData[0] > 0).assertEqual(true)
        expect(didStateData.length == 1 && didStateData[0] == ScrollState.Idle).assertEqual(true)
      }
      done()
    })

    /**
     * @tc.name   testListOnWillDidScroll006
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_WILL_DID_SCROLL_0006
     * @tc.desc   test Interrupt animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnWillDidScroll006', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillDidScrollTest`);
      await flingComponentV('list', true)
      await Utils.clickComponent('list')
      await Utils.sleep(1500)
      // Scroll down with animation
      let dataArray: number[][] = nativeRender.listGetOnWillDidScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      let didOffsetData: number[] = dataArray[3];
      let didStateData: number[] = dataArray[4];
      console.log('testListOnWillDidScroll006 dataArray =', JSON.stringify(dataArray))
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
     * @tc.name   testListOnWillScroll003
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_WILL_SCROLL_0003
     * @tc.desc   test Scroll the mouse backwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnWillScroll003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillScrollTest`);
      // Scroll the mouse backwards
      await mouseScrollV('list', true, () => {
        setTimeout(() => {
        }, 4000)
      })
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnWillScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      console.log('testListOnWillScroll003 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 1 && willStateData[0] == ScrollState.Scroll).assertEqual(true)
      expect(willSourceData.length == 1 && willSourceData[0] == ScrollSource.OTHER_USER_INPUT).assertEqual(true)
      done()
    })

    /**
     * @tc.name   testListOnWillScroll005
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_WILL_SCROLL_0005
     * @tc.desc   test Page flipping and scrolling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnWillScroll005', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillScrollTest`);
      {
        await Utils.clickComponent('btn1')
        await Utils.sleep(3000)
        // Scroll down with animation
        let dataArray: number[][] = nativeRender.listGetOnWillScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        console.log('testListOnWillScroll005 dataArray =', JSON.stringify(dataArray))
        expect(willOffsetData.length == 1 && willOffsetData[0] < 0).assertEqual(true)
        expect(willStateData.length == 1 && willStateData[0] == ScrollState.Fling).assertEqual(true)
        expect(willSourceData.length == 1 && willSourceData[0] == ScrollSource.SCROLLER_ANIMATION).assertEqual(true)
      }
      {
        await Utils.clickComponent('btn2')
        await Utils.sleep(3000)
        // Page up without animation
        let dataArray: number[][] = nativeRender.listGetOnWillScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        console.log('testListOnWillScroll005 dataArray =', JSON.stringify(dataArray))
        expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
        expect(willStateData.length == 1 && willStateData[0] == ScrollState.Idle).assertEqual(true)
        expect(willSourceData.length == 1 && willSourceData[0] == ScrollSource.SCROLLER).assertEqual(true)
      }
      done()
    })

    /**
     * @tc.name   testListOnWillScroll006
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_WILL_SCROLL_0006
     * @tc.desc   test Interrupt animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnWillScroll006', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillScrollTest`);
      await flingComponentV('list', true)
      await Utils.clickComponent('list')
      await Utils.sleep(1500)
      // Scroll down with animation
      let dataArray: number[][] = nativeRender.listGetOnWillScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      console.log('testListOnWillScroll006 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 2 && willStateData[0] == ScrollState.Scroll &&
        willStateData[1] == ScrollState.Fling).assertEqual(true)
      expect(willSourceData.length == 2 && willSourceData[0] == ScrollSource.DRAG &&
        willSourceData[1] == ScrollSource.FLING).assertEqual(true)
      done()
    })

    /**
     * @tc.name   testListOnDidScroll003
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_DID_SCROLL_0003
     * @tc.desc   test Scroll the mouse backwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnDidScroll003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnDidScrollTest`);
      // Scroll the mouse backwards
      await mouseScrollV('list', true, () => {
        setTimeout(() => {
        }, 4000)
      })
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnDidScrollData()
      let didOffsetData: number[] = dataArray[0];
      let didStateData: number[] = dataArray[1];
      console.log('testListOnDidScroll003 dataArray =', JSON.stringify(dataArray))
      expect(didOffsetData.length == 1 && didOffsetData[0] > 0).assertEqual(true)
      expect(didStateData.length == 2 && didStateData[0] == ScrollState.Scroll && didStateData[1] == ScrollState.Idle)
        .assertEqual(true)
      done()
    })

    /**
     * @tc.name   testListOnDidScroll005
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_DID_SCROLL_0005
     * @tc.desc   test Page flipping and scrolling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnDidScroll005', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnDidScrollTest`);
      {
        await Utils.clickComponent('btn1')
        await Utils.sleep(3000)
        // Scroll down with animation
        let dataArray: number[][] = nativeRender.listGetOnDidScrollData()
        let didOffsetData: number[] = dataArray[0];
        let didStateData: number[] = dataArray[1];
        console.log('testListOnDidScroll005 dataArray =', JSON.stringify(dataArray))
        expect(didOffsetData.length == 1 && didOffsetData[0] < 0).assertEqual(true)
        expect(didStateData.length == 2 && didStateData[0] == ScrollState.Fling && didStateData[1] == ScrollState.Idle)
          .assertEqual(true)
      }
      {
        await Utils.clickComponent('btn2')
        await Utils.sleep(3000)
        // Page up without animation
        let dataArray: number[][] = nativeRender.listGetOnDidScrollData()
        let didOffsetData: number[] = dataArray[0];
        let didStateData: number[] = dataArray[1];
        console.log('testListOnDidScroll005 dataArray =', JSON.stringify(dataArray))
        expect(didOffsetData.length == 1 && didOffsetData[0] > 0).assertEqual(true)
        expect(didStateData.length == 1 && didStateData[0] == ScrollState.Idle).assertEqual(true)
      }
      done()
    })

    /**
     * @tc.name   testListOnDidScroll006
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_DID_SCROLL_0006
     * @tc.desc   test Interrupt animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnDidScroll006', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnDidScrollTest`);
      await flingComponentV('list', true)
      await Utils.clickComponent('list')
      await Utils.sleep(1500)
      // Scroll down with animation
      let dataArray: number[][] = nativeRender.listGetOnDidScrollData()
      let didOffsetData: number[] = dataArray[0];
      let didStateData: number[] = dataArray[1];
      console.log('testListOnDidScroll006 dataArray =', JSON.stringify(dataArray))
      expect(didOffsetData.length == 1 && didOffsetData[0] > 0).assertEqual(true)
      expect(didStateData.length == 3 && didStateData[0] == ScrollState.Scroll &&
        didStateData[1] == ScrollState.Fling && didStateData[2] == ScrollState.Idle)
        .assertEqual(true)
      done()
    })

    /**
     * @tc.name   testListOnScrollFrameBegin004
     * @tc.number SUB_ARKUI_CAPI_LIST_ON_SCROLL_FRAME_BEGIN_0004
     * @tc.desc   test OnScrollFrameBegin event use scroll controller when upForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListOnScrollFrameBegin004', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollFrameBeginTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnWillDidScrollData();
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      console.log('testListOnScrollFrameBegin004 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 0).assertEqual(true)
      expect(willStateData.length == 0).assertEqual(true)
      done()
    })
  })
}