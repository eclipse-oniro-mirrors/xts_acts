/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import { Want, WantAgent, wantAgent, } from '@kit.AbilityKit';


let wantAgentData: WantAgent;
let wantAgentInfo1: wantAgent.WantAgentInfo = {
  wants: [
    {
      bundleName: 'com.example.getwantagentwithuserid',
      abilityName: 'EntryAbility',
    } as Want
  ],
  actionType: wantAgent.OperationType.START_ABILITY,
  requestCode: 0,
  wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
  userId: 100
};
let wantAgentInfo2: wantAgent.WantAgentInfo = {
  wants: [
    {
      bundleName: 'com.example.myapplication2',
      abilityName: 'TestAbility',
      moduleName: 'entry',
    } as Want
  ],
  actionType: wantAgent.OperationType.START_ABILITY,
  requestCode: 0,
  wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
  userId: 101
};
let testTag: string = 'testTag';

export default function getWantAgentWithUserIdTest() {
  describe('getWantAgentWithUserIdTest', () => {
    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0100
     * @tc.name      SUB_Ability_GetWantAgent_Test_0100
     * @tc.desc      test GetWantAgent promise with userID 100 success
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0100", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0100';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      wantAgent.getWantAgent(wantAgentInfo1).then((data) => {
        wantAgentData = data;
        hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
        if (wantAgentData) {
          wantAgent.getBundleName(wantAgentData).then((bundleNameData) => {
            hilog.info(0x0000, testTag,
              `${TEST_CASE_NAME} getBundleName success, data ${JSON.stringify(bundleNameData)}`);
            expect(bundleNameData).assertEqual('com.example.getwantagentwithuserid');
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getBundleName failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            expect().assertFail();
          });
          wantAgent.getUid(wantAgentData).then((uidData) => {
            hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getUid success, data ${JSON.stringify(uidData)}`);
            expect(uidData).assertLarger(0);
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getUid failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            expect().assertFail();
          });
          wantAgent.getOperationType(wantAgentData).then((operationTypeData) => {
            expect(operationTypeData).assertEqual(1);
            hilog.info(0x0000, testTag,
              `${TEST_CASE_NAME} getOperationType success, data ${JSON.stringify(operationTypeData)}`);
            done();
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getOperationType failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            expect().assertFail();
            done();
          });
        } else {
          hilog.error(0x0000, testTag,
            `${TEST_CASE_NAME} getWant is null`);
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect().assertFail();
        done();
      });
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} End`);
    })

    /**
     * @tc.number SUB_Ability_GetWantAgent_Test_0200
     * @tc.name SUB_Ability_GetWantAgent_Test_0200
     * @tc.desc test GetWantAgent CallBack with userID success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0200", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0200';
      wantAgent.getWantAgent(wantAgentInfo1, (err: BusinessError, data: WantAgent) => {
        if (err) {
          hilog.error(0x0000, TEST_CASE_NAME, `getWantAgentCallback failed! ${err.code} ${err.message}`);
          expect().assertFail();
          done();
        } else {
          wantAgentData = data;
          hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
          if (wantAgentData) {
            wantAgent.getBundleName(wantAgentData).then((bundleNameData) => {
              hilog.info(0x0000, testTag,
                `${TEST_CASE_NAME} getBundleName success, data ${JSON.stringify(bundleNameData)}`);
              expect(bundleNameData).assertEqual('com.example.getwantagentwithuserid');
              done();
            }).catch((err: BusinessError) => {
              hilog.error(0x0000, testTag,
                `${TEST_CASE_NAME} getBundleName failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
              expect().assertFail();
              done();
            });
            wantAgent.getUid(wantAgentData).then((uidData) => {
              hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getUid success, data ${JSON.stringify(uidData)}`);
              expect(uidData).assertLarger(0);
            }).catch((err: BusinessError) => {
              hilog.error(0x0000, testTag,
                `${TEST_CASE_NAME} getUid failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
              expect().assertFail();
            });
            wantAgent.getOperationType(wantAgentData).then((operationTypeData) => {
              hilog.info(0x0000, testTag,
                `${TEST_CASE_NAME} getOperationType success, data ${JSON.stringify(operationTypeData)}`);
              expect(operationTypeData).assertEqual(1);
              done();
            }).catch((err: BusinessError) => {
              hilog.error(0x0000, testTag,
                `${TEST_CASE_NAME} getOperationType failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
              expect().assertFail();
              done();
            });
          } else {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getWant is null`);
            expect().assertFail();
            done();
          }
        }
      })
    })
    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0300
     * @tc.name      SUB_Ability_GetWantAgent_Test_0300
     * @tc.desc      test GetWantAgent promise  with not contain userID
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0300", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0300';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      wantAgent.getWantAgent(wantAgentInfo1).then((data) => {
        hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
        if (wantAgentData) {
          wantAgent.getBundleName(wantAgentData).then((bundleNameData) => {
            hilog.info(0x0000, testTag,
              `${TEST_CASE_NAME} getBundleName success, data ${JSON.stringify(bundleNameData)}`);
            expect(bundleNameData).assertEqual('com.example.getwantagentwithuserid');
            done();
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getBundleName failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            expect().assertFail();
            done();
          });
          wantAgent.getUid(wantAgentData).then((uidData) => {
            hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getUid success, data ${JSON.stringify(uidData)}`);
            expect(uidData).assertLarger(0);
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getUid failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            expect().assertFail();
          });
          wantAgent.getOperationType(wantAgentData).then((operationTypeData) => {
            hilog.info(0x0000, testTag,
              `${TEST_CASE_NAME} getOperationType success, data ${JSON.stringify(operationTypeData)}`);
            expect(operationTypeData).assertEqual(1);
            done();
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getOperationType failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            expect().assertFail();
            done();
          });
        } else {
          hilog.error(0x0000, testTag,
            `${TEST_CASE_NAME} getWant is null`);
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect().assertFail();
        done();
      });
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} End`);
    })
    /**
     * @tc.number   SUB_Ability_GetWantAgent_Test_0400
     * @tc.name     SUB_Ability_GetWantAgent_Test_0400
     * @tc.desc     test GetWantAgent callback  with not contain userID
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0400", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0400';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      wantAgent.getWantAgent(wantAgentInfo1, (err: BusinessError, data: WantAgent) => {
        if (err) {
          hilog.error(0x0000, testTag,
            `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          expect().assertFail();
          done();
        } else {
          hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
          if (wantAgentData) {
            wantAgent.getBundleName(wantAgentData).then((bundleNameData) => {
              hilog.info(0x0000, testTag,
                `${TEST_CASE_NAME} getBundleName success, data ${JSON.stringify(bundleNameData)}`);
              expect(bundleNameData).assertEqual('com.example.getwantagentwithuserid');
              done();
            }).catch((err: BusinessError) => {
              hilog.error(0x0000, testTag,
                `${TEST_CASE_NAME} getBundleName failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
              expect().assertFail();
              done();
            });
            wantAgent.getUid(wantAgentData).then((uidData) => {
              hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getUid success, data ${JSON.stringify(uidData)}`);
              expect(uidData).assertLarger(0);
            }).catch((err: BusinessError) => {
              hilog.error(0x0000, testTag,
                `${TEST_CASE_NAME} getUid failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
              expect().assertFail();
            });
            wantAgent.getOperationType(wantAgentData).then((operationTypeData) => {
              hilog.info(0x0000, testTag,
                `${TEST_CASE_NAME} getOperationType success, data ${JSON.stringify(operationTypeData)}`);
              expect(operationTypeData).assertEqual(1);
              done();
            }).catch((err: BusinessError) => {
              hilog.error(0x0000, testTag,
                `${TEST_CASE_NAME} getOperationType failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
              expect().assertFail();
              done();
            });
          } else {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getWant is null`);
            expect().assertFail();
            done();
          }
        }
      })
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} End`);
    })

    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0500
     * @tc.name      SUB_Ability_GetWantAgent_Test_0500
     * @tc.desc      test GetWantAgent promise with userID -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0500", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0500';
      let wantAgentInfo1: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.getwantagentwithuserid',
            abilityName: 'EntryAbility',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
        userId: -1
      };
      wantAgent.getWantAgent(wantAgentInfo1).then((data) => {
        hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
        if (wantAgentData) {
          wantAgent.getBundleName(wantAgentData).then((bundleNameData) => {
            hilog.info(0x0000, testTag,
              `${TEST_CASE_NAME} getBundleName success, data ${JSON.stringify(bundleNameData)}`);
            expect(bundleNameData).assertEqual('com.example.getwantagentwithuserid');
            done();
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getBundleName failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            expect().assertFail();
            done();
          });
          wantAgent.getUid(wantAgentData).then((uidData) => {
            hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getUid success, data ${JSON.stringify(uidData)}`);
            expect(uidData).assertLarger(0);
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getUid failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            expect().assertFail();
          });
          wantAgent.getOperationType(wantAgentData).then((operationTypeData) => {
            hilog.info(0x0000, testTag,
              `${TEST_CASE_NAME} getOperationType success, data ${JSON.stringify(operationTypeData)}`);
            expect(operationTypeData).assertEqual(1);
            done();
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getOperationType failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            expect().assertFail();
            done();
          });
        } else {
          hilog.error(0x0000, testTag,
            `${TEST_CASE_NAME} getWant is null`);
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect().assertFail();
        done();
      });
    })

    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0600
     * @tc.name      SUB_Ability_GetWantAgent_Test_0600
     * @tc.desc      test GetWantAgent promise with third-party applications use the package names
     * of other applications return errcode 16000151
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("SUB_Ability_GetWantAgent_Test_0600", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0600';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      wantAgent.getWantAgent(wantAgentInfo2).then((data) => {
        hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect(err.code).assertEqual(16000151);
        expect(err.message).assertEqual('Invalid wantAgent object.');
        done();
      });
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} End`);
    })
    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0700
     * @tc.name      SUB_Ability_GetWantAgent_Test_0700
     * @tc.desc      test GetWantAgent CallBack with third-party applications use the package names
     * of other applications return errcode 16000151
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("SUB_Ability_GetWantAgent_Test_0700", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0700';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      wantAgent.getWantAgent(wantAgentInfo2, (err: BusinessError, data: WantAgent) => {
        if (err) {
          hilog.error(0x0000, testTag,
            `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          expect(err.code).assertEqual(16000151);
          expect(err.message).assertEqual('Invalid wantAgent object.');
          done();
        } else {
          wantAgentData = data;
          hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        }
      })
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} End`);
    })
    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0800
     * @tc.name      SUB_Ability_GetWantAgent_Test_0800
     * @tc.desc      test GetWantAgent promise with userID undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0800", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0800';
      let wantAgentInfo1: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.example.getwantagentwithuserid',
            abilityName: 'EntryAbility',
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
        userId: undefined
      };
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME}  wantAgentInfo1 ${JSON.stringify(wantAgentInfo1)}`);
      try {
        wantAgent.getWantAgent(wantAgentInfo1).then((data) => {
          hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
          wantAgentData = data;
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, testTag,
            `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          expect().assertFail();
          done();
        });
      } catch (e) {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME}  catch, code: ${JSON.stringify(e.code)}, message: ${JSON.stringify(e.message)}`);
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual('Parameter error! Info must be a WantAgentInfo.');
        done();
      }
    })
  })
}