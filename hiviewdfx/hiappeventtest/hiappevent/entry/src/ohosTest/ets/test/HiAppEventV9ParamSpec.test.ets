import { BusinessError } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { hiAppEvent } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, Level } from '@ohos/hypium'

function generateLongString(length: number): string {
  let str: string = '';
  for (let i: number = 0; i < length; i++) {
    str += 'a';
  }
  return str;
}

let domain: number = 0x0000;
let tag: string = 'HiAppEventParamSpec';

export default function HiAppEventV9ParamSpecTest() {
  describe('HiAppEventV9ParamSpecTest', () => {

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_9100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_9100
     * @tc.desc   Test setEventParam interface with param name exceeding maximum length (32 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_9100', Level.LEVEL0, async (done: Function) => {
      let longParamName: string = generateLongString(33);
      let params: Record<string, string> = {};
      params[longParamName] = 'test_value';
      hiAppEvent.setEventParam(params, 'test_domain', 'test_event1').then(() => {
        hilog.info(domain, tag, 'setEventParam succeeded but param may be discarded');
        done();
      }).catch((err: BusinessError) => {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 11101005).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_9200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_9200
     * @tc.desc   Test setEventParam interface with param name at boundary length (32 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_9200', Level.LEVEL2, async (done: Function) => {
      let boundaryParamName: string = generateLongString(32);
      let params: Record<string, string> = {};
      params[boundaryParamName] = 'test_value';
      hiAppEvent.setEventParam(params, 'test_domain', 'test_event2').then(() => {
        hilog.info(domain, tag, 'setEventParam succeeded with boundary param name');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(domain, tag, `Unexpected error: code=${err.code}`);
        expect(false).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_9100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_9100
     * @tc.desc   Test setEventParam interface with param value exceeding maximum length (1024 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_9100', Level.LEVEL3, async (done: Function) => {
      let longParamValue: string = generateLongString(1025);
      let params: Record<string, string> = { "key": longParamValue };
      hiAppEvent.setEventParam(params, 'test_domain', 'test_event3').then(() => {
        hilog.info(domain, tag, 'setEventParam succeeded but value may be truncated');
        done();
      }).catch((err: BusinessError) => {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 11101004).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_9200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_9200
     * @tc.desc   Test setEventParam interface with param value at boundary length (1024 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_9200', Level.LEVEL2, async (done: Function) => {
      let boundaryParamValue: string = generateLongString(1024);
      let params: Record<string, string> = { "key": boundaryParamValue };
      hiAppEvent.setEventParam(params, 'test_domain', 'test_event4').then(() => {
        hilog.info(domain, tag, 'setEventParam succeeded with boundary param value');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(domain, tag, `Unexpected error: code=${err.code}`);
        expect(false).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_9100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_9100
     * @tc.desc   Test setEventParam interface with param count exceeding maximum (64 parameters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_9100', Level.LEVEL3, async (done: Function) => {
      let params: Record<string, number> = {};
      for (let i: number = 0; i < 65; i++) {
        params[`key${i}`] = i;
      }
      hiAppEvent.setEventParam(params, 'test_domain', 'test_event5').then(() => {
        hilog.info(domain, tag, 'setEventParam succeeded but extra params may be discarded');
        done();
      }).catch((err: BusinessError) => {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 11101007).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_9200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_9200
     * @tc.desc   Test setEventParam interface with param count at boundary (64 parameters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_9200', Level.LEVEL2, async (done: Function) => {
      let params: Record<string, number> = {};
      for (let i: number = 0; i < 64; i++) {
        params[`key${i}`] = i;
      }
      hiAppEvent.setEventParam(params, 'test_domain', 'test_event6').then(() => {
        hilog.info(domain, tag, 'setEventParam succeeded with boundary param count');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(domain, tag, `Unexpected error1111: code=${err.code}`);
        expect(false).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdName_Length_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdName_Length_0100
     * @tc.desc   Test setUserId interface with name exceeding maximum length (256 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdName_Length_0100', Level.LEVEL3, async (done: Function) => {
      let longUserIdName: string = generateLongString(257);
      try {
        hiAppEvent.setUserId(longUserIdName, 'test_value');
        hilog.error(domain, tag, 'Should throw error for long userId name');
        done();
      } catch (err) {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdName_Length_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdName_Length_0200
     * @tc.desc   Test setUserId interface with name at boundary length (256 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdName_Length_0200', Level.LEVEL2, async (done: Function) => {
      let boundaryUserIdName: string = generateLongString(256);
      try {
        hiAppEvent.setUserId(boundaryUserIdName, 'test_value');
        hilog.info(domain, tag, 'setUserId succeeded with boundary name length');
        done();
      } catch (err) {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdValue_Length_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdValue_Length_0100
     * @tc.desc   Test setUserId interface with value exceeding maximum length (256 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdValue_Length_0100', Level.LEVEL3, async (done: Function) => {
      let longUserIdValue: string = generateLongString(257);
      try {
        hiAppEvent.setUserId('test_key', longUserIdValue);
        hilog.error(domain, tag, 'Should throw error for long userId value');
        done();
      } catch (err) {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdValue_Length_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdValue_Length_0200
     * @tc.desc   Test setUserId interface with value at boundary length (256 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_UserIdValue_Length_0200', Level.LEVEL2, async (done: Function) => {
      let boundaryUserIdValue: string = generateLongString(256);
      try {
        hiAppEvent.setUserId('test_key', boundaryUserIdValue);
        hilog.info(domain, tag, 'setUserId succeeded with boundary value length');
        done();
      } catch (error) {
        hilog.info(domain, tag, `Expected error: code=${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserIdName_Length_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserIdName_Length_0100
     * @tc.desc   Test getUserId interface with name exceeding maximum length (256 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserIdName_Length_0100', Level.LEVEL3, async (done: Function) => {
      let longUserIdName: string = generateLongString(257);
      try {
        let userId: string = hiAppEvent.getUserId(longUserIdName);
        hilog.error(domain, tag, 'Should throw error for long userId name');

        done();
      } catch (err) {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserIdName_Length_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserIdName_Length_0200
     * @tc.desc   Test getUserId interface with name at boundary length (256 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserIdName_Length_0200', Level.LEVEL2, async (done: Function) => {
      let boundaryUserIdName: string = generateLongString(256);
      hiAppEvent.setUserId(boundaryUserIdName, 'test_value');
      try {
        let userId: string = hiAppEvent.getUserId(boundaryUserIdName);
        hilog.info(domain, tag, `getUserId succeeded, userId=${userId}`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `Unexpected error: code=${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyName_Length_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyName_Length_0100
     * @tc.desc   Test setUserProperty interface with name exceeding maximum length (256 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyName_Length_0100', Level.LEVEL3, async (done: Function) => {
      let longPropertyName: string = generateLongString(257);
      try {
        hiAppEvent.setUserProperty(longPropertyName, 'test_value');
        hilog.error(domain, tag, 'Should throw error for long property name');

        done();
      } catch (err) {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyName_Length_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyName_Length_0200
     * @tc.desc   Test setUserProperty interface with name at boundary length (256 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyName_Length_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let boundaryPropertyName: string = generateLongString(256);
        hiAppEvent.setUserProperty(boundaryPropertyName, 'test_value');
        hilog.info(domain, tag, 'setUserProperty succeeded with boundary name length');
        done();
      } catch (error) {
        hilog.info(domain, tag, `Expected error: code=${error.code}`);
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyValue_Length_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyValue_Length_0100
     * @tc.desc   Test setUserProperty interface with value exceeding maximum length (1024 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyValue_Length_0100', Level.LEVEL3, async (done: Function) => {
      let longPropertyValue: string = generateLongString(1025);
      try {
        hiAppEvent.setUserProperty('test_key', longPropertyValue);
        hilog.error(domain, tag, 'Should throw error for long property value');

        done();
      } catch (err) {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyValue_Length_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyValue_Length_0200
     * @tc.desc   Test setUserProperty interface with value at boundary length (1024 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_UserPropertyValue_Length_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let boundaryPropertyValue: string = generateLongString(1024);
        hiAppEvent.setUserProperty('test_key', boundaryPropertyValue);
        hilog.info(domain, tag, 'setUserProperty succeeded with boundary value length');
        done();
      } catch (err) {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserPropertyName_Length_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserPropertyName_Length_0100
     * @tc.desc   Test getUserProperty interface with name exceeding maximum length (256 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserPropertyName_Length_0100', Level.LEVEL3, async (done: Function) => {
      let longPropertyName: string = generateLongString(257);
      try {
        let property: string = hiAppEvent.getUserProperty(longPropertyName);
        hilog.error(domain, tag, 'Should throw error for long property name');

        done();
      } catch (err) {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserPropertyName_Length_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserPropertyName_Length_0200
     * @tc.desc   Test getUserProperty interface with name at boundary length (256 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_GetUserPropertyName_Length_0200', Level.LEVEL2, async (done: Function) => {
      let boundaryPropertyName: string = generateLongString(256);
      hiAppEvent.setUserProperty(boundaryPropertyName, 'test_value');
      try {
        let property: string = hiAppEvent.getUserProperty(boundaryPropertyName);
        hilog.info(domain, tag, `getUserProperty succeeded, property=${property}`);

        done();
      } catch (error) {
        hilog.error(domain, tag, `Unexpected error: code=${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0100
     * @tc.desc   Test setEventConfig interface with config param name exceeding maximum length (1024 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0100', Level.LEVEL3, async (done: Function) => {
      let longConfigName: string = generateLongString(1025);
      let config: Record<string, string> = {};
      config[longConfigName] = 'test_value';
      hiAppEvent.setEventConfig('APP_CRASH', config).then(() => {
        hilog.info(domain, tag, 'setEventConfig succeeded but config may be discarded');
        done();
      }).catch((err: BusinessError) => {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0200
     * @tc.desc   Test setEventConfig interface with config param name at boundary length (1024 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0200', Level.LEVEL2, async (done: Function) => {
      let boundaryConfigName: string = generateLongString(1024);
      let config: Record<string, boolean|string> = {};
      config[boundaryConfigName] = 'test_value';
      config['extend_pc_lr_printing'] = true;
      hiAppEvent.setEventConfig('APP_CRASH', config).then(() => {
        hilog.info(domain, tag, 'setEventConfig succeeded with boundary config name');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(domain, tag, `Unexpected error22: code=${err.code}`);
        expect(false).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0300
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0300
     * @tc.desc   Test setEventConfig interface with config param name exceeding maximum length (1024 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0300', Level.LEVEL3, async (done: Function) => {
      let longConfigValue: string = generateLongString(1025);
      let config: Record<string, string> = {};
      config['APP_CRASH'] = longConfigValue;
      hiAppEvent.setEventConfig('APP_CRASH', config).then(() => {
        hilog.info(domain, tag, 'setEventConfig succeeded but config may be discarded');
        done();
      }).catch((err: BusinessError) => {
        hilog.info(domain, tag, `Expected error: code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0400
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0400
     * @tc.desc   Test setEventConfig interface with config param name at boundary length (1024 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ConfigName_Length_0400', Level.LEVEL2, async (done: Function) => {
      let boundaryConfigValue: string = generateLongString(1024);
      let config: Record<string, boolean|string> = {};
      config['APP_CRASH'] = boundaryConfigValue;
      config['extend_pc_lr_printing'] = true;
      hiAppEvent.setEventConfig('APP_CRASH', config).then(() => {
        hilog.info(domain, tag, 'setEventConfig succeeded with boundary config name');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(domain, tag, `Unexpected error22: code=${err.code}`);
        expect(false).assertTrue();
        done();
      });
    })

  })
}