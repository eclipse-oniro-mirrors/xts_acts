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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';
export default function VTwoToVOneTest0070() {
  describe('VTwoToVOneTest0070', () => {
    beforeEach(async (done: Function) => {
      console.info("VTwoToVOneTest0070 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/v2tov1/VTwoToVOne0070",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("VTwoToVOne0070" == pages.name)) {
          console.info("get VTwoToVOneTest0070 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VTwoToVOneTest0070 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VTwoToVOneTest0070 page error:" + err);
      }
      console.info("VTwoToVOneTest0070 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VTwoToVOneTest0070 after each called");
    });

    /**
     * @tc.number    VTwoToVOneTest0070
     * @tc.name      VTwoToVOneTest0070_001
     * @tc.desc      Persistently store UI related data
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('VTwoToVOneTest0070_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[VTwoToVOneTest0070_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnParent0070"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvParentState0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ParentArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvParentProp0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ParentArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvParentProvide0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ParentArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvParentOL0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ParentArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvChildState0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ParentArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvChildProp0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ParentArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvChildProvide0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ParentArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvChildOL0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ParentArkUI');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnChild0070"));
      await btn1.click();
      await CommonFunc.sleep(1000);
      obj1 = JSON.parse(getInspectorByKey('tvParentState0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ChildArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvParentProp0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ParentArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvParentProvide0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ChildArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvParentOL0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ChildArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvChildState0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ChildArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvChildProp0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ChildArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvChildProvide0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ChildArkUI');
      await CommonFunc.sleep(500);
      obj1 = JSON.parse(getInspectorByKey('tvChildOL0070'));
      console.info("[VTwoToVOneTest0070_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[VTwoToVOneTest0070_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ChildArkUI');
      console.info('[VTwoToVOneTest0070_001] END');
      done();
    });
  })
}
