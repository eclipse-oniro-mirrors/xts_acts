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
import Base from '@ohos.base';
import CommonEventManager from '@ohos.commonEventManager';

let printLog1 = "Fa:MainAbility:";
let listPush1 = "Fa_MainAbility_";
class Test {
  onCreate() {
    console.info(printLog1 + 'onCreate');
  }
  onDestroy() {
    console.info(printLog1 + 'onDestroy');
  }
  onActive() {
    console.info(printLog1 + 'onActive');

    setTimeout(()=>{
      ability_featureAbility.hasWindowFocus().then((data) => {
        console.info(printLog1 + "hasWindowFocus data = " + data);
        let ceData: CommonEventManager.CommonEventPublishData = {
          parameters: {
            hasWindowFocus: data
          }
        }
        commonEvent.publish("Fa_MainAbility_HasWindowFocus", ceData, (err: Base.BusinessError) => {
          console.info(printLog1 + listPush1 + "HasWindowFocus");
        });
        ability_featureAbility.terminateSelf().then((data) => {
          console.info(printLog1 + "terminateSelf data = " + JSON.stringify(data));
        }).catch((err: Base.BusinessError) => {
          console.info(printLog1 + "terminateSelf err = " + JSON.stringify(err));
        });
      }).catch((err: Base.BusinessError) => {
        console.info(printLog1 + "hasWindowFocus err = " + JSON.stringify(err));
      });
    }, 3000)

  }
  onInactive() {
    console.info(printLog1 + 'onInactive');
    console.info(printLog1 + 'start send event message');
    commonEvent.publish("Fa_MainAbility_onDestroy", (err) => {
      console.info(printLog1 + listPush1 + "onDestroy" + JSON.stringify(err));
    });
  }
  onShow() {
    console.info(printLog1 + 'onShow');
  }
  onHide() {
    console.info(printLog1 + 'onHide');
  }
}

export default new Test()