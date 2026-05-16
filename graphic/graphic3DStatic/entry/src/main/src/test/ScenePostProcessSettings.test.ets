/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Camera,
  Light,
  Material,
  PolygonMode,
  Environment,
  Quaternion,
  RenderingPipelineType,
  Scene,
  SceneResourceFactory,
  NodeType,
  LightType,
  MaterialType,
  VignetteSettings,
  ColorFringeSettings,
  PostProcessSettings
} from '@ohos.graphics.scene'
import { $rawfile, Resource } from '@ohos.arkui.component'
import { describe, expect, it, Level, Size, TestType } from '../../../hypium/index'

export default function scenePostProcessSettingsTest() {
  describe('scenePostProcessSettingsTest', () => {
    /**
     * @tc.name   testCameraMsaa
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1010
     * @tc.desc   Test Camera.msaa property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCameraMsaa', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testCameraMsaa";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let camera: Camera = await rf.createCamera({ name: "TestCamera" });
        expect(camera != null).assertTrue();
        
        camera.msaa = true;
        expect(camera.msaa).assertTrue();
        console.info(msg + " msaa set to true successfully");
        
        camera.msaa = false;
        expect(camera.msaa).assertFalse();
        console.info(msg + " msaa set to false successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCameraRenderingPipeline
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1020
     * @tc.desc   Test Camera.renderingPipeline property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCameraRenderingPipeline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testCameraRenderingPipeline";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let camera: Camera = await rf.createCamera({ name: "TestCamera" });
        expect(camera != null).assertTrue();
        
        camera.renderingPipeline = RenderingPipelineType.FORWARD;
        expect(camera.renderingPipeline).assertEqual(RenderingPipelineType.FORWARD);
        console.info(msg + " renderingPipeline set to FORWARD successfully");
        
        camera.renderingPipeline = RenderingPipelineType.FORWARD_LIGHTWEIGHT;
        expect(camera.renderingPipeline).assertEqual(RenderingPipelineType.FORWARD_LIGHTWEIGHT);
        console.info(msg + " renderingPipeline set to FORWARD_LIGHTWEIGHT successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testLightIntensityPostProcess
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1030
     * @tc.desc   Test Light.intensity property getter and setter in PostProcessSettings context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLightIntensityPostProcess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testLightIntensityPostProcess";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();

        let rf: SceneResourceFactory = scene.getResourceFactory();
        let light: Light = await rf.createLight({ name: "TestLight" }, LightType.DIRECTIONAL);
        expect(light != null).assertTrue();

        light.intensity = 1000.0;
        expect(light.intensity).assertEqual(1000.0);
        console.info(msg + " intensity set to 1000.0 successfully");

        light.intensity = 0.0;
        expect(light.intensity).assertEqual(0.0);
        console.info(msg + " intensity set to 0.0 successfully");

        light.intensity = 500.5;
        expect(light.intensity).assertEqual(500.5);
        console.info(msg + " intensity set to 500.5 successfully");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testMaterialPolygonMode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1040
     * @tc.desc   Test Material.polygonMode property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaterialPolygonMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testMaterialPolygonMode";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let material = await rf.createMaterial({ name: "TestMaterial" }, MaterialType.SHADER);
        expect(material != null).assertTrue();
        
        material.polygonMode = PolygonMode.FILL;
        expect(material.polygonMode).assertEqual(PolygonMode.FILL);
        console.info(msg + " polygonMode set to FILL successfully");
        
        material.polygonMode = PolygonMode.LINE;
        expect(material.polygonMode).assertEqual(PolygonMode.LINE);
        console.info(msg + " polygonMode set to LINE successfully");
        
        material.polygonMode = PolygonMode.POINT;
        expect(material.polygonMode).assertEqual(PolygonMode.POINT);
        console.info(msg + " polygonMode set to POINT successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testEnvironmentEnvironmentRotation
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1050
     * @tc.desc   Test Environment.environmentRotation property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentEnvironmentRotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testEnvironmentEnvironmentRotation";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let env: Environment = scene.environment;
        expect(env != null).assertTrue();
        
        let rotation: Quaternion = { x: 0, y: 0, z: 0, w: 1 };
        env.environmentRotation = rotation;
        expect(env.environmentRotation != null).assertTrue();
        expect((env.environmentRotation?.x ?? 0)).assertEqual(0);
        expect((env.environmentRotation?.y ?? 0)).assertEqual(0);
        expect((env.environmentRotation?.z ?? 0)).assertEqual(0);
        expect((env.environmentRotation?.w ?? 0)).assertEqual(1);
        console.info(msg + " environmentRotation set successfully");
        
        let rotation2: Quaternion = { x: 0.5, y: 0.5, z: 0.5, w: 0.5 };
        env.environmentRotation = rotation2;
        expect(env.environmentRotation != null).assertTrue();
        expect((env.environmentRotation?.x ?? 0)).assertEqual(0.5);
        expect((env.environmentRotation?.y ?? 0)).assertEqual(0.5);
        console.info(msg + " environmentRotation updated successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testVignetteRoundness
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1270
     * @tc.desc   Test VignetteSettings.roundness property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVignetteRoundness', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testVignetteRoundness";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let camera: Camera = await rf.createCamera({ name: "TestCamera" });
        expect(camera != null).assertTrue();
        
        camera.postProcess = { vignette: { roundness: 0.5, intensity: 0.5 } };
        expect(camera.postProcess != null).assertTrue();
        
        let vignette: VignetteSettings = camera.postProcess!.vignette!;
        expect(vignette != null).assertTrue();
        
        vignette.roundness = 0.5;
        expect(vignette.roundness).assertEqual(0.5);
        console.info(msg + " roundness set to 0.5 successfully");
        
        vignette.roundness = 1.0;
        expect(vignette.roundness).assertEqual(1.0);
        console.info(msg + " roundness set to 1.0 successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testVignetteIntensity
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1280
     * @tc.desc   Test VignetteSettings.intensity property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVignetteIntensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testVignetteIntensity";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let camera: Camera = await rf.createCamera({ name: "TestCamera" });
        expect(camera != null).assertTrue();
        
        camera.postProcess = { vignette: { roundness: 0.5, intensity: 0.3 } };
        expect(camera.postProcess != null).assertTrue();
        
        let vignette: VignetteSettings = camera.postProcess!.vignette!;
        expect(vignette != null).assertTrue();
        
        vignette.intensity = 0.3;
        expect(vignette.intensity).assertClose(0.3, 0.01);
        console.info(msg + " intensity set to 0.3 successfully");
        
        vignette.intensity = 0.7;
        expect(vignette.intensity).assertClose(0.7, 0.01);
        console.info(msg + " intensity set to 0.7 successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testColorFringeIntensity
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1290
     * @tc.desc   Test ColorFringeSettings.intensity property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColorFringeIntensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testColorFringeIntensity";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let camera: Camera = await rf.createCamera({ name: "TestCamera" });
        expect(camera != null).assertTrue();
        
        camera.postProcess = { colorFringe: { intensity: 1.0 } };
        expect(camera.postProcess != null).assertTrue();
        
        let colorFringe: ColorFringeSettings = camera.postProcess!.colorFringe!;
        expect(colorFringe != null).assertTrue();
        
        colorFringe.intensity = 1.0;
        expect(colorFringe.intensity).assertEqual(1.0);
        console.info(msg + " intensity set to 1.0 successfully");
        
        colorFringe.intensity = 2.0;
        expect(colorFringe.intensity).assertEqual(2.0);
        console.info(msg + " intensity set to 2.0 successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testPostProcessSettingsVignette
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1300
     * @tc.desc   Test PostProcessSettings.vignette property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostProcessSettingsVignette', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testPostProcessSettingsVignette";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let camera: Camera = await rf.createCamera({ name: "TestCamera" });
        expect(camera != null).assertTrue();
        
        camera.postProcess = { vignette: { roundness: 0.5, intensity: 0.5 } };
        expect(camera.postProcess != null).assertTrue();

        let vignette: VignetteSettings = camera.postProcess!.vignette!;
        expect(vignette != null).assertTrue();
        console.info(msg + " vignette getter succeeded");

        let newVignette: VignetteSettings = { roundness: 0.8, intensity: 0.5 };
        camera.postProcess!.vignette = newVignette;
        expect(camera.postProcess!.vignette != null).assertTrue();
        console.info(msg + " vignette setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testPostProcessSettingsColorFringe
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1310
     * @tc.desc   Test PostProcessSettings.colorFringe property getter and setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostProcessSettingsColorFringe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testPostProcessSettingsColorFringe";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        expect(scene != null).assertTrue();
        
        let rf: SceneResourceFactory = scene.getResourceFactory();
        let camera: Camera = await rf.createCamera({ name: "TestCamera" });
        expect(camera != null).assertTrue();
        
        camera.postProcess = { colorFringe: { intensity: 1.0 } };
        expect(camera.postProcess != null).assertTrue();
        
        let colorFringe: ColorFringeSettings = camera.postProcess!.colorFringe!;
        expect(colorFringe != null).assertTrue();
        console.info(msg + " colorFringe getter succeeded");
        
        let newColorFringe: ColorFringeSettings = { intensity: 1.5 };
        camera.postProcess!.colorFringe = newColorFringe;
        expect(camera.postProcess!.colorFringe != null).assertTrue();
        console.info(msg + " colorFringe setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}
