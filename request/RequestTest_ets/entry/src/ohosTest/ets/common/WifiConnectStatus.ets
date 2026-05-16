/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import wifiMg from '@ohos.wifiManager';

export async function WifiConnectStatus() {
  try {
    let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
    console.info(`====>wifiConnectStatus WALN connection information:`);
    console.info(`====>wifiConnectStatus speed: ${JSON.stringify(data)}`);
    console.info(`====>wifiConnectStatus lin+kSpeed: ${JSON.stringify(data.linkSpeed)}`);
    console.info(`====>wifiConnectStatus chload: ${JSON.stringify(data.chload)}`);
    console.info(`====>wifiConnectStatus rssi: ${JSON.stringify(data.rssi)}`);
    if (data.connState === wifiMg.ConnState.CONNECTED) {
      console.info('====>WLAN connection established');
    } else {
      throw new Error('====>WLAN Network error');
    }
  } catch (err) {
    console.error(`====>getLinkedInfo promise failed, err:  ${JSON.stringify(err)}`)
    throw err as Error;
  }
}

async function msSleep(timeout: number): Promise<null> {
  return new Promise(resolve => {
    const st = setTimeout(() => {
      resolve(null);
      clearTimeout(st);
    }, timeout);
  });
};