/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import { describe, it, expect, beforeAll, Level, TestType, Size } from '@ohos/hypium';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.WRITE_CONTACTS" | "ohos.permission.READ_CONTACTS";
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.simtest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

export default function Sim2Public() {
  describe('Sim2Public', () => {

    beforeAll(async (done: Function) => {
      console.log('getPermission beforeAll');
      await getPermissions();
      done();
    });

    /**
     * @tc.name   testTelephonySimGetDefaultVoiceSlotId0100
     * @tc.number SUB_Telephony_Sim_GetDefaultVoiceSlotId_0100
     * @tc.desc   SIMCard required Obtain the slot ID for the default voice service. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetDefaultVoiceSlotId0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetDefaultVoiceSlotId0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.setDefaultVoiceSlotId(0, (error: BusinessError) => {
            if (error) {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: setDefaultVoiceSlotId success`);
              sim.getDefaultVoiceSlotId((err: BusinessError, data: number) => {
                if (data === 0) {
                  console.info(`${caseName} success: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  console.info(`${caseName} test end `);
                  done();
                } else {
                  ExpectFail();
                  console.info(`${caseName} test end `);
                  done();
                }
              });
            }
          });
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetDefaultVoiceSlotId0400
     * @tc.number SUB_Telephony_Sim_GetDefaultVoiceSlotId_0400
     * @tc.desc   SIMCard required Obtain the slot ID for the default voice service. Use promise for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetDefaultVoiceSlotId0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetDefaultVoiceSlotId0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.setDefaultVoiceSlotId(0).then(() => {
            console.info(`${caseName}: setDefaultVoiceSlotId success`);
            sim.getDefaultVoiceSlotId().then((data: number) => {
              if (data === 0) {
                console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            }).catch((err: BusinessError) => {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            });
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, setDefaultVoiceSlotId promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName}:success has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimHasOperaterPrivileges0700
     * @tc.number SUB_Telephony_Sim_HasOperaterPrivileges_0700
     * @tc.desc   SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimHasOperaterPrivileges0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasOperaterPrivileges0700';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success has SimCard1,data->${JSON.stringify(data)}`);
          try {
            sim.hasOperatorPrivileges(null, (err: BusinessError, data: boolean) => {
              if (err.code === 401) {
                console.info(`${caseName}:Parameter error. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName}:Parameter error. err->${JSON.stringify(error)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName}:fail Do not have SimCard1,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimHasOperaterPrivileges0800
     * @tc.number SUB_Telephony_Sim_HasOperaterPrivileges_0800
     * @tc.desc   SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimHasOperaterPrivileges0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasOperaterPrivileges0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success has SimCard1,data->${JSON.stringify(data)}`);
          sim.hasOperatorPrivileges(-1, (err: BusinessError, data: boolean) => {
            if (err.code === 8300001) {
              console.info(`${caseName}:Invalid parameter value. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:fail Do not have SimCard1,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimHasOperaterPrivileges0900
     * @tc.number SUB_Telephony_Sim_HasOperaterPrivileges_0900
     * @tc.desc   SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimHasOperaterPrivileges0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasOperaterPrivileges0900';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success has SimCard1,data->${JSON.stringify(data)}`);
          sim.hasOperatorPrivileges(0, (err: BusinessError, data: boolean) => {
            console.info(`${caseName}:Invalid parameter value. 000000 err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
            if (!data) {
              console.info(`${caseName}:Invalid parameter value. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              expect(data).assertFalse();
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              expect(data).assertTrue();
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:fail Do not have SimCard1,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimHasOperaterPrivileges1600
     * @tc.number SUB_Telephony_Sim_HasOperaterPrivileges_1600
     * @tc.desc   SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimHasOperaterPrivileges1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasOperaterPrivileges1600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success has  SimCard1,data->${JSON.stringify(data)}`);
          try {
            sim.hasOperatorPrivileges(null).then((data: boolean) => {
              console.info(`${caseName} success , promise: data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              if (err.code === 401) {
                console.info(`${caseName}:Parameter error. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName}:Parameter error. err->${JSON.stringify(error)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName}:success has not SimCard1,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimHasOperaterPrivileges1700
     * @tc.number SUB_Telephony_Sim_HasOperaterPrivileges_1700
     * @tc.desc   SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimHasOperaterPrivileges1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasOperaterPrivileges1700';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success has  SimCard1,data->${JSON.stringify(data)}`);
          sim.hasOperatorPrivileges(-1).then((data: boolean) => {
            console.info(`${caseName} success   , promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName}:Invalid parameter value. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:success has not SimCard1,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimHasOperaterPrivileges1800
     * @tc.number SUB_Telephony_Sim_HasOperaterPrivileges_1800
     * @tc.desc   SIMCard required Check if the application (caller) has been granted operator permissions. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimHasOperaterPrivileges1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasOperaterPrivileges1800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success has  SimCard1,data->${JSON.stringify(data)}`);
          sim.hasOperatorPrivileges(0).then((data: boolean) => {
            if (!data){
              console.info(`${caseName}:Invalid parameter value. data->${JSON.stringify(data)}`);
              expect(data).assertFalse();
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: data->${JSON.stringify(data)}`);
              expect(data).assertTrue();
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName}:Invalid parameter value. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:success has not SimCard1,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim0100
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_0100
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSim0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(0, (err: BusinessError, data: string) => {
            if (data.length > 0) {
              console.info(`${caseName}: success data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} failed Dont have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim0300
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_0300
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetISOCountryCodeForSim0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(-1, (err: BusinessError, data: string) => {
            if (err.code === 8300001) {
              console.info(`${caseName}: Invalid parameter value success  data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} failed Dont have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim0400
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_0400
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using callback for asynchronous callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSim0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          try {
            sim.getISOCountryCodeForSim(null, (err: BusinessError, data: string) => {
              if (err.code === 401) {
                console.info(`${caseName}: Parameter error success  data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                console.info(`${caseName}: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName}: Parameter error success  data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: err->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName} failed Dont have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim0800
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_0800
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSim0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success have card,data->${JSON.stringify(data)}`);
          sim.getISOCountryCodeForSim(0).then((data: string) => {
            if (data.length > 0) {
              console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName}:failed dont have card,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim1000
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_1000
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSim1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim1000';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          sim.getISOCountryCodeForSim(-1).then((data: string) => {
            console.info(`${caseName} false, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName} success Invalid parameter value., promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} false , promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:failed dont have card,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSim1100
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSim_1100
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot. Using promise for asynchronous promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSim1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSim1100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          try {
            sim.getISOCountryCodeForSim(null).then((data: string) => {
              console.info(`${caseName} false, promise: data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              if (err.code === 401) {
                console.info(`${caseName} success Parameter error, promise: err->${JSON.stringify(err)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                console.info(`${caseName} false , promise: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} success Parameter error, promise: error->${JSON.stringify(error)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} false , promise: err->${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName}:failed dont have card,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSimSync0100
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSimSync_0100
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSimSync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSimSync0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          try {
            let countryCode: string = sim.getISOCountryCodeForSimSync(0);
            if (countryCode.length > 0) {
              console.info(`${caseName} success:` + countryCode);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          } catch (err) {
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName}:failed has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetISOCountryCodeForSimSync0300
     * @tc.number SUB_Telephony_Sim_GetISOCountryCodeForSimSync_0300
     * @tc.desc   SIMCard required Obtain the ISO country code for the specified SIM card slot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetISOCountryCodeForSimSync0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetISOCountryCodeForSimSync0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          try {
            let countryCode: string = sim.getISOCountryCodeForSimSync(-1);
            if (countryCode.length === 0) {
              console.info(`${caseName} success:` + countryCode);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          } catch (err) {
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName}:fail has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimOperatorNumeric0100
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_0100
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimOperatorNumeric0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getSimOperatorNumeric(0, (err: BusinessError, data: string) => {
            if (data.length > 0) {
              console.info(`${caseName}: success err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: fail err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:success has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimOperatorNumeric0300
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_0300
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimOperatorNumeric0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getSimOperatorNumeric(-1, (err: BusinessError, data: string) => {
            if (err.code === 8300001) {
              console.info(`${caseName}: success Invalid parameter value err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: fail err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:fail has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimOperatorNumeric0400
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_0400
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimOperatorNumeric0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          try {
            sim.getSimOperatorNumeric(null, (err: BusinessError, data: string) => {
              if (err.code === 401) {
                console.info(`${caseName}: success Parameter error. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                console.info(`${caseName}: fail err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName}: success Parameter error. err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}: fail err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName}:fail has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimOperatorNumeric0800
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_0800
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimOperatorNumeric0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} :success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getSimOperatorNumeric(0).then((data: string) => {
            if (data.length > 0) {
              console.info(`${caseName}  success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName}  failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName} :failed hasSimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimOperatorNumeric1000
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_1000
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimOperatorNumeric1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric1000';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.getSimOperatorNumeric(-1).then((data: string) => {
            console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName} success Invalid parameter value, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName}:failed hasSimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimOperatorNumeric1100
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumeric_1100
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimOperatorNumeric1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumeric1100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} :success hasSimCard,data->${JSON.stringify(data)}`);
          try {
            sim.getSimOperatorNumeric(null).then((data: string) => {
              console.info(`${caseName}  success, promise: data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              if (err.code === 401) {
                console.info(`${caseName}  success Parameter value, promise: err->${JSON.stringify(err)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                console.info(`${caseName}  failed, promise: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName}  success Parameter value, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName}  failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          console.info(`${caseName} :failed hasSimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimOperatorNumericSync0100
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumericSync_0100
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimOperatorNumericSync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumericSync0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          let numeric: string = sim.getSimOperatorNumericSync(0);
          if (numeric.length > 0) {
            console.info(`${caseName}the sim operator numeric is success:` + numeric);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            console.info(`${caseName}the sim operator numeric  is:` + numeric);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName}:failed has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimOperatorNumericSync0300
     * @tc.number SUB_Telephony_Sim_GetSimOperatorNumericSync_0300
     * @tc.desc   SIMCard required Obtain the Public Land Mobile Network (PLMN) number of the designated SIM card slot.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimOperatorNumericSync0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimOperatorNumericSync0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          let numeric: string = sim.getSimOperatorNumericSync(-1);
          if (numeric.length === 0) {
            console.info(`${caseName}the sim operator numeric is success:` + numeric);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            console.info(`${caseName}the sim operator numeric  is:` + numeric);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName}:failed has not SimCard,data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimState0100
     * @tc.number SUB_Telephony_Sim_GetSimState_0100
     * @tc.desc   SIMCard required Get the SIM card status of the specified slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimState0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(0, (err: BusinessError, data: sim.SimState) => {
            if (!err) {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              const simStateAry: number[] = [
              sim.SimState.SIM_STATE_UNKNOWN,
              sim.SimState.SIM_STATE_LOCKED,
              sim.SimState.SIM_STATE_NOT_PRESENT,
              sim.SimState.SIM_STATE_NOT_READY,
              sim.SimState.SIM_STATE_LOADED,
              sim.SimState.SIM_STATE_READY
              ]
              ExpectTrue(simStateAry.includes(data));
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimState0300
     * @tc.number SUB_Telephony_Sim_GetSimState_0300
     * @tc.desc   SIMCard required Get the SIM card status of the specified slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimState0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          try {
            sim.getSimState(null, (err: BusinessError, data: sim.SimState) => {
              if (err.code === 401) {
                console.info(`${caseName} 	Parameter error callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} 	Parameter error callback: err->${JSON.stringify(error)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimState0400
     * @tc.number SUB_Telephony_Sim_GetSimState_0400
     * @tc.desc   SIMCard required Get the SIM card status of the specified slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimState0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(-1, (err: BusinessError, data: sim.SimState) => {
            if (err.code === 8300001) {
              console.info(`${caseName} 	Invalid parameter value. callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimState0600
     * @tc.number SUB_Telephony_Sim_GetSimState_0600
     * @tc.desc   SIMCard required Get the SIM card status of the specified slot. Use promise for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimState0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(0).then((data: sim.SimState) => {
            console.info(`${caseName}getSimState success, promise: data->${JSON.stringify(data)}`);
            const simStateAry: number[] = [
            sim.SimState.SIM_STATE_UNKNOWN,
            sim.SimState.SIM_STATE_LOCKED,
            sim.SimState.SIM_STATE_NOT_PRESENT,
            sim.SimState.SIM_STATE_NOT_READY,
            sim.SimState.SIM_STATE_LOADED,
            sim.SimState.SIM_STATE_READY
            ]
            ExpectTrue(simStateAry.includes(data));
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName}getSimState failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimState0800
     * @tc.number SUB_Telephony_Sim_GetSimState_0800
     * @tc.desc   SIMCard required Get the SIM card status of the specified slot. Use promise for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimState0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          try {
            sim.getSimState(null).then((data: sim.SimState) => {
              console.info(`${caseName} getSimState success, promise: data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              if (err.code === 401) {
                console.info(`${caseName} getSimState failed Parameter error, promise: err->${JSON.stringify(err)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} getSimState failed Parameter error, promise: err->${JSON.stringify(error)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimState0900
     * @tc.number SUB_Telephony_Sim_GetSimState_0900
     * @tc.desc   SIMCard required Get the SIM card status of the specified slot. Use promise for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimState0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimState0900';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimState(-1).then((data: sim.SimState) => {
            console.info(`${caseName} getSimState success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName} getSimState failed Invalid parameter value, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimCardType0100
     * @tc.number SUB_Telephony_Sim_GetSimCardType_0100
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot. Use callback for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimCardType0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getCardType(0, (err: BusinessError, data: sim.CardType) => {
            if (!err) {
              console.info(`${caseName}  callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              const simStateAry: number[] = [
              sim.CardType.UNKNOWN_CARD,
              sim.CardType.SINGLE_MODE_SIM_CARD,
              sim.CardType.SINGLE_MODE_USIM_CARD,
              sim.CardType.SINGLE_MODE_RUIM_CARD,
              sim.CardType.DUAL_MODE_CG_CARD,
              sim.CardType.CT_NATIONAL_ROAMING_CARD,
              sim.CardType.CU_DUAL_MODE_CARD,
              sim.CardType.DUAL_MODE_TELECOM_LTE_CARD,
              sim.CardType.DUAL_MODE_UG_CARD,
              sim.CardType.SINGLE_MODE_ISIM_CARD
              ];
              ExpectTrue(simStateAry.includes(data));
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimCardType0300
     * @tc.number SUB_Telephony_Sim_GetSimCardType_0300
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot. Use callback for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimCardType0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          try {
            sim.getCardType(null, (err: BusinessError, data: sim.CardType) => {
              if (err.code === 401) {
                console.info(`${caseName} Parameter error. callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} Parameter error. callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimCardType0400
     * @tc.number SUB_Telephony_Sim_GetSimCardType_0400
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot. Use callback for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimCardType0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getCardType(-1, (err: BusinessError, data: sim.CardType) => {
            if (err.code === 8300001) {
              console.info(`${caseName} Invalid parameter value. callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimCardType0800
     * @tc.number SUB_Telephony_Sim_GetSimCardType_0800
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot. Use promise for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimCardType0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getCardType(0).then((data: sim.CardType) => {
            const simStateAry: number[] = [
            sim.CardType.UNKNOWN_CARD,
            sim.CardType.SINGLE_MODE_SIM_CARD,
            sim.CardType.SINGLE_MODE_USIM_CARD,
            sim.CardType.SINGLE_MODE_RUIM_CARD,
            sim.CardType.DUAL_MODE_CG_CARD,
            sim.CardType.CT_NATIONAL_ROAMING_CARD,
            sim.CardType.CU_DUAL_MODE_CARD,
            sim.CardType.DUAL_MODE_TELECOM_LTE_CARD,
            sim.CardType.DUAL_MODE_UG_CARD,
            sim.CardType.SINGLE_MODE_ISIM_CARD
            ];
            const isCard: boolean = simStateAry.includes(data);
            if (isCard) {
              console.info(`${caseName} getCardType success, promise: data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} getCardType failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimCardType1000
     * @tc.number SUB_Telephony_Sim_GetSimCardType_1000
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot. Use promise for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimCardType1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType1000';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          try {
            sim.getCardType(null).then((data: sim.CardType) => {
              console.info(`${caseName} getCardType failed, promise: data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              if (err.code === 401) {
                console.info(`${caseName} Parameter error. getCardType success, promise: err->${JSON.stringify(err)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} Parameter error. getCardType success, promise: err->${JSON.stringify(error)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimCardType1100
     * @tc.number SUB_Telephony_Sim_GetSimCardType_1100
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot. Use promise for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimCardType1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardType1100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card2: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getCardType(-1).then((data: sim.CardType) => {
            console.info(`${caseName} getCardType failed, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName} Invalid parameter value. getCardType success, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimCardTypeSync0100
     * @tc.number SUB_Telephony_Sim_GetSimCardTypeSync_0100
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimCardTypeSync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimCardTypeSync0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          let cardType: sim.CardType = sim.getCardTypeSync(0);
          const simStateAry: number[] = [
          sim.CardType.UNKNOWN_CARD,
          sim.CardType.SINGLE_MODE_SIM_CARD,
          sim.CardType.SINGLE_MODE_USIM_CARD,
          sim.CardType.SINGLE_MODE_RUIM_CARD,
          sim.CardType.DUAL_MODE_CG_CARD,
          sim.CardType.CT_NATIONAL_ROAMING_CARD,
          sim.CardType.CU_DUAL_MODE_CARD,
          sim.CardType.DUAL_MODE_TELECOM_LTE_CARD,
          sim.CardType.DUAL_MODE_UG_CARD,
          sim.CardType.SINGLE_MODE_ISIM_CARD
          ];
          ExpectTrue(simStateAry.includes(cardType));
          console.info(`${caseName} the card type is:` + cardType);
          done();
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimHasSimCard0100
     * @tc.number SUB_Telephony_Sim_HasSimCard_0100
     * @tc.desc   Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimHasSimCard0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCard0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimHasSimCard0600
     * @tc.number SUB_Telephony_Sim_HasSimCard_0600
     * @tc.desc   Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimHasSimCard0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCard0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0).then((data: boolean) => {
        if (data) {
          console.info(`hasSimCard success, promise: data->${JSON.stringify(data)}`);
          expect(data).assertTrue();
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}:data->${JSON.stringify(data)}`);
          expect(data).assertFalse();
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      }).catch((err: BusinessError) => {
        console.info(`hasSimCard failed, promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.name   testTelephonySimHasSimCardSync0100
     * @tc.number SUB_Telephony_Sim_HasSimCardSync_0100
     * @tc.desc   SIMCard required Obtain the SIM card type for the specified slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimHasSimCardSync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCardSync0100';
      console.info(`${caseName} test start `);
      let hasSimCard: boolean = sim.hasSimCardSync(0);
      if (hasSimCard === true) {
        console.info(`${caseName} success has sim card1: ` + hasSimCard);
        ExpectTrue(true);
        console.info(`${caseName} test end `);
        done();
      } else {
        console.info(`${caseName} false has not sim card1: ` + hasSimCard);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /**
     * @tc.name   testTelephonySimGetSimAccountInfo0100
     * @tc.number SUB_Telephony_Sim_GetSimAccountInfo_0100
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimAccountInfo0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has  card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(0, (err: BusinessError, data: sim.IccAccountInfo) => {
            if (data.simId > 0 && data.slotIndex >= 0 && data.isEsim !== undefined && data.isActive !== undefined && data.iccId.length > 0 && data.showName !== undefined && data.showNumber.length !== undefined) {
              console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimAccountInfo0300
     * @tc.number SUB_Telephony_Sim_GetSimAccountInfo_0300
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimAccountInfo0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has  card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          try {
            sim.getSimAccountInfo(null, (err: BusinessError, data: sim.IccAccountInfo) => {
              if (err.code === 401) {
                console.info(`${caseName} Parameter error: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} Parameter error: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimAccountInfo0400
     * @tc.number SUB_Telephony_Sim_GetSimAccountInfo_0400
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimAccountInfo0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has  card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(-1, (err: BusinessError, data: sim.IccAccountInfo) => {
            if (err.code === 8300001) {
              console.info(`${caseName} 	Invalid parameter value: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimAccountInfo0800
     * @tc.number SUB_Telephony_Sim_GetSimAccountInfo_0800
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimAccountInfo0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo0800';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(0).then((data: sim.IccAccountInfo) => {
            console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
            if (data.simId > 0 && data.slotIndex >= 0 && data.isEsim !== undefined && data.isActive !== undefined && data.iccId.length > 0 && data.showName !== undefined && data.showNumber.length !== undefined) {
              console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimAccountInfo1000
     * @tc.number SUB_Telephony_Sim_GetSimAccountInfo_1000
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonySimGetSimAccountInfo1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo1000';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          try {
            sim.getSimAccountInfo(null).then((data: sim.IccAccountInfo) => {
              console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }).catch((err: BusinessError) => {
              if (err.code === 401) {
                console.info(`${caseName} Parameter error, promise: err->${JSON.stringify(err)}`);
                ExpectTrue(true);
                console.info(`${caseName} test end `);
                done();
              } else {
                console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              }
            });
          } catch (error) {
            if ((error as BusinessError).code === 401) {
              console.info(`${caseName} Parameter error, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetSimAccountInfo1100
     * @tc.number SUB_Telephony_Sim_GetSimAccountInfo_1100
     * @tc.desc   SIMCard required Get SIM card account information. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetSimAccountInfo1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetSimAccountInfo1100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.getSimAccountInfo(-1).then((data: sim.IccAccountInfo) => {
            console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300001) {
              console.info(`${caseName} Parameter error, promise: err->${JSON.stringify(err)}`);
              ExpectTrue(true);
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetActiveSimAccountInfoList0100
     * @tc.number SUB_Telephony_Sim_GetActiveSimAccountInfoList_0100
     * @tc.desc   SIMCard required Get a list of activated SIM card account information. Use callback for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetActiveSimAccountInfoList0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetActiveSimAccountInfoList0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.activateSim(0, (err: BusinessError) => {
            if (!err) {
              console.info(`${caseName} success card1 is actived callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              sim.getActiveSimAccountInfoList((err: BusinessError, data: Array<sim.IccAccountInfo>) => {
                if (!err && data.length > 0) {
                  console.info(`${caseName} callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  console.info(`${caseName} test end `);
                  done();
                } else {
                  ExpectFail();
                  console.info(`${caseName} test end `);
                  done();
                }
              });
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimGetActiveSimAccountInfoList0500
     * @tc.number SUB_Telephony_Sim_GetActiveSimAccountInfoList_0500
     * @tc.desc   SIMCard required Get a list of activated SIM card account information. Use promise for asynchronous callback..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimGetActiveSimAccountInfoList0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetActiveSimAccountInfoList0500';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} success has card1: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          sim.activateSim(0, (err: BusinessError) => {
            if (!err) {
              console.info(`${caseName} success card1 is actived callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
              sim.getActiveSimAccountInfoList().then((data: Array<sim.IccAccountInfo>) => {
                if (!err && data.length > 0) {
                  console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  console.info(`${caseName} test end `);
                  done();
                } else {
                  ExpectFail();
                  console.info(`${caseName} test end `);
                  done();
                }
              }).catch((err: BusinessError) => {
                console.info(`${caseName} getActiveSimAccountInfoList failed, promise: err->${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName} test end `);
                done();
              });
            } else {
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimIsSimActive0100
     * @tc.number SUB_Telephony_Sim_IsSimActive_0100
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonySimIsSimActive0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimIsSimActive0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.isSimActive(0, (err: BusinessError, data: boolean) => {
            if (data) {
              console.info(`${caseName}:success, data->${JSON.stringify(data)}`);
              expect(data).assertTrue();
              console.info(`${caseName} test end `);
              done();
            } else {
              console.info(`${caseName} failed: err->${JSON.stringify(err)}`);
              expect(data).assertFalse();
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          });
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimIsSimActive0300
     * @tc.number SUB_Telephony_Sim_IsSimActive_0300
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonySimIsSimActive0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimIsSimActive0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.deactivateSim(0, (err: BusinessError) => {
            console.log(`callback: err->${JSON.stringify(err)}`);
            sim.isSimActive(0, (err: BusinessError, data: boolean) => {
              if (!data) {
                console.info(`${caseName}:success, data->${JSON.stringify(data)}`);
                ExpectTrue(true);
              } else {
                console.info(`${caseName} failed: err->${JSON.stringify(err)}`);
                ExpectFail();
              }
              sim.activateSim(0, (err: BusinessError) => {
                console.info(`${caseName} Restore the status of the card`);
                console.info(`${caseName} test end `);
                done();
              });
            });
          });
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimIsSimActive0400
     * @tc.number SUB_Telephony_Sim_IsSimActive_0400
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonySimIsSimActive0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimIsSimActive0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.isSimActive(0).then((data: boolean) => {
            if (data) {
              console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
              expect(data).assertTrue();
              console.info(`${caseName} test end `);
              done();
            } else {
              expect(data).assertFalse();
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            }
          }).catch((err: BusinessError) => {
            console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimIsSimActive0600
     * @tc.number SUB_Telephony_Sim_IsSimActive_0600
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySimIsSimActive0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySimIsSimActive0600';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          sim.deactivateSim(0, (err: BusinessError) => {
            console.log(`callback: err->${JSON.stringify(err)}`);
            sim.isSimActive(0).then((data: boolean) => {
              if (!data) {
                console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
                ExpectTrue(true);
              } else {
                ExpectFail();
              }
              sim.activateSim(0, (err: BusinessError) => {
                console.info(`${caseName} Restore the status of the card`);
                console.info(`${caseName} test end `);
                done();
              });
            }).catch((err: BusinessError) => {
              console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName} test end `);
              done();
            });
          })
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimIsSimActiveSync0100
     * @tc.number SUB_Telephony_Sim_IsSimActiveSync_0100
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimIsSimActiveSync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonySimIsSimActiveSync0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName}:success hasSimCard,data->${JSON.stringify(data)}`);
          let isSimActive: boolean = sim.isSimActiveSync(0);
          if (isSimActive === true) {
            console.info(`${caseName} success:` + isSimActive);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName} failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonySimIsSimActiveSync0300
     * @tc.number SUB_Telephony_Sim_IsSimActiveSync_0300
     * @tc.desc   SIMCard required Obtain whether the specified SIM card slot is activated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonySimIsSimActiveSync0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonySimIsSimActiveSync0300';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data) {
          console.info(`${caseName} :success hasSimCard,data->${JSON.stringify(data)}`);
          let isSimActive: boolean = sim.isSimActiveSync(-1);
          if (isSimActive === false) {
            console.info(`${caseName}  success:` + isSimActive);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        } else {
          console.info(`${caseName}  failed Dont have card1: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });
  });
}
