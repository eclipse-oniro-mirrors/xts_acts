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

import { describe, expect, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton  } from '@kit.TestKit';

async function mouseMoveToCommonEvent(id: string) {
  let driver = Driver.create();
  let component = await driver.findComponent(ON.id(id));
  let point = await component.getBounds();
  await driver.mouseMoveTo({
    x: point.left + 10, y: point.bottom - 10
  });
}

async function MouseClickComponent(id: string, mouseButton: MouseButton , done?: Function) {
  let driver = Driver.create();
  let button = await driver.findComponent(ON.id(id));
  let point = await button.getBounds();
  await driver.mouseClick({x:point.left+10, y:point.top+10}, mouseButton);
}

export default function commonEventEventTest() {

  describe('CommonEventEventTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_0100
    * @tc.name       : testCommonEventO001
    * @tc.desc       : test onHover event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEvent001', 0, async (done: Function) => {
      let PAGE_TAG = 'CommonEventOnHoverTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await mouseMoveToCommonEvent("onHoverTest")
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('onHoverTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_0200
    * @tc.name       : testCommonEvent002
    * @tc.desc       : test onMouse event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEvent002', 0, async (done: Function) => {
      let PAGE_TAG = 'CommonEventOnMouseTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await MouseClickComponent('onMouseRightTest',MouseButton.MOUSE_BUTTON_RIGHT);
      await MouseClickComponent('onMouseLeftTest',MouseButton.MOUSE_BUTTON_LEFT);
      await MouseClickComponent('onMouseMiddleTest',MouseButton.MOUSE_BUTTON_MIDDLE);
      await mouseMoveToCommonEvent("onMouseMoveTest")
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('onMouseRightTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('onMouseLeftTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('onMouseMiddleTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('onMouseMoveTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_0300
    * @tc.name       : testCommonEvent003
    * @tc.desc       : test onDisappear event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEvent003', 0, async (done: Function) => {
      let PAGE_TAG = 'CommonEventOnDisappearTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('onDisappearTestButtonClick');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('OnDisappearTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_0400
    * @tc.name       : testCommonEvent004
    * @tc.desc       : test onVisibleAreaChange event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEvent004', 0, async (done: Function) => {
      let PAGE_TAG = 'CommonEventOnVisibleAreaChangeTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('onVisibleAreaChangeTestButtonClick');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('OnVisibleAreaChangeTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_0500
    * @tc.name       : testCommonEvent005
    * @tc.desc       : test onTouchPropagation event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEvent005', 0, async (done: Function) => {
      let PAGE_TAG = 'CommonEventOnTouchPropagationTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('buttonPropagation');
      await Utils.clickComponent('buttonStopPropagation');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('OnTouchPropagationTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('OnTouchStopPropagationTest').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_0600
    * @tc.name       : testCommonEvent006
    * @tc.desc       : test onTouchInterceptDefault event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEvent006', 0, async (done: Function) => {
      let PAGE_TAG = 'CommonEventOnTouchInterceptDefaultTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('defaultItself');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('defaultItself').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('defaultParent').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('defaultBrother').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('defaultChild').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_0700
    * @tc.name       : testCommonEvent007
    * @tc.desc       : test onTouchInterceptBlock event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEvent007', 0, async (done: Function) => {
      let PAGE_TAG = 'CommonEventOnTouchInterceptBlockTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('blockItself');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('blockItself').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('blockParent').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('blockBrother').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('blockChild').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_0800
    * @tc.name       : testCommonEvent008
    * @tc.desc       : test onTouchInterceptTransparent event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEvent008', 0, async (done: Function) => {
      let PAGE_TAG = 'CommonEventOnTouchInterceptTransparentTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('transparentItself');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('transparentItself').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('transparentParent').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('transparentBrother').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('transparentChild').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_0900
    * @tc.name       : testCommonEvent009
    * @tc.desc       : test onTouchInterceptNone event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEvent009', 0, async (done: Function) => {
      let PAGE_TAG = 'CommonEventOnTouchInterceptNoneTest';
      await Utils.pushPage(`commonevent/${PAGE_TAG}`);
      await Utils.clickComponent('noneItself');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('noneItself').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('noneParent').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('noneBrother').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('noneChild').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })
  })
}
