import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import fileio from '@ohos.fileio'
let fdNumber: number;


const TAG = 'ImagePictureSetAuxiliaryPictureTestSupp';


async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, "image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, "image case open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, "image case open fd err " + err);
  })
}
async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

async function auxiliaryPictureTest(done: Function, testName: string, path: string ,
  callback :(picture: image.Picture) => void) {
  const imageSourceApi = await getImageSource(path);
  console.info(TAG,testName,'imageSourceApi')
  let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
  console.info(TAG,testName,'commodityPixelMap')
  let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
  console.info(TAG,testName,'PictureObj')
  callback(PictureObj);
  done()
}

export default function ImagePictureSetAuxiliaryPictureTest() {
  describe('ImagePictureSetAuxiliaryPictureTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('emptyString','')
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete('emptyString')
      console.info(TAG, 'afterAll case.');
    });


    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_001
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_001
     * @tc.desc   PICTURE_SET_AUXILIARY_PICTURE_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_001';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.GAINMAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_002
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_002
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_002';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.DEPTH_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_003
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_003
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_003';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.UNREFOCUS_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_004
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_004
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_004';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.LINEAR_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_005
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_005
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_005';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.FRAGMENT_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_006
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_006
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_006';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.GAINMAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_007
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_007
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_007';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.DEPTH_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_008
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_008
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_008';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.UNREFOCUS_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_009
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_009
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_009';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.LINEAR_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_010
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_010
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_010';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.FRAGMENT_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_011
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_011
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_011';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.GAINMAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,AppStorage.get('emptyString'));
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_012
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_012
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_012';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.DEPTH_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,AppStorage.get('emptyString'));
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_013
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_013
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_013';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.UNREFOCUS_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,AppStorage.get('emptyString'));
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_014
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_014
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_014';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.LINEAR_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,AppStorage.get('emptyString'));
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_015
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_015
     * @tc.desc   picture_setAuxiliaryPicture webp图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_015';
      const path = 'test_large.webp';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.FRAGMENT_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,AppStorage.get('emptyString'));
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_016
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_016
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_016';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.GAINMAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_017
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_017
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_017';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.DEPTH_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_018
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_018
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_018';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.UNREFOCUS_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_019
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_019
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_019';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.LINEAR_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_020
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_020
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_020';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.FRAGMENT_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_021
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_021
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_021';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.GAINMAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_022
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_022
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_022';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.DEPTH_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_023
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_023
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_023';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.UNREFOCUS_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_024
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_024
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_024';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.LINEAR_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_025
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_025
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_025';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.FRAGMENT_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_026
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_026
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_026';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.GAINMAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,AppStorage.get('emptyString'));
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_027
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_027
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_027';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.DEPTH_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,AppStorage.get('emptyString'));
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_028
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_028
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_028';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.UNREFOCUS_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,AppStorage.get('emptyString'));
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_029
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_029
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_029';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.LINEAR_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,AppStorage.get('emptyString'));
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PICTURE_SET_AUXILIARY_PICTURE_030
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_030
     * @tc.desc   picture_setAuxiliaryPicture jpg图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_AUXILIARY_PICTURE_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_AUXILIARY_PICTURE_030';
      const path = 'test_exif.jpg';
      const auxiliaryPictureType = await image.AuxiliaryPictureType.FRAGMENT_MAP
      try {
        await auxiliaryPictureTest(done, testName, path,(picture: image.Picture) => {
          picture.setAuxiliaryPicture(auxiliaryPictureType,AppStorage.get('emptyString'));
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setAuxiliaryPicture error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
  })
}