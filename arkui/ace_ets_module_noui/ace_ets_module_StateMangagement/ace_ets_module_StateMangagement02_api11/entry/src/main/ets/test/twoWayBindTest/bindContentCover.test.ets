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
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function bindContentCoverTest() {
  describe('bindContentCoverTest', () => {
    beforeEach(async (done: Function) => {
      console.info("bindContentCoverTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/twoWayBind/bindContentCover',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindContentCoverTest state pages: " + JSON.stringify(pages));
        if (!("bindContentCover" == pages.name)) {
          console.info("get bindContentCoverTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push bindContentCoverTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindContentCoverTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_ACE_STATUSMANAGER_$$CAPABILITY_0260
     * @tc.name      bindContentCoverTest_0100
     * @tc.desc      api
     * @tc.level:    Level 1
     * @tc.type :    FUNC
     * @tc.size :    MEDIUM
     */
    it('bindContentCoverTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('bindContentCoverTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('bindContentText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[bindContentCoverTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow: false');
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('bindContentText1');
      obj = JSON.parse(strJson);
      console.info("[bindContentCoverTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow2: false');
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnBindContent1'));
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('bindContentText2');
      obj = JSON.parse(strJson);
      console.info("[bindContentCoverTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow: true');
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('bindContentText3');
      obj = JSON.parse(strJson);
      console.info("[bindContentCoverTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow2: false');
      await CommonFunc.sleep(1000);
      button = await driver.findComponent(ON.id('btnBindContent3'));
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('bindContentText4');
      obj = JSON.parse(strJson);
      console.info("[bindContentCoverTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow: true');
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('bindContentText5');
      obj = JSON.parse(strJson);
      console.info("[bindContentCoverTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow2: true');
      await CommonFunc.sleep(1000);
      button = await driver.findComponent(ON.id('btnBindContent4'));
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('bindContentText2');
      obj = JSON.parse(strJson);
      console.info("[bindContentCoverTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow: true');
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('bindContentText3');
      obj = JSON.parse(strJson);
      console.info("[bindContentCoverTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow2: false');
      await CommonFunc.sleep(1000);
      button = await driver.findComponent(ON.id('btnBindContent2'));
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('bindContentText');
      obj = JSON.parse(strJson);
      console.info("[bindContentCoverTest_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow: false');
      await CommonFunc.sleep(1000);
      strJson = getInspectorByKey('bindContentText1');
      obj = JSON.parse(strJson);
      console.info("[bindContentCoverTest_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isShow2: false');
      console.info('[bindContentCoverTest_0100] END');
      done();
    });
  })
}