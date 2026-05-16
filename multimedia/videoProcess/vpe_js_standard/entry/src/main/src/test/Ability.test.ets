/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import videoProcessingEngine from "@ohos.multimedia.videoProcessingEngine";
import { image } from '@kit.ImageKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        let src: image.PixelMap = image.createPixelMapSync(
            new ArrayBuffer(512 * 512 * 4), {size: { height: 512, width: 512}});
        let targetWidth = 1024;
        let targetHeight = 1024;

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0001
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0001
        * @tc.desc   test create function
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            try {
                let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
                expect(imageProcessor != null).assertTrue();
                done();
            } catch (err) {
                console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0001 failed, error is' + err.message);
                if (err.code != undefined) {
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0002
        * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_0002
        * @tc.desc   test sync interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
                expect(true).assertTrue();
                done();
            }
            if (src != undefined) {
                let sourceImage = src as image.PixelMap;
                try {
                    let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
                    expect(imageProcessor != null).assertTrue();
                    expect(sourceImage.isEditable).assertFalse();
                    expect(sourceImage.isStrideAlignment).assertFalse();
                    expect(sourceImage != null).assertTrue();
                    expect(sourceImage != undefined).assertTrue();
                    expect(targetWidth != undefined).assertTrue();
                    expect(targetHeight != undefined).assertTrue();
                    expect(targetWidth != null).assertTrue();
                    expect(targetHeight != null).assertTrue();
                    let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                        sourceImage, targetWidth, targetHeight);
                    expect(enhancedPixelmap != null).assertTrue();
                    expect(enhancedPixelmap.isEditable).assertFalse();
                    expect(enhancedPixelmap.isStrideAlignment).assertFalse();
                    done();
                } catch (err) {
                    console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0002 failed, error is' + err.message);
                    if (err.code != undefined) {
                        expect(false).assertTrue();
                    }
                    done();
                }
            }
        })


        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0003
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0003
        * @tc.desc   test procedure of high level algo
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
                expect(true).assertTrue();
                done();
            }            
            if (src != undefined) {
                let sourceImage = src as image.PixelMap;
                try {
                    let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
                    expect(imageProcessor != null).assertTrue();
                    let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                        sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.HIGH);
                    expect(enhancedPixelmap != null).assertTrue();
                    done();
                } catch (err) {
                    console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0003 failed, error is' + err.message);
                    if (err.code != undefined) {
                        expect(false).assertTrue();
                    }
                    done();
                }
            }
        })

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0004
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0004
        * @tc.desc   test procedure of medium level algo
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
                expect(true).assertTrue();
                done();
            }
            if (src != undefined) {
                let sourceImage = src as image.PixelMap;
                try {
                    let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
                    expect(imageProcessor != null).assertTrue();
                    let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                        sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.MEDIUM);
                    expect(enhancedPixelmap != null).assertTrue();
                    done();
                } catch (err) {
                    console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0004 failed, error is' + err.message);
                    if (err.code != undefined) {
                        expect(false).assertTrue();
                    }
                    done();
                }
            }
        })

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0005
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0005
        * @tc.desc   test procedure of low level algo
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
                expect(true).assertTrue();
                done();
            }
            if (src != undefined) {
                let sourceImage = src as image.PixelMap;
                try {
                    let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
                    expect(imageProcessor != null).assertTrue();
                    let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                        sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.LOW);
                    expect(enhancedPixelmap != null).assertTrue();
                    done();
                } catch (err) {
                    console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0005 failed, error is' + err.message);
                    if (err.code != undefined) {
                        expect(false).assertTrue();
                    }
                    done();
                }
            }
        })

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0006
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0006
        * @tc.desc   test procedure of NONE level algo
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
                expect(true).assertTrue();
                done();
            }
            if (src != undefined) {
                let sourceImage = src as image.PixelMap;
                try {
                    let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
                    expect(imageProcessor != null).assertTrue();
                    let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                        sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.NONE);
                    expect(enhancedPixelmap != null).assertTrue();
                    done();
                } catch (err) {
                    console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0006 failed, error is' + err.message);
                    if (err.code != undefined) {
                        expect(false).assertTrue();
                    }
                    done();
                }
            }
        })

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0007
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0007
        * @tc.desc   test sync method
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0007", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
                expect(true).assertTrue();
                done();
            }
            if (src != undefined) {
                let sourceImage = src as image.PixelMap;
                try {
                    let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
                    expect(imageProcessor != null).assertTrue();
                    let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                        sourceImage, 2.0, videoProcessingEngine.QualityLevel.NONE);
                    expect(enhancedPixelmap != null).assertTrue();
                    expect(enhancedPixelmap.isEditable).assertFalse();
                    expect(enhancedPixelmap.isStrideAlignment).assertFalse();
                    done();
                } catch (err) {
                    console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0007 failed, error is' + err.message);
                    if (err.code != undefined) {
                        expect(false).assertTrue();
                    }
                    done();
                }
            }
        })

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0008
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0008
        * @tc.desc   test async method
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0008", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
                expect(true).assertTrue();
                done();
            }
            if (src != undefined) {
                let sourceImage = src as image.PixelMap;
                try {
                    let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
                    expect(imageProcessor != null).assertTrue();
                    expect(sourceImage.isEditable).assertFalse();
                    expect(sourceImage.isStrideAlignment).assertFalse();
                    expect(sourceImage != null).assertTrue();
                    expect(sourceImage != undefined).assertTrue();
                    expect(targetWidth != undefined).assertTrue();
                    expect(targetHeight != undefined).assertTrue();
                    expect(targetWidth != null).assertTrue();
                    expect(targetHeight != null).assertTrue();
                    let enhancedPixelmap: image.PixelMap = await imageProcessor.enhanceDetail(
                        sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.NONE);
                    expect(enhancedPixelmap != null).assertTrue();
                    expect(enhancedPixelmap.isEditable).assertFalse();
                    expect(enhancedPixelmap.isStrideAlignment).assertFalse();
                    done();
                } catch (err) {
                    console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0008 failed, error is' + err.message);
                    if (err.code != undefined) {
                        expect(false).assertTrue();
                    }
                    done();
                }
            }
        })

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0009
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0009
        * @tc.desc   test async method
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0009", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
                expect(true).assertTrue();
                done();
            }
            if (src != undefined) {
                let sourceImage = src as image.PixelMap;
                try {
                    let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
                    expect(imageProcessor != null).assertTrue();
                    let enhancedPixelmap: image.PixelMap = await imageProcessor.enhanceDetail(
                        sourceImage, 2.0, videoProcessingEngine.QualityLevel.NONE);
                    expect(enhancedPixelmap != null).assertTrue();
                    expect(enhancedPixelmap.isEditable).assertFalse();
                    expect(enhancedPixelmap.isStrideAlignment).assertFalse();
                    done();
                } catch (err) {
                    console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0009 failed, error is' + err.message);
                    if (err.code != undefined) {
                        expect(false).assertTrue();
                    }
                    done();
                }
            }
        })

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0010
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0010
        * @tc.desc   test initializeEnvironment
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0010", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            try {
                videoProcessingEngine.initializeEnvironment();
                done();
            } catch (err) {
                console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0010 failed, error is' + err.message);
                if (err.code != undefined) {
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0011
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0011
        * @tc.desc   test initializeEnvironment and deinitializeEnvironment
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0011", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            try {
                videoProcessingEngine.initializeEnvironment();
                videoProcessingEngine.deinitializeEnvironment();
                done();
            } catch (err) {
                console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0011 failed, error is' + err.message);
                if (err.code != undefined) {
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0012
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0012
        * @tc.desc   test async method
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0012", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
                expect(true).assertTrue();
                done();
            }
            try {
                let sourceImage = src as image.PixelMap;
                const imageInfo: image.ImageInfo = await sourceImage.getImageInfo();
                let targetWidth = imageInfo.size.width * 2;
                let targetHeight = imageInfo.size.height * 2;
                let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
                expect(imageProcessor != null).assertTrue();
                let enhancedPixelmap: image.PixelMap = await imageProcessor.enhanceDetail(
                    sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.HIGH);
                expect(enhancedPixelmap != null).assertTrue();
                enhancedPixelmap = await imageProcessor.enhanceDetail(
                    sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.MEDIUM);
                expect(enhancedPixelmap != null).assertTrue();
                enhancedPixelmap = await imageProcessor.enhanceDetail(
                    sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.LOW);
                expect(enhancedPixelmap != null).assertTrue();
                enhancedPixelmap = await imageProcessor.enhanceDetail(
                    sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.NONE);
                expect(enhancedPixelmap != null).assertTrue();
                done();
            } catch (err) {
                console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0012 failed, error is' + err.message);
                if (err.code != undefined) {
                    expect(false).assertTrue();
                }
                done();
            }
        })

        /**
        * @tc.name   SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0013
        * @tc.number SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0013
        * @tc.desc   test async method
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it("SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0013", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
                expect(true).assertTrue();
                done();
            }
            try {
                let opts: image.InitializationOptions = {
                    editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {height: 512, width: 512}
                }
                let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
                expect(pixelMap.isEditable).assertTrue();
                let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
                expect(imageProcessor != null).assertTrue();

                let enhancedPixelmap: image.PixelMap  = await imageProcessor.enhanceDetail(
                    pixelMap, 2.0, videoProcessingEngine.QualityLevel.NONE);

                expect(pixelMap.isEditable).assertTrue();
                enhancedPixelmap = imageProcessor.enhanceDetailSync(
                    pixelMap, 2.0, videoProcessingEngine.QualityLevel.NONE);

                expect(pixelMap.isEditable).assertTrue();
                enhancedPixelmap = await imageProcessor.enhanceDetail(
                    pixelMap, 1024, 1024, videoProcessingEngine.QualityLevel.NONE);

                expect(pixelMap.isEditable).assertTrue();
                enhancedPixelmap = imageProcessor.enhanceDetailSync(
                    pixelMap, 1024, 1024, videoProcessingEngine.QualityLevel.NONE);
                done();
            } catch (err) {
                console.info('SUB_MULTIMEDIA_VIDEO_PROCESSING_ENGINE_STATIC_TS_0013 failed, error is' + err.message);
                if (err.code != undefined) {
                    expect(false).assertTrue();
                }
                done();
            }
        })
    })
}