/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'
import fs from '@ohos.file.fs';
import Utils from './Util.test';
let logDomain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'addProcessorTestFromConfigTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function addProcessorTestFromConfigTest() {
  describe('addProcessorTestFromConfigTest', (): void => {
    hilog.info(logDomain, tag, 'describe start');

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Static_Js_3000
     * @tc.number SUB_DFX_DFT_HiAppEvent_Static_Js_3000
     * @tc.desc   验证addProcessorFromConfig入参name正常，返回对应代理id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Static_Js_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'SUB_DFX_DFT_HiAppEvent_Static_Js_3000 start');
      const targetPath = '/system/etc/hiappevent/processor.json';
      let fileExists = fs.accessSync(targetPath);
      if (fileExists) {
        hilog.info(logDomain, tag, 'file exists,run testcase');
        hiAppEvent.addProcessorFromConfig("ha_app_event").then((processorId) => {
            expect(processorId > 0).assertTrue();
            done();
          }).catch((err: Error) => {
            expect(false).assertTrue();
            done();
          });
      }else {
        hilog.info(logDomain, tag, 'file not exists,skip testcase');
        done();
      }
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Static_Js_3001
     * @tc.number SUB_DFX_DFT_HiAppEvent_Static_Js_3001
     * @tc.desc   验证addProcessorFromConfig入参name正常，返回对应代理id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DFX_DFT_HiAppEvent_Static_Js_3001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'SUB_DFX_DFT_HiAppEvent_Static_Js_3001 start');
      const targetPath = '/system/etc/hiappevent/processor.json';
      let fileExists = fs.accessSync(targetPath);
      if (fileExists) {
        hilog.info(logDomain, tag, 'file exists,run testcase');
        hiAppEvent.addProcessorFromConfig("ha_app_event", "SDK_OCG").then((processorId) => {
          expect(processorId > 0).assertTrue();
          done();
        }).catch((err: Error) => {
          expect(false).assertTrue();
          done();
        });
      }else {
        hilog.info(logDomain, tag, 'file not exists,skip testcase');
        done();
      }
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Static_Js_3002
     * @tc.number SUB_DFX_DFT_HiAppEvent_Static_Js_3002
     * @tc.desc   验证addProcessorFromConfig入参configName为异常字符串，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_HiAppEvent_Static_Js_3002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'SUB_DFX_DFT_HiAppEvent_Static_Js_3002 start');
      hiAppEvent.addProcessorFromConfig("ha_app_event", "undefined").then((processorId) => {
        expect(processorId > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        const bErr = err as BusinessError;
        hilog.error(logDomain, tag, `SUB_DFX_DFT_HiAppEvent_Static_Js_3002 > error code: ${bErr.code}, error msg: ${bErr.message}`);
        expect(bErr.code == 11105001).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Static_Js_3003
     * @tc.number SUB_DFX_DFT_HiAppEvent_Static_Js_3003
     * @tc.desc   验证addProcessorFromConfig入参configName为空常字符串，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_HiAppEvent_Static_Js_3003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'SUB_DFX_DFT_HiAppEvent_Static_Js_3003 start');
      hiAppEvent.addProcessorFromConfig("ha_app_event", "").then((processorId) => {
        expect(processorId > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        const bErr = err as BusinessError;
        hilog.error(logDomain, tag, `SUB_DFX_DFT_HiAppEvent_Static_Js_3003 > error code: ${bErr.code}, error msg: ${bErr.message}`);
        expect(bErr.code == 11105001).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Static_Js_3005
     * @tc.number SUB_DFX_DFT_HiAppEvent_Static_Js_3005
     * @tc.desc   验证addProcessorFromConfig入参configName为数字，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_HiAppEvent_Static_Js_3005', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'SUB_DFX_DFT_HiAppEvent_Static_Js_3005 start');
      hiAppEvent.addProcessorFromConfig("ha_app_event", "123_SDG").then((processorId) => {
        expect(processorId > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        const bErr = err as BusinessError;
        hilog.error(logDomain, tag, `SUB_DFX_DFT_HiAppEvent_Static_Js_3005 > error code: ${bErr.code}, error msg: ${bErr.message}`);
        expect(bErr.code == 11105001).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Static_Js_3006
     * @tc.number SUB_DFX_DFT_HiAppEvent_Static_Js_3006
     * @tc.desc   验证addProcessorFromConfig入参configName为257字节，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_HiAppEvent_Static_Js_3006', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'SUB_DFX_DFT_HiAppEvent_Static_Js_3006 start');
      let configName = 'a'.repeat(256 +1);
      hiAppEvent.addProcessorFromConfig("ha_app_event", configName).then((processorId) => {
        expect(processorId > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        const bErr = err as BusinessError;
        hilog.error(logDomain, tag, `SUB_DFX_DFT_HiAppEvent_Static_Js_3006 > error code: ${bErr.code}, error msg: ${bErr.message}`);
        expect(bErr.code == 11105001).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Static_Js_3007
     * @tc.number SUB_DFX_DFT_HiAppEvent_Static_Js_3007
     * @tc.desc   验证addProcessorFromConfig入参name为异常字符串，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_HiAppEvent_Static_Js_3007', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'SUB_DFX_DFT_HiAppEvent_Static_Js_3007 start');
      hiAppEvent.addProcessorFromConfig("undefined").then((processorId) => {
        expect(processorId > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        const bErr = err as BusinessError;
        hilog.error(logDomain, tag, `SUB_DFX_DFT_HiAppEvent_Static_Js_3007 > error code: ${bErr.code}, error msg: ${bErr.message}`);
        expect(bErr.code == 11105001).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Static_Js_3008
     * @tc.number SUB_DFX_DFT_HiAppEvent_Static_Js_3008
     * @tc.desc   验证addProcessorFromConfig入参name为空字符串，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_HiAppEvent_Static_Js_3008', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'SUB_DFX_DFT_HiAppEvent_Static_Js_3008 start');
      hiAppEvent.addProcessorFromConfig("").then((processorId) => {
        expect(processorId > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        const bErr = err as BusinessError;
        hilog.error(logDomain, tag, `SUB_DFX_DFT_HiAppEvent_Static_Js_3008 > error code: ${bErr.code}, error msg: ${bErr.message}`);
        expect(bErr.code == 11105001).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Static_Js_3010
     * @tc.number SUB_DFX_DFT_HiAppEvent_Static_Js_3010
     * @tc.desc   验证addProcessorFromConfig入参name为数字，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_HiAppEvent_Static_Js_3010', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'SUB_DFX_DFT_HiAppEvent_Static_Js_3010 start');
      hiAppEvent.addProcessorFromConfig("123_processor").then((processorId) => {
        expect(processorId > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        const bErr = err as BusinessError;
        hilog.error(logDomain, tag, `SUB_DFX_DFT_HiAppEvent_Static_Js_3010 > error code: ${bErr.code}, error msg: ${bErr.message}`);
        expect(bErr.code == 11105001).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Static_Js_3011
     * @tc.number SUB_DFX_DFT_HiAppEvent_Static_Js_3011
     * @tc.desc   验证addProcessorFromConfig入参name为257字节，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_HiAppEvent_Static_Js_3011', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'SUB_DFX_DFT_HiAppEvent_Static_Js_3011 start');
      let processorName = 'a'.repeat(256 +1);
      hiAppEvent.addProcessorFromConfig(processorName).then((processorId) => {
        expect(processorId > 0).assertTrue();
        done();
      }).catch((err: Error) => {
        const bErr = err as BusinessError;
        hilog.error(logDomain, tag, `SUB_DFX_DFT_HiAppEvent_Static_Js_3011 > error code: ${bErr.code}, error msg: ${bErr.message}`);
        expect(bErr.code == 11105001).assertTrue();
        done();
      });
    });

  })
  hilog.info(logDomain, tag, 'addProcessorTestFromConfigTest end');
}