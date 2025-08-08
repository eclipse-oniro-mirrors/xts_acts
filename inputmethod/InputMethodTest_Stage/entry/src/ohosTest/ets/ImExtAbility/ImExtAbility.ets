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
import inputMethodExtensionAbility from '@ohos.InputMethodExtensionAbility'
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base'

export default class ImExtAbility extends inputMethodExtensionAbility {

  onCreate(want: Want) {
    console.info("inputMethodExtensionAbility onCreate");
    console.info("inputMethodExtensionAbility want.bundleName is: " + want.bundleName);
    console.info("inputMethodExtensionAbility want.moduleName is: " + want.moduleName);
    console.info("inputMethodExtensionAbility want.abilityName is: " + want.abilityName);

    console.info("---------------------------1-----------------------------");
    try{
      this.context.destroy((err, data)=>{
        if(err){
          console.info('destroy001 destroy fail: ' + JSON.stringify(err));
        }
        console.info("destroy001 inputMethodExtensionAbility destroy successfully." + JSON.stringify(data));
      })
    }catch(error){
      console.info('destroy001 destroy catch error: ' + JSON.stringify(error));
    }

    try{
      this.context.destroy().then((data) => {
        console.info("destroy002 terminateSelf success:." + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.info('destroy002 terminateSelf fail: ' + JSON.stringify(err));
      })
    }catch(error){
      console.info('destroy002 destroy catch error: ' + JSON.stringify(error));
    }
  }

  onDestroy() {
    console.info("onDestroy: inputMethodExtensionAbility destroy.");
  }
}
