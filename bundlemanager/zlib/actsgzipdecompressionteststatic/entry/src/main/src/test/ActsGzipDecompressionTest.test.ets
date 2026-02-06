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

export default function ActsGzipDecompressionTest() {
  describe('ActsGzipDecompressionTest', ():void => {
    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'ActsZlibTest abilityDelegator success');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.gzipdecompressiontest.static");
      await Utils.msSleep(3000);
      let dirAll = AppStorage.get<string|undefined>("dir");
      if(dirAll) {
        dir = dirAll!;
      }
      hilog.info(domain, tag, 'ActsZlibTest dir: ' + dir);
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4000
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4000
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4000 start==================");
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
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4000 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `compressFile level errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag, `compressFile level errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4010
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4010
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4010', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4010 start==================");
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
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4010 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `compressFile1 levelerrData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag, `compressFile1 levelerrData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4020
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4020
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4020', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4020 start==================");
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
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4020 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `compressFile2 level errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag, `compressFile2 level errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4030
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4030
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4030', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4030 start==================");
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
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4030 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `compressFile3 level errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag, `compressFile3 level errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4040
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4040
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4040', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4040 start==================");
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
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4040 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `compressFile4 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag, `compressFile4 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4050
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4050
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4050', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4050 start==================");
      let inFile: string = dir;
      let outFile5 = dir + '/test5.zip';
      let options5: zlib.Options = {
        memLevel: zlib.MemLevel.MEM_LEVEL_MIN,
      };
      try {
        zlib.compressFile(inFile, outFile5, options5).then((): Promise<void> => {
          hilog.info(domain, tag, 'compressFile5 memLevel success.');
          try {
            let data: boolean = fileIo.accessSync(outFile5);
            expect(data).assertTrue();
            done();
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4050 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `compressFile5 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag, `compressFile5 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4060
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4060
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4060', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4060 start==================");
      let inFile: string = dir;
      let outFile6 = dir + '/test6.zip';
      let options6: zlib.Options = {
        memLevel: zlib.MemLevel.MEM_LEVEL_MAX,
      };
      try {
        zlib.compressFile(inFile, outFile6, options6).then((): Promise<void> => {
          hilog.info(domain, tag, 'compressFile6 memLevel success.');
          try {
            let data: boolean = fileIo.accessSync(outFile6);
            expect(data).assertTrue();
            done();
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4060 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `compressFile6 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag, `compressFile6 memLevel errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     *
     *
     *
     *
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4070
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4070
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4070', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4070 start==================");
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
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4070 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `compressFile7 strategy errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag, `compressFile7 strategy errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4080
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4080
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4080', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4080 start==================");
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
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4080 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `compressFile8 strategy errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag, `compressFile8 strategy errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4090
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4090
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4090', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4090 start==================");
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
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4090 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4090 compressFile9 strategy errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4090 compressFile9 strategy errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4100
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4100
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4100 start==================");
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
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4100 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `compressFile10 strategy errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag, `compressFile10 strategy errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4110
     * @tc.name       : SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4110
     * @tc.desc       : test gzsetparams correct return value
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4110', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================SUB_Bundlemanager_Bundle_Framework_GzipDecompressionAbilityTest_static_4110 start==================");
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
          } catch(error: BusinessError) {
            hilog.error(domain, tag, `GzipDecompressionAbilityTest_static_4110 accessSync failed with errCode:${error.code}  message:${error.message}`);
            expect().assertFail();
            done();
          }
        }).catch((errData: BusinessError): void => {
          hilog.error(domain, tag, `compressFile11 options errData is errCode:${errData.code}  message:${errData.message}`);
          expect().assertFail();
          done();
        })
      } catch (errData: BusinessError) {
        hilog.error(domain, tag,  `compressFile11 options errData is errCode:${errData.code}  message:${errData.message}`);
        expect().assertFail();
        done();
      }
    })

  })
}