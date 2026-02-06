/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function refreshOffsetChangeJsunit() {
  describe('refreshOffsetChangeJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("refreshOffsetChangeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshOffsetChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get refreshOffsetChangeJsunit state pages: " + JSON.stringify(pages));
        if (!("refreshOffsetChange" == pages.name)) {
          console.info("get refreshOffsetChangeJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push refreshOffsetChangeJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push refreshOffsetChangeJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" refreshOffsetChangeJsunit after each called");
    });

    /**
    * @tc.number: SUB_ACE_REFRESH_REFRESHOFFSET_0100
    * @tc.name  : refreshOffsetChangeJsunit_0100
    * @tc.desc  : Add refreshOffset and pullToRefresh interfaces.
    * @tc.level : Level 1
    */
    it('refreshOffsetChangeJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('refreshOffsetChangeJsunit_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Refresh_Offset2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[refreshOffsetChangeJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[refreshOffsetChangeJsunit_0100] refreshOffset: " + JSON.stringify(obj.$attrs.refreshOffset));
      expect(obj.$attrs.refreshOffset).assertEqual('400.00vp');
      console.info('[refreshOffsetChangeJsunit_0100] END');
      done();
    });

    /**
    * @tc.number: SUB_ACE_REFRESH_REFRESHOFFSET_0200
    * @tc.name  : refreshOffsetChangeJsunit_0200
    * @tc.desc  : trigger onOffsetChange callback.
    * @tc.level : Level 1
    */
    it('refreshOffsetChangeJsunit_0200', Level.LEVEL1, async (done: Function) => {
      console.info('refreshOffsetChangeJsunit_0200 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset2');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.2),Math.round(bottom - height/2),Math.round(left + width*0.2),Math.round(top));
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('refresh_mess2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[refreshOffsetChangeJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('message');
      console.info('[refreshOffsetChangeJsunit_0200] END');
      done();
    });
    
    /**
    * @tc.number: SUB_ACE_REFRESH_REFRESHOFFSET_0300
    * @tc.name  : refreshOffsetChangeJsunit_0300
    * @tc.desc  : trigger onOffsetChange callback.
    * @tc.level : Level 1
    */
    it('refreshOffsetChangeJsunit_0300', Level.LEVEL1, async (done: Function) => {
      console.info('refreshOffsetChangeJsunit_0300 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset3');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_0300 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.2),Math.round(top + height/10),Math.round(left + width*0.2),Math.round(bottom));
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('refresh_mess3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[refreshOffsetChangeJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onOffsetChange');
      console.info('[refreshOffsetChangeJsunit_0300] END');
      done();
    });

    /**
    * @tc.number: SUB_ACE_REFRESH_REFRESHOFFSET_0400
    * @tc.name  : refreshOffsetChangeJsunit_0400
    * @tc.desc  : trigger onOffsetChange callback.
    * @tc.level : Level 1
    */
    it('refreshOffsetChangeJsunit_0400', Level.LEVEL1, async (done: Function) => {
      console.info('refreshOffsetChangeJsunit_0400 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset1');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_0400 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.2),Math.round(top + height/10),Math.round(left + width*0.2),Math.round(bottom));
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('refresh_mess1_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[refreshOffsetChangeJsunit_0400] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).not().assertEqual('message');

      let strJson2 = getInspectorByKey('refresh_mess1_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[refreshOffsetChangeJsunit_0400] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).not().assertEqual('message');

      let strJson3 = getInspectorByKey('refresh_mess1_3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[refreshOffsetChangeJsunit_0400] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('onRefreshing');
      console.info('[refreshOffsetChangeJsunit_0400] END');
      done();
    });

    /**
    * @tc.number: SUB_ACE_REFRESH_REFRESHOFFSET_0500
    * @tc.name  : refreshOffsetChangeJsunit_0500
    * @tc.desc  : trigger onOffsetChange callback.
    * @tc.level : Level 1
    */
    it('refreshOffsetChangeJsunit_0500', Level.LEVEL1, async (done: Function) => {
      console.info('refreshOffsetChangeJsunit_0500 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset2');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_0500 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.2),Math.round(top + height/10),Math.round(left + width*0.2),Math.round(bottom));
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('refresh_mess2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[refreshOffsetChangeJsunit_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onOffsetChange');
      console.info('[refreshOffsetChangeJsunit_0500] END');
      done();
    });

    /**
    * @tc.number: SUB_ACE_REFRESH_REFRESHOFFSET_0600
    * @tc.name  : refreshOffsetChangeJsunit_0600
    * @tc.desc  : trigger onOffsetChange callback.
    * @tc.level : Level 1
    */
    it('refreshOffsetChangeJsunit_0600', Level.LEVEL1, async (done: Function) => {
      console.info('refreshOffsetChangeJsunit_0600 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset1');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_0600 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.drag(Math.round(left + width*0.2),Math.round(top + height*0.1),Math.round(left + width*0.2),Math.round(top + height*0.25));
      await driver.swipe(Math.round(left + width*0.2),Math.round(top + height*0.25),Math.round(left + width*0.2),Math.round(top + height/8));
      let strJson = getInspectorByKey('refresh_mess1_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[refreshOffsetChangeJsunit_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onOffsetChange-');
      console.info('[refreshOffsetChangeJsunit_0600] END');
      done();
    });

    /**
    * @tc.number: SUB_ACE_REFRESH_REFRESHOFFSET_0700
    * @tc.name  : refreshOffsetChangeJsunit_0700
    * @tc.desc  : trigger onOffsetChange callback.
    * @tc.level : Level 1
    */
    it('refreshOffsetChangeJsunit_0700', Level.LEVEL1, async (done: Function) => {
      console.info('refreshOffsetChangeJsunit_0700 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset1');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_0700 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.2),Math.round(top + height*0.1),Math.round(left + width*0.2),Math.round(top + height*0.7));
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('refresh_mess1_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[refreshOffsetChangeJsunit_0700] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('onStateChange:3');

      await driver.swipe(Math.round(left + width*0.2),Math.round(top + height*0.5),Math.round(left + width*0.2),Math.round(top + height*0.4));
      let strJson = getInspectorByKey('refresh_mess1_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[refreshOffsetChangeJsunit_0700] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onOffsetChange-');
      console.info('[refreshOffsetChangeJsunit_0700] END');
      done();
    });

    /**
    * @tc.number: SUB_ACE_REFRESH_REFRESHOFFSET_0800
    * @tc.name  : refreshOffsetChangeJsunit_0800
    * @tc.desc  : trigger onOffsetChange callback.
    * @tc.level : Level 1
    */
    it('refreshOffsetChangeJsunit_0800', Level.LEVEL1, async (done: Function) => {
      console.info('refreshOffsetChangeJsunit_0800 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset1');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_0800 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.2),Math.round(top + height*0.1),Math.round(left + width*0.2),Math.round(top + height*0.5));
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('refresh_mess1_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[refreshOffsetChangeJsunit_0800] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('onStateChange:3');

      await driver.swipe(Math.round(left + width*0.2),Math.round(top + height*0.5),Math.round(left + width*0.2),Math.round(top + height*0.8));
      let strJson = getInspectorByKey('refresh_mess1_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[refreshOffsetChangeJsunit_0800] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onOffsetChange+');
      console.info('[refreshOffsetChangeJsunit_0800] END');
      done();
    });

    /**
    * @tc.number: SUB_ACE_REFRESH_REFRESHOFFSET_0900
    * @tc.name  : refreshOffsetChangeJsunit_0900
    * @tc.desc  : trigger onOffsetChange callback.
    * @tc.level : Level 1
    */
    it('refreshOffsetChangeJsunit_0900', Level.LEVEL1, async (done: Function) => {
      console.info('refreshOffsetChangeJsunit_0900 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('changeOrientation'));
      await button.click();
      await CommonFunc.sleep(1000);

      let swiperOffset = CommonFunc.getComponentRectOnScreen('Refresh_Offset3');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("refreshOffsetChangeJsunit_0900 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;

      await driver.swipe(Math.round(left + width*0.2),Math.round(top + height/10),Math.round(left + width*0.2),Math.round(bottom));
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('refresh_mess2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[refreshOffsetChangeJsunit_0900] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onOffsetChange');
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[refreshOffsetChangeJsunit_0900] END');
      done();
    });

  })
}