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
import ability_featureAbility from '@ohos.ability.featureAbility';
import commonEvent from '@ohos.commonEvent';

var TAG1 = "Fa:SupportFunction:MainAbility2:";
var listPush1 = "Fa_SupportFunction_MainAbility2_";
var lifeList = [];
var lifeListActive = [];
export default {
  async onCreate() {
    console.log(TAG1 + 'onCreate');
    lifeList.push('onCreate');
    lifeListActive.push('onCreate');

    ability_featureAbility.getWant().then(async (data) => {
      console.log(TAG1 + "getWant data = " + JSON.stringify(data));

      if(data.parameters.number == 1) {
        setWakeUpScreenP(ability_featureAbility, undefined)
      }
      if(data.parameters.number == 2) {
        setWakeUpScreenP(ability_featureAbility, 123)
      }
      if(data.parameters.number == 3) {
        setWakeUpScreenP(ability_featureAbility, "true")
      }
      if(data.parameters.number == 4) {
        setWakeUpScreenP(ability_featureAbility, [true, false])
      }
      if(data.parameters.number == 5) {
        setWakeUpScreenP(ability_featureAbility, {status1: true, status2: true})
      }
      await sleep(300);
      lifeList.push('wakeUpScreen');
      lifeListActive.push('wakeUpScreen');
      let options = {
        parameters: {
          lifeList: lifeList
        }
      }
      commonEvent.publish(listPush1 + "wakeUpScreen", options, (err) => {
        console.log(TAG1 + listPush1 + "wakeUpScreen");
      });
    }).catch((error) => {
      console.log(TAG1 + "getWant error = " + JSON.stringify(error));
    })
  },
  onDestroy() {
    console.log(TAG1 + 'onDestroy');
  },
  onActive() {
    console.log(TAG1 + 'onActive');
    lifeListActive.push('onActive');

    let options = {
      parameters: {
        lifeList: lifeListActive
      }
    }
    commonEvent.publish(listPush1 + "onActive", options, (err) => {
      console.log(TAG1 + listPush1 + "onActive");
    });
  },
  onInactive() {
    console.log(TAG1 + 'onInactive');
  },
  onShow() {
    console.log(TAG1 + 'onShow');
  },
  onHide() {
    console.log(TAG1 + 'onHide');
  }
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function setWakeUpScreenP(featureAbility, wakeUp) {
  try {
    console.log(TAG1 + "setWakeUpScreenP start");
    featureAbility.getContext().setWakeUpScreen(wakeUp).then((data) => {
      console.log(TAG1 + "setWakeUpScreen data = " + JSON.stringify(data));
    }).catch((error) => {
      console.log(TAG1 + "setWakeUpScreen error = " + JSON.stringify(error));
    })
  } catch(error) {
    console.log(TAG1 + "setWakeUpScreen catch error = " + JSON.stringify(error));

    commonEvent.publish(listPush1 + "wakeUpErr", (err) => {
      console.log(TAG1 + listPush1 + "wakeUpErr");
    });
  }
}