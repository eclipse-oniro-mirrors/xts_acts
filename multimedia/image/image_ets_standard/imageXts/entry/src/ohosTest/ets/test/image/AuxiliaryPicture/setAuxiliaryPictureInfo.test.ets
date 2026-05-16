/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';
import { colorSpaceManager } from '@kit.ArkGraphics2D';

const TAG = LOG_TAG + 'setAuxiliaryPictureInfo';

async function setAuxiliaryPictureInfoPromiseTest(done: Function, testName: string, path: string,
  AuxiliaryPictureType: image.AuxiliaryPictureType, info: image.AuxiliaryPictureInfo) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let commodityPixelMap: image.Picture | null = await imageSource.createPicture();

    let auxPictureObj: image.AuxiliaryPicture | null =
      await commodityPixelMap.getAuxiliaryPicture(AuxiliaryPictureType);
    if (auxPictureObj != null) {
      await auxPictureObj.setAuxiliaryPictureInfo(info);
      done();
    } else {
      console.error(TAG, 'AuxPictureObj is null.');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function AuxiliaryPictureSetAuxiliaryPictureInfoTest() {
  describe('AuxiliaryPictureSetAuxiliaryPictureInfoTest', () => {

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
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_001
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_001
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_001';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
        size: { height: 100, width: 200 },
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        rowStride: 0,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_002
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_002
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_002';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.DEPTH_MAP,
        size: { height: 100, width: 200 },
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        rowStride: 0,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_003
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_003
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_003';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.UNREFOCUS_MAP,
        size: { height: 100, width: 200 },
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        rowStride: 0,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_004
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_004
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_004';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.LINEAR_MAP,
        size: { height: 100, width: 200 },
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        rowStride: 0,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_005
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_005
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_005';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.LINEAR_MAP,
        size: { height: 100, width: 200 },
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        rowStride: 0,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_006
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_006
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_006';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.FRAGMENT_MAP,
        size: { height: 100, width: 200 },
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        rowStride: 0,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_007
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_007
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_007';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.FRAGMENT_MAP,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.RGB_565,
        rowStride: 0,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_008
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_008
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_008';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.FRAGMENT_MAP,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_009
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_009
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_009';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.FRAGMENT_MAP,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.RGB_888,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_010
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_010
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_010';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.FRAGMENT_MAP,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_011
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_011
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_011';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.FRAGMENT_MAP,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_012
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_012
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_012';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.FRAGMENT_MAP,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.NV21,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_013
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_013
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_013';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.FRAGMENT_MAP,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.NV12,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_014
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_014
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_014';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.FRAGMENT_MAP,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.RGBA_1010102,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_015
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_015
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_015';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.FRAGMENT_MAP,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.YCBCR_P010,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })

    /**
     * @tc.name   auxiliaryPicture_setAuxiliaryPictureInfo_promise_016
     * @tc.number AUXILIARY_PICTURE_SET_AUXILIARY_PICTURE_INFO_016
     * @tc.desc   setAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setAuxiliaryPictureInfo_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setAuxiliaryPictureInfo_promise_016';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: image.AuxiliaryPictureType.FRAGMENT_MAP,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.YCRCB_P010,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      await setAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType, info);
    })
  })
}