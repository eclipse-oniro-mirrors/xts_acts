/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import commonEventManager from '@ohos.commonEventManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsCommonEventManagerSupportTest() {
  describe('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST ===>'
    console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST START`)

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0100
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : This commonEvent means the device state
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0100', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0100 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BOOT_COMPLETED).assertEqual('usual.event.BOOT_COMPLETED')
      expect(commonEventManager.Support.COMMON_EVENT_LOCKED_BOOT_COMPLETED).assertEqual('usual.event.LOCKED_BOOT_COMPLETED')
      expect(commonEventManager.Support.COMMON_EVENT_SHUTDOWN).assertEqual('usual.event.SHUTDOWN')
      expect(commonEventManager.Support.COMMON_EVENT_BATTERY_CHANGED).assertEqual('usual.event.BATTERY_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0200
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : This commonEvent means the device battery state
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0200', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0200 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BATTERY_LOW).assertEqual('usual.event.BATTERY_LOW')
      expect(commonEventManager.Support.COMMON_EVENT_BATTERY_OKAY).assertEqual('usual.event.BATTERY_OKAY')
      expect(commonEventManager.Support.COMMON_EVENT_POWER_CONNECTED).assertEqual('usual.event.POWER_CONNECTED')
      expect(commonEventManager.Support.COMMON_EVENT_POWER_DISCONNECTED).assertEqual('usual.event.POWER_DISCONNECTED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0300
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : This commonEvent means the screen,the thermal state level
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0300', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0300 START`)
      expect(commonEventManager.Support.COMMON_EVENT_SCREEN_OFF).assertEqual('usual.event.SCREEN_OFF')
      expect(commonEventManager.Support.COMMON_EVENT_SCREEN_ON).assertEqual('usual.event.SCREEN_ON')
      expect(commonEventManager.Support.COMMON_EVENT_THERMAL_LEVEL_CHANGED)
        .assertEqual('usual.event.THERMAL_LEVEL_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_PRESENT).assertEqual('usual.event.USER_PRESENT')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0400
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : This commonEvent means the time changed , the dialog to dismiss
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0400', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0400 START`)
      expect(commonEventManager.Support.COMMON_EVENT_TIME_TICK).assertEqual('usual.event.TIME_TICK')
      expect(commonEventManager.Support.COMMON_EVENT_TIME_CHANGED).assertEqual('usual.event.TIME_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_DATE_CHANGED).assertEqual('usual.event.DATE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_TIMEZONE_CHANGED).assertEqual('usual.event.TIMEZONE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_CLOSE_SYSTEM_DIALOGS)
        .assertEqual('usual.event.CLOSE_SYSTEM_DIALOGS')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0400 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0500
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : This commonEvent means when a new version application package
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0500', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0500 START`)
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_REPLACED).assertEqual('usual.event.PACKAGE_REPLACED')
      expect(commonEventManager.Support.COMMON_EVENT_MY_PACKAGE_REPLACED).assertEqual('usual.event.MY_PACKAGE_REPLACED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_BUNDLE_REMOVED).assertEqual('usual.event.BUNDLE_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_FULLY_REMOVED).assertEqual('usual.event.PACKAGE_FULLY_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_CHANGED).assertEqual('usual.event.PACKAGE_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0500 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0600
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : This commonEvent of package
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0600', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0600 START`)
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_RESTARTED).assertEqual('usual.event.PACKAGE_RESTARTED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_DATA_CLEARED).assertEqual('usual.event.PACKAGE_DATA_CLEARED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_CACHE_CLEARED).assertEqual('usual.event.PACKAGE_CACHE_CLEARED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGES_SUSPENDED).assertEqual('usual.event.PACKAGES_SUSPENDED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGES_UNSUSPENDED).assertEqual('usual.event.PACKAGES_UNSUSPENDED')
      expect(commonEventManager.Support.COMMON_EVENT_MY_PACKAGE_SUSPENDED).assertEqual('usual.event.MY_PACKAGE_SUSPENDED')
      expect(commonEventManager.Support.COMMON_EVENT_MY_PACKAGE_UNSUSPENDED).assertEqual('usual.event.MY_PACKAGE_UNSUSPENDED')
      expect(commonEventManager.Support.COMMON_EVENT_UID_REMOVED).assertEqual('usual.event.UID_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_FIRST_LAUNCH).assertEqual('usual.event.PACKAGE_FIRST_LAUNCH')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0600 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0700
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : Sent by system package verifier
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0700', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0700 START`)
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION).assertEqual('usual.event.PACKAGE_NEEDS_VERIFICATION')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_VERIFIED).assertEqual('usual.event.PACKAGE_VERIFIED')
      expect(commonEventManager.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE).assertEqual('usual.event.EXTERNAL_APPLICATIONS_AVAILABLE')
      expect(commonEventManager.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE).assertEqual('usual.event.EXTERNAL_APPLICATIONS_UNAVAILABLE')
      expect(commonEventManager.Support.COMMON_EVENT_CONFIGURATION_CHANGED).assertEqual('usual.event.CONFIGURATION_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0700 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0800
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : Send by the smart function when the system in mode
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0800', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0800 START`)
      expect(commonEventManager.Support.COMMON_EVENT_LOCALE_CHANGED).assertEqual('usual.event.LOCALE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_MANAGE_PACKAGE_STORAGE)
        .assertEqual('usual.event.MANAGE_PACKAGE_STORAGE')
      expect(commonEventManager.Support.COMMON_EVENT_DRIVE_MODE).assertEqual('common.event.DRIVE_MODE')
      expect(commonEventManager.Support.COMMON_EVENT_HOME_MODE).assertEqual('common.event.HOME_MODE')
      expect(commonEventManager.Support.COMMON_EVENT_OFFICE_MODE).assertEqual('common.event.OFFICE_MODE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0800 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0900
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : Remind previous user of that the service
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0900', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0900 START`)
      expect(commonEventManager.Support.COMMON_EVENT_USER_STARTED).assertEqual('usual.event.USER_STARTED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_BACKGROUND).assertEqual('usual.event.USER_BACKGROUND')
      expect(commonEventManager.Support.COMMON_EVENT_USER_FOREGROUND).assertEqual('usual.event.USER_FOREGROUND')
      expect(commonEventManager.Support.COMMON_EVENT_USER_SWITCHED).assertEqual('usual.event.USER_SWITCHED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_STARTING).assertEqual('usual.event.USER_STARTING')
      expect(commonEventManager.Support.COMMON_EVENT_USER_UNLOCKED).assertEqual('usual.event.USER_UNLOCKED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_STOPPING).assertEqual('usual.event.USER_STOPPING')
      expect(commonEventManager.Support.COMMON_EVENT_USER_STOPPED).assertEqual('usual.event.USER_STOPPED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_0900 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1000
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : Distributed account
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1000', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1000 START`)
      expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN).assertEqual('common.event.DISTRIBUTED_ACCOUNT_LOGIN')
      expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT).assertEqual('common.event.DISTRIBUTED_ACCOUNT_LOGOUT')
      expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_TOKEN_INVALID).assertEqual('common.event.DISTRIBUTED_ACCOUNT_TOKEN_INVALID')
      expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOFF).assertEqual('common.event.DISTRIBUTED_ACCOUNT_LOGOFF')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1000 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1100
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : WIFI state
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1100', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1100 START`)
    expect(commonEventManager.Support.COMMON_EVENT_WIFI_POWER_STATE).assertEqual('usual.event.wifi.POWER_STATE')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_SCAN_FINISHED).assertEqual('usual.event.wifi.SCAN_FINISHED')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_RSSI_VALUE).assertEqual('usual.event.wifi.RSSI_VALUE')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_CONN_STATE).assertEqual('usual.event.wifi.CONN_STATE')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_HOTSPOT_STATE).assertEqual('usual.event.wifi.HOTSPOT_STATE')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_AP_STA_JOIN).assertEqual('usual.event.wifi.WIFI_HS_STA_JOIN')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_AP_STA_LEAVE).assertEqual('usual.event.wifi.WIFI_HS_STA_LEAVE')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE).assertEqual('usual.event.wifi.mplink.STATE_CHANGE')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_CONN_STATE).assertEqual('usual.event.wifi.p2p.CONN_STATE_CHANGE')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_STATE_CHANGED).assertEqual('usual.event.wifi.p2p.STATE_CHANGE')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED).assertEqual('usual.event.wifi.p2p.DEVICES_CHANGE')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED).assertEqual('usual.event.wifi.p2p.PEER_DISCOVERY_STATE_CHANGE')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED).assertEqual('usual.event.wifi.p2p.CURRENT_DEVICE_CHANGE')
      expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED).assertEqual('usual.event.wifi.p2p.GROUP_STATE_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1300
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : Bluetooth
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1200', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1200 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_UPDATE).assertEqual('usual.event.bluetooth.handsfree.ag.CONNECT_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CURRENT_DEVICE_UPDATE).assertEqual('usual.event.bluetooth.handsfree.ag.CURRENT_DEVICE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE).assertEqual('usual.event.bluetooth.handsfree.ag.AUDIO_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE).assertEqual('usual.event.bluetooth.handsfree.ag.AUDIO_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_UPDATE).assertEqual('usual.event.bluetooth.a2dpsource.CONNECT_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CURRENT_DEVICE_UPDATE).assertEqual('usual.event.bluetooth.a2dpsource.CURRENT_DEVICE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_PLAYING_STATE_UPDATE).assertEqual('usual.event.bluetooth.a2dpsource.PLAYING_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_UPDATE).assertEqual('usual.event.bluetooth.a2dpsource.AVRCP_CONNECT_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_UPDATE).assertEqual('usual.event.bluetooth.a2dpsource.CODEC_VALUE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_DISCOVERED).assertEqual('usual.event.bluetooth.remotedevice.DISCOVERED')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CLASS_VALUE_UPDATE).assertEqual('usual.event.bluetooth.remotedevice.CLASS_VALUE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_CONNECTED).assertEqual('usual.event.bluetooth.remotedevice.ACL_CONNECTED')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_DISCONNECTED).assertEqual('usual.event.bluetooth.remotedevice.ACL_DISCONNECTED')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_NAME_UPDATE).assertEqual('usual.event.bluetooth.remotedevice.NAME_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE).assertEqual('usual.event.bluetooth.remotedevice.PAIR_STATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_BATTERY_VALUE_UPDATE).assertEqual('usual.event.bluetooth.remotedevice.BATTERY_VALUE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_SDP_RESULT).assertEqual('usual.event.bluetooth.remotedevice.SDP_RESULT')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_UUID_VALUE).assertEqual('usual.event.bluetooth.remotedevice.UUID_VALUE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_REQ).assertEqual('usual.event.bluetooth.remotedevice.PAIRING_REQ')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_CANCEL).assertEqual('usual.event.bluetooth.remotedevice.PAIRING_CANCEL')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REQ).assertEqual('usual.event.bluetooth.remotedevice.CONNECT_REQ')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REPLY).assertEqual('usual.event.bluetooth.remotedevice.CONNECT_REPLY')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_CANCEL).assertEqual('usual.event.bluetooth.remotedevice.CONNECT_CANCEL')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1300
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : Bluetooth.handsfreeunit
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1300', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1300 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE).assertEqual('usual.event.bluetooth.handsfreeunit.CONNECT_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE).assertEqual('usual.event.bluetooth.handsfreeunit.AUDIO_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT).assertEqual('usual.event.bluetooth.handsfreeunit.AG_COMMON_EVENT')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE).assertEqual('usual.event.bluetooth.handsfreeunit.AG_CALL_STATE_UPDATE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1400
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : Bluetooth.host
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1400', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1400 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE).assertEqual('usual.event.bluetooth.host.STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE).assertEqual('usual.event.bluetooth.host.REQ_DISCOVERABLE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE).assertEqual('usual.event.bluetooth.host.REQ_ENABLE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE).assertEqual('usual.event.bluetooth.host.REQ_DISABLE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE).assertEqual('usual.event.bluetooth.host.SCAN_MODE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED).assertEqual('usual.event.bluetooth.host.DISCOVERY_STARTED')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED).assertEqual('usual.event.bluetooth.host.DISCOVERY_FINISHED')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE).assertEqual('usual.event.bluetooth.host.NAME_UPDATE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1400 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1500
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : Bluetooth.a2dp,Nfc
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1500', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1500 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE).assertEqual('usual.event.bluetooth.a2dpsink.CONNECT_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE).assertEqual('usual.event.bluetooth.a2dpsink.PLAYING_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE).assertEqual('usual.event.bluetooth.a2dpsink.AUDIO_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED).assertEqual('usual.event.nfc.action.ADAPTER_STATE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED).assertEqual('usual.event.nfc.action.RF_FIELD_ON_DETECTED')
      expect(commonEventManager.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED).assertEqual('usual.event.nfc.action.RF_FIELD_OFF_DETECTED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1500 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1600
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : charging battery,device's ,User,ability,Gps
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1600', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1600 START`)
      expect(commonEventManager.Support.COMMON_EVENT_DISCHARGING).assertEqual('usual.event.DISCHARGING')
      expect(commonEventManager.Support.COMMON_EVENT_CHARGING).assertEqual('usual.event.CHARGING')
      expect(commonEventManager.Support.COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED).assertEqual('usual.event.DEVICE_IDLE_MODE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_POWER_SAVE_MODE_CHANGED).assertEqual('usual.event.POWER_SAVE_MODE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_ADDED).assertEqual('usual.event.USER_ADDED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_REMOVED).assertEqual('usual.event.USER_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_ABILITY_ADDED).assertEqual('common.event.ABILITY_ADDED')
      expect(commonEventManager.Support.COMMON_EVENT_ABILITY_REMOVED).assertEqual('common.event.ABILITY_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_ABILITY_UPDATED).assertEqual('common.event.ABILITY_UPDATED')
      expect(commonEventManager.Support.COMMON_EVENT_LOCATION_MODE_STATE_CHANGED ).assertEqual('usual.event.location.MODE_STATE_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1600 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1700
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : ivi
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1700', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1700 START`)
      expect(commonEventManager.Support.COMMON_EVENT_IVI_SLEEP).assertEqual('common.event.IVI_SLEEP')
      expect(commonEventManager.Support.COMMON_EVENT_IVI_PAUSE).assertEqual('common.event.IVI_PAUSE')
      expect(commonEventManager.Support.COMMON_EVENT_IVI_STANDBY).assertEqual('common.event.IVI_STANDBY')
      expect(commonEventManager.Support.COMMON_EVENT_IVI_LASTMODE_SAVE).assertEqual('common.event.IVI_LASTMODE_SAVE')
      expect(commonEventManager.Support.COMMON_EVENT_IVI_VOLTAGE_ABNORMAL).assertEqual('common.event.IVI_VOLTAGE_ABNORMAL')
      expect(commonEventManager.Support.COMMON_EVENT_IVI_HIGH_TEMPERATURE).assertEqual('common.event.IVI_HIGH_TEMPERATURE')
      expect(commonEventManager.Support.COMMON_EVENT_IVI_EXTREME_TEMPERATURE).assertEqual('common.event.IVI_EXTREME_TEMPERATURE')
      expect(commonEventManager.Support.COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL).assertEqual('common.event.IVI_TEMPERATURE_ABNORMAL')
      expect(commonEventManager.Support.COMMON_EVENT_IVI_VOLTAGE_RECOVERY).assertEqual('common.event.IVI_VOLTAGE_RECOVERY')
      expect(commonEventManager.Support.COMMON_EVENT_IVI_TEMPERATURE_RECOVERY).assertEqual('common.event.IVI_TEMPERATURE_RECOVERY')
      expect(commonEventManager.Support.COMMON_EVENT_IVI_ACTIVE).assertEqual('common.event.IVI_ACTIVE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1700 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1800
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : USB
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1800', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1800 START`)
      expect(commonEventManager.Support.COMMON_EVENT_USB_STATE).assertEqual('usual.event.hardware.usb.action.USB_STATE')
      expect(commonEventManager.Support.COMMON_EVENT_USB_PORT_CHANGED).assertEqual('usual.event.hardware.usb.action.USB_PORT_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_USB_DEVICE_ATTACHED).assertEqual('usual.event.hardware.usb.action.USB_DEVICE_ATTACHED')
      expect(commonEventManager.Support.COMMON_EVENT_USB_DEVICE_DETACHED).assertEqual('usual.event.hardware.usb.action.USB_DEVICE_DETACHED')
      expect(commonEventManager.Support.COMMON_EVENT_USB_ACCESSORY_ATTACHED).assertEqual('usual.event.hardware.usb.action.USB_ACCESSORY_ATTACHED')
      expect(commonEventManager.Support.COMMON_EVENT_USB_ACCESSORY_DETACHED).assertEqual('usual.event.hardware.usb.action.USB_ACCESSORY_DETACHED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1800 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1900
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : protected common event
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1900', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1900 START`)
      expect(commonEventManager.Support.COMMON_EVENT_DISK_REMOVED).assertEqual('usual.event.data.DISK_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_DISK_UNMOUNTED).assertEqual('usual.event.data.DISK_UNMOUNTED')
      expect(commonEventManager.Support.COMMON_EVENT_DISK_MOUNTED).assertEqual('usual.event.data.DISK_MOUNTED')
      expect(commonEventManager.Support.COMMON_EVENT_DISK_BAD_REMOVAL).assertEqual('usual.event.data.DISK_BAD_REMOVAL')
      expect(commonEventManager.Support.COMMON_EVENT_DISK_UNMOUNTABLE).assertEqual('usual.event.data.DISK_UNMOUNTABLE')
      expect(commonEventManager.Support.COMMON_EVENT_DISK_EJECT).assertEqual('usual.event.data.DISK_EJECT')
      expect(commonEventManager.Support.COMMON_EVENT_VOLUME_REMOVED).assertEqual('usual.event.data.VOLUME_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_VOLUME_UNMOUNTED).assertEqual('usual.event.data.VOLUME_UNMOUNTED')
      expect(commonEventManager.Support.COMMON_EVENT_VOLUME_MOUNTED).assertEqual('usual.event.data.VOLUME_MOUNTED')
      expect(commonEventManager.Support.COMMON_EVENT_VOLUME_BAD_REMOVAL).assertEqual('usual.event.data.VOLUME_BAD_REMOVAL')
      expect(commonEventManager.Support.COMMON_EVENT_VOLUME_EJECT).assertEqual('usual.event.data.VOLUME_EJECT')
      expect(commonEventManager.Support.COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED ).assertEqual('usual.event.data.VISIBLE_ACCOUNTS_UPDATED')
      expect(commonEventManager.Support.COMMON_EVENT_ACCOUNT_DELETED).assertEqual('usual.event.data.ACCOUNT_DELETED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_1900 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2000
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : protected common event
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2000', 0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2000 START`)
      expect(commonEventManager.Support.COMMON_EVENT_FOUNDATION_READY).assertEqual('common.event.FOUNDATION_READY')
      expect(commonEventManager.Support.COMMON_EVENT_AIRPLANE_MODE_CHANGED).assertEqual('usual.event.AIRPLANE_MODE')
      expect(commonEventManager.Support.COMMON_EVENT_SPLIT_SCREEN).assertEqual('common.event.SPLIT_SCREEN')
      expect(commonEventManager.Support.COMMON_EVENT_SLOT_CHANGE).assertEqual('usual.event.SLOT_CHANGE')
      expect(commonEventManager.Support.COMMON_EVENT_SPN_INFO_CHANGED).assertEqual('usual.event.SPN_INFO_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_QUICK_FIX_APPLY_RESULT).assertEqual('usual.event.QUICK_FIX_APPLY_RESULT')
      expect(commonEventManager.Support.COMMON_EVENT_USER_INFO_UPDATED ).assertEqual('usual.event.USER_INFO_UPDATED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2000 END`)
    })

    console.info(`${TAG} SUB_NOTIFICATION_CES_SUPPORT_ENUM_TEST END`)
  })


}
