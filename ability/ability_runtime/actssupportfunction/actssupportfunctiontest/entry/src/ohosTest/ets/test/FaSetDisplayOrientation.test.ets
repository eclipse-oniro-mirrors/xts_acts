/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import commonEvent from '@ohos.commonEventManager';
import bundle from '@ohos.bundle';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import { Driver, ON } from '@ohos.UiTest';

export default function FaSetDisplayOrientationTest() {
  describe('FaSetDisplayOrientationTest', () => {
    let TAG = "";
    let TAG1 = "SUB_AA_OpenHarmony == FaSetDisplayOrientationTest : ";
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
    })

    afterEach(async (done: Function) => {
      console.log(TAG1 + "afterEach called");
      let wantInfo: Want = {
        bundleName: "com.example.supportfunctionhaptest",
        abilityName: "MainAbility"
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantInfo)
        .then((data) => {
          console.log(TAG1 + "startAbility data : " + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(TAG1 + "startAbility err : " + JSON.stringify(err));
        })

      let cmd1 = "aa force-stop ohos.acts.aafwk.test.fasupportfunction";
      let cmd2 = "aa force-stop ohos.acts.aafwk.test.fasupportfunctionthree";

      await abilityDelegator.executeShellCommand(cmd1)
        .then((data) => {
          console.log(TAG1 + "executeShellCommand : data : " + data.stdResult);
          console.log(TAG1 + "executeShellCommand : data : " + data.exitCode);
        })
        .catch((error: BusinessError) => {
          console.log(TAG1 + "executeShellCommand error : " + JSON.stringify(error));
        })

      await abilityDelegator.executeShellCommand(cmd2)
        .then((data) => {
          console.log(TAG1 + "executeShellCommand : data : " + data.stdResult);
          console.log(TAG1 + "executeShellCommand : data : " + data.exitCode);
        })
        .catch((error: BusinessError) => {
          console.log(TAG1 + "executeShellCommand error : " + JSON.stringify(error));
        })

      done();
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_0100
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_0100
     * @tc.desc   Verify the enumeration value of DisplayOrientation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0100 == ';
      console.log(TAG + "begin");
      expect(bundle.DisplayOrientation.UNSPECIFIED).assertEqual(0);
      expect(bundle.DisplayOrientation.LANDSCAPE).assertEqual(1);
      expect(bundle.DisplayOrientation.PORTRAIT).assertEqual(2);
      expect(bundle.DisplayOrientation.FOLLOW_RECENT).assertEqual(3);
      done();
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_0500
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_0500
     * @tc.desc   Set the horizontal and vertical screen status of ability to UNSPECIFIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0500', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0500 == ';
      console.log(TAG + "begin");
      let displayOrientationBefore: bundle.DisplayOrientation;
      let displayOrientationAfter: bundle.DisplayOrientation;
      let lifeList: string[] = [];
      let setDisplayOrientation: number;
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility3_onActive";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;

          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));
            if (data.event == onActive) {
              displayOrientationBefore = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter = data?.parameters?.displayOrientationAfter;
              lifeList = data?.parameters?.lifeList;
              setDisplayOrientation = data?.parameters?.setDisplayOrientation;
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                  expect(displayOrientationBefore).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationAfter).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(setDisplayOrientation).assertEqual(1);
                  done();
                });
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility3"
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_0600
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_0600
     * @tc.desc   Set the horizontal and vertical screen status of ability to LANDSCAPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0600', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0600 == ';
      console.log(TAG + "begin");
      let displayOrientationBefore: bundle.DisplayOrientation;
      let displayOrientationAfter: bundle.DisplayOrientation;
      let lifeList: string[] = [];
      let setDisplayOrientation: number;
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility4_onActive";
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;
          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));
            if (data.event == onActive) {
              displayOrientationBefore = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter = data?.parameters?.displayOrientationAfter;
              lifeList = data?.parameters?.lifeList;
              setDisplayOrientation = data?.parameters?.setDisplayOrientation;

              commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                  expect(displayOrientationBefore).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationAfter).assertEqual(bundle.DisplayOrientation.LANDSCAPE);
                  expect(setDisplayOrientation).assertEqual(1);
                  done();
                });
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
        parameters: {
          number: 1
        }
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_0700
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_0700
     * @tc.desc   Set the horizontal and vertical screen status of ability to PORTRAIT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0700', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0700 == ';
      console.log(TAG + "begin");
      let displayOrientationBefore: bundle.DisplayOrientation;
      let displayOrientationAfter: bundle.DisplayOrientation;
      let lifeList: string[] = [];
      let setDisplayOrientation: number;
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility4_onActive";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;
          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));
            if (data.event == onActive) {
              displayOrientationBefore = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter = data?.parameters?.displayOrientationAfter;
              lifeList = data?.parameters?.lifeList;
              setDisplayOrientation = data?.parameters?.setDisplayOrientation;

              commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                  expect(displayOrientationBefore).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationAfter).assertEqual(bundle.DisplayOrientation.PORTRAIT);
                  expect(setDisplayOrientation).assertEqual(1);
                  done();
                });
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
        parameters: {
          number: 2
        }
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_0800
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_0800
     * @tc.desc   The same applies to setting ability1 to LANDSCAPE, and ability1 starts ability2 and sets the status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0800', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0800 == ';
      console.log(TAG + "begin");
      let displayOrientationBefore1: bundle.DisplayOrientation;
      let displayOrientationBefore2: bundle.DisplayOrientation;
      let displayOrientationAfter1: bundle.DisplayOrientation;
      let displayOrientationAfter2: bundle.DisplayOrientation;
      let lifeList1: string[] = [];
      let lifeList2: string[] = [];
      let setDisplayOrientation1: number;
      let setDisplayOrientation2: number;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunction_MainAbility5_onActive";
      let listCheck = ["onCreate", "onActive"];

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;
          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));
            if (data.event == onActive1) {
              displayOrientationBefore1 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter1 = data?.parameters?.displayOrientationAfter;
              lifeList1 = data?.parameters?.lifeList;
              setDisplayOrientation1 = data?.parameters?.setDisplayOrientation;
            }
            if (data.event == onActive2) {
              displayOrientationBefore2 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter2 = data?.parameters?.displayOrientationAfter;
              lifeList2 = data?.parameters?.lifeList;
              setDisplayOrientation2 = data?.parameters?.setDisplayOrientation;
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(JSON.stringify(lifeList1)).assertEqual(JSON.stringify(listCheck));
                  expect(JSON.stringify(lifeList2)).assertEqual(JSON.stringify(listCheck));
                  expect(displayOrientationBefore1).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationBefore2).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationAfter1).assertEqual(bundle.DisplayOrientation.LANDSCAPE);
                  expect(displayOrientationAfter2).assertEqual(bundle.DisplayOrientation.LANDSCAPE);
                  expect(setDisplayOrientation1).assertEqual(1);
                  expect(setDisplayOrientation2).assertEqual(1);
                  done();
                });
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
        parameters: {
          number: 3
        }
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_0900
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_0900
     * @tc.desc   The same applies to setting ability1 to PORTRAIT, and ability1 starts ability2 and sets the status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0900', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0900 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore1: bundle.DisplayOrientation;
      let displayOrientationBefore2: bundle.DisplayOrientation;
      let displayOrientationAfter1: bundle.DisplayOrientation;
      let displayOrientationAfter2: bundle.DisplayOrientation;
      let lifeList1: string[] = [];
      let lifeList2: string[] = [];
      let setDisplayOrientation1: number;
      let setDisplayOrientation2: number;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunction_MainAbility5_onActive";
      let listCheck = ["onCreate", "onActive"];

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;
          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));
            if (data.event == onActive1) {
              displayOrientationBefore1 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter1 = data?.parameters?.displayOrientationAfter;
              lifeList1 = data?.parameters?.lifeList;
              setDisplayOrientation1 = data?.parameters?.setDisplayOrientation;
            }
            if (data.event == onActive2) {
              displayOrientationBefore2 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter2 = data?.parameters?.displayOrientationAfter;
              lifeList2 = data?.parameters?.lifeList;
              setDisplayOrientation2 = data?.parameters?.setDisplayOrientation;

              commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(JSON.stringify(lifeList1)).assertEqual(JSON.stringify(listCheck));
                  expect(JSON.stringify(lifeList2)).assertEqual(JSON.stringify(listCheck));
                  expect(displayOrientationBefore1).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationBefore2).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationAfter1).assertEqual(bundle.DisplayOrientation.PORTRAIT);
                  expect(displayOrientationAfter2).assertEqual(bundle.DisplayOrientation.PORTRAIT);
                  expect(setDisplayOrientation1).assertEqual(1);
                  expect(setDisplayOrientation2).assertEqual(1);
                  done();
                });
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
        parameters: {
          number: 4
        }
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_1000
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_1000
     * @tc.desc   Different haps set ability1 to LANDSCAPE, and ability1 starts ability2 and sets the status of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1000', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1000 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore1: bundle.DisplayOrientation;
      let displayOrientationBefore2: bundle.DisplayOrientation;
      let displayOrientationAfter1: bundle.DisplayOrientation;
      let displayOrientationAfter2: bundle.DisplayOrientation;
      let lifeList1: string[] = [];
      let lifeList2: string[] = [];
      let setDisplayOrientation1: number;
      let setDisplayOrientation2: number;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunctionTwo_MainAbility_onActive";
      let listCheck = ["onCreate", "onActive"];

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;
          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));
            if (data.event == onActive1) {
              displayOrientationBefore1 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter1 = data?.parameters?.displayOrientationAfter;
              lifeList1 = data?.parameters?.lifeList;
              setDisplayOrientation1 = data?.parameters?.setDisplayOrientation;
            }
            if (data.event == onActive2) {
              displayOrientationBefore2 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter2 = data?.parameters?.displayOrientationAfter;
              lifeList2 = data?.parameters?.lifeList;
              setDisplayOrientation2 = data?.parameters?.setDisplayOrientation;

              commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(JSON.stringify(lifeList1)).assertEqual(JSON.stringify(listCheck));
                  expect(JSON.stringify(lifeList2)).assertEqual(JSON.stringify(listCheck));
                  expect(displayOrientationBefore1).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationBefore2).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationAfter1).assertEqual(bundle.DisplayOrientation.LANDSCAPE);
                  expect(displayOrientationAfter2).assertEqual(bundle.DisplayOrientation.LANDSCAPE);
                  expect(setDisplayOrientation1).assertEqual(1);
                  expect(setDisplayOrientation2).assertEqual(1);
                  done();
                });
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
        parameters: {
          number: 5
        }
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_1100
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_1100
     * @tc.desc   Different haps set ability1 to PORTRAIT, and ability1 starts ability2 and sets the status of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1100 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore1: bundle.DisplayOrientation;
      let displayOrientationBefore2: bundle.DisplayOrientation;
      let displayOrientationAfter1: bundle.DisplayOrientation;
      let displayOrientationAfter2: bundle.DisplayOrientation;
      let lifeList1: string[] = [];
      let lifeList2: string[] = [];
      let setDisplayOrientation1: number;
      let setDisplayOrientation2: number;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunctionTwo_MainAbility_onActive";
      let listCheck = ["onCreate", "onActive"];

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;
          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));
            if (data.event == onActive1) {
              displayOrientationBefore1 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter1 = data?.parameters?.displayOrientationAfter;
              lifeList1 = data?.parameters?.lifeList;
              setDisplayOrientation1 = data?.parameters?.setDisplayOrientation;
            }

            if (data.event == onActive2) {
              displayOrientationBefore2 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter2 = data?.parameters?.displayOrientationAfter;
              lifeList2 = data?.parameters?.lifeList;
              setDisplayOrientation2 = data?.parameters?.setDisplayOrientation;

              commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(JSON.stringify(lifeList1)).assertEqual(JSON.stringify(listCheck));
                  expect(JSON.stringify(lifeList2)).assertEqual(JSON.stringify(listCheck));
                  expect(displayOrientationBefore1).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationBefore2).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationAfter1).assertEqual(bundle.DisplayOrientation.PORTRAIT);
                  expect(displayOrientationAfter2).assertEqual(bundle.DisplayOrientation.PORTRAIT);
                  expect(setDisplayOrientation1).assertEqual(1);
                  expect(setDisplayOrientation2).assertEqual(1);
                  done();
                });
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
        parameters: {
          number: 6
        }
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_1200
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_1200
     * @tc.desc   Different applications set ability1 to LANDSCAPE, and ability1 starts ability2 and sets the status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1200 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore1: bundle.DisplayOrientation;
      let displayOrientationBefore2: bundle.DisplayOrientation;
      let displayOrientationAfter1: bundle.DisplayOrientation;
      let displayOrientationAfter2: bundle.DisplayOrientation;
      let lifeList1: string[] = [];
      let lifeList2: string[] = [];
      let setDisplayOrientation1: number;
      let setDisplayOrientation2: number;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunctionThree_MainAbility_onActive";
      let listCheck = ["onCreate", "onActive"];

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;

          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

            if (data.event == onActive1) {
              displayOrientationBefore1 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter1 = data?.parameters?.displayOrientationAfter;
              lifeList1 = data?.parameters?.lifeList;
              setDisplayOrientation1 = data?.parameters?.setDisplayOrientation;
            }

            if (data.event == onActive2) {
              displayOrientationBefore2 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter2 = data?.parameters?.displayOrientationAfter;
              lifeList2 = data?.parameters?.lifeList;
              setDisplayOrientation2 = data?.parameters?.setDisplayOrientation;

              commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(JSON.stringify(lifeList1)).assertEqual(JSON.stringify(listCheck));
                  expect(JSON.stringify(lifeList2)).assertEqual(JSON.stringify(listCheck));
                  expect(displayOrientationBefore1).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationBefore2).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationAfter1).assertEqual(bundle.DisplayOrientation.LANDSCAPE);
                  expect(displayOrientationAfter2).assertEqual(bundle.DisplayOrientation.LANDSCAPE);
                  expect(setDisplayOrientation1).assertEqual(1);
                  expect(setDisplayOrientation2).assertEqual(1);
                  done();
                });
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
        parameters: {
          number: 7
        }
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_1300
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_1300
     * @tc.desc   Different applications set ability1 to PORTRAIT, and ability1 starts ability2 and sets the status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1300 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore1: bundle.DisplayOrientation;
      let displayOrientationBefore2: bundle.DisplayOrientation;
      let displayOrientationAfter1: bundle.DisplayOrientation;
      let displayOrientationAfter2: bundle.DisplayOrientation;
      let lifeList1: string[] = [];
      let lifeList2: string[] = [];
      let setDisplayOrientation1: number;
      let setDisplayOrientation2: number;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunctionThree_MainAbility_onActive";
      let listCheck = ["onCreate", "onActive"];

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;
          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

            if (data.event == onActive1) {
              displayOrientationBefore1 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter1 = data?.parameters?.displayOrientationAfter;
              lifeList1 = data?.parameters?.lifeList;
              setDisplayOrientation1 = data?.parameters?.setDisplayOrientation;
            }

            if (data.event == onActive2) {
              displayOrientationBefore2 = data?.parameters?.displayOrientationBefore;
              displayOrientationAfter2 = data?.parameters?.displayOrientationAfter;
              lifeList2 = data?.parameters?.lifeList;
              setDisplayOrientation2 = data?.parameters?.setDisplayOrientation;

              commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                  expect(JSON.stringify(lifeList1)).assertEqual(JSON.stringify(listCheck));
                  expect(JSON.stringify(lifeList2)).assertEqual(JSON.stringify(listCheck));
                  expect(displayOrientationBefore1).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationBefore2).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                  expect(displayOrientationAfter1).assertEqual(bundle.DisplayOrientation.PORTRAIT);
                  expect(displayOrientationAfter2).assertEqual(bundle.DisplayOrientation.PORTRAIT);
                  expect(setDisplayOrientation1).assertEqual(1);
                  expect(setDisplayOrientation2).assertEqual(1);
                  done();
                });
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
        parameters: {
          number: 8
        }
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_1400
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_1400
     * @tc.desc   SetDisplayOrientation input parameter is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1400', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1400 == ';
      console.log(TAG + "begin");

      let status1: boolean;
      let lifeList: string[] = [];
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility6_onActive";
      let displayOrientationErr = "Fa_SupportFunction_MainAbility6_displayOrientationErr";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive, displayOrientationErr]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;

          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

            if (data.event == displayOrientationErr) {
              status1 = true;
            }
            if (data.event == onActive) {
              lifeList = data?.parameters?.lifeList;

              setTimeout(async () => {	
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));	
                  expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));	
                  expect(status1).assertTrue();	
                  done();	
                });	
              }, 1000);
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility6",
        parameters: {
          number: 1
        }
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_1500
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_1500
     * @tc.desc   SetDisplayOrientation input parameter is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1500', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1500 == ';
      console.log(TAG + "begin");

      let status1: boolean;
      let lifeList: string[] = [];
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility6_onActive";
      let displayOrientationErr = "Fa_SupportFunction_MainAbility6_displayOrientationErr";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive, displayOrientationErr]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;

          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

            if (data.event == displayOrientationErr) {
              status1 = true;
            }
            if (data.event == onActive) {
              lifeList = data?.parameters?.lifeList;

              setTimeout(async () => {	
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));	
                  expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));	
                  expect(status1).assertTrue();	
                  done();	
                });	
              }, 1000);
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility6",
        parameters: {
          number: 2
        }
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_DisplayOrientation_1600
     * @tc.number SUB_AA_OpenHarmony_DisplayOrientation_1600
     * @tc.desc   SetDisplayOrientation input parameter is a nonexistent enumeration value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1600', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1600 == ';
      console.log(TAG + "begin");

      let status1: boolean;
      let lifeList: string[] = [];
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility6_onActive";
      let displayOrientationErr = "Fa_SupportFunction_MainAbility6_displayOrientationErr";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onActive, displayOrientationErr]
      }
      await commonEvent.createSubscriber(subscribeInfo)
        .then(async (data) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
          subscriber = data;

          commonEvent.subscribe(subscriber, async (err, data) => {
            console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

            if (data.event == displayOrientationErr) {
              status1 = true;
            }
            if (data.event == onActive) {
              lifeList = data?.parameters?.lifeList;

              setTimeout(async () => {	
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));	
                  expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));	
                  expect(status1).assertTrue();	
                  done();	
                });	
              }, 1000);
            }
          });
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility6",
        parameters: {
          number: 3
        }
      }
      await AppStorage.get<common.UIAbilityContext>("abilityTestContext")!.startAbility(wantNum)
        .then((data) => {
          console.log(TAG + "startAbility data = " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + "startAbility error = " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
    })
  })
}