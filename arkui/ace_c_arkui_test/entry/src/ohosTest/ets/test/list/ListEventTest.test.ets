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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_0001
    * @tc.name       : testListOnScroll001
    * @tc.desc       : test onScroll event callback with rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScroll001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollTest`);
      // Fingers rolling upwards with rebound
      {
        await flingComponentV('list', true, 20000, 80)
        await Utils.sleep(1000)
        await flingComponentV('list', true, 20000, 80, 0, 150)
        await Utils.sleep(3000)
        let dataArray: number[][] = nativeRender.listGetOnScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        console.log('testListOnScroll001 dataArray =', JSON.stringify(dataArray))
        expect(willOffsetData[0] > 0 && willOffsetData[willOffsetData.length-1] < 0).assertEqual(true)
        expect(willStateData[0] < 0.000001).assertEqual(true)
      }
      // Fingers rolling downwards with rebound
      {
        await flingComponentV('list', false, 20000, 80)
        await Utils.sleep(1000)
        await flingComponentV('list', false, 20000, 80, 0, 150)
        await Utils.sleep(3000)
        let dataArray: number[][] = nativeRender.listGetOnScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        console.log('testListOnScroll001 dataArray =', JSON.stringify(dataArray))
        expect(willOffsetData[0] < 0 && willOffsetData[willOffsetData.length-1] > 0).assertEqual(true)
        expect(willStateData[0] < 0.000001).assertEqual(true)
      }
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_0002
    * @tc.name       : testListOnScroll002
    * @tc.desc       : test onScroll event callback without rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScroll002', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollTest`);
      // Fingers rolling upwards without rebound
      await flingComponentV('list', true, 200, 20)
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      console.log('testListOnScroll002 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 1 && willStateData[0] < 0.000001).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_0003
    * @tc.name       : testListOnScroll003
    * @tc.desc       : test Scroll the mouse backwards
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScroll003', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_0004
    * @tc.name       : testListOnScroll004
    * @tc.desc       : test Drag the scrollbar downwards with your fingers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScroll004', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollTest`);
      // Drag the scrollbar downwards with your fingers
      await flingComponentV('list', false, 100, 80, 135)
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      console.log('testListOnScroll004 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 1 && willStateData[0] < 0.000001).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_0005
    * @tc.name       : testListOnScroll005
    * @tc.desc       : test Page flipping and scrolling
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScroll005', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_0006
    * @tc.name       : testListOnScroll006
    * @tc.desc       : test Interrupt animation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScroll006', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_STOP_0001
    * @tc.name       : testListOnScrollStop001
    * @tc.desc       : test onScrollStop event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScrollStop001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollStopTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('list').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_START_0001
    * @tc.name       : testListOnScrollStart001
    * @tc.desc       : test onScrollStart event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScrollStart001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollStartTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('list').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_REACH_START_0001
    * @tc.name       : testListOnReachStart001
    * @tc.desc       : test onReachStart event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnReachStart001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnReachStartTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('list').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_REACH_END_0001
    * @tc.name       : testListOnReachEnd001
    * @tc.desc       : test onReachEndTest event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnReachEnd001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnReachEndTest`);
      await Utils.clickComponent('btn')
      await Utils.sleep(1500)
      expect(Utils.getComponentInfoByKey('list').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_DID_SCROLL_0001
    * @tc.name       : testListOnWillDidScroll001
    * @tc.desc       : test onWillScroll and onDidScroll event callback with rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillDidScroll001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillDidScrollTest`);
      // Fingers rolling upwards with rebound
      {
        await flingComponentV('list', true, 20000, 80)
        await Utils.sleep(1000)
        await flingComponentV('list', true, 40000, 80)
        await Utils.sleep(3000)
        let dataArray: number[][] = nativeRender.listGetOnWillDidScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        let didOffsetData: number[] = dataArray[3];
        let didStateData: number[] = dataArray[4];
        console.log('testListOnWillDidScroll001 dataArray =', JSON.stringify(dataArray))
        expect(willOffsetData[0] > 0 && willOffsetData[willOffsetData.length-1] < 0).assertEqual(true)
        expect(willStateData[0] == ScrollState.Scroll && willStateData[1] == ScrollState.Fling).assertEqual(true)
        expect(willSourceData[0] == ScrollSource.DRAG && willSourceData[1] == ScrollSource.FLING &&
          willSourceData[willSourceData.length-1] == ScrollSource.EDGE_EFFECT).assertEqual(true)
        expect(didOffsetData[0] > 0 && didOffsetData[1] < 0).assertEqual(true)
        expect(didStateData[didStateData.length-3] == ScrollState.Scroll &&
          didStateData[didStateData.length-2] == ScrollState.Fling &&
          didStateData[didStateData.length-1] == ScrollState.Idle).assertEqual(true)
      }
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_DID_SCROLL_0007
    * @tc.name       : testListOnWillDidScroll007
    * @tc.desc       : test onWillScroll and onDidScroll event callback with rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillDidScroll007', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillDidScrollTest`);
      // Fingers rolling downwards with rebound
      {
        await flingComponentV('list', false, 20000, 80)
        await Utils.sleep(1000)
        await flingComponentV('list', false, 40000, 80)
        await Utils.sleep(3000)
        let dataArray: number[][] = nativeRender.listGetOnWillDidScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        let didOffsetData: number[] = dataArray[3];
        let didStateData: number[] = dataArray[4];
        console.log('testListOnWillDidScroll007 dataArray =', JSON.stringify(dataArray))
        expect(willOffsetData[0] < 0 && willOffsetData[willOffsetData.length-1] > 0).assertEqual(true)
        expect(willStateData[0] == ScrollState.Scroll && willStateData[1] == ScrollState.Fling).assertEqual(true)
        expect(willSourceData[0] == ScrollSource.DRAG && willSourceData[1] == ScrollSource.FLING &&
          willSourceData[willSourceData.length-1] == ScrollSource.EDGE_EFFECT).assertEqual(true)
        expect(didOffsetData[0] < 0 && didOffsetData[1] > 0).assertEqual(true)
        expect(didStateData[didStateData.length-3] == ScrollState.Scroll &&
          didStateData[didStateData.length-2] == ScrollState.Fling &&
          didStateData[didStateData.length-1] == ScrollState.Idle).assertEqual(true)
      }
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_DID_SCROLL_0002
    * @tc.name       : testListOnWillDidScroll002
    * @tc.desc       : test onWillScroll and onDidScroll event callback without rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillDidScroll002', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillDidScrollTest`);
      // Fingers rolling upwards without rebound
      await flingComponentV('list', true, 200, 20)
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnWillDidScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      let didOffsetData: number[] = dataArray[3];
      let didStateData: number[] = dataArray[4];
      console.log('testListOnWillDidScroll002 dataArray =', JSON.stringify(dataArray))
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
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_DID_SCROLL_0003
    * @tc.name       : testListOnWillDidScroll003
    * @tc.desc       : test Scroll the mouse backwards
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillDidScroll003', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_DID_SCROLL_0004
    * @tc.name       : testListOnWillDidScroll004
    * @tc.desc       : test Drag the scrollbar downwards with your fingers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillDidScroll004', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillDidScrollTest`);
      // Drag the scrollbar downwards with your fingers
      await flingComponentV('list', false, 100, 60, 135)
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnWillDidScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      let didOffsetData: number[] = dataArray[3];
      let didStateData: number[] = dataArray[4];
      console.log('testListOnWillDidScroll004 dataArray =', JSON.stringify(dataArray))
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
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_DID_SCROLL_0005
    * @tc.name       : testListOnWillDidScroll005
    * @tc.desc       : test Page flipping and scrolling
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillDidScroll005', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_DID_SCROLL_0006
    * @tc.name       : testListOnWillDidScroll006
    * @tc.desc       : test Interrupt animation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillDidScroll006', 0, async (done: Function) => {
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
    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_SCROLL_0001
    * @tc.name       : testListOnWillScroll001
    * @tc.desc       : test onWillScroll event callback with rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillScroll001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillScrollTest`);
      // Fingers rolling upwards with rebound
      {
        await flingComponentV('list', true, 20000, 80)
        await Utils.sleep(1000)
        await flingComponentV('list', true, 40000, 80)
        await Utils.sleep(3000)
        let dataArray: number[][] = nativeRender.listGetOnWillScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        console.log('testListOnWillScroll001 dataArray =', JSON.stringify(dataArray))
        expect(willOffsetData[0] > 0 && willOffsetData[willOffsetData.length-1] < 0).assertEqual(true)
        expect(willStateData[0] == ScrollState.Scroll && willStateData[1] == ScrollState.Fling).assertEqual(true)
        expect(willSourceData[0] == ScrollSource.DRAG && willSourceData[1] == ScrollSource.FLING &&
          willSourceData[willSourceData.length-1] == ScrollSource.EDGE_EFFECT).assertEqual(true)
      }
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_SCROLL_0007
    * @tc.name       : testListOnWillScroll007
    * @tc.desc       : test onWillScroll event callback with rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillScroll007', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillScrollTest`);
      // Fingers rolling downwards with rebound
      {
        await flingComponentV('list', false, 20000, 80)
        await Utils.sleep(1000)
        await flingComponentV('list', false, 40000, 80)
        await Utils.sleep(3000)
        let dataArray: number[][] = nativeRender.listGetOnWillScrollData()
        let willOffsetData: number[] = dataArray[0];
        let willStateData: number[] = dataArray[1];
        let willSourceData: number[] = dataArray[2];
        console.log('testListOnWillScroll007 dataArray =', JSON.stringify(dataArray))
        expect(willOffsetData[0] < 0 && willOffsetData[willOffsetData.length-1] > 0).assertEqual(true)
        expect(willStateData[0] == ScrollState.Scroll && willStateData[1] == ScrollState.Fling).assertEqual(true)
        expect(willSourceData[0] == ScrollSource.DRAG && willSourceData[1] == ScrollSource.FLING &&
          willSourceData[willSourceData.length-1] == ScrollSource.EDGE_EFFECT).assertEqual(true)
      }
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_SCROLL_0002
    * @tc.name       : testListOnWillScroll002
    * @tc.desc       : test onWillScroll event callback without rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillScroll002', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillScrollTest`);
      // Fingers rolling upwards without rebound
      await flingComponentV('list', true, 200, 20)
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnWillScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      console.log('testListOnWillScroll002 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 2 && willStateData[0] == ScrollState.Scroll &&
        willStateData[1] == ScrollState.Fling).assertEqual(true)
      expect(willSourceData.length == 2 && willSourceData[0] == ScrollSource.DRAG &&
        willSourceData[1] == ScrollSource.FLING).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_SCROLL_0003
    * @tc.name       : testListOnWillScroll003
    * @tc.desc       : test Scroll the mouse backwards
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillScroll003', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_SCROLL_0004
    * @tc.name       : testListOnWillScroll004
    * @tc.desc       : test Drag the scrollbar downwards with your fingers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillScroll004', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnWillScrollTest`);
      // Drag the scrollbar downwards with your fingers
      await flingComponentV('list', false, 100, 60, 135)
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnWillScrollData()
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      let willSourceData: number[] = dataArray[2];
      console.log('testListOnWillScroll004 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData.length == 2 && willStateData[0] == ScrollState.Scroll &&
        willStateData[1] == ScrollState.Fling).assertEqual(true)
      expect(willSourceData.length == 2 && willSourceData[0] == ScrollSource.SCROLL_BAR &&
        willSourceData[1] == ScrollSource.SCROLL_BAR_FLING).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_SCROLL_0005
    * @tc.name       : testListOnWillScroll005
    * @tc.desc       : test Page flipping and scrolling
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillScroll005', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_WILL_SCROLL_0006
    * @tc.name       : testListOnWillScroll006
    * @tc.desc       : test Interrupt animation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnWillScroll006', 0, async (done: Function) => {
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
    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_DID_SCROLL_0001
    * @tc.name       : testListOnDidScroll001
    * @tc.desc       : test onDidScroll event callback with rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnDidScroll001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnDidScrollTest`);
      // Fingers rolling upwards with rebound
      {
        await flingComponentV('list', true, 20000, 80)
        await Utils.sleep(1000)
        await flingComponentV('list', true, 40000, 80)
        await Utils.sleep(3000)
        let dataArray: number[][] = nativeRender.listGetOnDidScrollData()
        let didOffsetData: number[] = dataArray[0];
        let didStateData: number[] = dataArray[1];
        console.log('testListOnDidScroll001 dataArray =', JSON.stringify(dataArray))
        expect(didOffsetData[0] > 0 && didOffsetData[1] < 0).assertEqual(true)
        expect(didStateData[didStateData.length-3] == ScrollState.Scroll &&
          didStateData[didStateData.length-2] == ScrollState.Fling &&
          didStateData[didStateData.length-1] == ScrollState.Idle).assertEqual(true)

      }
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_DID_SCROLL_0007
    * @tc.name       : testListOnDidScroll007
    * @tc.desc       : test onDidScroll event callback with rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnDidScroll007', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnDidScrollTest`);
      // Fingers rolling downwards with rebound
      {
        await flingComponentV('list', false, 20000, 80)
        await Utils.sleep(1000)
        await flingComponentV('list', false, 40000, 80)
        await Utils.sleep(3000)
        let dataArray: number[][] = nativeRender.listGetOnDidScrollData()
        let didOffsetData: number[] = dataArray[0];
        let didStateData: number[] = dataArray[1];
        console.log('testListOnDidScroll007 dataArray =', JSON.stringify(dataArray))
        expect(didOffsetData[0] < 0 && didOffsetData[1] > 0).assertEqual(true)
        expect(didStateData[didStateData.length-3] == ScrollState.Scroll &&
          didStateData[didStateData.length-2] == ScrollState.Fling &&
          didStateData[didStateData.length-1] == ScrollState.Idle).assertEqual(true)
      }
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_DID_SCROLL_0002
    * @tc.name       : testListOnDidScroll002
    * @tc.desc       : test onDidScroll event callback without rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnDidScroll002', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnDidScrollTest`);
      // Fingers rolling upwards without rebound
      await flingComponentV('list', true, 200, 20)
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnDidScrollData()
      let didOffsetData: number[] = dataArray[0];
      let didStateData: number[] = dataArray[1];
      console.log('testListOnDidScroll002 dataArray =', JSON.stringify(dataArray))
      expect(didOffsetData.length == 1 && didOffsetData[0] > 0).assertEqual(true)
      expect(didStateData.length == 3 && didStateData[0] == ScrollState.Scroll &&
        didStateData[1] == ScrollState.Fling && didStateData[2] == ScrollState.Idle)
        .assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_DID_SCROLL_0003
    * @tc.name       : testListOnDidScroll003
    * @tc.desc       : test Scroll the mouse backwards
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnDidScroll003', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_DID_SCROLL_0004
    * @tc.name       : testListOnDidScroll004
    * @tc.desc       : test Drag the scrollbar downwards with your fingers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnDidScroll004', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnDidScrollTest`);
      // Drag the scrollbar downwards with your fingers
      await flingComponentV('list', false, 100, 60, 135)
      await Utils.sleep(3000)
      let dataArray: number[][] = nativeRender.listGetOnDidScrollData()
      let didOffsetData: number[] = dataArray[0];
      let didStateData: number[] = dataArray[1];
      console.log('testListOnDidScroll004 dataArray =', JSON.stringify(dataArray))
      expect(didOffsetData.length == 1 && didOffsetData[0] > 0).assertEqual(true)
      expect(didStateData.length == 3 && didStateData[0] == ScrollState.Scroll &&
        didStateData[1] == ScrollState.Fling && didStateData[2] == ScrollState.Idle)
        .assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_DID_SCROLL_0005
    * @tc.name       : testListOnDidScroll005
    * @tc.desc       : test Page flipping and scrolling
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnDidScroll005', 0, async (done: Function) => {
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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_DID_SCROLL_0006
    * @tc.name       : testListOnDidScroll006
    * @tc.desc       : test Interrupt animation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnDidScroll006', 0, async (done: Function) => {
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
    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_INDEX_0001
    * @tc.name       : testListOnScrollIndex001
    * @tc.desc       : test onScrollIndex event when forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScrollIndex001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollIndexTest`);
      await flingComponentV('list', true, 20000, 50)
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetOnScrollIndexData()
      let firstArray: number[] = dataArray[0];
      let lastArray: number[] = dataArray[1];
      let subComponentIndexArray: number[] = dataArray[2];
      console.log('testListOnScrollIndex001 dataArray =', JSON.stringify(dataArray))
      expect(firstArray.length == lastArray.length && lastArray.length == subComponentIndexArray.length &&
        firstArray.length != 0).assertEqual(true)
      expect(firstArray[firstArray.length - 1] == 12).assertEqual(true)
      expect(lastArray[lastArray.length - 1] == 15).assertEqual(true)
      expect(subComponentIndexArray[subComponentIndexArray.length - 1] == 13).assertEqual(true)
      done()
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_INDEX_0002
    * @tc.name       : testListOnScrollIndex002
    * @tc.desc       : test onScrollIndex event when forward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScrollIndex002', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollIndexTest`);
      await flingComponentV('list', false, 20000, 50)
      await Utils.sleep(1500)
      let dataArray: number[][] = nativeRender.listGetOnScrollIndexData()
      let firstArray: number[] = dataArray[0];
      let lastArray: number[] = dataArray[1];
      let subComponentIndexArray: number[] = dataArray[2];
      console.log('testListOnScrollIndex002 dataArray =', JSON.stringify(dataArray))
      expect(firstArray.length == lastArray.length && lastArray.length == subComponentIndexArray.length &&
        firstArray.length != 0).assertEqual(true)
      expect(firstArray[firstArray.length - 1] == 0).assertEqual(true)
      expect(lastArray[lastArray.length - 1] == 3).assertEqual(true)
      expect(subComponentIndexArray[subComponentIndexArray.length - 1] == 2).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_FRAME_BEGIN_0001
    * @tc.name       : testListOnScrollFrameBegin001
    * @tc.desc       : test OnScrollFrameBegin event when downForward without rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScrollFrameBegin001', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollFrameBeginTest`);
      await flingComponentV('list', false, 500, 15)
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnWillDidScrollData();
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      console.log('testListOnScrollFrameBegin001 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] < 0).assertEqual(true)
      expect(willStateData.length == 2 && willStateData[0] == ScrollState.Scroll &&
        willStateData[1] == ScrollState.Fling).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_FRAME_BEGIN_0002
    * @tc.name       : testListOnScrollFrameBegin002
    * @tc.desc       : test OnScrollFrameBegin event when upForward with rebound
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScrollFrameBegin002', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollFrameBeginTest`);
      await flingComponentV('list', true, 20000, 80)
      await Utils.sleep(1000)
      await flingComponentV('list', true, 20000, 80)
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnWillDidScrollData();
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      console.log('testListOnScrollFrameBegin002 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 1 && willOffsetData[0] > 0).assertEqual(true)
      expect(willStateData[0] == ScrollState.Scroll && willStateData[1] == ScrollState.Fling).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_FRAME_BEGIN_0003
    * @tc.name       : testListOnScrollFrameBegin003
    * @tc.desc       : test OnScrollFrameBegin event use scrollbar when upForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScrollFrameBegin003', 0, async (done: Function) => {
      await Utils.pushPage(`list/ListOnScrollFrameBeginTest`);
      let speed: number = 100
      let distance: number = 80
      let offsetX: number = 135
      await flingComponentV('list', true, speed, distance, offsetX)
      await Utils.sleep(1500)
      let dataArray = nativeRender.listGetOnWillDidScrollData();
      let willOffsetData: number[] = dataArray[0];
      let willStateData: number[] = dataArray[1];
      console.log('testListOnScrollFrameBegin003 dataArray =', JSON.stringify(dataArray))
      expect(willOffsetData.length == 0).assertEqual(true)
      expect(willStateData.length == 0).assertEqual(true)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ON_SCROLL_FRAME_BEGIN_0004
    * @tc.name       : testListOnScrollFrameBegin004
    * @tc.desc       : test OnScrollFrameBegin event use scroll controller when upForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testListOnScrollFrameBegin004', 0, async (done: Function) => {
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