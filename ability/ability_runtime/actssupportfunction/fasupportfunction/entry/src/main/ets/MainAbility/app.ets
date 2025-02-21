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

var TAG1 = "Fa:SupportFunction:MainAbility:";
var listPush1 = "Fa_SupportFunction_MainAbility_";
var lifeList = [];
var lifeListActive = [];
export default {
  onCreate() {
    console.log(TAG1 + 'onCreate');
    lifeList.push('onCreate');
    lifeListActive.push('onCreate');

    ability_featureAbility.getWant().then((data) => {
      console.log(TAG1 + "getWant data = " + JSON.stringify(data));

      if(data.parameters.number == 1) {
        try {
          ability_featureAbility.getContext().setWakeUpScreen(true).then((data) => {
            console.log(TAG1 + "setWakeUpScreen data = " + JSON.stringify(data));
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
            console.log(TAG1 + "setWakeUpScreen error = " + JSON.stringify(error));
          })
        } catch(error) {
          console.log(TAG1 + "setWakeUpScreen catch error = " + JSON.stringify(error));
        }
      }
      if(data.parameters.number == 2) {
        ability_featureAbility.getContext().setWakeUpScreen(true, (error, data) => {
          console.log(TAG1 + "setWakeUpScreen data = " + JSON.stringify(data));
          console.log(TAG1 + "setWakeUpScreen error = " + JSON.stringify(error));
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
        })
      }
      if(data.parameters.number == 3) {
        try {
          ability_featureAbility.getContext().setWakeUpScreen(false).then((data) => {
            console.log(TAG1 + "setWakeUpScreen data = " + JSON.stringify(data));
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
            console.log(TAG1 + "setWakeUpScreen error = " + JSON.stringify(error));
          })
        } catch(error) {
          console.log(TAG1 + "setWakeUpScreen catch error = " + JSON.stringify(error));
        }
      }
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
  },
  onNewWant(want) {
    console.log(TAG1 + 'onNewWant');
  },
  onStartContinuation() {
    console.log(TAG1 + 'onStartContinuation');
    return true;
  },
  onSaveData(data) {
    console.log(TAG1 + 'onSaveData');
    return true;
  },
  onCompleteContinuation(number) {
    console.log(TAG1 + 'onCompleteContinuation');
  },
  onRestoreData(data) {
    console.log(TAG1 + 'onRestoreData');
  },
  onRemoteTerminated() {
    console.log(TAG1 + 'onRemoteTerminated');
  },
  onSaveAbilityState(outState) {
    console.log(TAG1 + 'onSaveAbilityState');
  },
  onRestoreAbilityState(inState) {
    console.log(TAG1 + 'onRestoreAbilityState');
  },
  onMemoryLevel(level) {
    console.log(TAG1 + 'onMemoryLevel');
  }
}