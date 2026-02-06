import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';
import call from '@ohos.telephony.call';


const TAG = LOG_TAG + 'CreateUnpremultipliedPixelMapTestSupp';

async function createUnpremultipliedPixelMapPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  optsForPre: image.InitializationOptions, optsForUnpre: image.InitializationOptions, callback: () => void) {
  try {
    let bufferArr = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[i+1] = 255;
      bufferArr[i+2] = 122;
      bufferArr[i+3] = 122;
    }
    let srcPixelmap = await image.createPixelMapSync(color, optsForPre);
    console.info(TAG,testName,'srcPixelmap')
    let dstPixelMap = await image.createPixelMapSync(optsForUnpre);
    console.info(TAG,testName,'dstPixelMap')
    await image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap);
    done();
  } catch (error) {
    console.info(TAG,testName, `failed; error: ${error},${error.code}`, testName);
    callback();
    done();
  }
}


export default function ImageCreateUnpremultipliedPixelMapTest() {
  describe('ImageCreateUnpremultipliedPixelMapTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('stringKey', 'stringValue')
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
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_001
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_001
     * @tc.desc   正常参数测试（Promise方式）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_001';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre, () => {
        expect().assertFail()
      });
      done()
    });

    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_002
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_002
     * @tc.desc   第1个参数为null（Promise方式）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_002';
      const color: ArrayBuffer = new ArrayBuffer(16);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      try {
        const dst =  image.createPixelMapSync(color, opts);
        console.info(TAG,testName,'createPixelMapSync',dst)
        await image.createUnpremultipliedPixelMap(null, dst);
        console.info(TAG,testName, `createUnpremultipliedPixelMap succeeded`);
        done();
      } catch (error) {
        console.error(TAG,testName, `caught expected error`,error,error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_003
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_003
     * @tc.desc   第1个参数为undefined（Promise方式）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_003';
      const color: ArrayBuffer = new ArrayBuffer(16);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      try {
        const dst =  image.createPixelMapSync(color, opts);
        console.info(TAG,testName,'createPixelMapSync',dst)
        await image.createUnpremultipliedPixelMap(undefined, dst);
        console.info(TAG,testName, `createUnpremultipliedPixelMap succeeded`);
        done();
      } catch (error) {
        console.error(TAG,testName, `caught expected error`,error,error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_004
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_004
     * @tc.desc   第2个参数为null（Promise方式）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_004';
      const color: ArrayBuffer = new ArrayBuffer(16);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      try {
        const src =  image.createPixelMapSync(color, opts);
        console.info(TAG,testName,'createPixelMapSync',src)
        await image.createUnpremultipliedPixelMap(src, null);
        console.info(TAG,testName, `createUnpremultipliedPixelMap succeeded`);
        done();
      } catch (error) {
        console.error(TAG,testName, `caught expected error`,error,error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_005
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_005
     * @tc.desc   第2个参数为undefined（Promise方式）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_005';
      const color: ArrayBuffer = new ArrayBuffer(16);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      try {
        const src =  image.createPixelMapSync(color, opts);
        console.info(TAG,testName,'createPixelMapSync',src)
        await image.createUnpremultipliedPixelMap(src, undefined);
        console.info(TAG,testName, `createUnpremultipliedPixelMap succeeded`);
        done();
      } catch (error) {
        console.error(TAG,testName, `caught expected error`,error,error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_006
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_006
     * @tc.desc   第1个参数为null（Callback方式）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_006';
      const color: ArrayBuffer = new ArrayBuffer(16);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      try {
        const dst =  image.createPixelMapSync(color, opts);
        console.info(TAG,testName,'createPixelMapSync',dst)
        await image.createUnpremultipliedPixelMap(null, dst);
        console.info(TAG,testName, `createUnpremultipliedPixelMap succeeded`);
        done();
      } catch (error) {
        console.error(TAG,testName, `caught expected error`,error,error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_007
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_007
     * @tc.desc   第1个参数为undefined（Callback方式）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_007';
      const color: ArrayBuffer = new ArrayBuffer(16);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      try {
        const dst =  image.createPixelMapSync(color, opts);
        console.info(TAG,testName,'createPixelMapSync',dst)
        await image.createUnpremultipliedPixelMap(undefined, dst);
        console.info(TAG,testName, `createUnpremultipliedPixelMap succeeded`);
        done();
      } catch (error) {
        console.error(TAG,testName, `caught expected error`,error,error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_008
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_008
     * @tc.desc   第2个参数为null（Callback方式）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_008';
      const color: ArrayBuffer = new ArrayBuffer(16);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      try {
        const src =  image.createPixelMapSync(color, opts);
        console.info(TAG,testName,'createPixelMapSync',src)
        await image.createUnpremultipliedPixelMap(src, null);
        console.info(TAG,testName, `createUnpremultipliedPixelMap succeeded`);
        done();
      } catch (error) {
        console.error(TAG,testName, `caught expected error`,error,error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_009
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_009
     * @tc.desc   第2个参数为undefined（Callback方式）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_009';
      const color: ArrayBuffer = new ArrayBuffer(16);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      try {
        const src =  image.createPixelMapSync(color, opts);
        console.info(TAG,testName,'createPixelMapSync',src)
        await image.createUnpremultipliedPixelMap(src, undefined);
        console.info(TAG,testName, `createUnpremultipliedPixelMap succeeded`);
        done();
      } catch (error) {
        console.error(TAG,testName, `caught expected error`,error,error.code);
        expect().assertFail();
        done();
      }
    });
  });
}