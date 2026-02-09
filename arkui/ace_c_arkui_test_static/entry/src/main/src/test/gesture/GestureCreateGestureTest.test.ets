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

import { describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix,Component } from '@kit.TestKit';
import { Point } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

async function panGesture(id: string, x1: number, y1: number, x2: number, y2: number) {
  let context:UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;
  let driver = Driver.create();
  let refresh:Component = await driver.findComponent(ON.id(id)) as Component;
  let rect = await refresh.getBounds();
  const p1: Point = {
    x: (Math.round(rect.left + context.vp2px(x1))).toInt(),
    y: (Math.round(rect.top + context.vp2px(y1))).toInt()
  };
  const p2: Point = {
    x: (Math.round(rect.left + context.vp2px(x2))).toInt(),
    y: (Math.round(rect.top + context.vp2px(y2))).toInt()
  };
  await driver.fling(p1, p2, 5, 200)
}

async function pinchGesture(id: string) {
  let context:UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;
  let driver = Driver.create();
  let refresh:Component = await driver.findComponent(ON.id(id)) as Component;
  let rect = await refresh.getBounds();
  let point: PointerMatrix = PointerMatrix.create(2, 4);
  point.setPoint(0, 0, { x: (Math.round(rect.left + context.vp2px(50))).toInt(), y:(Math.round( rect.top + context.vp2px(50))).toInt() } as Point);
  point.setPoint(0, 1, { x: (Math.round(rect.left + context.vp2px(40))).toInt(), y: (Math.round(rect.top + context.vp2px(40))).toInt() } as Point);
  point.setPoint(0, 2, { x: (Math.round(rect.left + context.vp2px(30))).toInt(), y: (Math.round(rect.top + context.vp2px(30))).toInt() } as Point);
  point.setPoint(0, 3, { x: (Math.round(rect.left + context.vp2px(20))).toInt(), y: (Math.round(rect.top + context.vp2px(20))).toInt() } as Point);
  point.setPoint(1, 0, { x: (Math.round(rect.left + context.vp2px(60))).toInt(), y: (Math.round(rect.top + context.vp2px(60))).toInt() } as Point);
  point.setPoint(1, 1, { x: (Math.round(rect.left + context.vp2px(70))).toInt(), y: (Math.round(rect.top + context.vp2px(70))).toInt() } as Point);
  point.setPoint(1, 2, { x: (Math.round(rect.left + context.vp2px(80))).toInt(), y: (Math.round(rect.top + context.vp2px(80))).toInt() } as Point);
  point.setPoint(1, 3, { x: (Math.round(rect.left + context.vp2px(90))).toInt(), y: (Math.round(rect.top + context.vp2px(90))).toInt() } as Point);
  await driver.injectMultiPointerAction(point, 200);
}

async function rotationGesture(id: string) {
  let context:UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;
  let driver = Driver.create();
  let refresh:Component = await driver.findComponent(ON.id(id)) as Component;
  let rect = await refresh.getBounds();
  let point: PointerMatrix = PointerMatrix.create(2, 4);
  point.setPoint(0, 0, { x: (Math.round(rect.left + context.vp2px(50))).toInt(), y: (Math.round(rect.top + context.vp2px(50))).toInt() } as Point);
  point.setPoint(0, 1, { x: (Math.round(rect.left + context.vp2px(50))).toInt(), y: (Math.round(rect.top + context.vp2px(40))).toInt() } as Point);
  point.setPoint(0, 2, { x: (Math.round(rect.left + context.vp2px(50))).toInt(), y: (Math.round(rect.top + context.vp2px(30))).toInt() } as Point);
  point.setPoint(0, 3, { x: (Math.round(rect.left + context.vp2px(50))).toInt(), y: (Math.round(rect.top + context.vp2px(20))).toInt() } as Point);
  point.setPoint(1, 0, { x: (Math.round(rect.left + context.vp2px(60))).toInt(), y: (Math.round(rect.top + context.vp2px(60))).toInt() } as Point);
  point.setPoint(1, 1, { x: (Math.round(rect.left + context.vp2px(60))).toInt(), y: (Math.round(rect.top + context.vp2px(70))).toInt() } as Point);
  point.setPoint(1, 2, { x: (Math.round(rect.left + context.vp2px(60))).toInt(), y: (Math.round(rect.top + context.vp2px(80))).toInt() } as Point);
  point.setPoint(1, 3, { x: (Math.round(rect.left + context.vp2px(60))).toInt(), y: (Math.round(rect.top + context.vp2px(90))).toInt() } as Point);
  await driver.injectMultiPointerAction(point, 200);
}

export default function gestureCreateGestureTest() {

  describe('GestureCreateGestureTest', () => {

    let PAGE_TAG1 = 'GestureCreateGestureTest';
    let PAGE_TAG2 = 'GestureCreateGesture1Test';
    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });
    
    
/**
     * @tc.number   testGestureCreateGesture001
     * @tc.name     testGestureCreateGesture001
     * @tc.desc     testGestureCreateGesture001
     * @tc.level    Level.LEVEL1
     */
    it('testGestureCreateGesture001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`gesture/${PAGE_TAG1}`);
      await Utils.clickComponent('button1')
      await Utils.clickComponent('button2')
      await Utils.clickComponent('button3')
      await Utils.clickComponent('button4')
      await Utils.sleep(600)
      let strJson1 = inspector.getInspectorByKey('button1');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('button2');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('button3');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('button4');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      done();
    })

    
    
/**
     * @tc.number   testGestureCreateGesture002
     * @tc.name     testGestureCreateGesture002
     * @tc.desc     testGestureCreateGesture002
     * @tc.level    Level.LEVEL1
     */
    it('testGestureCreateGesture002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`gesture/${PAGE_TAG1}`);
      await Utils.longClickComponent('button5')
      await Utils.longClickComponent('button6')
      await Utils.longClickComponent('button7')
      await Utils.longClickComponent('button8')
      await Utils.sleep(600)
      let strJson1 = inspector.getInspectorByKey('button5');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('button6');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('button7');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('button8');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    })

    
    
/**
     * @tc.number   testGestureCreateGesture003
     * @tc.name     testGestureCreateGesture003
     * @tc.desc     testGestureCreateGesture003
     * @tc.level    Level.LEVEL1
     */
    it('testGestureCreateGesture003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`gesture/${PAGE_TAG1}`);
      let strJson1 = inspector.getInspectorByKey('button9');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    })

    
    
/**
     * @tc.number   testGestureCreateGesture004
     * @tc.name     testGestureCreateGesture004
     * @tc.desc     testGestureCreateGesture004
     * @tc.level    Level.LEVEL1
     */
    it('testGestureCreateGesture004', Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      let strJson1 = inspector.getInspectorByKey('column1');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('column2');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('column3');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('column4');
      let obj4 = JSON.parseJsonElement(strJson4);
      let strJson5 = inspector.getInspectorByKey('column5');
      let obj5 = JSON.parseJsonElement(strJson5);
      let strJson6 = inspector.getInspectorByKey('column6');
      let obj6 = JSON.parseJsonElement(strJson6);
      let strJson7 = inspector.getInspectorByKey('column7');
      let obj7 = JSON.parseJsonElement(strJson7);
      let strJson8 = inspector.getInspectorByKey('column8');
      let obj8 = JSON.parseJsonElement(strJson8);
      let strJson9 = inspector.getInspectorByKey('column9');
      let obj9 = JSON.parseJsonElement(strJson9);
      let strJson10 = inspector.getInspectorByKey('column10');
      let obj10 = JSON.parseJsonElement(strJson10);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj5.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj6.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj7.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj8.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj9.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj10.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    })

    
    
/**
     * @tc.number   testGestureCreateGesture005
     * @tc.name     testGestureCreateGesture005
     * @tc.desc     testGestureCreateGesture005
     * @tc.level    Level.LEVEL1
     */
    it('testGestureCreateGesture005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureCreateGesture2Test';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await pinchGesture('column1')
      await pinchGesture('column2')
      await pinchGesture('column3')
      await Utils.sleep(600)
      let strJson1 = inspector.getInspectorByKey('column1');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('column2');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('column3');
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    })

    
    
/**
     * @tc.number   testGestureCreateGesture006
     * @tc.name     testGestureCreateGesture006
     * @tc.desc     testGestureCreateGesture006
     * @tc.level    Level.LEVEL1
     */
    it('testGestureCreateGesture006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureCreateGesture2Test';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await rotationGesture('column4')
      await rotationGesture('column5')
      await rotationGesture('column6')
      await rotationGesture('column7')
      await Utils.sleep(600)
      let strJson4 = inspector.getInspectorByKey('column4');
      let obj4 = JSON.parseJsonElement(strJson4);
      let strJson5 = inspector.getInspectorByKey('column5');
      let obj5 = JSON.parseJsonElement(strJson5);
      let strJson6 = inspector.getInspectorByKey('column6');
      let obj6 = JSON.parseJsonElement(strJson6);
      let strJson7 = inspector.getInspectorByKey('column7');
      let obj7 = JSON.parseJsonElement(strJson7);
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj5.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj6.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj7.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    })

    
    
/**
     * @tc.number   testGestureCreateGesture007
     * @tc.name     testGestureCreateGesture007
     * @tc.desc     testGestureCreateGesture007
     * @tc.level    Level.LEVEL1
     */
    it('testGestureCreateGesture007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureCreateGesture3Test';
      await Utils.pushPage(`gesture/${PAGE_TAG}`, false);
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
      let strJson1 = inspector.getInspectorByKey('column1');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('column2');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('column3');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('column4');
      let obj4 = JSON.parseJsonElement(strJson4);
      let strJson5 = inspector.getInspectorByKey('column5');
      let obj5 = JSON.parseJsonElement(strJson5);
      let strJson6 = inspector.getInspectorByKey('column6');
      let obj6 = JSON.parseJsonElement(strJson6);
      let strJson7 = inspector.getInspectorByKey('column7');
      let obj7 = JSON.parseJsonElement(strJson7);
      let strJson8 = inspector.getInspectorByKey('column8');
      let obj8 = JSON.parseJsonElement(strJson8);
      let strJson9 = inspector.getInspectorByKey('column9');
      let obj9 = JSON.parseJsonElement(strJson9);
      let strJson10 = inspector.getInspectorByKey('column10');
      let obj10 = JSON.parseJsonElement(strJson10);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj5.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj6.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj7.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj8.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj9.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj10.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      Utils.sleep(1000)
      done();
    })

    
    
/**
     * @tc.number   testGestureCreateGesture008
     * @tc.name     testGestureCreateGesture008
     * @tc.desc     testGestureCreateGesture008
     * @tc.level    Level.LEVEL1
     */
    it('testGestureCreateGesture008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureCreateGesture4Test';
      await Utils.pushPage(`gesture/${PAGE_TAG}`, false);
      await rotationGesture('rotationGestureWithColumn1')
      await panGesture('swipeGestureWithColumn1', 40, -40, 40, 150)
      await panGesture('swipeGestureWithColumn2', 40, 40, 40, 150)
      await panGesture('panGestureWithColumn1', 40, -40, 40, 150)
      await panGesture('panGestureWithColumn2', 40, 40, 40, 150)
      Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('rotationGestureWithColumn1');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('swipeGestureWithColumn1');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('swipeGestureWithColumn2');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('panGestureWithColumn1');
      let obj4 = JSON.parseJsonElement(strJson4);
      let strJson5 = inspector.getInspectorByKey('panGestureWithColumn2');
      let obj5 = JSON.parseJsonElement(strJson5);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj5.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    })

  })
}