/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, afterEach, beforeAll, it, expect, Level } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import hilog from '@ohos.hilog';
import { Driver, ON } from '@ohos.UiTest';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import commonEventManager from '@ohos.commonEventManager'
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import bundle from '@ohos.bundle.bundleManager';

let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
let targetVersion: number = 12;
export default function StartAbilityForResultTest() {
  describe('StartAbilityForResultTest', () => {

    let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityName = 'SecondAbility';
    let driver = Driver.create();

    beforeAll((done: Function) => {
      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then(data => {
        console.info('getBundleInfoForSelf' + JSON.stringify(data));
        targetVersion = data.targetVersion;
        console.info('getBundleInfoForSelf targetVersion=' + targetVersion);
        done();
      }).catch((err: BusinessError) => {
        console.info('getBundleInfoForSelf fail' + JSON.stringify(err));
        console.info('getBundleInfoForSelf fail targetVersion=' + targetVersion);
        done();
      })
    });

    afterEach((done:Function) => {
      console.log('StartAbilityForResultTest afterEach start');
      setTimeout(() => {
        console.log('StartAbilityForResultTest afterEach end');
        done();
      }, 1000);
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2400
     * @tc.name   : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2400
     * @tc.desc   : The input parameter 'want' is empty, Call the startAbility interface through context, and
     *                 validate the want input parameter as {}
     * @tc.level  : Level 3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2400', Level.LEVEL3, async (done: Function) => {
      const TAG = 'StartAbility';
      const TEST_SUITE_NAME: string = 'StartAbilityTest';
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2400';

      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      try {
        await globalThis.abilityDelegator.startAbility({}).then(() => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          expect().assertFail();
          done();
        }).catch((error:BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${error}`);
          expect(error.code == undefined).assertFalse();
          if (targetVersion >= 20) {
            expect(error.code).assertEqual(16000001);
          } else {
            expect(error.code).assertEqual(2097152);
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} end`);
          done();
        })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
        done();
      }
    });


    /**
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2600
     * @tc.name : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2600
     * @tc.desc : The input parameter 'want' is undefined, Call the startAbility interface through context, with
     *                 want as undefined
     * @tc.level  : Level 3
     * @tc.size : MediumTest
     * @tc.type : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2600', Level.LEVEL3, async (done: Function) => {
      const TAG = 'StartAbility';
      const TEST_SUITE_NAME: string = 'StartAbilityTest';
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2600';

      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      try {
        await globalThis.abilityDelegator.startAbility(undefined).then(() => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          expect().assertFail();
          done();
        }).catch((error:BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${error}`);
          expect(error.code == undefined).assertFalse();
          if (targetVersion >= 20) {
            expect(error.code).assertEqual(16000001);
          } else {
            expect(error.code).assertEqual(2097152);
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} end`);
          done();
        })
      } catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
        done();
      }
    });


    /**
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2700
     * @tc.name   : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2700
     * @tc.desc   : BundleName and activityName are both correct values, By calling the startAbility interface
     *                 through context,
     *                 both the wantAbilityName and bundleName parameters are correct values
     * @tc.level  : Level 3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2700', Level.LEVEL3, async (done: Function) => {
      const TAG = 'StartAbility';
      const TEST_SUITE_NAME: string = 'StartAbilityTest';
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2700';

      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let lifeMethodCalledCount = 0;

      //onCreate回调
      let onCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(1);
      }

      //onWindowStageCreate回调
      let onWindowStageCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(2);
      }

      //onForeground的回调
      let onForegroundCallback = async ():Promise<void> => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(3);
        await delegator.removeAbilityMonitor(monitor).then((data) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(data)}`);
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} end`);
          done();
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(err.message)}`);
          expect().assertFail();
          done();
        })
      }

      //设置监听器,监听新ability的生命周期函数
      let monitor:AbilityDelegatorRegistry.AbilityMonitor ={
        abilityName: abilityName,
        onAbilityCreate: onCreateCallback,
        onWindowStageCreate: onWindowStageCreateCallback,
        onAbilityForeground: onForegroundCallback,
      };
      delegator.addAbilityMonitor(monitor, (async (err, result) => {
        let want:Want = {
          bundleName: 'com.example.mytest1',
          abilityName: abilityName,
        }
        try {
          await delegator.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err:BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      }))
    });


    /**
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2800
     * @tc.name   : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2800
     * @tc.desc   : BundleName is the correct value, activityName is the incorrect value, Call the startAbility
     *                 interface through context, where the wantBundleName
     *                 parameter is the correct value and the activityName parameter is the incorrect value
     * @tc.level  : Level 3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2800', Level.LEVEL3, async (done: Function) => {
      const TAG = 'StartAbility';
      const TEST_SUITE_NAME: string = 'StartAbilityTest';
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2800';

      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let want:Want = {
        // 'abilityName': 'SecondAbility',
        'abilityName': 'X',
        'bundleName': 'com.example.mytest1',
      };
      try {
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
        await delegator.startAbility(want).then(async () => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          if (targetVersion >= 20) {
            expect(err.code).assertEqual(16000001);
          } else {
            expect(err.code).assertEqual(2097152);
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} end`);
          done();
        })
      }
      catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2900
     * @tc.name   : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2900
     * @tc.desc   : AbilityName is the correct value, bundleName is the incorrect value, Call the startAbility
     *                 interface through context, where the wantAbilityName
     *                 parameter is the correct value and the bundleName parameter is the incorrect value
     * @tc.level  : Level 3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2900', Level.LEVEL3, async (done: Function) => {
      const TAG = 'StartAbility';
      const TEST_SUITE_NAME: string = 'StartAbilityTest';
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2900';

      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let want:Want = {
        'abilityName': 'SecondAbility',
        // 'bundleName': 'com.example.mytest1',
        'bundleName': 'xxx',
      };
      try {
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
        await delegator.startAbility(want).then(async () => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          if (targetVersion >= 20) {
            expect(err.code).assertEqual(16000001);
          } else {
            expect(err.code).assertEqual(2097152);
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} end`);
          done();
        })
      }
      catch (err) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3000
     * @tc.name   : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3000
     * @tc.desc   : Call the startAbility interface through context, where the wantAbilityName
     *                 and bundleName are the correct values, and deviceid is undefined
     * @tc.level  : Level 3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3000', Level.LEVEL3, async (done: Function) => {

      const TAG = 'StartAbility';
      const TEST_SUITE_NAME: string = 'StartAbilityTest';
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3000';

      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let lifeMethodCalledCount = 0;

      //onCreate回调
      let onCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(1);
      }
      //onWindowStageCreate回调
      let onWindowStageCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(2);
      }
      //onForeground回调
      let onForegroundCallback = async ():Promise<void> => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(3);
        await delegator.removeAbilityMonitor(monitor).then((data) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(data)}`);
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} end`);
          done();
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(err.message)}`);
          expect().assertFail();
          done();
        })
      }

      //设置监听器,监听新ability的生命周期函数
      let monitor:AbilityDelegatorRegistry.AbilityMonitor ={
        abilityName: abilityName,
        onAbilityCreate: onCreateCallback,
        onWindowStageCreate: onWindowStageCreateCallback,
        onAbilityForeground: onForegroundCallback
      };
      delegator.addAbilityMonitor(monitor, (async (err, result) => {
        let want:Want = {
          bundleName: 'com.example.mytest1',
          abilityName: abilityName,
          deviceId: undefined
        }
        try {
          await delegator.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err:BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      }))
    });


    /**
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3100
     * @tc.name   : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3100
     * @tc.desc   : Configure bundleName, activityName, and uri, corresponding to the ability configured with uri,
     *                 Call the startAbility interface through context, where the wantAbilityName
     *                 and bundleName are the correct values,and the uri has a corresponding Ability
     * @tc.level  : Level 3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3100', Level.LEVEL3, async (done: Function) => {
      const TAG = 'StartAbility';
      const TEST_SUITE_NAME: string = 'StartAbilityTest';
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3100';

      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let lifeMethodCalledCount = 0;

      //onCreate回调
      let onCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(1);
      }
      //onWindowStageCreate回调
      let onWindowStageCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(2);
      }
      //onForeground回调
      let onForegroundCallback = async ():Promise<void> => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(3);
        await delegator.removeAbilityMonitor(monitor).then((data) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(data)}`);
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} end`);
          done();
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(err.message)}`);
          expect().assertFail();
          done();
        })
      }

      //设置监听器,监听新ability的生命周期函数
      let monitor:AbilityDelegatorRegistry.AbilityMonitor ={
        abilityName: abilityName,
        onAbilityCreate: onCreateCallback,
        onWindowStageCreate: onWindowStageCreateCallback,
        onAbilityForeground: onForegroundCallback
      };
      delegator.addAbilityMonitor(monitor, (async (err, result) => {
        let want:Want = {
          uri: "https://www.test.com:8080/query/student"
        }
        try {
          await delegator.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err:BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
        await driver.delayMs(2000);
        let cancel = await driver.findComponent(ON.text("label"));
        await cancel.click();
        if (deviceSupport === 'false') {
          await driver.delayMs(900);
          let cancel1 = await driver.findComponent(ON.text("仅此一次"));
          await cancel1.click();
        }
      }))
    });


    /**
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3200
     * @tc.name   : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3200
     * @tc.desc   : Configure bundleName, activityName, and flags with a correct flag value,
     *                 Call the startAbility interface through context, where the wantAbilityName
     *                 and bundleName are the correct values,and the flag is the correct value
     * @tc.level  : Level 3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3200', Level.LEVEL3, async (done: Function) => {

      const TAG = 'StartAbility';
      const TEST_SUITE_NAME: string = 'StartAbilityTest';
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3200';

      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let lifeMethodCalledCount = 0;

      //onCreate回调
      let onCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(1);
      }
      //onWindowStageCreate回调
      let onWindowStageCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(2);
      }
      //onForeground回调
      let onForegroundCallback = async ():Promise<void> => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(3);
        await delegator.removeAbilityMonitor(monitor).then((data) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(data)}`);
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} end`);
          done();
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(err.message)}`);
          expect().assertFail();
          done();
        })
      }

      //设置监听器,监听新ability的生命周期函数
      let monitor:AbilityDelegatorRegistry.AbilityMonitor = {
        abilityName: abilityName,
        onAbilityCreate: onCreateCallback,
        onWindowStageCreate: onWindowStageCreateCallback,
        onAbilityForeground: onForegroundCallback
      };
      delegator.addAbilityMonitor(monitor, (async (err, result) => {
        let want:Want = {
          bundleName: 'com.example.mytest1',
          abilityName: abilityName,
          // flags: 0x00000001
          flags: 0x00000002
        }
        try {
          await delegator.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err:BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      }))
    });


    /**
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3300
     * @tc.name   : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3300
     * @tc.desc   : Configure bundleName, activityName, and flags to match the two correct flag values,
     *                 Call the startAbility interface through context, where the wantAbilityName
     *                 and bundleName are the correct values,and the flag is the sum of the two correct flag values
     * @tc.level  : Level 3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3300', Level.LEVEL3, async (done: Function) => {

      const TAG = 'StartAbility';
      const TEST_SUITE_NAME: string = 'StartAbilityTest';
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3300';

      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let lifeMethodCalledCount = 0;

      //onCreate回调
      let onCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(1);
      }
      //onWindowStageCreate回调
      let onWindowStageCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(2);
      }
      //onForeground回调
      let onForegroundCallback = async ():Promise<void> => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(3);
        await delegator.removeAbilityMonitor(monitor).then((data) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(data)}`);
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} end`);
          done();
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(err.message)}`);
          expect().assertFail();
          done();
        })
      }

      let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      const abilityName = 'SecondAbility';
      const flag1 = 0x00000001;
      const flag2 = 0x00000002;
      //flag1或flag2
      const res = flag1 | flag2;

      //设置监听器,监听新ability的生命周期函数
      let monitor:AbilityDelegatorRegistry.AbilityMonitor ={
        abilityName: abilityName,
        onAbilityCreate: onCreateCallback,
        onWindowStageCreate: onWindowStageCreateCallback,
        onAbilityForeground: onForegroundCallback
      };
      delegator.addAbilityMonitor(monitor, (async (err, result) => {
        let want:Want = {
          bundleName: 'com.example.mytest1',
          abilityName: abilityName,
          flags: res
        }
        try {
          await delegator.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err:BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      }))
    });


    /**
     * @tc.number : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3400
     * @tc.name   : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3400
     * @tc.desc   : Configure bundleName, activityName, and flags, with a floating-point flag value,
     *                 Call the startAbility interface through context, where the wantAbilityName
     *                 and bundleName are the correct values,and the flag is a floating-point flag value
     * @tc.level  : Level 3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3400', Level.LEVEL3, async (done: Function) => {

      const TAG = 'StartAbility';
      const TEST_SUITE_NAME: string = 'StartAbilityTest';
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3400';

      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let lifeMethodCalledCount = 0;

      //onCreate回调
      let onCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(1);
      }
      //onWindowStageCreate回调
      let onWindowStageCreateCallback = ():void => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(2);
      }
      //onForeground回调
      let onForegroundCallback = async ():Promise<void> => {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
        lifeMethodCalledCount++;
        expect(lifeMethodCalledCount).assertEqual(3);
        await delegator.removeAbilityMonitor(monitor).then((data) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(data)}`);
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} end`);
          done();
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor successful: ${JSON.stringify(err.message)}`);
          expect().assertFail();
          done();
        })
      }

      //设置监听器,监听新ability的生命周期函数
      let monitor:AbilityDelegatorRegistry.AbilityMonitor ={
        abilityName: abilityName,
        onAbilityCreate: onCreateCallback,
        onWindowStageCreate: onWindowStageCreateCallback,
        onAbilityForeground: onForegroundCallback
      };
      delegator.addAbilityMonitor(monitor, (async (err, result) => {
        let want:Want = {
          bundleName: 'com.example.mytest1',
          abilityName: abilityName,
          flags: 1.22
        }
        try {
          await delegator.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err:BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      }))
    });

  })
}