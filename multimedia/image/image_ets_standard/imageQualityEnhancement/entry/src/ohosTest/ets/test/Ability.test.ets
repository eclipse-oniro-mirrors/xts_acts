import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let filePath: string = "";
    let fdNumber: number = 0;
    let globalPixelMap: PixelMap | null = null;
    let result: boolean = false;

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      await fs.open(filePath).then(file => {
        fdNumber = file.fd;
        console.info("@@@ image case open fd success " + fdNumber);
      })
      await sleep(100);
    }

    const getTestResult = async (TAG: string, decodingDynamicRange: image.DecodingDynamicRange)=> {
      result = false;
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info(TAG + " @@@ create image source failed");
      } else {
        let decodingOptions: image.DecodingOptions = {
          desiredDynamicRange: decodingDynamicRange
        };
        await imageSourceApi.createPixelMap(decodingOptions).then(async (pixelMap) => {
          globalPixelMap = pixelMap;
          let csm: colorSpaceManager.ColorSpaceManager = pixelMap.getColorSpace();
          await pixelMap.getImageInfo().then((imageInfo) => {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            let isHDR = imageInfo.isHdr;
            let pixelmapFormat = imageInfo.pixelFormat;
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' isHDR value: ' + JSON.stringify(isHDR));
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' colorSpace value: ' + JSON.stringify(csm.getColorSpaceName()));
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' pixelmapFormat value: ' + JSON.stringify(pixelmapFormat));
            result = true;
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' createPixelMap err ' + JSON.stringify(err));
          })
        })
      }
    }

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      if (globalPixelMap != undefined) {
        console.info("@@@ globalpixelmap release start");
        try {
          await globalPixelMap.release();
        } catch (error) {
          console.error("@@@ globalpixelmap release fail");
        }
      }
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_0100
     * @tc.name      : TTest_createPixelMap_decodingOptions_aihdr_auto_jpg
     * @tc.desc      : 1.create imageSource
     *                 2.set decodingDynamicRange of DecodeOptions to HDR
     *                 3.create PixelMap and getImageinfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_0100", Level.LEVEL0, async (done: Function) => {
      await getFd("test.jpg");
      try{
        await getTestResult('SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_0100', image.DecodingDynamicRange.HDR);
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

  })
}
