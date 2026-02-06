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
  Animation, EnvironmentBackgroundType, Environment, Node, Geometry, SceneResourceFactory, Scene } from '@ohos.graphics.scene'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import * as scene3d from '@ohos.graphics.scene'
import { GenRandom, sleep } from '../common/utils';

export default function sceneResourcesTest() {
  describe('sceneResourcesTest', ()=> {
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0320
     * @tc.name      : testAnimationStart
     * @tc.desc      : Used to play animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0330
     * @tc.name      : testAnimationPause
     * @tc.desc      : Used to pause animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0340
     * @tc.name      : testAnimationSeek
     * @tc.desc      : Used to set he starting position for playing the animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0350
     * @tc.name      : testAnimationRestart
     * @tc.desc      : Used to add restart animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationRestart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testAnimationRestart";
      console.info(msg + ' begin ');
      try {
        anim.restart();
        console.info(msg + " Succeed in anim.restart() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.restart() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0360
     * @tc.name      : testAnimationStop
     * @tc.desc      : Used to stop animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0370
     * @tc.name      : testAnimationFinished
     * @tc.desc      : Used to the callback function that is executed at the end of the animation playback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0380
     *
     * @tc.name      : testAnimationDuration
     * @tc.desc      : Used to get length of animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0390
     * @tc.name      : testAnimationEnabled
     * @tc.desc      : Used to set weather the animation is enable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0400
     * @tc.name      : testEnvironmentIndirectDiffuseFactor
     * @tc.desc      : Used to set environment indirectDiffuseFactor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0410
     * @tc.name      : testEnvironmentIndirectSpecularFactor
     * @tc.desc      : Used to set environment indirectSpecularFactor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0420
     * @tc.name      : testEnvironmentMapFactor
     * @tc.desc      : Used to set environment environmentMapFactor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0430
     * @tc.name      : testEnvironmentImage
     * @tc.desc      : Used to set environment environmentImage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0440
     * @tc.name      : testRadianceImage
     * @tc.desc      : Used to set environment radianceImage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0450
     * @tc.name      : testEnvironmentIrradianceCoefficients
     * @tc.desc      : Used to set environment irradianceCoefficients
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0460
     * @tc.name      : testMesh
     * @tc.desc      : Used to get mesh of geometry
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0470
     * @tc.name      : testSceneResourceType
     * @tc.desc      : Used to get resourceType of resource
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0480
     * @tc.name      : testSceneResource
     * @tc.desc      : Used to get attribute of resource
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0490
     * @tc.name      : testSceneResource
     * @tc.desc      : Used to get materialType of material
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0760
     * @tc.name      : testMaterialType_METALLIC_ROUGHNESS
     * @tc.desc      : Verify that METALLIC_ROUGHNESS material can be created and its basic properties are set correctly
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0770
     * @tc.name      : testCullMode
     * @tc.desc      : Verify that the material's cullMode supports NONE, FRONT, and BACK modes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0780
     * @tc.name      : testBlend
     * @tc.desc      : Verify the assignment and retrieval of the blend.enabled property in the material
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0790
     * @tc.name      : testRenderSort
     * @tc.desc      : Verify material’s renderSortLayer and renderSortLayerOrder can be set and read correctly
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0800
     * @tc.name      : testMaterial
     * @tc.desc      : verifies that key rendering properties of the Material interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0810
     * @tc.name      : testMaterialProperty_image_factor_sampler
     * @tc.desc      : Verifies setting and accessing image, factor, and sampler properties of MaterialProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0820
     * @tc.name      : testMetallicRoughnessMaterial
     * @tc.desc      : Verifies that all MaterialProperty-type attributes in MetallicRoughnessMaterial exist and are accessible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0830
     * @tc.name      : testSamplerFilter
     * @tc.desc      : Verifies that the SamplerFilter enum values NEAREST and LINEAR are correctly defined as 0 and 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0840
     * @tc.name      : testSamplerAddressMode
     * @tc.desc      : Verifies that SamplerAddressMode enum values are correctly
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0850
     * @tc.name      : testSampler_mipMapMode
     * @tc.desc      : Verify whether the mipMapMode attribute can be properly set and read
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0860
     * @tc.name      : testSampler_minFilter_and_magFilter
     * @tc.desc      : Verify whether the minFilter and magFilter properties can be set and read normally
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0870
     * @tc.name      : testSampler_addressModeU
     * @tc.desc      : Verify the assignment and state switching logic of Sampler.addressModeU
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0880
     * @tc.name      : testSampler_addressModeV
     * @tc.desc      : Verify the assignment and state switching logic of Sampler.addressModeV
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0890
     * @tc.name      : testAnimation_speed
     * @tc.desc      : Verify whether the speed attribute of Animation can be successfully assigned
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
  })
}