import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { common, ErrorCode } from "@kit.AbilityKit";
import { image } from "@kit.ImageKit";
let imageSourceObj: image.ImageSource | null = null;

const TAG = 'ImageSource.CreatePictureGif';
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


export default function ImageSourceCreatePictureGif() {
  describe('ImageSourceCreatePictureGif', () => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_019
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_019
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_019';
      try {
        await ImageCreatePicture(testName,'moving_test_loop0.gif',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_020
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_020
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_020';
      try {
        await ImageCreatePicture(testName,'moving_test_loop0.gif',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_021
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_021
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_021';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'moving_test_loop0.gif',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_022
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_022
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_022';
      try {
        await ImageCreatePicture(testName,'mimeType_test.nef',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_023
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_023
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_023';
      try {
        await ImageCreatePicture(testName,'mimeType_test.nef',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_024
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_024
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_024';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'mimeType_test.nef',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_025
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_025
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_025';
      try {
        await ImageCreatePicture(testName,'test.tiff',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_026
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_026
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_026';
      try {
        await ImageCreatePicture(testName,'test.tiff',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_027
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_027
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_027';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'test.tiff',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_028
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_028
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_028';
      try {
        await ImageCreatePicture(testName,'pixel_bmp_480x360.bmp',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_029
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_029
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_029';
      try {
        await ImageCreatePicture(testName,'pixel_bmp_480x360.bmp',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_030
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_030
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_030';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'pixel_bmp_480x360.bmp',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_031
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_031
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_031';
      try {
        await ImageCreatePicture(testName,'test.pef',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_032
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_032
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_032';
      try {
        await ImageCreatePicture(testName,'test.pef',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_033
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_033
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_033';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'test.pef',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_034
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_034
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_034';
      try {
        await ImageCreatePicture(testName,'mimeType_test.cr2',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_035
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_035
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_035', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_035';
      try {
        await ImageCreatePicture(testName,'mimeType_test.cr2',(imageResource) => {
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
     * @tc.name   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_036
     * @tc.number MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_036
     * @tc.desc   MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_036', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_036';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'mimeType_test.cr2',(imageResource) => {
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