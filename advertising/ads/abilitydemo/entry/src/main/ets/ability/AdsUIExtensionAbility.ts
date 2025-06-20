/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { UIExtensionContentSession, UIExtensionAbility, Want } from '@kit.AbilityKit';
import Logger from '../log/HiAdLog';

const TAG: string = '[AdsUIExtensionAbility]';

/**
 * UEA入口
 */
export default class AdsUIExtensionAbility extends UIExtensionAbility {
  onCreate() {
    Logger.i(TAG, `AdsUIExtensionAbility test onCreate`);
    Logger.i(TAG, `AdsUIExtensionAbility test onCreate dir :${this.context.cacheDir}`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    Logger.i(TAG, `AdsUIExtensionAbility test onSessionCreate`);
    const storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('session', session);
    storage.setOrCreate('want', want);
    let parameters = want?.parameters;
    Logger.i(TAG, `AdsUIExtensionAbility AdDisplayOptions: ${JSON.stringify(parameters)}`);
    let AdDisplayOptions = want?.parameters["displayOptions"];
    if (AdDisplayOptions["refreshTime"]) {
      Logger.i(TAG, `AdsUIExtensionAbility refreshTime: ${AdDisplayOptions["refreshTime"]}`);
      session.loadContent("pages/AutoRefreshPage", storage);
    } else {
      Logger.i(TAG, `enter loadContent UIExtensionAbilityPage`);
      session.loadContent("pages/UIExtensionAbilityPage", storage);
    }
  }


  onForeground() {
    Logger.i(TAG, `AdsUIExtensionAbility test onForeground`);
  }

  onBackground() {
    Logger.i(TAG, `AdsUIExtensionAbility test onBackground`);
  }

  onDestroy() {
    Logger.i(TAG, `AdsUIExtensionAbility test onDestroy`);
  }
}