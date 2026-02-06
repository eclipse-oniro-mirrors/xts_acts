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

let domain: int = 0xA8A8; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'configEventPolicyTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function configEventPolicyTest() {
  describe('configEventPolicyTest', (): void => {
    hilog.info(domain, tag, 'describe start');

    /**
     * @tc.name   testHiAppEventconfigEventPolicy001
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventconfigEventPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy001 start`);
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy":{
          "logType": 1,
          "sampleInterval": 100,
          "ignoreStartupTime": 11,
          "sampleCount": 21,
          "reportTimesPerApp": 3,
          "autoStopSampling": true
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy001 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `testHiAppEventconfigEventPolicy001 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy001 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy002
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-policy为空调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy002 start`);
      let policy: hiAppEvent.EventPolicy = {};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy002 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `testHiAppEventconfigEventPolicy002 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy002 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy003
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-EventPolicy参数为空调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy003 start`);
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy":{}
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy003 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `testHiAppEventconfigEventPolicy003 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy003 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy004
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-存在多个policy调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy004 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 0,
        },
        'cpuUsageHighPolicy': {
          "foregroundLoadThreshold": 11,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy004 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `testHiAppEventconfigEventPolicy004 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy004 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy005
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-logType范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy005 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 100,
        },
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy005 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy005 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy005 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy006
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-sampleIntervale范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy006 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "sampleInterval": 501,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy006 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy006 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy006 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy007
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-ignoreStartupTime范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy007 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "ignoreStartupTime": 2,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy007 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy007 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy007 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy008
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-ignoreStartupTime范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy008 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "sampleCount": 0,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy008 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy008 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy008 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy009
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-reportTimesPerApp范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy009 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "reportTimesPerApp": 4,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy009 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy009 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy009 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy010
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1900
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-多个policy的范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy010 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 3,
        },
        'cpuUsageHighPolicy': {
          "foregroundLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy010 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy010 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy010 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy011
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- CPU_USAGE_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy011 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "foregroundLoadThreshold": 11,
          "backgroundLoadThreshold": 22,
          "threadLoadThreshold": 33,
          "perfLogCaptureCount": 44,
          "threadLoadInterval": 55,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy011 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy011 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy011 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy012
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- foregroundLoadThreshold范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy012 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "foregroundLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy012 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy012 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy012 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy013
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- backgroundLoadThreshold范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy013 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "backgroundLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy013 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy013 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy013 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy014
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- threadLoadThreshold范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy014 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "threadLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy014 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy014 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy014 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy015
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- perfLogCaptureCount范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy015 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "perfLogCaptureCount": -2,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy015 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy015 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy015 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy016
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- threadLoadInterval范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy016 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "threadLoadInterval": 3601,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy016 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy016 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy016 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy017
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- foregroundLoadThreshold为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy017 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy017 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy017 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy017 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy018
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-cpuUsageHighPolicy- 传入undefied调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy018 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": undefined
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy018 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy018 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy018 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy019
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- 传入undefied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy019 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "threadLoadInterval": undefined
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy019 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy019 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy019 end`);
    })

  })
  hilog.info(domain, tag, 'configureTest end');
}