/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import wifiManager from '@ohos.wifiManager';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'wifiCallbackTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
  "ssid": "publicTest",
  "bssid": "00:11:22:33:44:55",
  "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
  "preSharedKey": "",
  "isHiddenSsid": false,
  "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
};

let wifiDeviceConfigs: wifiManager.WifiDeviceConfig = {
  "ssid": "TEST_OPEN",
  "bssid": "22:9b:e6:48:1f:5c",
  "preSharedKey": "",
  "isHiddenSsid": false,
  "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
};
export default class CallbackMethods {

  static async getCurrentGroupCallback() : Promise<wifiManager.WifiP2pGroupInfo> {
    return new Promise<wifiManager.WifiP2pGroupInfo>((resolve, reject) => {
      wifiManager.getCurrentGroup((err: BusinessError | null, data: wifiManager.WifiP2pGroupInfo | undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "getCurrentGroup callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            reject(err);
          } else {
            hilog.info(domain, tag, 'getCurrentGroup callback success result:' + JSON.stringify(data));
            if (data != undefined) {
              resolve(data);
            }
          }
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        }
      });
    })
  }

  static async getP2pLinkedInfoCallback() : Promise<wifiManager.WifiP2pLinkedInfo> {
    return new Promise<wifiManager.WifiP2pLinkedInfo>((resolve, reject) => {
      wifiManager.getP2pLinkedInfo((err: BusinessError | null, data: wifiManager.WifiP2pLinkedInfo | undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "getP2pLinkedInfo callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            reject(err);
          } else {
            hilog.info(domain, tag, 'getP2pLinkedInfo callback success result:' + JSON.stringify(data));
            if (data != undefined) {
              resolve(data);
            }
          }
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        }
      });
    })
  }

  static async getP2pPeerDevicesCallback() : Promise<wifiManager.WifiP2pDevice[]> {
    return new Promise<wifiManager.WifiP2pDevice[]>((resolve, reject) => {
      wifiManager.getP2pPeerDevices((err: BusinessError | null, data: wifiManager.WifiP2pDevice[] | undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "getP2pPeerDevices callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            reject(err);
          } else {
            hilog.info(domain, tag, 'getP2pPeerDevices callback success result:' + JSON.stringify(data));
            if (data != undefined) {
              resolve(data);
            }
          }
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        }
      });
    })
  }

  static async getP2pLocalDeviceCallback() : Promise<wifiManager.WifiP2pDevice> {
    return new Promise<wifiManager.WifiP2pDevice>((resolve, reject) => {
      wifiManager.getP2pLocalDevice((err: BusinessError | null, data: wifiManager.WifiP2pDevice | undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "getP2pLocalDevice callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            reject(err);
          } else {
            hilog.info(domain, tag, 'getP2pLocalDevice callback success result:' + JSON.stringify(data));
            if (data != undefined) {
              resolve(data);
            }
          }
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        }
      });
    })
  }

  static async addDeviceConfigCallback() : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      wifiManager.addDeviceConfig(wifiDeviceConfig, (err: BusinessError | null, netWorkId?: int) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "addDeviceConfig callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            reject(err);
          } else {
            hilog.info(domain, tag, 'addDeviceConfig callback success result:' + JSON.stringify(netWorkId));
            if (netWorkId != undefined) {
              resolve(netWorkId);
            }
          }
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        }
      });
    })
  }

  static async addCandidateConfigCallback() : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      wifiManager.addCandidateConfig(wifiDeviceConfigs, (err: BusinessError | null, netWorkId?: int) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "addCandidateConfig callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            reject(err);
          } else {
            hilog.info(domain, tag, 'addCandidateConfig callback success result:' + JSON.stringify(netWorkId));
            if (netWorkId != undefined) {
              resolve(netWorkId);
            }
          }
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        }
      });
    })
  }

  static async removeCandidateConfigCallback(networkNum: int) : Promise<boolean> {
    return new Promise<boolean>((resolve, reject) => {
      wifiManager.removeCandidateConfig(networkNum, (err: BusinessError | null) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "removeCandidateConfig callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            reject(err);
          } else {
            hilog.info(domain, tag, 'removeCandidateConfig callback success');
            resolve(true);
          }
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        }
      });
    })
  }
}