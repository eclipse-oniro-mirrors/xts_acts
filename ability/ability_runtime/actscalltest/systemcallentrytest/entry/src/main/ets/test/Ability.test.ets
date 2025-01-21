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
import { describe, afterEach, it, expect } from "@ohos/hypium"
import commonEvent from '@ohos.commonEvent'
import missionManager from '@ohos.application.missionManager'

var sysABundleName = "com.example.systemcalltest";
var sysASecondAbilityName = "com.example.systemcalltest.SecondAbility";

var systemAppCalleeABundleName = "com.example.systemappcalleea";
var systemAppCalleeAMainAbilityName = "com.example.systemappcalleea.MainAbility";
var systemAppCalleeASecondAbilityName = "com.example.systemappcalleea.SecondAbility";
var systemAppCalleeAThirdAbilityName = "com.example.systemappcalleea.ThirdAbility";

var thirdAppABundleName = "com.example.thirdappa";
var thirdAppAMainAbilityName = "com.example.thirdappa.MainAbility";
var subscriberInfo = {
  events: ["CallTest"],
};
var caseDepBundles = [];
var subscriber = null;

const ERROR_CODE_INVALID_PARAM = 401;
const ERROR_CODE_FUNC_REGISTERED = 16200004;
const ERROR_CODE_FUNC_NOT_EXIST = 16200005;
const ERROR_CODE_INNER_ERROR = 16000050;
const ERROR_CODE_TYPE_ERROR = 16000002;

class MySequenceable {
  num: number = 0;
  str: String = "default";
  result: String = "default";

  constructor(num, string, result) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  setMySequence(num, string, result) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  marshalling(messageParcel) {
    messageParcel.writeInt(this.num);
    messageParcel.writeString(this.str);
    messageParcel.writeString(this.result);
    return true;
  }

  unmarshalling(messageParcel) {
    this.num = messageParcel.readInt();
    this.str = messageParcel.readString();
    this.result = messageParcel.readString();
    return true;
  }
}

export default function abilityTest() {
  describe('ActsAbilityTest', function () {

    afterEach(async (done) => {
      if (subscriber != null) {
        commonEvent.unsubscribe(subscriber, () => {
          console.log('======>afterEach unsubscribe<=======');
        });
        subscriber = null;
      }
      setTimeout(() => {
        done();
      }, 200)
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0100
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0100', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0100 begin');
      let want = {
        bundleName: sysABundleName,
        abilityName: sysASecondAbilityName,
      }
      globalThis.abilityContext.startAbilityByCall(want)
        .then(data => {
          console.info(`ACTS_CommonComponent_Call_0100 startAbilityByCall SUCCESS`);
          expect().assertFail();
          done();
        })
        .catch(error => {
          console.info(`ACTS_CommonComponent_Call_0100 startAbilityByCall Catch error:  ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(ERROR_CODE_INNER_ERROR)
          done();
        });
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0300
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0300 begin');
      caseDepBundles = [systemAppCalleeABundleName];

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_0300 unSubscribeCallBack')
        subscriber = null;
        done();
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0300 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_0300 subscribeCallBack data:' + JSON.stringify(data))
        expect(data.data).assertEqual('calleeCheckCallParam');
        expect(data.parameters.num).assertEqual(300);
        expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_0300');
        expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_0300processed');
        console.log('ACTS_CommonComponent_Call_0300 do release');
        caller.release();
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);

      let caller = await globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAMainAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(300, "ACTS_CommonComponent_Call_0300", 'default');
      caller.call('testCall', param).then(() => {
        console.log('ACTS_CommonComponent_Call_0300 call success');
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0300 call exception' + err);
        expect().assertFail();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0400
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0400', 0, async function (done) {
      caseDepBundles = [systemAppCalleeABundleName];
      console.log('ACTS_CommonComponent_Call_0400 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0400 releaseCallBack' + data);
        done();
      }

      let caller = await globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAMainAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(400, "ACTS_CommonComponent_Call_0400", 'default');
      caller.callWithResult('testCallWithResult', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_0400 call success');
        var result = new MySequenceable(0, '', '');
        data.readParcelable(result);
        expect(result.num).assertEqual(400);
        expect(result.str).assertEqual('ACTS_CommonComponent_Call_0400');
        expect(result.result).assertEqual('ACTS_CommonComponent_Call_0400processed');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0400 call exception' + err);
        expect().assertFail();
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0500
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0500', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0500 begin');
      var caller1;
      var caller2;
      caseDepBundles = [systemAppCalleeABundleName];

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_0500 unSubscribeCallBack')
        subscriber = null;
        caller1.release();
        done();
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0500 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_0500 subscribeCallBack data:' + JSON.stringify(data))
        expect(data.data).assertEqual('calleeCheckCallParam');
        expect(data.parameters.num).assertEqual(500);
        expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_0500');
        expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_0500processed');
        console.log('ACTS_CommonComponent_Call_0500 do release');
        caller2.release();
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);

      caller1 = await globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAMainAbilityName,
      });

      caller2 = await globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeASecondAbilityName,
      });

      caller2.onRelease(releaseCallback);
      let param = new MySequenceable(500, "ACTS_CommonComponent_Call_0500", 'default');
      caller2.call('testCall', param).then(() => {
        console.log('ACTS_CommonComponent_Call_0500 call success');
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0500 call exception' + err);
        expect().assertFail();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0600
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0600', 0, async function (done) {
      caseDepBundles = [systemAppCalleeABundleName];
      console.log('ACTS_CommonComponent_Call_0600 begin');

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0600 releaseCallBack' + data);
        caller1.release();
        done();
      }

      let caller1 = await globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAMainAbilityName,
      });
      let caller2 = await globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeASecondAbilityName,
      });

      caller2.onRelease(releaseCallback);
      let param = new MySequenceable(600, "ACTS_CommonComponent_Call_0600", 'default');
      caller2.callWithResult('testCallWithResult', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_0600 call success');
        var result = new MySequenceable(0, '', '');
        data.readParcelable(result);
        expect(result.num).assertEqual(600);
        expect(result.str).assertEqual('ACTS_CommonComponent_Call_0600');
        expect(result.result).assertEqual('ACTS_CommonComponent_Call_0600processed');
        caller2.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0600 call exception' + err);
        expect().assertFail();
        caller2.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0700
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0700', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0700 begin');
      var caller;
      caseDepBundles = [systemAppCalleeABundleName];

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_0700 unSubscribeCallBack')
        subscriber = null;
        done();
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0700 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function releaseCallback1(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0700 releaseCallBack1' + data);
        setTimeout(() => {
          globalThis.globalThis.abilityContext.startAbilityByCall({
            bundleName: systemAppCalleeABundleName,
            abilityName: systemAppCalleeASecondAbilityName,
          }).then(data => {
            caller = data;
            console.log('ACTS_CommonComponent_Call_0700 caller get')
            caller.onRelease(releaseCallback);
            let param = new MySequenceable(700, "ACTS_CommonComponent_Call_0700", 'default');
            caller.call('testCall', param).then(() => {
              console.log('ACTS_CommonComponent_Call_0700 call success');
            }).catch(err => {
              console.log('ACTS_CommonComponent_Call_0700 call exception' + err);
              expect().assertFail();
            })
          })
        }, 100);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_0700 subscribeCallBack data:' + JSON.stringify(data))
        expect(data.data).assertEqual('calleeCheckCallParam');
        expect(data.parameters.num).assertEqual(700);
        expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_0700');
        expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_0700processed');
        console.log('ACTS_CommonComponent_Call_0700 do release');
        caller.release();
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);

      globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeASecondAbilityName,
      }).then(data => {
        caller = data;
        console.log('ACTS_CommonComponent_Call_0700 caller get')
        caller.onRelease(releaseCallback1);
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0800
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0800', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0800 begin');
      var caller;
      caseDepBundles = [systemAppCalleeABundleName];

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0800 releaseCallBack' + data);
        done();
      }

      function releaseCallback1(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0800 releaseCallBack' + data);
        setTimeout(() => {
          globalThis.globalThis.abilityContext.startAbilityByCall({
            bundleName: systemAppCalleeABundleName,
            abilityName: systemAppCalleeASecondAbilityName,
          }).then(data => {
            caller = data;
            caller.onRelease(releaseCallback);
            let param = new MySequenceable(800, "ACTS_CommonComponent_Call_0800", 'default');
            caller.callWithResult('testCallWithResult', param).then((data) => {
              console.log('ACTS_CommonComponent_Call_0800 call success');
              var result = new MySequenceable(0, '', '');
              data.readParcelable(result);
              expect(result.num).assertEqual(800);
              expect(result.str).assertEqual('ACTS_CommonComponent_Call_0800');
              expect(result.result).assertEqual('ACTS_CommonComponent_Call_0800processed');
              caller.release();
            }).catch(err => {
              console.log('ACTS_CommonComponent_Call_0800 call exception' + err);
              expect().assertFail();
              caller.release();
            })
          });
        }, 100);
      }

      globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeASecondAbilityName,
      }).then(data => {
        caller = data;
        console.log('ACTS_CommonComponent_Call_0800 caller get')
        caller.onRelease(releaseCallback1);
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_0900
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_0900', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_0900 begin');
      caseDepBundles = [thirdAppABundleName];
      var caller;

      function unSubscribeCallBack() {
        console.log('ACTS_CommonComponent_Call_0900 unSubscribeCallBack')
        subscriber = null;
        done();
      }

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_0900 releaseCallBack' + data);
        commonEvent.unsubscribe(subscriber, unSubscribeCallBack);
      }

      function subscribeCallBack(err, data) {
        console.log('ACTS_CommonComponent_Call_0900 subscribeCallBack data:' + JSON.stringify(data))
        expect(data.data).assertEqual('calleeCheckCallParam');
        expect(data.parameters.num).assertEqual(900);
        expect(data.parameters.str).assertEqual('ACTS_CommonComponent_Call_0900');
        expect(data.parameters.result).assertEqual('ACTS_CommonComponent_Call_0900processed');
        console.log('AMS_CallTest_0900 do release');
        caller.release();
      }

      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, subscribeCallBack);
      caller = await globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: thirdAppABundleName,
        abilityName: thirdAppAMainAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(900, "ACTS_CommonComponent_Call_0900", 'default');
      caller.call('testCall', param).then(() => {
        console.log('ACTS_CommonComponent_Call_0900 call success');
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_0900 call exception' + err);
        expect().assertFail();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1000
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1000', 0, async function (done) {
      caseDepBundles = [thirdAppABundleName];
      console.log('ACTS_CommonComponent_Call_1000 begin');
      var caller;

      function releaseCallback(data) {
        expect(data).assertEqual('release');
        console.log('ACTS_CommonComponent_Call_1000 releaseCallBack' + data);
        done();
      }

      caller = await globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: thirdAppABundleName,
        abilityName: thirdAppAMainAbilityName,
      });

      caller.onRelease(releaseCallback);
      let param = new MySequenceable(1000, "ACTS_CommonComponent_Call_1000", 'default');
      caller.callWithResult('testCallWithResult', param).then((data) => {
        console.log('ACTS_CommonComponent_Call_1000 call success');
        var result = new MySequenceable(0, '', '');
        data.readParcelable(result);
        expect(result.num).assertEqual(1000);
        expect(result.str).assertEqual('ACTS_CommonComponent_Call_1000');
        expect(result.result).assertEqual('ACTS_CommonComponent_Call_1000processed');
        caller.release();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_1000 call exception' + err);
        expect().assertFail();
        caller.release();
      })
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1700
     * @tc.name: The parameter "method" of the Caller.callWithResult function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Caller.callWithResult function is an empty string.
     */
    it('ACTS_CommonComponent_Call_1700', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1700 begin');
      var exceptionFlag = false;

      await globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAThirdAbilityName,
      }).then(data => {
        console.log('ACTS_CommonComponent_Call_1700 call ok return is ' + JSON.stringify(data));
        if (data != null) {
          exceptionFlag = true;
        }
      }).catch(err => {
        expect().assertFail();
        done();
      });

      expect(exceptionFlag).assertEqual(true);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3100
     * @tc.name: The parameter method of the Callee.on function is an empty string.
     * @tc.desc: Verify that the parameter method of the Callee.on function is an empty string.
     */
    it('ACTS_CommonComponent_Call_3100', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3100 begin');

      function onTest(data) {
        console.log('ACTS_CommonComponent_Call_3100 onTest');
      }

      let finishFlag = 0;
      try {
        globalThis.callee.on('', onTest);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3100 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3200
     * @tc.name: The parameter method of the Callee.on function is null.
     * @tc.desc: Verify that the parameter method of the Callee.on function is null.
     */
    it('ACTS_CommonComponent_Call_3200', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3200 begin');

      function onTest(data) {
        console.log('ACTS_CommonComponent_Call_3200 onTest');
      }

      let finishFlag = 0;
      try {
        globalThis.callee.on(null, onTest);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3200 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3300
     * @tc.name: The parameter method of the Caller.callWithResult function is undefined.
     * @tc.desc: Verify that the parameter method of the Caller.callWithResult function is undefined.
     */
    it('ACTS_CommonComponent_Call_3300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3300 begin');

      function onTest(data) {
        console.log('ACTS_CommonComponent_Call_3300 onTest');
      }

      let finishFlag = 0;
      try {
        globalThis.callee.on(undefined, onTest);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3300 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3400
     * @tc.name: The parameter "method" of the Callee.off function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Callee.off function is an empty string.
     */
    it('ACTS_CommonComponent_Call_3400', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3400 begin');

      let finishFlag = 0;
      try {
        globalThis.callee.off('');
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3400 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3500
     * @tc.name: The parameter "method" of the Callee.off function is null.
     * @tc.desc: Verify that the parameter "method" of the Callee.off function is null.
     */
    it('ACTS_CommonComponent_Call_3500', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3500 begin');

      let finishFlag = 0;
      try {
        globalThis.callee.off(null);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3500 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3600
     * @tc.name: The parameter “method” of the Callee.off function is undefined.
     * @tc.desc: Verify that the parameter “method” of the Callee.off function is undefined.
     */
    it('ACTS_CommonComponent_Call_3600', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3600 begin');

      let finishFlag = 0;
      try {
        globalThis.callee.off(undefined);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3600 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4300
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4300 begin');
      let finishFlag = 0;
      try {
        globalThis.callee.on('testCall', "");
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_4300 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4400
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4400', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4400 begin');
      let finishFlag = 0;
      try {
        globalThis.callee.on('testCall', null);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_4400 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4500
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4500', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4500 begin');
      let finishFlag = 0;
      try {
        globalThis.callee.on('testCall', undefined);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_4500 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5000
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5000', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5000 begin');
      let finishFlag = 0;

      function testCallback_5100() {
        console.log('ACTS_CommonComponent_Call_5000 testCallback');
      }

      try {
        globalThis.callee.on('ACTS_CommonComponent_Call_5000', testCallback_5100);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5000 call err' + err);
        expect().assertFail();
        globalThis.callee.off('ACTS_CommonComponent_Call_5000');
        done();
      }
      try {
        globalThis.callee.on('ACTS_CommonComponent_Call_5000', testCallback_5100);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5000 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_FUNC_REGISTERED);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      globalThis.callee.off('ACTS_CommonComponent_Call_5000');
      console.log('ACTS_CommonComponent_Call_5000 finished');
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5100
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5100', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5100 begin');
      let finishFlag = 0;

      function testCallback_5100() {
        console.log('ACTS_CommonComponent_Call_5100 testCallback');
      }

      try {
        globalThis.callee.on('ACTS_CommonComponent_Call_5100', testCallback_5100);
        globalThis.callee.off('ACTS_CommonComponent_Call_5100');
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5100 first step err' + err);
        expect().assertFail();
        globalThis.callee.off('ACTS_CommonComponent_Call_5100');
        done();
      }
      try {
        globalThis.callee.off('ACTS_CommonComponent_Call_5100');
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5100 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_FUNC_NOT_EXIST);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      console.log('ACTS_CommonComponent_Call_5100 finished');
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5200
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5200', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5200 begin');
      let exceptionFlag = false;


      await globalThis.globalThis.abilityContext.startAbilityByCall(null)
        .then(data => {
          expect().assertFail();
          done();
        }).catch(err => {
          console.log('ACTS_CommonComponent_Call_5200 call err.code: ' + JSON.stringify(err.code) +
            ' err.msg: ' + JSON.stringify(err.message));
          expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
          exceptionFlag = true;
        });

      expect(exceptionFlag).assertEqual(true);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5300
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5300 begin');
      let exceptionFlag = false;

      await globalThis.globalThis.abilityContext.startAbilityByCall({
        bundleName: "",
        abilityName: "",
      }).then(data => {
        expect().assertFail();
        done();
      }).catch(err => {
        console.log('ACTS_CommonComponent_Call_5300 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INNER_ERROR);
        exceptionFlag = true;
      });

      expect(exceptionFlag).assertEqual(true);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5400
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5400', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5400 begin');
      let exceptionFlag = false;

      await globalThis.globalThis.abilityContext.startAbilityByCall(undefined)
        .then(data => {
          expect().assertFail();
          done();
        }).catch(err => {
          console.log('ACTS_CommonComponent_Call_5400 call err.code: ' + JSON.stringify(err.code) +
            ' err.msg: ' + JSON.stringify(err.message));
          expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
          exceptionFlag = true;
        });

      expect(exceptionFlag).assertEqual(true);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_5600
     * @tc.name: The callee exits abnormally after the caller requests the call to be called successfully.
     * @tc.desc: Verify that the caller can unregister the server's death listener.
     */
    it('ACTS_CommonComponent_Call_5600', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5600 begin');

      function releaseCallback(data) {
        console.log('ACTS_CommonComponent_Call_5600 releaseCallBack:' + data);
        expect(data).assertEqual("died");
        done();
      }

      let bundleNameCallee = "com.example.systemappcalleea";
      let abilityNameCallee = "com.example.systemappcalleea.MainAbility";
      let want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
      }
      let caller = await globalThis.globalThis.abilityContext.startAbilityByCall(want);
      if (typeof caller !== "object" || caller == null) {
        console.log('ACTS_CommonComponent_Call_5600 startAbilityByCall fail');
        expect().assertFail();
      }
      try {
        caller.off('release', releaseCallback);
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_5600 Caller onRelease fail ' + e);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_5700
     * @tc.name: The callee exits abnormally after the caller requests the call to be called successfully.
     * @tc.desc: Verify that the caller can unregister the server's death listener.
     */
    it('ACTS_CommonComponent_Call_5700', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5700 begin');

      let bundleNameCallee = "com.example.systemappcalleea";
      let abilityNameCallee = "com.example.systemappcalleea.MainAbility";
      let want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
      }
      let caller = await globalThis.globalThis.abilityContext.startAbilityByCall(want);
      if (typeof caller !== "object" || caller == null) {
        console.log('ACTS_CommonComponent_Call_5700 startAbilityByCall fail');
        expect().assertFail();
        done();
      }
      let releaseCallback = "NotFunction";
      try {
        caller.off('release', releaseCallback);
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_5700 Caller onRelease fail ' + e);
        done();
      }
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_5800
     * @tc.name: The callee exits abnormally after the caller requests the call to be called successfully.
     * @tc.desc: Verify that the caller can unregister the server's death listener.
     */
    it('ACTS_CommonComponent_Call_5800', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5800 begin');

      function releaseCallback(data) {
        console.log('ACTS_CommonComponent_Call_5800 releaseCallBack:' + data);
        expect(data).assertEqual("died");
        done();
      }

      let bundleNameCallee = "com.example.systemappcalleea";
      let abilityNameCallee = "com.example.systemappcalleea.MainAbility";
      let want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
      }
      let caller = await globalThis.globalThis.abilityContext.startAbilityByCall(want);
      if (typeof caller !== "object" || caller == null) {
        console.log('ACTS_CommonComponent_Call_5800 startAbilityByCall fail');
        expect().assertFail();
        done();
      }
      let flag = false;
      try {
        caller.off('Not release', releaseCallback);
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_5800 Caller onRelease fail ' + e);
        done();
      }
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_5900
     * @tc.name: The callee exits abnormally after the caller requests the call to be called successfully.
     * @tc.desc: Verify that the caller can unregister the server's death listener.
     */
    it('ACTS_CommonComponent_Call_5900', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5900 begin');

      let bundleNameCallee = "com.example.systemappcalleea";
      let abilityNameCallee = "com.example.systemappcalleea.MainAbility";
      let want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
      }
      let caller = await globalThis.globalThis.abilityContext.startAbilityByCall(want);
      if (typeof caller !== "object" || caller == null) {
        console.log('ACTS_CommonComponent_Call_5900 startAbilityByCall fail');
        expect().assertFail();
        done();
      }
      let flag = false;
      try {
        caller.off('Not release');
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_5900 Caller onRelease fail ' + e);
        done();
      }
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_6000
     * @tc.name: The callee exits abnormally after the caller requests the call to be called successfully.
     * @tc.desc: Verify that the caller can unregister the server's death listener.
     */
    it('ACTS_CommonComponent_Call_6000', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_6000 begin');

      let bundleNameCallee = "com.example.systemappcalleea";
      let abilityNameCallee = "com.example.systemappcalleea.MainAbility";
      let want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
      }
      let caller = await globalThis.globalThis.abilityContext.startAbilityByCall(want);
      if (typeof caller !== "object" || caller == null) {
        console.log('ACTS_CommonComponent_Call_6000 startAbilityByCall fail');
        expect().assertFail();
        done();
      }
      try {
        caller.off('release');
        done();
      } catch (e) {
        console.log('ACTS_CommonComponent_Call_6000 Caller onRelease fail ' + e);
        expect().assertFail();
        done();
      }
    })
  })
}