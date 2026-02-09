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

import { Driver, ON } from '@ohos.UiTest';

export async function clickRequestPermission(): Promise<void> {
  let uiClickAllowed = "允许本次使用";
  try {
    console.info('nearLink clickRequestPermission start');
    let driver = Driver.create();
    await driver.delayMs(1000);
    let button = await driver.findComponent(ON.text(uiClickAllowed));
    await button.click();
    await driver.delayMs(2000);
    console.info('nearLink clickRequestPermission end');
  } catch (err) {
    console.info('nearLink clickRequestPermission failed');
  }
}

export async function unClickRequestPermission(): Promise<void> {
  let uiClickCancel = "取消";
  try {
    console.info('nearLink unClickRequestPermission start');
    let driver = Driver.create();
    await driver.delayMs(1000);
    let button = await driver.findComponent(ON.text(uiClickCancel));
    await button.click();
    await driver.delayMs(2000);
    console.info('nearLink unClickRequestPermission end');
  } catch (err) {
    console.info('nearLink unClickRequestPermission failed');
  }
}