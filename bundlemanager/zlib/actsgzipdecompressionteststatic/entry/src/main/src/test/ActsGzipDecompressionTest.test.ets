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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index";
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import zlib from '@ohos.zlib'
import fileIo from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext;
let dir: string = "";
let filePath: string = "/my/test.gz";
let allFilePath: string = "";

export default function ActsGzipDecompressionTest() {
  describe('ActsGzipDecompressionTest', (): void => {
    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'ActsZlibTest abilityDelegator success');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.gzipdecompressiontest.static");
      await Utils.msSleep(3000);
      let dirAll = AppStorage.get<string>("dir");
      if (dirAll) {
        dir = dirAll!;
      }
      hilog.info(domain, tag, 'ActsZlibTest dir: ' + dir);
      let path = dir + filePath;
      hilog.info(domain, tag, 'ActsZlibTest path: ' + path);
      fileIo.mkdirSync(dir + "/my");
      let gzip = zlib.createGZipSync();
      hilog.info(domain, tag, 'ActsZlibTest gzip: ' + gzip);
      allFilePath = path;
      hilog.info(domain, tag, 'ActsZlibTest allFilePath: ' + allFilePath);
      await gzip.gzopen(path, "wb");
      await gzip.gzclose();
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4000
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4000
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4000 start==================");
        let inFile: string = dir;
        let outFile = dir + '/test.zip';
        let options: zlib.Options = {
          level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        };
        try {
          zlib.compressFile(inFile, outFile, options).then((): Promise<void> => {
            hilog.info(domain, tag, 'GzipDecompressionAbilityTest_static_4000 compressFile level success.');
            try {
              let data: boolean = fileIo.accessSync(outFile);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4000 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `compressFile level errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `compressFile level errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4010
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4010
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4010 start==================");
        let inFile: string = dir;
        let outFile1 = dir + '/test1.zip';
        let options1: zlib.Options = {
          level: zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION,
        };
        try {
          zlib.compressFile(inFile, outFile1, options1).then((): Promise<void> => {
            hilog.info(domain, tag, 'compressFile1 level success.');
            try {
              let data: boolean = fileIo.accessSync(outFile1);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4010 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `compressFile1 levelerrData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `compressFile1 levelerrData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4020
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4020
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4020 start==================");
        let inFile: string = dir;
        let outFile2 = dir + '/test2.zip';
        let options2: zlib.Options = {
          level: zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED,
        };
        try {
          zlib.compressFile(inFile, outFile2, options2).then((): Promise<void> => {
            hilog.info(domain, tag, 'compressFile2 level success.');
            try {
              let data: boolean = fileIo.accessSync(outFile2);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4020 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `compressFile2 level errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `compressFile2 level errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4030
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4030
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4030 start==================");
        let inFile: string = dir;
        let outFile3 = dir + '/test3.zip';
        let options3: zlib.Options = {
          level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION,
        };
        try {
          zlib.compressFile(inFile, outFile3, options3).then((): Promise<void> => {
            hilog.info(domain, tag, 'compressFile3 level success.');
            try {
              let data: boolean = fileIo.accessSync(outFile3);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4030 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `compressFile3 level errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `compressFile3 level errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4040
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4040
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4040 start==================");
        let inFile: string = dir;
        let outFile4 = dir + '/test4.zip';
        let options4: zlib.Options = {
          memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        };
        try {
          zlib.compressFile(inFile, outFile4, options4).then((): Promise<void> => {
            hilog.info(domain, tag, 'compressFile4 memLevel success.');
            try {
              let data: boolean = fileIo.accessSync(outFile4);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4040 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `compressFile4 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `compressFile4 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4050
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4050
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4050 start==================");
        let inFile: string = dir;
        let outFile5 = dir + '/test5.zip';
        let options5: zlib.Options = {
          memLevel: zlib.MemLevel.MEM_LEVEL_MIN,
          parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_SEQUENTIAL
        };
        try {
          zlib.compressFile(inFile, outFile5, options5).then((): Promise<void> => {
            hilog.info(domain, tag, 'compressFile5 memLevel success.');
            try {
              let data: boolean = fileIo.accessSync(outFile5);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4050 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `compressFile5 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `compressFile5 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4060
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4060
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4060 start==================");
        let inFile: string = dir;
        let outFile6 = dir + '/test6.zip';
        let options6: zlib.Options = {
          memLevel: zlib.MemLevel.MEM_LEVEL_MAX,
          parallel: zlib.ParallelStrategy.PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION
        };
        try {
          zlib.compressFile(inFile, outFile6, options6).then((): Promise<void> => {
            hilog.info(domain, tag, 'compressFile6 memLevel success.');
            try {
              let data: boolean = fileIo.accessSync(outFile6);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4060 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `compressFile6 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `compressFile6 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4070
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4070
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4070 start==================");
        let inFile: string = dir;
        let outFile7 = dir + '/test7.zip';
        let options7: zlib.Options = {
          strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
        };
        try {
          zlib.compressFile(inFile, outFile7, options7).then((): Promise<void> => {
            hilog.info(domain, tag, 'compressFile7 strategy success.');
            try {
              let data: boolean = fileIo.accessSync(outFile7);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4070 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `compressFile7 strategy errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `compressFile7 strategy errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4080
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4080
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4080 start==================");
        let inFile: string = dir;
        let outFile8 = dir + '/test8.zip';
        let options8: zlib.Options = {
          strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED
        };
        try {
          zlib.compressFile(inFile, outFile8, options8).then((): Promise<void> => {
            hilog.info(domain, tag, 'compressFile8 strategy success.');
            try {
              let data: boolean = fileIo.accessSync(outFile8);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4080 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `compressFile8 strategy errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `compressFile8 strategy errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4090
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4090
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4090 start==================");
        let inFile: string = dir;
        let outFile9 = dir + '/test9.zip';
        let options9: zlib.Options = {
          strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_RLE
        };
        try {
          zlib.compressFile(inFile, outFile9, options9).then((): Promise<void> => {
            hilog.info(domain, tag, 'compressFile9 strategy success.');
            try {
              let data: boolean = fileIo.accessSync(outFile9);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4090 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_4090 compressFile9 strategy errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `GzipDecompressionAbilityTest_static_4090 compressFile9 strategy errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4100
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4100
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4100 start==================");
        let inFile: string = dir;
        let outFile10 = dir + '/test10.zip';
        let options10: zlib.Options = {
          strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED
        };
        try {
          zlib.compressFile(inFile, outFile10, options10).then((): Promise<void> => {
            hilog.info(domain, tag, 'compressFile10 strategy success.');
            try {
              let data: boolean = fileIo.accessSync(outFile10);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4100 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `compressFile10 strategy errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `compressFile10 strategy errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4110
     * @tc.name        SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4110
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag,
          "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4110 start==================");
        let inFile: string = dir;
        let outFile11 = dir + '/test11.zip';
        let options11: zlib.Options = {
          level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
          memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
          strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
        };
        try {
          zlib.compressFile(inFile, outFile11, options11).then((): Promise<void> => {
            hilog.info(domain, tag, 'GzipDecompressionAbilityTest_static_4110 compressFile options success.');
            try {
              let data: boolean = fileIo.accessSync(outFile11);
              expect(data).assertTrue();
              done();
            } catch (error) {
              error = error as BusinessError;
              hilog.error(domain, tag,
                `GzipDecompressionAbilityTest_static_4110 accessSync failed with errCode:${error.code}  message:${error.message}`);
              expect().assertFail();
              done();
            }
          }).catch((errData: Error): void => {
            hilog.error(domain, tag,
              `compressFile11 options errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `compressFile11 options errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_10600
     * @tc.name        GzipDecompressionAbilityTest_static_10600
     * @tc.desc        test gzdopen error code 17800002
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_10600 Start=====");
        try {
          await zlib.createGZip().then((gzip) => {
            gzip.gzdopen(1, '').then(() => {
              expect().assertFail();
            });
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_10600 gzdopen failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800002);
          }
        }
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_10600 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_9800
     * @tc.name        GzipDecompressionAbilityTest_static_9800
     * @tc.desc        test gzdopen error code 17800002
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_9800 Start=====");
        let gzip = zlib.createGZipSync();
        try {
          await gzip.gzdopen(-1, 'wb').then(() => {
            expect().assertFail();
            done();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_9800 gzdopen failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800002);
            done();
          }
        }
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_9800 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_9900
     * @tc.name        GzipDecompressionAbilityTest_static_9900
     * @tc.desc        test gzdopen correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_static_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_9900 Start=====");
        let gzip = zlib.createGZipSync();
        try {
          let file = fileIo.openSync(allFilePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
          await gzip.gzdopen(file.fd, 'wb');
          let writeBufferWithData = new ArrayBuffer(16);
          let uint8View = new Uint8Array(writeBufferWithData);
          for (let i = 0; i < uint8View.length; i++) {
            uint8View[i] = i;
          }
          let writeNum = await gzip.gzwrite(writeBufferWithData, 16)
          expect(writeNum).assertEqual(16);
          done();
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `GzipDecompressionAbilityTest_static_9900 gzdopen errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_9900 End=====");
      })


    /**
     * @tc.number    GzipDecompressionAbilityTest_static_9500
     * @tc.name        GzipDecompressionAbilityTest_static_9500
     * @tc.desc        test gzbuffer correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_static_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_9500 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzbuffer(10000).then((num) => {
            hilog.info(domain, tag, "GzipDecompressionAbilityTest_static_9500 num:" + num);
            expect(num).assertEqual(0);
            done();
          })
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_9500 gzbuffer errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_9500 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_10700
     * @tc.name        GzipDecompressionAbilityTest_static_10700
     * @tc.desc        test gzbuffer error code 17800009
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_10700 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzbuffer(-1).then(() => {
            expect().assertFail();
            done();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_10700 gzbuffer failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800009);
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_10700 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_4900
     * @tc.name        GzipDecompressionAbilityTest_static_4900
     * @tc.desc        test gzopen correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_4900 Start=====");
        let gzip = zlib.createGZipSync();
        try {
          await gzip.gzopen(allFilePath, "wb");
          let writeBufferWithData = new ArrayBuffer(16);
          let uint8View = new Uint8Array(writeBufferWithData);
          for (let i = 0; i < uint8View.length; i++) {
            uint8View[i] = i;
          }
          let writeNum = await gzip.gzwrite(writeBufferWithData, 16)
          expect(writeNum).assertEqual(16);
          done();
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `GzipDecompressionAbilityTest_static_4900 gzopen failed with errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_4900 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_5200
     * @tc.name        GzipDecompressionAbilityTest_static_5200
     * @tc.desc        test gzopen error code 17800002
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_5200 Start=====");
        let gzip = zlib.createGZipSync();
        try {
          await gzip.gzopen("", "wb").then(() => {
            expect().assertFail();
            done();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_5200 gzopen failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800002);
            done();
          }
        }

        try {
          await gzip.gzopen(allFilePath, "").then(() => {
            expect().assertFail();
            done();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_5200 gzopen failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800002);
            done();
          }
        }
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_5200 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_8100
     * @tc.name        GzipDecompressionAbilityTest_static_8100
     * @tc.desc        test gzeof correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_static_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzeof().then((num) => {
            expect(num).assertEqual(0);
            done();
          })
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_8100 gzeof failed with errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8100 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_8600
     * @tc.name        GzipDecompressionAbilityTest_static_8600
     * @tc.desc        test gzdirect correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_static_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8600 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzdirect().then((num) => {
            expect(num).assertEqual(0);
            done();
          })
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_8600 gzdirect failed with errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8600 End=====");
      });

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_8700
     * @tc.name        GzipDecompressionAbilityTest_static_8700
     * @tc.desc        test gzdirect correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_static_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8700 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wT");
        try {
          await gzip.gzdirect().then((num) => {
            expect(num).assertEqual(1);
            done();
          })
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_8700 gzdirect failed with errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8700 End=====");
      });

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_5500
     * @tc.name        GzipDecompressionAbilityTest_static_5500
     * @tc.desc        test gzclose correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_5500 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzclose().then((num) => {
            expect(num).assertEqual(zlib.ReturnStatus.OK);
            done();
          })
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_5500 gzclose failed with errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          }
        }
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_5500 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_10300
     * @tc.name        GzipDecompressionAbilityTest_static_10300
     * @tc.desc        test gzclose error code 17800004
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_10300 Start=====");
        let gzip = zlib.createGZipSync();
        try {
          await gzip.gzclose().then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_10300 gzclose failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
          }
        }
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_10300 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_8800
     * @tc.name        GzipDecompressionAbilityTest_static_8800
     * @tc.desc        test gzerror correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8800 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzerror().then((GzErrorOutputInfo) => {
            expect(GzErrorOutputInfo.status).assertEqual(0);
            expect(GzErrorOutputInfo.statusMsg).assertContain('');
            hilog.info(domain, tag,
              `GzipDecompressionAbilityTest_static_8800 status:${GzErrorOutputInfo.status}  statusMsg:${GzErrorOutputInfo.statusMsg}`);
            done();
          })
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_8800 gzerror failed with errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8800 End=====");
      });

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_10000
     * @tc.name        GzipDecompressionAbilityTest_static_10000
     * @tc.desc        test gzerror error code 17800004
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Framework_GzipDecompressionAbilityTest_static_10000 Start=====");
        let gzip = zlib.createGZipSync();
        try {
          await gzip.gzerror().then(() => {
            expect().assertFail();
            done();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_10000 gzerror failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
            done();
          }
        }
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_10000 End=====");
      });

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_6300
     * @tc.name        GzipDecompressionAbilityTest_static_6300
     * @tc.desc        test gzgetc correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_6300 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        await gzip.gzputc(1);
        await gzip.gzclose();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzgetc().then((result) => {
            expect(result).assertEqual(1);
            done();
          })
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_6300 gzgetc failed with errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_6300 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_6500
     * @tc.name        GzipDecompressionAbilityTest_static_6500
     * @tc.desc        test gzgetc error code 17800009
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_6500 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzgetc().then(() => {
            expect().assertFail();
            done();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_6500 gzgetc failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800009);
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_6500 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_static_9000
     * @tc.name        GzipDecompressionAbilityTest_static_static_9000
     * @tc.desc        test gzflush error code 17800004
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_static_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_9000 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzflush(zlib.CompressFlushMode.BLOCK).then(() => {
            expect().assertFail();
            done();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_9000 gzflush failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800004);
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====SGzipDecompressionAbilityTest_static_9000 End=====");
      });

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_1900
     * @tc.name        GzipDecompressionAbilityTest_static_1900
     * @tc.desc        test gzfwrite correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('GzipDecompressionAbilityTest_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_1900 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          let bufferWithData = new ArrayBuffer(16);
          let uint8View = new Uint8Array(bufferWithData);
          for (let i = 0; i < uint8View.length; i++) {
            uint8View[i] = i;
          }
          await gzip.gzfwrite(bufferWithData, 8, 2).then((num) => {
            expect(num).assertEqual(2);
            done();
          })
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_1900 gzfwrite failed with errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_1900 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_2300
     * @tc.name        GzipDecompressionAbilityTest_static_2300
     * @tc.desc        test gzfwrite error code 401
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_2300 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        let bufferWithData = new ArrayBuffer(16);
        let uint8View = new Uint8Array(bufferWithData);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        try {
          await gzip.gzfwrite(bufferWithData, -1, 8).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          expect(errData.code).assertEqual(401);
        }

        try {
          await gzip.gzfwrite(bufferWithData, 2, -1).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          expect(errData.code).assertEqual(401);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_2300 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_2400
     * @tc.name        GzipDecompressionAbilityTest_static_2400
     * @tc.desc        test gzfwrite error code 17800009
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_2400 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        let bufferWithData = new ArrayBuffer(16);
        let uint8View = new Uint8Array(bufferWithData);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        try {
          await gzip.gzfwrite(bufferWithData, 0, 2).then(() => {
            expect().assertFail();
            done();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_2400 gzfwrite failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800009);
            done();
          }
        }

        try {
          await gzip.gzfwrite(bufferWithData, 2, 0).then(() => {
            expect().assertFail();
            done();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_2400 gzfwrite failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800009);
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_2400 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_3100
     * @tc.name        GzipDecompressionAbilityTest_static_3100
     * @tc.desc        test gzfread correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('GzipDecompressionAbilityTest_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_3100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        let bufferWithData = new ArrayBuffer(16);
        let uint8View = new Uint8Array(bufferWithData);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        await gzip.gzfwrite(bufferWithData, 8, 2);
        await gzip.gzclose();
        await gzip.gzopen(allFilePath, "rb");
        try {
          let bufferWithData = new ArrayBuffer(16);
          await gzip.gzfread(bufferWithData, 8, 2).then((num) => {
            expect(num).assertEqual(2);
            done();
          })
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_3100 gzfread failed with errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_3100 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_3300
     * @tc.name        GzipDecompressionAbilityTest_static_3300
     * @tc.desc        test gzfread error code 401
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_3300 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        let bufferWithData = new ArrayBuffer(16);
        try {
          await gzip.gzfread(bufferWithData, -1, 8).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          expect(errData.code).assertEqual(401);
        }

        try {
          await gzip.gzfread(bufferWithData, 2, -1).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          expect(errData.code).assertEqual(401);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_3300 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_3600
     * @tc.name        GzipDecompressionAbilityTest_static_3600
     * @tc.desc        test gzfread error code 17800009
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_3600 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        let bufferWithData = new ArrayBuffer(16);
        try {
          await gzip.gzfread(bufferWithData, 0, 8).then(() => {
            expect().assertFail();
            done();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_3600 gzfread failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800009);
            done();
          }
        }

        try {
          await gzip.gzfread(bufferWithData, 2, 0).then(() => {
            expect().assertFail();
            done();
          });
        } catch (errData) {
          if (errData instanceof BusinessError) {
            hilog.error(domain, tag,
              `GzipDecompressionAbilityTest_static_3600 gzfread failed with errCode:${errData.code}  message:${errData.message}`);
            expect(errData.code).assertEqual(17800009);
            done();
          }
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_3600 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_8500
     * @tc.name        GzipDecompressionAbilityTest_static_8500
     * @tc.desc        test gzclearerr correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_static_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8500 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        let writeBufferWithData = new ArrayBuffer(16);
        let uint8View = new Uint8Array(writeBufferWithData);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let writeNum = await gzip.gzwrite(writeBufferWithData, 16)
        expect(writeNum).assertEqual(16);
        await gzip.gzclose();
        await gzip.gzopen(allFilePath, "rb");
        let readBufferWithData = new ArrayBuffer(20);
        let readNum = await gzip.gzread(readBufferWithData);
        expect(readNum).assertEqual(16);
        let eofNum = await gzip.gzeof();
        expect(eofNum).assertEqual(1);
        let readNum2 = await gzip.gzread(readBufferWithData);
        expect(readNum2).assertEqual(0);
        await gzip.gzclearerr();
        let eofNumClear = await gzip.gzeof();
        expect(eofNumClear).assertEqual(0);
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8500 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_8200
     * @tc.name        GzipDecompressionAbilityTest_8200
     * @tc.desc        test gzeof correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_8200 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        let writeBufferWithData = new ArrayBuffer(16);
        let uint8View = new Uint8Array(writeBufferWithData);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let writeNum = await gzip.gzwrite(writeBufferWithData, 16)
        expect(writeNum).assertEqual(16);
        await gzip.gzclose();
        await gzip.gzopen(allFilePath, "rb");
        let readBufferWithData = new ArrayBuffer(20);
        let readNum = await gzip.gzread(readBufferWithData);
        expect(readNum).assertEqual(16);
        let eofNum = await gzip.gzeof();
        expect(eofNum).assertEqual(1);
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_8200 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_8300
     * @tc.name        GzipDecompressionAbilityTest_8300
     * @tc.desc        test gzeof correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_8300 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        let writeBufferWithData = new ArrayBuffer(16);
        let uint8View = new Uint8Array(writeBufferWithData);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let writeNum = await gzip.gzwrite(writeBufferWithData, 16)
        expect(writeNum).assertEqual(16);
        await gzip.gzclose();
        await gzip.gzopen(allFilePath, "rb");
        let readBufferWithData = new ArrayBuffer(16);
        let readNum = await gzip.gzread(readBufferWithData);
        expect(readNum).assertEqual(16);
        let eofNum = await gzip.gzeof();
        expect(eofNum).assertEqual(0);
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_8300 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_8400
     * @tc.name        GzipDecompressionAbilityTest_8400
     * @tc.desc        test gzeof correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('GzipDecompressionAbilityTest_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_8400 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        let writeBufferWithData = new ArrayBuffer(16);
        let uint8View = new Uint8Array(writeBufferWithData);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        let writeNum = await gzip.gzwrite(writeBufferWithData, 16)
        expect(writeNum).assertEqual(16);
        await gzip.gzclose();
        await gzip.gzopen(allFilePath, "rb");
        let readBufferWithData = new ArrayBuffer(15);
        let readNum = await gzip.gzread(readBufferWithData);
        expect(readNum).assertEqual(15);
        let eofNum = await gzip.gzeof();
        expect(eofNum).assertEqual(0);
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_8400 End=====");
      })

    /**
     * @tc.number    Test_gzclosew_normal_0100
     * @tc.name        Test_gzclosew_normal_0100
     * @tc.desc        test gzclosew correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('Test_gzclosew_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzclosew_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzclosew().then((num) => {
            expect(num).assertEqual(zlib.ReturnStatus.OK);
          })
        } catch (errData) {
          if (errData instanceof BusinessError
          )
          {
            hilog.error(domain, tag, `Test_gzclosew_normal_0100 errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
          }
        }
        done();
        hilog.info(domain, tag, "=====Test_gzclosew_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzclosew_0100
     * @tc.name        Test_gzclosew_0100
     * @tc.desc        test gzclosew error code 17800004
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzclosew_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzclosew_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzclosew().then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzclosew_0100 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzclosew_0100 End=====");
      })

    /**
     * @tc.number    Test_gzcloser_normal_0100
     * @tc.name        Test_gzcloser_normal_0100
     * @tc.desc        test gzcloser correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('Test_gzcloser_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzcloser_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzcloser().then((num) => {
            expect(num).assertEqual(zlib.ReturnStatus.OK);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzcloser_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        done();
        hilog.info(domain, tag, "=====Test_gzcloser_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzcloser_0100
     * @tc.name        Test_gzcloser_0100
     * @tc.desc        test gzcloser error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzcloser_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzcloser_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzcloser().then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzcloser_0100 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzcloser_0100 End=====");
      })

    /**
     * @tc.number    Test_gzwrite_normal_0100
     * @tc.name        Test_gzwrite_normal_0100
     * @tc.desc        test gzwrite correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('Test_gzwrite_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzwrite_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          let bufferWithData = new ArrayBuffer(16);
          let uint8View = new Uint8Array(bufferWithData);
          for (let i = 0; i < uint8View.length; i++) {
            uint8View[i] = i;
          }
          await gzip.gzwrite(bufferWithData, 16).then((num) => {
            expect(num).assertEqual(16);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzwrite_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzwrite_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzwrite_0100
     * @tc.name        Test_gzwrite_0100
     * @tc.desc        test gzwrite error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzwrite_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzwrite_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          let bufferWithData = new ArrayBuffer(0);
          await gzip.gzwrite(bufferWithData, 1).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzwrite_0100 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);

        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzwrite_0100 End=====");
      })

    /**
     * @tc.number    Test_gzwrite_0400
     * @tc.name        Test_gzwrite_0400
     * @tc.desc        test gzwrite error code 17800009
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzwrite_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzwrite_0400 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          let bufferWithData = new ArrayBuffer(16);
          let uint8View = new Uint8Array(bufferWithData);
          for (let i = 0; i < uint8View.length; i++) {
            uint8View[i] = i;
          }
          await gzip.gzwrite(bufferWithData, 0).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzwrite_0400 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzwrite_0400 End=====");
      })

    /**
     * @tc.number    Test_gzwrite_0500
     * @tc.name        Test_gzwrite_0500
     * @tc.desc        test gzwrite error code 17800009
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzwrite_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzwrite_0500 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          let bufferWithData = new ArrayBuffer(16);
          let uint8View = new Uint8Array(bufferWithData);
          for (let i = 0; i < uint8View.length; i++) {
            uint8View[i] = i;
          }
          await gzip.gzwrite(bufferWithData, 16).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzwrite_0500 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzwrite_0500 End=====");
      })

    /**
     * @tc.number    Test_gzungetc_normal_0100
     * @tc.name        Test_gzungetc_normal_0100
     * @tc.desc        test gzungetc correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('Test_gzungetc_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzungetc_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzread(new ArrayBuffer(1));
          await gzip.gzungetc(1).then((resulit) => {
            expect(resulit).assertEqual(1);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzungetc_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzungetc_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzungetc_0200
     * @tc.name        Test_gzungetc_0200
     * @tc.desc        test gzungetc error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzungetc_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzungetc_0200 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzungetc(-1).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzungetc_0200 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzungetc_0200 End=====");
      })

    /**
     * @tc.number    Test_gzungetc_0300
     * @tc.name        Test_gzungetc_0300
     * @tc.desc        test gzungetc error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzungetc_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzungetc_0300 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzungetc(256).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzungetc_0300 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzungetc_0300 End=====");
      })

    /**
     * @tc.number    Test_gzungetc_0500
     * @tc.name        Test_gzungetc_0500
     * @tc.desc        test gzungetc error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzungetc_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzungetc_0500 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzungetc(1).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzungetc_0500 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzungetc_0500 End=====");
      })

    /**
     * @tc.number    Test_gztell_normal_0100
     * @tc.name        Test_gztell_normal_0100
     * @tc.desc        test gztell correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('Test_gztell_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gztell_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gztell().then((num) => {
            expect(num).assertEqual(0);
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gztell_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gztell_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gztell_0100
     * @tc.name        Test_gztell_0100
     * @tc.desc        test gztell error code 17800009
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gztell_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gztell_0100 Start=====");
        let gzip = zlib.createGZipSync();
        try {
          await gzip.gztell().then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gztell_0100 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        done();
        hilog.info(domain, tag, "=====Test_gztell_0100 End=====");
      })

    /**
     * @tc.number    Test_gzsetparams_normal_0100
     * @tc.name        Test_gzsetparams_normal_0100
     * @tc.desc        test gzsetparams correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzsetparams_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzsetparams_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION,
            zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then((errcode) => {
            expect(errcode).assertEqual(zlib.ReturnStatus.OK);
          })
          await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED,
            zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED).then((errcode) => {
            expect(errcode).assertEqual(zlib.ReturnStatus.OK);
          })
          await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION,
            zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY).then((errcode) => {
            expect(errcode).assertEqual(zlib.ReturnStatus.OK);
          })
          await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            zlib.CompressStrategy.COMPRESS_STRATEGY_RLE).then((errcode) => {
            expect(errcode).assertEqual(zlib.ReturnStatus.OK);
          })
          await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED).then((errcode) => {
            expect(errcode).assertEqual(zlib.ReturnStatus.OK);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzsetparams_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzsetparams_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzsetparams_0300
     * @tc.name        Test_gzsetparams_0300
     * @tc.desc        test gzsetparams error code 17800004
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzsetparams_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzsetparams_0300 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzsetparams(zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzsetparams_0300 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800004);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzsetparams_0300 End=====");
      })

    /**
     * @tc.number    Test_gzseek_normal_0100
     * @tc.name        Test_gzseek_normal_0100
     * @tc.desc        test gzseek correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('Test_gzseek_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzseek_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzseek(2, zlib.OffsetReferencePoint.SEEK_SET).then((resulit) => {
            expect(resulit).assertEqual(2);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzseek_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzseek_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzseek_normal_0200
     * @tc.name        Test_gzseek_normal_0200
     * @tc.desc        test gzseek correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('Test_gzseek_normal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzseek_normal_0200 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzseek(2, zlib.OffsetReferencePoint.SEEK_CUR).then((resulit) => {
            expect(resulit).assertEqual(2);
          })
          await gzip.gzseek(-2, zlib.OffsetReferencePoint.SEEK_CUR).then((resulit) => {
            expect(resulit).assertEqual(0);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzseek_normal_0200 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzseek_normal_0200 End=====");
      })

    /**
     * @tc.number    Test_gzseek_0300
     * @tc.name        Test_gzseek_0300
     * @tc.desc        test gzseek error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzseek_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzseek_0300 Start=====");
        let gzip = zlib.createGZipSync();
        try {
          await gzip.gzseek(2, zlib.OffsetReferencePoint.SEEK_CUR).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzseek_0300 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        done();
        hilog.info(domain, tag, "=====Test_gzseek_0300 End=====");
      })

    /**
     * @tc.number    Test_gzrewind_normal_0100
     * @tc.name        Test_gzrewind_normal_0100
     * @tc.desc        test gzrewind correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('Test_gzrewind_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzrewind_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzrewind().then((resulit) => {
            expect(resulit).assertEqual(zlib.ReturnStatus.OK);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzrewind_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzrewind_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzrewind_0100
     * @tc.name        Test_gzrewind_0100
     * @tc.desc        test gzrewind error code 17800009
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzrewind_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzrewind_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzrewind().then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzrewind_0100 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzrewind_0100 End=====");
      })

    /**
     * @tc.number    Test_gzread_normal_0100
     * @tc.name        Test_gzread_normal_0100
     * @tc.desc        test gzread correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('Test_gzread_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzread_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        let bufferWithData = new ArrayBuffer(16);
        let uint8View = new Uint8Array(bufferWithData);
        for (let i = 0; i < uint8View.length; i++) {
          uint8View[i] = i;
        }
        await gzip.gzwrite(bufferWithData, 16);
        await gzip.gzclose();
        await gzip.gzopen(allFilePath, "rb");
        try {
          let bufferWithData = new ArrayBuffer(16);
          await gzip.gzread(bufferWithData).then((num) => {
            expect(num).assertEqual(16);
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzread_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzread_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzread_0100
     * @tc.name        Test_gzread_0100
     * @tc.desc        test gzread error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzread_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzread_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          let bufferWithData = new ArrayBuffer(0);
          await gzip.gzread(bufferWithData).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzread_0100 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzread_0100 End=====");
      })

    /**
     * @tc.number    Test_gzread_0400
     * @tc.name        Test_gzread_0400
     * @tc.desc        test gzread error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzread_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzread_0400 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          let bufferWithData = new ArrayBuffer(16);
          await gzip.gzread(bufferWithData).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzread_0400 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzread_0400 End=====");
      })

    /**
     * @tc.number    Test_gzputs_normal_0100
     * @tc.name        Test_gzputs_normal_0100
     * @tc.desc        test gzputs correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('Test_gzputs_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzputs_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzputs("hello").then((num) => {
            expect(num).assertEqual(5);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzputs_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzputs_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzputs_normal_0200
     * @tc.name        Test_gzputs_normal_0200
     * @tc.desc        test gzputs error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('Test_gzputs_normal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzputs_normal_0200 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzputs("").then((num) => {
            expect(num).assertEqual(0);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzputs_normal_0200 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzputs_normal_0200 End=====");
      })

    /**
     * @tc.number    Test_gzputs_0300
     * @tc.name        Test_gzputs_0300
     * @tc.desc        test gzputs error code 17800009
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzputs_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzputs_0300 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzputs("hello").then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzputs_0300 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzputs_0300 End=====");
      })

    /**
     * @tc.number    Test_gzputc_normal_0100
     * @tc.name        Test_gzputc_normal_0100
     * @tc.desc        test gzputc correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzputc_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzputc_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzputc(0).then((num) => {
            expect(num).assertEqual(0);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzputc_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzputc_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzputc_0400
     * @tc.name        Test_gzputc_0400
     * @tc.desc        test gzputc error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzputc_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzputc_0400 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzputc(0).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzputc_0400 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzputc_0400 End=====");
      })

    /**
     * @tc.number    Test_gzputc_0500
     * @tc.name        Test_gzputc_0500
     * @tc.desc        test gzputc error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzputc_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzputc_0500 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzputc(-1).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzputc_0500 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzputc_0500 End=====");
      })

    /**
     * @tc.number    Test_gzputc_0600
     * @tc.name        Test_gzputc_0600
     * @tc.desc        test gzputc error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzputc_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzputc_0600 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzputc(256).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzputc_0600 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(401);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzputc_0600 End=====");
      })

    /**
     * @tc.number    Test_gzprintf_normal_0100
     * @tc.name        Test_gzprintf_normal_0100
     * @tc.desc        test gzprintf correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('Test_gzprintf_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzprintf_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzprintf("name is %s, age is %d", "Tom", 23).then((len) => {
            expect(len).assertEqual(22);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzprintf_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzprintf_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzprintf_0100
     * @tc.name        Test_gzprintf_0100
     * @tc.desc        test gzprintf error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzprintf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzprintf_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          await gzip.gzprintf("name is %s, age is %d", "Tom", 23).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          expect(errData.code).assertEqual(17800004);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzprintf_0100 End=====");
      })

    /**
     * @tc.number    Test_gzoffset_normal_0100
     * @tc.name        Test_gzoffset_normal_0100
     * @tc.desc        test gzoffset correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('Test_gzoffset_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzoffset_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzoffset().then((result) => {
            expect(result).assertEqual(0);
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzoffset_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzoffset_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzoffset_0100
     * @tc.name        Test_gzoffset_0100
     * @tc.desc        test gzoffset error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzoffset_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzoffset_0100 Start=====");
        let gzip = zlib.createGZipSync();
        try {
          await gzip.gzoffset().then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzoffset_0100 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        done();
        hilog.info(domain, tag, "=====Test_gzoffset_0100 End=====");
      })

    /**
     * @tc.number    Test_gzgets_normal_0100
     * @tc.name        Test_gzgets_normal_0100
     * @tc.desc        test gzgets correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('Test_gzgets_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzgets_normal_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        await gzip.gzputs("hello");
        await gzip.gzclose();
        await gzip.gzopen(allFilePath, "rb");
        try {
          let bufferWithData = new ArrayBuffer(16);
          await gzip.gzgets(bufferWithData).then((resulit) => {
            expect(resulit).assertEqual("hello");
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzgets_normal_0100 errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzgets_normal_0100 End=====");
      })

    /**
     * @tc.number    Test_gzgets_0100
     * @tc.name        Test_gzgets_0100
     * @tc.desc        test gzgets error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzgets_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzgets_0100 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          let bufferWithData = new ArrayBuffer(16);
          await gzip.gzgets(bufferWithData).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzgets_0100 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzgets_0100 End=====");
      })

    /**
     * @tc.number    Test_gzgets_0200
     * @tc.name        Test_gzgets_0200
     * @tc.desc        test gzgets error code
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_gzgets_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_gzgets_0200 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "rb");
        try {
          let bufferWithData = new ArrayBuffer(0);
          await gzip.gzgets(bufferWithData).then(() => {
            expect().assertFail();
          });
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag, `Test_gzgets_0200 errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(17800009);
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====Test_gzgets_0200 End=====");
      })

    /**
     * @tc.number    Test_ReturnStatus_0100
     * @tc.name        Test_ReturnStatus_0100
     * @tc.desc        test ReturnStatus enum
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('Test_ReturnStatus_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====Test_ReturnStatus_0100 Start=====");
        try {
          let gzip = zlib.createGZipSync();
          gzip.gzopen("/data/storage/el2/base/cache/test.gz", "wb").then(() => {
            hilog.info(domain, tag, "gzopen success ");
            let bufferWithData = new ArrayBuffer(16);
            let uint8View = new Uint8Array(bufferWithData);
            for (let i = 0; i < uint8View.length; i++) {
              uint8View[i] = i;
            }
            gzip.gzwrite(bufferWithData, -1).then((data) => {
              hilog.info(domain, tag, "gzwrite success : " + data);
              gzip.gzclose().then((data: zlib.ReturnStatus) => {
                hilog.info(domain, tag, "gzclose success : " + JSON.stringify(data));
              }).catch((err: Error): void => {
                hilog.info(domain, tag,
                  "gzclose failed code:" + JSON.stringify(err.code) + "，message ：" + JSON.stringify(err.message));
              });
            }).catch((err: Error): void => {
              hilog.info(domain, tag,
                "gzwrite failed code:" + JSON.stringify(err.code) + "，message ：" + JSON.stringify(err.message));
              gzip.gzerror().then((data: zlib.GzErrorOutputInfo) => {
                hilog.info(domain, tag, "gzerror success data.status : " + data.status);
                hilog.info(domain, tag, "gzerror success status : " + JSON.stringify(data.status));
                hilog.info(domain, tag, "gzerror success statusMsg : " + JSON.stringify(data.statusMsg));
                expect(data.status).assertEqual(zlib.ReturnStatus.DATA_ERROR);
                done();
              }).catch((err: Error): void => {
                hilog.info(domain, tag,
                  "gzerror failed code:" + JSON.stringify(err.code) + "，message ：" + JSON.stringify(err.message));
              });
            });
          }).catch((err: Error): void => {
            hilog.info(domain, tag,
              "gzopen failed code:" + JSON.stringify(err.code) + "，message ：" + JSON.stringify(err.message));
          });
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          hilog.info(domain, tag, " gzopen catch code:" + JSON.stringify(code));
          hilog.info(domain, tag, " gzopen catch message:" + JSON.stringify(message));
        }
        hilog.info(domain, tag, "=====Test_ReturnStatus_0100 End=====");
      })

    /**
     * @tc.number    GzipDecompressionAbilityTest_static_8900
     * @tc.name        GzipDecompressionAbilityTest_static_8900
     * @tc.desc        test gzflush correct return value
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('GzipDecompressionAbilityTest_static_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8900 Start=====");
        let gzip = zlib.createGZipSync();
        await gzip.gzopen(allFilePath, "wb");
        try {
          await gzip.gzflush(zlib.CompressFlushMode.NO_FLUSH).then((num) => {
            expect(num).assertEqual(zlib.ReturnStatus.OK);
            expect(-1).assertEqual(zlib.ReturnStatus.ERRNO);
            expect(-2).assertEqual(zlib.ReturnStatus.STREAM_ERROR);
            expect(-4).assertEqual(zlib.ReturnStatus.MEM_ERROR);
            expect(-5).assertEqual(zlib.ReturnStatus.BUF_ERROR);
            done();
          })
          await gzip.gzflush(zlib.CompressFlushMode.PARTIAL_FLUSH).then((num) => {
            expect(num).assertEqual(zlib.ReturnStatus.OK);
            done();
          })
          await gzip.gzflush(zlib.CompressFlushMode.SYNC_FLUSH).then((num) => {
            expect(num).assertEqual(zlib.ReturnStatus.OK);
            done();
          })
          await gzip.gzflush(zlib.CompressFlushMode.FULL_FLUSH).then((num) => {
            expect(num).assertEqual(zlib.ReturnStatus.OK);
            done();
          })
          await gzip.gzflush(zlib.CompressFlushMode.FINISH).then((num) => {
            expect(num).assertEqual(zlib.ReturnStatus.OK);
            done();
          })
          await gzip.gzflush(zlib.CompressFlushMode.TREES).then((num) => {
            expect(num).assertEqual(zlib.ReturnStatus.OK);
            done();
          })
          await gzip.gzflush(zlib.CompressFlushMode.BLOCK).then((num) => {
            expect(num).assertEqual(zlib.ReturnStatus.OK);
            expect(zlib.ReturnStatus.STREAM_END).assertEqual(1);
            expect(zlib.ReturnStatus.NEED_DICT).assertEqual(2);
            done();
          })
        } catch (errData) {
          errData = errData as BusinessError;
          hilog.error(domain, tag,
            `GzipDecompressionAbilityTest_static_8900 gzflush failed with errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        }
        await gzip.gzclose();
        done();
        hilog.info(domain, tag, "=====GzipDecompressionAbilityTest_static_8900 End=====");
      });
  })
}