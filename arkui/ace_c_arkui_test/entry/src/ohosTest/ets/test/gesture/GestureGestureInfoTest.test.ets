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

import { describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeRender from 'libnativerender.so'
import { Driver, ON, PointerMatrix } from '@kit.TestKit';
import { Point } from '@ohos.UiTest';

async function pan(id: string, x1: number, y1: number, x2: number, y2: number) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  const p1: Point = {
    x: Math.round(rect.left + vp2px(x1)),
    y: Math.round(rect.top + vp2px(y1))
  };
  const p2: Point = {
    x: Math.round(rect.left + vp2px(x2)),
    y: Math.round(rect.top + vp2px(y2))
  };
  await driver.fling(p1, p2, 5, 200)
}

async function pinch(id: string) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  let point: PointerMatrix = PointerMatrix.create(2, 2);
  point.setPoint(0, 0, { x: Math.round(rect.left + vp2px(33)), y: Math.round(rect.top + vp2px(33)) });
  point.setPoint(0, 1, { x: Math.round(rect.left + vp2px(13)), y: Math.round(rect.top + vp2px(13)) });
  point.setPoint(1, 0, { x: Math.round(rect.left + vp2px(20)), y: Math.round(rect.top + vp2px(20)) });
  point.setPoint(1, 1, { x: Math.round(rect.left + vp2px(60)), y: Math.round(rect.top + vp2px(60)) });
  await driver.injectMultiPointerAction(point, 200);
}

async function rotation(id: string) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  let point: PointerMatrix = PointerMatrix.create(2, 2);
  point.setPoint(0, 0, { x: Math.round(rect.left + vp2px(33)), y: Math.round(rect.top + vp2px(33)) });
  point.setPoint(0, 1, { x: Math.round(rect.left + vp2px(33)), y: Math.round(rect.top + vp2px(13)) });
  point.setPoint(1, 0, { x: Math.round(rect.left + vp2px(40)), y: Math.round(rect.top + vp2px(20)) });
  point.setPoint(1, 1, { x: Math.round(rect.left + vp2px(40)), y: Math.round(rect.top + vp2px(60)) });
  await driver.injectMultiPointerAction(point, 200);
}

export default function gestureGestureInfoTest() {

  describe('GestureGestureInfoTest', () => {

    let PAGE_TAG = 'GestureGestureInfoTest';

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_GESTURE_INFO_0100
     * @tc.name       : testGestureGestureInfo001
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testGestureGestureInfo001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await Utils.longClickComponent('button1')
      let dataArray: number[][] = nativeRender.getGestureData();
      let longPressGesture: number[] = dataArray[0];
      console.log('testGestureGestureInfo001', JSON.stringify(dataArray))
      expect(longPressGesture[0] == 0 && longPressGesture[1] == 1 && longPressGesture[2] == 1).assertEqual(true)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_GESTURE_INFO_0200
     * @tc.name       : testGestureGestureInfo002
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testGestureGestureInfo002', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await pan('column2', 40, 40, 80, 40)
      let dataArray: number[][] = nativeRender.getGestureData();
      let panGesture: number[] = dataArray[1];
      console.log('testGestureGestureInfo002', JSON.stringify(dataArray))
      expect(panGesture[0] >= 140 && panGesture[0] <= 250 && panGesture[1] >= 140 && panGesture[1] <= 250 &&
        panGesture[2] >= -1 && panGesture[2] <= 1 && panGesture[3] >= 8 && panGesture[3] <= 16 && panGesture[4] == 0).assertEqual(true)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_GESTURE_INFO_0300
     * @tc.name       : testGestureGestureInfo003
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testGestureGestureInfo003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await pan('column3', 40, 40, 80, 40)
      let dataArray: number[][] = nativeRender.getGestureData();
      let swipeGesture: number[] = dataArray[2];
      console.log('testGestureGestureInfo003', JSON.stringify(dataArray))
      expect(swipeGesture[0] == 0 && swipeGesture[1] >= 140 && swipeGesture[1] <= 250).assertEqual(true)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_GESTURE_INFO_0400
     * @tc.name       : testGestureGestureInfo004
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testGestureGestureInfo004', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await rotation('column4')
      let dataArray: number[][] = nativeRender.getGestureData();
      let rotationGesture: number[] = dataArray[3];
      console.log('testGestureGestureInfo004', JSON.stringify(dataArray))
      expect(rotationGesture[0] >= 100 && rotationGesture[0] <= 110).assertEqual(true)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_GESTURE_INFO_0500
     * @tc.name       : testGestureGestureInfo005
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testGestureGestureInfo005', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await pinch('column5')
      let dataArray: number[][] = nativeRender.getGestureData();
      let pinchGesture: number[] = dataArray[4];
      console.log('testGestureGestureInfo005', JSON.stringify(dataArray))
      expect( pinchGesture[0] >= 0.5 && pinchGesture[0] <= 0.7 ).assertEqual(true)
      expect( pinchGesture[1] >= 40 || pinchGesture[1] == 86).assertEqual(true)
      expect( pinchGesture[2] >= 40 || pinchGesture[2] == 86).assertEqual(true)
      done();
    })

  })
}