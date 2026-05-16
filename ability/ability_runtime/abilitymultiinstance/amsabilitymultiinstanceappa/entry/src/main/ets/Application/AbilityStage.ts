/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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

import AbilityStage from "@ohos.app.ability.AbilityStage";

const ONACCEPTWANT_KEY_NOTSET_ID = -1;
const ONACCEPTWANT_KEY_UNDEFINED_ID = -2;
let onAcceptWantCalledSeq;

export default class MyAbilityStage extends AbilityStage {
  onCreate() {
    console.log("AbilityMultiInstanceAppA MyAbilityStage onCreate");
    // globalThis.stageOnCreateRun = 1;
    // globalThis.stageContext = this.context;
  }

  onAcceptWant(want) {
    console.log("AbilityMultiInstanceAppA onAcceptWant called want:" + JSON.stringify(want));
    if ((want.parameters == undefined) || (want.parameters.startId == undefined)) {
      console.log("AbilityMultiInstanceAppA specified param err");
      return;
    }

    let abilityId = want.parameters.startId.toString();
    onAcceptWantCalledSeq = "onAcceptWantCalled";
    onAcceptWantCalledSeq += "Id";
    onAcceptWantCalledSeq += abilityId;
    AppStorage.setOrCreate("onAcceptWantCalledSeq", onAcceptWantCalledSeq);

    if (want.parameters.startId == ONACCEPTWANT_KEY_NOTSET_ID) {
      return;
    } else if (want.parameters.startId == ONACCEPTWANT_KEY_UNDEFINED_ID) {
      return undefined;
    }
    AppStorage.setOrCreate("abilityWant", want);
    console.log("AbilityMultiInstanceAppA set globalThis result :" + AppStorage.get("onAcceptWantCalledSeq")!);
    return abilityId;
  }
}