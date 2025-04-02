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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
export default function Component3DTest() {
  describe('Component3DTest', ()=> {
    beforeEach(async (done:Function)=> {
      console.info("Component3DTest beforeEach start");
      let options :router.RouterOptions= {
        url: 'MainAbility/pages/Component3D',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Component3DTest state pages: " + JSON.stringify(pages));
        if (!("Component3D" == pages.name)) {
          console.info("get Component3DTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(5000);
          console.info("push Component3DTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Component3DTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Component3D
     * @tc.name      Component3DTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Component3DTest_0100', 0, async (done:Function)=> {
      console.info('Component3DTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Component3D_1');
      let obj:ESObject = JSON.parse(strJson);
      console.info('Component3DTest_0100 START'+obj.$attrs.shaderImageTexture)
      expect(obj.$attrs.shaderImageTexture).assertEqual('OhosRawFile://assets/London.jpg ');
      console.info('[Component3DTest_0100] END');
      done();
    });
    /**
     * @tc.number    Component3D
     * @tc.name      Component3DTest_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Component3DTest_0200', 0, async (done:Function)=> {
      console.info('Component3DTest_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Component3D_1');
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$attrs.shaderInputBuffer).assertEqual('1.000000 2.000000 ');
      console.info('[Component3DTest_0200] END');
      done();
    });
    /**
     * @tc.number    Component3D
     * @tc.name      Component3DTest_0300
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Component3DTest_0300', 0, async (done:Function)=> {
      console.info('Component3DTest_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Component3D_1');
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$attrs.customRender).assertEqual('OhosRawFile://assets/app/rendernodegraphs/London.rng');
      console.info('[Component3DTest_0300] END');
      done();
    });
    /**
     * @tc.number    Component3D
     * @tc.name      Component3DTest_0400
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Component3DTest_0400', 0, async (done:Function)=> {
      console.info('Component3DTest_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Component3D_1');
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$attrs.environment).assertEqual('OhosRawFile://gltf/Environment/glTF/Environment.gltf');
      console.info('[Component3DTest_0400] END');
      done();
    });
    /**
     * @tc.number    Component3D
     * @tc.name      Component3DTest_0500
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Component3DTest_0500', 0, async (done:Function)=> {
      console.info('Component3DTest_0500 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Component3D_1');
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$attrs.scene).assertEqual('OhosRawFile://gltf/DamagedHelmet/glTF/DamagedHelmet.gltf');
      console.info('[Component3DTest_0500] END');
      done();
    });
    /**
     * @tc.number    Component3D
     * @tc.name      Component3DTest_0600
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Component3DTest_0600', 0, async (done:Function)=> {
      console.info('Component3DTest_0600 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Component3D_1');
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$attrs.modelType).assertEqual('ModelType.SURFACE');
      console.info('[Component3DTest_0600] END');
      done();
    });
    /**
     * @tc.number    Component3D
     * @tc.name      Component3DTest_0700
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Component3DTest_0700', 0, async (done:Function)=> {
      console.info('Component3DTest_0700 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Component3D_1');
      let obj:ESObject = JSON.parse(strJson);
      expect(obj.$attrs.shader).assertEqual('OhosRawFile://assets/app/shaders/shader/London.shader');
      console.info('[Component3DTest_0700] END');
      done();
    });
  })
}

