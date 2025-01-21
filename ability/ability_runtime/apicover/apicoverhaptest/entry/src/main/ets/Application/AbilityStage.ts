/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import AbilityStage from "@ohos.app.ability.AbilityStage"
const ONACCEPTWANT_KEY_NOTSET_ID = -1;
const ONACCEPTWANT_KEY_UNDEFINED_ID = -2;
var onAcceptWantCalledSeq;
export default class MyAbilityStage extends AbilityStage {
    onCreate() {
        console.log("[Demo] MyAbilityStage onCreate")
        globalThis.stageContext = this.context;
    }
    onAcceptWant(want) {
      console.log("AbilityMultiInstanceAppA onAcceptWant called want:" + JSON.stringify(want));
      if ((want.parameters == undefined) || (want.parameters.startId == undefined)) {
          console.log("AbilityMultiInstanceAppA specified param err");
          return;
      }

      var abilityId = want.parameters.startId.toString();
      onAcceptWantCalledSeq = "onAcceptWantCalled";
      onAcceptWantCalledSeq += "Id";
      onAcceptWantCalledSeq += abilityId;
      globalThis.onAcceptWantCalledSeq = onAcceptWantCalledSeq;

      if (want.parameters.startId == ONACCEPTWANT_KEY_NOTSET_ID) {
          return;
      } else if (want.parameters.startId == ONACCEPTWANT_KEY_UNDEFINED_ID) {
         return undefined;
      }

      globalThis.abilityWant = want;
      console.log("AbilityMultiInstanceAppA set globalThis result :" + globalThis.onAcceptWantCalledSeq);
      return abilityId;
  }
  onConfigurationUpdate(config) {
      console.log('[Demo] MainAbility onConfigurationUpdate: ' + this.context.config.language);
      console.log('[Demo] MainAbility onConfigurationUpdate: ' + config.language);
      globalThis.UpdateConfiguration_0200 = config.language;
  }
  onNewProcessRequest(want) {
    console.log("onNewProcesssRequest called want:" + JSON.stringify(want));
    return "";
  }
}