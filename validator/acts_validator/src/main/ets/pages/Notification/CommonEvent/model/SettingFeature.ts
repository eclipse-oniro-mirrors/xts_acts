/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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
import common from '@ohos.app.ability.common';
import consts from './Consts';
import dataPreferences from '@ohos.data.preferences';
import Logger from '../../../model/Logger';
import surveillanceEventsManager from './SurveillanceEventsManager';
export default class SettingFeature {
  private innerContext: common.UIAbilityContext = null
  private pref: dataPreferences.Preferences = null

  constructor(abilityContext: common.UIAbilityContext) {
    this.innerContext = abilityContext
  }

  async init() {
    await dataPreferences.getPreferences(this.innerContext, consts.DATA_BASE_NAME).then((pref=>{
      this.pref = pref
    })).catch(err=>{
      Logger.info(`getPreferences err ${JSON.stringify(err)}`)
    })
  }

  changeState(group: string, state: number) {
    console.info('changeState==group=='+group)
    console.info('changeState==state=='+state)
    globalThis.settings.set(group, state);
    let options = {
      isSticky: true,
      parameters: surveillanceEventsManager.getSurveillanceEventStates()
    }
      commonEvent.publish(consts.COMMON_EVENT_SETTING_UPDATE, options, () => {
      Logger.info('success to publish setting update event')
    })
  }

  checkStateForAlways(group: string): boolean {
    return globalThis.settings.get(group) == consts.ENABLE_STATE_ALWAYS
  }

  checkStateForNever(group: string): boolean {
    return globalThis.settings.get(group) == consts.ENABLE_STATE_NEVER
  }

  changeStateToAlways(group: string) {
    this.changeState(group, consts.ENABLE_STATE_ALWAYS)
  }

  changeStateToNever(group: string) {
    this.changeState(group, consts.ENABLE_STATE_NEVER)
  }
}