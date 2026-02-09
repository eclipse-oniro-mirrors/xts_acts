import { hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';


export default function HiAppEventconfigEventPolicy() {
  describe('HiAppEventconfigEventPolicy', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy001
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_1000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventconfigEventPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy001 start`);
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
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy001 configEventPolicy call successful`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy001 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy001 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy002
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_1100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-policy为空调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy002 start`);
      let policy: hiAppEvent.EventPolicy = {};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy002 configEventPolicy call successful`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy002 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy002 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy003
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_1200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-EventPolicy参数为空调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy003 start`);
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy":{}
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy003 configEventPolicy call successful`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy003 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy003 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy004
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_1300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-存在多个policy调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy004 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 0,
        },
        'cpuUsageHighPolicy': {
          "foregroundLoadThreshold": 11,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy004 configEventPolicy call successful`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy004 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy004 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy005
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_1400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-logType范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy005 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 100,
        },
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy005 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy005 configEventPolicy call fail`);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy005 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy006
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_1500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-sampleIntervale范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy006 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "sampleInterval": 501,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy006 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy006 configEventPolicy call fail`);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy006 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy007
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_1600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-ignoreStartupTime范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy007 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "ignoreStartupTime": 2,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy007 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy007 configEventPolicy call fail`);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy007 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy008
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_1700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-ignoreStartupTime范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy008 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "sampleCount": 0,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy008 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy008 configEventPolicy call fail`);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy008 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy009
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_1800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-reportTimesPerApp范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy009 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "reportTimesPerApp": 4,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy009 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy009 configEventPolicy call fail`);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy009 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy010
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_1900
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-多个policy的范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy010 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 3,
        },
        'cpuUsageHighPolicy': {
          "foregroundLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy010 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy010 configEventPolicy call fail`);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy010 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy011
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_2000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- CPU_USAGE_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy011 start`);
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
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy011 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy011 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy011 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy012
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_2100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- foregroundLoadThreshold范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy012 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "foregroundLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy012 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy012 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy012 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy013
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_2200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- backgroundLoadThreshold范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy013 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "backgroundLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy013 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy013 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy013 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy014
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_2300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- threadLoadThreshold范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy014 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "threadLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy014 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy014 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy014 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy015
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_2400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- perfLogCaptureCount范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy015 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "perfLogCaptureCount": -2,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy015 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy015 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy015 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy016
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_2500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- threadLoadInterval范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy016 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "threadLoadInterval": 3601,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy016 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy016 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy016 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy017
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_2600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- foregroundLoadThreshold为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy017 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy017 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy017 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy017 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy018
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_2700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-cpuUsageHighPolicy- 传入undefied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy018 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": undefined
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy018 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy018 Code: ${err?.code}, message: ${err?.message}`);
        expect(err.code == 401).assertEqual(true);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy018 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy019
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_2800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- 传入undefied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy019 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "threadLoadInterval": undefined
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy019 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy019 Code: ${err?.code}, message: ${err?.message}`);
        expect(err.code == 401).assertEqual(true);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy019 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy020
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_configEventPolicy_2900
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- 传入null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy020 start`);
      hiAppEvent.configEventPolicy(null).then(() => {
        hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy020 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy020 Code: ${err?.code}, message: ${err?.message}`);
        expect(err.code == 401).assertEqual(true);
        done();
      });
      hilog.info(0xA8A8, 'hiAppEvent', `testHiAppEventconfigEventPolicy020 end`);
    })
})
}