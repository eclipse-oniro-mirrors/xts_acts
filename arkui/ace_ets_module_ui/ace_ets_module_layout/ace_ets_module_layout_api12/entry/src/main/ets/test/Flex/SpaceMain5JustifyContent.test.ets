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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function SpaceMain5JustifyContentJsunit() {
  describe('SpaceMain5JustifyContentJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("SpaceMain5JustifyContent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Flex/SpaceMain5JustifyContent",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SpaceMain5JustifyContent state pages: " + JSON.stringify(pages));
        if (!("SpaceMain5JustifyContent" == pages.name)) {
          console.info("get SpaceMain5JustifyContent state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SpaceMain5JustifyContent success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SpaceMain5JustifyContent page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SpaceMain5JustifyContentTest_0010
     * @tc.name      SpaceMain5JustifyContentTest_0010
     * @tc.desc      Flex space main=5: wrap: FlexWrap.NoWrap
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceMain5JustifyContentTest_0010',  Level.LEVEL0, async (done: Function) => {
      console.info('SpaceMain5JustifyContentTest_0010 START');
      let strJson = getInspectorByKey('SpaceMain5NoWrap_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceMain5JustifyContentTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.wrap).assertEqual("FlexWrap.NoWrap");
      expect(obj.$attrs.space).assertEqual("5.00vp");            
      console.info('[SpaceMain5JustifyContentTest_0010] END');
      done();
    });

    /**
     * @tc.number    SpaceMain5JustifyContentTest_0020
     * @tc.name      SpaceMain5JustifyContentTest_0020
     * @tc.desc      Flex space main=5: justifyContent: FlexAlign.Start
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceMain5JustifyContentTest_0020',  Level.LEVEL0, async (done: Function) => {
      console.info('SpaceMain5JustifyContentTest_0020 START');
      let strJson = getInspectorByKey('SpaceMain5JustifyContent_Start');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceMain5JustifyContentTest_0020] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.justifyContent).assertEqual("FlexAlign.Start");
      expect(obj.$attrs.space).assertEqual("5.00vp");      
      console.info('[SpaceMain5JustifyContentTest_0020] END');
      done();
    }); 

    /**
     * @tc.number    SpaceMain5JustifyContentTest_0030
     * @tc.name      SpaceMain5JustifyContentTest_0030
     * @tc.desc      Flex space main=5: justifyContent: FlexAlign.Center
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceMain5JustifyContentTest_0030',  Level.LEVEL0, async (done: Function) => {
      console.info('SpaceMain5JustifyContentTest_0030 START');
      let strJson = getInspectorByKey('SpaceMain5JustifyContent_Center');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceMain5JustifyContentTest_0030] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.justifyContent).assertEqual("FlexAlign.Center");
      expect(obj.$attrs.space).assertEqual("5.00vp");      
      console.info('[SpaceMain5JustifyContentTest_0030] END');
      done();
    }); 

    /**
     * @tc.number    SpaceMain5JustifyContentTest_0040
     * @tc.name      SpaceMain5JustifyContentTest_0040
     * @tc.desc      Flex space main=5: justifyContent: FlexAlign.End
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceMain5JustifyContentTest_0040',  Level.LEVEL0, async (done: Function) => {
      console.info('SpaceMain5JustifyContentTest_0040 START');
      let strJson = getInspectorByKey('SpaceMain5JustifyContent_End');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceMain5JustifyContentTest_0040] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.justifyContent).assertEqual("FlexAlign.End");
      expect(obj.$attrs.space).assertEqual("5.00vp");      
      console.info('[SpaceMain5JustifyContentTest_0040] END');
      done();
    });

    /**
     * @tc.number    SpaceMain5JustifyContentTest_0050
     * @tc.name      SpaceMain5JustifyContentTest_0050
     * @tc.desc      Flex space main=5: justifyContent: FlexAlign.SpaceBetween
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceMain5JustifyContentTest_0050',  Level.LEVEL0, async (done: Function) => {
      console.info('SpaceMain5JustifyContentTest_0050 START');
      let strJson = getInspectorByKey('SpaceMain5JustifyContent_SpaceBetween');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceMain5JustifyContentTest_0050] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.justifyContent).assertEqual("FlexAlign.SpaceBetween");
      expect(obj.$attrs.space).assertEqual("5.00vp");  
      console.info('[SpaceMain5JustifyContentTest_0050] END');
      done();
    });

    /**
     * @tc.number    SpaceMain5JustifyContentTest_0060
     * @tc.name      SpaceMain5JustifyContentTest_0060
     * @tc.desc      Flex space main=5: justifyContent: FlexAlign.SpaceAround
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceMain5JustifyContentTest_0060',  Level.LEVEL0, async (done: Function) => {
      console.info('SpaceMain5JustifyContentTest_0060 START');
      let strJson = getInspectorByKey('SpaceMain5JustifyContent_SpaceAround');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceMain5JustifyContentTest_0060] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.justifyContent).assertEqual("FlexAlign.SpaceAround");
      expect(obj.$attrs.space).assertEqual("5.00vp");  
      console.info('[SpaceMain5JustifyContentTest_0060] END');
      done();
    }); 

    /**
     * @tc.number    SpaceMain5JustifyContentTest_0070
     * @tc.name      SpaceMain5JustifyContentTest_0070
     * @tc.desc      Flex space main=5: justifyContent: FlexAlign.SpaceEvenly
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SpaceMain5JustifyContentTest_0070',  Level.LEVEL0, async (done: Function) => {
      console.info('SpaceMain5JustifyContentTest_0070 START');
      let strJson = getInspectorByKey('SpaceMain5JustifyContent_SpaceEvenly');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SpaceMain5JustifyContentTest_0070] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.constructor.justifyContent).assertEqual("FlexAlign.SpaceEvenly");
      expect(obj.$attrs.space).assertEqual("5.00vp");
      console.info('[SpaceMain5JustifyContentTest_0070] END');
      done();
    }); 

  })
}

