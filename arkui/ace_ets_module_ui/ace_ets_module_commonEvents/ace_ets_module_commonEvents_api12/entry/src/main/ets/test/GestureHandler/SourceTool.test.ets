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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, Component, Driver, ON, BY, MouseButton} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function SourceToolTest() {

  describe('SourceToolTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/SourceTool',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SourceTool state pages: " + JSON.stringify(pages));
        if (!("SourceTool" == pages.name)) {
          console.info("get SourceTool state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SourceTool success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SourceTool page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SourceTool after each called");
    });

    /**
     * @tc.number    SourceTool_0010
     * @tc.name      SourceTool: SourceTool.MOUSE
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SourceTool_0010', Level.LEVEL0, async (done: Function) => {
      console.info('SourceTool_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      
      let button: Component = await driver.findComponent(ON.id('PanGestureSourceToolColumn'));
      
      let point = await button.getBoundsCenter();
      
      await driver.mouseClick(point,MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sourceTool1_id');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('7');
      console.info('[SourceTool_0010] END');
      done();
    });

    /**
     * @tc.number    SourceTool_0020
     * @tc.name      SourceTool: SourceTool.TOUCHPAD
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SourceTool_0020', Level.LEVEL0, async (done: Function) => {
      console.info('SourceTool_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('PanGestureSourceToolColumn');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await driver.swipe(Math.round(left + 20), Math.round((top + bottom) / 2),
        Math.round(right - 20), Math.round((top + bottom) / 2));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sourceTool1_id');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('1');
      console.info('[SourceTool_0020] END');
      done();
    });

    /**
     * @tc.number    SourceTool_0030
     * @tc.name      SourceTool: SourceTool.JOYSTICK
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SourceTool_0030', Level.LEVEL0, async (done: Function) => {
      console.info('SourceTool_0030 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('changeSourceTool3_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sourceTool1_id');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('10');
      console.info('[SourceTool_0030] END');
      done();
    });

    /**
     * @tc.number    axisHorizontal_0040
     * @tc.name      axisHorizontal
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('axisHorizontal_0040', Level.LEVEL0, async (done: Function) => {
      console.info('axisHorizontal_0040 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('PanGestureSourceToolColumn');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await driver.swipe(Math.round(left + 20), Math.round((top + bottom) / 2),
        Math.round(right - 20), Math.round((top + bottom) / 2));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('axisHorizontal_id');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('0');
      console.info('[axisHorizontal_0040] END');
      done();
    });

    /**
     * @tc.number    axisVertical_0050
     * @tc.name      axisVertical
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('axisVertical_0050', Level.LEVEL0, async (done: Function) => {
      console.info('axisVertical_0050 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('PanGestureSourceToolColumn');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await driver.swipe(Math.round(left + 20), Math.round((top + bottom) / 2),
        Math.round(right - 20), Math.round((top + bottom) / 2));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('axisVertical_id');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('0');
      console.info('[axisVertical_0050] END');
      done();
    });
  })
}
