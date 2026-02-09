/*
* Copyright (C) 2024-2026 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import zlib from '@ohos.zlib';

let domain: Int = 0x0000;
let tag: string = 'testTag';

export default function ActsZipDeflateTest() {
  hilog.info(domain, tag, '%{public}s', 'describe start');

  describe('ActsZipDeflateTest', (): void => {

    /**
     * @tc.number     ACTS_ZipTest_static_25
     * @tc.name       actsZipTest_static_25
     * @tc.desc       test inflateGetDictionary
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_25 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.inflateInit2({
          nextIn: arrayBufferOut,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        }, 28
        ).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_25 inflateInit2 success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_25 inflateInit2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateGetDictionary({ nextOut: arrayBufferOut }, arrayBufferOut)
          .then((data: zlib.DictionaryOutputInfo) => {
            hilog.info(domain, tag,
              'actsZipTest_static_25 inflateGetDictionary success. data: ' + JSON.stringify(data));
            expect(data.status).assertEqual(0);
            expect(data.dictionaryLength).assertEqual(0);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_25 inflateGetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_25 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_53
     * @tc.name       actsZipTest_static_53
     * @tc.desc       test inflateGetDictionary
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_53', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_53 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateGetDictionary({
            nextIn: arrayBufferOut,
            availableIn: 1,
            nextOut: arrayBufferIn,
            availableOut: 1
          }, arrayBufferIn).then((data: zlib.DictionaryOutputInfo) => {
            hilog.info(domain, tag, 'actsZipTest_static_53 inflateGetDictionary success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_53 inflateGetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_53 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_13
     * @tc.name       actsZipTest_static_13
     * @tc.desc       test deflate and inflate
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_13 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_13 deflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_13 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflate({
          nextIn: arrayBufferIn,
          availableIn: 14,
          nextOut: arrayBufferOut,
          availableOut: 100
        }, zlib.CompressFlushMode.FINISH).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_13 deflate success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(1);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_13 deflate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflateEnd({ nextOut: arrayBufferOut }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_13 deflateEnd success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_13 deflateEnd errData is errCoqde:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateInit({
          nextIn: arrayBufferOut,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        }
        ).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_13 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_13 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflate({ nextOut: arrayBufferIn, availableOut: 28 }, zlib.CompressFlushMode.NO_FLUSH)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_13 inflate success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_13 inflate errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        await zip.inflateEnd({ nextOut: arrayBufferOut }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_13 inflateEnd success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_13 inflateEnd errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_13 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_54
     * @tc.name       actsZipTest_static_54
     * @tc.desc       test inflateEnd
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_54', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_54 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateEnd({
            nextIn: arrayBufferOut,
            availableIn: 1,
            nextOut: arrayBufferIn,
            availableOut: 1
          }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_54 inflateEnd success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_54 inflateEnd errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_54 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_15
     * @tc.name       actsZipTest_static_15
     * @tc.desc       test inflateCopy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_15 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.inflateInit({
          nextIn: arrayBufferIn,
          availableIn: 1,
          totalIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1,
          totalOut: 2,
          dataType: 1,
          adler: 2
        }
        ).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_15 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_15 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateCopy(zip).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_15 inflateCopy success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_15 inflateCopy errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_15 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_155
     * @tc.name       actsZipTest_static_155
     * @tc.desc       test inflateCopy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_155 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateCopy(zip).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_155 inflateCopy success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_155 inflateCopy errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_155 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_72
     * @tc.name       actsZipTest_static_72
     * @tc.desc       test inflate
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_72', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info("==================actsZipTest_static_72 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 2 }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_72 inflateInit success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(0);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_72 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        }
        await zip.inflate({ nextOut: arrayBufferIn, availableOut: 20 }, zlib.CompressFlushMode.NO_FLUSH)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_72 inflate success.');
            expect(data).assertFail();
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_72 inflate errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800005);
            expect(zlib.CompressFlushMode.NO_FLUSH).assertEqual(0);
            expect(zlib.CompressFlushMode.PARTIAL_FLUSH).assertEqual(1);
          })
        done();
        console.info("==================actsZipTest_static_72 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_70
     * @tc.name       actsZipTest_static_70
     * @tc.desc       test inflateCodesUsed
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_70', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_70 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.inflateInit({
          nextIn: arrayBufferOut,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_70 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_70 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateCodesUsed({
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 8
        }).then((data: Long) => {
          hilog.info(domain, tag, 'actsZipTest_static_70 inflateCodesUsed success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_70 inflateCodesUsed errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_70 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_78
     * @tc.name       actsZipTest_static_78
     * @tc.desc       test inflateBackInit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_78', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_78 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBuffer = new ArrayBuffer(0);
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateBackInit({
            nextIn: arrayBufferIn,
            availableIn: 1,
            totalIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1,
            totalOut: 2,
            dataType: 1,
            adler: 2
          }, 10, arrayBuffer).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_78 inflateBackInit success.');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_78 inflateBackInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_78 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_79
     * @tc.name       actsZipTest_static_79
     * @tc.desc       test inflateBackInit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_79', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_79 start==================");
        let zip: zlib.Zip = zlib.createZipSync();
        let buffer = new ArrayBuffer(1024)
        try {
          await zip.inflateBackInit({}, -1, buffer).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_79 inflateBackInit success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_79 inflateBackInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_79 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_77
     * @tc.name       actsZipTest_static_77
     * @tc.desc       test inflateBackEnd
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_77', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_77 start==================");
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateBackEnd({}).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_77 inflateBackInit success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_77 inflateBackInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_77 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_56
     * @tc.name       actsZipTest_static_56
     * @tc.desc       test inflate
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_56', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_55 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflate({}, zlib.CompressFlushMode.FINISH).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_56 inflate success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_56 inflate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_56 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_02
     * @tc.name       actsZipTest_static_02
     * @tc.desc       test deflateInit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_02 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i);
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync()
        await zip.deflateInit({
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        },
          zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_02 deflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_02 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_02 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_01
     * @tc.name       actsZipTest_static_01
     * @tc.desc       test deflateInit2
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_01 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync()
        await zip.deflateInit2(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, zlib.CompressMethod.DEFLATED, 15,
          zlib.MemLevel.MEM_LEVEL_DEFAULT, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_01 deflateInit2 success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
            expect(zlib.CompressMethod.DEFLATED).assertEqual(8);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_01 deflateInit2 errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_01 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_57
     * @tc.name       actsZipTest_static_57
     * @tc.desc       test deflate
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_57', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_57 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflate({}, zlib.CompressFlushMode.FINISH).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_57 deflate success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_57 deflate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_57 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_118
     * @tc.name       actsZipTest_static_118
     * @tc.desc       test deflate
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_118 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflateInit({
            nextIn: arrayBufferIn,
            availableIn: 1,
            totalIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1,
            totalOut: 2,
            dataType: 1,
            adler: 2
          }, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED)
            .then((data: zlib.ReturnStatus) => {
              hilog.info(domain, tag, 'actsZipTest_static_118 deflateInit success. data: ' + JSON.stringify(data));
              expect(data).assertEqual(zlib.ReturnStatus.OK);
            })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_118 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        }
        try {
          await zip.deflate({
            nextIn: undefined,
            availableIn: 1,
            totalIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 0,
            totalOut: 2,
            dataType: 1,
            adler: 2
          }, zlib.CompressFlushMode.NO_FLUSH).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_118 deflate success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_118 deflate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800007);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_118 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_88
     * @tc.name       actsZipTest_static_88
     * @tc.desc       test inflateSetDictionary
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_88', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_88 start==================");
        let arrayBufferOut1 = new ArrayBuffer(0);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.deflateEnd({ nextOut: arrayBufferOut1 }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_88 deflateEnd success');
          expect(data).assertFail();
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_88 deflateEnd errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_88 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_09
     * @tc.name       actsZipTest_static_09
     * @tc.desc       test deflateBound
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_09 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_09 deflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_09 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflateBound({ nextOut: arrayBufferOut }, 12).then((data: Int) => {
          hilog.info(domain, tag, 'actsZipTest_static_09 deflateBound success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(25);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_09 deflateBound errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_09 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_58
     * @tc.name       actsZipTest_static_58
     * @tc.desc       test deflateBound
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_58', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_58 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflateBound({ nextOut: arrayBufferOut }, -1).then((data: Int) => {
            hilog.info(domain, tag, 'actsZipTest_static_58 deflateBound success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_58 deflateBound errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_58 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_12
     * @tc.name       actsZipTest_static_12
     * @tc.desc       test deflateSetHeader
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_12 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync()
        await zip.deflateInit2(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, zlib.CompressMethod.DEFLATED, 28,
          zlib.MemLevel.MEM_LEVEL_DEFAULT, zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_12 deflateInit2 success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_12 deflateInit2 errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        await zip.deflateSetHeader({
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        },
          {
            isText: true,
            os: 1,
            time: 1,
            xflags: 1,
            extra: arrayBufferIn,
            extraLen: 12,
            name: arrayBufferIn,
            comment: arrayBufferOut,
            hcrc: true,
            done: true
          }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_12 deflateSetHeader success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_12 deflateSetHeader errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_12 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_59
     * @tc.name       actsZipTest_static_59
     * @tc.desc       test deflateSetHeader
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_59', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_59 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflateSetHeader({
            nextIn: arrayBufferIn,
            availableIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1
          }, {}).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_59 deflateSetHeader success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_59 deflateSetHeader errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_59 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_11
     * @tc.name       actsZipTest_static_11
     * @tc.desc       test deflateCopy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_11 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_11 deflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_11 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflateCopy(zip).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_11 deflateCopy success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_11 deflateCopy errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail()
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_11 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_61
     * @tc.name       actsZipTest_static_61
     * @tc.desc       test deflateCopy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_61', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_61 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflateCopy(zip).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_61 deflateCopy success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_61 deflateCopy errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_61 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_06
     * @tc.name       actsZipTest_static_06
     * @tc.desc       test deflateSetDictionary and deflateGetDictionary
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_06 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_06 deflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_06 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflateSetDictionary({ nextOut: arrayBufferOut }, arrayBufferOut).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_06 deflateSetDictionary success. data: ' + JSON.stringify(data));
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_06 deflateSetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflateGetDictionary({ nextOut: arrayBufferOut }, arrayBufferOut)
          .then((data: zlib.DictionaryOutputInfo) => {
            hilog.info(domain, tag,
              'actsZipTest_static_06 deflateGetDictionary success. data: ' + JSON.stringify(data));
            expect(data.status).assertEqual(0);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_06 deflateGetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_06 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_63
     * @tc.name       actsZipTest_static_63
     * @tc.desc       test deflateGetDictionary
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_63', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_63 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflateGetDictionary({
            nextIn: arrayBufferIn,
            availableIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1
          }, arrayBufferIn).then((data: zlib.DictionaryOutputInfo) => {
            hilog.info(domain, tag, 'actsZipTest_static_63 deflateGetDictionary success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.info(domain, tag,
            `actsZipTest_static_63 deflateGetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_63 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_62
     * @tc.name       actsZipTest_static_62
     * @tc.desc       test deflateSetDictionary
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_62', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_62 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflateSetDictionary({
            nextIn: arrayBufferIn,
            availableIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1
          }, arrayBufferIn).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_62 deflateSetDictionary success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_62 deflateSetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_62 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_05
     * @tc.name       actsZipTest_static_05
     * @tc.desc       test deflateTune
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_05 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_05 deflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_05 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflateTune({ nextOut: arrayBufferOut }, 2, 2, 2, 2).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_05 deflateTune success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_05 deflateTune errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_05 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_64
     * @tc.name       actsZipTest_static_64
     * @tc.desc       test deflateTune
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_64', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_64 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflateTune({
            nextIn: arrayBufferIn,
            availableIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1
          }, 1, 2, 3, 4).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_64 deflateTune success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_64 deflateTune errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_64 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_07
     * @tc.name       actsZipTest_static_07
     * @tc.desc       test deflateReset
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_07 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_07 deflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_07 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflateReset({ nextOut: arrayBufferOut }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_07 deflateReset success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_07 deflateReset errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_07 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_65
     * @tc.name       actsZipTest_static_65
     * @tc.desc       test deflateReset
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_65', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_65 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflateReset({
            nextIn: arrayBufferIn,
            availableIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1
          }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_65 deflateReset success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_65 deflateReset errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_65 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_08
     * @tc.name       actsZipTest_static_08
     * @tc.desc       test deflateResetKeep
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_08 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_08 deflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_08 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflateResetKeep({ nextOut: arrayBufferOut }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_08 deflateResetKeep success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_08 deflateResetKeep errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_08 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_66
     * @tc.name       actsZipTest_static_66
     * @tc.desc       test deflateResetKeep
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_66', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_66 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflateResetKeep({
            nextIn: arrayBufferIn,
            availableIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1
          }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_66 deflateResetKeep success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_66 deflateResetKeep errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_66 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_10
     * @tc.name       actsZipTest_static_10
     * @tc.desc       test deflatePending
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_10 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_10 deflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_10 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflatePending({ nextOut: arrayBufferOut }).then((data: zlib.DeflatePendingOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_10 deflatePending success. data: ' + JSON.stringify(data));
          expect(data.status).assertEqual(0);
          expect(data.pending).assertEqual(0);
          expect(data.bits).assertEqual(0);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_10 deflatePending errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_10 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_67
     * @tc.name       actsZipTest_static_67
     * @tc.desc       test deflatePending
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_67', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_67 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflatePending({
            nextIn: arrayBufferIn,
            availableIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1
          }).then((data: zlib.DeflatePendingOutputInfo) => {
            hilog.info(domain, tag, 'actsZipTest_static_67 deflatePending success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_67 deflatePending errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_67 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_03
     * @tc.name       actsZipTest_static_03
     * @tc.desc       test deflateParams
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_03 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_03 deflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_03 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflateParams(zStream, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
          zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_03 deflateParams success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_03 deflateParams errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_03 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_68
     * @tc.name       actsZipTest_static_68
     * @tc.desc       test deflateParams
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_68', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_68 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflateParams({}, zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION,
            zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_68 deflateParams success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_68 deflateParams errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_68 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_04
     * @tc.name       actsZipTest_static_04
     * @tc.desc       test deflatePrime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_04 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zStream: zlib.ZStream = {
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        };
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.deflateInit(zStream, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_04 deflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_04 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflatePrime({ nextOut: arrayBufferOut }, 5, 2).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_04 deflatePrime success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_04 deflatePrime errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_04 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_69
     * @tc.name       actsZipTest_static_69
     * @tc.desc       test deflatePrime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_69', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_69 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflatePrime({}, 1, 1).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_69 deflatePrime success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_69 deflatePrime errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_69 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_80
     * @tc.name       actsZipTest_static_80
     * @tc.desc       test deflatePrime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_80', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info("==================actsZipTest_static_80 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.deflatePrime({ nextOut: arrayBufferOut }, -1, 2).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_80 deflatePrime success');
            expect(data).assertFail();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `actsZipTest_static_80 deflatePrime errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        console.info("==================actsZipTest_static_80 end==================");
      })

       /**
     * @tc.number     ACTS_ZipTest_119
     * @tc.name       actsZipTest_static_119
     * @tc.desc       test inflateSetDictionary
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info("==================actsZipTest_static_119 start==================");
        let str = 'hello, hello!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        let dictionary = 'hello'
        let dictionarybuf = new ArrayBuffer(dictionary.length);
        let dictionarybufdata = new Uint8Array(dictionarybuf);
        for (let i = 0, j = dictionary.length; i < j; i++) {
          dictionarybufdata[i] = str.charCodeAt(i);
        }
        await zip.deflateInit({}, zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_119 deflateInit success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag, `actsZipTest_static_119 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
          })
        await zip.deflateSetDictionary({}, dictionarybuf).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_119 deflateSetDictionary success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag, `actsZipTest_static_119 deflateSetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
          done();
        })
        zip.deflate({
          nextIn: arrayBufferIn,
          availableIn: 14,
          nextOut: arrayBufferOut,
          availableOut: 100
        },
          zlib.CompressFlushMode.FINISH).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_119 deflate success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.STREAM_END);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag, `actsZipTest_static_119 deflate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
          done();
        })
        await zip.deflateEnd({}).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_119 deflateEnd success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK)
        }).catch((errData: Error): void => {
          hilog.error(domain, tag, `actsZipTest_static_119 deflateEnd errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
          done();
        })
        try {
          await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 100 }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_119 inflateInit success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag, `actsZipTest_static_119 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
          })
        } catch (errData) {
          hilog.error(domain, tag, `actsZipTest_static_119 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
          done();
        }
        await zip.inflate({ nextOut: arrayBufferIn, availableOut: 28 }, zlib.CompressFlushMode.NO_FLUSH)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_119 inflate success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.NEED_DICT);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag, `actsZipTest_static_119 inflate errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
          })
        await zip.inflateSetDictionary({}, dictionarybuf).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_119 inflateSetDictionary success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag, `actsZipTest_static_119 inflateSetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
          done();
        })
        await zip.inflateEnd({ nextOut: arrayBufferOut }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_119 inflateEnd success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
          done();
        }).catch((errData: Error): void => {
          hilog.error(domain, tag, `actsZipTest_static_119 inflateEnd errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
          done();
        })
        
        console.info("==================actsZipTest_static_119 end==================");
      })

  })
}