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
import { LOG_TAG } from '../common';
import fs from '@ohos.file.fs';

const TAG = LOG_TAG + 'getType';

async function getTypeTest(done: Function, testName: string, path: string,
  AuxiliaryPictureType: image.AuxiliaryPictureType, callback: (type: image.AuxiliaryPictureType) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(20000000);
    let pathUri = 'file://' + testContext.filesDir + "/" + path;
    const fd = await fs.open(pathUri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let readLength = await fs.read(fd.fd, array);
    console.info(TAG, testName, ` readLength: ${readLength}`);
    await fs.close(fd);
    let auxSize: Size = {
      height: 180,
      width: 240
    };
    let auxType: image.AuxiliaryPictureType = AuxiliaryPictureType;
    let auxPictureObj: image.AuxiliaryPicture | null = await image.createAuxiliaryPicture(array, auxSize, auxType);
    console.info(TAG, `createAuxiliaryPicture:`);
    if (auxPictureObj != null) {
      let type: image.AuxiliaryPictureType = auxPictureObj.getType();
      console.info(TAG,testName, `type:`, type);
      callback(type)
      auxPictureObj.release();
      done();
    } else {
      console.error(TAG,testName,'AuxPictureObj is null.');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG,testName, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}



export default function AuxiliaryGetTypeTest() {
  describe('AuxiliaryGetTypeTest', () => {

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
     * @tc.name   auxiliaryPicture_getType_promise_0001
     * @tc.number SUB_MEDIA_IMAGE_GETTYPE_001
     * @tc.desc   Test getType with AuxiliaryPictureType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_getType_promise_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getType_promise_0001';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      await getTypeTest(done, testName, path, AuxiliaryPictureType, (type) => {
        expect(type).assertEqual(1);
      });
    })

    /**
     * @tc.name   auxiliaryPicture_getType_promise_0002
     * @tc.number SUB_MEDIA_IMAGE_GETTYPE_002
     * @tc.desc   Test getType with AuxiliaryPictureType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_getType_promise_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getType_promise_0002';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      await getTypeTest(done, testName, path, AuxiliaryPictureType, (type) => {
        expect(type).assertEqual(2);
      });
    })

    /**
     * @tc.name   auxiliaryPicture_getType_promise_0003
     * @tc.number SUB_MEDIA_IMAGE_GETTYPE_003
     * @tc.desc   Test getType with AuxiliaryPictureType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_getType_promise_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getType_promise_0003';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      await getTypeTest(done, testName, path, AuxiliaryPictureType, (type) => {
        expect(type).assertEqual(3);
      });
    })

    /**
     * @tc.name   auxiliaryPicture_getType_promise_0004
     * @tc.number SUB_MEDIA_IMAGE_GETTYPE_004
     * @tc.desc   Test getType with AuxiliaryPictureType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_getType_promise_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getType_promise_0004';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      await getTypeTest(done, testName, path, AuxiliaryPictureType, (type) => {
        expect(type).assertEqual(4);
      });
    })

    /**
     * @tc.name   auxiliaryPicture_getType_promise_0005
     * @tc.number SUB_MEDIA_IMAGE_GETTYPE_005
     * @tc.desc   Test getType with AuxiliaryPictureType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_getType_promise_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getType_promise_0005';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await getTypeTest(done, testName, path, AuxiliaryPictureType, (type) => {
        expect(type).assertEqual(5);
      });
    })
  })
}