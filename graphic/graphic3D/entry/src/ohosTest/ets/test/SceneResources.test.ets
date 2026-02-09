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
import { Vec4, Aabb, SceneResourceType, SceneResource, Shader, MaterialType, Material, ShaderMaterial, SubMesh, Mesh,
  Animation, EnvironmentBackgroundType, Environment, Node, Geometry, SceneResourceFactory, Scene, PolygonMode, 
  Effect, EffectParameters,SceneNodeParameters } from '@kit.ArkGraphics3D'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import * as scene3d from '@ohos.graphics.scene'
import { lookAt, GenRandom, sleep } from '../common/utils';

export default function sceneResourcesTest() {
  describe('sceneResourcesTest', ()=> {
    let scene: Scene | null = null;
    let scene0: Scene | null = null;
    let scene1: Scene | null = null;
    let scene2: Scene | null = null;
    let env: Environment;
    let anim: Animation;
    let envImage1: scene3d.Image | null = null;
    let envImage2: scene3d.Image | null = null;
    let envImage3: scene3d.Image | null = null;
    let radianceImage: scene3d.Image | null = null;
    let rf: SceneResourceFactory;
    let rf1: SceneResourceFactory;
    let material: ShaderMaterial | null = null;
    let shader: Shader | null = null;
    let geom: Geometry | null = null;
    let node: Node | null = null;;
    let mesh: Mesh | null = null;;
    /**
     * @tc.name   testAnimationStarted
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0320
     * @tc.desc   Used to play animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAnimationStarted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testAnimationStarted";
      console.info(msg + ' begin ');
      try {
        let startFlag = false;
        scene0 = await Scene.load($rawfile("gltf/BrainStem/glTF/BrainStem.glb"));
        expect(scene0 != undefined).assertTrue();
        console.info(msg + " Succeed in load ");
        anim = scene0?.animations[0];
        expect(scene0 != null).assertTrue();
        console.info(msg + " Succeed in scene0?.animations[0] ");
        anim.onStarted(() => {
          console.info(msg + " Succeed in anim.start() ");
          startFlag = true;
        })
        anim.start();
        anim.progress;
        await sleep(200);
        expect(startFlag).assertTrue();
        console.info(msg + " Succeed in onStarted() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in onStarted()  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testAnimationPause
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0330
     * @tc.desc   Used to pause animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAnimationPause', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testAnimationPause";
      console.info(msg + ' begin ');
      try {
        anim?.pause();
        expect(anim?.running).assertFalse();
        console.info(msg + " Succeed in anim.pause() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.pause() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testAnimationSeek
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0340
     * @tc.desc   Used to set he starting position for playing the animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAnimationSeek', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testAnimationSeek";
      console.info(msg + ' begin ');
      try {
        anim.seek(0.3);
        console.info(msg + " Succeed in anim.seek(0.3) ");
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.seek(0.3) " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testAnimationRestart
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0350
     * @tc.desc   Used to add restart animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAnimationRestart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testAnimationRestart";
      console.info(msg + ' begin ');
      try {
        anim.restart();
        console.info(msg + " Succeed in anim.restart() ");
        expect(anim.running).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.restart() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testAnimationStop
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0360
     * @tc.desc   Used to stop animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAnimationStop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testAnimationStop";
      console.info(msg + ' begin ');
      try {
        anim.restart();
        expect(anim.running).assertTrue();
        console.info(msg + " anim is running ");
        anim.stop();
        expect(anim.running).assertFalse();
        console.info(msg + " anim is stopping ");
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.stop() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testAnimationFinished
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0370
     * @tc.desc   Used to the callback function that is executed at the end of the animation playback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAnimationFinished', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testAnimationFinished";
      console.info(msg + ' begin ');
      try {
        await sleep(200);
        let finishFlag = false;
        anim.onFinished(() => {
          console.info(msg + " Succeed in anim.finish() ");
          finishFlag = true;
        })
        anim.restart();
        expect(anim.running).assertTrue();
        console.info(msg + " anim is running ");
        anim.finish();
        await sleep(200);
        expect(finishFlag).assertTrue();
        console.info(msg + " Succeed in onFinished() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in onFinished() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testAnimationDuration
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0380
     * @tc.desc   Used to get length of animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAnimationDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testAnimationDuration";
      console.info(msg + ' begin ');
      try {
        let duration = anim.duration;
        expect(duration != 0).assertTrue();
        console.info(msg + " Succeed in anim.duration ");
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.duration " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testAnimationEnabled
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0390
     * @tc.desc   Used to set weather the animation is enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAnimationEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testAnimationEnabled";
      console.info(msg + ' begin ');
      try {
        anim.start();
        expect(anim.running).assertTrue();
        anim.enabled = false;
        expect(anim.running).assertFalse();
        console.info(msg + " Succeed in anim.enabled = false ");
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.enabled = false " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testEnvironmentIndirectDiffuseFactor
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0400
     * @tc.desc   Used to set environment indirectDiffuseFactor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentIndirectDiffuseFactor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = "============================testEnvironmentIndirectDiffuseFactor";
      console.info(msg + ' begin ');
      try {
        scene1 = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        expect(scene1 != undefined).assertTrue();
        console.info(msg + " get scene1 success ");
        rf = scene1?.getResourceFactory();
        env = scene1?.environment;
        let vec4: Vec4 = {x:1, y:40, z:1, w:1}
        env.indirectDiffuseFactor = vec4;
        expect(env.indirectDiffuseFactor.y).assertEqual(40);
        console.info(msg + " Succeed in env.indirectDiffuseFactor ");
        let env1 = await rf.createEnvironment({ "name" : "Env"});
        expect(env1 != null).assertTrue();
        console.info(msg + " Succeed in createEnvironment ");
        done();
      } catch (err) {
        console.info(msg + " Failed in env.indirectDiffuseFactor " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testEnvironmentIndirectSpecularFactor
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0410
     * @tc.desc   Used to set environment indirectSpecularFactor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentIndirectSpecularFactor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testEnvironmentIndirectSpecularFactor";
      console.info(msg + ' begin ');
      try {
        let vec4: Vec4 = {x:1, y:40, z:1, w:1}
        env.indirectSpecularFactor = vec4;
        expect(env.indirectSpecularFactor.y).assertEqual(40);
        console.info(msg + " Succeed in env.indirectSpecularFactor ");
        done();
      } catch (err) {
        console.info(msg + " Failed in env.indirectSpecularFactor " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testEnvironmentMapFactor
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0420
     * @tc.desc   Used to set environment environmentMapFactor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentMapFactor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testEnvironmentMapFactor";
      console.info(msg + ' begin ');
      try {
        let vec4: Vec4 = {x:1, y:40, z:1, w:1}
        env.environmentMapFactor = vec4;
        expect(env.environmentMapFactor.y).assertEqual(40);
        console.info(msg + " Succeed in env.environmentMapFactor ");
        done();
      } catch (err) {
        console.info(msg + " Failed in env.environmentMapFactor " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testEnvironmentImage
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0430
     * @tc.desc   Used to set environment environmentImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentImage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testEnvironmentImage";
      console.info(msg + ' begin ');
      try {
        envImage1 = await rf.createImage({ name: "envImage1", uri: $rawfile("gltf/Cube/glTF/Cube_BaseColor.png")});
        expect(envImage1 != undefined).assertTrue();
        console.info(msg + " create envImage1 success ");
        envImage2 = await rf.createImage({ name: "envImage2", uri: $rawfile("gltf/Environment/glTF/images/quarry_02_2k_skybox.ktx")});
        expect(envImage2 != undefined).assertTrue();
        console.info(msg + " create envImage2 success ");
        envImage3 = await rf.createImage({ name: "envImage3", uri: $rawfile("gltf/DamagedHelmet/glTF/Default_albedo.jpg")});
        expect(envImage3 != undefined).assertTrue();
        console.info(msg + " create envImage3 success ");
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_NONE;
        expect(env.backgroundType).assertEqual(EnvironmentBackgroundType.BACKGROUND_NONE);
        console.info(msg + " Succeed in Environment environmentImage set NONE ");
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_IMAGE;
        expect(env.backgroundType).assertEqual(EnvironmentBackgroundType.BACKGROUND_IMAGE);
        env.environmentImage = envImage1;
        console.info(msg + " Succeed in Environment environmentImage set envImage1 IMAGE ");
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_CUBEMAP;
        expect(env.backgroundType).assertEqual(EnvironmentBackgroundType.BACKGROUND_CUBEMAP);
        env.environmentImage = envImage2;
        console.info(msg + " Succeed in Environment environmentImage set envImage2 CUBEMAP ");
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_EQUIRECTANGULAR;
        expect(env.backgroundType).assertEqual(EnvironmentBackgroundType.BACKGROUND_EQUIRECTANGULAR);
        env.environmentImage = envImage3;
        console.info(msg + " Succeed in Environment environmentImage set envImage3 EQUIRECTANGULAR ");
        done();
      } catch (err) {
        console.info(msg + " Failed in Environment environmentImage set " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testRadianceImage
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0440
     * @tc.desc   Used to set environment radianceImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRadianceImage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testRadianceImage";
      console.info(msg + ' begin ');
      try {
        radianceImage = await rf.createImage({ name: "radianceImage", uri: $rawfile("gltf/Environment/glTF/images/quarry_02_2k_radiance.ktx")});
        expect(radianceImage != undefined).assertTrue();
        console.info(msg + " create radianceImage success ");
        env.radianceImage = null;
        console.info(msg + " Succeed in Environment radianceImage set null ");
        env.radianceImage = radianceImage;
        expect(env.radianceImage).assertEqual(radianceImage);
        console.info(msg + " Succeed in Environment radianceImage set radianceImage ");
        radianceImage?.width;
        radianceImage?.height;
        done();
      } catch (err) {
        console.info(msg + " Failed in Environment radianceImage set " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testEnvironmentIrradianceCoefficients
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0450
     * @tc.desc   Used to set environment irradianceCoefficients
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentIrradianceCoefficients', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testEnvironmentIrradianceCoefficients";
      console.info(msg + ' begin ');
      try {
        env.irradianceCoefficients =
          [{ x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() }];
        console.info(msg + " Succeed in env.irradianceCoefficients ");
        done();
      } catch (err) {
        console.info(msg + " Failed in env.irradianceCoefficients " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testMesh
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0460
     * @tc.desc   Used to get mesh of geometry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMesh', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testMesh";
      console.info(msg + ' begin ');
      try {
        let subMeshes: SubMesh[];
        let aabb: Aabb;
        let materialOrg: Material;
        scene2 = await Scene.load($rawfile("gltf/Cube/glTF/Cube.glb"));
        expect(scene2 != undefined).assertTrue();
        console.info(msg + " get scene2 success ");
        rf1 = scene2?.getResourceFactory();
        shader = await rf1.createShader({ name: "CustomShader", uri: $rawfile("shaders/custom_shader/custom_material_sample.shader")});
        expect(shader != undefined).assertTrue();
        console.info(msg + " create shader success ");
        material = await rf1.createMaterial({ name: "CustomMaterial" }, MaterialType.SHADER);
        geom = scene2?.getNodeByPath("rootNode_/Unnamed Node 1/Cube") as Geometry;
        expect(geom != null).assertTrue();
        console.info(msg + ' Succeed in getNodeByPath("rootNode_/Unnamed Node 1/AnimatedCube") ');
        if (geom) {
          mesh = geom.mesh;
          subMeshes = mesh.subMeshes;
          aabb = mesh.aabb;
          aabb.aabbMin;
          aabb.aabbMax;
          subMeshes[0].name = "AnimatedCubeSubMesh";
          materialOrg = subMeshes[0].material;
          expect(material != null).assertTrue();
          console.info(msg + " Succeed in createMaterial ");
          let ab = subMeshes[0].aabb;
          expect(ab != null).assertTrue();
          console.info(msg + "  ab != null ");
          if (material) {
            material.colorShader = shader as Shader;
          }
          expect(material?.colorShader != null).assertTrue();
          console.info(msg + " Succeed in material.colorShader ")
          if (material && material.colorShader && envImage1) {
            subMeshes[0].material = material;
            (material.colorShader.inputs["BASE_COLOR_Image"] as scene3d.Image) = envImage1;
            mesh.materialOverride = undefined;
            mesh.materialOverride = materialOrg;
            console.info(msg + " Succeed in mesh.materialOverride ")
          }
        }
        done();
      } catch (err) {
        console.info(msg + " Failed in Mesh " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneResourceType
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0470
     * @tc.desc   Used to get resourceType of resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResourceType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneResourceType";
      console.info(msg + ' begin ');
      try {
        node = await rf.createNode({ name: "createNode" });
        console.info(msg + " shader?.resourceType: " + JSON.stringify(shader?.resourceType));
        expect(shader?.resourceType).assertEqual(SceneResourceType.SHADER);
        console.info(msg + " node?.resourceType: " + JSON.stringify(node?.resourceType));
        expect(node?.resourceType).assertEqual(SceneResourceType.NODE);
        console.info(msg + " env?.resourceType: " + JSON.stringify(env?.resourceType));
        expect(env?.resourceType).assertEqual(SceneResourceType.ENVIRONMENT);
        console.info(msg + " mesh?.resourceType: " + JSON.stringify(mesh?.resourceType));
        expect(mesh?.resourceType).assertEqual(SceneResourceType.MESH);
        console.info(msg + " material?.resourceType: " + JSON.stringify(material?.resourceType));
        expect(material?.resourceType).assertEqual(SceneResourceType.MATERIAL);
        console.info(msg + " anim?.resourceType: " + JSON.stringify(anim?.resourceType));
        expect(anim?.resourceType).assertEqual(SceneResourceType.ANIMATION);
        console.info(msg + " envImage1?.resourceType: " + JSON.stringify(envImage1?.resourceType));
        expect(envImage1?.resourceType).assertEqual(SceneResourceType.IMAGE);
        expect(envImage1?.resourceType != SceneResourceType.UNKNOWN).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in SceneResourceType " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneResource
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0480
     * @tc.desc   Used to get attribute of resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testSceneResource";
      console.info(msg + ' begin ');
      try {
        let resource: SceneResource;
        resource = envImage1 as scene3d.Image;
        expect(resource.name).assertEqual("envImage1");
        console.info(msg + " Succeed in resource.name ");
        expect(resource.resourceType).assertEqual(SceneResourceType.IMAGE);
        console.info(msg + " Succeed in resource.resourceType ");
        expect(resource.uri != undefined).assertTrue();
        console.info(msg + " Succeed in resource.uri ");
        resource.destroy();
        console.info(msg + " Succeed in resource.destroy() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in SceneResource " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testMaterialType
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0490
     * @tc.desc   Used to get materialType of material
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaterialType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testMaterialType";
      console.info(msg + ' begin ');
      try {
        console.info(msg + ' test material?.materialType equal ' + JSON.stringify(material?.materialType))
        expect(material?.materialType).assertEqual(MaterialType.SHADER);
        done();
      } catch (err) {
        console.info(msg + " Failed in material?.materialType  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testMaterialType_METALLIC_ROUGHNESS
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0760
     * @tc.desc   Verify that METALLIC_ROUGHNESS material can be created and its basic properties are set correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaterialType_METALLIC_ROUGHNESS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async(done:Function)=> {
        let msg = "============================testMaterialType_METALLIC_ROUGHNESS";
        console.info(msg + ' begin ');
        try {
          scene0 = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
          expect(scene0 != undefined).assertTrue();
          console.info(msg + " get scene0 success ");
          rf = scene0.getResourceFactory();
          let material = await rf.createMaterial(
            { name: 'metalMat' },
            MaterialType.METALLIC_ROUGHNESS
          );
          expect(MaterialType.METALLIC_ROUGHNESS).assertEqual(2);
          expect(material != null).assertTrue();
          expect(material.materialType).assertEqual(MaterialType.METALLIC_ROUGHNESS);

          material.shadowReceiver = true;
          material.cullMode = scene3d.CullMode.BACK;
          material.blend = {enabled: true};
          material.alphaCutoff = 0.5;
          material.renderSort = {
            renderSortLayer: 32,
            renderSortLayerOrder: 0
          };
          expect(material.shadowReceiver).assertTrue();
          expect(material.cullMode).assertEqual(scene3d.CullMode.BACK);
          expect(material.blend.enabled).assertTrue();
          expect(material.alphaCutoff).assertEqual(0.5);
          expect(material.renderSort.renderSortLayer).assertEqual(32);
          expect(material.renderSort.renderSortLayerOrder).assertEqual(0);

          console.info(msg + " test completed successfully");
          done();
        } catch (err) {
          console.info(msg + " Failed in testMaterialType_METALLIC_ROUGHNESS  " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testCullMode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0770
     * @tc.desc   Verify that the material's cullMode supports NONE, FRONT, and BACK modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCullMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done:Function)=> {
      let msg = "============================testCullMode";
      console.info(msg + ' begin ');
      try {
        scene0 = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene0 != undefined).assertTrue();
        console.info(msg + " get scene0 success ");
        rf = scene0.getResourceFactory();
        let material = await rf.createMaterial(
          { name: 'testCullModeMat' },
          MaterialType.METALLIC_ROUGHNESS
        );
        expect(material != null).assertTrue();

        material.cullMode = scene3d.CullMode.NONE;
        expect(material.cullMode).assertEqual(scene3d.CullMode.NONE);

        material.cullMode = scene3d.CullMode.FRONT;
        expect(material.cullMode).assertEqual(scene3d.CullMode.FRONT);

        material.cullMode = scene3d.CullMode.BACK;
        expect(material.cullMode).assertEqual(scene3d.CullMode.BACK);

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCullMode  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testBlend
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0780
     * @tc.desc   Verify the assignment and retrieval of the blend.enabled property in the material
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlend', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done:Function)=> {
      let msg = "============================testBlend";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        console.info(msg, "scene loaded:", scene != null);
        expect(scene != null).assertTrue();

        let rf = scene.getResourceFactory();
        console.info(msg, "resourceFactory:", rf != null);
        expect(rf != null).assertTrue();

        let blendNode = scene.root?.getNodeByPath("Scene/node_damagedHelmet_-6514");
        console.info(msg, "blendNode:", blendNode);
        expect(blendNode != null).assertTrue();
        if (!blendNode) {
          console.error(msg, "blendNode is null or undefined");
          expect().assertFail();
        }

        let blendMaterial = (blendNode as scene3d.Geometry).mesh.subMeshes[0].material;
        console.info(msg, "blendMaterial:", blendMaterial);
        expect(blendMaterial != null).assertTrue();

        if (blendMaterial) {
          blendMaterial.blend = { enabled: false};
          console.info(msg, "blendMaterial.blend.enabled set to false:", blendMaterial.blend.enabled);
          expect(blendMaterial.blend.enabled).assertFalse();
          blendMaterial.blend = { enabled: true};
          console.info(msg, "blendMaterial.blend.enabled set to true:", blendMaterial.blend.enabled);
          expect(blendMaterial.blend.enabled).assertTrue();
        }
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testBlend  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRenderSort
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0790
     * @tc.desc   Verify material’s renderSortLayer and renderSortLayerOrder can be set and read correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRenderSort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done:Function)=> {
      let msg = "============================testRenderSort";
      console.info(msg + ' begin ');
      try {
        scene0 = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene0 != undefined).assertTrue();
        console.info(msg + " get scene0 success ");
        rf = scene0.getResourceFactory();
        let material = await rf.createMaterial(
          { name: 'renderSortTestMat' },
          MaterialType.METALLIC_ROUGHNESS
        );
        console.info(msg, 'material created:', material !== null);
        expect(material != null).assertTrue();

        material.renderSort = {
          renderSortLayer: 10,
          renderSortLayerOrder: 20
        };
        console.info(msg, 'renderSort set 1:', JSON.stringify(material.renderSort));
        expect(material.renderSort?.renderSortLayer).assertEqual(10);
        expect(material.renderSort?.renderSortLayerOrder).assertEqual(20);

        material.renderSort = {
          renderSortLayer: 63,
          renderSortLayerOrder: 255
        };
        console.info(msg, 'renderSort set 2:', JSON.stringify(material.renderSort));
        expect(material.renderSort?.renderSortLayer).assertEqual(63);
        expect(material.renderSort?.renderSortLayerOrder).assertEqual(255);
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRenderSort  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testMaterial
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0800
     * @tc.desc   verifies that key rendering properties of the Material interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaterial', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done:Function)=> {
      let msg = "============================testMaterial";
      console.info(msg + ' begin ');
      try {
        scene0 = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene0 != undefined).assertTrue();
        console.info(msg + " get scene0 success ");
        rf = scene0.getResourceFactory();
        let material = await rf.createMaterial({ name: 'fullFeatureMat' }, MaterialType.METALLIC_ROUGHNESS);
        expect(material != null).assertTrue();
        expect(material.materialType).assertEqual(MaterialType.METALLIC_ROUGHNESS);

        material.shadowReceiver = true;
        expect(material.shadowReceiver).assertTrue();
        material.shadowReceiver = false;
        expect(material.shadowReceiver).assertFalse();

        let cullModes = [scene3d.CullMode.BACK, scene3d.CullMode.FRONT, scene3d.CullMode.NONE];
        for (let i = 0; i < cullModes.length; i++) {
          material.cullMode = cullModes[i];
          expect(material.cullMode).assertEqual(cullModes[i]);
        }

        material.blend = { enabled: true };
        expect(material.blend?.enabled).assertTrue();
        material.blend = { enabled: false };
        expect(material.blend?.enabled).assertFalse();

        let alphaValues = [0.0, 0.5, 1.0];
        for (let i = 0; i < alphaValues.length; i++) {
          material.alphaCutoff = alphaValues[i];
          expect(material.alphaCutoff).assertEqual(alphaValues[i]);
        }

        let sortConfigs: number[][] = [
          [0, 0],
          [32, 0],
          [63, 128]
        ];
        for (let i = 0; i < sortConfigs.length; i++) {
          let layer = sortConfigs[i][0];
          let order = sortConfigs[i][1];
          material.renderSort = {
            renderSortLayer: layer,
            renderSortLayerOrder: order
          };
          expect(material.renderSort.renderSortLayer).assertEqual(layer);
          expect(material.renderSort.renderSortLayerOrder).assertEqual(order);
        }
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testMaterial  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testMaterialProperty_image_factor_sampler
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0810
     * @tc.desc   Verifies setting and accessing image, factor, and sampler properties of MaterialProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaterialProperty_image_factor_sampler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testMaterialProperty_image_factor_sampler";
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        console.info(msg + " scene loaded");

        let node = scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as scene3d.Geometry;
        console.info(msg + " node found:", node?.name);
        let material = node.mesh.subMeshes[0].material as scene3d.MetallicRoughnessMaterial;
        console.info(msg + " material obtained");

        let baseColor: scene3d.MaterialProperty = material.baseColor;
        expect(baseColor != null).assertTrue();
        console.info(msg + " baseColor property obtained");

        expect(baseColor.factor != null).assertTrue();
        console.info(msg + " baseColor.factor:", JSON.stringify(baseColor.factor));

        let factory = scene.getResourceFactory();
        let baseColorImage = await factory.createImage({
          name: "baseColorTex",
          uri: $rawfile("gltf/Cube/glTF/Cube_BaseColor.png")
        });
        baseColor.image = baseColorImage;
        expect(baseColor.image).assertEqual(baseColorImage);
        console.info(msg + " baseColor.image assigned and verified");

        if (baseColor.sampler) {
          baseColor.sampler.minFilter = scene3d.SamplerFilter.NEAREST;
          expect(baseColor.sampler.minFilter).assertEqual(scene3d.SamplerFilter.NEAREST);
          console.info(msg + " baseColor.sampler.minFilter set and verified");

          baseColor.sampler.magFilter = scene3d.SamplerFilter.LINEAR;
          expect(baseColor.sampler.magFilter).assertEqual(scene3d.SamplerFilter.LINEAR);
          console.info(msg + " baseColor.sampler.magFilter set and verified");
        } else {
          console.info(msg + " baseColor.sampler is null or undefined, skipping sampler tests");
        }
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.error(msg + " Failed in testMaterialProperty_image_factor_sampler: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testMetallicRoughnessMaterial
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0820
     * @tc.desc   Verifies that all MaterialProperty-type attributes in MetallicRoughnessMaterial exist and are accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetallicRoughnessMaterial', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testMetallicRoughnessMaterial";
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        console.info(msg + " scene loaded");

        let node = scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as scene3d.Geometry;
        console.info(msg + " node found:", node?.name);

        let material = node.mesh.subMeshes[0].material as scene3d.MetallicRoughnessMaterial;
        console.info(msg + " material obtained");

        expect(material.baseColor != null).assertTrue();
        console.info(msg + " checking property: baseColor");

        expect(material.normal != null).assertTrue();
        console.info(msg + " checking property: normal");

        expect(material.material != null).assertTrue();
        console.info(msg + " checking property: material");

        expect(material.ambientOcclusion != null).assertTrue();
        console.info(msg + " checking property: ambientOcclusion");

        expect(material.emissive != null).assertTrue();
        console.info(msg + " checking property: emissive");

        expect(material.clearCoat != null).assertTrue();
        console.info(msg + " checking property: clearCoat");

        expect(material.clearCoatRoughness != null).assertTrue();
        console.info(msg + " checking property: clearCoatRoughness");

        expect(material.clearCoatNormal != null).assertTrue();
        console.info(msg + " checking property: clearCoatNormal");

        expect(material.sheen != null).assertTrue();
        console.info(msg + " checking property: sheen");

        expect(material.specular != null).assertTrue();
        console.info(msg + " checking property: specular");
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.error(msg + " Failed in testMetallicRoughnessMaterial: ", err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSamplerFilter
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0830
     * @tc.desc   Verifies that the SamplerFilter enum values NEAREST and LINEAR are correctly defined as 0 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSamplerFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testSamplerFilter";
      try {
        expect(scene3d.SamplerFilter.NEAREST).assertEqual(0);
        console.info(msg + " NEAREST = 0 verified");
        expect(scene3d.SamplerFilter.LINEAR).assertEqual(1);
        console.info(msg + " LINEAR = 1 verified");

        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        console.info(msg + " scene loaded successfully");

        let node = scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as scene3d.Geometry;
        expect(node != null).assertTrue();
        console.info(msg + " node found:", node?.name ?? "null");

        let material = node.mesh.subMeshes[0].material as scene3d.MetallicRoughnessMaterial;
        console.info(msg + " material obtained");

        let sampler: scene3d.Sampler | undefined = material.baseColor.sampler;
        if (!sampler) {
          console.error(msg + " sampler is null");
          expect(false).assertTrue();
          done();
          return;
        }
        console.info(msg + " sampler obtained");

        let filters = [scene3d.SamplerFilter.NEAREST, scene3d.SamplerFilter.LINEAR];
        for (let filter of filters) {
          sampler.minFilter = filter;
          console.info(`${msg} set sampler.minFilter = ${filter}`);
          expect(sampler.minFilter).assertEqual(filter);

          sampler.magFilter = filter;
          console.info(`${msg} set sampler.magFilter = ${filter}`);
          expect(sampler.magFilter).assertEqual(filter);
        }
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.error(msg + " Failed in testSamplerFilter: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSamplerAddressMode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0840
     * @tc.desc   Verifies that SamplerAddressMode enum values are correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSamplerAddressMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testSamplerAddressMode";
      try {
        expect(scene3d.SamplerAddressMode.REPEAT).assertEqual(0);
        console.info(msg + " REPEAT = 0 verified");
        expect(scene3d.SamplerAddressMode.MIRRORED_REPEAT).assertEqual(1);
        console.info(msg + " MIRRORED_REPEAT = 1 verified");
        expect(scene3d.SamplerAddressMode.CLAMP_TO_EDGE).assertEqual(2);
        console.info(msg + " CLAMP_TO_EDGE = 2 verified");

        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        console.info(msg + " scene loaded successfully");

        let node = scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as scene3d.Geometry;
        expect(node != null).assertTrue();
        console.info(msg + " node found:", node?.name ?? "null");

        let material = node.mesh.subMeshes[0].material as scene3d.MetallicRoughnessMaterial;
        console.info(msg + " material obtained");

        let sampler: scene3d.Sampler | undefined = material.baseColor.sampler;
        if (!sampler) {
          console.error(msg + " sampler is null");
          expect(false).assertTrue();
          done();
          return;
        }
        console.info(msg + " sampler obtained");

        const modes = [
          scene3d.SamplerAddressMode.REPEAT,
          scene3d.SamplerAddressMode.MIRRORED_REPEAT,
          scene3d.SamplerAddressMode.CLAMP_TO_EDGE
        ];
        for (let mode of modes) {
          sampler.addressModeU = mode;
          console.info(`${msg} set sampler.addressModeU = ${mode}`);
          expect(sampler.addressModeU).assertEqual(mode);

          sampler.addressModeV = mode;
          console.info(`${msg} set sampler.addressModeV = ${mode}`);
          expect(sampler.addressModeV).assertEqual(mode);
        }
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.error(msg + " Failed in testSamplerAddressMode: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSampler_mipMapMode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0850
     * @tc.desc   Verify whether the mipMapMode attribute can be properly set and read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSampler_mipMapMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done:Function)=> {
      let msg = "============================testSampler_mipMapMode";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        console.info(msg + " scene loaded successfully");

        let node = scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as scene3d.Geometry;
        console.info(msg + " node found:", node?.name ?? "null");
        expect(node != null).assertTrue();

        let material = node.mesh.subMeshes[0].material as scene3d.MetallicRoughnessMaterial;
        console.info(msg + " material obtained");

        let sampler: scene3d.Sampler | undefined = material.baseColor.sampler;
        if (!sampler) {
          console.error(msg + " sampler is null");
          expect(false).assertTrue();
          return;
        }
        console.info(msg + " sampler obtained");

        let mipMapModes = [
          scene3d.SamplerFilter.NEAREST,
          scene3d.SamplerFilter.LINEAR,
        ];

        for (let i = 0; i < mipMapModes.length; i++) {
          let mode = mipMapModes[i];
          sampler.mipMapMode = mode;
          console.info(`${msg} set mipMapMode = ${mode} (index ${i})`);
          expect(sampler.mipMapMode).assertEqual(mode);
        }

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSampler_mipMapMode  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSampler_minFilter_and_magFilter
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0860
     * @tc.desc   Verify whether the minFilter and magFilter properties can be set and read normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSampler_minFilter_and_magFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msg = "========== testSampler_minFilter_and_magFilter";
        try {
          let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
          console.info(msg + " scene loaded successfully");

          let node = scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as scene3d.Geometry;
          console.info(msg + " node found:", node?.name ?? "null");
          expect(node != null).assertTrue();

          let material = node.mesh.subMeshes[0].material as scene3d.MetallicRoughnessMaterial;
          console.info(msg + " material obtained");

          let sampler: scene3d.Sampler |undefined = material.baseColor.sampler;
          if (!sampler) {
            console.error(msg + " sampler is null");
            expect(false).assertTrue();
            return;
          }
          console.info(msg + " sampler obtained");

          let filters = [scene3d.SamplerFilter.NEAREST, scene3d.SamplerFilter.LINEAR];

          for (let i = 0; i < filters.length; i++) {
            let filter = filters[i];

            sampler.minFilter = filter;
            console.info(`${msg} set minFilter = ${filter} (index ${i})`);
            expect(sampler.minFilter).assertEqual(filter);

            sampler.magFilter = filter;
            console.info(`${msg} set magFilter = ${filter} (index ${i})`);
            expect(sampler.magFilter).assertEqual(filter);
          }

          console.info(msg + " test completed successfully");
          done();
        } catch (err) {
          console.error(msg + " Failed in testSampler_minFilter_and_magFilter:", JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testSampler_addressModeU
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0870
     * @tc.desc   Verify the assignment and state switching logic of Sampler.addressModeU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSampler_addressModeU', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done:Function)=> {
      let msg = "============================testSampler_addressModeU";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        console.info(msg + " scene loaded successfully");

        let node = scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as scene3d.Geometry;
        console.info(msg + " node found: " + (node?.name ?? "null"));
        expect(node != null).assertTrue();

        let material = node.mesh.subMeshes[0].material as scene3d.MetallicRoughnessMaterial;
        console.info(msg + " material obtained");
        let sampler: scene3d.Sampler | undefined = material.baseColor.sampler;
        if (!sampler) {
          console.error(msg + " sampler is null");
          expect(false).assertTrue();
          return;
        }
        console.info(msg + " sampler obtained");

        let modes = [
          scene3d.SamplerAddressMode.REPEAT,
          scene3d.SamplerAddressMode.MIRRORED_REPEAT,
          scene3d.SamplerAddressMode.CLAMP_TO_EDGE,
        ];
        for (let i = 0; i < modes.length; i++) {
          let mode = modes[i];
          sampler.addressModeU = mode;
          console.info(`${msg} set addressModeU = ${mode} (index ${i})`);
          expect(sampler.addressModeU).assertEqual(mode);
        }

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSampler_addressModeU  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSampler_addressModeV
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0880
     * @tc.desc   Verify the assignment and state switching logic of Sampler.addressModeV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSampler_addressModeV', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done:Function)=> {
      let msg = "============================testSampler_addressModeV";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        console.info(msg + " scene loaded successfully");

        let node = scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as scene3d.Geometry;
        console.info(msg + " node found: " + (node?.name ?? "null"));
        expect(node != null).assertTrue();

        let material = node.mesh.subMeshes[0].material as scene3d.MetallicRoughnessMaterial;
        console.info(msg + " material obtained");

        let sampler: scene3d.Sampler | undefined = material.baseColor.sampler;
        if (!sampler) {
          console.error(msg + " sampler is null");
          expect(false).assertTrue();
          return;
        }
        console.info(msg + " sampler obtained");

        let modes = [
          scene3d.SamplerAddressMode.REPEAT,
          scene3d.SamplerAddressMode.MIRRORED_REPEAT,
          scene3d.SamplerAddressMode.CLAMP_TO_EDGE,
        ];

        for (let i = 0; i < modes.length; i++) {
          let mode = modes[i];
          sampler.addressModeV = mode;
          console.info(`${msg} set addressModeV = ${mode} (index ${i})`);
          expect(sampler.addressModeV).assertEqual(mode);
        }
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSampler_addressModeV  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testAnimation_speed
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0890
     * @tc.desc   Verify whether the speed attribute of Animation can be successfully assigned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAnimation_speed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done:Function)=> {
      let msg = "============================testAnimation_speed";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/BrainStem/glTF/BrainStem.glb"));
        let animation: Animation = scene.animations[0];
        animation.enabled = true;
        animation.speed = 1.5;
        animation.start();
        console.info("Animation started with speed:", animation.speed);
        expect(animation.speed).assertEqual(1.5);

        animation.speed = -2.0;
        console.info("Animation reversed with speed:", animation.speed);
        expect(animation.speed).assertEqual(-2.0);

        animation.stop();
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testAnimation_speed  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneResourcesMaterialTypeUNLIT
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1004
     * @tc.desc   Verify the MaterialType.UNLIT enum value behaves as expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResourcesMaterialTypeUNLIT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneResourcesMaterialTypeUNLIT";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        // 验证UNLIT枚举值
        expect(MaterialType.UNLIT).assertEqual(3);
        console.info(msg + " MaterialType.UNLIT enum value is 3");

        // 创建UNLIT材质
        let unlitMaterial: scene3d.Material = await rf.createMaterial({ name: "UnlitMaterial" }, MaterialType.UNLIT);
        expect(unlitMaterial != null).assertTrue();
        expect(unlitMaterial.materialType).assertEqual(MaterialType.UNLIT);
        console.info(msg + " UNLIT material created successfully");

        // 验证材质类型比较
        expect(unlitMaterial.materialType).assertEqual(3);
        console.info(msg + " Material materialType is UNLIT");

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneResourcesMaterialTypeUNLIT " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneResourcesPolygonModeFILL
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1005
     * @tc.desc   Verify the PolygonMode.FILL enum value behaves as expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResourcesPolygonModeFILL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneResourcesPolygonModeFILL";
      console.info(msg + ' begin ');
      try {
        // 验证FILL枚举值
        expect(PolygonMode.FILL).assertEqual(0);
        console.info(msg + " PolygonMode.FILL enum value is 0");

        // 创建材质并设置polygonMode为FILL
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let material: scene3d.Material = await rf.createMaterial({ name: "TestMaterial" }, MaterialType.METALLIC_ROUGHNESS);
        expect(material != null).assertTrue();

        material.polygonMode = PolygonMode.FILL;
        expect(material.polygonMode).assertEqual(PolygonMode.FILL);
        expect(material.polygonMode).assertEqual(0);
        console.info(msg + " Material polygonMode set to FILL successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneResourcesPolygonModeFILL " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneResourcesPolygonModeLINE
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1006
     * @tc.desc   Verify the PolygonMode.LINE enum value behaves as expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResourcesPolygonModeLINE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneResourcesPolygonModeLINE";
      console.info(msg + ' begin ');
      try {
        // 验证LINE枚举值
        expect(PolygonMode.LINE).assertEqual(1);
        console.info(msg + " PolygonMode.LINE enum value is 1");

        // 创建材质并设置polygonMode为LINE
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let material: scene3d.Material = await rf.createMaterial({ name: "TestMaterial" }, MaterialType.METALLIC_ROUGHNESS);
        expect(material != null).assertTrue();

        material.polygonMode = PolygonMode.LINE;
        expect(material.polygonMode).assertEqual(PolygonMode.LINE);
        expect(material.polygonMode).assertEqual(1);
        console.info(msg + " Material polygonMode set to LINE successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneResourcesPolygonModeLINE " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneResourcesPolygonModePOINT
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1007
     * @tc.desc   Verify the PolygonMode.POINT enum value behaves as expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResourcesPolygonModePOINT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneResourcesPolygonModePOINT";
      console.info(msg + ' begin ');
      try {
        // 验证POINT枚举值
        expect(PolygonMode.POINT).assertEqual(2);
        console.info(msg + " PolygonMode.POINT enum value is 2");

        // 创建材质并设置polygonMode为POINT
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let material: scene3d.Material = await rf.createMaterial({ name: "TestMaterial" }, MaterialType.METALLIC_ROUGHNESS);
        expect(material != null).assertTrue();

        material.polygonMode = PolygonMode.POINT;
        expect(material.polygonMode).assertEqual(PolygonMode.POINT);
        expect(material.polygonMode).assertEqual(2);
        console.info(msg + " Material polygonMode set to POINT successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneResourcesPolygonModePOINT " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneResourcesMaterialPolygonMode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1008
     * @tc.desc   Verify the Material polygonMode property supports set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResourcesMaterialPolygonMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneResourcesMaterialPolygonMode";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let material: scene3d.Material = await rf.createMaterial({ name: "TestMaterial" }, MaterialType.METALLIC_ROUGHNESS);
        expect(material != null).assertTrue();

        // 测试默认值
        expect(material.polygonMode).assertEqual(PolygonMode.FILL);
        console.info(msg + " Material polygonMode default value is FILL");

        // 测试所有polygonMode值
        material.polygonMode = PolygonMode.FILL;
        expect(material.polygonMode).assertEqual(PolygonMode.FILL);
        console.info(msg + " Material polygonMode set to FILL successfully");

        material.polygonMode = PolygonMode.LINE;
        expect(material.polygonMode).assertEqual(PolygonMode.LINE);
        console.info(msg + " Material polygonMode set to LINE successfully");

        material.polygonMode = PolygonMode.POINT;
        expect(material.polygonMode).assertEqual(PolygonMode.POINT);
        console.info(msg + " Material polygonMode set to POINT successfully");

        // 测试返回FILL
        material.polygonMode = PolygonMode.FILL;
        expect(material.polygonMode).assertEqual(PolygonMode.FILL);
        console.info(msg + " Material polygonMode set back to FILL successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneResourcesMaterialPolygonMode " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneResourcesUnlitMaterialBaseColor
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1009
     * @tc.desc   Verify the UnlitMaterial baseColor property supports set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResourcesUnlitMaterialBaseColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneResourcesUnlitMaterialBaseColor";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        // 创建UnlitMaterial
        let unlitMaterial: scene3d.UnlitMaterial = await rf.createMaterial({ name: "UnlitMaterial" }, MaterialType.UNLIT) as scene3d.UnlitMaterial;
        expect(unlitMaterial != null).assertTrue();
        expect(unlitMaterial.materialType).assertEqual(MaterialType.UNLIT);

        // 验证baseColor属性存在
        expect(unlitMaterial.baseColor != null).assertTrue();
        console.info(msg + " UnlitMaterial baseColor property exists");

        // 测试baseColor的factor属性
        let baseColorFactor: Vec4 = {x: 1.0, y: 0.5, z: 0.2, w: 1.0};
        unlitMaterial.baseColor.factor = baseColorFactor;
        expect(Math.abs(unlitMaterial.baseColor.factor.x - 1.0)).assertLess(1e-6);
        expect(Math.abs(unlitMaterial.baseColor.factor.y - 0.5)).assertLess(1e-6);
        expect(Math.abs(unlitMaterial.baseColor.factor.z - 0.2)).assertLess(1e-6);
        expect(Math.abs(unlitMaterial.baseColor.factor.w - 1.0)).assertLess(1e-6);
        console.info(msg + " UnlitMaterial baseColor factor set successfully");

        // 测试不同的baseColor值
        unlitMaterial.baseColor.factor = {x: 0.0, y: 0.0, z: 0.0, w: 1.0};
        expect(Math.abs(unlitMaterial.baseColor.factor.x - 0.0)).assertLess(1e-6);
        console.info(msg + " UnlitMaterial baseColor factor set to black successfully");

        unlitMaterial.baseColor.factor = {x: 1.0, y: 1.0, z: 1.0, w: 1.0};
        expect(Math.abs(unlitMaterial.baseColor.factor.x - 1.0)).assertLess(1e-6);
        console.info(msg + " UnlitMaterial baseColor factor set to white successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneResourcesUnlitMaterialBaseColor " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneResourcesEnvironmentEnvironmentRotation
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1010
     * @tc.desc   Verify the Environment environmentRotation property supports set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResourcesEnvironmentEnvironmentRotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneResourcesEnvironmentEnvironmentRotation";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();

        let env: scene3d.Environment = scene.environment;
        expect(env != null).assertTrue();

        // 验证默认旋转值
        expect(env.environmentRotation != null).assertTrue();
        expect(Math.abs(env.environmentRotation?.x! - 0.0)).assertLess(1e-6);
        expect(Math.abs(env.environmentRotation?.y! - 0.0)).assertLess(1e-6);
        expect(Math.abs(env.environmentRotation?.z! - 0.0)).assertLess(1e-6);
        expect(Math.abs(env.environmentRotation?.w! - 1.0)).assertLess(1e-6);
        console.info(msg + " Environment environmentRotation default value verified");

        // 设置environmentRotation
        let rotation: scene3d.Quaternion = {x: 0.0, y: 0.0, z: 0.0, w: 1.0};
        env.environmentRotation = rotation;
        expect(env.environmentRotation != null).assertTrue();
        expect(Math.abs(env.environmentRotation?.x! - 0.0)).assertLess(1e-6);
        expect(Math.abs(env.environmentRotation?.y! - 0.0)).assertLess(1e-6);
        expect(Math.abs(env.environmentRotation?.z! - 0.0)).assertLess(1e-6);
        expect(Math.abs(env.environmentRotation?.w! - 1.0)).assertLess(1e-6);
        console.info(msg + " Environment environmentRotation set successfully");

        // 测试不同的旋转值
        let rotation2: scene3d.Quaternion = {x: 0.707, y: 0.0, z: 0.0, w: 0.707};
        env.environmentRotation = rotation2;
        expect(Math.abs(env.environmentRotation?.x! - 0.707)).assertLess(1e-6);
        expect(Math.abs(env.environmentRotation?.w! - 0.707)).assertLess(1e-6);
        console.info(msg + " Environment environmentRotation modified successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneResourcesEnvironmentEnvironmentRotation " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testShaderSetShaderInputs
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1015
     * @tc.desc   Test setShaderInputs method of Shader to set shader inputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderSetShaderInputs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testShaderSetShaderInputs";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != undefined).assertTrue();
        console.info(msg + " scene loaded successfully");

        rf = scene.getResourceFactory();
        shader = await rf.createShader({ name: "CustomShader", uri: $rawfile("shaders/custom_shader/custom_material_sample.shader")});
        expect(shader != undefined).assertTrue();
        console.info(msg + " shader created successfully");

        material = await rf.createMaterial({ name: "CustomMaterial" }, MaterialType.SHADER);
        expect(material != null).assertTrue();
        console.info(msg + " material created successfully");

        if (material) {
          console.info(msg + " material colorShader set start");
          material.colorShader = shader as Shader;
        }

        expect(material?.colorShader != null).assertTrue();
        console.info(msg + " colorShader set successfully");

        // Create a dummy image for testing
        let testImage: scene3d.Image = await rf.createImage({ name: "testImage", uri: $rawfile("gltf/Cube/glTF/Cube_BaseColor.png")});
        console.info(msg + " createImage successfully");

        // Test setShaderInputs with various input types
        if (material && material.colorShader) {
          console.info(msg + " material && material.colorShader == True");
          material.colorShader.setShaderInputs({
            "time": 1.5,
            "vec_1": {x: 1.0, y: 1.0, z: -1.0, w: -1.0},
            "vec_2": {x: 0.0, y: 0.0, z: 0.0},
            "vec_3": {x: 0.0, y: 0.5},
            "BASE_COLOR_Image": testImage
          });
          console.info(msg + " setShaderInputs called successfully");

          // Verify inputs were set
          expect(typeof material.colorShader.inputs["time"]).assertEqual('number');
          expect(material.colorShader.inputs["time"]).assertEqual(1.5);
          console.info(msg + " time input verified");

          expect(material.colorShader.inputs["vec_1"] != null).assertTrue();
          console.info(msg + " vec_1 input verified");

          expect(material.colorShader.inputs["vec_2"] != null).assertTrue();
          console.info(msg + " vec_2 input verified");

          expect(material.colorShader.inputs["vec_3"] != null).assertTrue();
          console.info(msg + " vec_3 input verified");

          expect(material.colorShader.inputs["BASE_COLOR_Image"] != null).assertTrue();
          console.info(msg + " BASE_COLOR_Image input verified");
        }
        else {
          console.info(msg + " material && material.colorShader == False");
          expect(material && material.colorShader).assertTrue();
        }

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testShaderSetShaderInputs " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testMaterialTypeOCCLUSION
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1018
     * @tc.desc   Test MaterialType.OCCLUSION enum value and verify OCCLUSION material can be created
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaterialTypeOCCLUSION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testMaterialTypeOCCLUSION";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != undefined).assertTrue();
        console.info(msg + " scene loaded successfully");

        rf = scene.getResourceFactory();
        expect(rf != null).assertTrue();
        console.info(msg + " resource factory retrieved successfully");

        // Test MaterialType.OCCLUSION enum value
        expect(MaterialType.OCCLUSION).assertEqual(4);
        console.info(msg + " MaterialType.OCCLUSION value is 4");

        // Verify OCCLUSION material can be created
        let occlusionMaterial = await rf.createMaterial({ name: "OcclusionMaterial" }, MaterialType.OCCLUSION);
        expect(occlusionMaterial != null).assertTrue();
        console.info(msg + " OCCLUSION material created successfully");

        // Verify material type is OCCLUSION
        expect(occlusionMaterial?.materialType).assertEqual(MaterialType.OCCLUSION);
        console.info(msg + " material type verified as OCCLUSION");

        // Test all MaterialType enum values for completeness
        expect(MaterialType.SHADER).assertEqual(1);
        console.info(msg + " MaterialType.SHADER value is 1");

        expect(MaterialType.METALLIC_ROUGHNESS).assertEqual(2);
        console.info(msg + " MaterialType.METALLIC_ROUGHNESS value is 2");

        expect(MaterialType.UNLIT).assertEqual(3);
        console.info(msg + " MaterialType.UNLIT value is 3");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testMaterialTypeOCCLUSION " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testMat4x4Properties
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1019
     * @tc.desc   Test Mat4x4 properties: x, y, z, w columns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMat4x4Properties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testMat4x4Properties";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        rf = scene.getResourceFactory();
        let sceneCameraParameter: SceneNodeParameters = { name: "camera1" };
        let camera: scene3d.Camera = await rf.createCamera(sceneCameraParameter);
        expect(camera != null).assertTrue();
        console.info(msg + " camera created successfully");

        camera.enabled = true;
        lookAt(camera, { x: 0, y: 0, z: -3 }, { x: 0, y: 0, z: 0 }, { x: 0, y: 1, z: 0 });

        // Get view matrix
        let viewMatrix: scene3d.Mat4x4 = camera.getViewMatrix();
        expect(viewMatrix != null).assertTrue();
        console.info(msg + " viewMatrix retrieved successfully");

        // Test Mat4x4.x property (first column as Vec4)
        expect(viewMatrix.x != null).assertTrue();
        expect(typeof viewMatrix.x.x).assertEqual('number');
        expect(typeof viewMatrix.x.y).assertEqual('number');
        expect(typeof viewMatrix.x.z).assertEqual('number');
        expect(typeof viewMatrix.x.w).assertEqual('number');
        console.info(msg + " Mat4x4.x property verified as Vec4 with x, y, z, w components");

        // Test Mat4x4.y property (second column as Vec4)
        expect(viewMatrix.y != null).assertTrue();
        expect(typeof viewMatrix.y.x).assertEqual('number');
        expect(typeof viewMatrix.y.y).assertEqual('number');
        expect(typeof viewMatrix.y.z).assertEqual('number');
        expect(typeof viewMatrix.y.w).assertEqual('number');
        console.info(msg + " Mat4x4.y property verified as Vec4 with x, y, z, w components");

        // Test Mat4x4.z property (third column as Vec4)
        expect(viewMatrix.z != null).assertTrue();
        expect(typeof viewMatrix.z.x).assertEqual('number');
        expect(typeof viewMatrix.z.y).assertEqual('number');
        expect(typeof viewMatrix.z.z).assertEqual('number');
        expect(typeof viewMatrix.z.w).assertEqual('number');
        console.info(msg + " Mat4x4.z property verified as Vec4 with x, y, z, w components");

        // Test Mat4x4.w property (fourth column as Vec4)
        expect(viewMatrix.w != null).assertTrue();
        expect(typeof viewMatrix.w.x).assertEqual('number');
        expect(typeof viewMatrix.w.y).assertEqual('number');
        expect(typeof viewMatrix.w.z).assertEqual('number');
        expect(typeof viewMatrix.w.w).assertEqual('number');
        console.info(msg + " Mat4x4.w property verified as Vec4 with x, y, z, w components");

        // Verify each column has proper structure
        expect(viewMatrix.x.x >= 0 || viewMatrix.x.x < 0).assertTrue();
        expect(viewMatrix.x.y >= 0 || viewMatrix.x.y < 0).assertTrue();
        expect(viewMatrix.x.z >= 0 || viewMatrix.x.z < 0).assertTrue();
        expect(viewMatrix.x.w >= 0 || viewMatrix.x.w < 0).assertTrue();
        console.info(msg + " Mat4x4.x components are valid numbers");

        expect(viewMatrix.y.x >= 0 || viewMatrix.y.x < 0).assertTrue();
        expect(viewMatrix.y.y >= 0 || viewMatrix.y.y < 0).assertTrue();
        expect(viewMatrix.y.z >= 0 || viewMatrix.y.z < 0).assertTrue();
        expect(viewMatrix.y.w >= 0 || viewMatrix.y.w < 0).assertTrue();
        console.info(msg + " Mat4x4.y components are valid numbers");

        expect(viewMatrix.z.x >= 0 || viewMatrix.z.x < 0).assertTrue();
        expect(viewMatrix.z.y >= 0 || viewMatrix.z.y < 0).assertTrue();
        expect(viewMatrix.z.z >= 0 || viewMatrix.z.z < 0).assertTrue();
        expect(viewMatrix.z.w >= 0 || viewMatrix.z.w < 0).assertTrue();
        console.info(msg + " Mat4x4.z components are valid numbers");

        expect(viewMatrix.w.x >= 0 || viewMatrix.w.x < 0).assertTrue();
        expect(viewMatrix.w.y >= 0 || viewMatrix.w.y < 0).assertTrue();
        expect(viewMatrix.w.z >= 0 || viewMatrix.w.z < 0).assertTrue();
        expect(viewMatrix.w.w >= 0 || viewMatrix.w.w < 0).assertTrue();
        console.info(msg + " Mat4x4.w components are valid numbers");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testMat4x4Properties " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testMat4x4PropertiesProjectionMatrix
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1020
     * @tc.desc   Test Mat4x4 properties with projection matrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMat4x4PropertiesProjectionMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testMat4x4PropertiesProjectionMatrix";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        rf = scene.getResourceFactory();
        let sceneCameraParameter: SceneNodeParameters = { name: "camera1" };
        let camera: scene3d.Camera = await rf.createCamera(sceneCameraParameter);
        expect(camera != null).assertTrue();
        console.info(msg + " camera created successfully");

        camera.enabled = true;
        lookAt(camera, { x: 0, y: 0, z: -3 }, { x: 0, y: 0, z: 0 }, { x: 0, y: 1, z: 0 });

        // Get projection matrix
        let projectionMatrix: scene3d.Mat4x4 = camera.getProjectionMatrix();
        expect(projectionMatrix != null).assertTrue();
        console.info(msg + " projectionMatrix retrieved successfully");

        // Test Mat4x4.x property on projection matrix
        expect(projectionMatrix.x != null).assertTrue();
        expect(typeof projectionMatrix.x.x).assertEqual('number');
        expect(typeof projectionMatrix.x.y).assertEqual('number');
        expect(typeof projectionMatrix.x.z).assertEqual('number');
        expect(typeof projectionMatrix.x.w).assertEqual('number');
        console.info(msg + " projectionMatrix Mat4x4.x property verified");

        // Test Mat4x4.y property on projection matrix
        expect(projectionMatrix.y != null).assertTrue();
        expect(typeof projectionMatrix.y.x).assertEqual('number');
        expect(typeof projectionMatrix.y.y).assertEqual('number');
        expect(typeof projectionMatrix.y.z).assertEqual('number');
        expect(typeof projectionMatrix.y.w).assertEqual('number');
        console.info(msg + " projectionMatrix Mat4x4.y property verified");

        // Test Mat4x4.z property on projection matrix
        expect(projectionMatrix.z != null).assertTrue();
        expect(typeof projectionMatrix.z.x).assertEqual('number');
        expect(typeof projectionMatrix.z.y).assertEqual('number');
        expect(typeof projectionMatrix.z.z).assertEqual('number');
        expect(typeof projectionMatrix.z.w).assertEqual('number');
        console.info(msg + " projectionMatrix Mat4x4.z property verified");

        // Test Mat4x4.w property on projection matrix
        expect(projectionMatrix.w != null).assertTrue();
        expect(typeof projectionMatrix.w.x).assertEqual('number');
        expect(typeof projectionMatrix.w.y).assertEqual('number');
        expect(typeof projectionMatrix.w.z).assertEqual('number');
        expect(typeof projectionMatrix.w.w).assertEqual('number');
        console.info(msg + " projectionMatrix Mat4x4.w property verified");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testMat4x4PropertiesProjectionMatrix " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testMat4x4PropertyComponents
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1021
     * @tc.desc   Test Mat4x4 property components individually
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMat4x4PropertyComponents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testMat4x4PropertyComponents";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        rf = scene.getResourceFactory();
        let sceneCameraParameter: SceneNodeParameters = { name: "camera1" };
        let camera: scene3d.Camera = await rf.createCamera(sceneCameraParameter);
        expect(camera != null).assertTrue();
        console.info(msg + " camera created successfully");

        camera.enabled = true;
        lookAt(camera, { x: 0, y: 0, z: -3 }, { x: 0, y: 0, z: 0 }, { x: 0, y: 1, z: 0 });

        // Get view matrix
        let viewMatrix: scene3d.Mat4x4 = camera.getViewMatrix();
        expect(viewMatrix != null).assertTrue();

        // Test individual components of each column
        // Test x column components
        let xValue = viewMatrix.x.x;
        expect(typeof xValue).assertEqual('number');
        console.info(msg + " viewMatrix.x.x = " + xValue);

        let yValue = viewMatrix.x.y;
        expect(typeof yValue).assertEqual('number');
        console.info(msg + " viewMatrix.x.y = " + yValue);

        let zValue = viewMatrix.x.z;
        expect(typeof zValue).assertEqual('number');
        console.info(msg + " viewMatrix.x.z = " + zValue);

        let wValue = viewMatrix.x.w;
        expect(typeof wValue).assertEqual('number');
        console.info(msg + " viewMatrix.x.w = " + wValue);

        // Test y column components
        let xValue2 = viewMatrix.y.x;
        expect(typeof xValue2).assertEqual('number');
        console.info(msg + " viewMatrix.y.x = " + xValue2);

        let yValue2 = viewMatrix.y.y;
        expect(typeof yValue2).assertEqual('number');
        console.info(msg + " viewMatrix.y.y = " + yValue2);

        let zValue2 = viewMatrix.y.z;
        expect(typeof zValue2).assertEqual('number');
        console.info(msg + " viewMatrix.y.z = " + zValue2);

        let wValue2 = viewMatrix.y.w;
        expect(typeof wValue2).assertEqual('number');
        console.info(msg + " viewMatrix.y.w = " + wValue2);

        // Test z column components
        let xValue3 = viewMatrix.z.x;
        expect(typeof xValue3).assertEqual('number');
        console.info(msg + " viewMatrix.z.x = " + xValue3);

        let yValue3 = viewMatrix.z.y;
        expect(typeof yValue3).assertEqual('number');
        console.info(msg + " viewMatrix.z.y = " + yValue3);

        let zValue3 = viewMatrix.z.z;
        expect(typeof zValue3).assertEqual('number');
        console.info(msg + " viewMatrix.z.z = " + zValue3);

        let wValue3 = viewMatrix.z.w;
        expect(typeof wValue3).assertEqual('number');
        console.info(msg + " viewMatrix.z.w = " + wValue3);

        // Test w column components
        let xValue4 = viewMatrix.w.x;
        expect(typeof xValue4).assertEqual('number');
        console.info(msg + " viewMatrix.w.x = " + xValue4);

        let yValue4 = viewMatrix.w.y;
        expect(typeof yValue4).assertEqual('number');
        console.info(msg + " viewMatrix.w.y = " + yValue4);

        let zValue4 = viewMatrix.w.z;
        expect(typeof zValue4).assertEqual('number');
        console.info(msg + " viewMatrix.w.z = " + zValue4);

        let wValue4 = viewMatrix.w.w;
        expect(typeof wValue4).assertEqual('number');
        console.info(msg + " viewMatrix.w.w = " + wValue4);

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testMat4x4PropertyComponents " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testMat4x4PropertyComponentsProjection
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1022
     * @tc.desc   Test Mat4x4 property components individually on projection matrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMat4x4PropertyComponentsProjection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testMat4x4PropertyComponentsProjection";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        rf = scene.getResourceFactory();
        let sceneCameraParameter: SceneNodeParameters = { name: "camera1" };
        let camera: scene3d.Camera = await rf.createCamera(sceneCameraParameter);
        expect(camera != null).assertTrue();
        console.info(msg + " camera created successfully");

        camera.enabled = true;
        lookAt(camera, { x: 0, y: 0, z: -3 }, { x: 0, y: 0, z: 0 }, { x: 0, y: 1, z: 0 });

        // Get projection matrix
        let projectionMatrix: scene3d.Mat4x4 = camera.getProjectionMatrix();
        expect(projectionMatrix != null).assertTrue();

        // Test individual components of each column on projection matrix
        // Test x column components
        let xValue = projectionMatrix.x.x;
        expect(typeof xValue).assertEqual('number');
        console.info(msg + " projectionMatrix.x.x = " + xValue);

        let yValue = projectionMatrix.x.y;
        expect(typeof yValue).assertEqual('number');
        console.info(msg + " projectionMatrix.x.y = " + yValue);

        let zValue = projectionMatrix.x.z;
        expect(typeof zValue).assertEqual('number');
        console.info(msg + " projectionMatrix.x.z = " + zValue);

        let wValue = projectionMatrix.x.w;
        expect(typeof wValue).assertEqual('number');
        console.info(msg + " projectionMatrix.x.w = " + wValue);

        // Test y column components
        let xValue2 = projectionMatrix.y.x;
        expect(typeof xValue2).assertEqual('number');
        console.info(msg + " projectionMatrix.y.x = " + xValue2);

        let yValue2 = projectionMatrix.y.y;
        expect(typeof yValue2).assertEqual('number');
        console.info(msg + " projectionMatrix.y.y = " + yValue2);

        let zValue2 = projectionMatrix.y.z;
        expect(typeof zValue2).assertEqual('number');
        console.info(msg + " projectionMatrix.y.z = " + zValue2);

        let wValue2 = projectionMatrix.y.w;
        expect(typeof wValue2).assertEqual('number');
        console.info(msg + " projectionMatrix.y.w = " + wValue2);

        // Test z column components
        let xValue3 = projectionMatrix.z.x;
        expect(typeof xValue3).assertEqual('number');
        console.info(msg + " projectionMatrix.z.x = " + xValue3);

        let yValue3 = projectionMatrix.z.y;
        expect(typeof yValue3).assertEqual('number');
        console.info(msg + " projectionMatrix.z.y = " + yValue3);

        let zValue3 = projectionMatrix.z.z;
        expect(typeof zValue3).assertEqual('number');
        console.info(msg + " projectionMatrix.z.z = " + zValue3);

        let wValue3 = projectionMatrix.z.w;
        expect(typeof wValue3).assertEqual('number');
        console.info(msg + " projectionMatrix.z.w = " + wValue3);

        // Test w column components
        let xValue4 = projectionMatrix.w.x;
        expect(typeof xValue4).assertEqual('number');
        console.info(msg + " projectionMatrix.w.x = " + xValue4);

        let yValue4 = projectionMatrix.w.y;
        expect(typeof yValue4).assertEqual('number');
        console.info(msg + " projectionMatrix.w.y = " + yValue4);

        let zValue4 = projectionMatrix.w.z;
        expect(typeof zValue4).assertEqual('number');
        console.info(msg + " projectionMatrix.w.z = " + zValue4);

        let wValue4 = projectionMatrix.w.w;
        expect(typeof wValue4).assertEqual('number');
        console.info(msg + " projectionMatrix.w.w = " + wValue4);

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testMat4x4PropertyComponentsProjection " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testEffectGetPropertyValue
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1024
     * @tc.desc   Test getPropertyValue method of Effect to get effect property values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectGetPropertyValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testEffectGetPropertyValue";
      console.info(msg + ' begin ');
      try {
        // Load scene and create effect
        let scene = await Scene.load();
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        let rf = scene.getResourceFactory();
        expect(rf != null).assertTrue();
        console.info(msg + " resource factory obtained successfully");

        // Create effect with valid effectId
        let effectParameters: EffectParameters = {effectId: "89b83608-c910-433e-9fd8-22f3ef64eabd"};
        let effect: Effect = await rf.createEffect(effectParameters);
        expect(effect != null).assertTrue();
        console.info(msg + " effect created successfully");

        // Test 1: Get 'thresholdSoft' property value (should return Object)
        let thresholdSoftValue = effect.getPropertyValue('thresholdSoft');
        console.info(msg + " thresholdSoftValue: " + JSON.stringify(thresholdSoftValue));
        expect(thresholdSoftValue != null).assertTrue();
        expect(typeof thresholdSoftValue).assertEqual('number');
        console.info(msg + " thresholdSoft property value retrieved successfully");

        // Test 2: Get 'thresholdHard' property value (should return Object)
        let thresholdHardValue = effect.getPropertyValue('thresholdHard');
        console.info(msg + " thresholdHardValue: " + JSON.stringify(thresholdHardValue));
        expect(thresholdHardValue != null).assertTrue();
        expect(typeof thresholdHardValue).assertEqual('number');
        console.info(msg + " thresholdHard property value retrieved successfully");

        // Test 3: Get non-existent property value (should return null)
        let invalidValue = effect.getPropertyValue('invalidProperty');
        console.info(msg + " invalidValue: " + JSON.stringify(invalidValue));
        expect(invalidValue).assertNull();
        console.info(msg + " non-existent property returns null as expected");

        // Test 4: Get undefined property value (should return undefined)
        let undefinedValue = effect.getPropertyValue(undefined);
        console.info(msg + " undefinedValue: " + JSON.stringify(undefinedValue));
        expect(undefinedValue).assertUndefined();
        console.info(msg + " undefined property returns undefined as expected");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testEffectGetPropertyValue " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testEffectSetPropertyValue
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1025
     * @tc.desc   Test setPropertyValue method of Effect to set effect property values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEffectSetPropertyValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testEffectSetPropertyValue";
      console.info(msg + ' begin ');
      try {
        // Load scene and create effect
        let scene = await Scene.load();
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        let rf = scene.getResourceFactory();
        expect(rf != null).assertTrue();
        console.info(msg + " resource factory obtained successfully");

        // Create effect with valid effectId
        let effectParameters: EffectParameters = {effectId: "89b83608-c910-433e-9fd8-22f3ef64eabd"};
        let effect: Effect = await rf.createEffect(effectParameters);
        expect(effect != null).assertTrue();
        console.info(msg + " effect created successfully");

        // Test 1: Set 'thresholdSoft' property value (should return true)
        let result1 = effect.setPropertyValue('thresholdSoft', 1);
        console.info(msg + " set thresholdSoft result: " + result1);
        expect(result1).assertTrue();
        console.info(msg + " thresholdSoft property set successfully");

        // Verify the value was set
        let thresholdSoftValue = effect.getPropertyValue('thresholdSoft');
        console.info(msg + " thresholdSoftValue after set: " + JSON.stringify(thresholdSoftValue));
        expect(thresholdSoftValue).assertEqual(1);

        // Test 2: Set 'thresholdHard' property value (should return true)
        let result2 = effect.setPropertyValue('thresholdHard', 1);
        console.info(msg + " set thresholdHard result: " + result2);
        expect(result2).assertTrue();
        console.info(msg + " thresholdHard property set successfully");

        // Verify the value was set
        let thresholdHardValue = effect.getPropertyValue('thresholdHard');
        console.info(msg + " thresholdHardValue after set: " + JSON.stringify(thresholdHardValue));
        expect(thresholdHardValue).assertEqual(1);

        // Test 3: Set 'thresholdSoft' property value with undefined (should return true)
        let dataUndefined:undefined;
        let result3 = effect.setPropertyValue('thresholdSoft', dataUndefined);
        console.info(msg + " set thresholdSoft with undefined result: " + result3);
        expect(result3).assertFalse();
        console.info(msg + " thresholdSoft property with undefined set successfully");

        // Verify the value was set
        let thresholdSoftWithUndefineValue = effect.getPropertyValue('thresholdSoft');
        console.info(msg + " thresholdSoftValue with undefined after set: " + JSON.stringify(thresholdSoftWithUndefineValue));
        expect(thresholdSoftWithUndefineValue).assertEqual(1);

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testEffectSetPropertyValue " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}