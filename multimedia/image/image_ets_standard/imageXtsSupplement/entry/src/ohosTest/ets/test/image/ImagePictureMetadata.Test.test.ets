import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import fileio from '@ohos.fileio'
import { fileIo as fs } from '@kit.CoreFileKit';
let fdNumber: number;


const TAG = 'ImagePictureMetadataTestSupp';



async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG,'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG,"image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG,"image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG,"image case open fd err " + err);
  })
}
async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

function getFileFd(fileName: string): number | undefined {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  const file: fs.File = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
  const fd: number = file?.fd;
  return fd;
}


export default function ImagePictureMetadataTest() {
  describe('ImagePictureMetadataTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
    });
    /**
     * @tc.name   PICTURE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_001
     * @tc.number PICTURE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_001
     * @tc.desc   GetHdrComposedPixelmapWithOptions  Unsupported operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_001', Level.LEVEL0, async (done: Function,Picture:image.Picture) => {
      const testName = 'PICTURE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let array = new ArrayBuffer(300000000);
      let pathUri = 'AllAuxiliaryPictures_exclude_fragment.jpg';
      let path = `file://${testContext.filesDir}/${pathUri}`;
      console.info(TAG, testName, `path: ${path}`);
      const fd = await fs.open(path, fs.OpenMode.READ_ONLY);
      console.info(TAG, testName, `open: ${fd.fd}`);
      let readLength = await fs.read(fd.fd, array);
      console.info(TAG, testName, `readLength: ${readLength}`);
      try {
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        }
        let imageSource: image.ImageSource = image.createImageSource(array, ops);
        let pixelMap: image.PixelMap = await imageSource.createPixelMap();
        let pictureObj: image.Picture = image.createPicture(pixelMap);
        console.info(TAG, testName, 'Create picture succeeded');
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.ARGB_8888
        };
        let hdrComposedPixelmap: image.PixelMap | undefined = await pictureObj.getHdrComposedPixelmapWithOptions(opt);
        console.info(TAG, testName, `hdrComposedPixelmap wanted be errcode 7600201`, hdrComposedPixelmap);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(err.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   METADATA_SET_BLOB_001
     * @tc.number METADATA_SET_BLOB_001
     * @tc.desc   metaData setBlob  The blob is has a length of 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('METADATA_SET_BLOB_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'METADATA_SET_BLOB_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        let imageSource: image.ImageSource = image.createImageSource(array, ops);
        let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
        let exifPictureObj: image.Picture = image.createPicture(exifCommodityPixelMap);
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG, 'metadataType')
        let metaData: image.Metadata | null = await exifPictureObj.getMetadata(metadataType);
        console.info(TAG, 'metaData')
        metaData.setBlob(new ArrayBuffer(0))
        console.info(TAG, 'success setBlob')
        done();
      } catch (error) {
        console.info(TAG, testName, ' getHdrComposedPixelmapWithOptions error', error.message, error.code);
        expect(error.code).assertEqual('7600206');
        done();
      }
    })
    /**
     * @tc.name   HEIFS_METADATA_GET_PROPERTIES_001
     * @tc.number HEIFS_METADATA_GET_PROPERTIES_001
     * @tc.desc   heifsMetadata getProperties  unsupported metadata type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HEIFS_METADATA_GET_PROPERTIES_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'HEIFS_METADATA_GET_PROPERTIES_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        let imageSource: image.ImageSource = image.createImageSource(array, ops);
        let imageData = await imageSource.readImageMetadata()
        console.info(TAG, 'metadataType')
        imageData.heifsMetadata?.getProperties(undefined)
        console.info(TAG, 'success getProperties')
        done();
      } catch (error) {
        console.info(TAG, testName, ' getHdrComposedPixelmapWithOptions error', error.message, error.code);
        expect(error.code).assertEqual('7600202');
        done();
      }
    })
    /**
     * @tc.name   HEIFS_METADATA_SET_PROPERTIES_001
     * @tc.number HEIFS_METADATA_SET_PROPERTIES_001
     * @tc.desc   heifsMetadata setProperties  Unsupported metadata type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HEIFS_METADATA_SET_PROPERTIES_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'HEIFS_METADATA_SET_PROPERTIES_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        let imageSource: image.ImageSource = image.createImageSource(array, ops);
        let imageData = await imageSource.readImageMetadata()
        console.info(TAG, 'metadataType')
        imageData.heifsMetadata?.setProperties(undefined)
        console.info(TAG, 'success setProperties')
        done();
      } catch (error) {
        console.info(TAG, testName, ' getHdrComposedPixelmapWithOptions error', error.message, error.code);
        expect(error.code).assertEqual('7600202');
        done();
      }
    })
    /**
     * @tc.name   HEIFS_METADATA_SET_BLOB_001
     * @tc.number HEIFS_METADATA_SET_BLOB_001
     * @tc.desc   heifsMetadata setBlob  The blob is  has a length of 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HEIFS_METADATA_SET_BLOB_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'HEIFS_METADATA_SET_BLOB_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        let imageSource: image.ImageSource = image.createImageSource(array, ops);
        let imageData = await imageSource.readImageMetadata()
        console.info(TAG, 'metadataType')
        imageData.heifsMetadata?.setBlob(new ArrayBuffer(0))
        console.info(TAG, 'success setBlob')
        done();
      } catch (error) {
        console.info(TAG, testName, ' getHdrComposedPixelmapWithOptions error', error.message, error.code);
        expect(error.code).assertEqual('7600206');
        done();
      }
    })
  })
}