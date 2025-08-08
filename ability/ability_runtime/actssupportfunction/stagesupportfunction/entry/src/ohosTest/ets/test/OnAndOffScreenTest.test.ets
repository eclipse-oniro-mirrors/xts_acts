/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import commonEvent from '@ohos.commonEvent';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import power from '@ohos.power';
import { Driver, ON } from '@ohos.UiTest';
import backgroundTaskManager from '@ohos.backgroundTaskManager';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import commonEventManager from '@ohos.commonEventManager';

let driver = Driver.create();
let deviceType = systemParameterEnhance.getSync('const.product.devicetype');

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function OnAndOffScreenTest() {

  describe('OnAndOffScreenTest', () => {

    let TAG = "";
    let TAG1 = "SUB_AA_OpenHarmony == OnAndOffScreenTest : ";
    let sleepTimeOne = 1000;
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let id: number | undefined = undefined;
    beforeAll(async (done: Function) => {
      console.log(TAG1 + "beforeAll called");
      let myReason = 'test FaShowOnLockTest';
      let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
        console.log(TAG1 + "Request suspension delay will time out.");
      })
      id = delayInfo.requestId;
      console.log(TAG1 + "requestId is : " + id);
      setTimeout(() => {
        console.log(TAG1 + "beforeAll end");
        done();
      }, sleepTimeOne);
    })

    afterAll(async (done: Function) => {
      console.log(TAG1 + "afterAll called");
      backgroundTaskManager.cancelSuspendDelay(id);
      setTimeout(() => {
        console.log(TAG1 + "afterAll end");
        done();
      }, sleepTimeOne);
    })

   let executeShellCommand = async(cmd:string, TAG:string):Promise<void> => {
      console.log(TAG + "executeShellCommand start : " + JSON.stringify(cmd));
      await abilityDelegator.executeShellCommand(cmd).then((data) => {
        console.log(TAG + "executeShellCommand : data : " + data.stdResult);
        console.log(TAG + "executeShellCommand : data : " + data.exitCode);
      }).catch((error:BusinessError) => {
        console.log(TAG + "executeShellCommand error : " + JSON.stringify(error));
      })
    }

    let slideScreen = async (TAG:string):Promise<void> => {
      await sleep(1500)
      console.log(TAG + "slideScreen start");
      let cmd = '';
      if (deviceType === '2in1') {
        cmd = 'uinput -T -d 1070 1070 -u 1070 1070';
      } else {
        cmd = 'uinput -T -m 300 2700 280 200';
      }
      await executeShellCommand(cmd, TAG);
      await sleep(500)
      console.log(TAG + "slideScreen end");
    }

    beforeEach(async (done: Function) => {
      console.log(TAG1 + "beforeEach called");
      let status: boolean | undefined = undefined;
      await power.isScreenOn().then((data) => {
        console.log(TAG1 + "isScreenOn data = " + JSON.stringify(data));
        status = data;
      }).catch((error: BusinessError) => {
        console.log(TAG1 + "isScreenOn error = " + JSON.stringify(error));
      })

      if (!status) {
        await sleep(500)
        let cmd = "uinput -K -d 18 -u 18";
        await executeShellCommand(cmd, TAG1);
        await slideScreen(TAG1);
      }

      setTimeout(() => {
        console.log(TAG1 + "beforeEach end");
        done();
      }, sleepTimeOne);
    })

    afterEach(async (done: Function) => {
      console.log(TAG1 + "afterEach called");
      let cmd1 = "aa force-stop ohos.acts.aafwk.test.faonandoffscreen";
      await executeShellCommand(cmd1, TAG1);
      let cmd2 = "aa force-stop ohos.acts.aafwk.test.stageonandoffscreen";
      await executeShellCommand(cmd2, TAG1);

      setTimeout(() => {
        console.log(TAG1 + "afterEach end");
        done();
      }, sleepTimeOne);
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_OnAndOffScreen_0100
     * @tc.name    : Verify the life cycle of on / off screen ability
     * @tc.desc    : FA model is applied in the foreground, and the device is locked.
     */
    it('SUB_AA_OpenHarmony_OnAndOffScreen_0100', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_OnAndOffScreen_0100 == ';
      console.log(TAG + "begin");

      let status1: boolean | undefined = undefined;
      let lifeList: string[] = [];
      let listCheck = ["onCreate", "onActive", "onInactive", "onHide"];
      let onActive = "FaOnAndOffScreen_MainAbility_onActive";
      let onHide = "FaOnAndOffScreen_MainAbility_onHide";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive, onHide]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onActive) {
            if (deviceType === '2in1') {
              setTimeout(async () => {
                commonEventManager.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(status1).assertTrue();
                  done();
                });
              }, 2500);
            } else {
              let cmd = "uinput -K -d 18 -u 18";
              await executeShellCommand(cmd, TAG);
            }
          }

          if (data.event == onHide) {
            lifeList = data.parameters!.lifeList;
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertTrue();
                done();
              });
            }, sleepTimeOne);
          }
        });
      }).catch((error: BusinessError) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error: BusinessError) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.faonandoffscreen",
        abilityName: "ohos.acts.aafwk.test.faonandoffscreen.MainAbility"
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data:void) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error: BusinessError) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text("打开"));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x + 'point.y : ' + point.y);

        await driver.click(point.x, point.y);
      }
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_OnAndOffScreen_0300
     * @tc.name    : Verify the life cycle of on / off screen ability
     * @tc.desc    : Stage model is applied in the foreground, and the device locks the screen.
     */
    it('SUB_AA_OpenHarmony_OnAndOffScreen_0300', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_OnAndOffScreen_0300 == ';
      console.log(TAG + "begin");

      let status1: boolean | undefined = undefined;
      let lifeList: string[] = [];
      let listCheck = ["onCreate", "onForeground", "onBackground"];
      let onForeground = "StageOnAndOffScreen_MainAbility_onForeground";
      let onBackground = "StageOnAndOffScreen_MainAbility_onBackground";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onForeground, onBackground]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onForeground) {
            if (deviceType === '2in1') {
              setTimeout(async () => {
                commonEventManager.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(status1).assertTrue();
                  done();
                });
              }, 2500);
            } else {
              let cmd = "uinput -K -d 18 -u 18";
              await executeShellCommand(cmd, TAG);
            }
          }

          if (data.event == onBackground) {
            lifeList = data.parameters!.lifeList;
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertTrue();
                done();
              });
            }, sleepTimeOne);
          }
        });
      }).catch((error: BusinessError) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error: BusinessError) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.stageonandoffscreen",
        abilityName: "MainAbility"
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data:void) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error: BusinessError) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text("打开"));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x + 'point.y : ' + point.y);

        await driver.click(point.x, point.y);
      }
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_OnAndOffScreen_0400
     * @tc.name    : Verify the life cycle of on / off screen ability
     * @tc.desc    : The stage model is applied in the foreground, the device locks the screen, and then unlocks.
     */
    it('SUB_AA_OpenHarmony_OnAndOffScreen_0400', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_OnAndOffScreen_0400 == ';
      console.log(TAG + "begin");

      let flag = false;
      let status1: boolean | undefined = undefined;
      let lifeList: string[] = [];
      let listCheck = ["onCreate", "onForeground", "onBackground", "onForeground"];
      let onForeground = "StageOnAndOffScreen_MainAbility_onForeground";
      let onBackground = "StageOnAndOffScreen_MainAbility_onBackground";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onForeground, onBackground]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onForeground && !flag) {
            if (deviceType === '2in1') {
              setTimeout(async () => {
                commonEventManager.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(status1).assertTrue();
                  done();
                });
              }, 2500);
            } else {
              let cmd = "uinput -K -d 18 -u 18";
              await executeShellCommand(cmd, TAG);
              flag = true;
            }
          } else if (data.event == onForeground && flag) {
            lifeList = data.parameters!.lifeList;
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertTrue();
                done();
              });
            }, sleepTimeOne);
          }

          if (data.event == onBackground) {
            let cmd = "uinput -K -d 18 -u 18";
            await executeShellCommand(cmd, TAG);
            await slideScreen(TAG);
          }
        });
      }).catch((error: BusinessError) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error: BusinessError) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.stageonandoffscreen",
        abilityName: "MainAbility"
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data:void) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error: BusinessError) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text("打开"));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x + 'point.y : ' + point.y);

        await driver.click(point.x, point.y);
      }
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_OnAndOffScreen_0500
     * @tc.name    : Verify the life cycle of on / off screen ability
     * @tc.desc    : Application in the background, device lock screen.
     */
    it('SUB_AA_OpenHarmony_OnAndOffScreen_0500', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_OnAndOffScreen_0500 == ';
      console.log(TAG + "begin");

      let status1: boolean | undefined = undefined;
      let lifeList: string[] = [];
      let listCheck = ["onCreate", "onWindowStageCreate", "onForeground", "onBackground"];
      let onCreate = "StageOnAndOffScreen_MainAbility2_onCreate";
      let onWindowStageCreate = "StageOnAndOffScreen_MainAbility2_onWindowStageCreate";
      let onForeground = "StageOnAndOffScreen_MainAbility2_onForeground";
      let onBackground = "StageOnAndOffScreen_MainAbility2_onBackground";
      let onWindowStageDestroy = "StageOnAndOffScreen_MainAbility2_onWindowStageDestroy";
      let onDestroy = "StageOnAndOffScreen_MainAbility2_onDestroy";
      let onForeground2 = "StageOnAndOffScreen_MainAbility3_onForeground";
      let onBackground2 = "StageOnAndOffScreen_MainAbility3_onBackground";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onCreate, onWindowStageCreate, onForeground, onBackground, onWindowStageDestroy, onDestroy,
          onForeground2, onBackground2]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onCreate) {
            lifeList.push("onCreate");
          }

          if (data.event == onWindowStageCreate) {
            lifeList.push("onWindowStageCreate");
          }

          if (data.event == onForeground) {
            lifeList.push("onForeground");
          }

          if (data.event == onBackground) {
            lifeList.push("onBackground");
          }

          if (data.event == onWindowStageDestroy) {
            lifeList.push("onWindowStageDestroy");
          }

          if (data.event == onDestroy) {
            lifeList.push("onDestroy");
          }

          if (data.event == onForeground2) {
            if (deviceType === '2in1') {
              setTimeout(async () => {
                commonEventManager.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(status1).assertTrue();
                  done();
                });
              }, 2500);
            } else {
              await sleep(500)
              let cmd = "uinput -K -d 18 -u 18";
              await executeShellCommand(cmd, TAG);
            }
          }

          if (data.event == onBackground2) {
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertTrue();
                done();
              });
            }, sleepTimeOne);
          }
        });
      }).catch((error: BusinessError) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error: BusinessError) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.stageonandoffscreen",
        abilityName: "MainAbility2"
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data:void) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error: BusinessError) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text("打开"));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x + 'point.y : ' + point.y);

        await driver.click(point.x, point.y);
      }
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_OnAndOffScreen_0600
     * @tc.name    : Verify the life cycle of on / off screen ability
     * @tc.desc    : Application in the background, device lock screen.
     */
    it('SUB_AA_OpenHarmony_OnAndOffScreen_0600', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_OnAndOffScreen_0600 == ';
      console.log(TAG + "begin");

      let flag = false;
      let status1: boolean | undefined = undefined;
      let lifeSet: Set<string> = new Set();
      let listCheck = ["onCreate", "onWindowStageCreate", "onForeground", "onBackground"];
      let onCreate = "StageOnAndOffScreen_MainAbility2_onCreate";
      let onWindowStageCreate = "StageOnAndOffScreen_MainAbility2_onWindowStageCreate";
      let onForeground = "StageOnAndOffScreen_MainAbility2_onForeground";
      let onBackground = "StageOnAndOffScreen_MainAbility2_onBackground";
      let onWindowStageDestroy = "StageOnAndOffScreen_MainAbility2_onWindowStageDestroy";
      let onDestroy = "StageOnAndOffScreen_MainAbility2_onDestroy";
      let onForeground2 = "StageOnAndOffScreen_MainAbility3_onForeground";
      let onBackground2 = "StageOnAndOffScreen_MainAbility3_onBackground";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onCreate, onWindowStageCreate, onForeground, onBackground, onWindowStageDestroy, onDestroy,
          onForeground2, onBackground2]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onCreate) {
            lifeSet.add("onCreate");
          }

          if (data.event == onWindowStageCreate) {
            lifeSet.add("onWindowStageCreate");
          }

          if (data.event == onForeground) {
            lifeSet.add("onForeground");
          }

          if (data.event == onBackground) {
            lifeSet.add("onBackground");
          }

          if (data.event == onWindowStageDestroy) {
            lifeSet.add("onWindowStageDestroy");
          }

          if (data.event == onDestroy) {
            lifeSet.add("onDestroy");
          }

          if (data.event == onForeground2 && !flag) {
            if (deviceType === '2in1') {
              setTimeout(async () => {
                commonEventManager.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(status1).assertTrue();
                  done();
                });
              }, 2500);
            } else {
              await sleep(500)
              let cmd = "uinput -K -d 18 -u 18";
              await executeShellCommand(cmd, TAG);
              flag = true;
            }
          } else if (data.event == onForeground2 && flag) {
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                for (let i of listCheck) {
                  expect(lifeSet.has(i)).assertTrue();
                }
                expect(status1).assertTrue();
                done();
              });
            }, sleepTimeOne);
          }

          if (data.event == onBackground2) {
            await sleep(500)
            let cmd = "uinput -K -d 18 -u 18";
            await executeShellCommand(cmd, TAG);
            await slideScreen(TAG);
          }
        });
      }).catch((error: BusinessError) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error: BusinessError) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.stageonandoffscreen",
        abilityName: "MainAbility2"
      }

      await globalThis.abilityTestContext.startAbility(wantNum).then((data:void) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error: BusinessError) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text("打开"));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x + 'point.y : ' + point.y);

        await driver.click(point.x, point.y);
      }
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_Share_1000
     * @tc.name    : Verify the ability implicit start
     * @tc.desc    : Verify that the capability is started implicitly, and the input parameter is a nonexistent action.
     */
    it('SUB_AA_OpenHarmony_Share_1000', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_Share_1000 == ';
      console.log(TAG + "begin");

      let wantNum: Want = {
        action: "ohos.acts.aafwk.aafwk.aafwk",
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data:void) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        done();
      })
    })
  })
}
