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
import featureAbility from '@ohos.ability.featureAbility'
import { Component, Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const driver = Driver.create();

export default class Utils {
  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`);
    })
  }

  static async keepClick() {
    console.info('IN keepClick...')
    let index = 1;
    while (index < 10) {
      Utils.sleep(800);
      delegator.executeShellCommand(` uinput -T -c 900 1600 `).then(result => {
        console.info(`UiTestCase, touch abilityFinished: ${result}`)
      }).catch((err: BusinessError) => {
        console.error(`UiTestCase, touch abilityFailed: ${err}`)
      })
      console.info(`Loop ${index} keepClick...`)
      index++;
    }
    console.info('OUT keepClick end...')
  }

  static async confirmScreenCapture() {
    console.info('IN confirmScreenCapture...')
    let btn = await driver.waitForComponent(ON.text("确定"), 10000);
    btn.click();
    console.info('OUT confirmScreenCapture end...')
  }

  static async allowScreenCapture() {
    console.info('IN allowScreenCapture...')
    let btn = await driver.waitForComponent(ON.text("允许"), 2000);
    await btn.click();
    btn = await driver.waitForComponent(ON.text("允许"), 2000);
    await btn.click();
    console.info('OUT allowScreenCapture...')
  }

  static async btnTextScreenCapture() {
    let button = await driver.waitForComponent(ON.text("允许"), 1000)
    if (button == null) {
      return 1;
    } else {
      await button.click();
      return 0;
    }
  }
}