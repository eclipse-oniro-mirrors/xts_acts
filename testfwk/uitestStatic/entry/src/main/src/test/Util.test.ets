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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import  hilog  from '@ohos.hilog'
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation,
  ComponentEventType, WindowChangeType, UiWindow, ResizeDirection, Point } from '@kit.TestKit'

const abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

class Utils{

  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }
}

async function startAbility(bundleName: string, abilityName: string): Promise<boolean> {
  try {
    await abilityDelegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
    console.info(`UiTestCase, start abilityFinished`);
    hilog.info(domain, tag, `UiTestCase, start abilityFinished`);
    return true;
  } catch(error) {
    console.error(`UiTestCase, start abilityFailed: ${error}`);
    hilog.info(domain, tag, `UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
    return false;
  }
}

async function stopApplication(bundleName: string): Promise<boolean>{
  try {
    await abilityDelegator.executeShellCommand(`aa force-stop ${bundleName} `);
    console.info(`UiTestCase, stop application finished`);
    return true;
  } catch(error) {
    console.error(`UiTestCase,stop application failed: ${JSON.stringify(error)}`);
    return false;
  }
}

async function getInputMethodPermission(driver: Driver) {
  await driver.delayMs(2000);
  let textInput = await driver.findComponent(ON.type('TextInput'));
  if (textInput == null) {
    let scroll = await driver.findComponent(ON.type('Scroll'));
     if (scroll != null) {
       textInput = await scroll.scrollSearch(ON.type('TextInput'));
     }
  }
  if (textInput != null) {
    await textInput.click();
    await driver.delayMs(1000);
  }
  let permissionBtn1 = await driver.findComponent(ON.text('同意'));
  if (permissionBtn1 == null) {
    let scroll = await driver.findComponent(ON.type('Scroll'));
    if (scroll != null) {
      permissionBtn1 = await scroll.scrollSearch(ON.text('同意'));
    }
  }
  if (permissionBtn1 != null) {
    await permissionBtn1.click()
    await driver.delayMs(1000)
  }
  let permissionBtn2 = await driver.findComponent(ON.text('下一步'));
  if (permissionBtn2 != null) {
    await permissionBtn2.click();
    await driver.delayMs(1000);
  }
  let permissionBtn3 = await driver.findComponent(ON.text('完成'));
  if (permissionBtn3 != null) {
    await permissionBtn3.click();
    await driver.delayMs(1000);
  }
}

async function maxUiWindow(driver: Driver, window: UiWindow | null): Promise<boolean> {
  if (window != null) {
    try {
      let windowMode = await window.getWindowMode();
      if (windowMode == WindowMode.FULLSCREEN) {
        console.log(`${tag}, maxUiWindow FULLSCREEN`);
        return true;
      }
      await window.maximize();
      await driver.delayMs(3000);
      return true;
    } catch (error) {
      console.log(`${tag}, maxUiWindow error,${JSON.stringify(error)}`);
      return false;
    }
  } else {
    console.log(`${tag}, maxUiWindow null`);
    return false;
  }
}

export {
  Utils,
  startAbility,
  stopApplication,
  getInputMethodPermission
}