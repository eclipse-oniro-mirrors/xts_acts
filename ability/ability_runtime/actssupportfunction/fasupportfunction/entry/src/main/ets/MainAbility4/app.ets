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
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';

const TAG1 = "Fa:SupportFunction:MainAbility4:";
const listPush1 = "Fa_SupportFunction_MainAbility4_";
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

    let displayOrientationBefore:bundle.DisplayOrientation|undefined = undefined;
    let displayOrientationAfter:bundle.DisplayOrientation|undefined  = undefined;
    let setDisplayOrientation = 0;
    let orientation:bundle.DisplayOrientation|undefined = undefined;
    let number:number = -100;
    let wantNum : Want|undefined = undefined;

    await ability_featureAbility.getContext().getDisplayOrientation().then((data) => {
      console.log(TAG1 + "getDisplayOrientation data = " + JSON.stringify(data));
      displayOrientationBefore = data;
    }).catch((error:BusinessError) => {
      console.log(TAG1 + "getDisplayOrientation error = " + JSON.stringify(error));
    })

    await ability_featureAbility.getWant().then((data) => {
      console.log(TAG1 + "getWant data = " + JSON.stringify(data));
      number = data.parameters?.number as number;
    }).catch((error:BusinessError) => {
      console.log(TAG1 + "getWant error = " + JSON.stringify(error));
    })
    if (number == 1) {
      orientation = bundle.DisplayOrientation.LANDSCAPE;
    }
    if (number == 2) {
      orientation = bundle.DisplayOrientation.PORTRAIT;
    }
    if (number == 3) {
      orientation = bundle.DisplayOrientation.LANDSCAPE;
      wantNum = {
          bundleName: "ohos.acts.aafwk.test.fasupportfunction",
          abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility5"
      }
    }
    if (number == 4) {
      orientation = bundle.DisplayOrientation.PORTRAIT;
      wantNum = {
          bundleName: "ohos.acts.aafwk.test.fasupportfunction",
          abilityName: "ohos.acts.aafwk.test.fasupportfunction.MainAbility5"
      }
    }
    if (number == 5) {
      orientation = bundle.DisplayOrientation.LANDSCAPE;
      wantNum = {
          bundleName: "ohos.acts.aafwk.test.fasupportfunction",
          abilityName: "ohos.acts.aafwk.test.fasupportfunctiontwo.MainAbility"
      }
    }
    if (number == 6) {
      orientation = bundle.DisplayOrientation.PORTRAIT;
      wantNum = {
          bundleName: "ohos.acts.aafwk.test.fasupportfunction",
          abilityName: "ohos.acts.aafwk.test.fasupportfunctiontwo.MainAbility"
      }
    }
    if (number == 7) {
      orientation = bundle.DisplayOrientation.LANDSCAPE;
      wantNum = {
          bundleName: "ohos.acts.aafwk.test.fasupportfunctionthree",
          abilityName: "ohos.acts.aafwk.test.fasupportfunctionthree.MainAbility"
      }

    }
    if (number == 8) {
      orientation = bundle.DisplayOrientation.PORTRAIT;
      wantNum =  {
          bundleName: "ohos.acts.aafwk.test.fasupportfunctionthree",
          abilityName: "ohos.acts.aafwk.test.fasupportfunctionthree.MainAbility"
      }

    }

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

    let options:commonEvent.CommonEventPublishData = {
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

    if (wantNum != undefined) {
      await ability_featureAbility.startAbility({want:wantNum}).then((data) => {
        console.log(TAG1 + "startAbility data = " + JSON.stringify(data));
      }).catch((error:BusinessError) => {
        console.log(TAG1 + "startAbility error = " + JSON.stringify(error));
      })
    }
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