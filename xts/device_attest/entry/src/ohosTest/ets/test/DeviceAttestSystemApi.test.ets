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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium"
import { deviceAttest } from '@kit.BasicServicesKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { window } from '@kit.ArkUI';

export default function deviceAttestSystemApiTest(context: Context, windowStage: window.WindowStage,
                                                 abilityStorage: LocalStorage) {
  describe('deviceAttestSystemApiTest', () => {
    console.info('describe deviceAttestSystemApiTest start!!!');
    beforeAll(() => {
      console.info('beforeAll');
    })
    beforeEach(() => {
      console.info('beforeEach');
    })
    afterEach(async (done: Function) => {
      console.info('afterEach');
      done();
    })
    afterAll(() => {
      console.info('afterAll');
    })

    /**
     * @tc.name   testGetAttestStatusParamPromise0100
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_GETATTTESTSTATUS_PARAM_PROMISE_0100
     * @tc.desc   Test getAttestStatus with Promise mode - verify return structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAttestStatusParamPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('test getAttestStatus Promise mode - return structure begin');
      try {
        deviceAttest.getAttestStatus().then((attestResultInfo: deviceAttest.AttestResultInfo) => {
          console.info("!!!====>[SystemApiTest]Promise:data====>" + JSON.stringify(attestResultInfo));
          // Verify authResult type (should be number)
          expect(typeof attestResultInfo.authResult).assertEqual('number');

          // Verify softwareResult type (should be number)
          expect(typeof attestResultInfo.softwareResult).assertEqual('number');

          // Verify softwareResultDetail type (should be Array)
          expect(Array.isArray(attestResultInfo.softwareResultDetail)).assertTrue();

          // Verify softwareResultDetail length (should be 5)
          expect(attestResultInfo.softwareResultDetail.length).assertEqual(5);

          // Verify ticket type (should be string)
          expect(typeof attestResultInfo.ticket).assertEqual('string');

          done();
        }).catch((err: BusinessError) => {
          console.info("!!!====>[SystemApiTest]Promise:error====>" + JSON.stringify(err));
          // System app should not get any error during normal operation
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.info("!!!====>[SystemApiTest]Promise:catch====>" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetAttestStatusParamCallback0200
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_GETATTTESTSTATUS_PARAM_CALLBACK_0200
     * @tc.desc   Test getAttestStatus with callback mode - verify return structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAttestStatusParamCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('test getAttestStatus callback mode - return structure begin');
      try {
        deviceAttest.getAttestStatus((err: BusinessError, attestResultInfo: deviceAttest.AttestResultInfo) => {
          if (err) {
            console.info("!!!====>[SystemApiTest]Callback:error====>" + JSON.stringify(err));
            // System app should not get any error during normal operation
            expect().assertFail();
          } else {
            console.info("!!!====>[SystemApiTest]Callback:data====>" + JSON.stringify(attestResultInfo));
            // Verify authResult type (should be number)
            expect(typeof attestResultInfo.authResult).assertEqual('number');

            // Verify softwareResult type (should be number)
            expect(typeof attestResultInfo.softwareResult).assertEqual('number');

            // Verify softwareResultDetail type (should be Array)
            expect(Array.isArray(attestResultInfo.softwareResultDetail)).assertTrue();

            // Verify softwareResultDetail length (should be 5)
            expect(attestResultInfo.softwareResultDetail.length).assertEqual(5);

            // Verify ticket type (should be string)
            expect(typeof attestResultInfo.ticket).assertEqual('string');
          }
          done();
        });
      } catch (err) {
        console.info("!!!====>[SystemApiTest]Callback:catch====>" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetAttestStatusSyncParam0300
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_GETATTTESTSTATUS_SYNC_PARAM_0300
     * @tc.desc   Test getAttestStatusSync - verify return structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAttestStatusSyncParam0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('test getAttestStatusSync - return structure begin');
      try {
        let attestResultInfo: deviceAttest.AttestResultInfo = deviceAttest.getAttestStatusSync();
        console.info("!!!====>[SystemApiTest]Sync:data====>" + JSON.stringify(attestResultInfo));
        // Verify authResult type (should be number)
        expect(typeof attestResultInfo.authResult).assertEqual('number');

        // Verify softwareResult type (should be number)
        expect(typeof attestResultInfo.softwareResult).assertEqual('number');

        // Verify softwareResultDetail type (should be Array)
        expect(Array.isArray(attestResultInfo.softwareResultDetail)).assertTrue();

        // Verify softwareResultDetail length (should be 5)
        expect(attestResultInfo.softwareResultDetail.length).assertEqual(5);

        // Verify ticket type (should be string)
        expect(typeof attestResultInfo.ticket).assertEqual('string');

        done();
      } catch (err) {
        console.info("!!!====>[SystemApiTest]Sync:error====>" + JSON.stringify(err));
        // System app should not get any error during normal operation
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testAuthResultValue0400
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_AUTHRESULT_VALUE_0400
     * @tc.desc   Test authResult valid values - Promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAuthResultValue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('test authResult valid values begin');
      try {
        deviceAttest.getAttestStatus().then((attestResultInfo: deviceAttest.AttestResultInfo) => {
          console.info("!!!====>[SystemApiTest]authResult:value====>" + attestResultInfo.authResult);

          // Verify authResult is one of valid values: -2 (not attested), -1 (failed), 0 (passed)
          const isValidValue: boolean = attestResultInfo.authResult === -2 ||
                                       attestResultInfo.authResult === -1 ||
                                       attestResultInfo.authResult === 0;
          expect(isValidValue).assertTrue();

          console.info("!!!====>[SystemApiTest]authResult:status====>" +
            (attestResultInfo.authResult === -2 ? "not attested" :
             attestResultInfo.authResult === -1 ? "failed" : "passed"));

          done();
        }).catch((err: BusinessError) => {
          console.info("!!!====>[SystemApiTest]authResult:error====>" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.info("!!!====>[SystemApiTest]authResult:catch====>" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSoftwareResultValue0500
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_SOFTWARERESULT_VALUE_0500
     * @tc.desc   Test softwareResult valid values - callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftwareResultValue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('test softwareResult valid values begin');
      try {
        deviceAttest.getAttestStatus((err: BusinessError, attestResultInfo: deviceAttest.AttestResultInfo) => {
          if (err) {
            console.info("!!!====>[SystemApiTest]softwareResult:error====>" + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.info("!!!====>[SystemApiTest]softwareResult:value====>" + attestResultInfo.softwareResult);

            // Verify softwareResult is one of valid values: -2 (not attested), -1 (failed), 0 (passed)
            const isValidValue: boolean = attestResultInfo.softwareResult === -2 ||
                                         attestResultInfo.softwareResult === -1 ||
                                         attestResultInfo.softwareResult === 0;
            expect(isValidValue).assertTrue();

            console.info("!!!====>[SystemApiTest]softwareResult:status====>" +
              (attestResultInfo.softwareResult === -2 ? "not attested" :
               attestResultInfo.softwareResult === -1 ? "failed" : "passed"));
          }
          done();
        });
      } catch (err) {
        console.info("!!!====>[SystemApiTest]softwareResult:catch====>" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSoftwareResultDetailStructure0600
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_SOFTWARERESULTDETAIL_STRUCTURE_0600
     * @tc.desc   Test softwareResultDetail structure - Sync mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftwareResultDetailStructure0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('test softwareResultDetail structure begin');
      try {
        let attestResultInfo: deviceAttest.AttestResultInfo = deviceAttest.getAttestStatusSync();
        console.info("!!!====>[SystemApiTest]softwareResultDetail:value====>" +
          JSON.stringify(attestResultInfo.softwareResultDetail));

        // Verify softwareResultDetail is array with 5 elements
        expect(Array.isArray(attestResultInfo.softwareResultDetail)).assertTrue();
        expect(attestResultInfo.softwareResultDetail.length).assertEqual(5);

        // Verify each element is number
        for (let i: number = 0; i < attestResultInfo.softwareResultDetail.length; i++) {
          expect(typeof attestResultInfo.softwareResultDetail[i]).assertEqual('number');
        }

        // softwareResultDetail[0]: versionId
        console.info("!!!====>[SystemApiTest]versionId====>" + attestResultInfo.softwareResultDetail[0]);

        // softwareResultDetail[1]: patchLevel
        console.info("!!!====>[SystemApiTest]patchLevel====>" + attestResultInfo.softwareResultDetail[1]);

        // softwareResultDetail[2]: rootHash
        console.info("!!!====>[SystemApiTest]rootHash====>" + attestResultInfo.softwareResultDetail[2]);

        // softwareResultDetail[3]: system capability set
        console.info("!!!====>[SystemApiTest]systemCapability====>" + attestResultInfo.softwareResultDetail[3]);

        // softwareResultDetail[4]: reserved
        console.info("!!!====>[SystemApiTest]reserved====>" + attestResultInfo.softwareResultDetail[4]);

        done();
      } catch (err) {
        console.info("!!!====>[SystemApiTest]softwareResultDetail:error====>" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTicketValue0700
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_TICKET_VALUE_0700
     * @tc.desc   Test ticket value - Promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTicketValue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('test ticket value begin');
      try {
        deviceAttest.getAttestStatus().then((attestResultInfo: deviceAttest.AttestResultInfo) => {
          console.info("!!!====>[SystemApiTest]ticket:value====>" + attestResultInfo.ticket);
          console.info("!!!====>[SystemApiTest]ticket:length====>" + attestResultInfo.ticket.length);

          // Verify ticket is string
          expect(typeof attestResultInfo.ticket).assertEqual('string');

          // Ticket is issued by cloud after hardware auth passes
          // If authResult is not 0 (passed), ticket should be empty
          if (attestResultInfo.authResult !== 0) {
            console.info("!!!====>[SystemApiTest]ticket:status====>not authenticated, ticket empty");
            expect(attestResultInfo.ticket.length).assertEqual(0);
          } else {
            console.info("!!!====>[SystemApiTest]ticket:status====>authenticated, ticket has value");
            expect(attestResultInfo.ticket.length).assertLarger(0);
          }

          done();
        }).catch((err: BusinessError) => {
          console.info("!!!====>[SystemApiTest]ticket:error====>" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.info("!!!====>[SystemApiTest]ticket:catch====>" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testMultipleCall0800
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_MULTIPLE_CALL_0800
     * @tc.desc   Test calling getAttestStatus multiple times - reliability test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMultipleCall0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('test multiple getAttestStatus calls begin');
      let callCount: number = 0;
      const maxCalls: number = 3;
      let allResults: deviceAttest.AttestResultInfo[] = [];

      try {
        for (let i: number = 0; i < maxCalls; i++) {
          deviceAttest.getAttestStatus().then((attestResultInfo: deviceAttest.AttestResultInfo) => {
            console.info("!!!====>[SystemApiTest]Multiple:call_" + i + "====>" + JSON.stringify(attestResultInfo));
            allResults.push(attestResultInfo);
            callCount++;

            if (callCount === maxCalls) {
              // Verify all calls returned results
              expect(allResults.length).assertEqual(maxCalls);
              console.info("!!!====>[SystemApiTest]Multiple:complete====>all " + maxCalls + " calls succeeded");
              done();
            }
          }).catch((err: BusinessError) => {
            console.info("!!!====>[SystemApiTest]Multiple:error_" + i + "====>" + JSON.stringify(err));
            expect().assertFail();
            callCount++;
            if (callCount === maxCalls) {
              done();
            }
          });
        }
      } catch (err) {
        console.info("!!!====>[SystemApiTest]Multiple:catch====>" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSyncPerformance0900
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_SYNC_PERFORMANCE_0900
     * @tc.desc   Test getAttestStatusSync performance - should return quickly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSyncPerformance0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('test getAttestStatusSync performance begin');
      const startTime: number = Date.now();

      try {
        let attestResultInfo: deviceAttest.AttestResultInfo = deviceAttest.getAttestStatusSync();
        const endTime: number = Date.now();
        const duration: number = endTime - startTime;

        console.info("!!!====>[SystemApiTest]Performance:duration====>" + duration + "ms");
        console.info("!!!====>[SystemApiTest]Performance:result====>" + JSON.stringify(attestResultInfo));

        // Sync call should return within reasonable time (e.g., < 1 second)
        expect(duration < 1000).assertTrue();

        done();
      } catch (err) {
        console.info("!!!====>[SystemApiTest]Performance:error====>" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testError401Promise1000
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_ERROR_401_PROMISE_1000
     * @tc.desc   Test getAttestStatus error handling - no 401 error (invalid parameter) - Promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testError401Promise1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('test getAttestStatus error 401 (Promise) begin');
      try {
        deviceAttest.getAttestStatus().then((attestResultInfo: deviceAttest.AttestResultInfo) => {
          console.info("!!!====>[SystemApiTest]401:data====>" + JSON.stringify(attestResultInfo));
          // API takes no parameters, so 401 error should not occur in normal call
          expect(typeof attestResultInfo.authResult).assertEqual('number');
          done();
        }).catch((err: BusinessError) => {
          console.info("!!!====>[SystemApiTest]401:error====>" + JSON.stringify(err));
          // If error occurs, verify it's not 401 (invalid parameter)
          expect(err.code !== 401).assertTrue();
          done();
        });
      } catch (err) {
        console.info("!!!====>[SystemApiTest]401:catch====>" + JSON.stringify(err));
        expect((err as BusinessError).code !== 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testError401Callback1100
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_ERROR_401_CALLBACK_1100
     * @tc.desc   Test getAttestStatus error handling - no 401 error (invalid parameter) - callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testError401Callback1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('test getAttestStatus error 401 (Callback) begin');
      try {
        deviceAttest.getAttestStatus((err: BusinessError, attestResultInfo: deviceAttest.AttestResultInfo) => {
          if (err) {
            console.info("!!!====>[SystemApiTest]401:error====>" + JSON.stringify(err));
            // API takes no parameters, so 401 error should not occur in normal call
            expect(err.code !== 401).assertTrue();
          } else {
            console.info("!!!====>[SystemApiTest]401:data====>" + JSON.stringify(attestResultInfo));
            expect(typeof attestResultInfo.authResult).assertEqual('number');
          }
          done();
        });
      } catch (err) {
        console.info("!!!====>[SystemApiTest]401:catch====>" + JSON.stringify(err));
        expect((err as BusinessError).code !== 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testError401Sync1200
     * @tc.number SUB_DEVICEATTEST_DEVICEATTEST_ERROR_401_SYNC_1200
     * @tc.desc   Test getAttestStatusSync error handling - no 401 error (invalid parameter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testError401Sync1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('test getAttestStatusSync error 401 begin');
      try {
        let attestResultInfo: deviceAttest.AttestResultInfo = deviceAttest.getAttestStatusSync();
        console.info("!!!====>[SystemApiTest]401:data====>" + JSON.stringify(attestResultInfo));
        // API takes no parameters, so 401 error should not occur in normal call
        expect(typeof attestResultInfo.authResult).assertEqual('number');
        done();
      } catch (err) {
        console.info("!!!====>[SystemApiTest]401:error====>" + JSON.stringify(err));
        // If error occurs, verify it's not 401 (invalid parameter)
        expect((err as BusinessError).code !== 401).assertTrue();
        done();
      }
    })
  })
}
