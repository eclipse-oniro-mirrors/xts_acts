import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { common, ErrorCode } from "@kit.AbilityKit";
import { image } from "@kit.ImageKit";

const TAG = 'ImageSource.CreatePictureJpg';
async function ImageCreatePicture( testName: string,   pathUri:string,callback: (imageSourceObj: image.ImageSource) => void,
) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let path = `file://${testContext.filesDir}/${pathUri}`;
  let imageSourceObj: image.ImageSource = image.createImageSource(path);
  console.info(TAG,testName,'createImageSource',imageSourceObj);
  callback(imageSourceObj);
  await imageSourceObj.release();
  expect().assertFail();
}

export default function ImageSourceCreatePictureJpg() {
  describe('ImageSourceCreatePictureJpg', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('testString', 'abc');
      AppStorage.setOrCreate('testArray', [-1, 0, 1]);

    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(async () => {
      AppStorage.delete('testString');
      AppStorage.delete('testArray');
      console.info(TAG, 'afterAll case.');
    });


    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_001
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_001
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_001';
      try {
        await ImageCreatePicture(testName,'test_exif_v2.jpg',(imageResource) => {
          imageResource.createPicture(null);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })


    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_002
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_002
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_002';
      try {
        await ImageCreatePicture(testName,'test_exif_v2.jpg',(imageResource) => {
          imageResource.createPicture(undefined);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })


    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_003
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_003
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_003';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'test_exif_v2.jpg',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })


    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_004
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_004
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_004';
      try {
        await ImageCreatePicture(testName,'test_exif_v3.webp',(imageResource) => {
          imageResource.createPicture(null);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })



    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_005
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_005
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_005';
      try {
        await ImageCreatePicture(testName,'test_exif_v3.webp',(imageResource) => {
          imageResource.createPicture(undefined);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })


    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_006
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_006
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_006';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'test_exif_v3.webp',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })


    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_007
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_007
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_007';
      try {
        await ImageCreatePicture(testName,'test_exif_v4.heic',(imageResource) => {
          imageResource.createPicture(null);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })



    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_008
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_008
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_008';
      try {
        await ImageCreatePicture(testName,' test_exif_v4.heic ',(imageResource) => {
          imageResource.createPicture(undefined);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertUndefined();
        done();
      }
    })


    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_009
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_009
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_009';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,' test_exif_v4.heic ',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertUndefined();
        done();
      }
    })



    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_010
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_010
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_010';
      try {
        await ImageCreatePicture(testName,'test_exif_v2.png',(imageResource) => {
          imageResource.createPicture(null);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })



    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_011
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_011
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_011';
      try {
        await ImageCreatePicture(testName,'test_exif_v2.png',(imageResource) => {
          imageResource.createPicture(undefined);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })


    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_012
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_012
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_012';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'test_exif_v2.png',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_013
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_013
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_013';
      try {
        await ImageCreatePicture(testName,'test_exif_empty_2.jpg',(imageResource) => {
          imageResource.createPicture(null);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })



    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_014
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_014
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_014';
      try {
        await ImageCreatePicture(testName,'test_exif_empty_2.jpg',(imageResource) => {
          imageResource.createPicture(undefined);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })


    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_015
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_015
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_015';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'test_exif_empty_2.jpg',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })


    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_016
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_016
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_016';
      try {
        await ImageCreatePicture(testName,'mimeType_test1.arw',(imageResource) => {
          imageResource.createPicture(null);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })



    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_017
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_017
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_017';
      try {
        await ImageCreatePicture(testName,'mimeType_test1.arw',(imageResource) => {
          imageResource.createPicture(undefined);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })


    /**
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_018
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_018
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_018';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'mimeType_test1.arw',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

  });
}