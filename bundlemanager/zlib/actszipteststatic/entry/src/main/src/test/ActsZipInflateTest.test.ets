/*
* Copyright (C) 2024 Huawei Device Co., Ltd.
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

export default function ActsZipInflateTest() {
  hilog.info(domain, tag, '%{public}s', 'describe start');

  describe('ActsZipInflateTest', (): void => {

    /**
     * @tc.number     ACTS_ZipTest_static_17
     * @tc.name       actsZipTest_static_17
     * @tc.desc       test getZStream
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_17 start==================");
        let zip: zlib.Zip = zlib.createZipSync();
        await zlib.createZip().then((data: zlib.Zip) => {
          hilog.info(domain, tag, 'actsZipTest_static_17 createZip success. data: ' + JSON.stringify(data));
          expect(data).not().assertUndefined();
          expect(data != null).assertTrue();
        }).catch((errData: Error): void => {
          hilog.info(domain, tag,
            `actsZipTest_static_17 createZip errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        try {
          zip = zlib.createZipSync();
          hilog.info(domain, tag, 'actsZipTest_static_17 createZipSync success. data: ' + JSON.stringify(zip));
          expect(zip).not().assertUndefined();
          expect(zip != null).assertTrue();
        } catch (errData: BusinessError) {
          hilog.info(domain, tag,
            `actsZipTest_static_17 createZipSync errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_17 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_14
     * @tc.name       actsZipTest_static_14
     * @tc.desc       test getZStream
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_14 start==================");
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.getZStream().then((data: zlib.ZStream | undefined) => {
          hilog.info(domain, tag, 'actsZipTest_static_14 getZStream success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(undefined);
        }).catch((errData: Error): void => {
          hilog.info(domain, tag,
            `actsZipTest_static_14 getZStream errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_14 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_26
     * @tc.name       actsZipTest_static_26
     * @tc.desc       test zlibVersion
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_26 start==================");
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.zlibVersion().then((data: string) => {
          hilog.info(domain, tag, 'actsZipTest_static_26 zlibVersion success. data: ' + JSON.stringify(data));
          expect(typeof (data)).assertEqual("string");
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_26 zlibVersion errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_26 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_27
     * @tc.name       actsZipTest_static_27
     * @tc.desc       test zlibCompileFlags
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_27 start==================");
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.zlibCompileFlags().then((data: Int) => {
          hilog.info(domain, tag, 'actsZipTest_static_27 zlibCompileFlags success. data: ' + JSON.stringify(data));
          expect(data == 85 || data == 169).assertTrue();
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_27 zlibCompileFlags errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_27 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_29
     * @tc.name       actsZipTest_static_29
     * @tc.desc       test uncompress
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_29 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.compress(arrayBufferOut, arrayBufferIn, 12).then((data: zlib.ZipOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_29 compress success. data: ' + JSON.stringify(data));
          expect(data.status).assertEqual(0);
          expect(data.destLen).assertEqual(20);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_29 compress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.uncompress(arrayBufferIn, arrayBufferOut, 20).then((data: zlib.ZipOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_29 uncompress success. data: ' + JSON.stringify(data));
          expect(data.status).assertEqual(0);
          expect(data.destLen).assertEqual(12);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_29 uncompress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_29 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_55
     * @tc.name       actsZipTest_static_55
     * @tc.desc       test uncompress
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_55', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
        await zip.compress(arrayBufferOut, arrayBufferIn).then((data: zlib.ZipOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_55 compress success. data: ' + JSON.stringify(data));
          expect(data.status).assertEqual(0);
          expect(data.destLen).assertEqual(20);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_55 compress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.uncompress(arrayBufferIn, arrayBufferOut).then((data: zlib.ZipOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_55 uncompress success. data: ' + JSON.stringify(data));
          expect(data.status).assertEqual(0);
          expect(data.destLen).assertEqual(12);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_55 uncompress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_55 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_81
     * @tc.name       actsZipTest_static_81
     * @tc.desc       test compress
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_81', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_81 start==================");
        let arrayBufferIn = new ArrayBuffer(0);
        let arrayBufferOut = new ArrayBuffer(0);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.compress(arrayBufferOut, arrayBufferIn, 12).then((data: zlib.ZipOutputInfo) => {
            hilog.info(domain, tag, 'actsZipTest_static_81 compress success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_81 compress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800007);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_81 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_106
     * @tc.name       actsZipTest_static_106
     * @tc.desc       test compress
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_81 start==================");
        let arrayBufferIn = new ArrayBuffer(0);
        let arrayBufferOut = new ArrayBuffer(0);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.compress(arrayBufferOut, arrayBufferIn, -1).then((data: zlib.ZipOutputInfo) => {
            hilog.info(domain, tag, 'actsZipTest_static_106 compress success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_106 compress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_106 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_30
     * @tc.name       actsZipTest_static_30
     * @tc.desc       test compress2 and uncompress2
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_30 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.compress2(arrayBufferOut, arrayBufferIn, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, 12)
          .then((data: zlib.ZipOutputInfo) => {
            hilog.info(domain, tag, 'actsZipTest_static_30 compress2 success. data: ' + JSON.stringify(data));
            expect(data.status).assertEqual(0);
            expect(data.destLen).assertEqual(20);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_30 compress2 errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        await zip.uncompress2(arrayBufferIn, arrayBufferOut, 20).then((data: zlib.DecompressionOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_30 uncompress2 success. data: ' + JSON.stringify(data));
          expect(data.status).assertEqual(0);
          expect(data.destLength).assertEqual(12);
          expect(data.sourceLength).assertEqual(20);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_30 uncompress2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_30 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_36
     * @tc.name       actsZipTest_static_36
     * @tc.desc       test compress2 and uncompress2
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_36 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.compress2(arrayBufferOut, arrayBufferIn, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED)
          .then((data: zlib.ZipOutputInfo) => {
            hilog.info(domain, tag, 'actsZipTest_static_36 compress2 success. data: ' + JSON.stringify(data));
            expect(data.status).assertEqual(0);
            expect(data.destLen).assertEqual(20);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_36 compress2 errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        await zip.uncompress2(arrayBufferIn, arrayBufferOut).then((data: zlib.DecompressionOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_36 uncompress2 success. data: ' + JSON.stringify(data));
          expect(data.status).assertEqual(0);
          expect(data.destLength).assertEqual(12);
          expect(data.sourceLength).assertEqual(20);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_36 uncompress2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_36 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_82
     * @tc.name       actsZipTest_static_82
     * @tc.desc       test compress2
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_82', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_82 start==================");
        let arrayBufferIn = new ArrayBuffer(0);
        let arrayBufferOut = new ArrayBuffer(0);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.compress2(arrayBufferOut, arrayBufferIn, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED)
            .then((data: zlib.ZipOutputInfo) => {
              hilog.info(domain, tag, 'actsZipTest_static_82 compress2 success');
              expect(data).assertFail();
            })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_82 compress2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800007);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_82 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_107
     * @tc.name       actsZipTest_static_107
     * @tc.desc       test compress2
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_107 start==================");
        let arrayBufferIn = new ArrayBuffer(0);
        let arrayBufferOut = new ArrayBuffer(0);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.compress2(arrayBufferOut, arrayBufferIn, zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED, -1)
            .then((data: zlib.ZipOutputInfo) => {
              hilog.info(domain, tag, 'actsZipTest_static_107 compress2 success');
              expect(data).assertFail();
            })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_38 compress2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_107 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_31
     * @tc.name       actsZipTest_static_31
     * @tc.desc       test compressBound
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_31 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);

        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }

        let zip = zlib.createZipSync();

        zip.compressBound(str.length).then((data: Int) => {
          hilog.info(domain, tag, 'actsZipTest_static_31 compressBound success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(25);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_31 compressBound errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_31 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_37
     * @tc.name       actsZipTest_static_37
     * @tc.desc       test compressBound
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_37 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip = zlib.createZipSync();
        try {
          await zip.compressBound(-1).then((data: Int) => {
            hilog.info(domain, tag, 'actsZipTest_static_37 compressBound success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_37 compressBound errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_37 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_38
     * @tc.name       actsZipTest_static_38
     * @tc.desc       test uncompress
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_38', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_38 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let zip: zlib.Zip = zlib.createZipSync();
        let arrayBufferOut = new ArrayBuffer(100);
        try {
          await zip.uncompress(arrayBufferOut, arrayBufferIn, 12).then((data: zlib.ZipOutputInfo) => {
            hilog.info(domain, tag, 'actsZipTest_static_38 uncompress success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_38 uncompress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800005);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_38 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_108
     * @tc.name       actsZipTest_static_108
     * @tc.desc       test uncompress
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_108 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let zip: zlib.Zip = zlib.createZipSync();
        let arrayBufferOut = new ArrayBuffer(100);
        try {
          await zip.uncompress(arrayBufferOut, arrayBufferIn, -1).then((data: zlib.ZipOutputInfo) => {
            hilog.info(domain, tag, 'actsZipTest_static_108 uncompress success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_108 uncompress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_108 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_73
     * @tc.name       actsZipTest_static_73
     * @tc.desc       test uncompress
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_73', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_73 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.compress(arrayBufferOut, arrayBufferIn, 20).then((data: zlib.ZipOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_73 compress success. data: ' + JSON.stringify(data));
          expect(data.status).assertEqual(0);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_73 compress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.uncompress(arrayBufferIn, arrayBufferOut, 20).then((data: zlib.ZipOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_73 uncompress success');
          expect(data).assertFail();
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_73 uncompress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800007);
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_73 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_120
     * @tc.name       actsZipTest_static_120
     * @tc.desc       test uncompress
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_120 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.compress(arrayBufferOut, arrayBufferIn, 20).then((data: zlib.ZipOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_120 compress success. data: ' + JSON.stringify(data));
          expect(data.status).assertEqual(0);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_120 compress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.uncompress2(arrayBufferIn, arrayBufferOut, 20).then((data: zlib.DecompressionOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_120 uncompress2 success');
          expect(data).assertFail();
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_120 uncompress2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800007);
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_120 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_39
     * @tc.name       actsZipTest_static_39
     * @tc.desc       test uncompress2
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_39', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_39 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.uncompress2(arrayBufferOut, arrayBufferIn, 12).then((data: zlib.DecompressionOutputInfo) => {
            hilog.info(domain, tag, 'actsZipTest_static_39 uncompress2 success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_39 uncompress2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800005);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_39 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_109
     * @tc.name       actsZipTest_static_109
     * @tc.desc       test uncompress2
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_109 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.uncompress2(arrayBufferOut, arrayBufferIn, -1).then((data: zlib.DecompressionOutputInfo) => {
            hilog.info(domain, tag, 'actsZipTest_static_109 uncompress2 success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_109 uncompress2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_109 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_84
     * @tc.name       actsZipTest_static_84
     * @tc.desc       test uncompress2
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_84', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_84 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(0);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.uncompress(arrayBufferIn, arrayBufferOut).then((data: zlib.ZipOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_84 uncompress success');
          expect(data).assertFail();
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_84 uncompress errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800007);
        })
        await zip.uncompress2(arrayBufferIn, arrayBufferOut).then((data: zlib.DecompressionOutputInfo) => {
          hilog.info(domain, tag, 'actsZipTest_static_84 uncompress2 success');
          expect(data).assertFail();
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_84 uncompress2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800007);
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_84 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_16
     * @tc.name       actsZipTest_static_16
     * @tc.desc       test inflateValidate
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('actsZipTest_static_16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_16 start==================");
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
          nextOut: arrayBufferOut,
          availableOut: 1
        }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_16 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_16 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateValidate({ availableIn: 1 }, 1).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_16 inflateValidate success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_16 inflateValidate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_16 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_40
     * @tc.name       actsZipTest_static_40
     * @tc.desc       test inflateValidate
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_40', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_40 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateValidate({
            nextIn: arrayBufferOut,
            availableIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1
          },
            1).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_40 inflateValidate success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_40 inflateValidate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_40 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_18
     * @tc.name       actsZipTest_static_18
     * @tc.desc       test inflateSyncPoint
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_18 start==================");
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
          nextOut: arrayBufferOut,
          availableOut: 1
        }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_18 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_18 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateSyncPoint({ availableIn: 1 }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_18 inflateSyncPoint success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_18 inflateSyncPoint errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_18 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_42
     * @tc.name       actsZipTest_static_42
     * @tc.desc       test inflateSyncPoint
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_42 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateSyncPoint({
            nextIn: arrayBufferOut,
            availableIn: 0,
            nextOut: arrayBufferIn,
            availableOut: 0
          }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_42 inflateSyncPoint success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_42 inflateSyncPoint errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_42 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_74
     * @tc.name       actsZipTest_static_74
     * @tc.desc       test inflateSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_74', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_74 start==================");
        let str = 'hello, hello!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        let dictionary = 'hello';
        let dictionaryBuf = new ArrayBuffer(dictionary.length);
        let dictionaryBufData = new Uint8Array(dictionaryBuf);
        for (let i = 0, j = dictionary.length; i < j; i++) {
          dictionaryBufData[i] = str.charCodeAt(i);
        }
        await zip.deflateInit({}, zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_74 deflateInit success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_74 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })

        await zip.deflate({
          nextIn: arrayBufferIn,
          availableIn: 3,
          nextOut: arrayBufferOut,
          availableOut: 100
        }, zlib.CompressFlushMode.FULL_FLUSH).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_74 deflate success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_74 deflate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })

        await zip.deflate({ availableIn: 11 }, zlib.CompressFlushMode.FINISH).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_74 deflate success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(1);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_74 deflate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })

        await zip.deflateEnd({}).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_74 deflateEnd success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_74 deflateEnd errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })

        try {
          await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 2 }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_74 inflateInit success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_74 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_74 inflateInit2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        }

        await zip.inflate({ nextOut: arrayBufferIn, availableOut: 28 }, zlib.CompressFlushMode.NO_FLUSH)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_74 inflate success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_74 inflate errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })

        await zip.inflateSync({ availableIn: 26 }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_74 inflateSync success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_74 inflateSync errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })

        await zip.inflateEnd({ nextOut: arrayBufferOut }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_74 inflateEnd success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_74 inflateEnd errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_74 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_116
     * @tc.name       actsZipTest_static_116
     * @tc.desc       test deflate( error code 17800007
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_116 start==================");
        let str = 'hello, hello!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        let dictionary = 'hello';
        let dictionaryBuf = new ArrayBuffer(dictionary.length);
        let dictionaryBufData = new Uint8Array(dictionaryBuf);
        for (let i = 0, j = dictionary.length; i < j; i++) {
          dictionaryBufData[i] = str.charCodeAt(i);
        }
        await zip.deflate({
          nextIn: arrayBufferIn,
          availableIn: 14,
          nextOut: arrayBufferOut,
          availableOut: 100
        }, zlib.CompressFlushMode.FINISH).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_116 deflate success. data: ' + JSON.stringify(data));
          expect(data).assertFail();
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_116 deflate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_116 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_43
     * @tc.name       actsZipTest_static_43
     * @tc.desc       test inflateSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_43 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateSync({
            nextIn: arrayBufferOut,
            availableIn: 0,
            nextOut: arrayBufferIn,
            availableOut: 0
          }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_43 inflateSync success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_43 inflateSync errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_43 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_19
     * @tc.name       actsZipTest_static_19
     * @tc.desc       test inflateSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_19 start==================");
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
          nextOut: arrayBufferOut,
          availableOut: 1
        }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_19 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.info(domain, tag,
            `actsZipTest_static_19 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateSync({
          nextIn: arrayBufferOut,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_19 inflateSync success.');
          expect(data).assertFail();
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_19 inflateSync errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800005);
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_19 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_113
     * @tc.name       actsZipTest_static_113
     * @tc.desc       test inflateSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_113 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(0);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.inflateInit({
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_113 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.info(domain, tag,
            `actsZipTest_static_113 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        try {
          await zip.inflateSync({
            nextIn: new ArrayBuffer(0),
            availableIn: 0,
            totalIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1,
            totalOut: 2,
            dataType: 1,
            adler: 2
          }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_113 inflateSync success.');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_113 inflateSync errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800007);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_113 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_75
     * @tc.name       actsZipTest_static_75
     * @tc.desc       test inflateSetDictionary
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_75', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_75 start==================");
        let str = 'hello, hello!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        let dictionary = 'hello'
        let dictionaryBuf = new ArrayBuffer(dictionary.length);
        let dictionaryBufData = new Uint8Array(dictionaryBuf);
        for (let i = 0, j = dictionary.length; i < j; i++) {
          dictionaryBufData[i] = str.charCodeAt(i);
        }
        await zip.deflateInit({}, zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_75 deflateInit success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_75 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        await zip.deflateSetDictionary({}, dictionaryBuf).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_75 deflateSetDictionary success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_75 deflateSetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflate({
          nextIn: arrayBufferIn,
          availableIn: 3,
          nextOut: arrayBufferOut,
          availableOut: 100
        }, zlib.CompressFlushMode.FINISH).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_75 deflate success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(1);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_75 deflate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflateEnd({}).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_75 deflateEnd success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_75 deflateEnd errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        try {
          await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 100 }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_75 inflateInit success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_75 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        }
        await zip.inflate({ nextOut: arrayBufferIn, availableOut: 28 }, zlib.CompressFlushMode.NO_FLUSH)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_75 inflate success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(2);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_75 inflate errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        try {
          await zip.inflateSetDictionary({
            nextIn: arrayBufferIn,
            availableIn: 1,
            totalIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1,
            totalOut: 2,
            dataType: 1,
            adler: 2
          }, new ArrayBuffer(0)).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_775 inflateSetDictionary success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_75 inflateSetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800005);
        }
        await zip.inflateEnd({ nextOut: arrayBufferOut }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_75 inflateEnd success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_75 inflateEnd errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_75 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_44
     * @tc.name       actsZipTest_static_44
     * @tc.desc       test inflateSetDictionary
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_44', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_44 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateSetDictionary({
            nextIn: arrayBufferOut,
            availableIn: 2,
            nextOut: arrayBufferIn,
            availableOut: 2
          }, arrayBufferOut).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_44 inflateSetDictionary success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_44 inflateSetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_44 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_115
     * @tc.name       actsZipTest_static_115
     * @tc.desc       test inflateSetDictionary
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_115 start==================");
        let str = 'hello, hello!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        let dictionary = 'hello'
        let dictionaryBuf = new ArrayBuffer(dictionary.length);
        let dictionaryBufData = new Uint8Array(dictionaryBuf);
        for (let i = 0, j = dictionary.length; i < j; i++) {
          dictionaryBufData[i] = str.charCodeAt(i);
        }
        await zip.deflateInit({}, zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_115 deflateInit success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_115 deflateInit errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        await zip.deflateSetDictionary({}, dictionaryBuf).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_115 deflateSetDictionary success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_115 deflateSetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflate({
          nextIn: arrayBufferIn,
          availableIn: 3,
          nextOut: arrayBufferOut,
          availableOut: 100
        }, zlib.CompressFlushMode.FINISH).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_115 deflate success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(1);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_115 deflate errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.deflateEnd({}).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_115 deflateEnd success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_115 deflateEnd errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        try {
          await zip.inflateInit({ nextIn: arrayBufferOut, availableIn: 100 }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_115 inflateInit success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(zlib.ReturnStatus.OK);
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_115 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        }
        await zip.inflate({ nextOut: arrayBufferIn, availableOut: 28 }, zlib.CompressFlushMode.NO_FLUSH)
          .then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_115 inflate success. data: ' + JSON.stringify(data));
            expect(data).assertEqual(2);
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `actsZipTest_static_115 inflate errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          })
        await zip.inflateSetDictionary({}, dictionaryBuf).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_115 inflateSetDictionary success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_115 inflateSetDictionary errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateEnd({ nextOut: arrayBufferOut }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_115 inflateEnd success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_115 inflateEnd errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_115 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_20
     * @tc.name       actsZipTest_static_20
     * @tc.desc       test inflateResetKeep
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_20 start==================");
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
          nextOut: arrayBufferOut,
          availableOut: 1
        }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_20 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_20 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateResetKeep({ availableIn: 1 }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_20 inflateResetKeep success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_20 inflateResetKeep errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_20 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_45
     * @tc.name       actsZipTest_static_45
     * @tc.desc       test inflateResetKeep
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_45 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateResetKeep({
            nextIn: arrayBufferOut,
            availableIn: 2,
            nextOut: arrayBufferIn,
            availableOut: 2
          }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_45 inflateResetKeep success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_45 inflateResetKeep errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_45 end==================");
      })


    /**
     * @tc.number     ACTS_ZipTest_static_21
     * @tc.name       actsZipTest_static_21
     * @tc.desc       test inflateReset2
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_21 start==================");
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
          nextOut: arrayBufferOut,
          availableOut: 1
        }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_21 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_21 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateReset2({ availableOut: 8 }, 15).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_21 inflateReset2 success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_21 inflateReset2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_21 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_47
     * @tc.name       actsZipTest_static_47
     * @tc.desc       test inflateReset2
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_47', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_47 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateReset2({
            nextIn: arrayBufferOut,
            availableIn: 2,
            nextOut: arrayBufferIn,
            availableOut: 2
          }, 10).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_47 inflateReset2 success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_47 inflateReset2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_47 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_22
     * @tc.name       actsZipTest_static_22
     * @tc.desc       test inflateReset
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_22 start==================");
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
          nextOut: arrayBufferOut,
          availableOut: 1
        }
        ).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_22 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_22 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateReset({ availableIn: 1, availableOut: 8 }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_22 inflateReset success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_22 inflateReset errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_22 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_46
     * @tc.name       actsZipTest_static_46
     * @tc.desc       test inflateReset
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_46', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_46 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateReset({
            nextIn: arrayBufferOut,
            availableIn: 2,
            nextOut: arrayBufferIn,
            availableOut: 2
          }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_46 inflateReset success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_46 inflateReset errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_46 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_23
     * @tc.name       actsZipTest_static_23
     * @tc.desc       test inflatePrime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_23 start==================");
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
          nextOut: arrayBufferOut,
          availableOut: 1
        }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_23 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_23 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflatePrime({ nextOut: arrayBufferOut }, 5, 2).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_23 inflatePrime success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_23 inflatePrime errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_23 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_48
     * @tc.name       actsZipTest_static_48
     * @tc.desc       test inflatePrime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_48', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_48 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflatePrime({
            nextIn: arrayBufferOut,
            availableIn: 2,
            nextOut: arrayBufferIn,
            availableOut: 2
          }, 10, 10).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_48 inflatePrime success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_48 inflatePrime errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_48 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_71
     * @tc.name       actsZipTest_static_71
     * @tc.desc       test inflateMark
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_71', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_71 start==================");
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
        await zip.inflateInit({
          nextIn: arrayBufferOut,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        }).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_71 inflateInit success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_71 inflateInit errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateMark({
          nextIn: arrayBufferOut,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        }).then((data: Int) => {
          hilog.info(domain, tag, 'actsZipTest_static_71 inflateMark success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(-65536);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_71 inflateMark errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_71 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_24
     * @tc.name       actsZipTest_static_24
     * @tc.desc       test inflateGetHeader
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('actsZipTest_static_24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_24 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        await zip.inflateInit2({
          nextIn: arrayBufferIn,
          availableIn: 1,
          nextOut: arrayBufferOut,
          availableOut: 1
        }, 28
        ).then((data: zlib.ReturnStatus) => {
          hilog.info(domain, tag, 'actsZipTest_static_24 inflateInit2 success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_24 inflateInit2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        await zip.inflateGetHeader({ availableIn: 1, availableOut: 1 },
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
          hilog.info(domain, tag, 'actsZipTest_static_24 inflateGetHeader success. data: ' + JSON.stringify(data));
          expect(data).assertEqual(zlib.ReturnStatus.OK);
        }).catch((errData: Error): void => {
          hilog.error(domain, tag,
            `actsZipTest_static_24 inflateGetHeader errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
        })
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_24 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_50
     * @tc.name       actsZipTest_static_50
     * @tc.desc       test inflateInit2
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('actsZipTest_static_50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_50 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateInit2({}, 2).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_50 inflateInit2 success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_50 inflateInit2 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_50 end==================");
      })

    /**
     * @tc.number     ACTS_ZipTest_static_52
     * @tc.name       actsZipTest_static_52
     * @tc.desc       test inflateGetHeader
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('actsZipTest_static_52', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "==================actsZipTest_static_52 start==================");
        let str = 'hello world!';
        let arrayBufferIn = new ArrayBuffer(str.length);
        let byteArray = new Uint8Array(arrayBufferIn);
        for (let i = 0, j = str.length; i < j; i++) {
          byteArray[i] = str.charCodeAt(i)
        }
        let arrayBufferOut = new ArrayBuffer(100);
        let zip: zlib.Zip = zlib.createZipSync();
        try {
          await zip.inflateGetHeader({
            nextIn: arrayBufferOut,
            availableIn: 1,
            nextOut: arrayBufferOut,
            availableOut: 1
          }, { isText: true }).then((data: zlib.ReturnStatus) => {
            hilog.info(domain, tag, 'actsZipTest_static_52 inflateGetHeader success');
            expect(data).assertFail();
          })
        } catch (errData: BusinessError) {
          hilog.error(domain, tag,
            `actsZipTest_static_52 inflateGetHeader errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        done();
        hilog.info(domain, tag, "==================actsZipTest_static_52 end==================");
      })

  })
}