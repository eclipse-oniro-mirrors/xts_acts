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
import { Driver, ON, PointerMatrix } from '@kit.TestKit';
import { Point } from '@ohos.UiTest';


async function panGesture(id: string, x1: number, y1: number, x2: number, y2: number) {
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

async function pinchGesture(id: string) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  let point: PointerMatrix = PointerMatrix.create(2, 4);
  point.setPoint(0, 0, { x: Math.round(rect.left + vp2px(50)), y:Math.round( rect.top + vp2px(50)) });
  point.setPoint(0, 1, { x: Math.round(rect.left + vp2px(40)), y: Math.round(rect.top + vp2px(40)) });
  point.setPoint(0, 2, { x: Math.round(rect.left + vp2px(30)), y: Math.round(rect.top + vp2px(30)) });
  point.setPoint(0, 3, { x: Math.round(rect.left + vp2px(20)), y: Math.round(rect.top + vp2px(20)) });
  point.setPoint(1, 0, { x: Math.round(rect.left + vp2px(60)), y: Math.round(rect.top + vp2px(60)) });
  point.setPoint(1, 1, { x: Math.round(rect.left + vp2px(70)), y: Math.round(rect.top + vp2px(70)) });
  point.setPoint(1, 2, { x: Math.round(rect.left + vp2px(80)), y: Math.round(rect.top + vp2px(80)) });
  point.setPoint(1, 3, { x: Math.round(rect.left + vp2px(90)), y: Math.round(rect.top + vp2px(90)) });
  await driver.injectMultiPointerAction(point, 200);
}

async function rotationGesture(id: string) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  let point: PointerMatrix = PointerMatrix.create(2, 4);
  point.setPoint(0, 0, { x: Math.round(rect.left + vp2px(50)), y: Math.round(rect.top + vp2px(50)) });
  point.setPoint(0, 1, { x: Math.round(rect.left + vp2px(50)), y: Math.round(rect.top + vp2px(40)) });
  point.setPoint(0, 2, { x: Math.round(rect.left + vp2px(50)), y: Math.round(rect.top + vp2px(30)) });
  point.setPoint(0, 3, { x: Math.round(rect.left + vp2px(50)), y: Math.round(rect.top + vp2px(20)) });
  point.setPoint(1, 0, { x: Math.round(rect.left + vp2px(60)), y: Math.round(rect.top + vp2px(60)) });
  point.setPoint(1, 1, { x: Math.round(rect.left + vp2px(60)), y: Math.round(rect.top + vp2px(70)) });
  point.setPoint(1, 2, { x: Math.round(rect.left + vp2px(60)), y: Math.round(rect.top + vp2px(80)) });
  point.setPoint(1, 3, { x: Math.round(rect.left + vp2px(60)), y: Math.round(rect.top + vp2px(90)) });
  await driver.injectMultiPointerAction(point, 200);
}

export default function gestureCreateGestureTest() {

  describe('GestureCreateGestureTest', () => {

    let PAGE_TAG1 = 'GestureCreateGestureTest';
    let PAGE_TAG2 = 'GestureCreateGesture1Test';

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_CREATE_GESTURE_0100
     * @tc.name       : testGestureCreateGesture001
     * @tc.desc       : testing tapGesture
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level 1
     */
    it('testGestureCreateGesture001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`gesture/${PAGE_TAG1}`);
      await Utils.clickComponent('button1')
      await Utils.clickComponent('button2')
      await Utils.clickComponent('button3')
      await Utils.clickComponent('button4')
      await Utils.sleep(600)
      expect(Utils.getComponentInfoByKey('button1').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button2').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('button3').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button4').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_CREATE_GESTURE_0200
     * @tc.name       : testGestureCreateGesture002
     * @tc.desc       : testing longPressGesture
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level 1
     */
    it('testGestureCreateGesture002', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`gesture/${PAGE_TAG1}`);
      await Utils.longClickComponent('button5')
      await Utils.longClickComponent('button6')
      await Utils.longClickComponent('button7')
      await Utils.longClickComponent('button8')
      await Utils.sleep(600)
      expect(Utils.getComponentInfoByKey('button5').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button6').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button7').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button8').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_CREATE_GESTURE_0300
     * @tc.name       : testGestureCreateGesture003
     * @tc.desc       : testing gestureGroup
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level 1
     */
    it('testGestureCreateGesture003', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`gesture/${PAGE_TAG1}`);
      expect(Utils.getComponentInfoByKey('button9').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_CREATE_GESTURE_0400
     * @tc.name       : testGestureCreateGesture004
     * @tc.desc       : testing panGesture
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level 1
     */
    it('testGestureCreateGesture004', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`gesture/${PAGE_TAG2}`);
      await panGesture('column1', 40, 40, 80, 40)
      await panGesture('column2', 80, 40, 40, 40)
      await panGesture('column3', 40, 40, 40, 80)
      await panGesture('column4', 80, 40, 40, 40)
      await panGesture('column5', 40, 40, 80, 40)
      await panGesture('column6', 40, 80, 40, 40)
      await panGesture('column7', 80, 40, 80, 80)
      await panGesture('column8', 40, 40, 80, 40)
      await panGesture('column9', 40, 40, 80, 40)
      await panGesture('column10', 40, 40, 80, 40)
      await Utils.sleep(600)
      expect(Utils.getComponentInfoByKey('column1').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column2').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column3').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column4').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column5').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column6').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column7').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column8').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('column9').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('column10').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_CREATE_GESTURE_0500
     * @tc.name       : testGestureCreateGesture005
     * @tc.desc       : testing pinchGesture
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level 1
     */
    it('testGestureCreateGesture005', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'GestureCreateGesture2Test';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await pinchGesture('column1')
      await pinchGesture('column2')
      await pinchGesture('column3')
      await Utils.sleep(600)
      expect(Utils.getComponentInfoByKey('column1').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column2').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column3').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_CREATE_GESTURE_0600
     * @tc.name       : testGestureCreateGesture006
     * @tc.desc       : testing rotationGesture
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level 1
     */
    it('testGestureCreateGesture006', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'GestureCreateGesture2Test';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await rotationGesture('column4')
      await rotationGesture('column5')
      await rotationGesture('column6')
      await rotationGesture('column7')
      await Utils.sleep(600)
      expect(Utils.getComponentInfoByKey('column4').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column5').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column6').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column7').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_CREATE_GESTURE_0700
     * @tc.name       : testGestureCreateGesture007
     * @tc.desc       : testing swipeGesture
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level 1
     */
    it('testGestureCreateGesture007', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'GestureCreateGesture3Test';
      await Utils.pushPage(`gesture/${PAGE_TAG}`, ()=>{
        setTimeout(()=>{}, 1000)
      });
      await panGesture('column1', 40, 40, 80, 40)
      await panGesture('column2', 80, 40, 40, 40)
      await panGesture('column3', 40, 40, 40, 80)
      await panGesture('column4', 80, 40, 40, 40)
      await panGesture('column5', 40, 40, 80, 40)
      await panGesture('column6', 40, 80, 40, 40)
      await panGesture('column7', 80, 40, 80, 80)
      await panGesture('column8', 40, 40, 80, 40)
      await panGesture('column9', 40, 40, 40, 80)
      await panGesture('column10', 40, 40, 80, 40)
      expect(Utils.getComponentInfoByKey('column1').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column2').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column3').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column4').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column5').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column6').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column7').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column8').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('column9').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('column10').$attrs.backgroundColor).assertEqual('#FF00FF00')
      Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_CREATE_GESTURE_0800
     * @tc.name       : testGestureCreateGesture008
     * @tc.desc       : testing specialGesture
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level 1
     */
    it('testGestureCreateGesture008', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'GestureCreateGesture4Test';
      await Utils.pushPage(`gesture/${PAGE_TAG}`, ()=>{
        setTimeout(()=>{}, 1000)
      });
      await rotationGesture('rotationGestureWithColumn1')
      await panGesture('swipeGestureWithColumn1', 40, -40, 40, 150)
      await panGesture('swipeGestureWithColumn2', 40, 40, 40, 150)
      await panGesture('panGestureWithColumn1', 40, -40, 40, 150)
      await panGesture('panGestureWithColumn2', 40, 40, 40, 150)
      Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('rotationGestureWithColumn1').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('swipeGestureWithColumn1').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('swipeGestureWithColumn2').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('panGestureWithColumn1').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('panGestureWithColumn2').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    })

  })
}