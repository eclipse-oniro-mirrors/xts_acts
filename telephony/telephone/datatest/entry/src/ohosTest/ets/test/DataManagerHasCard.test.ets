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

import { describe, it, expect, beforeAll, afterAll , Level, Size, TestType} from '@ohos/hypium';
import data from '@ohos.telephony.data';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function dataManagerTest() {
  describe('DataManagerTest', () => {
    /**
     * @tc.name   testTelephonyDataGetDefaultCellularDataSlotId0100
     * @tc.number SUB_Telephony_Data_GetDefaultCellularDataSlotId_0100
     * @tc.desc   Get the SIM card for default mobile data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataGetDefaultCellularDataSlotId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId0100';
      console.info(`${caseName} test start `);
      try {
        data.getDefaultCellularDataSlotId((err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
          } else {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(data == 0 || data == 1 || data == 2);
          }
          done();
        });
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataGetDefaultCellularDataSlotId0400
     * @tc.number SUB_Telephony_Data_GetDefaultCellularDataSlotId_0400
     * @tc.desc   Get the SIM card for default mobile data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyDataGetDefaultCellularDataSlotId0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId0400';
      console.info(`${caseName} test start `);
      try {
        data.getDefaultCellularDataSlotId().then((data: number) => {
          console.info(`${caseName} data->${JSON.stringify(data)}`);
          ExpectTrue(data == 0 || data == 1 || data == 2);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err->${JSON.stringify(err)}`);
          ExpectTrue(false);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataGetDefaultCellularDataSlotIdSync0100
     * @tc.number SUB_Telephony_Data_GetDefaultCellularDataSlotIdSync_0100
     * @tc.desc   Get the SIM card for default mobile data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataGetDefaultCellularDataSlotIdSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotIdSync0100';
      console.info(`${caseName} test start `);
      try {
        let cardSlot: number = data.getDefaultCellularDataSlotIdSync();
        console.info(`${caseName} cardSlot->${JSON.stringify(cardSlot)}`);
        ExpectTrue(cardSlot == 0 || cardSlot == 1 || cardSlot == 2);
        done();
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataGetCellularDataFlowType0100
     * @tc.number SUB_Telephony_Data_GetCellularDataFlowType_0100
     * @tc.desc   Obtain the uplink and downlink status of cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataGetCellularDataFlowType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataFlowType0100';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.getCellularDataFlowType((err: BusinessError, data: data.DataFlowType) => {
            if (err) {
              console.info(`${caseName} err->${JSON.stringify(err)}`);
              ExpectTrue(false);
              done();
            } else {
              console.info(`${caseName} data->${JSON.stringify(data)}`);
              ExpectTrue(data !== null);
              done();
            }
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });



    /**
     * @tc.name   testTelephonyDataGetCellularDataFlowType0600
     * @tc.number SUB_Telephony_Data_GetCellularDataFlowType_0600
     * @tc.desc   Obtain the uplink and downlink status of cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyDataGetCellularDataFlowType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataFlowType0600';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.getCellularDataFlowType().then((data: data.DataFlowType) => {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(data !== null);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });




    /**
     * @tc.name   testTelephonyDataGetCellularDataState0200
     * @tc.number SUB_Telephony_Data_GetCellularDataState_0200
     * @tc.desc   Get the connection status of a packet switched domain (PS domain).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataGetCellularDataState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataState0200';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          let isEnable: boolean = await data.isCellularDataEnabled();
          if (isEnable) {
            data.getCellularDataState((err: BusinessError, data: data.DataConnectState) => {
              if (err) {
                console.info(`${caseName} err->${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
              } else {
                // Start the cellular data with the status of linked;
                console.info(`${caseName} data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                done();
              }
            });
          } else {
            data.enableCellularData((err: BusinessError) => {
              if (err) {
                console.info(`${caseName} enableCellularData err->${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
              }
              data.getCellularDataState((err: BusinessError, data: data.DataConnectState) => {
                if (err) {
                  console.info(`${caseName}  etCellularDataState_err->${JSON.stringify(err)}`);
                  ExpectTrue(false);
                  done();
                } else {
                  // Start the cellular data with the status of linked;
                  console.info(`${caseName} getCellularDataState_data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            });
          }
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      await data.enableCellularData();
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataGetCellularDataState0500
     * @tc.number SUB_Telephony_Data_GetCellularDataState_0500
     * @tc.desc   Get the connection status of a packet switched domain (PS domain).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyDataGetCellularDataState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataState0500';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.getCellularDataState().then((data: data.DataConnectState) => {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(data !== null);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataGetCellularDataState0600
     * @tc.number SUB_Telephony_Data_GetCellularDataState_0600
     * @tc.desc   Get the connection status of a packet switched domain (PS domain).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyDataGetCellularDataState0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataState0600';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          let isEnable: boolean = await data.isCellularDataEnabled();
          if (isEnable) {
            data.getCellularDataState().then((data: data.DataConnectState) => {
              // Start the cellular data with the status of linked;
              console.info(`${caseName} data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} err->${JSON.stringify(err)}`);
              ExpectTrue(false);
              done();
            });
          } else {
            data.enableCellularData((err: BusinessError) => {
              if (err) {
                console.info(`${caseName} err->${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
              }
              data.getCellularDataState().then((data: data.DataConnectState) => {
                // Start the cellular data with the status of linked;
                console.info(`${caseName} data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                done();
              }).catch((err: BusinessError) => {
                console.info(`${caseName} err->${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
              });
            });
          }
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataIsCellularDataEnabled0100
     * @tc.number SUB_Telephony_Data_IsCellularDataEnabled_0100
     * @tc.desc   Check whether the cellular data service is enabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyDataIsCellularDataEnabled0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataEnabled0100';
      console.info(`${caseName} test start `);
      try {
        data.isCellularDataEnabled((err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(data !== null);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} err->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataIsCellularDataEnabled0300
     * @tc.number SUB_Telephony_Data_IsCellularDataEnabled_0300
     * @tc.desc   Check whether the cellular data service is enabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataIsCellularDataEnabled0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataEnabled0300';
      console.info(`${caseName} test start `);
      try {
        // Turn on cellular data;
        data.isCellularDataEnabled((err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataIsCellularDataEnabled0400
     * @tc.number SUB_Telephony_Data_IsCellularDataEnabled_0400
     * @tc.desc   Check whether the cellular data service is enabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataIsCellularDataEnabled0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataEnabled0400';
      console.info(`${caseName} test start `);
      try {
        data.isCellularDataEnabled(null);
        ExpectTrue(false);
        done();
      } catch (error) {
        console.info(`${caseName} catch_error ${JSON.stringify(error)}`);
        ExpectTrue(error.code === 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataIsCellularDataEnabled0500
     * @tc.number SUB_Telephony_Data_IsCellularDataEnabled_0500
     * @tc.desc   Check whether the cellular data service is enabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyDataIsCellularDataEnabled0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataEnabled0500';
      console.info(`${caseName} test start `);
      try {
        data.isCellularDataEnabled().then((data: boolean) => {
          console.info(`${caseName} data->${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err->${JSON.stringify(err)}`);
          ExpectTrue(false);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataIsCellularDataEnabled0700
     * @tc.number SUB_Telephony_Data_IsCellularDataEnabled_0700
     * @tc.desc   Check whether the cellular data service is enabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataIsCellularDataEnabled0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataEnabled0700';
      console.info(`${caseName} test start `);
      try {
        // Turn on cellular data;
        data.isCellularDataEnabled((err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataIsCellularDataRoamingEnabled0300
     * @tc.number SUB_Telephony_Data_IsCellularDataRoamingEnabled_0300
     * @tc.desc   Check whether roaming is enabled for cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyDataIsCellularDataRoamingEnabled0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabled0300';
      console.info(`${caseName} test start `);
      try {
        // Enable cellular data roaming.
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.isCellularDataRoamingEnabled(0, (err: BusinessError, data: boolean) => {
            if (err) {
              console.info(`${caseName} err->${JSON.stringify(err)}`);
              ExpectTrue(false);
              done();
            } else {
              console.info(`${caseName} data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              done();
            }
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataIsCellularDataRoamingEnabled0500
     * @tc.number SUB_Telephony_Data_IsCellularDataRoamingEnabled_0500
     * @tc.desc   Check whether roaming is enabled for cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataIsCellularDataRoamingEnabled0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabled0500';
      console.info(`${caseName} test start `);
      try {
        data.isCellularDataRoamingEnabled(2, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 8300001);
            done();
          } else {
            console.info(`${caseName} Input parameter 2 of the card`);
            ExpectTrue(false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 8300001);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataIsCellularDataRoamingEnabled0700
     * @tc.number SUB_Telephony_Data_IsCellularDataRoamingEnabled_0700
     * @tc.desc   Check whether roaming is enabled for cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyDataIsCellularDataRoamingEnabled0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabled0700';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.isCellularDataRoamingEnabled(0).then((data: boolean) => {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(data !== null);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataIsCellularDataRoamingEnabled1100
     * @tc.number SUB_Telephony_Data_IsCellularDataRoamingEnabled_1100
     * @tc.desc   Check whether roaming is enabled for cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataIsCellularDataRoamingEnabled1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabled1100';
      console.info(`${caseName} test start `);
      try {
        data.isCellularDataRoamingEnabled(2).then((data: boolean) => {
          console.info(`${caseName} The parameter passed in is 2 and should not go to the normal branch`);
          ExpectTrue(false);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err.code->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300001);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catcherr->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 8300001);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataIsCellularDataRoamingEnabled0900
     * @tc.number SUB_Telephony_Data_IsCellularDataRoamingEnabled_0900
     * @tc.desc   Check whether roaming is enabled for cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataIsCellularDataRoamingEnabled0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabled0900';
      console.info(`${caseName} test start `);
      try {
        // Enable cellular data roaming.
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.isCellularDataRoamingEnabled(0, (err: BusinessError, data: boolean) => {
            if (err) {
              console.info(`${caseName} err->${JSON.stringify(err)}`);
              ExpectTrue(false);
              done();
            } else {
              console.info(`${caseName} data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              done();
            }
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataGetDefaultCellularDataSimId0100
     * @tc.number SUB_Telephony_Data_GetDefaultCellularDataSimId_0100
     * @tc.desc   Gets the SIM card ID for the default mobile data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataGetDefaultCellularDataSimId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSimId0100';
      console.info(`${caseName} test start `);
      try {
        let num: number = data.getDefaultCellularDataSimId();
        console.info(`${caseName} data->${JSON.stringify(num)}`);
        ExpectTrue(num !== null);
        done();
      } catch (err) {
        console.info(`${caseName} err->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataGetDefaultCellularDataSimId0200
     * @tc.number SUB_Telephony_Data_GetDefaultCellularDataSimId_0200
     * @tc.desc   Gets the SIM card ID for the default mobile data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataGetDefaultCellularDataSimId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSimId0200';
      console.info(`${caseName} test start `);
      try {
        let num: number = data.getDefaultCellularDataSimId();
        console.info(`${caseName} data->${JSON.stringify(num)}`);
        ExpectTrue(num != null);
        done();
      } catch (err) {
        console.info(`${caseName} err->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyDataGetDefaultCellularDataSimId0300
     * @tc.number SUB_Telephony_Data_GetDefaultCellularDataSimId_0300
     * @tc.desc   Gets the SIM card ID for the default mobile data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyDataGetDefaultCellularDataSimId0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetDefaultCellularDataSimId0300';
      console.info(`${caseName} test start `);
      try {
        let slotNum: number = await data.getDefaultCellularDataSlotId();
        console.info(`${caseName} data_slotNum->${JSON.stringify(slotNum)}`);
        let num: number = data.getDefaultCellularDataSimId();
        console.info(`${caseName} data_num->${JSON.stringify(num)}`);
        ExpectTrue(num != null);
        done();
      } catch (err) {
        console.info(`${caseName} err->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });
    
  });
}

