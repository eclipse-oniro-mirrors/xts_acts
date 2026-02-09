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

 import videoProcessingEngine from '@ohos.multimedia.videoProcessingEngine';
 import { image } from '@kit.ImageKit';
 import { describe, it, expect, Level } from '@ohos/hypium';
 import { abilityDelegatorRegistry } from '@kit.TestKit';
 import { fileIo as fs } from '@kit.CoreFileKit';

 let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
 let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;

 export default function videoProcessTsTest() {
    describe('VideoProcessTsTest', () => {
        abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let moduleName = abilityDelegatorArguments.parameters['-m'];
        let context = abilityDelegator.getAppContext().getApplicationContext().createModuleContext(moduleName);
        let mResourceManager = context.resourceManager;
        let imageSource: image.ImageSource = image.createImageSource(mResourceManager.getRawFdSync('sample_image.png'));
    
    /**
     * @tc.name   testVideoProcessTs001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_001
     * @tc.desc   test create function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVideoProcessTs001', Level.LEVEL0, async(done: Function) => {
        try {
            let sourceImage = await imageSource.createPixelMap() as image.PixelMap;
            const imageInfo: image.ImageInfo = await sourceImage.getImageInfo();
            let targetWidth = imageInfo.size.width * 2;
            let targetHeight = imageInfo.size.height * 2;
            let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
            expect(imageProcessor != null).assertTrue();
            done();
        } catch (err) {
            console.info('testVideoProcessTs001 failed, error is' + err.message);
            if (err.code != undefined) {
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   testVideoProcessTs002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_002
     * @tc.desc   test sync interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVideoProcessTs002', Level.LEVEL0, async(done: Function) => {
        if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
            expect(true).assertTrue();
            done();
        }
        try {
            let sourceImage = await imageSource.createPixelMap() as image.PixelMap;
            const imageInfo: image.ImageInfo = await sourceImage.getImageInfo();
            let targetWidth = imageInfo.size.width * 2;
            let targetHeight = imageInfo.size.height * 2;
            let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
            expect(imageProcessor != null).assertTrue();
            let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                sourceImage, targetWidth, targetHeight);
            expect(enhancedPixelmap != null).assertTrue();
            done();
        } catch (err) {
            console.info('testVideoProcessTs002 failed, error is' + err.message);
            if (err.code != undefined) {
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   testVideoProcessTs003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_003
     * @tc.desc   test procedure of high level algo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVideoProcessTs003', Level.LEVEL0, async(done: Function) => {
        if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
            expect(true).assertTrue();
            done();
        }
        try {
            let sourceImage = await imageSource.createPixelMap() as image.PixelMap;
            const imageInfo: image.ImageInfo = await sourceImage.getImageInfo();
            let targetWidth = imageInfo.size.width * 2;
            let targetHeight = imageInfo.size.height * 2;
            let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
            expect(imageProcessor != null).assertTrue();
            let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.HIGH);
            expect(enhancedPixelmap != null).assertTrue();
            done();
        } catch (err) {
            console.info('testVideoProcessTs003 failed, error is' + err.message);
            if (err.code != undefined) {
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   testVideoProcessTs004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_004
     * @tc.desc   test procedure of medium level algo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVideoProcessTs004', Level.LEVEL0, async(done: Function) => {
        if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
            expect(true).assertTrue();
            done();
        }
        try {
            let sourceImage = await imageSource.createPixelMap() as image.PixelMap;
            const imageInfo: image.ImageInfo = await sourceImage.getImageInfo();
            let targetWidth = imageInfo.size.width * 2;
            let targetHeight = imageInfo.size.height * 2;
            let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
            expect(imageProcessor != null).assertTrue();
            let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.MEDIUM);
            expect(enhancedPixelmap != null).assertTrue();
            done();
        } catch (err) {
            console.info('testVideoProcessTs004 failed, error is' + err.message);
            if (err.code != undefined) {
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   testVideoProcessTs005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_005
     * @tc.desc   test procedure of low level algo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVideoProcessTs005', Level.LEVEL0, async(done: Function) => {
        if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
            expect(true).assertTrue();
            done();
        }
        try {
            let sourceImage = await imageSource.createPixelMap() as image.PixelMap;
            const imageInfo: image.ImageInfo = await sourceImage.getImageInfo();
            let targetWidth = imageInfo.size.width * 2;
            let targetHeight = imageInfo.size.height * 2;
            let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
            expect(imageProcessor != null).assertTrue();
            let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.LOW);
            expect(enhancedPixelmap != null).assertTrue();
            done();
        } catch (err) {
            console.info('testVideoProcessTs005 failed, error is' + err.message);
            if (err.code != undefined) {
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   testVideoProcessTs006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_006
     * @tc.desc   test procedure of NONE level algo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVideoProcessTs006', Level.LEVEL0, async(done: Function) => {
        if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
            expect(true).assertTrue();
            done();
        }
        try {
            let sourceImage = await imageSource.createPixelMap() as image.PixelMap;
            const imageInfo: image.ImageInfo = await sourceImage.getImageInfo();
            let targetWidth = imageInfo.size.width * 2;
            let targetHeight = imageInfo.size.height * 2;
            let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
            expect(imageProcessor != null).assertTrue();
            let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.NONE);
            expect(enhancedPixelmap != null).assertTrue();
            done();
        } catch (err) {
            console.info('testVideoProcessTs006 failed, error is' + err.message);
            if (err.code != undefined) {
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   testVideoProcessTs007
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_007
     * @tc.desc   test sync method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVideoProcessTs007', Level.LEVEL0, async(done: Function) => {
        if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
            expect(true).assertTrue();
            done();
        }
        try {
            let sourceImage = await imageSource.createPixelMap() as image.PixelMap;
            let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
            expect(imageProcessor != null).assertTrue();
            let enhancedPixelmap: image.PixelMap = imageProcessor.enhanceDetailSync(
                sourceImage, 2, videoProcessingEngine.QualityLevel.NONE);
            expect(enhancedPixelmap != null).assertTrue();
            done();
        } catch (err) {
            console.info('testVideoProcessTs007 failed, error is' + err.message);
            if (err.code != undefined) {
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   testVideoProcessTs008
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_008
     * @tc.desc   test async method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVideoProcessTs008', Level.LEVEL0, async(done: Function) => {
        if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
            expect(true).assertTrue();
            done();
        }
        try {
            let sourceImage = await imageSource.createPixelMap() as image.PixelMap;
            const imageInfo: image.ImageInfo = await sourceImage.getImageInfo();
            let targetWidth = imageInfo.size.width * 2;
            let targetHeight = imageInfo.size.height * 2;
            let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
            expect(imageProcessor != null).assertTrue();
            let enhancedPixelmap: image.PixelMap = await imageProcessor.enhanceDetail(
                sourceImage, targetWidth, targetHeight, videoProcessingEngine.QualityLevel.NONE);
            expect(enhancedPixelmap != null).assertTrue();
            done();
        } catch (err) {
            console.info('testVideoProcessTs008 failed, error is' + err.message);
            if (err.code != undefined) {
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   testVideoProcessTs009
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_009
     * @tc.desc   test async method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVideoProcessTs009', Level.LEVEL0, async(done: Function) => {
        if (!fs.accessSync("/system/lib64/libvideoprocessingengine_ext.z.so")) {
            expect(true).assertTrue();
            done();
        }
        try {
            let sourceImage = await imageSource.createPixelMap() as image.PixelMap;
            let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.ImageProcessor;
            expect(imageProcessor != null).assertTrue();
            let enhancedPixelmap: image.PixelMap = await imageProcessor.enhanceDetail(
                sourceImage, 2, videoProcessingEngine.QualityLevel.NONE);
            expect(enhancedPixelmap != null).assertTrue();
            done();
        } catch (err) {
            console.info('testVideoProcessTs009 failed, error is' + err.message);
            if (err.code != undefined) {
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   testVideoProcessTs010
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_010
     * @tc.desc   test initializeEnvironment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVideoProcessTs010', Level.LEVEL0, async(done: Function) => {
        try {
            videoProcessingEngine.initializeEnvironment();
            done();
        } catch (err) {
            console.info('testVideoProcessTs010 failed, error is' + err.message);
            if (err.code != undefined) {
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   testVideoProcessTs011
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_VIDEO_PROCESS_TS_011
     * @tc.desc   test initializeEnvironment and deinitializeEnvironment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVideoProcessTs011', Level.LEVEL0, async(done: Function) => {
        try {
            videoProcessingEngine.initializeEnvironment();
            videoProcessingEngine.deinitializeEnvironment();
            done();
        } catch (err) {
            console.info('testVideoProcessTs011 failed, error is' + err.message);
            if (err.code != undefined) {
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        }
    });
    })
 }