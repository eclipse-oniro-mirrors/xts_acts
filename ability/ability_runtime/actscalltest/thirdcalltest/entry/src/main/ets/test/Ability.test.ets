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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import commonEvent from '@ohos.commonEvent'

const MAX_MISSION_NUM = 1024;

var systemAppCalleeABundleName = "com.example.systemappcalleea";
var systemAppCalleeAMainAbilityName = "com.example.systemappcalleea.MainAbility";
var thirdAppABundleName = "com.example.thirdappa";
var thirdAppAMainAbilityName = "com.example.thirdappa.MainAbility";
var thirdCallTestBundleName = "com.example.thirdcalltest";
var thirdCallTestMainAbilityName = "com.example.thirdcalltest.MainAbility";
var thirdCallTestSecondAbilityName = "com.example.thirdcalltest.SecondAbility";
var thirdCallTestThirdAbilityName = "com.example.thirdcalltest.ThirdAbility";
var thirdCallTestForthAbilityName = "com.example.thirdcalltest.ForthAbility";
var thirdCallTestFifthAbilityName = "com.example.thirdcalltest.FifthAbility";
var subscriberInfo = {
  events: ["CallTest"],
};

class MySequenceable {
  num: number = 0;
  str: string = "default";
  result: string = "default";

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

function delay(time) {
  let delta;
  if (typeof time != 'number' || time <= 0) {
    delta = 100;
  } else {
    delta = Math.round(time);
  }
  for (let start = Date.now(); Date.now() - start <= delta; );
}

export default function abilityTest() {
  describe('ActsAbilityTest', function () {

    beforeEach(async (done) => {
      done();
    })

    afterEach(async (done) => {
      setTimeout(() => {
        done();
      }, 500)
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1100
     * @tc.name: The thirdApp is not allowed to startAbilityByCall.
     * @tc.desc: Verify that the thirdApp is not allowed to startAbilityByCall.
     */
    it('ACTS_CommonComponent_Call_1100', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1100 begin');
      let want = {
        bundleName: thirdCallTestBundleName,
        abilityName: thirdCallTestForthAbilityName,
      }
      globalThis.abilityContext.startAbilityByCall(want)
        .then(data => {
          console.info(`ACTS_CommonComponent_Call_1100 startAbilityByCall SUCCESS`);
          expect().assertFail();
          done();
        })
        .catch(error => {
          console.info(`ACTS_CommonComponent_Call_1100 startAbilityByCall Catch`);
          done();
        });
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1500
     * @tc.name: The thirdApp is not allowed to startAbilityByCall.
     * @tc.desc: Verify that the thirdApp is not allowed to startAbilityByCall.
     */
    it('ACTS_CommonComponent_Call_1500', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1500 begin');
      let want = {
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAMainAbilityName,
      }
      globalThis.abilityContext.startAbilityByCall(want)
        .then(data => {
          console.info(`ACTS_CommonComponent_Call_1500 startAbilityByCall SUCCESS`);
          expect().assertFail();
          done();
        })
        .catch(error => {
          console.info(`ACTS_CommonComponent_Call_1500 startAbilityByCall Catch`);
          done();
        });
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1600
     * @tc.name: The thirdApp is not allowed to startAbilityByCall.
     * @tc.desc: Verify that the thirdApp is not allowed to startAbilityByCall.
     */
    it('ACTS_CommonComponent_Call_1600', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_1600 begin');
      let want = {
        bundleName: thirdAppABundleName,
        abilityName: thirdAppAMainAbilityName,
      }
      globalThis.abilityContext.startAbilityByCall(want)
        .then(data => {
          console.info(`ACTS_CommonComponent_Call_1600 startAbilityByCall SUCCESS`);
          expect().assertFail();
          done();
        })
        .catch(error => {
          console.info(`ACTS_CommonComponent_Call_1600 startAbilityByCall Catch`);
          done();
        });
    })
  })
}