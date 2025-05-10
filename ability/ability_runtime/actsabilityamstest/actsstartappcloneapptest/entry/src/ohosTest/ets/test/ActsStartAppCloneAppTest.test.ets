/*
 * Copyright (C) 2024 HiHope Open Source Organization.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { describe, beforeAll, it, expect, afterEach, beforeEach, } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import commonEvent from '@ohos.commonEventManager';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';

let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const TAG = 'AbilityRuntime';
const TEST_SUITE_NAME: string = 'AppcloneChose';
let testAbilityContext: common.UIAbilityContext;
let driver = Driver.create();
let isAppSelectorExist = true;
let selectorName = "wei.hmsapp.appgallery";

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

async function checkAppSelectorExist() {
  try {
    let cmd = 'bm dump -n com.hua' + selectorName;
    await abilityDelegator.executeShellCommand(cmd)
      .then((data) => {
        console.info('executeShellCommand success ' + JSON.stringify(data));
        if (!data.stdResult.includes(selectorName)) {
          console.info('app selector name do not exist');
          return;
        }
        if (data.stdResult.includes("AppSelectorExtensionAbility")) {
          console.info("AppSelectorExtensionAbility exists");
        } else {
          console.info("AppSelectorExtensionAbility do not exists");
          isAppSelectorExist = false;
        }
      })
  } catch (error) {
    console.info("executeShellCommand failed ");
  }
}

export default function actsStartAppCloneAppTest() {
  describe('ActsStartAppCloneAppTest', () => {
    let FOREGROUND_EVENT = "foreground_event";
    let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
      events: [FOREGROUND_EVENT],
    };
    let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
    let onForegroundFlag = false;
    let onForegroundContent = '';
    let subscribeCallBack =
      async (err: BusinessError, data: commonEvent.CommonEventData, done: Function, tag: string): Promise<void> => {
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${tag} subscribeCallBack err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
        if (err) {
          try {
            expect().assertFail();
          } catch (e) {
          };
          done();
        }
        switch (data.event) {
          case FOREGROUND_EVENT: {
            onForegroundFlag = true;
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              let parameters = dataObj['returnStr'] as string;
              onForegroundContent = parameters;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${tag} subscribeCallBack onForegroundContent =${onForegroundContent}`);
            }
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${tag} subscribeCallBack FOREGROUND_EVENT: ${onForegroundFlag}`);
          }
            break;
          default:
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${tag} subscribeCallBack event error: ${data.event}`);
            break;
        }
      }
    beforeAll(async (done: Function) => {
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      await checkAppSelectorExist();
      console.info("isAppSelectorExist " + isAppSelectorExist);
      done();
    })

    beforeEach(() => {
      onForegroundFlag = false;
      onForegroundContent = '';
    })

    afterEach(async () => {
      await sleep(3000);
    })


    /**
     * @tc.number SUB_Ability_AbilityRuntime_AppcloneChose_0100
     * @tc.name Test start  without creating app clone
     * @tc.desc Test startAbility while target has no app clone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_AppcloneChose_0100', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppcloneChose_0100';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.appclonedemo',
        abilityName: 'EntryAbility',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
        });
        await sleep(1000);
        try {
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(1000);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundFlag== ${onForegroundFlag} `);
          expect(onForegroundFlag).assertTrue();
          commonEvent.unsubscribe(subscriber, (err, data) => {
            done();
          });

        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} click button failed, code is ${code}, message is ${message} `);
          expect().assertFail();
          done();
        }
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_AppcloneChose_0200
     * @tc.name  Test start  without creating app clone
     * @tc.desc Test startAbility while target index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_AppcloneChose_0200', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppcloneChose_0200';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.appclonedemo',
        abilityName: 'EntryAbility',
        parameters: {
          "ohos.extra.param.key.appCloneIndex": 0,
        }
      };
      try {
        testAbilityContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} code is ${err.code}, message is ${err.message} `);
            expect().assertFail();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
        });
        await sleep(1000);
        try {
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(1000);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundFlag== ${onForegroundFlag} `);
          expect(onForegroundFlag).assertTrue();
          commonEvent.unsubscribe(subscriber, (err, data) => {
            done();
          });
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} code is ${code}, message is ${message} `);
          expect().assertFail();
          done();
        }
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_AppcloneChose_0300
     * @tc.name Test start  without creating app clone
     * @tc.desc Test startAbility while target index is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_AppcloneChose_0300', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppcloneChose_0300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.appclonedemo',
        abilityName: 'EntryAbility',
        parameters: {
          "ohos.extra.param.key.appCloneIndex": 1
        },
      };
      try {
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAssistAbility, ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} code is ${err.code}, message is ${err.message} `);
            let errorCode = 16000001;
            expect(err.code).assertEqual(errorCode);
            done();
          } else {
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_AppcloneChose_0500
     * @tc.name Test start without creating clones (matching 1 application)
     * @tc.desc Test startAbility while target entities is entity.system.entryability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_AppcloneChose_0500', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppcloneChose_0500';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.appclonedemo',
        abilityName: '',
        entities: ['entity.system.entryability'],
      };
      try {
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility want== ${JSON.stringify(want)} `);
        testAbilityContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility error code is ${err.code}, message is ${err.message} `);
            expect().assertFail();
            done();
            return;
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
        });
        await sleep(1000);
        try {
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(1000);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundFlag== ${onForegroundFlag} `);
          expect(onForegroundFlag).assertTrue();
          commonEvent.unsubscribe(subscriber, (err, data) => {
            done();
          });
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  catch err code is ${code}, message is ${message} `);
          expect().assertFail();
          done();
        }
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} catch  code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_AppcloneChose_0400
     * @tc.name Test start without creating clones (matching 4 application)
     * @tc.desc Test startAbility while target entities is entity.system.common
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_AppcloneChose_0400', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppcloneChose_0400';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.appclonedemo',
        abilityName: '',
        entities: ['entity.system.common'],
      };
      try {
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility want== ${JSON.stringify(want)} `);
        await testAbilityContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility error code is ${err.code}, message is ${err.message} `);
            expect().assertFail();
            done();
            return;
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
        });
        await sleep(1500);
        if (!isAppSelectorExist) {
          done();
          return;
        }
        try {
          let allowedButton = await driver.findComponent(ON.text('允许', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowedButton} `);
          if (allowedButton) {
            allowedButton.click()
            await sleep(1000);
          }
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  catch err code is ${code}, message is ${message} `);
          expect().assertFail();
          done();
        }
        try {
          let allowed = await driver.findComponents(ON.text('APPCloneDemo', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowedOne== ${JSON.stringify(allowed)} `);
          let abilityNums = 4;
          let clickIndex = 1;
          expect(allowed.length).assertEqual(abilityNums);
          let targetStr = 'APPCloneDemo' + clickIndex;
          allowed[clickIndex-1].click();
          await sleep(2000);
          expect(onForegroundContent).assertEqual(targetStr);
          commonEvent.unsubscribe(subscriber, (err, data) => {
            done();
          });
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  catch err code is ${code}, message is ${message} `);
          expect().assertFail();
          done();
        }
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} catch  code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });
  })
}

