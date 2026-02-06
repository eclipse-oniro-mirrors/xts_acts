import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';

const TAG = 'ImageCreatePixelMapTest';


export default function ImageCreatePixelMapPicture() {
  describe('ImageCreatePixelMapPicture', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate("emptyString", "");
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete("emptyString");
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number     SUB_IMAGE_CREATE_PIXELMAP_001
     * @tc.name       SUB_IMAGE_CREATE_PIXELMAP_001
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_CREATE_PIXELMAP_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXELMAP_001';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        image.createPixelMap(undefined, opts, (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, `Failed to create pixelmap. `, JSON.stringify(error), error.code);
            expect(error).not().assertUndefined();
            done();
          } else {
            console.info(TAG, testName, 'Succeeded in creating pixelmap.', JSON.stringify(pixelMap));
            expect(pixelMap).not().assertUndefined();
            done();
          }
        })
        done();
      } catch (error) {
        console.info(TAG, testName, 'creating pixelmap fail', error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_CREATE_PIXELMAP_002
     * @tc.name       SUB_IMAGE_CREATE_PIXELMAP_002
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_CREATE_PIXELMAP_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXELMAP_002';
      try {

        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        image.createPixelMap(null, opts, (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, `Failed to create pixelmap. `, JSON.stringify(error), error.code);
            expect(error).not().assertUndefined();
            done();
          } else {
            console.info(TAG, testName, 'Succeeded in creating pixelmap.', JSON.stringify(pixelMap));
            expect(pixelMap).not().assertUndefined();
            done();
          }
        })
        done();
      } catch (error) {
        console.info(TAG, testName, 'creating pixelmap fail', error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_CREATE_PIXELMAP_003
     * @tc.name       SUB_IMAGE_CREATE_PIXELMAP_003
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_CREATE_PIXELMAP_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXELMAP_003';
      try {

        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        image.createPixelMap(AppStorage.get("emptyString"), opts, (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, `Failed to create pixelmap. `, JSON.stringify(error), error.code);
            expect(error).not().assertUndefined();
            done();
          } else {
            console.info(TAG, testName, 'Succeeded in creating pixelmap.', JSON.stringify(pixelMap));
            expect(pixelMap).not().assertUndefined();
            done();
          }
        })
        done();
      } catch (error) {
        console.info(TAG, testName, 'creating pixelmap fail', error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_CREATE_PIXELMAP_004
     * @tc.name       SUB_IMAGE_CREATE_PIXELMAP_004
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_CREATE_PIXELMAP_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXELMAP_004';
      try {

        const color: ArrayBuffer = new ArrayBuffer(96); 
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        image.createPixelMap(color, undefined, (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, `Failed to create pixelmap. `, JSON.stringify(error), error.code);
            expect(error).not().assertUndefined();
            done();
          } else {
            console.info(TAG, testName, 'Succeeded in creating pixelmap.', JSON.stringify(pixelMap));
            expect(pixelMap).not().assertUndefined();
            done();
          }
        })
        done();
      } catch (error) {
        console.info(TAG, testName, 'creating pixelmap fail', error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_CREATE_PIXELMAP_005
     * @tc.name       SUB_IMAGE_CREATE_PIXELMAP_005
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_CREATE_PIXELMAP_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXELMAP_005';
      try {

        const color: ArrayBuffer = new ArrayBuffer(96); 
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        image.createPixelMap(color, null, (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, `Failed to create pixelmap. `, JSON.stringify(error), error.code);
            expect(error).not().assertUndefined();
            done();
          } else {
            console.info(TAG, testName, 'Succeeded in creating pixelmap.', JSON.stringify(pixelMap));
            expect(pixelMap).not().assertUndefined();
            done();
          }
        })
        done();
      } catch (error) {
        console.info(TAG, testName, 'creating pixelmap fail', error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_IMAGE_CREATE_PIXELMAP_006
     * @tc.name       SUB_IMAGE_CREATE_PIXELMAP_006
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_IMAGE_CREATE_PIXELMAP_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXELMAP_006';
      try {

        const color: ArrayBuffer = new ArrayBuffer(96); 
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        image.createPixelMap(color, AppStorage.get("emptyString"), (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG, testName, `Failed to create pixelmap. `, JSON.stringify(error), error.code);
            expect(error).not().assertUndefined();
            done();
          } else {
            console.info(TAG, testName, 'Succeeded in creating pixelmap.', JSON.stringify(pixelMap));
            expect(pixelMap).not().assertUndefined();
            done();
          }
        })
        done();
      } catch (error) {
        console.info(TAG, testName, 'creating pixelmap fail', error);
        expect().assertFail();
        done();
      }
    })
  })
}