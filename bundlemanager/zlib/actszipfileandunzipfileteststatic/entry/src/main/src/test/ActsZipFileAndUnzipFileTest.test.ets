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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach} from "../../../hypium/index";
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import zlib from '@ohos.zlib'
import fileIo from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext;
let dir: string = "";
let infos: string = "";
let SRC_FILE_INVALID = 900001;
let OUTPUT_FILE_INVALID = 900002;
let INPUT_FILE_NOT_ZIP = 900003;

export default function ActsZlibTest() {
  describe('ActsZlibTest', ():void => {
    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'ActsZlibTest abilityDelegator success');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.amsZipfileUnzipfileST.static");
      await Utils.msSleep(3000);
      let dirAll = AppStorage.get<string>("dir");
      if(dirAll) {
        dir = dirAll!;
      }
      hilog.info(domain, tag, 'ActsZlibTest dir: ' + dir);
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   compressFileInFileNotExist_static
     * @tc.number Sub_Bms_Zlib_Compress_Unusual_static_0100
     * @tc.desc   test compressFile when inFile is not exist 900001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("compressFileInFileNotExist_static", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let path14 = "nonexist.txt";
      let zipDest = dir + "/compressFileInFileNotExist.zip";
      await zlib.compressFile(path14, zipDest, {
        level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
      }).then(() => {
        hilog.info(domain, 'bmsTestTag',"001 compressFileInFileNotExist invalid src file success!");
        expect().assertFail();
        done();
      }, (err: Error): void => {
        hilog.info(domain, 'bmsTestTag',"001 compressFileInFileNotExist zipFile fail: %{public}s ", JSON.stringify(err));
        expect(err?.code).assertEqual(SRC_FILE_INVALID);
        done();
      })
      zlib.compressFile(path14, zipDest, {
        level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
      }, (err: BusinessError | null): void => {
        if (err) {
          hilog.info(domain, 'bmsTestTag',"002 compressFileInFileNotExist zipFile fail: %{public}s ", JSON.stringify(err));
          expect(err?.code).assertEqual(SRC_FILE_INVALID);
          done();
        } else {
          hilog.info(domain, 'bmsTestTag',"002 compressFileInFileNotExist invalid src file success!");
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   Sub_Bms_Zlib_Compress_Unusual_static_0200
     * @tc.number Sub_Bms_Zlib_Compress_Unusual_static_0200
     * @tc.desc   test compressFile when outFile is not existed. 900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Sub_Bms_Zlib_Compress_Unusual_static_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let path1: string = dir + "/compressFileOutFileNotExist.txt";
      let outFile: string = "/11111/22222.zip";
      await zlib.compressFile(path1, outFile, {
        level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
      }).then(() => {
        hilog.info(domain, 'bmsTestTag',"003 compressFileOutFileNotExist invalid src file success!");
        expect().assertFail();
        done();
      }, (err: Error): void => {
        hilog.info(domain, 'bmsTestTag',"003 compressFileOutFileNotExist zipFile fail: %{public}s ", JSON.stringify(err));
        expect(err?.code).assertEqual(900002);
        done();
      })
      zlib.compressFile(path1, outFile, {
        level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION
      }, (err: BusinessError | null): void => {
        if (err) {
          hilog.info(domain, 'bmsTestTag',"004 compressFileOutFileNotExist zipFile fail: %{public}s ", JSON.stringify(err));
          expect(err?.code).assertEqual(900002);
          done();
        } else {
          hilog.info(domain, 'bmsTestTag',"004 compressFileOutFileNotExist invalid src file success!");
          expect().assertFail();
          done();
        }
      })
    })

      /**
       * @tc.name   compressFilesOutFileNotExist_static
       * @tc.number Sub_CompressFiles_static_0100
       * @tc.desc   test compressFiles 900002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it("compressFilesOutFileNotExist_static", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let pathDir12: string = dir;
          console.info(`beforeAll: getCacheDir data: ${pathDir12}`);
          let fpath: string = pathDir12 + `/my/test1.txt`;
          let zippath1: string = pathDir12 + `/test1.zip`;
          let zippath2: string = pathDir12 + `/test2.zip`;
          console.info(`beforeAll: filePath data: ${fpath}`);
          await zlib.compressFiles([fpath, pathDir12, pathDir12], "kkk", {}).then(() => {
            expect().assertFail();
            done();
          }, (err: Error): void => {
            hilog.info(domain, 'bmsTestTag',"005 compressFileOutFileNotExist zipFile fail: %{public}s ", JSON.stringify(err));
            expect(err.code).assertEqual(900002);
          })
          await zlib.compressFiles([""], zippath2, {}).then(() => {
            expect().assertFail();
            done();
          },(err: Error): void => {
            hilog.info(domain, 'bmsTestTag',`006 errData is errCode:${err.code}  message:${err.message}`);
            expect(err.code).assertEqual(900001);
          })
        } catch (err) {
          console.info('fileio_test_stream_write_sync_000 has failed for ' + err);
          expect().assertFail();
          done();
        }
        done();
      })


      /**
       * @tc.name   Sub_Bms_Zlib_Uncompress_Unusual_static_0200
       * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_static_0200
       * @tc.desc   test decompressFile when inFile is not exist 900001
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('Sub_Bms_Zlib_Uncompress_Unusual_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        let zipDest: string = dir + "/noneexist.zip";
        let unzipdir: string = dir + "/decompressFileInFileNotExist";
        zlib.decompressFile(zipDest, unzipdir, {
          strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY}).then(() => {
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, 'bmsTestTag',"007 decompress fail: " + JSON.stringify(err));
          expect(err.code).assertEqual(900001);
          done();
        })
        zlib.decompressFile(zipDest, unzipdir, {
          strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY
        }, (err: BusinessError | null): void => {
          if(err){
            hilog.info(domain, 'bmsTestTag',"008 decompress fail: " + JSON.stringify(err));
            expect(err?.code).assertEqual(900001);
            done();
          }else{
            expect().assertFail();
            done();
          }
        })
      })

      /**
       * @tc.name   decompressFileOutFileNotExist_static
       * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_static_0400
       * @tc.desc   test decompressFile when outFile is not existed. 900002
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('decompressFileOutFileNotExist_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        console.info("==================decompressFileOutFileNotExist_static start==================");
        let path12: string = dir;
        let zipDest1: string = dir + "/decompressFileOutFileNotExist.zip";
        let outFile: string = "/111111/22222/test";
        await zlib.compressFile(path12, zipDest1, {
          level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
        }).then(() => {
          console.info("compressFile success");
          try {
            let data: boolean = fileIo.accessSync(zipDest1);
            expect(data).assertTrue();
            done();
          } catch(error) {
            console.error(`accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((err: Error): void => {
          console.info("compressFile fail " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
        await zlib.decompressFile(zipDest1, outFile, {
          strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED
        }).then(() => {
          console.info("decompressFile success");
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, 'bmsTestTag',"009 decompress fail: " + JSON.stringify(err));
          expect(err.code).assertEqual(OUTPUT_FILE_INVALID);
          done();
        })
        zlib.decompressFile(zipDest1, outFile, {
          strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED
        }, (err: BusinessError | null): void => {
          hilog.info(domain, 'bmsTestTag',"010 decompress fail: " + JSON.stringify(err));
          expect(err?.code).assertEqual(OUTPUT_FILE_INVALID);
          done();
        })
        console.info("==================decompressFileOutFileNotExist_static end==================");
      })

    /**
     * @tc.name   decompressFileInputNotZipPro_static
     * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_static_0610
     * @tc.desc   test decompressFile when input file is not zip (promise). 900003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('decompressFileInputNotZipPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("==================decompressFileInputNotZipPro_static start==================");
      let path13: string = dir;
      let zipDest1: string = dir + "/decompressFileInputNotZipPro.text";
      let unzipdir1: string = dir + "/decompressFileInputNotZipPro";
      await fileIo.mkdir(unzipdir1).then(() =>{
        console.info("fileio mkdir successfully");
        try {
          let data: boolean = fileIo.accessSync(unzipdir1);
          expect(data).assertTrue();
        } catch(error) {
          console.error(`accessSync failed with errCode:${error.code}  message:${error.message}`);
          expect().assertFail();
          done();
        }
      }).catch((err: Error): void => {
        console.info("fileio mkdir failed with error:" + err);
        expect(err).assertFail();
        done();
      });
      try {
        await zlib.decompressFile(path13, unzipdir1, {}).then(() => {
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, 'bmsTestTag',"011 decompressFileInputNotZipPro fail1: " + JSON.stringify(err));
          expect(err.code).assertEqual(INPUT_FILE_NOT_ZIP);
        })
      } catch (err) {
        console.info("decompressFileInputNotZipPro catch1 : " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      console.info("==================decompressFileInputNotZipPro_static end==================");
      done();
    })

    /**
     * @tc.name   decompressFileTest_static
     * @tc.number Sub_Bms_Zlib_Uncompress_InputParam_static_0300
     * @tc.desc   test decompressFile when inFile and out file is valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decompressFileTest_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================decompressFileTestOutDir_static start==================");
      let path22 = dir;
      let zipDest22 = dir + "/test20.zip";
      let unzipdir22 = dir + "/test20";
      await zlib.compressFile(path22, zipDest22, {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(domain, tag, "compressFile success");
        try {
          let data: boolean = fileIo.accessSync(zipDest22);
          expect(data).assertTrue();
        } catch(error) {
          console.error(`accessSync failed with errCode:${error.code}  message:${error.message}`);
          expect().assertFail();
          done();
        }
      }).catch((err: Error): void => {
        hilog.info(domain, tag, "compressFile fail " + JSON.stringify(err));
        expect().assertFail();
        done()
      })
      await Utils.msSleep(1000);
      await fileIo.mkdir(unzipdir22).then(() =>{
        console.info("fileio mkdir successfully");
        try {
          let data: boolean = fileIo.accessSync(unzipdir22);
          expect(data).assertTrue();
        } catch(error) {
          console.error(`accessSync failed with errCode:${error.code}  message:${error.message}`);
          expect().assertFail();
        }
      }).catch((err: Error): void => {
        console.info("fileio mkdir failed with error:" + err);
        expect(err).assertFail();
      });
      await Utils.msSleep(1000);
      await zlib.decompressFile(zipDest22, unzipdir22, {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }).then(() => {
        hilog.info(domain, tag, "decompressFile success ");
        try {
          let data: boolean = fileIo.accessSync(unzipdir22);
          expect(data).assertTrue();
        } catch(error) {
          console.error(`accessSync failed with errCode:${error.code}  message:${error.message}`);
          expect().assertFail();
          done();
        }
        done();
      }).catch((err: Error): void => {
        hilog.info(domain, tag, "decompressFile fail1 " + JSON.stringify(err) + dir);
        expect().assertFail();
        done();
      })
      let pathDir25 = dir;
      let fpath25 = pathDir25 + '/test25.txt';
      let zippath25 = pathDir25 + '/test25.zip';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      };
      await Utils.msSleep(1000);
      await zlib.compressFiles([fpath25, pathDir25, pathDir25], zippath25, options).then(() => {
        hilog.info(domain, tag, 'compressFiles prepare test.zip success');
        try {
          let data: boolean = fileIo.accessSync(zippath25);
          expect(data).assertTrue();
          done();
        } catch(error) {
          console.error(`accessSync failed with errCode:${error.code}  message:${error.message}`);
          expect().assertFail();
          done();
        }
      }, (errData: Error): void => {
        hilog.info(domain, tag, `errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   decompressFileInputNotZipPro1_static
     * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_static_0310
     * @tc.desc   test decompressFile when input file is not zip (promise). 900003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('decompressFileInputNotZipPro1_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("==================decompressFileInputNotZipPro1_static start==================");
      let path13: string = dir;
      let zipDest1: string = dir + "/decompressFileInputNotZipPro1.text";
      let unzipdir1: string = dir + "/decompressFileInputNotZipPro1";
      await fileIo.mkdir(unzipdir1).then(() =>{
        console.info("fileio mkdir successfully");
        try {
          let data: boolean = fileIo.accessSync(unzipdir1);
          expect(data).assertTrue();
        } catch(error) {
          console.error(`accessSync failed with errCode:${error.code}  message:${error.message}`);
          expect().assertFail();
          done();
        }
      }).catch((err: Error): void => {
        console.info("fileio mkdir failed with error:" + err);
        expect(err).assertFail();
      });
      try {
        zlib.decompressFile(path13, unzipdir1, (err: BusinessError | null): void => {
          hilog.info(domain, 'bmsTestTag',"010 decompress fail: " + JSON.stringify(err));
          expect(err?.code).assertEqual(INPUT_FILE_NOT_ZIP);
          done();
        })
      } catch (err) {
        console.info("decompressFileInputNotZipPro catch1 : " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      console.info("==================decompressFileInputNotZipPro1_static end==================");
      done();
    })

    /**
     * @tc.name   decompressFileInputNotZipProcallback_static
     * @tc.number Sub_Bms_Zlib_Uncompress_Unusual_static_0320
     * @tc.desc   test decompressFile when input file is not zip (promise). 900003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('decompressFileInputNotZipProcallback_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("==================decompressFileInputNotZipProcallback_static start==================");
      let path13: string = dir;
      let zipDest1: string = dir + "/decompressFileInputNotZipProcallback.text";
      let unzipdir1: string = dir + "/decompressFileInputNotZipProcallback";
      await fileIo.mkdir(unzipdir1).then(() =>{
        console.info("fileio mkdir successfully");
        try {
          let data: boolean = fileIo.accessSync(unzipdir1);
          expect(data).assertTrue();
        } catch(error) {
          console.error(`accessSync failed with errCode:${error.code}  message:${error.message}`);
          expect().assertFail();
          done();
        }
      }).catch((err: Error): void => {
        console.info("fileio mkdir failed with error:" + err);
        expect(err).assertFail();
        done();
      });
      try {
        zlib.decompressFile(path13, unzipdir1, {}, (err: BusinessError | null): void => {
          hilog.info(domain, 'bmsTestTag',"010 decompress fail: " + JSON.stringify(err));
          expect(err?.code).assertEqual(INPUT_FILE_NOT_ZIP);
          done();
        })
      } catch (err) {
        console.info("decompressFileInputNotZipProcallback catch1 : " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      console.info("==================decompressFileInputNotZipProcallback_static end==================");
      done();
    })
  })
}