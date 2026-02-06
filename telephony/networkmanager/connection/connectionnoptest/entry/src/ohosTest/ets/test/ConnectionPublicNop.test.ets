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

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

function ExpectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

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
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0100----before----');
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error.code) {
            console.error(`Failed to get getDefaultNet default net. Code:${error.code}, message:${error.message}`);
            if (error.code === PERMISSION_DENIED_CODE) {
              console.error(`Failed to if(error.code === PERMISSION_DENIED_CODE) 201:` + error.code);
              if (error.code === PERMISSION_DENIED_CODE) {
                ExpectTrue(error.code == PERMISSION_DENIED_CODE);
                done();
              } else {
                ExpectTrue(error.code == PARAMETER_ERROR_CODE);
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
              ExpectTrue(error.code == PARAMETER_ERROR_CODE);
              done();
            }
          }
          expect(data).assertUndefined()
          done();
          console.info("Succeeded to get data " + JSON.stringify(data));
        });
      } catch (error) {
        console.info("testNetworkMgrConnectionReportNetConnectedNop0100 error:" + JSON.stringify(error));
        ExpectFalse();
        done()
      }
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0100----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0200
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop0200
     * @tc.desc:Using the setAppNet (then) method without permission
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0200----before----');
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error.code) {
            console.error(`Failed to get getDefaultNet default net. Code:${error.code}, message:${error.message}`);
            if (error.code === PERMISSION_DENIED_CODE) {
              console.error(`Failed to if(error.code === PERMISSION_DENIED_CODE) 201:` + error.code);
              if (error.code === PERMISSION_DENIED_CODE) {
                ExpectTrue(error.code == PERMISSION_DENIED_CODE);
                done();
              } else {
                ExpectTrue(error.code == PARAMETER_ERROR_CODE);
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
              ExpectTrue(error.code == PARAMETER_ERROR_CODE);
              done();
            }
          }
          expect(data).assertUndefined()
          done();
          console.info("Succeeded to get data " + JSON.stringify(data));
        });
      } catch (error) {
        console.info("testNetworkMgrConnectionReportNetConnectedNop0200 error:" + JSON.stringify(error));
        ExpectFalse();
        done()
      }
      console.info('--------testNetworkMgrConnectionReportNetConnectedNop0200----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0300
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop0300
     * @tc.desc:Using the addCustomDnsRule (callback) method without permission
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName:string = 'testNetworkMgrConnectionReportNetConnectedNop0300';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"], (error: BusinessError, data: void) => {
          console.error(`${caseName} error:${JSON.stringify(error)}, data:${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error.code == PERMISSION_DENIED_CODE);
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectFalse();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0400
     * @tc.name:testNetworkMgrConnectionReportNetConnectedNop0400
     * @tc.desc:Using the addCustomDnsRule (then) method without permission
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName:string = 'testNetworkMgrConnectionReportNetConnectedNop0400';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          console.info('testNetworkMgrConnectionReportNetConnectedNop0400 success');
        }).catch((error: BusinessError) => {
          if (error) {
            console.error(JSON.stringify(error));
            ExpectTrue(error.code === PERMISSION_DENIED_CODE);
            console.info(`${caseName}---End`);
            done();
          } else {
            ExpectFalse();
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} failed err: ${JSON.stringify(err)}`);
        ExpectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
    * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0500
    * @tc.name:testNetworkMgrConnectionReportNetConnectedNop0500
    * @tc.desc:Using the removeCustomDnsRule (callback) method without permission
    * @tc.level:Level 2
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("testNetworkMgrConnectionReportNetConnectedNop0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName:string = 'testNetworkMgrConnectionReportNetConnectedNop0500';
      console.info(`${caseName}---Start`);
      try {
          connection.removeCustomDnsRule("192.168.1.1", (error: BusinessError, data: void) => {
            console.error(`${caseName} error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
            if (error) {
              console.info('removeCustomDnsRule fail');
              ExpectTrue(error.code == PERMISSION_DENIED_CODE);
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info('removeCustomDnsRule success');
              ExpectFalse();
              console.info(`${caseName}---End`);
              done();
            }
          });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFalse();
        console.info(`${caseName}---End`);
        done();
        }
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
      const caseName:string = 'testNetworkMgrConnectionReportNetConnectedNop0600';
      console.info(`${caseName}---Start`);
      try {
          connection.removeCustomDnsRule("192.168.1.1").then(() => {
            console.info('--------removeCustomDnsRule-------');
          }).catch((error: BusinessError) => {
            console.error(` error: ${JSON.stringify(error)} }`);
            if (error.code === PERMISSION_DENIED_CODE) {
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              console.info(`${caseName}---End`);
              done();
            } else {
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
              console.info(`${caseName}---End`);
              done();
            }
          });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0700
     * @tc.name:testNetworkMgrConnectionReportNetConnectedNop0700
     * @tc.desc:Using the removeCustomDnsRule (then) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName:string = 'testNetworkMgrConnectionReportNetConnectedNop0700';
      console.info(`${caseName}---Start`);
      try {
          connection.clearCustomDnsRules((error: BusinessError, data: void) => {
            console.info('--------removeCustomDnsRule-------');
            if (error.code === PERMISSION_DENIED_CODE) {
              ExpectTrue(error.code == PERMISSION_DENIED_CODE);
              console.info(`${caseName}---End`);
              done();
            } else {
              ExpectTrue(error.code == PARAMETER_ERROR_CODE);
              console.info(`${caseName}---End`);
              done();
            }
          })
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Connection_getAddressesByNameNop_0100
     * @tc.name   : testTelephonyConnectionGetAddressesByNameNop0100
     * @tc.desc   : AddressesByName Permission denied
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testTelephonyConnectionGetAddressesByNameNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyConnectionGetAddressesByNameNop0100';
      console.info(`${caseName}---Start`);
      try{
        connection.getAddressesByName("www.baidu.com", (error: BusinessError, data: connection.NetAddress[]) => {
          if (error) {
            console.error(`${caseName} Failed to get addresses. Code:${error.code}, message:${error.message}`);
            ExpectTrue(error.code == 201);
            console.info(`${caseName}---End`);
            done();
          }else {
            console.info(`${caseName} success to get addressta: ` + JSON.stringify(data));
            ExpectFalse();
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (err){
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Connection_getAddressesByNameNop_0200
     * @tc.name   : testTelephonyConnectionGetAddressesByNameNop0200
     * @tc.desc   : AddressesByName Permission denied
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testTelephonyConnectionGetAddressesByNameNop0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyConnectionGetAddressesByNameNop0200';
      console.info(`${caseName}---Start`);
      try{
        connection.getAddressesByName("www.baidu.com").then((data :connection.NetAddress[] )=>{
          console.info(`${caseName} Succeeded to get data:`, JSON.stringify(data))
        }).catch((error:BusinessError)=>{
          console.info(`${caseName} Failed to get addresses. Code:${error.code}, message:${error.message}`);
          ExpectTrue(error.code == 201);
          console.info(`${caseName}---End`);
          done();
        })
      }catch (err){
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Connection_SetPacNop_0100
     * @tc.name   : testTelephonyConnectionSetPacNop0100
     * @tc.desc   : set PacUrl No Permission
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testTelephonyConnectionSetPacNop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyConnectionSetPacNop0100';
      console.info(`${caseName}---Start`);
      try{
        connection.setPacUrl("a/b")
        ExpectFalse();
        console.info('setPacUrl success!');
        done();
      }catch (err){
        console.info(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 201);
        console.info(`${caseName} --test end`);
        done();
      }
    })

    /**
     * @tc.number : SUB_Network_Connection_setPacFileUrlNoP_0100
     * @tc.name   : testConnectionSetPacFileUrlNoP0100
     * @tc.desc   : Calling setPacFileURL without SET-PAC_URL permission returns error code 201.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetPacFileUrlNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testConnectionSetPacFileUrlNoP0100';
      console.info(`${caseName}---Start`);
      try{
        connection.setPacFileUrl('a/b.pac');
        console.info(`${caseName} setPacFileUrl success`);
        ExpectFail();
        done();
      } catch (err) {
        console.info(`${caseName} catch err is ${JSON.stringify(err)} `);
        ExpectTrue(err.code == 201);
        done();
      }
    });

    })
}



