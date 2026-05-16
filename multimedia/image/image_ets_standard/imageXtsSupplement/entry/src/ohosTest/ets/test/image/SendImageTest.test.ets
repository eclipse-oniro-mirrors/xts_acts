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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image, sendableImage } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { fileIo as fs } from '@kit.CoreFileKit';
import { isEmpty } from '../common';

const TAG = 'xts.Image.SendImageTest';
let pixelMap: sendableImage.PixelMap;


export default function SendImageTest() {
  describe('SendImageTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');

    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00001
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00001
     * @tc.desc   send able image createPixelMap the srcPixelFormat emu the editable is false the scaleMode is FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const formats = [
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCRCB_P010,
        image.PixelMapFormat.ASTC_4x4
      ];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: false,
              srcPixelFormat: format,
              size: { height: 4, width: 6 },
              scaleMode: image.ScaleMode.FIT_TARGET_SIZE
            }
          pixelMap = await sendableImage.createPixelMap(color, opts);
          expect(isEmpty(pixelMap)).assertFalse();
          expect(pixelMap.isEditable).assertFalse();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00002
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00002
     * @tc.desc   send able image createPixelMap the pixelFormat emu the editable is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const formats = [
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: false,
              pixelFormat: format,
              size: { height: 4, width: 6 },
            }
          pixelMap = await sendableImage.createPixelMap(color, opts);
          let res = await pixelMap.getImageInfo();
          expect(res.pixelFormat == format).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00003
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00003
     * @tc.desc   send able image createPixelMap the alphaType emu the isEditable is false the scaleMode is FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const formats = [
        image.AlphaType.OPAQUE,
        image.AlphaType.PREMUL,
        image.AlphaType.UNPREMUL,
      ];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: false,
              alphaType: format,
              size: { height: 4, width: 6 },
              scaleMode: image.ScaleMode.FIT_TARGET_SIZE
            }
          pixelMap = await sendableImage.createPixelMap(color, opts);
          let res = await pixelMap.getImageInfo();
          expect(isEmpty(pixelMap)).assertFalse();
          expect(res.alphaType == format).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00004
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00004
     * @tc.desc   send able image createPixelMap the srcPixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
            size: { height: 4, width: 6 }
          }
        pixelMap = await sendableImage.createPixelMap(color, opts);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error);
        expect(Number(error)).assertEqual(62980096);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00005
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00005
     * @tc.desc   send able image createPixelMap the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            size: { height: 4, width: 6 }
          }
        pixelMap = await sendableImage.createPixelMap(color, opts);
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error);
        expect(Number(error)).assertEqual(62980096);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00006
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00006
     * @tc.desc   send able image createPixelMap the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            size: { height: 4, width: 6 }
          }
        pixelMap = await sendableImage.createPixelMap(color, opts);
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error);
        expect(Number(error)).assertEqual(62980096);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00007
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00007
     * @tc.desc   send able image createPixelMap the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            size: { height: 4, width: 6 }
          }
        pixelMap = await sendableImage.createPixelMap(color, opts);
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error);
        expect(Number(error)).assertEqual(62980096);
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00008
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00008
     * @tc.desc   send able image createPixelMap the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.ASTC_4x4,
            size: { height: 4, width: 6 }
          }
        pixelMap = await sendableImage.createPixelMap(color, opts);
        expect(isEmpty(pixelMap)).assertFalse();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00009
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00009
     * @tc.desc   image createPixelMap the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_00009';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 }
          }
        pixelMap = await sendableImage.createPixelMap(null as ESObject as ArrayBuffer, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000010
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000010
     * @tc.desc   image createPixelMap the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000010';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 }
          }
        pixelMap = await sendableImage.createPixelMap(undefined as ESObject as ArrayBuffer, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000011
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000011
     * @tc.desc   image createPixelMap the second parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        pixelMap = await sendableImage.createPixelMap(color, null as ESObject as image.InitializationOptions);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000012
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000012
     * @tc.desc   image createPixelMap the second parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_000012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        pixelMap = await sendableImage.createPixelMap(color, undefined as ESObject as image.InitializationOptions);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00001
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00001
     * @tc.desc   image createPixelMapSyncSync the srcPixelFormat emu the editable is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const formats = [
        image.PixelMapFormat.UNKNOWN,
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCRCB_P010,
        image.PixelMapFormat.ASTC_4x4
      ];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: true,
              srcPixelFormat: format,
              size: { height: 4, width: 6 }
            }
          pixelMap = sendableImage.createPixelMapSync(color, opts);
          expect(isEmpty(pixelMap)).assertFalse();
          expect(pixelMap.isEditable).assertTrue();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00002
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00002
     * @tc.desc   image createPixelMapSync the pixelFormat emu the scaleMode is FIT_TARGET_SIZE the pixelFormat is ARGB_8888 the editable is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const formats = [
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: false,
              pixelFormat: format,
              size: { height: 4, width: 6 },
              scaleMode: image.ScaleMode.FIT_TARGET_SIZE
            }
          pixelMap = sendableImage.createPixelMapSync(color, opts);
          let res = await pixelMap.getImageInfo();
          expect(res.pixelFormat == format).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00003
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00003
     * @tc.desc   image createPixelMapSync the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00003';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            size: { height: 4, width: 6 }
          }
        pixelMap = sendableImage.createPixelMapSync(null as ESObject as ArrayBuffer, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00004
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00004
     * @tc.desc   image createPixelMapSync the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00004';
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            size: { height: 4, width: 6 }
          }
        pixelMap = sendableImage.createPixelMapSync(undefined as ESObject as ArrayBuffer, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00005
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00005
     * @tc.desc   image createPixelMapSync the the second parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        pixelMap = sendableImage.createPixelMapSync(color, null as ESObject as image.InitializationOptions);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00006
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00006
     * @tc.desc   image createPixelMapSync the the second parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        pixelMap = sendableImage.createPixelMapSync(color, undefined as ESObject as image.InitializationOptions);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00007
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00007
     * @tc.desc   image createPixelMapSync the pixelFormat emu the pixelFormat is RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = sendableImage.createPixelMapSync(color, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, image.PixelMapFormat.RGBA_1010102, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.RGBA_1010102, ' createPixelMap error',
          error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00008
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00008
     * @tc.desc   image createPixelMapSync the pixelFormat emu the pixelFormat is YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = sendableImage.createPixelMapSync(color, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error',
          error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00009
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00009
     * @tc.desc   image createPixelMapSync the pixelFormat emu the pixelFormat is YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_00009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = sendableImage.createPixelMapSync(color, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, image.PixelMapFormat.YCRCB_P010, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCRCB_P010, ' createPixelMap error',
          error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_0000100
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_0000100
     * @tc.desc   image createPixelMapSync the pixelFormat emu the pixelFormat is UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_0000100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_0000100';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.UNKNOWN,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = sendableImage.createPixelMapSync(color, opts);
        expect(isEmpty(pixelMap)).assertFalse();
        let res = await pixelMap.getImageInfo();
        expect(res.pixelFormat == image.PixelMapFormat.UNKNOWN).assertFalse();
        console.info(TAG, testName, image.PixelMapFormat.UNKNOWN, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.UNKNOWN, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000010
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000010
     * @tc.desc   image createPixelMapSync the pixelFormat emu the pixelFormat is ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            pixelFormat: image.PixelMapFormat.ASTC_4x4,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = sendableImage.createPixelMapSync(color, opts);
        expect(isEmpty(pixelMap)).assertFalse();
        let res = await pixelMap.getImageInfo();
        expect(res.pixelFormat == image.PixelMapFormat.ASTC_4x4).assertFalse();
        console.info(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ASTC_4x4, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000011
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000011
     * @tc.desc   image createPixelMapSync the pixelFormat emu the srcPixelFormat is YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = sendableImage.createPixelMapSync(color, opts);
        expect(isEmpty(pixelMap)).assertTrue();
        console.info(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000012
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000012
     * @tc.desc   send able image createPixelMap the alphaType emu the isEditable is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const formats = [
        image.AlphaType.OPAQUE,
        image.AlphaType.PREMUL,
        image.AlphaType.UNPREMUL,
      ];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: false,
              alphaType: format,
              size: { height: 4, width: 6 },
              scaleMode: image.ScaleMode.FIT_TARGET_SIZE
            }
          pixelMap = await sendableImage.createPixelMap(color, opts);
          let res = await pixelMap.getImageInfo();
          expect(isEmpty(pixelMap)).assertFalse();
          expect(res.alphaType == format).assertTrue();
          expect(pixelMap.isEditable).assertFalse();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000013
     * @tc.number SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000013
     * @tc.desc   send able image createPixelMap the alphaType emu the scaleMode emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SEND_ABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_000013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const formats = [
        image.ScaleMode.FIT_TARGET_SIZE,
        image.ScaleMode.CENTER_CROP];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: false,
              scaleMode: format,
              size: { height: 4, width: 6 },
            }
          pixelMap = await sendableImage.createPixelMap(color, opts);
          expect(isEmpty(pixelMap)).assertFalse();
          console.info(TAG, testName, format, ' createPixelMap success');
        } catch (error) {
          console.error(TAG, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });
  })
}
