/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator: AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const waitUiReadyMs: number = 1000;
const TestTag = 'uitestUiWindowTest';

async function startAbility(bundleName: string, abilityName: string) {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    console.info(`${TestTag}, start abilityFinished: ${result}`)
  }).catch((err: BusinessError) => {
    console.error(`${TestTag}, start abilityFailed: ${err}`)
  })
}

async function stopApplication(bundleName: string) {
  await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
    console.info(`${TestTag}, stop application finished: ${result}`)
  }).catch((err: BusinessError) => {
    console.error(`${TestTag},stop application failed: ${err}`)
  })
}

export default function uiTestApi22Test() {
  describe('UiTest_API22', () => {
    let driver: Driver
    beforeAll(async () => {
      driver = Driver.create();
      await driver.delayMs(1000);
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    afterAll(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   tesIsComponentPresentWhenDragTrue
     * @tc.number UiTest_API22_001
     * @tc.desc   isComponentPresentWhenDrag test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesIsComponentPresentWhenDragTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let to5Btn = await driver.findComponent(ON.id('to5'));
      if (to5Btn == null) {
        let scroll = await driver.findComponent(ON.type('Scroll'))
        to5Btn = await scroll.scrollSearch(ON.id('to5'))

      }
      await to5Btn.click();
      await driver.delayMs(waitUiReadyMs);
      let dragColCom = await driver.findComponent(ON.id('dragCol'));
      await driver.delayMs(waitUiReadyMs);
      let center1 = await dragColCom.getBoundsCenter();
      let dragResultTextCom = await driver.findComponent(ON.id('dragResultText'));
      await driver.delayMs(waitUiReadyMs);
      let center2 = await dragResultTextCom.getBoundsCenter();
      let result = await driver.isComponentPresentWhenDrag(ON.text('ShowDragEventText'), center1, center2)
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue result, ${JSON.stringify(result)}`);
      expect(result).assertTrue();
      let text = await driver.findComponent(ON.text('drag end'));
      expect(text != null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue end`);
    })
  })
}
