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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { driveFn, getPermission, sleep } from '../common'
import common from '@ohos.app.ability.common'
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'

let TAG = 'PhotoCreateAssetSuppTest';

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG, 'getEnumMaxValue : ' + maxValue);
  return maxValue;
}

export default function PhotoCreateAssetSuppTest() {
  describe('PhotoCreateAssetSuppTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    const sendAbleHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    const createAssetCallback1 =
      async (done: Function, testNum: string, type: photoAccessHelper.PhotoType | null | undefined,
        extension: string, options: photoAccessHelper.CreateOptions, callback: (errCode: ESObject) => void) => {
        try {
          console.info(TAG, testNum, 'Start');
          helper.createAsset(type, extension, options, (err, uri) => {
            if (uri !== undefined) {
              console.info(TAG, testNum, JSON.stringify(err), err.code);
            } else {
              console.info(TAG, testNum, uri);
            }
          });
          expect().assertFail();
          done();
        } catch (error) {
          console.info(TAG, testNum, JSON.stringify(error), error.code)
          callback(error);
          done();
        }
      }
    const createAssetCallback2 =
      async (done: Function, testNum: string, type: photoAccessHelper.PhotoType | null | undefined,
        extension: string, callback: (errCode: ESObject) => void) => {
        try {
          console.info(TAG, testNum, 'Start');
          helper.createAsset(type, extension, (err: BusinessError<void>, uri: string) => {
            if (err !== undefined) {
              console.info(TAG, testNum, JSON.stringify(err), err.code);
              expect().assertFail();
            } else {
              console.info(TAG, testNum, uri);
            }
          });
          expect().assertFail();
          done();
        } catch (error) {
          console.info(TAG, testNum, JSON.stringify(error), error.code)
          callback(error);
          done();
        }
      }
    const createAssetPromise1 =
      async (done: Function, testNum: string, type: photoAccessHelper.PhotoType | null | undefined,
        extension: string, options: photoAccessHelper.CreateOptions, callback: (errCode: ESObject) => void) => {
        try {
          console.info(TAG, testNum, 'Start');
          await helper.createAsset(type, extension, options);
          expect().assertFail();
          done();
        } catch (error) {
          console.info(TAG, testNum, JSON.stringify(error), error.code)
          callback(error);
          done();
        }
      }

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0001
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0001
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0001';
      const type = -1;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0002
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0002
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0002';
      const type = -10000;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0003
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0003
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0003';
      let maxEnum = getEnumMaxValue(photoAccessHelper.PhotoType) + 1;
      const type = maxEnum;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0004
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0004
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0004';
      const type = null;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0005
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0005
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0005';
      const type = undefined;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0006
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0006
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0006';
      const type = Number('auto');
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0007
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0007
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0007';
      const type = Number(false);
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0008
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0008
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0008';
      const type = Number([-1, 0, 1]);
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0009
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0009
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0009';
      const type = Number({ valueOf: () => -1 });
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      }
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0010
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0010
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0010', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0010';
      const type = NaN;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      }
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0011
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0011
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0011', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0011';
      const type = Infinity;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      }
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0016
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0016
     * @tc.desc   createAsset without CreateOptions
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0016', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0016';
      let maxEnum = getEnumMaxValue(photoAccessHelper.PhotoType) + 1;
      const type = maxEnum;
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0017
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0017
     * @tc.desc   createAsset without CreateOptions
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0017', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0017';
      const type = -1;
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0018
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0018
     * @tc.desc   createAsset without CreateOptions
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0018', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0018';
      const type = -10000;
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0019
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0019
     * @tc.desc   createAsset without CreateOptions
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0019', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0019';
      const type = NaN;
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0020
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0020
     * @tc.desc   createAsset without CreateOptions
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0020', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0020';
      const type = Infinity;
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0021
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0021
     * @tc.desc   createAsset without CreateOptions
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0021', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0021';
      const type = Number('auto');
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0022
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0022
     * @tc.desc   createAsset without CreateOptions
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0022', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0022';
      const type = Number(false);
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0023
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0023
     * @tc.desc   createAsset without CreateOptions
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0023', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0023';
      const type = Number([-1, 0, 1]);
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0024
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0024
     * @tc.desc   createAsset without CreateOptions
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0024', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0024';
      const type = Number({ valueOf: () => -1 });
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0025
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0025
     * @tc.desc   createAsset without CreateOptions
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0025', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0025';
      const type = null;
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0026
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0026
     * @tc.desc   createAsset without CreateOptions
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0026', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0026';
      const type = undefined;
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0027
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0027
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0027', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0027';
      let maxEnum = getEnumMaxValue(photoAccessHelper.PhotoType) + 1;
      const type = maxEnum;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0028
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0028
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0028', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0028';
      const type = -1;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0029
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0029
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0029', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0029';
      const type = -100000;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0030
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0030
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0030', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0030';
      const type = NaN;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0031
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0031
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0031', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0031';
      const type = Infinity;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0032
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0032
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0032', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0032';
      const type = Number('auto');
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0033
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0033
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0033', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0033';
      const type = Number(false);
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0034
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0034
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0034', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0034';
      const type = Number([-1, 0, 1]);
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0035
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0035
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0035', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0035';
      const type = Number({ valueOf: () => -1 });
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0036
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0036
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0036', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0036';
      const type = undefined;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0037
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0037
     * @tc.desc   createAsset with undefined title
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0037', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0037';
      const type = null;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0001
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0001
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0001';
      const type = -1;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0002
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0002
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0002';
      const type = -10000;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0003
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0003
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0003';
      let maxEnum = getEnumMaxValue(photoAccessHelper.PhotoType) + 1;
      const type = maxEnum;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0004
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0004
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0004';
      const type = null;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0005
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0005
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0005';
      const type = undefined;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0006
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0006
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0006';
      const type = Number('auto');
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0007
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0007
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0007';
      const type = Number(false);
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0008
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0008
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0008';
      const type = Number([-1, 0, 1]);
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0009
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0009
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0009';
      const type = Number({ valueOf: () => -1 });
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      }
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0010
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0010
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0010', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0010';
      const type = NaN;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      }
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0011
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0011
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0011', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0011';
      const type = Infinity;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      }
      await createAssetCallback1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0016
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0016
     * @tc.desc     createAsset without CreateOptions
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0016', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0016';
      let maxEnum = getEnumMaxValue(photoAccessHelper.PhotoType) + 1;
      const type = maxEnum;
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0017
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0017
     * @tc.desc     createAsset without CreateOptions
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0017', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0017';
      const type = -1;
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0018
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0018
     * @tc.desc     createAsset without CreateOptions
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0018', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0018';
      const type = -10000;
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0019
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0019
     * @tc.desc     createAsset without CreateOptions
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0019', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0019';
      const type = NaN;
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0020
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0020
     * @tc.desc     createAsset without CreateOptions
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0020', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0020';
      const type = Infinity;
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0021
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0021
     * @tc.desc     createAsset without CreateOptions
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0021', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0021';
      const type = Number('auto');
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0022
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0022
     * @tc.desc     createAsset without CreateOptions
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0022', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0022';
      const type = Number(false);
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0023
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0023
     * @tc.desc     createAsset without CreateOptions
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0023', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0023';
      const type = Number([-1, 0, 1]);
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0024
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0024
     * @tc.desc     createAsset without CreateOptions
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0024', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0024';
      const type = Number({ valueOf: () => -1 });
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0025
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0025
     * @tc.desc     createAsset without CreateOptions
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0025', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0025';
      const type = null;
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0026
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0026
     * @tc.desc     createAsset without CreateOptions
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0026', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0026';
      const type = undefined;
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0027
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0027
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0027', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0027';
      let maxEnum = getEnumMaxValue(photoAccessHelper.PhotoType) + 1;
      const type = maxEnum;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0028
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0028
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0028', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0028';
      const type = -1;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0029
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0029
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0029', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0029';
      const type = -100000;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0030
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0030
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0030', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0030';
      const type = NaN;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0031
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0031
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0031', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0031';
      const type = Infinity;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0032
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0032
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0032', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0032';
      const type = Number('auto');
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0033
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0033
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0033', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0033';
      const type = Number(false);
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0034
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0034
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0034', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0034';
      const type = Number([-1, 0, 1]);
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0035
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0035
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0035', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0035';
      const type = Number({ valueOf: () => -1 });
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0036
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0036
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0036', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0036';
      const type = undefined;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number   SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0037
     * @tc.name     SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0037
     * @tc.desc     createAsset with undefined title
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0037', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0037';
      const type = null;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('13900020');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0001
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0001
     * @tc.desc       Test createAsset with title containing illegal character "."
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0001';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: '.testPhoto'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0002
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0002
     * @tc.desc       Test createAsset with title containing illegal character ".."
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0002';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: '..testPhoto'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0003
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0003
     * @tc.desc       Test createAsset with title containing illegal character "\"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0003';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test\\photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0004
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0004
     * @tc.desc       Test createAsset with title containing illegal character "/"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0004';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test/photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0005
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0005
     * @tc.desc       Test createAsset with title containing illegal character ":"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0005';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test:photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0006
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0006
     * @tc.desc       Test createAsset with title containing illegal character "*"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0006';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test*photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0007
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0007
     * @tc.desc       Test createAsset with title containing illegal character "?"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0007';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test?photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0008
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0008
     * @tc.desc       Test createAsset with title containing illegal character """
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0008';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test"photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0009
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0009
     * @tc.desc       Test createAsset with title containing illegal character "'"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0009';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: "test'photo"
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0010
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0010
     * @tc.desc       Test createAsset with title containing illegal character "`"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0010', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0010';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test`photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0011
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0011
     * @tc.desc       Test createAsset with title containing illegal character "<"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0011', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0011';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test<photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0012
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0012
     * @tc.desc       Test createAsset with title containing illegal character ">"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0012', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0012';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpeg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test>photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0013
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0013
     * @tc.desc       Test createAsset with title containing illegal character "|"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0013', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0013';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test|photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0014
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0014
     * @tc.desc       Test createAsset with title containing illegal characters "{" and "}"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0014', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0014';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test{photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0015
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0015
     * @tc.desc       Test createAsset with title containing illegal characters "{" and "}"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0015', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0015';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test}photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0016
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0016
     * @tc.desc       Test createAsset with title containing illegal characters "[" and "]"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0016', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0016';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test[photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0017
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0017
     * @tc.desc       Test createAsset with title containing illegal characters "[" and "]"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0017', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO1_0017';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test]photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0001
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0001
     * @tc.desc       Test createAsset with title containing illegal character "."
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0001';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: '.testPhoto'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0002
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0002
     * @tc.desc       Test createAsset with title containing illegal character ".."
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0002';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: '..testPhoto'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0003
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0003
     * @tc.desc       Test createAsset with title containing illegal character "\"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0003';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test\\photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001'); // 预期返回错误码
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0004
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0004
     * @tc.desc       Test createAsset with title containing illegal character "/"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0004';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test/photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0005
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0005
     * @tc.desc       Test createAsset with title containing illegal character ":"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0005';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test:photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0006
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0006
     * @tc.desc       Test createAsset with title containing illegal character "*"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0006';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test*photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0007
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0007
     * @tc.desc       Test createAsset with title containing illegal character "?"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0007';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test?photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0008
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0008
     * @tc.desc       Test createAsset with title containing illegal character """
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0008';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test"photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0009
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0009
     * @tc.desc       Test createAsset with title containing illegal character "'"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0009';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: "test'photo"
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0010
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0010
     * @tc.desc       Test createAsset with title containing illegal character "`"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0010', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0010';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test`photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0011
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0011
     * @tc.desc       Test createAsset with title containing illegal character "<"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0011', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0011';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test<photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0012
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0012
     * @tc.desc       Test createAsset with title containing illegal character ">"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0012', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0012';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test>photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0013
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0013
     * @tc.desc       Test createAsset with title containing illegal character "|"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0013', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0013';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test|photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0014
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0014
     * @tc.desc       Test createAsset with title containing illegal characters "{" and "}"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0014', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0014';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test{photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0015
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0015
     * @tc.desc       Test createAsset with title containing illegal characters "{" and "}"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0015', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0015';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test}photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0016
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0016
     * @tc.desc       Test createAsset with title containing illegal characters "[" and "]"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0016', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0016';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test[photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0017
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0017
     * @tc.desc       Test createAsset with title containing illegal characters "[" and "]"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0017', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO1_0017';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: 'test]photo'
      };
      await createAssetPromise1(done, testNum, type, extension, options, (errCode: BusinessError) => {
        expect(errCode.code).assertEqual('14000001');
      });
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00001
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00001
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00001';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      try {
        console.info(TAG, testNum, 'Start');
        helper.createAsset(type, extension, null as ESObject, (err, uri) => {
          if (uri !== undefined) {
            console.info(TAG, testNum, JSON.stringify(err), err.code);
          } else {
            console.info(TAG, testNum, uri);
          }
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00002
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00002
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00002';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      try {
        console.info(TAG, testNum, 'Start');
        helper.createAsset(type, extension, '' as ESObject, (err, uri) => {
          if (uri !== undefined) {
            console.info(TAG, testNum, JSON.stringify(err), err.code);
          } else {
            console.info(TAG, testNum, uri);
          }
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00003
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00003
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00003';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      try {
        console.info(TAG, testNum, 'Start');
        helper.createAsset(type, extension, undefined as ESObject, (err, uri) => {
          if (uri !== undefined) {
            console.info(TAG, testNum, JSON.stringify(err), err.code);
          } else {
            console.info(TAG, testNum, uri);
          }
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00004
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00004
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_PHOTO_00004';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const options: photoAccessHelper.CreateOptions = {
        title: 'testPhoto'
      };
      try {
        console.info(TAG, testNum, 'Start');
        helper.createAsset(type, '' as ESObject, options, (err, uri) => {
          if (uri !== undefined) {
            console.info(TAG, testNum, JSON.stringify(err), err.code);
          } else {
            console.info(TAG, testNum, uri);
          }
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00001
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00001
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00001';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      try {
        console.info(TAG, testNum, 'Start');
        helper.createAsset(type, extension, null as ESObject, (err, uri) => {
          if (uri !== undefined) {
            console.info(TAG, testNum, JSON.stringify(err), err.code);
          } else {
            console.info(TAG, testNum, uri);
          }
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00002
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00002
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00002';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      try {
        console.info(TAG, testNum, 'Start');
        helper.createAsset(type, extension, '' as ESObject, (err, uri) => {
          if (uri !== undefined) {
            console.info(TAG, testNum, JSON.stringify(err), err.code);
          } else {
            console.info(TAG, testNum, uri);
          }
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00003
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00003
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00003';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      try {
        console.info(TAG, testNum, 'Start');
        helper.createAsset(type, extension, undefined as ESObject, (err, uri) => {
          if (uri !== undefined) {
            console.info(TAG, testNum, JSON.stringify(err), err.code);
          } else {
            console.info(TAG, testNum, uri);
          }
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00004
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00004
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_00004';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const options: photoAccessHelper.CreateOptions = {
        title: 'testVideo'
      };
      try {
        console.info(TAG, testNum, 'Start');
        helper.createAsset(type, '' as ESObject, options, (err, uri) => {
          if (uri !== undefined) {
            console.info(TAG, testNum, JSON.stringify(err), err.code);
          } else {
            console.info(TAG, testNum, uri);
          }
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00001
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00001
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00001';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      try {
        console.info(TAG, testNum, 'Start');
        await helper.createAsset(type, extension, null as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00002
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00002
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00002';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      try {
        console.info(TAG, testNum, 'Start');
        await helper.createAsset(type, extension, '' as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });
    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00003
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00003
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_PHOTO_00003';
      const type = photoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      try {
        console.info(TAG, testNum, 'Start');
        await helper.createAsset(type, extension, undefined as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00001
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00001
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00001';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      try {
        console.info(TAG, testNum, 'Start');
        await helper.createAsset(type, extension, null as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00002
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00002
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00002';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      try {
        console.info(TAG, testNum, 'Start');
        await helper.createAsset(type, extension, '' as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00003
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00003
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_PHOTO_ACCESS_HELPER_PROMISE_CREATE_VIDEO_00003';
      const type = photoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      try {
        console.info(TAG, testNum, 'Start');
        await helper.createAsset(type, extension, undefined as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0001
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0001
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0001';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, '', options);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('14000001');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0004
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0004
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0004';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = '.jpg';
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, null as ESObject);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0005
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0005
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0005';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = '.jpg';
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, undefined as ESObject);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0006
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0006
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0006';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = '.jpg';
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, '' as ESObject);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0007
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0007
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0007';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'a';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, options);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('14000011');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0008
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0008
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0008';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'a'.repeat(255);
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, options);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('14000001');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0009
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0009
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_IMAGE_0009';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'a'.repeat(256);
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, options);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('14000001');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0001
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0001
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0001';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = '';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, '', options);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('14000001');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0004
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0004
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0004';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = '.mp4';
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, null as ESObject);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0005
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0005
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0005';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = '.mp4';
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, undefined as ESObject);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0006
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0006
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0006';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = '.mp4';
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, '' as ESObject);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('13900020');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0007
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0007
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0007';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'a';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, options);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('14000011');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0008
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0008
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0008';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'a'.repeat(255);
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, options);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('14000001');
        done();
      }
    });

    /**
     * @tc.number     SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0009
     * @tc.name       SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0009
     * @tc.desc       createAsset with undefined title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_SEND_ABLE_PHOTO_ACCESS_HELPER_CALLBACK_CREATE_VIDEO_0009';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'a'.repeat(256);
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      try {
        console.info(TAG, testNum, 'Start');
        let res = await sendAbleHelper.createAsset(type, extension, options);
        console.info(TAG, testNum, JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, ' error: ', JSON.stringify(error), error.code)
        expect(error.code).assertEqual('14000001');
        done();
      }
    });
  })
}