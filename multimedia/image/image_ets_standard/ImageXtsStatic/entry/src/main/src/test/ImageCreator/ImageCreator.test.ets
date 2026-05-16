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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "../../../../hypium";
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

const TAG = 'ImageXts.creatImageCreator';

export default function CrateImageCreatorTest(): void {
  describe('CrateImageCreatorTest', (): void => {
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
     * @tc.number     SUB_MEDIA_IMAGE_dequeueImage_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_dequeueImage_static_0100
     * @tc.desc       dequeueImage return clipRec,size,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_dequeueImage_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_dequeueImage_static_0100';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      try {
        creator.dequeueImage((err: BusinessError | null , img: image.Image | undefined) => {
          if (err) {
            console.error(TAG, testName, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img!.clipRect));
            console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img!.size));
            console.info(TAG, testName, 'Succeeded in dequeuing the Image', img!.format);
            console.info(TAG, testName, 'Succeeded in dequeuing the Image', img!.timestamp);
            expect(img!.clipRect.size.width).assertEqual(8192);
            expect(img!.clipRect.size.height).assertEqual(8192);
            expect(img!.clipRect.x).assertEqual(0);
            expect(img!.clipRect.y).assertEqual(0);
            expect(img!.size.height).assertEqual(8192);
            expect(img!.size.width).assertEqual(8192);
            expect(img!.format).assertEqual(12);
            expect(img!.timestamp).assertEqual(0);
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await creator.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_dequeueImage_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_dequeueImage_static_0200
     * @tc.desc       dequeueImage return clipRec,size,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_dequeueImage_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_dequeueImage_static_0200';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      try {
        let img = await creator.dequeueImage();
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.clipRect));
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.size));
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', img.format);
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', img.timestamp);
        expect(img.clipRect.size.width).assertEqual(8192);
        expect(img.clipRect.size.height).assertEqual(8192);
        expect(img.clipRect.x).assertEqual(0);
        expect(img.clipRect.y).assertEqual(0);
        expect(img.size.height).assertEqual(8192);
        expect(img.size.width).assertEqual(8192);
        expect(img.format).assertEqual(12);
        expect(img.timestamp).assertEqual(0);
      } catch (error) {
        console.error(TAG, testName, `Failed. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await creator.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IAMGE_createPixelMapSync_static_0100
     * @tc.number SUB_MEDIA_IAMGE_createPixelMapSync_static_0100
     * @tc.desc   createPixelMapSync return isEditable:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IAMGE_createPixelMapSync_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IAMGE_createPixelMapSync_static_0100';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let PixelMap = await image.createPixelMapSync(color, opts);
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
     * @tc.name   SUB_MEDIA_IAMGE_createPixelMapSync_static_0200
     * @tc.number SUB_MEDIA_IAMGE_createPixelMapSync_static_0200
     * @tc.desc   createPixelMapSync return isEditable:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IAMGE_createPixelMapSync_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IAMGE_createPixelMapSync_static_0200';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let PixelMap = await image.createPixelMapSync(color, opts);
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
     * @tc.name   SUB_MEDIA_IAMGE_createPixelMapSync_static_0300
     * @tc.number SUB_MEDIA_IAMGE_createPixelMapSync_static_0300
     * @tc.desc   createPixelMapSync return isStrideAlignment:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IAMGE_createPixelMapSync_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IAMGE_createPixelMapSync_static_0300';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let PixelMap = await image.createPixelMapSync(color, opts);
        console.info(TAG, testName, 'Succeeded in creating pixelmap.', PixelMap);
        expect(PixelMap.isStrideAlignment).assertFalse();
        await PixelMap.release();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageSourceSupportedFormats_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getImageSourceSupportedFormats_static_0100
     * @tc.desc   image.getImageSourceSupportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_getImageSourceSupportedFormats_static_0100', Level.LEVEL1, async (done: () => void)=> {
      const testName = 'SUB_MEDIA_IMAGE_getImageSourceSupportedFormats_static_0100';
      try {
        let formats : string[] = image.getImageSourceSupportedFormats();
        console.info(TAG,'image.getImageSourceSupportedFormats success:', formats);
        expect(formats.length > 0).assertTrue();
      } catch (err) {
        console.info(TAG,`failed; error: ${err}`, err.code, testName);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImagePackerSupportedFormats_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getImagePackerSupportedFormats_static_0100
     * @tc.desc   image.getImagePackerSupportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_getImagePackerSupportedFormats_static_0100', Level.LEVEL1, async (done: () => void)=> {
      const testName = 'SUB_MEDIA_IMAGE_getImagePackerSupportedFormats_static_0100';
      try {
        let formats : string[] = image.getImagePackerSupportedFormats();
        console.info(TAG,'image.getImagePackerSupportedFormats success:', formats);
        expect(formats.length > 0).assertTrue();
      } catch (err) {
        console.info(TAG,`failed; error: ${err}`, err.code, testName);
        expect().assertFail();
      }
      done();
    })
  })
}