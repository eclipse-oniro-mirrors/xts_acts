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
import { beforeEach, describe, it, expect, Level } from '@ohos/hypium'
import { BusinessError, zlib } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import fs from '@ohos.file.fs';

let infos = '';

export default function decompressFileTest() {
  describe('decompressFileTest', () => {
    beforeEach(async () => {
      let objectone = 'ohos.acts.bmszlib.checksum.MainAbility/ohos.acts.bmszlib.checksum/';
      let objecttwo = 'ohos.acts.bmszlib.checksum.MainAbility/ohos.acts.bmszlib.checksum/zipunzip';
      let objectthree = 'ohos.acts.bmszlib.checksum.MainAbility/decompressFileTest/ohos.acts.bmszlib.checksum';
      infos = '/data/storage/el2/base/files' + objectone + objecttwo + objectthree;
    });

    /**
     * @tc.name   acts_zlibDecompressFile_0100
     * @tc.number acts_zlibDecompressFile_0100
     * @tc.desc   decompressFile err code 900001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_0100', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0100 start==================');
      let inFile = '/data/storage/el1/bundle/nofile.zip';
      let outFileDir = '/data/storage/el1/base';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      try {
        await zlib.decompressFile(inFile, outFileDir, options).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_0100 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0100 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(900001);
          done();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_0100 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0100 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_0200
     * @tc.number acts_zlibDecompressFile_0200
     * @tc.desc   decompressFile err code 900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_0200', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0200 start==================');
      let inFile = '/data/storage/el1/bundle/nofile.zip';
      let outFileDir = '';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      try {
        await zlib.decompressFile(inFile, outFileDir, options).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_0200 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0200 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(900002);
          done();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_0200 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0200 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_0300
     * @tc.number acts_zlibDecompressFile_0300
     * @tc.desc   decompressFile err code 900003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_0300', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0300 start==================');
      let inFile = '/data/storage/el2/base/files/test.7z';
      let outFileDir = '/data/storage/el2/base/files';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      let file = fs.openSync(inFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.write(file.fd, 'hello, world').then((number: number) => {
        hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0300 write data to file succeed and size is:' + number);
        expect(number).assertEqual(12);
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0300 write data to file failed with error:' + err);
        expect(err).assertFail();
      });
      try {
        await zlib.decompressFile(inFile, outFileDir, options).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_0300 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0300 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err.code).assertEqual(900003);
          done();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_0300 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect().assertFail();
        done();
      }
      
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0300 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_1000
     * @tc.number acts_zlibDecompressFile_1000
     * @tc.desc   decompressFile err code 401 outFileDir params undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_1000', Level.LEVEL2, async (done: Function) => {


      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1000 start==================');
      let inFile = '/data/storage/el1/bundle/nofile.zip';
      let outFileDir = '/data/storage/el2/base/files';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      try {
        zlib.decompressFile(inFile, undefined, options).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_1000 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_1000 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect().assertFail();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_1000 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData.code).assertEqual(401);
      }
      try {
        zlib.decompressFile(inFile, undefined, options, (errData: BusinessError, data: void) => {
          if (errData !== null) {
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_1000 decompressFile failed errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
          }
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_1000 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
        });
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_1000 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData.code).assertEqual(401);
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1000 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_1300
     * @tc.number acts_zlibDecompressFile_1300
     * @tc.desc   decompressFile err code 401 inFile params undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_1300', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1300 start==================');
      let inFile = '/data/storage/el1/bundle/nofile.zip';
      let outFileDir = '/data/storage/el2/base/files';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      try {
        zlib.decompressFile(undefined, outFileDir, options).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_1300 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_1300 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect().assertFail();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_1300 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData.code).assertEqual(401);
      }
      try {
        zlib.decompressFile(undefined, outFileDir, options, (errData: BusinessError, data: void) => {
          if (errData !== null) {
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_1300 decompressFile failed errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
          }
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_1300 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
        });
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_1300 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData.code).assertEqual(401);
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1300 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_1400
     * @tc.number acts_zlibDecompressFile_1400
     * @tc.desc   decompressFile err code 401 options params undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_1400', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1400 start==================');
      let inFile = '/data/storage/el1/bundle/nofile.zip';
      let outFileDir = '/data/storage/el2/base/files';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      try {
        zlib.decompressFile(inFile, outFileDir, undefined, (errData: BusinessError, data: void) => {
          if (errData !== null) {
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_1400 decompressFile failed errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
          }
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_1400 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
        });
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_1400 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData.code).assertEqual(401);
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1400 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_1200
     * @tc.number acts_zlibDecompressFile_1200
     * @tc.desc   decompressFile err code 401 inFile params null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_1200', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1200 start==================');
      let inFile = '/data/storage/el1/bundle/nofile.zip';
      let outFileDir = '/data/storage/el2/base/files';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      try {
        zlib.decompressFile(null, outFileDir, options).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_1200 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_1200 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect().assertFail();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_1200 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData.code).assertEqual(401);
      }
      try {
        zlib.decompressFile(null, outFileDir, options, (errData: BusinessError, data: void) => {
          if (errData !== null) {
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_1200 decompressFile failed errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
          }
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_1200 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
        });
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_1200 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData.code).assertEqual(401);
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1200 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_1500
     * @tc.number acts_zlibDecompressFile_1500
     * @tc.desc   decompressFile err code 401 outFileDir params null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_1500', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1500 start==================');
      let inFile = '/data/storage/el1/bundle/nofile.zip';
      let outFileDir = '/data/storage/el2/base/files';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      try {
        zlib.decompressFile(inFile, null, options).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_1500 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_1500 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect().assertFail();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_1500 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData.code).assertEqual(401);
      }
      try {
        zlib.decompressFile(inFile, null, options, (errData: BusinessError, data: void) => {
          if (errData !== null) {
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_1500 decompressFile failed errData is errCode:${errData.code}  message:${errData.message}`);
           expect().assertFail();
          }
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_1500 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
        });
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_1500 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData.code).assertEqual(401);
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1500 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_1600
     * @tc.number acts_zlibDecompressFile_1600
     * @tc.desc   decompressFile err code 401 outFileDir params null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_1600', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1600 start==================');
      let inFile = '/data/storage/el1/bundle/nofile.zip';
      let outFileDir = '/data/storage/el2/base/files';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      try {
        zlib.decompressFile(inFile, outFileDir, null, (errData: BusinessError, data: void) => {
          if (errData !== null) {
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_1600 decompressFile failed errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
          }
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_1600 decompressFile success. data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertFail();
        });
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_1600 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData.code).assertEqual(401);
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1600 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_0400
     * @tc.number acts_zlibDecompressFile_0400
     * @tc.desc   decompressFile normal promise \
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_0400', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0400 start==================');
      let inFile = '/data/storage/el2/base/testfile.zip';
      let outFileDir = '/data/storage/el2/base';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      let file = fs.openSync(inFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.write(file.fd, infos).then((number: number) => {
        hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0400 write data to file succeed and size is:' + number);
        expect(number).assertEqual(252);
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0400 write data to file failed with error:' + err);
        expect(err).assertFail();
      });
      await zlib.compressFile(inFile, outFileDir + '/testfile.zip', {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0400 compressFile success.');
        try {
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0400 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0400 file not exists');
          }
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0400 compressFile failed errData is errCode:${code}  message:${message}`);
          expect(error).assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0400 compressFile fail ' + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
      try {
        zlib.decompressFile(inFile, outFileDir, options).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_0400 decompressFile success. data: ' + JSON.stringify(data));
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0400 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0400 file not exists');
          }
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0400 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err).assertFail();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_0400 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData).assertFail();
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0400 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_0500
     * @tc.number acts_zlibDecompressFile_0500
     * @tc.desc   decompressFile normal callback \
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_0500', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0500 start==================');
      let inFile = '/data/storage/el2/base/testfile1.zip';
      let outFileDir = '/data/storage/el2/base';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      let file = fs.openSync(inFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.write(file.fd, infos).then((number: number) => {
        hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0500 write data to file succeed and size is:' + number);
        expect(number).assertEqual(252);
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0500 write data to file failed with error:' + err);
        expect(err).assertFail();
      });
      await zlib.compressFile(inFile, outFileDir + '/testfile1.zip', {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0500 compressFile success.');
        try {
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0500 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0500 file not exists');
          }
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0500 compressFile failed errData is errCode:${code}  message:${message}`);
          expect(error).assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0500 compressFile fail ' + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
      try {
        zlib.decompressFile(inFile, outFileDir, options, (errData: BusinessError, data: void) => {
          if (errData !== null) {
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_0500 decompressFile failed errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
          }
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_0500 decompressFile success. data: ' + JSON.stringify(data));
          expect(data == undefined).assertTrue();
        });
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_0500 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData).assertFail();
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0500 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_0600
     * @tc.number acts_zlibDecompressFile_0600
     * @tc.desc   decompressFile normal pathSeparatorStrategy is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_0600', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0600 start==================');
      let inFile = '/data/storage/el2/base/testfile2.zip';
      let outFileDir = '/data/storage/el2/base';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_DEFAULT
      };
      let file = fs.openSync(inFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.write(file.fd, infos).then((number: number) => {
        hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0600 write data to file succeed and size is:' + number);
        expect(number).assertEqual(252);
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0600 write data to file failed with error:' + err);
        expect(err).assertFail();
      });
      await zlib.compressFile(inFile, outFileDir + '/testfile2.zip', {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0600 compressFile success.');
        try {
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0600 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0600 file not exists');
          }
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0600 compressFile failed errData is errCode:${code}  message:${message}`);
          expect(error).assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0600 compressFile fail ' + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
      try {
        zlib.decompressFile(inFile, outFileDir, options).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_0600 decompressFile success. data: ' + JSON.stringify(data));
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0600 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0600 file not exists');
          }
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0600 decompressFile failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err).assertFail();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_0600 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData).assertFail();
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0600 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_0700
     * @tc.number acts_zlibDecompressFile_0700
     * @tc.desc   decompressFile normal promise /
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_0700', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0700 start==================');
      let inFile = '/data/storage/el2/base/test.zip';
      let outFileDir = '/data/storage/el2/base';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      await zlib.compressFile(outFileDir, inFile, {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0700 compressFile success.');
        try {
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0700 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0700 file not exists');
          }
        } catch (err) {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0700 accessSync failed with errCode:${err.code}  message:${err.message}`);
          expect(err).assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0700 compressFile fail ' + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
      try {
        zlib.decompressFile(inFile, outFileDir, options).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_0700 decompressFile success. data: ' + JSON.stringify(data));
          try {
            let res: boolean = fs.accessSync(inFile);
            if (res) {
              hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0700 file exists');
              expect(res).assertEqual(true);
              done();
            } else {
              hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0700 file not exists');
            }
          } catch (errData) {
            let code = (errData as BusinessError).code;
            let message = (errData as BusinessError).message;
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_0700 accessSync failed errData is errCode:${code}  message:${message}`);
            expect(errData).assertFail();
          }
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0700 accessSync failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err).assertFail();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_0700 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData).assertFail();
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0700 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_0800
     * @tc.number acts_zlibDecompressFile_0800
     * @tc.desc   decompressFile normal callback /
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_0800', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0800 start==================');
      let inFile = '/data/storage/el2/base/test1.zip';
      let outFileDir = '/data/storage/el2/base';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_REPLACE_BACKSLASH
      };
      await zlib.compressFile(outFileDir, inFile, {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0800 compressFile success.');
        try {
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0800 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0800 file not exists');
          }
        } catch (err) {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0800 accessSync failed with errCode:${err.code}  message:${err.message}`);
          expect(err).assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0800 compressFile fail ' + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
      try {
        zlib.decompressFile(inFile, outFileDir, options, (errData: BusinessError, data: void) => {
          if (errData !== null) {
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_0800 decompressFile failed errData is errCode:${errData.code}  message:${errData.message}`);
          }
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_0800 decompressFile success. data: ' + JSON.stringify(data));
          expect(data == undefined).assertTrue();
          try {
            let res: boolean = fs.accessSync(inFile);
            if (res) {
              hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0800 file exists');
              expect(res).assertEqual(true);
              done();
            } else {
              hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0800 file not exists');
            }
          } catch (errData) {
            let code = (errData as BusinessError).code;
            let message = (errData as BusinessError).message;
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_0800 accessSync failed errData is errCode:${code}  message:${message}`);
            expect(errData).assertFail();
          }
        });
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_0800 decompressFile failed errData is errCode:${code}  message:${message}`);
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0800 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_0900
     * @tc.number acts_zlibDecompressFile_0900
     * @tc.desc   decompressFile pathSeparatorStrategy is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_0900', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0900 start==================');
      let inFile = '/data/storage/el2/base/test2.zip';
      let outFileDir = '/data/storage/el2/base';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION,
        pathSeparatorStrategy: zlib.PathSeparatorStrategy.PATH_SEPARATOR_STRATEGY_DEFAULT
      };
      await zlib.compressFile(outFileDir, inFile, {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0900 compressFile success.');
        try {
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0900 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0900 file not exists');
          }
        } catch (err) {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0900 accessSync failed with errCode:${err.code}  message:${err.message}`);
          expect(err).assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0900 compressFile fail ' + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
      try {
        zlib.decompressFile(inFile, outFileDir, options).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_0900 decompressFile success. data: ' + JSON.stringify(data));
          try {
            let res: boolean = fs.accessSync(inFile);
            if (res) {
              hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0900 file exists');
              expect(res).assertEqual(true);
              done();
            } else {
              hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_0900 file not exists');
            }
          } catch (errData) {
            let code = (errData as BusinessError).code;
            let message = (errData as BusinessError).message;
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_0900 accessSync failed errData is errCode:${code}  message:${message}`);
            expect(errData).assertFail();
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_0900 accessSync failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err).assertFail();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_0900 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData).assertFail();
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_0900 end==================');
    })

    /**
     * @tc.name   acts_zlibDecompressFile_1100
     * @tc.number acts_zlibDecompressFile_1100
     * @tc.desc   decompressFile do not pass optional parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('acts_zlibDecompressFile_1100', Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1100 start==================');
      let inFile = '/data/storage/el2/base/test3.zip';
      let outFileDir = '/data/storage/el2/base';
      await zlib.compressFile(outFileDir, inFile, {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_1100 compressFile success.');
        try {
          let res: boolean = fs.accessSync(inFile);
          if (res) {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_1100 file exists');
            expect(res).assertEqual(true);
            done();
          } else {
            hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_1100 file not exists');
          }
        } catch (err) {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_1100 accessSync failed with errCode:${err.code}  message:${err.message}`);
          expect(err).assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'bmsTag', 'acts_zlibDecompressFile_1100 compressFile fail ' + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
      try {
        zlib.decompressFile(inFile, outFileDir).then((data: void) => {
          hilog.info(0x0000, 'bmsTag',
            'acts_zlibDecompressFile_1100 decompressFile success. data: ' + JSON.stringify(data));
          try {
            let res: boolean = fs.accessSync(inFile);
            if (res) {
              hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_1100 file exists');
              expect(res).assertEqual(true);
              done();
            } else {
              hilog.info(0x0000, 'bmsTag', 'acts_zlibDecompressFile_1100 file not exists');
            }
          } catch (errData) {
            let code = (errData as BusinessError).code;
            let message = (errData as BusinessError).message;
            hilog.error(0x0000, 'bmsTag',
              `acts_zlibDecompressFile_1100 accessSync failed errData is errCode:${code}  message:${message}`);
            expect(errData).assertFail();
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'bmsTag',
            `acts_zlibDecompressFile_1100 accessSync failed errData is errCode:${err.code}  message:${err.message}`);
          expect(err).assertFail();
        })
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.error(0x0000, 'bmsTag',
          `acts_zlibDecompressFile_1100 decompressFile failed errData is errCode:${code}  message:${message}`);
        expect(errData).assertFail();
      }
      done();
      hilog.info(0x0000, 'bmsTag', '==================acts_zlibDecompressFile_1100 end==================');
    })

  })
}