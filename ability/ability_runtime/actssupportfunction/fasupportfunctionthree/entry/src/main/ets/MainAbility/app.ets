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
import commonEvent from '@ohos.commonEventManager';
import bundle from '@ohos.bundle';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

const TAG1 = "Fa:SupportFunctionThree:MainAbility:";
const listPush1 = "Fa_SupportFunctionThree_MainAbility_";
let lifeList: string[] = [];

class MainAbility {
  onCreate() {
    console.log(TAG1 + 'onCreate');
    lifeList.push('onCreate');
  }
  onDestroy() {
    console.log(TAG1 + 'onDestroy');
  }
  async onActive() {
    console.log(TAG1 + 'onActive');
    lifeList.push('onActive');

    let displayOrientationBefore: bundle.DisplayOrientation | undefined= undefined;
    let displayOrientationAfter: bundle.DisplayOrientation | undefined = undefined;
    let setDisplayOrientation = 0;
    let orientation = bundle.DisplayOrientation.FOLLOW_RECENT;

    await ability_featureAbility.getContext().getDisplayOrientation().then((data) => {
      console.log(TAG1 + "getDisplayOrientation data = " + JSON.stringify(data));
      displayOrientationBefore = data;
    }).catch((error:BusinessError) => {
      console.log(TAG1 + "getDisplayOrientation error = " + JSON.stringify(error));
    })

    await ability_featureAbility.getContext().setDisplayOrientation(orientation).then((data) => {
      console.log(TAG1 + "setShowOnLockScreen data = " + JSON.stringify(data));
      if (data == undefined) {
        setDisplayOrientation = 1
      } else {
        console.log(`${TAG1} setDisplayOrientation callBack is error: ${JSON.stringify(data)}`);
      }
    }).catch((error:BusinessError) => {
      console.log(TAG1 + "setShowOnLockScreen error = " + JSON.stringify(error));
    })

    await ability_featureAbility.getContext().getDisplayOrientation().then((data) => {
      console.log(TAG1 + "getDisplayOrientation data = " + JSON.stringify(data));
      displayOrientationAfter = data;
    }).catch((error:BusinessError) => {
      console.log(TAG1 + "getDisplayOrientation error = " + JSON.stringify(error));
    })

    let options:commonEventManager.CommonEventPublishData = {
      parameters: {
        displayOrientationBefore: displayOrientationBefore,
        displayOrientationAfter: displayOrientationAfter,
        lifeList: lifeList,
        setDisplayOrientation: setDisplayOrientation,
      }
    }
    commonEvent.publish(listPush1 + "onActive", options, (err) => {
      console.log(TAG1 + listPush1 + "onActive");
    });
  }
  onInactive() {
    console.log(TAG1 + 'onInactive');
  }
  onShow() {
    console.log(TAG1 + 'onShow');
  }
  onHide() {
    console.log(TAG1 + 'onHide');
  }
}

export default new MainAbility();