import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import securityGuard from '@ohos.security.securityGuard';
const callback = (event :securityGuard.SecurityEvent) => {
  console.info("eventId = " + event.eventId);
  console.info("version = " + event.version);
  console.info("content = " + event.content);
}

export default function SecurityGuardPermissionTest() {
  describe('SecurityGuardPermissionTest', () => {
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
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0103
     * @tc.name test reportSecurityEvent
     * @tc.desc No permission expected 201.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0103', 0, async (done: Function) => {
      try {
        let result: void;
        let securityEvent: securityGuard.SecurityEvent = {
          eventId: 1011015001,
          version: '1.0',
          content: '{"aaa": "111"}',
          timestamp: '20240530110000'
        }
        result = securityGuard.reportSecurityEvent(securityEvent);
        console.info( 'SUB_Security_SecurityGuard_JsApi_Func_0103 errcode = ', result);
        expect(null).assertFail();
      } catch (err) {
        console.error('SGTestTag', 'SUB_Security_SecurityGuard_JsApi_Func_0103 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(201)
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0203
     * @tc.name test querySecurityEvent
     * @tc.desc No permission expected 201.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0203', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0203 start');
      try {
        let rule: securityGuard.SecurityEventRule = {
          eventId: 1011015001
        }
        let querier: securityGuard.Querier = {
          onQuery(events: Array<securityGuard.SecurityEvent>) {
            console.info('SGTestTag', 'Func_Security_SecurityGuard_JsApi_Func_0200 %{public}s', 'onQuery success');
            let event : securityGuard.SecurityEvent;
            for (event of events) {
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0203 event.eventId %{public}s', event.eventId);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0203 event.version %{public}s', event.version);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0203 event.content %{public}s', event.content);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0203 event.timestamp %{public}s', event.timestamp);
            }
          },
          onComplete() {
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0203 onComplete success');
          },
          onError(message: string) {
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0203 onError success');
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0203 error is %{public}s', message);
          }
        }
        securityGuard.querySecurityEvent([rule], querier);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0203 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(201)
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0302
     * @tc.name test startSecurityEventCollector
     * @tc.desc No permission expected 201.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0302', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0302 start');
      try {
        let rule: securityGuard.CollectorRule = {
          eventId: 1037000001,
          param: ''
        }
        securityGuard.startSecurityEventCollector(rule);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0302 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(201);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0402
     * @tc.name test stopSecurityEventCollector
     * @tc.desc No permission expected 201.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0402', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0402 start');
      try {
        let rule: securityGuard.CollectorRule = {
          eventId: 1037000001,
          param: ''
        }
        securityGuard.stopSecurityEventCollector(rule);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0402 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(201);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0502
     * @tc.name test getModelResult
     * @tc.desc No permission expected 201.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0502', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0502 start');
      try {
        let rule: securityGuard.ModelRule = {
          modelName: 'SecurityGuard_JailbreakCheck'
        }
        let result: securityGuard.ModelResult;
        result = await securityGuard.getModelResult(rule);
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0502 result.result =  ' + result.result);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0502 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(201);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0604
     * @tc.name test on
     * @tc.desc No permission expected 201.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0604', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0604 start');
      let auditEventInfo : securityGuard.SecurityEventInfo = {
        eventId: 1011015001
      }

      try {
        await securityGuard.on('securityEventOccur', auditEventInfo, callback);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0604 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(201);
      }
      done();
    });

  })
}