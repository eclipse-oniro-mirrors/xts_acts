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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function getAttrsTest() {
  describe('getAttrsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("getAttrsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/getAttrs",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getAttrsTest state pages: " + JSON.stringify(pages));
        if (!("getAttrs" == pages.name)) {
          console.info("get getAttrsTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getAttrsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getAttrsTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    getAttrsTest_0100
     * @tc.name      getAttrsTest_0100
     * @tc.desc      frameNode: getPositionToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getAttrsTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('getAttrsTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getPositionToWindow'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('FrameNode_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAttrsTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content != '{"x":0,"y":0}').assertTrue();
      console.info('[getAttrsTest_0100] END');
      done();
    });
    /**
     * @tc.number    getAttrsTest_0200
     * @tc.name      getAttrsTest_0200
     * @tc.desc      frameNode: getPositionToParent
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getAttrsTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('getAttrsTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getPositionToParent'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('FrameNode_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAttrsTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content != '{"x":0,"y":0}').assertTrue();
      console.info('[getAttrsTest_0200] END');
      done();
    });
    /**
     * @tc.number    getAttrsTest_0300
     * @tc.name      getAttrsTest_0300
     * @tc.desc      frameNode: getMeasuredSize
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getAttrsTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('getAttrsTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getMeasuredSize'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('FrameNode_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAttrsTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content != '{"width":300,"height":50}').assertTrue();
      console.info('[getAttrsTest_0300] END');
      done();
    });
    /**
     * @tc.number    getAttrsTest_0400
     * @tc.name      getAttrsTest_0400
     * @tc.desc      frameNode: getLayoutPosition
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getAttrsTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('getAttrsTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getLayoutPosition'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('FrameNode_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAttrsTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content != '{"x":0,"y":0}').assertTrue();
      console.info('[getAttrsTest_0400] END');
      done();
    });
    /**
     * @tc.number    getAttrsTest_0500
     * @tc.name      getAttrsTest_0500
     * @tc.desc      frameNode: getUserConfigBorderWidth
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getAttrsTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('getAttrsTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getUserConfigBorderWidth'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('FrameNode_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAttrsTest_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('{"top":{"unit":1,"value":3},"right":{"unit":1,"value":3},"bottom":{"unit":1,"value":3},"left":{"unit":1,"value":3}}');
      console.info('[getAttrsTest_0500] END');
      done();
    });
    /**
     * @tc.number    getAttrsTest_0600
     * @tc.name      getAttrsTest_0600
     * @tc.desc      frameNode: getUserConfigPadding
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getAttrsTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('getAttrsTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getUserConfigPadding'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('FrameNode_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAttrsTest_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('{"top":{"unit":1,"value":10},"right":{"unit":1,"value":10},"bottom":{"unit":1,"value":10},"left":{"unit":1,"value":10}}');
      console.info('[getAttrsTest_0600] END');
      done();
    });
    /**
     * @tc.number    getAttrsTest_0700
     * @tc.name      getAttrsTest_0700
     * @tc.desc      frameNode: getUserConfigMargin
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getAttrsTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('getAttrsTest_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getUserConfigMargin'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('FrameNode_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAttrsTest_0700] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('{"top":{"unit":1,"value":20},"right":{"unit":1,"value":20},"bottom":{"unit":1,"value":20},"left":{"unit":1,"value":20}}');
      console.info('[getAttrsTest_0700] END');
      done();
    });
    /**
     * @tc.number    getAttrsTest_0800
     * @tc.name      getAttrsTest_0800
     * @tc.desc      frameNode: getUserConfigSize
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getAttrsTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('getAttrsTest_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getUserConfigSize'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('FrameNode_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAttrsTest_0800] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('{"width":{"unit":1,"value":300},"height":{"unit":1,"value":50}}');
      console.info('[getAttrsTest_0800] END');
      done();
    });
    /**
     * @tc.number    getAttrsTest_0900
     * @tc.name      getAttrsTest_0900
     * @tc.desc      frameNode: getUniqueId
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getAttrsTest_0900', Level.LEVEL0, async (done: Function) => {
      console.info('getAttrsTest_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getUniqueId'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('FrameNode_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAttrsTest_0900] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content != "0").assertTrue();
      console.info('[getAttrsTest_0900] END');
      done();
    });
    /**
     * @tc.number    getAttrsTest_1000
     * @tc.name      getAttrsTest_1000
     * @tc.desc      frameNode: getCustomProperty
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getAttrsTest_1000', Level.LEVEL0, async (done: Function) => {
      console.info('getAttrsTest_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getCustomProperty'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('FrameNode_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAttrsTest_1000] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual("undefined");
      console.info('[getAttrsTest_1000] END');
      done();
    });
    /**
     * @tc.number    getAttrsTest_1100
     * @tc.name      getAttrsTest_1100
     * @tc.desc      frameNode: get commonAttribute()
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getAttrsTest_1100', Level.LEVEL0, async (done: Function) => {
      console.info('getAttrsTest_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getCommonAttribute'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('FrameNode_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAttrsTest_1100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual("undefined");
      console.info('[getAttrsTest_1100] END');
      done();
    });
  })
}