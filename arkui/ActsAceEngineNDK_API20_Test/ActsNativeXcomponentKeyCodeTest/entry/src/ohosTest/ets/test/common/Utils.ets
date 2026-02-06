/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Driver} from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import router from '@ohos.router';

export default class Utils {
  static driver: Driver;

  static async init() {
    Utils.driver = Driver.create();
  }
  
  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static async pushPage(pageTag: string, done?: Function) {
    let options: router.RouterOptions = {
      url: `MainAbility/pages/${pageTag}`,
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info(`get ${pageTag} state success ` + JSON.stringify(pages));
      if (pageTag.indexOf(pages.name) < 0) {
        console.info(`get ${pageTag} state success ` + JSON.stringify(pages.name));
        let result = await router.pushUrl(options);
        await Utils.sleep(2000);
        console.info(`push ${pageTag} page success ` + JSON.stringify(result));
      }
    } catch (err) {
      console.error(`push ${pageTag} page error: ` + err);
    }
    if (done) {
      done();
    }
  }

  static async pushPageNoClear(pageTag: string, done?: Function) {
    let options: router.RouterOptions = {
      url: `MainAbility/pages/${pageTag}`,
    }
    try {
      router.pushUrl(options);
    } catch (err) {
      console.error(`push ${pageTag} page error: ` + err);
    }
    if (done) {
      done();
    }
  }

  static async simulateByShell(cmd: string) {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    return new Promise<string>((resolve, reject) => {
      abilityDelegator.executeShellCommand(cmd, (err, data) => {
        if (err) {
          console.error(`command ${cmd} failed: ${JSON.stringify(err)}`);
          reject("failed");
        } else {
          console.info(`command ${cmd} executed: ${data.stdResult}`);
          resolve("executed");
        }
      });
    })
  }
}
