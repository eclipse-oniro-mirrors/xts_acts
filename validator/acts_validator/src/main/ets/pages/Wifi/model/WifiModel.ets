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

import prompt from '@ohos.promptAction'
import wifi from '@ohos.wifiManager'
import emitter from '@ohos.events.emitter'
import Logger from '../../model/Logger'

const TAG: string = 'WiFiModel'

export type WifiType = {
  ssid: string,
  bssid: string,
  securityType: wifi.WifiSecurityType,
  rssi: number,
  band: number,
  frequency: number,
  timestamp: number
}

export class WifiModel {
  async getScanInfos(): Promise<Array<WifiType>> {
    Logger.info(TAG, 'scanWifi begin')
    let wifiList: Array<WifiType> = []
    let result: Array<wifi.WifiScanInfo> = []
    try {
      result = await wifi.getScanResults()
    } catch (err) {
      Logger.info(TAG, `scan info err: ${JSON.stringify(err)}`)
      return wifiList
    }
    Logger.info(TAG, `scan info call back: ${result.length}`)
    for (var i = 0; i < result.length; ++i) {
      wifiList.push({
        ssid: result[i].ssid,
        bssid: result[i].bssid,
        securityType: result[i].securityType,
        rssi: result[i].rssi,
        band: result[i].band,
        frequency: result[i].frequency,
        timestamp: result[i].timestamp
      })
    }
    return wifiList
  }

  connectNetwork(scanInfo: wifi.WifiScanInfo, psw:string) {
    Logger.info(TAG, `connectNetwork scanInfo=`+JSON.stringify(scanInfo))
    Logger.info(TAG, `connectNetwork psw=${psw}`)
    prompt.showToast({ message: 'connecting', duration: 5000 })
    Logger.info(TAG, `connectNetwork bssid=${scanInfo.bssid}`)
    let deviceConfig: any = {
      ssid: scanInfo.ssid,
      bssid: scanInfo.bssid,
      preSharedKey: psw,
      isHiddenSsid: false,
      securityType: scanInfo.securityType
    }
    try {
      wifi.connectToDevice(deviceConfig)
      Logger.info(TAG, `connectToDevice success`)
      let eventData: emitter.EventData = {
        data: {
          "id": 9,
          "flag": true
        }
      };

      let innerEvent: emitter.InnerEvent = {
        eventId: 9,
        priority: emitter.EventPriority.HIGH
      };

      emitter.emit(innerEvent, eventData);
    } catch (err) {
      Logger.error(TAG, `connectToDevice fail err is ${JSON.stringify(err)}`)
    }
    try {
      wifi.addDeviceConfig(deviceConfig)
    } catch (err) {
      Logger.debug(TAG, `addDeviceConfig fail err is ${JSON.stringify(err)}`)
    }
  }

  resolveIP(ip) {
    let address: string = ip.toString()
    if (address === '0') {
      return '00:00:000:000'
    }
    address.substring(0, 2)
    return `${address.substring(0, 2)}:${address.substring(2, 4)}:${address.substring(4, 7)}:${address.substring(7, 10)}`
  }

  getIpInfo() {
    let ipInfoList = []
    let ipInfo = wifi.getIpInfo()
    Logger.info(`${TAG} getIpInfo=${JSON.stringify(ipInfo)}`)
    ipInfoList.push({ key: 'IP地址:', value: this.resolveIP(ipInfo.ipAddress) })
    ipInfoList.push({ key: '网关:', value: this.resolveIP(ipInfo.gateway) })
    ipInfoList.push({ key: '掩码:', value: this.resolveIP(ipInfo.netmask) })
    ipInfoList.push({ key: '主DNS服务器:', value: this.resolveIP(ipInfo.primaryDns) })
    ipInfoList.push({ key: '备DNS服务器:', value: this.resolveIP(ipInfo.secondDns) })
    ipInfoList.push({ key: 'DHCP服务端ip:', value: this.resolveIP(ipInfo.serverIp) })
    ipInfoList.push({ key: 'IP地址租用时长:', value: ipInfo.leaseDuration.toString() })
    return ipInfoList
  }

  getCountryCode() {
    let countryCodeList = []
    let countryCode = wifi.getCountryCode()
    countryCodeList.push({ key: '国家码：', value: countryCode })
    return countryCodeList
  }

  getFeatureSupport() {
    let featureSupportedList = []
    featureSupportedList.push({
      key: '基础结构模式特性:',
      value: wifi.isFeatureSupported(0x0001).toString()
    })
    featureSupportedList.push({ key: '5 GHz 宽带特性:', value: wifi.isFeatureSupported(0x0002).toString() })
    featureSupportedList.push({
      key: 'GAS/ANQP特性:',
      value: wifi.isFeatureSupported(0x0004).toString()
    })
    featureSupportedList.push({ key: 'WiFi-Direct特性:', value: wifi.isFeatureSupported(0x0008).toString() })
    featureSupportedList.push({ key: 'Soft AP特性:', value: wifi.isFeatureSupported(0x0010).toString() })
    featureSupportedList.push({ key: 'WiFi Aware组网特性:', value: wifi.isFeatureSupported(0x0040).toString() })
    return featureSupportedList
  }
}