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
export const GetWifiStatus: ()=> number;
export const GetWifiStatus0101: ()=> number;
export const GetWifiStatus0102: ()=> number;
export const GetWifiStatus0103: ()=> number;
export const GetBluetoothSwitchState0100: () => number;
export const GetBluetoothSwitchState0101: () => number;
export const GetBluetoothSwitchState0102: () => number;
export const GetBluetoothSwitchState0103: () => number;
export const GetBluetoothSwitchState0104: () => number;
export const GetBluetoothSwitchState0105: () => number;
export const GetBluetoothSwitchState0106: () => number;
export const GetBluetoothSwitchState0107: () => number;
export const GetDeviceMacAddress0100: () => number;
export const GetDeviceMacAddress0200: () => number;
export const GetDeviceMacAddress0300: () => number;
export const GetDeviceMacAddress0400: () => number;
export const GetDeviceMacAddress0500: () => number;
export const GetDeviceMacAddress0600: () => number;
export const GetDeviceMacAddress0700: () => number;
export const GetDeviceMacAddress0800: () => number;
export const GetLinkedInfo0100: () => number;
export const GetLinkedInfo0200: () => number;
export const GetLinkedInfo0300: () => number;
export const GetLinkedInfo0400: () => {
    ssid: string;
    bssid: string;
    rssi: number;
    band: number;
    linkSpeed: number;
    rxLinkSpeed: number;
    maxSupportedTxLinkSpeed: number;
    maxSupportedRxLinkSpeed: number;
    frequency: number;
    isHidden: boolean;
    isRestricted: boolean;
    macType: number;
    macAddress: string;
    ipAddress: number;
    connState: number;
    channelWidth: number;
    wifiStandard: number;
    supportedWifiCategory: number;
    isHiLinkNetwork: boolean;
    wifiLinkType: number;
};
export const OHWifiLinkTypeEnumValue0100: () => number;
export const OHWifiLinkTypeEnumValue0200: () => number;
export const OHWifiLinkTypeEnumValue0300: () => number;
export const OHWifiLinkTypeEnumValue0400: () => number;
export const OHWifiLinkTypeEnumValue0500: () => number;
export const OHWifiLinkTypeEnumValue0600: () => number;
export const OHWifiLinkTypeEnumValue0700: () => number;

export const OHWifiConnStateEnumValue0100: () => number;
export const OHWifiConnStateEnumValue0200: () => number;
export const OHWifiConnStateEnumValue0300: () => number;
export const OHWifiConnStateEnumValue0400: () => number;
export const OHWifiConnStateEnumValue0500: () => number;
export const OHWifiConnStateEnumValue0600: () => number;
export const OHWifiConnStateEnumValue0700: () => number;
export const OHWifiConnStateEnumValue0800: () => number;
export const OHWifiConnStateEnumValue0900: () => number;

export const OHWifiChannelWidthEnumValue0100: () => number;
export const OHWifiChannelWidthEnumValue0200: () => number;
export const OHWifiChannelWidthEnumValue0300: () => number;
export const OHWifiChannelWidthEnumValue0400: () => number;
export const OHWifiChannelWidthEnumValue0500: () => number;
export const OHWifiChannelWidthEnumValue0600: () => number;

export const OHWifiCategoryEnumValue0100: () => number;
export const OHWifiCategoryEnumValue0200: () => number;
export const OHWifiCategoryEnumValue0300: () => number;
export const OHWifiCategoryEnumValue0400: () => number;
export const OHWifiCategoryEnumValue0500: () => number;

export const OHWifiStandardEnumValue0100: () => number;
export const OHWifiStandardEnumValue0200: () => number;
export const OHWifiStandardEnumValue0300: () => number;
export const OHWifiStandardEnumValue0400: () => number;
export const OHWifiStandardEnumValue0500: () => number;
export const OHWifiStandardEnumValue0600: () => number;
export const OHWifiStandardEnumValue0700: () => number;
export const OHWifiStandardEnumValue0800: () => number;