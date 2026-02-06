import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { common, ErrorCode } from "@kit.AbilityKit";
import { image } from "@kit.ImageKit";
let imageSourceObj: image.ImageSource | null = null;

const TAG = 'ImageSource.CreatePictureOrf';
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

export default function ImageSourceCreatePictureOrf() {
  describe('ImageSourceCreatePictureOrf', () => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_052
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_052
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_052
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_052', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_052';
      try {
        await ImageCreatePicture(testName,'mimeType_test.orf',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_053
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_053
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_053
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_053', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_053';
      try {
        await ImageCreatePicture(testName,'mimeType_test.orf',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_054
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_054
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_054
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_054', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_054';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'mimeType_test.orf',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_055
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_055
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_055
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_055', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_055';
      try {
        await ImageCreatePicture(testName,'mimeType_test.pef',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_056
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_056
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_056
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_056', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_056';
      try {
        await ImageCreatePicture(testName,'mimeType_test.pef',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_057
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_057
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_057
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_057', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_057';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'mimeType_test.pef',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_058
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_058
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_058
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_058', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_058';
      try {
        await ImageCreatePicture(testName,'test.raf',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_059
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_059
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_059
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_059', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_059';
      try {
        await ImageCreatePicture(testName,'test.raf',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_060
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_060
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_060', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_060';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'test.raf',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_061
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_061
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_061
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_061', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_061';
      try {
        await ImageCreatePicture(testName,'test.rw2',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_062
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_062
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_062
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_062', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_062';
      try {
        await ImageCreatePicture(testName,'test.rw2',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_063
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_063
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_063
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_063', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_063';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'test.rw2',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

  })
}