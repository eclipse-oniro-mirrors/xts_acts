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

const TAG = LOG_TAG + 'getAuxiliaryPictureInfo';

async function getAuxiliaryPictureInfoPromiseTest(done: Function, testName: string, path: string,
  AuxiliaryPictureType: image.AuxiliaryPictureType) {
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
      let auxinfo: image.AuxiliaryPictureInfo = auxPictureObj.getAuxiliaryPictureInfo();
      console.info(TAG, 'GetAuxiliaryPictureInfo Type: ' + auxinfo.auxiliaryPictureType +
        ' height: ' + auxinfo.size.height + ' width: ' + auxinfo.size.width +
        ' rowStride: ' + auxinfo.rowStride + ' pixelFormat: ' + auxinfo.pixelFormat +
        ' colorSpace: ' + auxinfo.colorSpace);
      console.info(TAG, 'Write pixels from buffer success.');
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

export default function AuxiliaryPictureGetAuxiliaryPictureInfoTest() {
  describe('AuxiliaryPictureGetAuxiliaryPictureInfoTest', () => {

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
     * @tc.number    : AUXILIARY_PICTURE_GET_AUXILIARY_PICTURE_INFO_001
     * @tc.name      : auxiliaryPicture_getAuxiliaryPictureInfo_promise_001
     * @tc.desc      : getAuxiliaryPictureInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('auxiliaryPicture_getAuxiliaryPictureInfo_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getAuxiliaryPictureInfo_promise_001';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      await getAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType);
    })

    /**
     * @tc.number    : AUXILIARY_PICTURE_GET_AUXILIARY_PICTURE_INFO_002
     * @tc.name      : auxiliaryPicture_getAuxiliaryPictureInfo_promise_002
     * @tc.desc      : writePixelsFromBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('auxiliaryPicture_getAuxiliaryPictureInfo_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getAuxiliaryPictureInfo_promise_002';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await getAuxiliaryPictureInfoPromiseTest(done, testName, path, AuxiliaryPictureType);
    })
  })
}