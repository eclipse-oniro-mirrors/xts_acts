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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import CommonEventManager from '@ohos.commonEventManager'
import rpc from '@ohos.rpc'
import Want from '@ohos.app.ability.Want';

const MAX_MISSION_NUM = 1024;

let systemAppCalleeABundleName = "com.example.systemappcalleea";
let systemAppCalleeAMainAbilityName = "com.example.systemappcalleea.MainAbility";
let thirdAppABundleName = "com.example.thirdappa";
let thirdAppAMainAbilityName = "com.example.thirdappa.MainAbility";
let thirdCallTestBundleName = "com.example.thirdcalltest";
let thirdCallTestMainAbilityName = "com.example.thirdcalltest.MainAbility";
let thirdCallTestSecondAbilityName = "com.example.thirdcalltest.SecondAbility";
let thirdCallTestThirdAbilityName = "com.example.thirdcalltest.ThirdAbility";
let thirdCallTestForthAbilityName = "com.example.thirdcalltest.ForthAbility";
let thirdCallTestFifthAbilityName = "com.example.thirdcalltest.FifthAbility";
let subscriberInfo:CommonEventManager.CommonEventSubscribeInfo = {
  events: ["CallTest"],
};

class MySequenceable {
  num: number = 0;
  str: string = "default";
  result: string = "default";

  constructor(num:number, string:string, result:string) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  setMySequence(num:number, string:string, result:string) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  marshalling(messageParcel:rpc.MessageParcel) {
    messageParcel.writeInt(this.num);
    messageParcel.writeString(this.str);
    messageParcel.writeString(this.result);
    return true;
  }

  unmarshalling(messageParcel:rpc.MessageParcel) {
    this.num = messageParcel.readInt();
    this.str = messageParcel.readString();
    this.result = messageParcel.readString();
    return true;
  }
}

function delay(time:number) {
  let delta:number = 0;
  if (typeof time != 'number' || time <= 0) {
    delta = 100;
  } else {
    delta = Math.round(time);
  }
  for (let start = Date.now(); Date.now() - start <= delta; );
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {

    beforeEach(async (done:Function) => {
      done();
    })

    afterEach(async (done:Function) => {
      setTimeout(() => {
        done();
      }, 500)
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1100
     * @tc.name: The thirdApp is not allowed to startAbilityByCall.
     * @tc.desc: Verify that the thirdApp is not allowed to startAbilityByCall.
     */
    it('ACTS_CommonComponent_Call_1100', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_CommonComponent_Call_1100 begin');
      let want:Want = {
        bundleName: thirdCallTestBundleName,
        abilityName: thirdCallTestForthAbilityName,
      }
      globalThis.abilityContext.startAbilityByCall(want)
        .then(() => {
          console.info(`ACTS_CommonComponent_Call_1100 startAbilityByCall SUCCESS`);
          expect().assertFail();
          done();
        })
        .catch(() => {
          console.info(`ACTS_CommonComponent_Call_1100 startAbilityByCall Catch`);
          done();
        });
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1500
     * @tc.name: The thirdApp is not allowed to startAbilityByCall.
     * @tc.desc: Verify that the thirdApp is not allowed to startAbilityByCall.
     */
    it('ACTS_CommonComponent_Call_1500', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_CommonComponent_Call_1500 begin');
      let want:Want = {
        bundleName: systemAppCalleeABundleName,
        abilityName: systemAppCalleeAMainAbilityName,
      }
      globalThis.abilityContext.startAbilityByCall(want)
        .then(()=> {
          console.info(`ACTS_CommonComponent_Call_1500 startAbilityByCall SUCCESS`);
          expect().assertFail();
          done();
        })
        .catch(() => {
          console.info(`ACTS_CommonComponent_Call_1500 startAbilityByCall Catch`);
          done();
        });
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_1600
     * @tc.name: The thirdApp is not allowed to startAbilityByCall.
     * @tc.desc: Verify that the thirdApp is not allowed to startAbilityByCall.
     */
    it('ACTS_CommonComponent_Call_1600', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_CommonComponent_Call_1600 begin');
      let want:Want = {
        bundleName: thirdAppABundleName,
        abilityName: thirdAppAMainAbilityName,
      }
      globalThis.abilityContext.startAbilityByCall(want)
        .then(() => {
          console.info(`ACTS_CommonComponent_Call_1600 startAbilityByCall SUCCESS`);
          expect().assertFail();
          done();
        })
        .catch(() => {
          console.info(`ACTS_CommonComponent_Call_1600 startAbilityByCall Catch`);
          done();
        });
    })
  })
}