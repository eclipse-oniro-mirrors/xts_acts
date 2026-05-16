/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { SceneResourceFactory, Scene, RenderingPipelineType, Camera, VignetteSettings,
  PostProcessSettings,
  ColorFringeSettings, GeometryType} from '@kit.ArkGraphics3D'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'

export default function scenePostProcessSettingTest() {
  describe('scenePostProcessSettingTest', ()=> {
    let scene: Scene | null = null;
    let rf: SceneResourceFactory;
    /**
     * @tc.name   testScenePostProcessSettingsVignetteRoundness
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0980
     * @tc.desc   Verify the VignetteSettings roundness property supports set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScenePostProcessSettingsVignetteRoundness', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testScenePostProcessSettingsVignetteRoundness";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let cam: Camera = await rf.createCamera({ name: "Camera" }, {renderingPipeline: RenderingPipelineType.FORWARD});
        expect(cam != null).assertTrue();

        // 创建VignetteSettings并设置roundness
        let vignetteSettings: VignetteSettings = {roundness: 0.8, intensity: 0.4};
        expect(Math.abs(vignetteSettings.roundness! - 0.8)).assertLess(1e-6);
        console.info(msg + " VignetteSettings roundness set to 0.8 successfully");

        // 测试不同roundness值
        vignetteSettings.roundness = 0.0;
        expect(Math.abs(vignetteSettings.roundness - 0.0)).assertLess(1e-6);
        console.info(msg + " VignetteSettings roundness set to 0.0 successfully");

        vignetteSettings.roundness = 0.5;
        expect(Math.abs(vignetteSettings.roundness - 0.5)).assertLess(1e-6);
        console.info(msg + " VignetteSettings roundness set to 0.5 successfully");

        vignetteSettings.roundness = 1.0;
        expect(Math.abs(vignetteSettings.roundness - 1.0)).assertLess(1e-6);
        console.info(msg + " VignetteSettings roundness set to 1.0 successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testScenePostProcessSettingsVignetteRoundness " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testScenePostProcessSettingsVignetteIntensity
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0990
     * @tc.desc   Verify the VignetteSettings intensity property supports set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScenePostProcessSettingsVignetteIntensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testScenePostProcessSettingsVignetteIntensity";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let cam: Camera = await rf.createCamera({ name: "Camera" }, {renderingPipeline: RenderingPipelineType.FORWARD});
        expect(cam != null).assertTrue();

        // 创建VignetteSettings并设置intensity
        let vignetteSettings: VignetteSettings = {roundness: 0.707, intensity: 0.6};
        expect(vignetteSettings.intensity).assertEqual(0.6);
        console.info(msg + " VignetteSettings intensity set to 0.6 successfully");

        // 测试不同intensity值
        vignetteSettings.intensity = 0.0;
        expect(Math.abs(vignetteSettings.intensity - 0.0)).assertLess(1e-6);
        console.info(msg + " VignetteSettings intensity set to 0.0 successfully");

        vignetteSettings.intensity = 0.25;
        expect(Math.abs(vignetteSettings.intensity - 0.25)).assertLess(1e-6);
        console.info(msg + " VignetteSettings intensity set to 0.25 successfully");

        vignetteSettings.intensity = 1.0;
        expect(Math.abs(vignetteSettings.intensity - 1.0)).assertLess(1e-6);
        console.info(msg + " VignetteSettings intensity set to 1.0 successfully");

        // 测试负值确保反向渐晕生效
        vignetteSettings.intensity = -0.5;
        expect(Math.abs(vignetteSettings.intensity + 0.5)).assertLess(1e-6);
        console.info(msg + " VignetteSettings intensity set to -0.5 successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testScenePostProcessSettingsVignetteIntensity " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testScenePostProcessSettingsColorFringeIntensity
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1000
     * @tc.desc   Verify the ColorFringeSettings intensity property supports set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScenePostProcessSettingsColorFringeIntensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testScenePostProcessSettingsColorFringeIntensity";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let cam: Camera = await rf.createCamera({ name: "Camera" }, {renderingPipeline: RenderingPipelineType.FORWARD});
        expect(cam != null).assertTrue();

        // 创建ColorFringeSettings并设置intensity
        let colorFringeSettings: ColorFringeSettings = {intensity: 0.3};
        expect(colorFringeSettings.intensity).assertEqual(0.3);
        console.info(msg + " ColorFringeSettings intensity set to 0.3 successfully");

        // 测试不同intensity值
        colorFringeSettings.intensity = 0.0;
        expect(Math.abs(colorFringeSettings.intensity - 0.0)).assertLess(1e-6);
        console.info(msg + " ColorFringeSettings intensity set to 0.0 successfully");

        colorFringeSettings.intensity = 0.5;
        expect(Math.abs(colorFringeSettings.intensity - 0.5)).assertLess(1e-6);
        console.info(msg + " ColorFringeSettings intensity set to 0.5 successfully");

        colorFringeSettings.intensity = 1.0;
        expect(Math.abs(colorFringeSettings.intensity - 1.0)).assertLess(1e-6);
        console.info(msg + " ColorFringeSettings intensity set to 1.0 successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testScenePostProcessSettingsColorFringeIntensity " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testScenePostProcessSettingsVignette
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1001
     * @tc.desc   Verify the PostProcessSettings vignette property supports set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScenePostProcessSettingsVignette', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testScenePostProcessSettingsVignette";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let cam: Camera = await rf.createCamera({ name: "Camera" }, {renderingPipeline: RenderingPipelineType.FORWARD});
        expect(cam != null).assertTrue();

        // 创建VignetteSettings
        let vignetteSettings: VignetteSettings = {roundness: 0.707, intensity: 0.4};

        // 测试PostProcessSettings的vignette属性
        let postProcessSettings: PostProcessSettings = {vignette: vignetteSettings};
        expect(postProcessSettings.vignette != null).assertTrue();
        expect(Math.abs(postProcessSettings.vignette?.roundness! - 0.707)).assertLess(1e-6);
        expect(Math.abs(postProcessSettings.vignette?.intensity! - 0.4)).assertLess(1e-6);
        console.info(msg + " PostProcessSettings vignette property set successfully");

        // 测试修改vignette属性
        if (cam.postProcess?.vignette) {
          cam.postProcess.vignette.roundness = 0.9;
          cam.postProcess.vignette.intensity = 0.6;
          expect(Math.abs(cam.postProcess.vignette.roundness - 0.9)).assertLess(1e-6);
          expect(Math.abs(cam.postProcess.vignette.intensity - 0.6)).assertLess(1e-6);
          console.info(msg + " Camera postProcess vignette modified successfully");
        }

        done();
      } catch (err) {
        console.info(msg + " Failed in testScenePostProcessSettingsVignette " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testScenePostProcessSettingsColorFringe
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1002
     * @tc.desc   Verify the PostProcessSettings colorFringe property supports set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScenePostProcessSettingsColorFringe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testScenePostProcessSettingsColorFringe";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let cam: Camera = await rf.createCamera({ name: "Camera" }, {renderingPipeline: RenderingPipelineType.FORWARD});
        expect(cam != null).assertTrue();

        // 创建ColorFringeSettings
        let colorFringeSettings: ColorFringeSettings = {intensity: 0.2};

        // 测试PostProcessSettings的colorFringe属性
        let postProcessSettings: PostProcessSettings = {colorFringe: colorFringeSettings};
        expect(postProcessSettings.colorFringe != null).assertTrue();
        expect(postProcessSettings.colorFringe?.intensity).assertEqual(0.2);
        console.info(msg + " PostProcessSettings colorFringe property set successfully");

        // 测试修改colorFringe属性
        if (cam.postProcess?.colorFringe) {
          cam.postProcess.colorFringe.intensity = 0.8;
          expect(Math.abs(cam.postProcess.colorFringe.intensity - 0.8)).assertLess(1e-6);
          console.info(msg + " Camera postProcess colorFringe modified successfully");
        }

        done();
      } catch (err) {
        console.info(msg + " Failed in testScenePostProcessSettingsColorFringe " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneCameraPostProcessDefaults
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1003
     * @tc.desc   Verify the Camera default vignette and colorFringe settings and values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneCameraPostProcessDefaults', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "\"============================testSceneCameraPostProcessDefaults";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue(); console.info(msg + " scene loaded and not null");
        rf = scene.getResourceFactory();

        let cam: Camera = await rf.createCamera({ name: "CameraPostDefaults" }, {renderingPipeline: RenderingPipelineType.FORWARD});
        expect(cam != null).assertTrue();
        console.info(msg + " camera created and not null");

        expect(cam.postProcess != null).assertTrue();
        console.info(msg + " camera postProcess not null");

        // 验证vignette默认开启并取默认值
        expect(cam.postProcess?.vignette != null).assertTrue();
        console.info(msg + " camera postProcess.vignette not null");
        let vignetteDefaults = cam.postProcess?.vignette!;
        expect(vignetteDefaults.roundness != null).assertTrue();
        console.info(msg + " vignetteDefaults.roundness not null");
        expect(vignetteDefaults.intensity != null).assertTrue();
        console.info(msg + " vignetteDefaults.intensity not null");
        expect(Math.abs(vignetteDefaults.roundness! - Math.sqrt(0.5))).assertLess(1e-6);
        console.info(msg + " vignetteDefaults.roundness default value correct");
        expect(Math.abs(vignetteDefaults.intensity! - 0.4)).assertLess(1e-6);
        console.info(msg + " vignetteDefaults.intensity default value correct");
        console.info(msg + " Camera vignette defaults verified");

        // 验证colorFringe默认开启并取默认值
        expect(cam.postProcess?.colorFringe != null).assertTrue();
        console.info(msg + " camera postProcess.colorFringe not null");
        let colorFringeDefaults = cam.postProcess?.colorFringe!;
        expect(colorFringeDefaults.intensity != null).assertTrue();
        console.info(msg + " colorFringeDefaults.intensity not null");
        expect(Math.abs(colorFringeDefaults.intensity! - 0.2)).assertLess(1e-6);
        console.info(msg + " colorFringeDefaults.intensity default value correct");
        console.info(msg + " Camera colorFringe defaults verified");

        // 修改设置后再次校验返回内容
        cam.postProcess!.vignette!.roundness = 0.95;
        cam.postProcess!.vignette!.intensity = -0.2;
        expect(Math.abs(cam.postProcess!.vignette!.roundness - 0.95)).assertLess(1e-6);
        console.info(msg + " vignette roundness set and checked");
        expect(Math.abs(cam.postProcess!.vignette!.intensity + 0.2)).assertLess(1e-6);
        console.info(msg + " vignette intensity set and checked");

        cam.postProcess!.colorFringe!.intensity = 0.9;
        expect(Math.abs(cam.postProcess!.colorFringe!.intensity - 0.9)).assertLess(1e-6);
        console.info(msg + " colorFringe intensity set and checked");
        console.info(msg + " Camera postProcess values updated successfully");
        expect(GeometryType.CYLINDER).assertEqual(4);

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneCameraPostProcessDefaults " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}