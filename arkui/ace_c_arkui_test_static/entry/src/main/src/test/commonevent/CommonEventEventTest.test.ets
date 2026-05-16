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

import { describe, expect, it, afterEach, Level,beforeAll,beforeEach } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton,Component,Point } from '@kit.TestKit';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

async function mouseMoveToCommonEvent(id: string) {
  let driver = Driver.create();
  let component:Component = await driver.findComponent(ON.id(id)) as Component;
  let point = await component.getBounds();
  await driver.mouseMoveTo({
    x: point.left + 10, y: point.bottom - 10
  } as Point);
}

async function MouseClickComponent(id: string, mouseButton: MouseButton , done?: Function) {
  let driver = Driver.create();
  let button:Component = await driver.findComponent(ON.id(id)) as Component;
  let point = await button.getBounds();
  await driver.mouseClick({x:point.left+10, y:point.top+10} as Point, mouseButton);
}

export default function commonEventEventTest() {

  describe('CommonEventEventTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonEvent001
     * @tc.name     testCommonEvent001
     * @tc.desc     testCommonEvent001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonEvent001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'CommonEventOnHoverTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await mouseMoveToCommonEvent("onHoverTest")
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onHoverTest');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

    
    
/**
     * @tc.number   testCommonEvent002
     * @tc.name     testCommonEvent002
     * @tc.desc     testCommonEvent002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonEvent002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'CommonEventOnMouseTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await MouseClickComponent('onMouseRightTest',MouseButton.MOUSE_BUTTON_RIGHT);
      await MouseClickComponent('onMouseLeftTest',MouseButton.MOUSE_BUTTON_LEFT);
      await MouseClickComponent('onMouseMiddleTest',MouseButton.MOUSE_BUTTON_MIDDLE);
      await mouseMoveToCommonEvent("onMouseMoveTest")
      await Utils.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('onMouseRightTest');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('onMouseLeftTest');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('onMouseMiddleTest');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('onMouseMoveTest');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

    
    
/**
     * @tc.number   testCommonEvent003
     * @tc.name     testCommonEvent003
     * @tc.desc     testCommonEvent003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonEvent003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'CommonEventOnDisappearTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('onDisappearTestButtonClick');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('OnDisappearTest');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

    
    
/**
     * @tc.number   testCommonEvent004
     * @tc.name     testCommonEvent004
     * @tc.desc     testCommonEvent004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonEvent004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'CommonEventOnVisibleAreaChangeTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('onVisibleAreaChangeTestButtonClick');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('OnVisibleAreaChangeTest');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

    
    
/**
     * @tc.number   testCommonEvent005
     * @tc.name     testCommonEvent005
     * @tc.desc     testCommonEvent005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonEvent005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'CommonEventOnTouchPropagationTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('buttonPropagation');
      await Utils.clickComponent('buttonStopPropagation');
      await Utils.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('OnTouchPropagationTest');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('OnTouchStopPropagationTest');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      done()
    })

    
    
/**
     * @tc.number   testCommonEvent006
     * @tc.name     testCommonEvent006
     * @tc.desc     testCommonEvent006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonEvent006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'CommonEventOnTouchInterceptDefaultTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('defaultItself');
      await Utils.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('defaultItself');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('defaultParent');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('defaultBrother');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('defaultChild');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

    
    
/**
     * @tc.number   testCommonEvent007
     * @tc.name     testCommonEvent007
     * @tc.desc     testCommonEvent007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonEvent007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'CommonEventOnTouchInterceptBlockTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('blockItself');
      await Utils.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('blockItself');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('blockParent');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('blockBrother');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('blockChild');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      done()
    })

    
    
/**
     * @tc.number   testCommonEvent008
     * @tc.name     testCommonEvent008
     * @tc.desc     testCommonEvent008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonEvent008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'CommonEventOnTouchInterceptTransparentTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('transparentItself');
      await Utils.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('transparentItself');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('transparentParent');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('transparentBrother');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('transparentChild');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

    
    
/**
     * @tc.number   testCommonEvent009
     * @tc.name     testCommonEvent009
     * @tc.desc     testCommonEvent009
     * @tc.level    Level.LEVEL1
     */
    it('testCommonEvent009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'CommonEventOnTouchInterceptNoneTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('noneItself');
      await Utils.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('noneItself');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('noneParent');
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('noneBrother');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('noneChild');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })
  })
}
