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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import securityGuard from '@ohos.security.securityGuard';
const callback = (event :securityGuard.SecurityEvent) => {
  console.info("eventId = " + event.eventId);
  console.info("version = " + event.version);
  console.info("content = " + event.content);
}
export default function SecurityGuardFunctionTest() {
  describe('SecurityGuardFunctionTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0100
     * @tc.name test reportSecurityEvent
     * @tc.desc A normal response is expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0100', 0, async (done: Function) => {
      try {
        let result: void;
        let securityEvent: securityGuard.SecurityEvent = {
          eventId: 1011015001,
          version: '1.0',
          content: '{"aaa": "111"}',
          timestamp: '20240530110000'
        }
        result = securityGuard.reportSecurityEvent(securityEvent);
        console.info( 'SUB_Security_SecurityGuard_JsApi_Func_0100 errcode = ', result);
        // expect(result).assertEqual(0)
      } catch (err) {
        console.error('SGTestTag', 'SUB_Security_SecurityGuard_JsApi_Func_0100 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0101
     * @tc.name test reportSecurityEvent
     * @tc.desc Version passes in extra large characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0101', 0, async (done: Function) => {
      try {
        let srcStr : string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        let superLargeRandomStr : string = "";
        for (let i = 0; i < 100000; i++) {
          superLargeRandomStr += srcStr.charAt(Math.floor(Math.random() * srcStr.length));
        }
        let securityEvent: securityGuard.SecurityEvent = {
          eventId: 1011015001,
          version: superLargeRandomStr,
          content: '{"aaa": "111"}',
          timestamp: '20240530110000'
        }
        securityGuard.reportSecurityEvent(securityEvent);
        expect(null).assertFail();
      } catch (err) {
        console.error('SGTestTag', 'SUB_Security_SecurityGuard_JsApi_Func_0101 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0102
     * @tc.name test reportSecurityEvent
     * @tc.desc securityEvent is null expected 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0102', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0102 start');
      try {
        securityGuard.reportSecurityEvent(null);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0102 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0200
     * @tc.name test querySecurityEvent
     * @tc.desc A normal response is expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0200', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0200 start');
      try {
        let rule: securityGuard.SecurityEventRule = {
          eventId: 1011015001
        }
        let querier: securityGuard.Querier = {
          onQuery(events: Array<securityGuard.SecurityEvent>) {
            console.info('SGTestTag', 'Func_Security_SecurityGuard_JsApi_Func_0200 %{public}s', 'onQuery success');
            let event : securityGuard.SecurityEvent;
            for (event of events) {
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0200 event.eventId %{public}s', event.eventId);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0200 event.version %{public}s', event.version);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0200 event.content %{public}s', event.content);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0200 event.timestamp %{public}s', event.timestamp);
            }
          },
          onComplete() {
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0200 onComplete success');
          },
          onError(message: string) {
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0200 onError success');
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0200 error is %{public}s', message);
          }
        }
        securityGuard.querySecurityEvent([rule], querier);
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0200 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0201
     * @tc.name test querySecurityEvent
     * @tc.desc rules is null expected 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0201', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0201 start');
      try {
        let rule: securityGuard.SecurityEventRule = {
          eventId: 1011015001
        }
        let querier: securityGuard.Querier = {
          onQuery(events: Array<securityGuard.SecurityEvent>) {
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0201 onQuery success');
            let event : securityGuard.SecurityEvent;
            for (event of events) {
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0201 event.eventId %{public}s', event.eventId);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0201 event.version %{public}s', event.version);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0201 event.content %{public}s', event.content);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0201 event.timestamp %{public}s', event.timestamp);
            }
          },
          onComplete() {
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0201 onComplete success');
          },
          onError(message: string) {
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0201 onError success');
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0201 error is %{public}s', message);
          }
        }
        securityGuard.querySecurityEvent(null, querier);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0201 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0202
     * @tc.name test querySecurityEvent
     * @tc.desc querier is null expected 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0202', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0202 start');
      try {
        let rule: securityGuard.SecurityEventRule = {
          eventId: 1011015001
        }
        let querier: securityGuard.Querier = {
          onQuery(events: Array<securityGuard.SecurityEvent>) {
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0202 onQuery success');
            let event : securityGuard.SecurityEvent;
            for (event of events) {
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0202 event.eventId %{public}s', event.eventId);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0202 event.version %{public}s', event.version);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0202 event.content %{public}s', event.content);
              console.info('SUB_Security_SecurityGuard_JsApi_Func_0202 event.timestamp %{public}s', event.timestamp);
            }
          },
          onComplete() {
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0202 onComplete success');
          },
          onError(message: string) {
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0202 onError success');
            console.info('SUB_Security_SecurityGuard_JsApi_Func_0202 error is %{public}s', message);
          }
        }
        securityGuard.querySecurityEvent([rule], null);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0202 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0301
     * @tc.name test startSecurityEventCollector
     * @tc.desc rule is null expected 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0301', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0301 start');
      try {
        let rule: securityGuard.CollectorRule = {
          eventId: 1037000001,
          param: ''
        }
        securityGuard.startSecurityEventCollector(null);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0301 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0401
     * @tc.name test stopSecurityEventCollector
     * @tc.desc rule is null expected 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0401', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0401 start');
      try {
        let rule: securityGuard.CollectorRule = {
          eventId: 1037000001,
          param: ''
        }
        securityGuard.startSecurityEventCollector(null);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0401 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0500
     * @tc.name test getModelResult
     * @tc.desc A normal response is expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0500', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0500 start');
      try {
        let rule: securityGuard.ModelRule = {
          modelName: 'SecurityGuard_JailbreakCheck'
        }
        let result: securityGuard.ModelResult;
        result = await securityGuard.getModelResult(rule);
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0500 result.result =  ' + result.result);
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0500 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0501
     * @tc.name test getModelResult
     * @tc.desc rule is null expected 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0501', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0501 start');
      try {
        let rule: securityGuard.ModelRule = {
          modelName: 'SecurityGuard_JailbreakCheck'
        }
        let result: securityGuard.ModelResult;
        result = await securityGuard.getModelResult(null);
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0501 result.result =  ' + result.result);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0501 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0504
     * @tc.name test getModelResult
     * @tc.desc rule.modelName is error expected 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0503', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0503 start');
      try {
        let rule: securityGuard.ModelRule = {
          modelName: 'xxx'
        }
        let result: securityGuard.ModelResult;
        result = await securityGuard.getModelResult(rule);
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0503 result.result =  ' + result.result);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0503 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0600
     * @tc.name test on/off
     * @tc.desc A normal response is expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0600', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0600 start');
      let auditEventInfo : securityGuard.SecurityEventInfo = {
        eventId: 1011015001
      }

      try {
        await securityGuard.on('securityEventOccur', auditEventInfo, callback);
        await sleep(8000);
        await securityGuard.off('securityEventOccur', auditEventInfo, callback);
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0600 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0601
     * @tc.name test on
     * @tc.desc input auditEventInfo is null except 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0601', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0601 start');
      let auditEventInfo : securityGuard.SecurityEventInfo = {
        eventId: 1011015001
      }

      try {
        await securityGuard.on(null, auditEventInfo, callback);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0601 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0602
     * @tc.name test on
     * @tc.desc input auditEventInfo eventid does not exist except 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0602', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0602 start');
      let auditEventInfo : securityGuard.SecurityEventInfo = {
        eventId: 0
      }

      try {
        await securityGuard.on('securityEventOccur', auditEventInfo, callback);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0602 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0603
     * @tc.name test on
     * @tc.desc input callback is null except 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0603', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0603 start');
      let auditEventInfo : securityGuard.SecurityEventInfo = {
        eventId: 1011015001
      }

      try {
        await securityGuard.on('securityEventOccur', auditEventInfo, null);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0603 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0606
     * @tc.name test on
     * @tc.desc input auditEventInfo is null except 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0606', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0606 start');
      let auditEventInfo : securityGuard.SecurityEventInfo = {
        eventId: 1011015001
      }

      try {
        await securityGuard.on('securityEventOccur', null, callback);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0606 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0700
     * @tc.name test off
     * @tc.desc input callback is null except 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0700', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0700 start');
      let auditEventInfo : securityGuard.SecurityEventInfo = {
        eventId: 1011015001
      }

      try {
        await securityGuard.off('securityEventOccur', auditEventInfo, callback);
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0700 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0701
     * @tc.name test off
     * @tc.desc input auditEventInfo is null except 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0701', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0701 start');
      let auditEventInfo : securityGuard.SecurityEventInfo = {
        eventId: 1011015001
      }

      try {
        await securityGuard.off(null, auditEventInfo, callback);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0701 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0702
     * @tc.name test off
     * @tc.desc input auditEventInfo is null except 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0702', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0702 start');
      let auditEventInfo : securityGuard.SecurityEventInfo = {
        eventId: 1011015001
      }

      try {
        await securityGuard.off('securityEventOccur', null, callback);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0702 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0703
     * @tc.name test off
     * @tc.desc input callback is null except 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0703', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0703 start');
      let auditEventInfo : securityGuard.SecurityEventInfo = {
        eventId: 1011015001
      }

      try {
        await securityGuard.off('securityEventOccur', auditEventInfo, null);
        expect(null).assertFail();
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0703 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_SecurityGuard_JsApi_Func_0704
     * @tc.name test off
     * @tc.desc input auditEventInfo eventid does not exist except 401.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_Security_SecurityGuard_JsApi_Func_0704', 0, async (done: Function) => {
      console.info('SUB_Security_SecurityGuard_JsApi_Func_0704 start');
      let auditEventInfo : securityGuard.SecurityEventInfo = {
        eventId: 0
      }

      try {
        await securityGuard.off('securityEventOccur', auditEventInfo, callback);
      } catch (err) {
        console.info('SUB_Security_SecurityGuard_JsApi_Func_0704 errcode = ' + err.code + ' errmsg = ' + err.message);
        expect(err.code).assertEqual(401);
      }
      done();
    });

  })
}

async function sleep(ms: number) {
  let timeoutId: number = 0;
  await new Promise<number>(resolve => {
    timeoutId = setTimeout(resolve, ms)
  });
  clearTimeout(timeoutId);
}
