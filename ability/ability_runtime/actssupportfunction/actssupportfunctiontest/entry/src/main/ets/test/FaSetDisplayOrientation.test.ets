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
import bundle from '@ohos.bundle';

export default function FaSetDisplayOrientationTest() {

  describe('FaSetDisplayOrientationTest', function () {

    let TAG = "";
    let TAG1 = "SUB_AA_OpenHarmony == FaSetDisplayOrientationTest : ";
    let sleepTimeOne = 1000;
    let sleepTimeTwo = 2000;
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    afterEach(async (done) => {
      console.log(TAG1 + "afterEach called");
      let wantInfo = {
        bundleName: "com.example.supportfunctionhaptest",
        abilityName: "MainAbility"
      }
      await globalThis.abilityTestContext.startAbility(wantInfo).then((data) => {
        console.log(TAG1 + "startAbility data : " + JSON.stringify(data));
      }).catch((err) => {
        console.log(TAG1 + "startAbility err : " + JSON.stringify(err));
      })

      let cmd1 = "aa force-stop ohos.acts.aafwk.test.fasupportfunction";
      let cmd2 = "aa force-stop ohos.acts.aafwk.test.fasupportfunctionthree";

      await abilityDelegator.executeShellCommand(cmd1).then((data) => {
        console.log(TAG1 + "executeShellCommand : data : " + data.stdResult);
        console.log(TAG1 + "executeShellCommand : data : " + data.exitCode);
      }).catch((error) => {
        console.log(TAG1 + "executeShellCommand error : " + JSON.stringify(error));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((data) => {
        console.log(TAG1 + "executeShellCommand : data : " + data.stdResult);
        console.log(TAG1 + "executeShellCommand : data : " + data.exitCode);
      }).catch((error) => {
        console.log(TAG1 + "executeShellCommand error : " + JSON.stringify(error));
      })

      setTimeout(function () {
        done();
      }, sleepTimeOne);
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_0100
     * @tc.name    : Verify the enumeration value of DisplayOrientation
     * @tc.desc    : Verify the enumeration value of DisplayOrientation.
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0100', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0100 == ';
      console.log(TAG + "begin");
      expect(bundle.DisplayOrientation.UNSPECIFIED).assertEqual(0);
      expect(bundle.DisplayOrientation.LANDSCAPE).assertEqual(1);
      expect(bundle.DisplayOrientation.PORTRAIT).assertEqual(2);
      expect(bundle.DisplayOrientation.FOLLOW_RECENT).assertEqual(3);
      done();
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_0500
     * @tc.name    : Verify getDisplayOrientation and setDisplayOrientation interfaces
     * @tc.desc    : Set the horizontal and vertical screen status of ability to UNSPECIFIED.
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0500', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0500 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore = undefined;
      let displayOrientationAfter = undefined;
      let lifeList = [];
      let setDisplayOrientation = undefined;
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility3_onActive";

      var subscriber;
      var subscribeInfo = {
        events: [onActive]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onActive) {
            displayOrientationBefore = data.parameters.displayOrientationBefore;
            displayOrientationAfter = data.parameters.displayOrientationAfter;
            lifeList = data.parameters.lifeList;
            setDisplayOrientation = data.parameters.setDisplayOrientation;

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(displayOrientationBefore).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                expect(displayOrientationAfter).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                expect(setDisplayOrientation).assertEqual(1);
                done();
              });
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility3"
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
     * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_0600
     * @tc.name    : Verify getDisplayOrientation and setDisplayOrientation interfaces
     * @tc.desc    : Set the horizontal and vertical screen status of ability to LANDSCAPE.
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0600', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0600 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore = undefined;
      let displayOrientationAfter = undefined;
      let lifeList = [];
      let setDisplayOrientation = undefined;
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility4_onActive";

      var subscriber;
      var subscribeInfo = {
        events: [onActive]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onActive) {
            displayOrientationBefore = data.parameters.displayOrientationBefore;
            displayOrientationAfter = data.parameters.displayOrientationAfter;
            lifeList = data.parameters.lifeList;
            setDisplayOrientation = data.parameters.setDisplayOrientation;

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(displayOrientationBefore).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                expect(displayOrientationAfter).assertEqual(bundle.DisplayOrientation.LANDSCAPE);
                expect(setDisplayOrientation).assertEqual(1);
                done();
              });
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
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
     * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_0700
     * @tc.name    : Verify getDisplayOrientation and setDisplayOrientation interfaces
     * @tc.desc    : Set the horizontal and vertical screen status of ability to PORTRAIT.
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0700', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0700 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore = undefined;
      let displayOrientationAfter = undefined;
      let lifeList = [];
      let setDisplayOrientation = undefined;
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility4_onActive";

      var subscriber;
      var subscribeInfo = {
        events: [onActive]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onActive) {
            displayOrientationBefore = data.parameters.displayOrientationBefore;
            displayOrientationAfter = data.parameters.displayOrientationAfter;
            lifeList = data.parameters.lifeList;
            setDisplayOrientation = data.parameters.setDisplayOrientation;

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(displayOrientationBefore).assertEqual(bundle.DisplayOrientation.UNSPECIFIED);
                expect(displayOrientationAfter).assertEqual(bundle.DisplayOrientation.PORTRAIT);
                expect(setDisplayOrientation).assertEqual(1);
                done();
              });
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
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
     * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_0800
     * @tc.name    : Verify getDisplayOrientation and setDisplayOrientation interfaces
     * @tc.desc    : The same applies to setting ability1 to LANDSCAPE, and ability1 starts ability2 and sets the status
                     of ability2 to FOLLOW_RECENT.
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0800', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0800 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore1 = undefined;
      let displayOrientationBefore2 = undefined;
      let displayOrientationAfter1 = undefined;
      let displayOrientationAfter2 = undefined;
      let lifeList1 = [];
      let lifeList2 = [];
      let setDisplayOrientation1 = undefined;
      let setDisplayOrientation2 = undefined;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunction_MainAbility5_onActive";
      let listCheck = ["onCreate", "onActive"];

      var subscriber;
      var subscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onActive1) {
            displayOrientationBefore1 = data.parameters.displayOrientationBefore;
            displayOrientationAfter1 = data.parameters.displayOrientationAfter;
            lifeList1 = data.parameters.lifeList;
            setDisplayOrientation1 = data.parameters.setDisplayOrientation;
          }

          if (data.event == onActive2) {
            displayOrientationBefore2 = data.parameters.displayOrientationBefore;
            displayOrientationAfter2 = data.parameters.displayOrientationAfter;
            lifeList2 = data.parameters.lifeList;
            setDisplayOrientation2 = data.parameters.setDisplayOrientation;

            setTimeout(async () => {
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
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
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
     * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_0900
     * @tc.name    : Verify getDisplayOrientation and setDisplayOrientation interfaces
     * @tc.desc    : The same applies to setting ability1 to PORTRAIT, and ability1 starts ability2 and sets the status
                     of ability2 to FOLLOW_RECENT.
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_0900', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_0900 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore1 = undefined;
      let displayOrientationBefore2 = undefined;
      let displayOrientationAfter1 = undefined;
      let displayOrientationAfter2 = undefined;
      let lifeList1 = [];
      let lifeList2 = [];
      let setDisplayOrientation1 = undefined;
      let setDisplayOrientation2 = undefined;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunction_MainAbility5_onActive";
      let listCheck = ["onCreate", "onActive"];

      var subscriber;
      var subscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onActive1) {
            displayOrientationBefore1 = data.parameters.displayOrientationBefore;
            displayOrientationAfter1 = data.parameters.displayOrientationAfter;
            lifeList1 = data.parameters.lifeList;
            setDisplayOrientation1 = data.parameters.setDisplayOrientation;
          }

          if (data.event == onActive2) {
            displayOrientationBefore2 = data.parameters.displayOrientationBefore;
            displayOrientationAfter2 = data.parameters.displayOrientationAfter;
            lifeList2 = data.parameters.lifeList;
            setDisplayOrientation2 = data.parameters.setDisplayOrientation;

            setTimeout(async () => {
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
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
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
     * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_1000
     * @tc.name    : Verify getDisplayOrientation and setDisplayOrientation interfaces
     * @tc.desc    : Different haps set ability1 to LANDSCAPE, and ability1 starts ability2 and sets the status of
                     ability2 to FOLLOW_RECENT.
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1000', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1000 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore1 = undefined;
      let displayOrientationBefore2 = undefined;
      let displayOrientationAfter1 = undefined;
      let displayOrientationAfter2 = undefined;
      let lifeList1 = [];
      let lifeList2 = [];
      let setDisplayOrientation1 = undefined;
      let setDisplayOrientation2 = undefined;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunctionTwo_MainAbility_onActive";
      let listCheck = ["onCreate", "onActive"];

      var subscriber;
      var subscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onActive1) {
            displayOrientationBefore1 = data.parameters.displayOrientationBefore;
            displayOrientationAfter1 = data.parameters.displayOrientationAfter;
            lifeList1 = data.parameters.lifeList;
            setDisplayOrientation1 = data.parameters.setDisplayOrientation;
          }

          if (data.event == onActive2) {
            displayOrientationBefore2 = data.parameters.displayOrientationBefore;
            displayOrientationAfter2 = data.parameters.displayOrientationAfter;
            lifeList2 = data.parameters.lifeList;
            setDisplayOrientation2 = data.parameters.setDisplayOrientation;

            setTimeout(async () => {
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
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
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

    /*
     * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_1100
     * @tc.name    : Verify getDisplayOrientation and setDisplayOrientation interfaces
     * @tc.desc    : Different haps set ability1 to PORTRAIT, and ability1 starts ability2 and sets the status of
                     ability2 to FOLLOW_RECENT.
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1100', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1100 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore1 = undefined;
      let displayOrientationBefore2 = undefined;
      let displayOrientationAfter1 = undefined;
      let displayOrientationAfter2 = undefined;
      let lifeList1 = [];
      let lifeList2 = [];
      let setDisplayOrientation1 = undefined;
      let setDisplayOrientation2 = undefined;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunctionTwo_MainAbility_onActive";
      let listCheck = ["onCreate", "onActive"];

      var subscriber;
      var subscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onActive1) {
            displayOrientationBefore1 = data.parameters.displayOrientationBefore;
            displayOrientationAfter1 = data.parameters.displayOrientationAfter;
            lifeList1 = data.parameters.lifeList;
            setDisplayOrientation1 = data.parameters.setDisplayOrientation;
          }

          if (data.event == onActive2) {
            displayOrientationBefore2 = data.parameters.displayOrientationBefore;
            displayOrientationAfter2 = data.parameters.displayOrientationAfter;
            lifeList2 = data.parameters.lifeList;
            setDisplayOrientation2 = data.parameters.setDisplayOrientation;

            setTimeout(async () => {
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
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
        parameters: {
          number: 6
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
     * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_1200
     * @tc.name    : Verify getDisplayOrientation and setDisplayOrientation interfaces
     * @tc.desc    : Different applications set ability1 to LANDSCAPE, and ability1 starts ability2 and sets the status
                     of ability2 to FOLLOW_RECENT.
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1200', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1200 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore1 = undefined;
      let displayOrientationBefore2 = undefined;
      let displayOrientationAfter1 = undefined;
      let displayOrientationAfter2 = undefined;
      let lifeList1 = [];
      let lifeList2 = [];
      let setDisplayOrientation1 = undefined;
      let setDisplayOrientation2 = undefined;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunctionThree_MainAbility_onActive";
      let listCheck = ["onCreate", "onActive"];

      var subscriber;
      var subscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onActive1) {
            displayOrientationBefore1 = data.parameters.displayOrientationBefore;
            displayOrientationAfter1 = data.parameters.displayOrientationAfter;
            lifeList1 = data.parameters.lifeList;
            setDisplayOrientation1 = data.parameters.setDisplayOrientation;
          }

          if (data.event == onActive2) {
            displayOrientationBefore2 = data.parameters.displayOrientationBefore;
            displayOrientationAfter2 = data.parameters.displayOrientationAfter;
            lifeList2 = data.parameters.lifeList;
            setDisplayOrientation2 = data.parameters.setDisplayOrientation;

            setTimeout(async () => {
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
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
        parameters: {
          number: 7
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
     * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_1300
     * @tc.name    : Verify getDisplayOrientation and setDisplayOrientation interfaces
     * @tc.desc    : Different applications set ability1 to PORTRAIT, and ability1 starts ability2 and sets the status
                     of ability2 to FOLLOW_RECENT.
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1300', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1300 == ';
      console.log(TAG + "begin");

      let displayOrientationBefore1 = undefined;
      let displayOrientationBefore2 = undefined;
      let displayOrientationAfter1 = undefined;
      let displayOrientationAfter2 = undefined;
      let lifeList1 = [];
      let lifeList2 = [];
      let setDisplayOrientation1 = undefined;
      let setDisplayOrientation2 = undefined;
      let onActive1 = "Fa_SupportFunction_MainAbility4_onActive";
      let onActive2 = "Fa_SupportFunctionThree_MainAbility_onActive";
      let listCheck = ["onCreate", "onActive"];

      var subscriber;
      var subscribeInfo = {
        events: [onActive1, onActive2]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onActive1) {
            displayOrientationBefore1 = data.parameters.displayOrientationBefore;
            displayOrientationAfter1 = data.parameters.displayOrientationAfter;
            lifeList1 = data.parameters.lifeList;
            setDisplayOrientation1 = data.parameters.setDisplayOrientation;
          }

          if (data.event == onActive2) {
            displayOrientationBefore2 = data.parameters.displayOrientationBefore;
            displayOrientationAfter2 = data.parameters.displayOrientationAfter;
            lifeList2 = data.parameters.lifeList;
            setDisplayOrientation2 = data.parameters.setDisplayOrientation;

            setTimeout(async () => {

            }, 1000);

            setTimeout(async () => {
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
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility4",
        parameters: {
          number: 8
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
     * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_1400
     * @tc.name    : Verify setDisplayOrientation interfaces
     * @tc.desc    : SetDisplayOrientation input parameter is undefined.
     */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1400', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1400 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility6_onActive";
      let displayOrientationErr = "Fa_SupportFunction_MainAbility6_displayOrientationErr";

      var subscriber;
      var subscribeInfo = {
        events: [onActive, displayOrientationErr]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == displayOrientationErr) {
            status1 = true;
          }
          if (data.event == onActive) {
            lifeList = data.parameters.lifeList;

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertTrue();
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

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility6",
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
    * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_1500
    * @tc.name    : Verify setDisplayOrientation interfaces
    * @tc.desc    : SetDisplayOrientation input parameter is -1.
    */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1500', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1500 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility6_onActive";
      let displayOrientationErr = "Fa_SupportFunction_MainAbility6_displayOrientationErr";

      var subscriber;
      var subscribeInfo = {
        events: [onActive, displayOrientationErr]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == displayOrientationErr) {
            status1 = true;
          }
          if (data.event == onActive) {
            lifeList = data.parameters.lifeList;

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertTrue();
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

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility6",
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
    * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_1600
    * @tc.name    : Verify setDisplayOrientation interfaces
    * @tc.desc    : SetDisplayOrientation input parameter is a nonexistent enumeration value.
    */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1600', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1600 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility6_onActive";
      let displayOrientationErr = "Fa_SupportFunction_MainAbility6_displayOrientationErr";

      var subscriber;
      var subscribeInfo = {
        events: [onActive, displayOrientationErr]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == displayOrientationErr) {
            status1 = true;
          }
          if (data.event == onActive) {
            lifeList = data.parameters.lifeList;

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertTrue();
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

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility6",
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
    * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_1700
    * @tc.name    : Verify setDisplayOrientation interfaces
    * @tc.desc    : SetDisplayOrientation input parameter is a value of string type.
    */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1700', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1700 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility6_onActive";
      let displayOrientationErr = "Fa_SupportFunction_MainAbility6_displayOrientationErr";

      var subscriber;
      var subscribeInfo = {
        events: [onActive, displayOrientationErr]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == displayOrientationErr) {
            status1 = true;
          }
          if (data.event == onActive) {
            lifeList = data.parameters.lifeList;

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertTrue();
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

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility6",
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
    * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_1800
    * @tc.name    : Verify setDisplayOrientation interfaces
    * @tc.desc    : SetDisplayOrientation input parameter is of type array.
    */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1800', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1800 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility6_onActive";
      let displayOrientationErr = "Fa_SupportFunction_MainAbility6_displayOrientationErr";

      var subscriber;
      var subscribeInfo = {
        events: [onActive, displayOrientationErr]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == displayOrientationErr) {
            status1 = true;
          }
          if (data.event == onActive) {
            lifeList = data.parameters.lifeList;

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertTrue();
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

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility6",
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

    /*
    * @tc.number  : SUB_AA_OpenHarmony_DisplayOrientation_1900
    * @tc.name    : Verify setDisplayOrientation interfaces
    * @tc.desc    : SetDisplayOrientation input parameter is of type json.
    */
    it('SUB_AA_OpenHarmony_DisplayOrientation_1900', 0, async function (done) {
      TAG = 'SUB_AA_OpenHarmony_DisplayOrientation_1900 == ';
      console.log(TAG + "begin");

      let status1 = undefined;
      let lifeList = [];
      let listCheck = ["onCreate", "onActive"];
      let onActive = "Fa_SupportFunction_MainAbility6_onActive";
      let displayOrientationErr = "Fa_SupportFunction_MainAbility6_displayOrientationErr";

      var subscriber;
      var subscribeInfo = {
        events: [onActive, displayOrientationErr]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == displayOrientationErr) {
            status1 = true;
          }
          if (data.event == onActive) {
            lifeList = data.parameters.lifeList;

            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertTrue();
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

      let wantNum = {
        bundleName: "ohos.acts.aafwk.test.fasupportfunction",
        abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility6",
        parameters: {
          number: 6
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