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

var TAG1 = "Fa:SupportFunction:MainAbility6:";
var listPush1 = "Fa_SupportFunction_MainAbility6_";
var lifeList = [];
export default {
  onCreate() {
    console.log(TAG1 + 'onCreate');
    lifeList.push('onCreate');

    ability_featureAbility.getWant().then((data) => {
      console.log(TAG1 + "getWant data = " + JSON.stringify(data));

      if(data.parameters.number == 1) {
        setDisplayOrientationP(ability_featureAbility, undefined)
      }
      if(data.parameters.number == 2) {
        setDisplayOrientationP(ability_featureAbility, -1)
      }
      if(data.parameters.number == 3) {
        setDisplayOrientationP(ability_featureAbility, 4)
      }
      if(data.parameters.number == 4) {
        setDisplayOrientationP(ability_featureAbility, "1")
      }
      if(data.parameters.number == 5) {
        setDisplayOrientationP(ability_featureAbility, [1, 2])
      }
      if(data.parameters.number == 6) {
        setDisplayOrientationP(ability_featureAbility, {number1: 1, number2: 2})
      }
    }).catch((error) => {
      console.log(TAG1 + "getWant error = " + JSON.stringify(error));
    })
  },
  onDestroy() {
    console.log(TAG1 + 'onDestroy');
  },
  async onActive() {
    console.log(TAG1 + 'onActive');
    lifeList.push('onActive');

    let options = {
      parameters: {
        lifeList: lifeList
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

function setDisplayOrientationP(featureAbility, displayOrientationErr) {
  try {
    console.log(TAG1 + "setDisplayOrientationP start: " + JSON.stringify(displayOrientationErr));
    featureAbility.getContext().setDisplayOrientation(displayOrientationErr).then((data) => {
      console.log(TAG1 + "setDisplayOrientation data = " + JSON.stringify(data));
    }).catch((error) => {
      console.log(TAG1 + "setDisplayOrientation error = " + JSON.stringify(error));
    })
  } catch(error) {
    console.log(TAG1 + "setDisplayOrientation catch error = " + JSON.stringify(error));

    commonEvent.publish(listPush1 + "displayOrientationErr", (err) => {
      console.log(TAG1 + listPush1 + "displayOrientationErr");
    });
  }
}