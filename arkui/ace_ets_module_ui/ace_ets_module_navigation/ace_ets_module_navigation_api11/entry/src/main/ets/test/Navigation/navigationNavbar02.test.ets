/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function navigationNavbar02() {
  describe('navigationNavbar02',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("navigationNavbar02 beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationNavbar02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get navigationNavbar02 state pages: " + JSON.stringify(pages));
        if (!("navigationNavbar02" == pages.name)) {
          console.info("get navigationNavbar02 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigationNavbar02 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push navigationNavbar02 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_023
       * @tc.name  : navigationNavbar02_001
       * @tc.desc  : Set navbarWidth to -2
       * @tc.level : Level 2
       */
    it('navigationNavbar02_001', 0, async  (done:Function) =>{

      console.info('[navigationNavbar02_001] START');
      globalThis.value.message.notify({name:'navBarWidth', value: -2 });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigationNavbar');
      
      console.info("[navigationNavbar02_001] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.navBarWidth).assertEqual('240.00vp');
      console.info('[navigationNavbar02_001] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_022
       * @tc.name  : navigationNavbar02_002
       * @tc.desc  : Set navbarWidth to 0
       * @tc.level : Level 2
       */
    it('navigationNavbar02_002', 0, async  (done:Function) =>{

      console.info('[navigationNavbar02_002] START');
      globalThis.value.message.notify({name:'navBarWidth', value: 0 });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigationNavbar');
      
      console.info("[navigationNavbar02_002] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.navBarWidth).assertEqual('240.00vp');

      console.info('[navigationNavbar02_002] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_021
       * @tc.name  : navigationNavbar02_003
       * @tc.desc  : Set navbarWidth to 260
       * @tc.level : Level 2
       */
    it('navigationNavbar02_003', 0, async  (done:Function) =>{

      console.info('[navigationNavbar02_003] START');
      globalThis.value.message.notify({name:'navBarWidth', value: 260 });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigationNavbar');
      
      console.info("[navigationNavbar02_003] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.navBarWidth).assertEqual('260.00vp');

      console.info('[navigationNavbar02_003] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_015 013
       * @tc.name  : navigationNavbar02_004
       * @tc.desc  : Set mode to NavigationMode.Stack
       * @tc.level : Level 2
       */
    it('navigationNavbar02_004', 0, async  (done:Function) =>{

      console.info('[navigationNavbar02_004] START');
      globalThis.value.message.notify({name:'navModeIndex', value: 1 });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigationNavbar');
      
      console.info("[navigationNavbar02_004] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.mode).assertEqual('NavigationMode.STACK');

      console.info('[navigationNavbar02_004] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_020 019
       * @tc.name  : navigationNavbar02_005
       * @tc.desc  : Set hideNavBar to true
       * @tc.level : Level 2
       */
    it('navigationNavbar02_005', 0, async  (done:Function) =>{

      console.info('[navigationNavbar02_005] START');
      globalThis.value.message.notify({name:'hideNavBar', value: true });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigationNavbar');
      
      console.info("[navigationNavbar02_005] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.hideNavBar).assertEqual(true);

      console.info('[navigationNavbar02_005] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_011
       * @tc.name  : navigationNavbar02_006
       * @tc.desc  : Set minContentWidth to -2
       * @tc.level : Level 2
       */
    it('navigationNavbar02_006', 0, async  (done:Function) =>{

      console.info('[navigationNavbar02_006] START');
      globalThis.value.message.notify({name:'minContentWidth', value: -2 });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigationNavbar');
      
      console.info("[navigationNavbar02_006] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual('360.00vp');

      console.info('[navigationNavbar02_006] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_010
       * @tc.name  : navigationNavbar02_007
       * @tc.desc  : Set minContentWidth to 0
       * @tc.level : Level 2
       */
    // it('navigationNavbar02_007', 0, async  (done:Function) =>{
    //
    //   console.info('[navigationNavbar02_007] START');
    //   globalThis.value.message.notify({name:'minContentWidth', value: 0 });
    //   await CommonFunc.sleep(1000);
    //   let strJson = getInspectorByKey('navigationNavbar');
    //   
    //   console.info("[navigationNavbar02_007] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
    //   await CommonFunc.sleep(1000);
    //   expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual('360.00vp');
    //
    //   console.info('[navigationNavbar02_007] END');
    //   done();
    // });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_009
       * @tc.name  : navigationNavbar02_008
       * @tc.desc  : Set minContentWidth to 360
       * @tc.level : Level 2
       */
    it('navigationNavbar02_008', 0, async  (done:Function) =>{

      console.info('[navigationNavbar02_008] START');
      globalThis.value.message.notify({name:'minContentWidth', value: 360 });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigationNavbar');
      
      console.info("[navigationNavbar02_008] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.minContentWidth).assertEqual('360.00vp');

      console.info('[navigationNavbar02_008] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_014
       * @tc.name  : navigationNavbar02_009
       * @tc.desc  : Set mode to NavigationMode.Split
       * @tc.level : Level 2
       */
    it('navigationNavbar02_009', 0, async  (done:Function) =>{

      console.info('[navigationNavbar02_011] START');
      globalThis.value.message.notify({name:'navModeIndex', value: 0 });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigationNavbar');
      
      console.info("[navigationNavbar02_011] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.mode).assertEqual('NavigationMode.SPLIT');

      console.info('[navigationNavbar02_011] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_COMPONENT_SR000I1RO8_012
       * @tc.name  : navigationNavbar02_010
       * @tc.desc  : Set mode to NavigationMode.Auto
       * @tc.level : Level 2
       */
    it('navigationNavbar02_010', 0, async  (done:Function) =>{

      console.info('[navigationNavbar02_012] START');
      globalThis.value.message.notify({name:'navModeIndex', value: 2 });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('navigationNavbar');
      
      console.info("[navigationNavbar02_012] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.mode).assertEqual('NavigationMode.AUTO');

      console.info('[navigationNavbar02_012] END');
      done();
    });
  })
}
