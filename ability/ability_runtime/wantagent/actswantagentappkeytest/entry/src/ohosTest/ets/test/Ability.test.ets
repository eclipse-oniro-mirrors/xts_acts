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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import { Want, WantAgent, wantAgent, wantConstant } from '@kit.AbilityKit';
import { systemParameterEnhance } from '@kit.BasicServicesKit';
import Utils from '../common/Utils'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';

export default function abilityTest() {

  describe('ActsAbilityTest', () => {
    afterEach(async (done: Function)=>{
      await Utils.sleep(500);
      let Delegator = AbilityDelegatorRegistry.getAbilityDelegator();
        Delegator.startAbility(
            {
                bundleName: 'com.example.wantagentappkeytest',
                abilityName: 'TestAbility'
            },()=> {
            console.log("====>ActsAbilityTest afterEach end====>");
        })
      await Utils.sleep(500);
      done();
    })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_wantAgent_Multiton_0100
     * @tc.number SUB_Ability_AbilityRuntime_wantAgent_Multiton_0100
     * @tc.desc   Start Ability by WantAgent default parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_wantAgent_Multiton_0100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_wantAgent_Multiton_0100';
      console.info(`${caseName} Begin`);
      let wantAgentData: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.acts.startbywantagent',
            abilityName: 'EntryAbility',
            moduleName: "entry",
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };

      await wantAgent.getWantAgent(wantAgentInfo)
        .then(async (data) => {
          wantAgentData = data;
          console.info(`${caseName} getWantAgent succes!!!!`);
          let triggerInfo: wantAgent.TriggerInfo = {
            code: 0
          };
          wantAgent.trigger(wantAgentData, triggerInfo,
            (err: BusinessError, data: wantAgent.CompleteData) => {
              if (err) {
                console.error(`${caseName} trigger fail, error:${JSON.stringify(err)}`);
                expect().assertFail();
                done();
              } else {
                console.info(`${caseName} trigger success, data:${JSON.stringify(data)}`);
                expect(data.finalCode).assertEqual(0);
                done();
              }
            });
            await Utils.sleep(500);
        }).catch((err: BusinessError) => {
          console.error(`${caseName} getWantAgent fail, error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      console.info(`${caseName} End`);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_wantAgent_Multiton_0200
     * @tc.number SUB_Ability_AbilityRuntime_wantAgent_Multiton_0200
     * @tc.desc   Start Ability by WantAgent 'app_instance_0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_wantAgent_Multiton_0200', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_wantAgent_Multiton_0200';
      console.info(`${caseName} Begin`);
      let wantAgentData: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.acts.startbywantagent',
            abilityName: 'EntryAbility',
            moduleName: "entry",
            parameters:
            {
              [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_0",
            }
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      wantAgent.getWantAgent(wantAgentInfo)
        .then(async (data) => {
          wantAgentData = data;
          console.info(`${caseName} getWantAgent succes!!!!`);
          let triggerInfo: wantAgent.TriggerInfo = {
            code: 0
          };
          await Utils.sleep(2000);
          wantAgent.trigger(wantAgentData, triggerInfo,
            (err: BusinessError, data: wantAgent.CompleteData) => {
              if (err) {
                console.error(`${caseName} trigger fail, error:${JSON.stringify(err)}`);
                expect().assertFail();
                done();
              } else {
                console.info(`${caseName} trigger success, data:${JSON.stringify(data)}`);
                expect(data.finalCode == 0).assertTrue();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} getWantAgent fail, error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      console.info(`${caseName} End`);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_wantAgent_Multiton_0300
     * @tc.number SUB_Ability_AbilityRuntime_wantAgent_Multiton_0300
     * @tc.desc   Start Ability by WantAgent 'app_instance_0' and 'START_ABILITIES'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_wantAgent_Multiton_0300', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_wantAgent_Multiton_0300';
      console.info(`${caseName} Begin`);
      let wantAgentData: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.acts.startbywantagent',
            abilityName: 'EntryAbility',
            moduleName: "entry",
            parameters:
            {
              [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_0",
            }
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITIES,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };

      wantAgent.getWantAgent(wantAgentInfo)
        .then(async (data) => {
          wantAgentData = data;
          console.info(`${caseName} getWantAgent succes!!!!`);
          let triggerInfo: wantAgent.TriggerInfo = {
            code: 0
          };
          await Utils.sleep(2000);
          wantAgent.trigger(wantAgentData, triggerInfo,
            (err: BusinessError, data: wantAgent.CompleteData) => {
              if (err) {
                console.error(`${caseName} trigger fail, error:${JSON.stringify(err)}`);
                expect().assertFail();
                done();
              } else {
                console.info(`${caseName} trigger success, data:${JSON.stringify(data)}`);
                expect(data.finalCode == 0).assertTrue();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} getWantAgent fail, error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      console.info(`${caseName} End`);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_wantAgent_Multiton_0400
     * @tc.number SUB_Ability_AbilityRuntime_wantAgent_Multiton_0400
     * @tc.desc   Start Ability by WantAgent 'app_instance_10' and 'START_ABILITIES'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_wantAgent_Multiton_0400', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_wantAgent_Multiton_0400';
      console.info(`${caseName} Begin`);
      let wantAgentData: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.acts.startbywantagent',
            abilityName: 'EntryAbility',
            moduleName: "entry",
            parameters:
            {
              [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_10",
            }
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITIES,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };

      wantAgent.getWantAgent(wantAgentInfo)
        .then(async(data) => {
          wantAgentData = data;
          console.info(`${caseName} getWantAgent succes!!!!`);
          let triggerInfo: wantAgent.TriggerInfo = {
            code: 0
          };
          await Utils.sleep(2000);
          wantAgent.trigger(wantAgentData, triggerInfo,
            (err: BusinessError, data: wantAgent.CompleteData) => {
              if (err) {
                console.error(`${caseName} trigger fail, error:${JSON.stringify(err)}`);
                expect().assertFail();
                done();
              } else {
                console.info(`${caseName} trigger success, data:${JSON.stringify(data)}`);
                expect(data.finalCode == 0).assertTrue();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} getWantAgent fail, error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      console.info(`${caseName} End`);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_wantAgent_Multiton_0500
     * @tc.number SUB_Ability_AbilityRuntime_wantAgent_Multiton_0500
     * @tc.desc   Start ServiceExtensionAbility by WantAgent 'app_instance_2' and 'START_SERVICE'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_wantAgent_Multiton_0500', Level.LEVEL0, async (done: Function) => {
      let mpEnable: string = '';
      mpEnable = systemParameterEnhance.getSync('const.abilityms.support_multi_instance', 'false');
      console.log(`support_multi_instance get system parameter mpEnable is ${mpEnable}`);
      if (mpEnable === 'true') {
        let caseName: string = 'SUB_Ability_AbilityRuntime_wantAgent_Multiton_0500';
        console.info(`${caseName} Begin`);
        let wantAgentData: WantAgent;
        let wantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              bundleName: 'com.acts.startbywantagent',
              abilityName: 'ServiceExtAbility',
              type: "service",
              moduleName: "entry",
              parameters:
              {
                [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_2",
              }
            } as Want
          ],
          actionType: wantAgent.OperationType.START_SERVICE,
          requestCode: 0,
          wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        };
        wantAgent.getWantAgent(wantAgentInfo)
          .then(async (data) => {
            wantAgentData = data;
            console.info(`${caseName} getWantAgent succes!!!!`);
            let triggerInfo: wantAgent.TriggerInfo = {
              code: 0
            };
            await Utils.sleep(2000);
            wantAgent.trigger(wantAgentData, triggerInfo,
              (err: BusinessError, data: wantAgent.CompleteData) => {
                if (err) {
                  console.error(`${caseName} trigger fail, error:${JSON.stringify(err)}`);
                  expect().assertFail();
                } else {
                  console.info(`${caseName} trigger success, data:${JSON.stringify(data)}`);
                  expect(data.finalCode).assertEqual(0);
                  done();
                }
              });
          }).catch((err: BusinessError) => {
            console.error(`${caseName} getWantAgent fail, error: ${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          });
        console.info(`${caseName} End`);
      } else if (mpEnable === 'false') {
        console.error(`error, current device not support wantAgent.trigger, please check: ${JSON.stringify(mpEnable)}`);
        done();
      } else {
        console.error(`error, current device get config fail, please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_wantAgent_Multiton_0600
     * @tc.number SUB_Ability_AbilityRuntime_wantAgent_Multiton_0600
     * @tc.desc   Compare result of WantAgent member function before and after trigger with 'app_instance_0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_wantAgent_Multiton_0600', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_wantAgent_Multiton_0600';
      console.info(`${caseName} Begin`);
      let wantAgentData: WantAgent;
      let wantAgentDataEnd: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.acts.startbywantagent',
            abilityName: 'EntryAbility',
            moduleName: "entry",
            parameters:
            {
              [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_0",
            }
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };

      let BundleNameBefore: string = '';
      let UidBefore: string = '';
      let OperationTypeBefore: string = '';
      let wantBefore: string = '';
      wantAgent.getWantAgent(wantAgentInfo)
        .then(async (data) => {
          wantAgentData = data;
          console.info(`${caseName} getWantAgent succes!!!!`);
          if (wantAgentData) {
            console.info(`${caseName} wantAgentData is ${JSON.stringify(wantAgentData)}`);
            await wantAgent.getWant(wantAgentData).then((data) => {
              console.info(`${caseName} getWantBefore success ${JSON.stringify(data)}`);
              wantBefore = JSON.stringify(data);
            });
            await wantAgent.getBundleName(wantAgentData).then((data) => {
              console.info(`${caseName} getBundleNameBefore success ${data}`);
              BundleNameBefore = data;
            });
            await wantAgent.getUid(wantAgentData).then((data) => {
              console.info(`${caseName} getUidBefore success ${data.toString()}`);
              UidBefore = data.toString();
            });
            await wantAgent.getOperationType(wantAgentData).then((data) => {
              console.info(`${caseName} getOperationTypeBefore success ${data.toString()}`);
              OperationTypeBefore = data.toString();
            });
          }
          let triggerInfo: wantAgent.TriggerInfo = {
            code: 0
          };
          wantAgent.trigger(wantAgentData, triggerInfo,
            (err: BusinessError, data: wantAgent.CompleteData) => {
              if (err) {
                console.error(`${caseName} trigger fail, error:${JSON.stringify(err)}`);
                expect().assertFail();
                done();
              } else {
                console.info(`${caseName} trigger success, data:${JSON.stringify(data)}`);
                wantAgent.getWantAgent(wantAgentInfo)
                  .then(async (data) => {
                    wantAgentDataEnd = data;
                    console.info(`${caseName} getWantAgentAfter succes!!!! ${JSON.stringify(data)}`);
                    if (wantAgentDataEnd) {
                      await wantAgent.getWant(wantAgentData).then((data) => {
                        console.info(`${caseName} getwantAfter success ${JSON.stringify(data)}`);
                        expect(JSON.stringify(data)).assertEqual(wantBefore);
                      });
                      await wantAgent.getBundleName(wantAgentDataEnd).then((data) => {
                        console.info(`${caseName} getBundleNameAfter success ${data}`);
                        expect(data).assertEqual(BundleNameBefore);
                      });
                      await wantAgent.getUid(wantAgentDataEnd).then((data) => {
                        console.info(`${caseName} getUidAfter success ${data.toString()}`);
                        expect(data.toString()).assertEqual(UidBefore);
                      });
                      await wantAgent.getOperationType(wantAgentDataEnd).then((data) => {
                        console.info(`${caseName} getOperationTypeAfter success ${data.toString()}`);
                        expect(data.toString()).assertEqual(OperationTypeBefore);
                      });
                      await wantAgent.equal(wantAgentData, wantAgentDataEnd).then((data) => {
                        console.info(`${caseName} isequal: ${data}`);
                        expect(data).assertTrue();
                      });
                      done();
                    } else {
                      console.info(`${caseName} wantAgentDataEnd empty`);
                      expect().assertFail()
                      done();
                    }
                  }).catch((err: BusinessError) => {
                    console.error(`${caseName} getWantAgent fail, error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                  });
              }
            });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} getWantAgent fail, error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      console.info(`${caseName} End`);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_wantAgent_Multiton_0700
     * @tc.number SUB_Ability_AbilityRuntime_wantAgent_Multiton_0700
     * @tc.desc   Compare result of WantAgent member function before and after trigger with 'app_instance_0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_wantAgent_Multiton_0700', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_wantAgent_Multiton_0700';
      console.info(`${caseName} Begin`);
      let wantAgentData: WantAgent;
      let wantAgentDataEnd: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            bundleName: 'com.acts.startbywantagent',
            abilityName: 'EntryAbility',
            moduleName: "entry",
            parameters:
            {
              [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_10",
            }
          } as Want
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };

      let BundleNameBefore: string = '';
      let UidBefore: string = '';
      let OperationTypeBefore: string = '';
      let wantBefore: string = '';
      wantAgent.getWantAgent(wantAgentInfo)
        .then(async (data) => {
          wantAgentData = data;
          console.info(`${caseName} getWantAgent succes!!!!`);

          if (wantAgentData) {
            console.info(`${caseName} wantAgentData is ${JSON.stringify(wantAgentData)}`);
            await wantAgent.getWant(wantAgentData).then((data) => {
              console.info(`${caseName} getWantBefore success ${JSON.stringify(data)}`);
              wantBefore = JSON.stringify(data);
            });
            await wantAgent.getBundleName(wantAgentData).then((data) => {
              console.info(`${caseName} getBundleNameBefore success ${data}`);
              BundleNameBefore = data;
            });
            await wantAgent.getUid(wantAgentData).then((data) => {
              console.info(`${caseName} getUidBefore success ${data.toString()}`);
              UidBefore = data.toString();
            });
            await wantAgent.getOperationType(wantAgentData).then((data) => {
              console.info(`${caseName} getOperationTypeBefore success ${data.toString()}`);
              OperationTypeBefore = data.toString();
            });
          }
          let triggerInfo: wantAgent.TriggerInfo = {
            code: 0
          };
          wantAgent.trigger(wantAgentData, triggerInfo,
            (err: BusinessError, data: wantAgent.CompleteData) => {
              if (err) {
                console.error(`${caseName} trigger fail, error:${JSON.stringify(err)}`);
                expect().assertFail();
                done();
              } else {
                console.info(`${caseName} trigger success, data:${JSON.stringify(data)}`);
                wantAgent.getWantAgent(wantAgentInfo)
                  .then(async (data) => {
                    wantAgentDataEnd = data;
                    console.info(`${caseName} getWantAgentAfter succes!!!! ${JSON.stringify(data)}`);

                    if (wantAgentDataEnd) {
                      await wantAgent.getWant(wantAgentData).then((data) => {
                        console.info(`${caseName} getwantAfter success ${JSON.stringify(data)}`);
                        expect(JSON.stringify(data)).assertEqual(wantBefore);
                      });
                      await wantAgent.getBundleName(wantAgentDataEnd).then((data) => {
                        console.info(`${caseName} getBundleNameAfter success ${data}`);
                        expect(data).assertEqual(BundleNameBefore);
                      });
                      await wantAgent.getUid(wantAgentDataEnd).then((data) => {
                        console.info(`${caseName} getUidAfter success ${data.toString()}`);
                        expect(data.toString()).assertEqual(UidBefore);
                      });
                      await wantAgent.getOperationType(wantAgentDataEnd).then((data) => {
                        console.info(`${caseName} getOperationTypeAfter success ${data.toString()}`);
                        expect(data.toString()).assertEqual(OperationTypeBefore);
                      });
                      await wantAgent.equal(wantAgentData, wantAgentDataEnd).then((data) => {
                        console.info(`${caseName} isequal: ${data}`);
                        expect(data).assertTrue();
                      });

                      done();
                    } else {
                      console.info(`${caseName} wantAgentDataEnd empty`);
                      expect().assertFail()
                      done();
                    }
                  }).catch((err: BusinessError) => {
                    console.error(`${caseName} getWantAgent fail, error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                  });
              }
            });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} getWantAgent fail, error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      console.info(`${caseName} End`);
    })
  })
}