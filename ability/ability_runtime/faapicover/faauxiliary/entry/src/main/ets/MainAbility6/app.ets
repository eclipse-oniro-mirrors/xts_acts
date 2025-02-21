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

var printLog1 = "Fa:Auxiliary:MainAbility6:";
var listPush1 = "Fa_Auxiliary_MainAbility6_";
export default {
  onCreate() {
    console.info(printLog1 + 'onCreate');

    setTimeout(()=>{
      let wantNum = {
        want: {
          bundleName: 'ohos.acts.aafwk.test.faauxiliary',
          abilityName: 'ohos.acts.aafwk.test.faauxiliary.MainAbility'
        },
        resultCode: 661
      }
      ability_featureAbility.terminateSelfWithResult(wantNum).then((data) => {
        console.info(printLog1 + "terminateSelfWithResult data = " + JSON.stringify(data));
      }).catch((err) => {
        console.info(printLog1 + "terminateSelfWithResult err = " + JSON.stringify(err));
      });
    }, 3000)
  },
  onDestroy() {
    console.info(printLog1 + 'onDestroy');

    commonEvent.publish(listPush1 + "onDestroy", (err) => {
      console.info(printLog1 + listPush1 + "onDestroy");
    });
  },
  onActive() {
    console.info(printLog1 + 'onActive');
  },
  onInactive() {
    console.info(printLog1 + 'onInactive');
  },
  onShow() {
    console.info(printLog1 + 'onShow');
  },
  onHide() {
    console.info(printLog1 + 'onHide');
  },

  onNewWant(want) {
    console.info(printLog1 + 'onNewWant');

    commonEvent.publish(listPush1 + "onNewWant", (err) => {
      console.info(printLog1 + listPush1 + "onNewWant");
    });
  }
}