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
import commonEvent from '@ohos.commonEventManager';
import ability_featureAbility from '@ohos.ability.featureAbility';
import bundle from '@ohos.bundle';

const TAG1 = "Fa:SupportFunction:MainAbility3:";
const listPush1 = "Fa_SupportFunction_MainAbility3_";
let lifeList: string[] = [];
let setDisplayOrientation1 = 0;
class MainAbility {
  onCreate() {
    console.log(TAG1 + 'onCreate');
    lifeList.push('onCreate');
  }
  onDestroy() {
    console.log(TAG1 + 'onDestroy');
  }
  onActive() {
    console.log(TAG1 + 'onActive');
    lifeList.push('onActive');

    let orientation = bundle.DisplayOrientation.UNSPECIFIED;
    ability_featureAbility.getContext().getDisplayOrientation((error, displayOrientationBefore) => {
      console.log(TAG1 + "getDisplayOrientation1 data = " + JSON.stringify(displayOrientationBefore));
      console.log(TAG1 + "getDisplayOrientation1 error = " + JSON.stringify(error));

      ability_featureAbility.getContext().setDisplayOrientation(orientation, (error, setDisplayOrientation) => {
        console.log(TAG1 + "setDisplayOrientation data = " + JSON.stringify(setDisplayOrientation));
        console.log(TAG1 + "setDisplayOrientation error = " + JSON.stringify(error));
        if (setDisplayOrientation == undefined) {
          setDisplayOrientation1 = 1
        } else {
          console.log(`${TAG1} setDisplayOrientation callBack is error: ${JSON.stringify(setDisplayOrientation)}`);
        }

        ability_featureAbility.getContext().getDisplayOrientation((error, displayOrientationAfter) => {
          console.log(TAG1 + "getDisplayOrientation2 data = " + JSON.stringify(displayOrientationAfter));
          console.log(TAG1 + "getDisplayOrientation2 error = " + JSON.stringify(error));

          let options:commonEvent.CommonEventPublishData = {
            parameters: {
              displayOrientationBefore: displayOrientationBefore,
              displayOrientationAfter: displayOrientationAfter,
              lifeList: lifeList,
              setDisplayOrientation: setDisplayOrientation1
            }
          }
          commonEvent.publish(listPush1 + "onActive", options, (err) => {
            console.log(TAG1 + listPush1 + "onActive");
          });
        })
      })
    })
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