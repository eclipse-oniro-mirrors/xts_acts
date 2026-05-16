/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { wifiManager } from '@kit.ConnectivityKit'
import { Logger } from './Logger';

export async function CheckWifiInfo() {
  try {
    let wifiLinkedInfo: wifiManager.WifiLinkedInfo = await wifiManager.getLinkedInfo();
    Logger.info(`CheckWifiInfo success ${JSON.stringify(wifiLinkedInfo)}`);
    if (wifiLinkedInfo.connState != wifiManager.ConnState.CONNECTED) {
      throw new Error("WLAN not connected");
    }
    if (wifiLinkedInfo.chload >= 800 || wifiLinkedInfo.rssi <= -80) {
      throw new Error("WLAN connection error");
    }
    if (wifiLinkedInfo.chload >= 500) {
      throw new Error("WLAN connection is poor");
    }
  } catch (err) {
    Logger.error(`CheckWifiInfo catch error ${JSON.stringify(err)}`)
    throw err as Error;
  }
}