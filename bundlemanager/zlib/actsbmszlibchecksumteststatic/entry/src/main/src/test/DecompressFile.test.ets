 /**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index";
import zlib from '@ohos.zlib'
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

const TAG: string = 'DecompressFile';
const Domain: int = 0x0000;
let infos: string = "";

export default function decompressFileTest() {
  describe('decompressFileTest', (): void => {
    beforeAll(() => {
      let objectone = 'ohos.acts.bmszlib.checksum.static.MainAbility/ohos.acts.bmszlib.checksum.static/';
      let objecttwo = 'ohos.acts.bmszlib.checksum.static.MainAbility/ohos.acts.bmszlib.checksum.static/zipunzip';
      let objectthree =
        'ohos.acts.bmszlib.checksum.static.MainAbility/decompressFileTest/ohos.acts.bmszlib.checksum.static';
      infos = '/data/storage/el2/base/files' + objectone + objecttwo + objectthree;
    })

    /**
     * @tc.name   acts_zlibDecompressFile_static_0100
     * @tc.number acts_zlibDecompressFile_static_0100
     * @tc.desc   decompressFile err code 900001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(Domain, TAG,
        '==================acts_zlibDecompressFile_static_0100 start==================');
      let inFile = '/data/storage/el1/bundle/nofile.zip';
      let outFileDir = '/data/storage/el1/base';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      try {
        await zlib.decompressFile(inFile, outFileDir, options).then(() => {
          hilog.info(Domain, TAG,
            'acts_zlibDecompressFile_static_0100 decompressFile success.');
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.error(Domain, TAG,
            `acts_zlibDecompressFile_static_0100 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(900001);
          done();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(Domain, TAG,
          `acts_zlibDecompressFile_static_0100 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   acts_zlibDecompressFile_static_0200
     * @tc.number acts_zlibDecompressFile_static_0200
     * @tc.desc   decompressFile err code 900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(Domain, TAG,
        '==================acts_zlibDecompressFile_static_0200 start==================');
      let inFile = '/data/storage/el1/bundle/nofile.zip';
      let outFileDir = '';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      try {
        await zlib.decompressFile(inFile, outFileDir, options).then(() => {
          hilog.info(Domain, TAG,
            'acts_zlibDecompressFile_static_0200 decompressFile success.');
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.error(Domain, TAG,
            `acts_zlibDecompressFile_static_0200 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(900002);
          done();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(Domain, TAG,
          `acts_zlibDecompressFile_static_0200 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData).assertFail();
        done();
      }
    })

    /**
     * @tc.name   acts_zlibDecompressFile_static_0300
     * @tc.number acts_zlibDecompressFile_static_0300
     * @tc.desc   decompressFile err code 900003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(Domain, TAG,
        '==================acts_zlibDecompressFile_static_0300 start==================');
      let inFile = '/data/storage/el2/base/files/test.text';
      let outFileDir = '/data/storage/el2/base/files';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      let file = fs.openSync(inFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      await fs.write(file.fd, 'hello, world').then((number) => {
        hilog.info(Domain, TAG,
          'acts_zlibDecompressFile_static_0300 write data to file succeed and size is:' + number);
        expect(number).assertEqual(12);
      }).catch((err: Error): void => {
        hilog.error(Domain, TAG,
          'acts_zlibDecompressFile_static_0300 write data to file failed with error:' + err);
        expect(err).assertFail();
      });
      try {
        await zlib.decompressFile(inFile, outFileDir, options).then(() => {
          hilog.info(Domain, TAG,
            'acts_zlibDecompressFile_static_0300 decompressFile success.');
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.error(Domain, TAG,
            `acts_zlibDecompressFile_static_0300 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(900003);
          done();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(Domain, TAG,
          `acts_zlibDecompressFile_static_0300 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData).assertFail();
        done();
      }
    })

    /**
     * @tc.name   acts_zlibDecompressFile_static_0400
     * @tc.number acts_zlibDecompressFile_static_0400
     * @tc.desc   decompressFile normal promise \
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(Domain, TAG,
        '==================acts_zlibDecompressFile_static_0400 start==================');
      let inFile = '/data/storage/el2/base/testfile.zip';
      let outFileDir = '/data/storage/el2/base';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      let file = fs.openSync(inFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      await fs.write(file.fd, infos).then((number) => {
        hilog.info(Domain, TAG,
          'acts_zlibDecompressFile_static_0400 write data to file succeed and size is:' + number);
        expect(number).assertEqual(294);
      }).catch((err: Error): void => {
        hilog.error(Domain, TAG,
          'acts_zlibDecompressFile_static_0400 write data to file failed with error:' + err);
        expect(err).assertFail();
      });
      await zlib.compressFile(inFile, outFileDir + '/testfile.zip', {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0400 compressFile success.');
        try {
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0400 file exists');
            expect(res).assertEqual(true);
          } else {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0400 file not exists');
            expect().assertFail();
          }
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(Domain, TAG,
            `acts_zlibDecompressFile_static_0400 compressFile failed errData is errCode:${code}  message:${message}`);
          expect(error).assertFail();
        }
      }).catch((err: Error): void => {
        hilog.error(Domain, TAG,
          `acts_zlibDecompressFile_static_0400 compressFile failed errData is errCode:${err.code}  message:${err.message}`);
        expect(err).assertFail();
      })
      try {
        await zlib.decompressFile(inFile, outFileDir, options).then(() => {
          hilog.info(Domain, TAG,
            'acts_zlibDecompressFile_static_0400 decompressFile success.');
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0400 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0400 file not exists');
            expect().assertFail();
            done();
          }
        }).catch((err: Error): void => {
          hilog.error(Domain, TAG,
            `acts_zlibDecompressFile_static_0400 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err).assertFail();
          done();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(Domain, TAG,
          `acts_zlibDecompressFile_static_0400 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData).assertFail();
        done();
      }
    
    })

    /**
     * @tc.name   acts_zlibDecompressFile_static_0500
     * @tc.number acts_zlibDecompressFile_static_0500
     * @tc.desc   decompressFile normal callback \
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(Domain, TAG,
        '==================acts_zlibDecompressFile_static_0500 start==================');
      let inFile = '/data/storage/el2/base/testfile1.zip';
      let outFileDir = '/data/storage/el2/base';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      let file = fs.openSync(inFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      await fs.write(file.fd, infos).then((number) => {
        hilog.info(Domain, TAG,
          'acts_zlibDecompressFile_static_0400 write data to file succeed and size is:' + number);
        expect(number).assertEqual(294);
      }).catch((err: Error): void => {
        hilog.error(Domain, TAG,
          'acts_zlibDecompressFile_static_0400 write data to file failed with error:' + err);
        expect(err).assertFail();
      });
      await zlib.compressFile(inFile, outFileDir + '/testfile1.zip', {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0500 compressFile success.');
        try {
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0500 file exists');
            expect(res).assertEqual(true);
          } else {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0500 file not exists');
            expect().assertFail();
          }
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(Domain, TAG,
            `acts_zlibDecompressFile_static_0500 compressFile failed errData is errCode:${code}  message:${message}`);
          expect(error).assertFail();
        }
      }).catch((err: Error): void => {
        hilog.error(Domain, TAG,
          `acts_zlibDecompressFile_static_0500 compressFile failed errData is errCode:${err.code}  message:${err.message}`);
        expect(err).assertFail();
      })
      try {
        zlib.decompressFile(inFile, outFileDir, options, (errData: BusinessError | null) => {
          if (errData !== null) {
            hilog.error(Domain, TAG,
              `acts_zlibDecompressFile_static_0500 decompressFile failed errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
          }
          hilog.info(Domain, TAG,
            'acts_zlibDecompressFile_static_0500 decompressFile success.');
            let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0500 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0500 file not exists');
            expect().assertFail();
            done();
          }
        });
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(Domain, TAG,
          `acts_zlibDecompressFile_static_0500 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData).assertFail();
        done();
      }
    })

    /**
     * @tc.name   acts_zlibDecompressFile_static_0600
     * @tc.number acts_zlibDecompressFile_static_0600
     * @tc.desc   decompressFile normal pathSeparatorStrategy is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(Domain, TAG, '==================acts_zlibDecompressFile_static_0600 start==================');
      let inFile = '/data/storage/el2/base/testfile2.zip';
      let outFileDir = '/data/storage/el2/base';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_DEFAULT
      };
      let file = fs.openSync(inFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      await fs.write(file.fd, infos).then((number) => {
        hilog.info(Domain, TAG,
          'acts_zlibDecompressFile_static_0600 write data to file succeed and size is:' + number);
        expect(number).assertEqual(294);
      }).catch((err: Error): void => {
        hilog.error(Domain, TAG,
          'acts_zlibDecompressFile_static_0600 write data to file failed with error:' + err);
        expect(err).assertFail();
      });
      await zlib.compressFile(inFile, outFileDir + '/testfile2.zip', {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0600 compressFile success.');
        try {
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0600 file exists');
            expect(res).assertEqual(true);
          } else {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0600 file not exists');
            expect().assertFail();
          }
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(Domain, TAG,
            `acts_zlibDecompressFile_static_0600 compressFile failed errData is errCode:${code}  message:${message}`);
          expect(error).assertFail();
        }
      }).catch((err: Error): void => {
        hilog.error(Domain, TAG,
          `acts_zlibDecompressFile_static_0600 compressFile errData is errCode:${err.code}  message:${err.message}`);
        expect(err).assertFail();
      })
      try {
        await zlib.decompressFile(inFile, outFileDir, options).then(() => {
          hilog.info(Domain, TAG,
            'acts_zlibDecompressFile_static_0600 decompressFile success.');
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0600 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(Domain, TAG, 'acts_zlibDecompressFile_static_0600 file not exists');
            expect().assertFail();
            done();
          }
        }).catch((err: Error): void => {
          hilog.error(Domain, TAG,
            `acts_zlibDecompressFile_static_0600 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err).assertFail();
          done();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(Domain, TAG,
          `acts_zlibDecompressFile_static_0600 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData).assertFail();
        done();
      }
    })

  })
}