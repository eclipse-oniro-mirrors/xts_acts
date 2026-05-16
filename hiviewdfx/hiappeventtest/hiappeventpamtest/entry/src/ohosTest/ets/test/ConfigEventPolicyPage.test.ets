import { hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';


export default function ConfigEventPolicyPage() {
  describe('ConfigEventPolicyPageSwitchLog', () => {
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
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_001
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_001
     * @tc.desc configEventPolicy接口测试-appCrashPolicy-pageSwitchLogEnable值为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_001 start");
      let policy: hiAppEvent.EventPolicy = {
        "appCrashPolicy":{
          "pageSwitchLogEnable": true
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_001 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_002
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_002
     * @tc.desc configEventPolicy接口测试-appFreezePolicy-pageSwitchLogEnable值为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_002 start");
      let policy: hiAppEvent.EventPolicy = {
        "appFreezePolicy":{
          "pageSwitchLogEnable": true
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_002 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_003
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_003
     * @tc.desc configEventPolicy接口测试-resourceOverlimitPolicy-pageSwitchLogEnable值为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_003 start");
      let policy: hiAppEvent.EventPolicy = {
        "resourceOverlimitPolicy":{
          "pageSwitchLogEnable": true
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_003 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_004
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_004
     * @tc.desc configEventPolicy接口测试-addressSanitizerPolicy-pageSwitchLogEnable值为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_004 start");
      let policy: hiAppEvent.EventPolicy = {
        "addressSanitizerPolicy":{
          "pageSwitchLogEnable": true
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_004 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_005
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_005
     * @tc.desc configEventPolicy接口测试-appCrashPolicy-pageSwitchLogEnable值为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_005 start");
      let policy: hiAppEvent.EventPolicy = {
        "appCrashPolicy":{
          "pageSwitchLogEnable": false
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_005 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_006
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_006
     * @tc.desc configEventPolicy接口测试-appFreezePolicy-pageSwitchLogEnable值为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_006 start");
      let policy: hiAppEvent.EventPolicy = {
        "appFreezePolicy":{
          "pageSwitchLogEnable": false
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_006 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_007
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_007
     * @tc.desc configEventPolicy接口测试-resourceOverlimitPolicy-pageSwitchLogEnable值为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_007 start");
      let policy: hiAppEvent.EventPolicy = {
        "resourceOverlimitPolicy":{
          "pageSwitchLogEnable": true
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_007 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_008
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_008
     * @tc.desc configEventPolicy接口测试-appCrashPolicy-pageSwitchLogEnable值为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_008 start");
      let policy: hiAppEvent.EventPolicy = {
        "addressSanitizerPolicy":{
          "pageSwitchLogEnable": false
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_008 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_009
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_009
     * @tc.desc configEventPolicy接口测试-appCrashPolicy-pageSwitchLogEnable值为undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_009 start");
      let policy: hiAppEvent.EventPolicy = {
        "appCrashPolicy":{
          "pageSwitchLogEnable": undefined
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(err.code == 401).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_009 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0010
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0010
     * @tc.desc configEventPolicy接口测试-appFreezePolicy-pageSwitchLogEnable值为undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0010 start");
      let policy: hiAppEvent.EventPolicy = {
        "appFreezePolicy":{
          "pageSwitchLogEnable": undefined
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(err.code == 401).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0010 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0011
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0011
     * @tc.desc configEventPolicy接口测试-resourceOverlimitPolicy-pageSwitchLogEnable值为undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0011 start");
      let policy: hiAppEvent.EventPolicy = {
        "resourceOverlimitPolicy":{
          "pageSwitchLogEnable": undefined
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(err.code == 401).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0011 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0012
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0012
     * @tc.desc configEventPolicy接口测试-resourceOverlimitPolicy-pageSwitchLogEnable值为undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0012 start");
      let policy: hiAppEvent.EventPolicy = {
        "addressSanitizerPolicy":{
          "pageSwitchLogEnable": undefined
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(err.code == 401).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0012 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0017
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0017
     * @tc.desc configEventPolicy接口测试-resourceOverlimitPolicy-设置多个参数为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0017 start");
      let policy: hiAppEvent.EventPolicy = {
        "appCrashPolicy":{
          "pageSwitchLogEnable": true
        },
        "appFreezePolicy":{
          "pageSwitchLogEnable": true
        },
        "resourceOverlimitPolicy":{
          "pageSwitchLogEnable": true
        },
        "addressSanitizerPolicy":{
          "pageSwitchLogEnable": true
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0017 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0018
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0018
     * @tc.desc configEventPolicy接口测试-resourceOverlimitPolicy-设置多个参数为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0018 start");
      let policy: hiAppEvent.EventPolicy = {
        "appCrashPolicy":{
          "pageSwitchLogEnable": false
        },
        "appFreezePolicy":{
          "pageSwitchLogEnable": false
        },
        "resourceOverlimitPolicy":{
          "pageSwitchLogEnable": false
        },
        "addressSanitizerPolicy":{
          "pageSwitchLogEnable": false
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0018 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0019
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0019
     * @tc.desc configEventPolicy接口测试-resourceOverlimitPolicy-设置多个参数为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0019 start");
      let policy: hiAppEvent.EventPolicy = {
        "appCrashPolicy":{
          "pageSwitchLogEnable": true
        },
        "appFreezePolicy":{
          "pageSwitchLogEnable": false
        },
        "resourceOverlimitPolicy":{
          "pageSwitchLogEnable": false
        },
        "addressSanitizerPolicy":{
          "pageSwitchLogEnable": false
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0019 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0020
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0020
     * @tc.desc configEventPolicy接口测试-resourceOverlimitPolicy-设置多个参数为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0020 start");
      let policy: hiAppEvent.EventPolicy = {
        "appCrashPolicy":{
          "pageSwitchLogEnable": true
        },
        "appFreezePolicy":{
          "pageSwitchLogEnable": false
        },
        "resourceOverlimitPolicy":{
          "pageSwitchLogEnable": true
        },
        "addressSanitizerPolicy":{
          "pageSwitchLogEnable": false
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0020 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0021
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0021
     * @tc.desc configEventPolicy接口测试-resourceOverlimitPolicy-设置多个参数为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0021 start");
      let policy: hiAppEvent.EventPolicy = {
        "appCrashPolicy":{
          "pageSwitchLogEnable": true
        },
        "appFreezePolicy":{
          "pageSwitchLogEnable": undefined
        },
        "resourceOverlimitPolicy":{
          "pageSwitchLogEnable": undefined
        },
        "addressSanitizerPolicy":{
          "pageSwitchLogEnable": undefined
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(err.code == 401).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0021 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0022
     * @tc.name SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0022
     * @tc.desc configEventPolicy接口测试-resourceOverlimitPolicy-设置多个参数为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0022 start");
      let policy: hiAppEvent.EventPolicy = {
        "appCrashPolicy":{
          "pageSwitchLogEnable": true
        },
        "appFreezePolicy":{
          "pageSwitchLogEnable": true
        },
        "resourceOverlimitPolicy":{
          "pageSwitchLogEnable": true
        },
        "addressSanitizerPolicy":{
          "pageSwitchLogEnable": true
        }
      };
      for (let i = 0; i < 100; i++) {
        hiAppEvent.configEventPolicy(policy).then(() => {
          hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
          expect(false).assertEqual(true);
          done();
        });
      }
      console.info("====> SUB_DFX_DFT_HIPPEVENT_PageSwitchLog_0022 end");
    });
    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_mainThreadJankPolicy_0023
     * @tc.name SUB_DFX_DFT_HIPPEVENT_mainThreadJankPolicy_0023
     * @tc.desc configEventPolicy接口测试-mainThreadJankPolicy-设置autoStopSampling参数为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SUB_DFX_DFT_HIPPEVENT_mainThreadJankPolicy_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_mainThreadJankPolicy_0023 start");
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy":{
          "autoStopSampling": true
        },
        "appFreezePolicy":{
          "pageSwitchLogEnable": true
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(err.code == 401).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_mainThreadJankPolicy_0023 end");
    });
  })
}