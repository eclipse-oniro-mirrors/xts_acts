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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import commonEvent from '@ohos.commonEvent';
import power from '@ohos.power';
import backgroundTaskManager from '@ohos.backgroundTaskManager';

export default function FaShowOnLockTest() {

  describe('FaShowOnLockTest', function () {

    let TAG = "";
    let TAG1 = "SUB_AA_OpenHarmony == FaShowOnLockTest : ";
    let sleepTimeOne = 1000;
    let sleepTimeTwo = 2000;
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let id = undefined;
    beforeAll(async (done) => {
        console.log(TAG1 + "beforeAll called");
        let myReason = 'test FaShowOnLockTest';
        let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.log(TAG1 + "Request suspension delay will time out.");
        })
        id = delayInfo.requestId;
        console.log(TAG1 + "requestId is : " + id);
        setTimeout(function () {
            console.log(TAG1 + "beforeAll end");
            done();
        }, sleepTimeOne);
    })
        
    afterAll(async (done) => {
        console.log(TAG1 + "afterAll called");
        backgroundTaskManager.cancelSuspendDelay(id);
        setTimeout(function () {
            console.log(TAG1 + "afterAll end");
            done();
        }, sleepTimeOne);
    })

    beforeEach(async (done) => {
      console.log(TAG1 + "beforeEach called");
      let status = undefined;
      await power.isScreenOn().then((data) => {
        console.log(TAG1 + "isScreenOn data = " + JSON.stringify(data));
        status = data;
      }).catch((error) => {
        console.log(TAG1 + "isScreenOn error = " + JSON.stringify(error));
      })

      if (status) {
        let cmd = "uinput -K -d 18 -u 18";
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.log(TAG1 + "executeShellCommand : data : " + data.stdResult);
          console.log(TAG1 + "executeShellCommand : data : " + data.exitCode);
        }).catch((error) => {
          console.log(TAG1 + "executeShellCommand error : " + JSON.stringify(error));
        })
      }

      setTimeout(() => {
        console.log(TAG1 + "beforeEach end");
        done();
      }, sleepTimeOne);
    })

    afterEach(async (done) => {
      console.log(TAG1 + "afterEach called");
      let cmd = "aa force-stop ohos.acts.aafwk.test.fasupportfunction";
      await abilityDelegator.executeShellCommand(cmd).then((data) => {
        console.log(TAG1 + "executeShellCommand : data : " + data.stdResult);
        console.log(TAG1 + "executeShellCommand : data : " + data.exitCode);
      }).catch((error) => {
        console.log(TAG1 + "executeShellCommand error : " + JSON.stringify(error));
      })

      setTimeout(() => {
        console.log(TAG1 + "afterEach end");
        done();
      }, sleepTimeOne);
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_SetWakeUp_0100
     * @tc.name    : Verify setWakeUpScreen interface
     * @tc.desc    : SetWakeUpScreen input parameter used in onCreate is true.(promise)
     */
    it('SUB_AA_OpenHarmony_SetWakeUp_0100', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_SetWakeUp_0100 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let status2 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "wakeUpScreen"];
      let wakeUpScreen = "Fa_SupportFunction_MainAbility_wakeUpScreen";

      var subscriber;
      var subscribeInfo = {
        events: [wakeUpScreen]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == wakeUpScreen) {
            lifeList = data.parameters.lifeList;
            setTimeout(async () => {
              await power.isScreenOn().then((data) => {
                console.log(TAG + "isScreenOn status2 data = " + JSON.stringify(data));
                status2 = data;
              }).catch((error) => {
                console.log(TAG + "isScreenOn status2 error = " + JSON.stringify(error));
                expect().assertFail();
                done();
              })
            }, sleepTimeOne);

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertFalse();
                expect(status2).assertTrue();
                done();
              });
            }, sleepTimeTwo);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility",
        parameters: {
          number: 1
        }
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_SetWakeUp_0200
     * @tc.name    : Verify setWakeUpScreen interface
     * @tc.desc    : SetWakeUpScreen input parameter used in onCreate is true.(callback)
     */
    it('SUB_AA_OpenHarmony_SetWakeUp_0200', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_SetWakeUp_0200 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let status2 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "wakeUpScreen"];
      let wakeUpScreen = "Fa_SupportFunction_MainAbility_wakeUpScreen";

      var subscriber;
      var subscribeInfo = {
        events: [wakeUpScreen]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == wakeUpScreen) {
            lifeList = data.parameters.lifeList;
            setTimeout(async () => {
              await power.isScreenOn().then((data) => {
                console.log(TAG + "isScreenOn status2 data = " + JSON.stringify(data));
                status2 = data;
              }).catch((error) => {
                console.log(TAG + "isScreenOn status2 error = " + JSON.stringify(error));
                expect().assertFail();
                done();
              })
            }, sleepTimeOne);

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertFalse();
                expect(status2).assertTrue();
                done();
              });
            }, sleepTimeTwo);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility",
        parameters: {
          number: 2
        }
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_SetWakeUp_0300
     * @tc.name    : Verify setWakeUpScreen interface
     * @tc.desc    : SetWakeUpScreen input parameter used in onCreate is false.
     */
    it('SUB_AA_OpenHarmony_SetWakeUp_0300', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_SetWakeUp_0300 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let status2 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "wakeUpScreen"];
      let wakeUpScreen = "Fa_SupportFunction_MainAbility_wakeUpScreen";

      var subscriber;
      var subscribeInfo = {
        events: [wakeUpScreen]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == wakeUpScreen) {
            lifeList = data.parameters.lifeList;
            setTimeout(async () => {
              await power.isScreenOn().then((data) => {
                console.log(TAG + "isScreenOn status2 data = " + JSON.stringify(data));
                status2 = data;
              }).catch((error) => {
                console.log(TAG + "isScreenOn status2 error = " + JSON.stringify(error));
                expect().assertFail();
                done();
              })
            }, sleepTimeOne);

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertFalse();
                expect(status2).assertFalse();
                done();
              });
            }, sleepTimeTwo);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility",
        parameters: {
          number: 3
        }
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_SetWakeUp_0400
     * @tc.name    : Verify setWakeUpScreen interface
     * @tc.desc    : SetWakeUpScreen input parameter used in onCreate is undefined.
     */
    it('SUB_AA_OpenHarmony_SetWakeUp_0400', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_SetWakeUp_0400 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let status2 = undefined;
      let status3 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "wakeUpScreen"];
      let wakeUpScreen = "Fa_SupportFunction_MainAbility2_wakeUpScreen";
      let wakeUpErr = "Fa_SupportFunction_MainAbility2_wakeUpErr";

      var subscriber;
      var subscribeInfo = {
        events: [wakeUpScreen, wakeUpErr]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == wakeUpErr) {
            status3 = true;
          }

          if (data.event == wakeUpScreen) {
            lifeList = data.parameters.lifeList;
            setTimeout(async () => {
              await power.isScreenOn().then((data) => {
                console.log(TAG + "isScreenOn status2 data = " + JSON.stringify(data));
                status2 = data;
              }).catch((error) => {
                console.log(TAG + "isScreenOn status2 error = " + JSON.stringify(error));
                expect().assertFail();
                done();
              })
            }, sleepTimeOne);

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertFalse();
                expect(status2).assertFalse();
                expect(status3).assertTrue();
                done();
              });
            }, sleepTimeTwo);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility2",
        parameters: {
          number: 1
        }
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_SetWakeUp_0500
     * @tc.name    : Verify setWakeUpScreen interface
     * @tc.desc    : SetWakeUpScreen input parameter used in onCreate is number.
     */
    it('SUB_AA_OpenHarmony_SetWakeUp_0500', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_SetWakeUp_0500 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let status2 = undefined;
      let status3 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "wakeUpScreen"];
      let wakeUpScreen = "Fa_SupportFunction_MainAbility2_wakeUpScreen";
      let wakeUpErr = "Fa_SupportFunction_MainAbility2_wakeUpErr";

      var subscriber;
      var subscribeInfo = {
        events: [wakeUpScreen, wakeUpErr]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == wakeUpErr) {
            status3 = true;
          }

          if (data.event == wakeUpScreen) {
            lifeList = data.parameters.lifeList;
            setTimeout(async () => {
              await power.isScreenOn().then((data) => {
                console.log(TAG + "isScreenOn status2 data = " + JSON.stringify(data));
                status2 = data;
              }).catch((error) => {
                console.log(TAG + "isScreenOn status2 error = " + JSON.stringify(error));
                expect().assertFail();
                done();
              })
            }, sleepTimeOne);

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertFalse();
                expect(status2).assertFalse();
                expect(status3).assertTrue();
                done();
              });
            }, sleepTimeTwo);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility2",
        parameters: {
          number: 2
        }
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_SetWakeUp_0600
     * @tc.name    : Verify setWakeUpScreen interface
     * @tc.desc    : SetWakeUpScreen input parameter used in onCreate is string.
     */
    it('SUB_AA_OpenHarmony_SetWakeUp_0600', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_SetWakeUp_0600 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let status2 = undefined;
      let status3 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "wakeUpScreen"];
      let wakeUpScreen = "Fa_SupportFunction_MainAbility2_wakeUpScreen";
      let wakeUpErr = "Fa_SupportFunction_MainAbility2_wakeUpErr";

      var subscriber;
      var subscribeInfo = {
        events: [wakeUpScreen, wakeUpErr]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == wakeUpErr) {
            status3 = true;
          }

          if (data.event == wakeUpScreen) {
            lifeList = data.parameters.lifeList;
            setTimeout(async () => {
              await power.isScreenOn().then((data) => {
                console.log(TAG + "isScreenOn status2 data = " + JSON.stringify(data));
                status2 = data;
              }).catch((error) => {
                console.log(TAG + "isScreenOn status2 error = " + JSON.stringify(error));
                expect().assertFail();
                done();
              })
            }, sleepTimeOne);

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertFalse();
                expect(status2).assertFalse();
                expect(status3).assertTrue();
                done();
              });
            }, sleepTimeTwo);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility2",
        parameters: {
          number: 3
        }
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_SetWakeUp_0700
     * @tc.name    : Verify setWakeUpScreen interface
     * @tc.desc    : SetWakeUpScreen input parameter used in onCreate is array.
     */
    it('SUB_AA_OpenHarmony_SetWakeUp_0700', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_SetWakeUp_0700 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let status2 = undefined;
      let status3 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "wakeUpScreen"];
      let wakeUpScreen = "Fa_SupportFunction_MainAbility2_wakeUpScreen";
      let wakeUpErr = "Fa_SupportFunction_MainAbility2_wakeUpErr";

      var subscriber;
      var subscribeInfo = {
        events: [wakeUpScreen, wakeUpErr]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == wakeUpErr) {
            status3 = true;
          }

          if (data.event == wakeUpScreen) {
            lifeList = data.parameters.lifeList;
            setTimeout(async () => {
              await power.isScreenOn().then((data) => {
                console.log(TAG + "isScreenOn status2 data = " + JSON.stringify(data));
                status2 = data;
              }).catch((error) => {
                console.log(TAG + "isScreenOn status2 error = " + JSON.stringify(error));
                expect().assertFail();
                done();
              })
            }, sleepTimeOne);

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertFalse();
                expect(status2).assertFalse();
                expect(status3).assertTrue();
                done();
              });
            }, sleepTimeTwo);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility2",
        parameters: {
          number: 4
        }
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_SetWakeUp_0800
     * @tc.name    : Verify setWakeUpScreen interface
     * @tc.desc    : SetWakeUpScreen input parameter used in onCreate is json.
     */
    it('SUB_AA_OpenHarmony_SetWakeUp_0800', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_SetWakeUp_0800 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let status2 = undefined;
      let status3 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "wakeUpScreen"];
      let wakeUpScreen = "Fa_SupportFunction_MainAbility2_wakeUpScreen";
      let wakeUpErr = "Fa_SupportFunction_MainAbility2_wakeUpErr";

      var subscriber;
      var subscribeInfo = {
        events: [wakeUpScreen, wakeUpErr]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == wakeUpErr) {
            status3 = true;
          }

          if (data.event == wakeUpScreen) {
            lifeList = data.parameters.lifeList;
            setTimeout(async () => {
              await power.isScreenOn().then((data) => {
                console.log(TAG + "isScreenOn status2 data = " + JSON.stringify(data));
                status2 = data;
              }).catch((error) => {
                console.log(TAG + "isScreenOn status2 error = " + JSON.stringify(error));
                expect().assertFail();
                done();
              })
            }, sleepTimeOne);

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertFalse();
                expect(status2).assertFalse();
                expect(status3).assertTrue();
                done();
              });
            }, sleepTimeTwo);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      await power.isScreenOn().then((data) => {
        console.log(TAG + "isScreenOn status1 data = " + JSON.stringify(data));
        status1 = data;
      }).catch((error) => {
        console.log(TAG + "isScreenOn status1 error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility2",
        parameters: {
          number: 5
        }
      }
      await globalThis.abilityTestContext.startAbility(wantNum).then((data) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })
  })
}