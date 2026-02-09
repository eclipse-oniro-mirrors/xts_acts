/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect, TestType, Size, Level, Hypium } from "../../../../hypium/index";
import hilog from '@ohos.hilog'
import Context from "application.Context"
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from '@ohos.base'
import { sleep, driveFn, getPermission } from '../Common.test.ets'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function createAssetTest() {
  describe('createAssetTest', (): void => {

    let appContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(appContext);
    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
      hilog.info(domain, tag, 'beforeAll out');
    });
    hilog.info(domain, tag, 'createAssetTest case start 2');

    const createAssetCallback1 = async (done: () => void, testNum: string, type: photoAccessHelper.PhotoType,
      extension: string, options: photoAccessHelper.CreateOptions): Promise<void> => {
      try {
        (helper as photoAccessHelper.PhotoAccessHelper).createAsset(type, extension, options,
          (err: BusinessError<void> | null, uri: string | undefined): void => {
            try {
              if (err?.code !== 0) {
                hilog.info(domain, tag,
                  testNum + ' createAsset failed' + ", err.code:" + err?.code + ", err.message:" + err?.message);
                expect(false).assertTrue();
              } else {
                hilog.info(domain, tag, testNum + ' uri: ' + uri);
              }
            } catch (error) {
              hilog.info(domain, tag,
                testNum + ' createAsset failed' + ", error.name:" + error.name + ", error.message:" + error.message);
            }
            done();
          });
      } catch (error) {
        hilog.info(domain, tag,
          testNum + ' test failed' + ", error.name:" + error.name + ", error.message:" + error.message);
        expect(false).assertTrue();
        done();
      }
    }

    const createAssetCallback2 = async (done: () => void, testNum: string, type: photoAccessHelper.PhotoType,
      extension: string): Promise<void> => {
      try {
        (helper as photoAccessHelper.PhotoAccessHelper).createAsset(type, extension, (err: BusinessError<void> | null, uri: string | undefined): void => {
          try {
            if (err?.code !== 0) {
              hilog.info(domain, tag, testNum + " err.code: " + err?.code + ", err.message: " + err?.message)
              expect(false).assertTrue();
            } else {
              hilog.info(domain, tag, testNum + " uri: " + uri)
            }
          } catch (error) {
            hilog.info(domain, tag, testNum + " error.name: " + error.name + ", error.message: " + error.message)
          }
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, testNum + "failed; error.name: " + error.name + ", error.message: " + error.message)
        expect(false).assertTrue();
        done();
      }
    }

    const createAssetAbnormalCallback1 = async (done: () => void, testNum: string,
      type: photoAccessHelper.PhotoType | undefined, extension: string | undefined,
      options: photoAccessHelper.CreateOptions | undefined): Promise<void> => {
      try {
        (helper as photoAccessHelper.PhotoAccessHelper).createAsset(type as photoAccessHelper.PhotoType, extension as string,
          options as photoAccessHelper.CreateOptions, (err: BusinessError<void> | null, uri: string | undefined) => {
            try {
              if (err?.code !== 0) {
                hilog.info(domain, tag, testNum + " err.code: " + err?.code + ", err.message: " + err?.message)
              } else {
                expect(false).assertTrue();
              }
            } catch (error) {
              hilog.info(domain, tag, testNum + " error.name: " + error.name + ", error.message: " + error.message)
            }
            done();
          });
      } catch (error) {
        hilog.info(domain, tag, testNum + "failed; error.name: " + error.name + ", error.message: " + error.message)
        done();
      }
    }

    const createAssetPromise1 = async (done: () => void, testNum: string, type: photoAccessHelper.PhotoType,
      extension: string, options: photoAccessHelper.CreateOptions): Promise<void> => {
      try {
        await (helper as photoAccessHelper.PhotoAccessHelper).createAsset(type, extension, options);
        done();
      } catch (error) {
        hilog.info(domain, tag, testNum + "failed; error.name: " + error.name + ", error.message: " + error.message)
        expect(false).assertTrue();
        done();
      }
    }

    const createAssetPromise2 = async (done: () => void, testNum: string, type: photoAccessHelper.PhotoType,
      extension: string): Promise<void> => {
      try {
        await (helper as photoAccessHelper.PhotoAccessHelper).createAsset(type, extension);
        done();
      } catch (error) {
        hilog.info(domain, tag, testNum + "failed; error.name: " + error.name + ", error.message: " + error.message)
        expect(false).assertTrue();
        done();
      }
    }

    const createAssetAbnormalPromise1 = async (done: () => void, testNum: string,
      type: photoAccessHelper.PhotoType | undefined, extension: string | undefined,
      options: photoAccessHelper.CreateOptions | undefined): Promise<void> => {
      try {
        await (helper as photoAccessHelper.PhotoAccessHelper).createAsset(type as photoAccessHelper.PhotoType, extension as string,
          options as photoAccessHelper.CreateOptions);
        expect(false).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, testNum + "failed; error.name: " + error.name + ", error.message: " + error.message)
        done();
      }
    }

    /**
     * @tc.name   createImage_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_STATIC_0000
     * @tc.desc   createAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImage_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_callback_static_000';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = 'jpg';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetCallback1(done, testNum, type, extension, options);
      })

    /**
     * @tc.name   createImage_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_STATIC_0100
     * @tc.desc   createAsset without CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImage_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_callback_static_001';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = 'jpg';
        await createAssetCallback2(done, testNum, type, extension);
      });

    /**
     * @tc.name   createImage_callback_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_STATIC_0200
     * @tc.desc   createAsset with undefined photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_callback_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_callback_static_002';
        const type = undefined;
        const extension = 'jpg';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalCallback1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createImage_callback_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_STATIC_0300
     * @tc.desc   createAsset with invalid extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_callback_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_callback_static_003';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = '123';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalCallback1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createImage_callback_static_004
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_STATIC_0400
     * @tc.desc   createAsset with undefined extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_callback_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_callback_static_004';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = undefined;
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalCallback1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createImage_callback_static_005
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_STATIC_0500
     * @tc.desc   createAsset with undefined title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_callback_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_callback_static_005';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = 'jpg';
        const options: photoAccessHelper.CreateOptions = {
          title: undefined
        };
        await createAssetCallback1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createImage_callback_static_006
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_STATIC_0600
     * @tc.desc   createAsset with undefined CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_callback_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_callback_static_006';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = 'jpg';
        const options: photoAccessHelper.CreateOptions | undefined = undefined;
        await createAssetAbnormalCallback1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createImage_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_STATIC_0000
     * @tc.desc   createAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImage_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_promise_static_000';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = 'jpg';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetPromise1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createImage_promise_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_STATIC_0100
     * @tc.desc   createAsset without CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImage_promise_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_promise_static_001';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = 'jpg';
        await createAssetPromise2(done, testNum, type, extension);
      });

    /**
     * @tc.name   createImage_promise_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_STATIC_0200
     * @tc.desc   createAsset with undefined photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_promise_static_002';
        const type = undefined;
        const extension = 'jpg';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalPromise1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createImage_promise_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_STATIC_0300
     * @tc.desc   createAsset with invalid extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_promise_static_003';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = '123';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalPromise1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createImage_promise_static_004
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_STATIC_0400
     * @tc.desc   createAsset with undefined extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_promise_static_004';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = undefined;
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalPromise1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createImage_promise_static_005
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_STATIC_0500
     * @tc.desc   createAsset with undefined title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_promise_static_005';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = 'jpg';
        const options: photoAccessHelper.CreateOptions = {
          title: undefined
        };
        await createAssetPromise1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createImage_promise_static_006
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_STATIC_0600
     * @tc.desc   createAsset with undefined CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createImage_promise_static_006';
        const type = photoAccessHelper.PhotoType.IMAGE;
        const extension = 'jpg';
        const options: photoAccessHelper.CreateOptions | undefined = undefined;
        await createAssetAbnormalPromise1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_STATIC_0000
     * @tc.desc   createAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createVideo_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_callback_static_000';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = 'mp4';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetCallback1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_STATIC_0100
     * @tc.desc   createAsset without CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createVideo_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_callback_static_001';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = 'mp4';
        await createAssetCallback2(done, testNum, type, extension);
      });

    /**
     * @tc.name   createVideo_callback_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_STATIC_0200
     * @tc.desc   createAsset with undefined photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_callback_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_callback_static_002';
        const type = undefined;
        const extension = 'mp4';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalCallback1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_callback_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_STATIC_0300
     * @tc.desc   createAsset with invalid extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_callback_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_callback_static_003';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = '123';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalCallback1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_callback_static_004
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_STATIC_0400
     * @tc.desc   createAsset with undefined extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_callback_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_callback_static_004';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = undefined;
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalCallback1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_callback_static_005
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_STATIC_0500
     * @tc.desc   createAsset with undefined title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_callback_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_callback_static_005';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = 'mp4';
        const options: photoAccessHelper.CreateOptions = {
          title: undefined
        };
        await createAssetCallback1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_callback_static_006
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_STATIC_0600
     * @tc.desc   createAsset with undefined CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_callback_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_callback_static_006';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = 'mp4';
        const options: photoAccessHelper.CreateOptions | undefined = undefined;
        await createAssetAbnormalCallback1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_STATIC_0000
     * @tc.desc   createAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createVideo_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_promise_static_000';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = 'mp4';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetPromise1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_promise_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_STATIC_0100
     * @tc.desc   createAsset without CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createVideo_promise_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_promise_static_001';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = 'mp4';
        await createAssetPromise2(done, testNum, type, extension);
      });

    /**
     * @tc.name   createVideo_promise_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_STATIC_0200
     * @tc.desc   createAsset with undefined photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_promise_static_002';
        const type = undefined;
        const extension = 'mp4';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalPromise1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_promise_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_STATIC_0300
     * @tc.desc   createAsset with invalid extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_promise_static_003';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = '123';
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalPromise1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_promise_static_004
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_STATIC_0400
     * @tc.desc   createAsset with undefined extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_promise_static_004';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = undefined;
        const options: photoAccessHelper.CreateOptions = {
          title: testNum
        };
        await createAssetAbnormalPromise1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_promise_static_005
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_STATIC_0500
     * @tc.desc   createAsset with undefined title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_promise_static_005';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = 'mp4';
        const options: photoAccessHelper.CreateOptions = {
          title: undefined
        };
        await createAssetPromise1(done, testNum, type, extension, options);
      });

    /**
     * @tc.name   createVideo_promise_static_006
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_STATIC_0600
     * @tc.desc   createAsset with undefined CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'createVideo_promise_static_006';
        const type = photoAccessHelper.PhotoType.VIDEO;
        const extension = 'mp4';
        const options: photoAccessHelper.CreateOptions | undefined = undefined;
        await createAssetAbnormalPromise1(done, testNum, type, extension, options);
      });
  })
}