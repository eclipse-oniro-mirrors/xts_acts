/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level} from "../../../../../hypium";
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import resourceManager from "@ohos.resourceManager";
import { $r, Context, Resource } from "@kit.ArkUI";

const TAG = 'ImageXts.creatImageSource';


export default function CrateImageSourceTest(): void {
  describe('CrateImageSourceTest', (): void => {
    let context: Context = Hypium.get("Context") as Context;
    let filePath: string = '';
    let fdNumber: int;

    const getFd = (fileName: string): int => {
      filePath = context.filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      fdNumber = file.fd as int;
      return fdNumber;
    };
    const getFilePath = async (fileName: string): Promise<string> => {
      let filePath = context.filesDir + "/" + fileName;

      return filePath;
    }

    const getBuffer = (fileName: string) => {
      const filePath = context.filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead;
    }

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_0100
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_0100
     * @tc.desc   createImageSource return supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_0100';
      try {
        let filePath = await getFilePath("test_exif_v2.jpg");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `succeeded`, imageSourceObj?.supportedFormats);
        console.info(TAG, testName, `succeeded`, filePath);
        expect(imageSourceObj?.supportedFormats != undefined).assertTrue();
        await imageSourceObj?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_0200
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_0200
     * @tc.desc   createImageSource cover pixelFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_0200';
      const pixelFormats = [
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCBCR_P010,
        image.PixelMapFormat.YCRCB_P010,
        image.PixelMapFormat.ASTC_4x4,
      ];
      try {
        for (const format of pixelFormats) {
          let filePath = await getFilePath("test_exif_v2.jpg");
          let sourceOptions: image.SourceOptions = {
            sourceDensity: 120,
            sourcePixelFormat: format,
            sourceSize: { height: 4, width: 6 },
          };
          const imageSourceObj = image.createImageSource(filePath, sourceOptions);
          console.warn(TAG, testName, `Testing format ${format} succeeded`);
          expect(imageSourceObj != null).assertTrue();
          await imageSourceObj?.release();
        }
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_0300
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_0300
     * @tc.desc   createImageSource return supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_0300';
      try {
        let filePath = await getFilePath("test_exif_v2.jpg");
        let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath,sourceOptions);
        console.info(TAG, testName, `succeeded`, imageSourceObj?.supportedFormats);
        expect(imageSourceObj?.supportedFormats != null).assertTrue();
        await imageSourceObj?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_0400
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_0400
     * @tc.desc   createImageSource return supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_0400';
      try {
        getFd("test_exif_v2.jpg");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fdNumber);
        console.info(TAG, testName, `succeeded`, imageSourceObj?.supportedFormats);
        expect(imageSourceObj?.supportedFormats != null).assertTrue();
        await imageSourceObj?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_0500
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_0500
     * @tc.desc   createImageSource cover pixelFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_0500';
      const pixelFormats = [
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCBCR_P010,
        image.PixelMapFormat.YCRCB_P010,
        image.PixelMapFormat.ASTC_4x4,
      ];
      try {
        for (const format of pixelFormats) {
          getFd("test_exif_v2.jpg");
          let sourceOptions: image.SourceOptions = {
            sourceDensity: 120,
            sourcePixelFormat: format,
            sourceSize: { height: 4, width: 6 },
          };
          const imageSourceObj = image.createImageSource(fdNumber, sourceOptions);
          console.warn(TAG, testName, `Testing format ${format} succeeded`);
          expect(imageSourceObj != null).assertTrue();
          await imageSourceObj?.release();
        }
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_0600
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_0600
     * @tc.desc   createImageSource return supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_0600';
      try {
        getFd("test_exif_v2.jpg");
        let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
        const imageSourceObj = image.createImageSource(fdNumber, sourceOptions);
        console.info(TAG, testName, `succeeded`, imageSourceObj?.supportedFormats);
        expect(imageSourceObj?.supportedFormats != null).assertTrue();
        await imageSourceObj?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_0700
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_0700
     * @tc.desc   createImageSource return supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_0700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_0700';
      try {
        const buf: ArrayBuffer = new ArrayBuffer(96);
        const imageSourceObj = image.createImageSource(buf);
        console.info(TAG, testName, `succeeded`, imageSourceObj?.supportedFormats);
        expect(imageSourceObj?.supportedFormats != null).assertTrue();
        await imageSourceObj?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_0800
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_0800
     * @tc.desc   createImageSource cover sourcePixelFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_0800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_0800';
      const pixelFormats = [
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCBCR_P010,
        image.PixelMapFormat.YCRCB_P010,
        image.PixelMapFormat.ASTC_4x4,
      ];
      try {
        for (const format of pixelFormats) {
          const data: ArrayBuffer = new ArrayBuffer(112);
          let sourceOptions: image.SourceOptions = {
            sourceDensity: 120,
            sourcePixelFormat: format,
            sourceSize: { height: 4, width: 6 },
          };
          const imageSourceObj = image.createImageSource(data, sourceOptions);
          console.warn(TAG, testName, `Testing format ${format} succeeded`);
          expect(imageSourceObj != null).assertTrue();
          await imageSourceObj?.release();
        }
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_0900
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_0900
     * @tc.desc   createImageSource return supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_0900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_0900';
      try {
        const data: ArrayBuffer = new ArrayBuffer(96);
        let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
        const imageSourceObj = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, `succeeded`, imageSourceObj?.supportedFormats);
        expect(imageSourceObj?.supportedFormats != null).assertTrue();
        await imageSourceObj?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_1000
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_1000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_1000';
      const pixelFormats = [
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCBCR_P010,
        image.PixelMapFormat.YCRCB_P010,
        image.PixelMapFormat.ASTC_4x4,
      ];
      try {
        for (const format of pixelFormats) {
          let sourceOptions: image.SourceOptions = {
            sourceDensity: 120,
            sourcePixelFormat: format,
            sourceSize: { height: 4, width: 6 },
          };
          const resourceMgr: resourceManager.ResourceManager = context.resourceManager;
          resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
            const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
            console.warn(TAG, testName, `Testing format ${format} succeeded`);
            expect(imageSourceObj != null).assertTrue();
          })
        }
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_1100
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_1100
     * @tc.desc   createImageSource return supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_1100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_1100';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ARGB_8888,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = context.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, `succeeded`, imageSourceObj?.supportedFormats);
          expect(imageSourceObj?.supportedFormats != null).assertTrue();
        })
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createIncrementalSource_static_0100
     * @tc.number SUB_MEDIA_IMAGE_createIncrementalSource_static_0100
     * @tc.desc   createIncrementalSource return supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
    //  */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_0100';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1));
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, `succeeded`);
        expect(imageSourceIncrementalSApi?.supportedFormats != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_0200
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_0200
     * @tc.desc       CreateIncrementalSource cover sourceDensity,sourcePixelFormat,sourceSize
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_0200';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ARGB_8888,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi);
        expect(imageSourceIncrementalSApi != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      }finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_0300
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_0300
     * @tc.desc       CreateIncrementalSource return supportedFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_0300';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi!.supportedFormats != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_0400
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_0400
     * @tc.desc       CreateIncrementalSource return supportedFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_0400';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      const pixelFormats = [
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCBCR_P010,
        image.PixelMapFormat.YCRCB_P010,
        image.PixelMapFormat.ASTC_4x4,
      ];
      try {
        for (const format of pixelFormats) {
          let sourceOptions: image.SourceOptions = {
            sourceDensity: 120,
            sourcePixelFormat: format,
            sourceSize: {
              height: 100,
              width: 100
            }
          };
          let testimagebuffer = getBuffer("test_exif_v2.jpg");
          let bufferSize = testimagebuffer.byteLength;
          let offset: int = 0;
          imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
          let isFinished: boolean = false;
          let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
          await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
          console.info(TAG, testName, `Testing format ${format} succeeded`);
          expect(imageSourceIncrementalSApi != null).assertTrue();
        }
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImagePacker_static_0100
     * @tc.number SUB_MEDIA_IMAGE_createImagePacker_static_0100
     * @tc.desc   createImagePacker return supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImagePacker_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImagePacker_static_0100';
      try {
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, `succeeded`, imagePackerObj?.supportedFormats);
        expect(imagePackerObj?.supportedFormats != null).assertTrue();
        await imagePackerObj?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageReceiver_static_0100
     * @tc.number SUB_MEDIA_IMAGE_createImageReceiver_static_0100
     * @tc.desc   createImageReceiver return size,capacity,format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0100';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'succeed', JSON.stringify(receiver));
        expect(receiver!.size.height).assertEqual(8192);
        expect(receiver!.size.width).assertEqual(8192);
        expect(receiver!.capacity).assertEqual(8);
        expect(receiver!.format).assertEqual(2000);
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageReceiver_static_0200
     * @tc.number SUB_MEDIA_IMAGE_createImageReceiver_static_0200
     * @tc.desc   createImageReceiver cover image.ImageFormat.YCBCR_422_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0200';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.YCBCR_422_SP, 8);
        console.info(TAG, testName, 'succeed', JSON.stringify(receiver));
        expect().assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageReceiver_static_0300
     * @tc.number SUB_MEDIA_IMAGE_createImageReceiver_static_0300
     * @tc.desc   createImageReceiver return supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0300';
      try {
        let options: image.ImageReceiverOptions = {
          size: { width: 480, height: 480 },
          capacity: 3
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(options);
        expect(receiver!.size.height).assertEqual(480);
        expect(receiver!.size.width).assertEqual(480);
        expect(receiver!.capacity).assertEqual(3);
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageCreator_static_0100
     * @tc.number SUB_MEDIA_IMAGE_createImageCreator_static_0100
     * @tc.desc   createImageCreator return capacity,format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageCreator_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageCreator_static_0100';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'succeed', JSON.stringify(creator));
        expect(creator.capacity).assertEqual(8);
        expect(creator.format).assertEqual(2000);
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageCreator_static_0200
     * @tc.number SUB_MEDIA_IMAGE_createImageCreator_static_0200
     * @tc.desc   createImageCreator cover YCBCR_422_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageCreator_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageCreator_static_0200';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'succeed', JSON.stringify(creator));
        expect(creator != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPicture_static_0100
     * @tc.number SUB_MEDIA_IMAGE_createPicture_static_0100
     * @tc.desc   createPicture cover editable:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPicture_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPicture_static_0100';
      try {
        getFd('test_exif_v2.jpg');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fdNumber);
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: true,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
          index: 0,
        };
        const commodityPixelMap = await imageSourceObj!.createPixelMap(decodeOpts);
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap!);
        console.info(TAG, testName, 'succeed',pictureObj);
        expect(pictureObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPicture_static_0200
     * @tc.number SUB_MEDIA_IMAGE_createPicture_static_0200
     * @tc.desc   createPicture cover editable:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPicture_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPicture_static_0200';
      try {
        getFd('test_exif_v2.jpg');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fdNumber);
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
          index: 0,
        };
        const commodityPixelMap = await imageSourceObj!.createPixelMap(decodeOpts);
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap!);
        console.info(TAG, testName, 'succeed',pictureObj);
        expect(pictureObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0100
     * @tc.number SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0100
     * @tc.desc   createAuxiliaryPicture cover auxType枚举
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createAuxiliaryPicture_static_0100';
      const resourceMgr = context.resourceManager;
      const rawFile = await resourceMgr.getRawFileContent("test_exif_v2.jpg");
      let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
      let auxSize: image.Size = { height: 180, width: 240 };
      const AuxType = [
        image.AuxiliaryPictureType.GAINMAP,
        image.AuxiliaryPictureType.DEPTH_MAP,
        image.AuxiliaryPictureType.UNREFOCUS_MAP,
        image.AuxiliaryPictureType.LINEAR_MAP,
        image.AuxiliaryPictureType.FRAGMENT_MAP,
      ];
      try {
        for (const Type of AuxType) {
          let auxType = Type;
          let auxPictureObj: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
          console.info(TAG, testName, `createAuxiliaryPicture success: ${auxPictureObj}`);
          console.warn(TAG, testName, `Testing Type ${Type} succeeded`);
          expect(auxPictureObj != undefined).assertTrue();
          done();
        }
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_0100
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_0100
     * @tc.desc   createPixelMap return isEditable:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_0100';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG, testName, 'Succeeded in creating pixelmap.', PixelMap);
        expect(PixelMap.isEditable).assertTrue();
        await PixelMap.release();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_0200
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_0200
     * @tc.desc   createPixelMap return isEditable:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_0200';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG, testName, 'Succeeded in creating pixelmap.', PixelMap);
        expect(PixelMap.isEditable).assertFalse();
        await PixelMap.release();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_0300
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_0300
     * @tc.desc   createPixelMap return isStrideAlignment:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_0300';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG, testName, 'Succeeded in creating pixelmap.', PixelMap);
        expect(PixelMap.isStrideAlignment).assertFalse();
        await PixelMap.release();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

  })
}