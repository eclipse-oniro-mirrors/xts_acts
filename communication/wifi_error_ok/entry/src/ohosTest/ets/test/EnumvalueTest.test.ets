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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import wifindktest from 'libwifindk.so';

function sleep(delay: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, delay));
}

export default function EnumValueTest() {
  describe('EnumValueTest', () => {
    beforeAll(() => {
      console.info('beforeAll end');
    })
    beforeEach(() => {
      console.info('beforeEach');
    })
    afterEach(() => {
      console.info('afterEach');
    })
    afterAll(() => {
      console.info('afterAll');
    })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_ENUM_0100
     * @tc.number SUB_COMMUNICATION_WIFI_ENUM_0100
     * @tc.desc   OH_WifiLinkType enumvalue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_ENUM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>OHWifiLinkTypeEnumValue0100 start====");
          let result1: number = wifindktest.OHWifiLinkTypeEnumValue0100();
          console.info("OHWifiLinkTypeEnumValue0100 is " + result1);
          expect(result1 === -1).assertTrue();
          let result2: number = wifindktest.OHWifiLinkTypeEnumValue0200();
          console.info("OHWifiLinkTypeEnumValue0200 is " + result2);
          expect(result2 === 0).assertTrue();
          let result3: number = wifindktest.OHWifiLinkTypeEnumValue0300();
          console.info("OHWifiLinkTypeEnumValue0300 is " + result3);
          expect(result3 === 1).assertTrue();
          let result4: number = wifindktest.OHWifiLinkTypeEnumValue0400();
          console.info("OHWifiLinkTypeEnumValue0400 is " + result4);
          expect(result4 === 2).assertTrue();
          let result5: number = wifindktest.OHWifiLinkTypeEnumValue0500();
          console.info("OHWifiLinkTypeEnumValue0500 is " + result5);
          expect(result5 === 3).assertTrue();
          let result6: number = wifindktest.OHWifiLinkTypeEnumValue0600();
          console.info("OHWifiLinkTypeEnumValue0600 is " + result6);
          expect(result6 === 4).assertTrue();
          let result7: number = wifindktest.OHWifiLinkTypeEnumValue0700();
          console.info("OHWifiLinkTypeEnumValue0700 is " + result7);
          expect(result7 === 5).assertTrue();
          console.info("====>OHWifiLinkTypeEnumValue0700 END====");
          done();
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_ENUM_0100 catch err: " + err);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_ENUM_0200
     * @tc.number SUB_COMMUNICATION_WIFI_ENUM_0200
     * @tc.desc   OH_WifiLinkType enumvalue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_ENUM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>OHWifiConnStateEnumValue0100 start====");
          let result1: number = wifindktest.OHWifiConnStateEnumValue0100();
          console.info("OHWifiConnStateEnumValue0100 is " + result1);
          expect(result1 === 0).assertTrue();
          let result2: number = wifindktest.OHWifiConnStateEnumValue0200();
          console.info("OHWifiConnStateEnumValue0200 is " + result2);
          expect(result2 === 1).assertTrue();
          let result3: number = wifindktest.OHWifiConnStateEnumValue0300();
          console.info("OHWifiConnStateEnumValue0300 is " + result3);
          expect(result3 === 2).assertTrue();
          let result4: number = wifindktest.OHWifiConnStateEnumValue0400();
          console.info("OHWifiConnStateEnumValue0400 is " + result4);
          expect(result4 === 3).assertTrue();
          let result5: number = wifindktest.OHWifiConnStateEnumValue0500();
          console.info("OHWifiConnStateEnumValue0500 is " + result5);
          expect(result5 === 4).assertTrue();
          let result6: number = wifindktest.OHWifiConnStateEnumValue0600();
          console.info("OHWifiConnStateEnumValue0600 is " + result6);
          expect(result6 === 5).assertTrue();
          let result7: number = wifindktest.OHWifiConnStateEnumValue0700();
          console.info("OHWifiConnStateEnumValue0700 is " + result7);
          expect(result7 === 6).assertTrue();
		  let result8: number = wifindktest.OHWifiConnStateEnumValue0800();
          console.info("OHWifiConnStateEnumValue0800 is " + result8);
          expect(result8 === 7).assertTrue();
		  let result9: number = wifindktest.OHWifiConnStateEnumValue0900();
          console.info("OHWifiConnStateEnumValue0900 is " + result9);
          expect(result9 === 8).assertTrue();
          console.info("====>OHWifiConnStateEnumValue0900 END====");
          done();
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_ENUM_0200 catch err: " + err);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_ENUM_0300
     * @tc.number SUB_COMMUNICATION_WIFI_ENUM_0300
     * @tc.desc   OH_WifiLinkType enumvalue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_ENUM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>OHWifiChannelWidthEnumValue0100 start====");
          let result1: number = wifindktest.OHWifiChannelWidthEnumValue0100();
          console.info("OHWifiChannelWidthEnumValue0100 is " + result1);
          expect(result1 === 0).assertTrue();
          let result2: number = wifindktest.OHWifiChannelWidthEnumValue0200();
          console.info("OHWifiChannelWidthEnumValue0200 is " + result2);
          expect(result2 === 1).assertTrue();
          let result3: number = wifindktest.OHWifiChannelWidthEnumValue0300();
          console.info("OHWifiChannelWidthEnumValue0300 is " + result3);
          expect(result3 === 2).assertTrue();
          let result4: number = wifindktest.OHWifiChannelWidthEnumValue0400();
          console.info("OHWifiChannelWidthEnumValue0400 is " + result4);
          expect(result4 === 3).assertTrue();
          let result5: number = wifindktest.OHWifiChannelWidthEnumValue0500();
          console.info("OHWifiChannelWidthEnumValue0500 is " + result5);
          expect(result5 === 4).assertTrue();
          let result6: number = wifindktest.OHWifiChannelWidthEnumValue0600();
          console.info("OHWifiChannelWidthEnumValue0600 is " + result6);
          expect(result6 === 5).assertTrue();
          console.info("====>OHWifiChannelWidthEnumValue0600 END====");
          done();
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_ENUM_0300 catch err: " + err);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_ENUM_0400
     * @tc.number SUB_COMMUNICATION_WIFI_ENUM_0400
     * @tc.desc   OH_WifiLinkType enumvalue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_ENUM_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>OHWifiCategoryEnumValue0100 start====");
          let result1: number = wifindktest.OHWifiCategoryEnumValue0100();
          console.info("OHWifiCategoryEnumValue0100 is " + result1);
          expect(result1 === 1).assertTrue();
          let result2: number = wifindktest.OHWifiCategoryEnumValue0200();
          console.info("OHWifiCategoryEnumValue0200 is " + result2);
          expect(result2 === 2).assertTrue();
          let result3: number = wifindktest.OHWifiCategoryEnumValue0300();
          console.info("OHWifiCategoryEnumValue0300 is " + result3);
          expect(result3 === 3).assertTrue();
          let result4: number = wifindktest.OHWifiCategoryEnumValue0400();
          console.info("OHWifiCategoryEnumValue0400 is " + result4);
          expect(result4 === 4).assertTrue();
          let result5: number = wifindktest.OHWifiCategoryEnumValue0500();
          console.info("OHWifiCategoryEnumValue0500 is " + result5);
          expect(result5 === 5).assertTrue();
          console.info("====>OHWifiCategoryEnumValue0500 END====");
          done();
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_ENUM_0400 catch err: " + err);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_ENUM_0500
     * @tc.number SUB_COMMUNICATION_WIFI_ENUM_0500
     * @tc.desc   OH_WifiLinkType enumvalue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_ENUM_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>OHWifiStandardEnumValue0100 start====");
          let result1: number = wifindktest.OHWifiStandardEnumValue0100();
          console.info("OHWifiStandardEnumValue0100 is " + result1);
          expect(result1 === 0).assertTrue();
          let result2: number = wifindktest.OHWifiStandardEnumValue0200();
          console.info("OHWifiStandardEnumValue0200 is " + result2);
          expect(result2 === 1).assertTrue();
          let result3: number = wifindktest.OHWifiStandardEnumValue0300();
          console.info("OHWifiStandardEnumValue0300 is " + result3);
          expect(result3 === 2).assertTrue();
          let result4: number = wifindktest.OHWifiStandardEnumValue0400();
          console.info("OHWifiStandardEnumValue0400 is " + result4);
          expect(result4 === 3).assertTrue();
          let result5: number = wifindktest.OHWifiStandardEnumValue0500();
          console.info("OHWifiStandardEnumValue0500 is " + result5);
          expect(result5 === 4).assertTrue();
          let result6: number = wifindktest.OHWifiStandardEnumValue0600();
          console.info("OHWifiStandardEnumValue0600 is " + result6);
          expect(result6 === 5).assertTrue();
          let result7: number = wifindktest.OHWifiStandardEnumValue0700();
          console.info("OHWifiStandardEnumValue0700 is " + result7);
          expect(result7 === 6).assertTrue();
		  let result8: number = wifindktest.OHWifiStandardEnumValue0800();
          console.info("OHWifiStandardEnumValue0800 is " + result8);
          expect(result8 === 7).assertTrue();
          console.info("====>OHWifiStandardEnumValue0800 END====");
          done();
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_ENUM_0500 catch err: " + err);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_FIELD_DECL_0100
     * @tc.number SUB_COMMUNICATION_WIFI_FIELD_DECL_0100
     * @tc.desc   OH_WifiLinkType FIELD_DECL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_FIELD_DECL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_COMMUNICATION_WIFI_FIELD_DECL_0100 start====");
          let result = wifindktest.GetLinkedInfo0400();
          console.info("GetLinkedInfo0400 is " + JSON.stringify(result));
          console.info(`OH_Wifi_GetLinkedInfo ssid:` + result.ssid + `, type: ` + typeof result.ssid);
          expect(typeof result.ssid === `string`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo bssid:` + result.bssid + `, type: ` + typeof result.bssid);
          expect(typeof result.bssid === `string`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo rssi:` + result.rssi + `, type: ` + typeof result.rssi);
          expect(typeof result.rssi === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo band:` + result.band + `, type: ` + typeof result.band);
          expect(typeof result.band === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo linkSpeed:` + result.linkSpeed + `, type: ` + typeof result.linkSpeed);
          expect(typeof result.linkSpeed === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo rxLinkSpeed:` + result.rxLinkSpeed + `, type: ` + typeof result.rxLinkSpeed);
          expect(typeof result.rxLinkSpeed === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo maxSupportedTxLinkSpeed:` + result.maxSupportedTxLinkSpeed + `, type: ` + typeof result.maxSupportedTxLinkSpeed);
          expect(typeof result.maxSupportedTxLinkSpeed === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo maxSupportedRxLinkSpeed:` + result.maxSupportedRxLinkSpeed + `, type: ` + typeof result.maxSupportedRxLinkSpeed);
          expect(typeof result.maxSupportedRxLinkSpeed === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo frequency:` + result.frequency + `, type: ` + typeof result.frequency);
          expect(typeof result.frequency === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo isHidden:` + result.isHidden + `, type: ` + typeof result.isHidden);
          expect(typeof result.isHidden === `boolean`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo isRestricted:` + result.isRestricted + `, type: ` + typeof result.isRestricted);
          expect(typeof result.isRestricted === `boolean`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo macType:` + result.macType + `, type: ` + typeof result.macType);
          expect(typeof result.macType === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo macAddress:` + result.macAddress + `, type: ` + typeof result.macAddress);
          expect(typeof result.macAddress === `string`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo ipAddress:` + result.ipAddress + `, type: ` + typeof result.ipAddress);
          expect(typeof result.ipAddress === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo connState:` + result.connState + `, type: ` + typeof result.connState);
          expect(typeof result.connState === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo channelWidth:` + result.channelWidth + `, type: ` + typeof result.channelWidth);
          expect(typeof result.channelWidth === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo wifiStandard:` + result.wifiStandard + `, type: ` + typeof result.wifiStandard);
          expect(typeof result.wifiStandard === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo supportedWifiCategory:` + result.supportedWifiCategory + `, type: ` + typeof result.supportedWifiCategory);
          expect(typeof result.supportedWifiCategory === `number`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo isHiLinkNetwork:` + result.isHiLinkNetwork + `, type: ` + typeof result.isHiLinkNetwork);
          expect(typeof result.isHiLinkNetwork === `boolean`).assertTrue();
          console.info(`OH_Wifi_GetLinkedInfo wifiLinkType:` + result.wifiLinkType + `, type: ` + typeof result.wifiLinkType);
          expect(typeof result.wifiLinkType === `number`).assertTrue();
          done();
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_ENUM_0500 catch err: " + err);
          expect().assertFail();
        }
      })
  })
}
