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
        scene0 = await Scene.load($rawfile("gltf/BrainStem/glTF/BrainStem.gltf"));
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
        expect(true).assertTrue();
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
        scene1 = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.gltf"));
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
        scene2 = await Scene.load($rawfile("gltf/Cube/glTF/Cube.gltf"));
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
  })
}


function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

function GenRandom(): number {
  return Math.random() * 2 - 1;
}
