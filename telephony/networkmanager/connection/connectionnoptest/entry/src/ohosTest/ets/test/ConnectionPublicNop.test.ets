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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

export default function ConnectionPublicNopTest() {
  describe('ConnectionPublicNopTest', () => {
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

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0100
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop0100
     * @tc.desc:Using the setAppNet (callback) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0100----before----');
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error.code) {
            console.error(`Failed to get getDefaultNet default net. Code:${error.code}, message:${error.message}`);
            if (error.code === PERMISSION_DENIED_CODE) {
              console.error(`Failed to if(error.code === PERMISSION_DENIED_CODE) 201:` + error.code);
              if (error.code === PERMISSION_DENIED_CODE) {
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              } else {
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done();
              }

              try {
                connection.setAppNet(data, (error: BusinessError, data: void) => {
                  console.info("Succeeded to get testNetworkMgrConnectionReportNetConnectedNop0100: " + JSON.stringify(data));
                });
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`Failed setAppNet to get getDefaultNet default net. Code:${e.code}, message:${e.message}`);
              }
            } else {
              console.error(`Failed to if(error.code === PERMISSION_DENIED_CODE) 401:`);
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          }
          expect(data).assertUndefined()
          done();
          console.info("Succeeded to get data " + JSON.stringify(data));
        });
      } catch (error) {
        console.info("testNetworkMgrConnectionReportNetConnectedNop0100 error:" + JSON.stringify(error));
        expect(true).assertTrue()
        done()
      }
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0100----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0200
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop0200
     * @tc.desc:Using the setAppNet (then) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0200----before----');
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error.code) {
            console.error(`Failed to get getDefaultNet default net. Code:${error.code}, message:${error.message}`);
            if (error.code === PERMISSION_DENIED_CODE) {
              console.error(`Failed to if(error.code === PERMISSION_DENIED_CODE) 201:` + error.code);
              if (error.code === PERMISSION_DENIED_CODE) {
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              } else {
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done();
              }

              try {
                connection.setAppNet(data).then(() => {

                });
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`Failed setAppNet to get getDefaultNet default net. Code:${e.code}, message:${e.message}`);
              }
            } else {
              console.error(`Failed to if(error.code === PERMISSION_DENIED_CODE) 401:`);
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          }
          expect(data).assertUndefined()
          done();
          console.info("Succeeded to get data " + JSON.stringify(data));
        });
      } catch (error) {
        console.info("testNetworkMgrConnectionReportNetConnectedNop0200 error:" + JSON.stringify(error));
        expect(true).assertTrue()
        done()
      }
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0200----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0300
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop0300
     * @tc.desc:Using the addCustomDnsRule (callback) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0300v----before----');
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"], (error: BusinessError, data: void) => {
          console.error(`${error.code} error:${JSON.stringify(error)}, data:${JSON.stringify(data)}`);
          if (error.code === PERMISSION_DENIED_CODE) {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
        });
      } catch (err) {
        console.info(`${err.code} test failed err: ${JSON.stringify(err)}`);
        done();
      }
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0300----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0400
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop0400
     * @tc.desc:Using the addCustomDnsRule (then) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0400----before----');
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          console.error(`addCustomDnsRule testNetworkMgrConnectionReportNetConnectedNop0400`);
        }).catch((error: BusinessError) => {
          if (error.code === PERMISSION_DENIED_CODE) {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
          console.error(JSON.stringify(error));
        });
      } catch (err) {
        console.info(`${err.code} test failed err: ${JSON.stringify(err)}`);
        done();
      }
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0400----after----');
    })

    /*
    * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0500
    * @tc.name: testNetworkMgrConnectionReportNetConnectedNop0500
    * @tc.desc:Using the removeCustomDnsRule (callback) method without permission
    * @tc.level:Level 2
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("testNetworkMgrConnectionReportNetConnectedNop0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0500----before----');
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.removeCustomDnsRule("192.168.1.1", (error: BusinessError, data: void) => {
            console.error(` error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
            if (error.code === PERMISSION_DENIED_CODE) {
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else {
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.error(`addCustomDnsRule removeCustomDnsRule error: ${JSON.stringify(error)} `);
          if (error.code === PERMISSION_DENIED_CODE) {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
        });
      } catch (err) {
        console.info(`test failed err: ${JSON.stringify(err)}`);
        if (err.code === PERMISSION_DENIED_CODE) {
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
      }
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0500----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0600
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop0600
     * @tc.desc:Using the removeCustomDnsRule (then) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0600----before----');
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.removeCustomDnsRule("192.168.1.1").then(() => {
            console.info('--------removeCustomDnsRule-------');
          }).catch((error: BusinessError) => {
            console.error(` error: ${JSON.stringify(error)} }`);
            if (error.code === PERMISSION_DENIED_CODE) {
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else {
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          });
        }).catch((error: BusinessError) => {
          console.error(`addCustomDnsRule removeCustomDnsRule error: ${JSON.stringify(error)} `);
          if (error.code === PERMISSION_DENIED_CODE) {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
        });
      } catch (err) {
        console.info(`test failed err: ${JSON.stringify(err)}`);
        if (err.code === PERMISSION_DENIED_CODE) {
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
      }
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0600----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0700
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop0700
     * @tc.desc:Using the removeCustomDnsRule (then) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0700----before----');
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.clearCustomDnsRules((error: BusinessError, data: void) => {
            console.info('--------removeCustomDnsRule-------');
            if (error.code === PERMISSION_DENIED_CODE) {
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else {
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          })
        }).catch((error: BusinessError) => {
          console.error(`addCustomDnsRule removeCustomDnsRule error: ${JSON.stringify(error)} `);
          if (error.code === PERMISSION_DENIED_CODE) {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
        });
      } catch (err) {
        console.info(`test failed err: ${JSON.stringify(err)}`);
        if (err.code === PERMISSION_DENIED_CODE) {
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
      }
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0700----after----');
    })
  })
}

