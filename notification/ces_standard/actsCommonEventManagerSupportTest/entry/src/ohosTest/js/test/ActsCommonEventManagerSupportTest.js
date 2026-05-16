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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

export default function ActsCommonEventManagerSupportTest() {
  describe('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST ===>'
    console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST START`)

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_0100
     * @tc.number Sub_Notification_Ces_Publish_Support_0100
     * @tc.desc   This commonEvent means the device state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_0100', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0100 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BOOT_COMPLETED).assertEqual('usual.event.BOOT_COMPLETED')
      expect(commonEventManager.Support.COMMON_EVENT_LOCKED_BOOT_COMPLETED).assertEqual('usual.event.LOCKED_BOOT_COMPLETED')
      expect(commonEventManager.Support.COMMON_EVENT_SHUTDOWN).assertEqual('usual.event.SHUTDOWN')
      expect(commonEventManager.Support.COMMON_EVENT_BATTERY_CHANGED).assertEqual('usual.event.BATTERY_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_CONNECTIVITY_CHANGE).assertEqual('usual.event.CONNECTIVITY_CHANGE')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0100 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_0200
     * @tc.number Sub_Notification_Ces_Publish_Support_0200
     * @tc.desc   This commonEvent means the device battery state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_0200', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0200 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BATTERY_LOW).assertEqual('usual.event.BATTERY_LOW')
      expect(commonEventManager.Support.COMMON_EVENT_BATTERY_OKAY).assertEqual('usual.event.BATTERY_OKAY')
      expect(commonEventManager.Support.COMMON_EVENT_POWER_CONNECTED).assertEqual('usual.event.POWER_CONNECTED')
      expect(commonEventManager.Support.COMMON_EVENT_POWER_DISCONNECTED).assertEqual('usual.event.POWER_DISCONNECTED')
      expect(commonEventManager.Support.COMMON_EVENT_CHARGE_TYPE_CHANGED).assertEqual('usual.event.CHARGE_TYPE_CHANGED')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0200 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_0300
     * @tc.number Sub_Notification_Ces_Publish_Support_0300
     * @tc.desc   This commonEvent means the screen,the thermal state level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_0300', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0300 START`)
      expect(commonEventManager.Support.COMMON_EVENT_SCREEN_OFF).assertEqual('usual.event.SCREEN_OFF')
      expect(commonEventManager.Support.COMMON_EVENT_SCREEN_ON).assertEqual('usual.event.SCREEN_ON')
      expect(commonEventManager.Support.COMMON_EVENT_THERMAL_LEVEL_CHANGED)
        .assertEqual('usual.event.THERMAL_LEVEL_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_PRESENT).assertEqual('usual.event.USER_PRESENT')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0300 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_0400
     * @tc.number Sub_Notification_Ces_Publish_Support_0400
     * @tc.desc   This commonEvent means the time changed , the dialog to dismiss
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_0400', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0400 START`)
      expect(commonEventManager.Support.COMMON_EVENT_TIME_TICK).assertEqual('usual.event.TIME_TICK')
      expect(commonEventManager.Support.COMMON_EVENT_TIME_CHANGED).assertEqual('usual.event.TIME_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_DATE_CHANGED).assertEqual('usual.event.DATE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_TIMEZONE_CHANGED).assertEqual('usual.event.TIMEZONE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_CLOSE_SYSTEM_DIALOGS)
        .assertEqual('usual.event.CLOSE_SYSTEM_DIALOGS')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0400 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_0500
     * @tc.number Sub_Notification_Ces_Publish_Support_0500
     * @tc.desc   This commonEvent means when a new version application package
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_0500', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0500 START`)
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_INSTALLATION_STARTED)
        .assertEqual('usual.event.PACKAGE_INSTALLATION_STARTED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_REPLACED).assertEqual('usual.event.PACKAGE_REPLACED')
      expect(commonEventManager.Support.COMMON_EVENT_MY_PACKAGE_REPLACED).assertEqual('usual.event.MY_PACKAGE_REPLACED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_BUNDLE_REMOVED).assertEqual('usual.event.BUNDLE_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_FULLY_REMOVED).assertEqual('usual.event.PACKAGE_FULLY_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_CHANGED).assertEqual('usual.event.PACKAGE_CHANGED')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0500 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_0600
     * @tc.number Sub_Notification_Ces_Publish_Support_0600
     * @tc.desc   This commonEvent of package
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_0600', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0600 START`)
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_RESTARTED).assertEqual('usual.event.PACKAGE_RESTARTED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_DATA_CLEARED).assertEqual('usual.event.PACKAGE_DATA_CLEARED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_CACHE_CLEARED).assertEqual('usual.event.PACKAGE_CACHE_CLEARED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGES_SUSPENDED).assertEqual('usual.event.PACKAGES_SUSPENDED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGES_UNSUSPENDED).assertEqual('usual.event.PACKAGES_UNSUSPENDED')
      expect(commonEventManager.Support.COMMON_EVENT_MY_PACKAGE_SUSPENDED).assertEqual('usual.event.MY_PACKAGE_SUSPENDED')
      expect(commonEventManager.Support.COMMON_EVENT_MY_PACKAGE_UNSUSPENDED).assertEqual('usual.event.MY_PACKAGE_UNSUSPENDED')
      expect(commonEventManager.Support.COMMON_EVENT_UID_REMOVED).assertEqual('usual.event.UID_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_FIRST_LAUNCH).assertEqual('usual.event.PACKAGE_FIRST_LAUNCH')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0600 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_0700
     * @tc.number Sub_Notification_Ces_Publish_Support_0700
     * @tc.desc   Sent by system package verifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_0700', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0700 START`)
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION).assertEqual('usual.event.PACKAGE_NEEDS_VERIFICATION')
      expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_VERIFIED).assertEqual('usual.event.PACKAGE_VERIFIED')
      expect(commonEventManager.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE).assertEqual('usual.event.EXTERNAL_APPLICATIONS_AVAILABLE')
      expect(commonEventManager.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE).assertEqual('usual.event.EXTERNAL_APPLICATIONS_UNAVAILABLE')
      expect(commonEventManager.Support.COMMON_EVENT_CONFIGURATION_CHANGED).assertEqual('usual.event.CONFIGURATION_CHANGED')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0700 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_0800
     * @tc.number Sub_Notification_Ces_Publish_Support_0800
     * @tc.desc   Send by the smart function when the system in mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_0800', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0800 START`)
      expect(commonEventManager.Support.COMMON_EVENT_LOCALE_CHANGED).assertEqual('usual.event.LOCALE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_MANAGE_PACKAGE_STORAGE)
        .assertEqual('usual.event.MANAGE_PACKAGE_STORAGE')
      expect(commonEventManager.Support.COMMON_EVENT_DRIVE_MODE).assertEqual('common.event.DRIVE_MODE')
      expect(commonEventManager.Support.COMMON_EVENT_HOME_MODE).assertEqual('common.event.HOME_MODE')
      expect(commonEventManager.Support.COMMON_EVENT_OFFICE_MODE).assertEqual('common.event.OFFICE_MODE')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0800 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_0900
     * @tc.number Sub_Notification_Ces_Publish_Support_0900
     * @tc.desc   Remind previous user of that the service
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_0900', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0900 START`)
      expect(commonEventManager.Support.COMMON_EVENT_USER_STARTED).assertEqual('usual.event.USER_STARTED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_BACKGROUND).assertEqual('usual.event.USER_BACKGROUND')
      expect(commonEventManager.Support.COMMON_EVENT_USER_FOREGROUND).assertEqual('usual.event.USER_FOREGROUND')
      expect(commonEventManager.Support.COMMON_EVENT_USER_SWITCHED).assertEqual('usual.event.USER_SWITCHED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_STARTING).assertEqual('usual.event.USER_STARTING')
      expect(commonEventManager.Support.COMMON_EVENT_USER_UNLOCKED).assertEqual('usual.event.USER_UNLOCKED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_STOPPING).assertEqual('usual.event.USER_STOPPING')
      expect(commonEventManager.Support.COMMON_EVENT_USER_STOPPED).assertEqual('usual.event.USER_STOPPED')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_0900 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_1000
     * @tc.number Sub_Notification_Ces_Publish_Support_1000
     * @tc.desc   Distributed account, privacy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_1000', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1000 START`)
      expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN).assertEqual('common.event.DISTRIBUTED_ACCOUNT_LOGIN')
      expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT).assertEqual('common.event.DISTRIBUTED_ACCOUNT_LOGOUT')
      expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_TOKEN_INVALID).assertEqual('common.event.DISTRIBUTED_ACCOUNT_TOKEN_INVALID')
      expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOFF).assertEqual('common.event.DISTRIBUTED_ACCOUNT_LOGOFF')
      expect(commonEventManager.Support.COMMON_EVENT_PRIVACY_STATE_CHANGED).assertEqual('usual.event.PRIVACY_STATE_CHANGED')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1000 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_1100
     * @tc.number Sub_Notification_Ces_Publish_Support_1100
     * @tc.desc   WIFI state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_1100', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1100 START`)
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
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1100 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_1200
     * @tc.number Sub_Notification_Ces_Publish_Support_1200
     * @tc.desc   Bluetooth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_1200', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1200 START`)
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
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1200 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_1300
     * @tc.number Sub_Notification_Ces_Publish_Support_1300
     * @tc.desc   Bluetooth.handsfreeunit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_1300', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1300 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE).assertEqual('usual.event.bluetooth.handsfreeunit.CONNECT_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE).assertEqual('usual.event.bluetooth.handsfreeunit.AUDIO_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT).assertEqual('usual.event.bluetooth.handsfreeunit.AG_COMMON_EVENT')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE).assertEqual('usual.event.bluetooth.handsfreeunit.AG_CALL_STATE_UPDATE')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1300 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_1400
     * @tc.number Sub_Notification_Ces_Publish_Support_1400
     * @tc.desc   Bluetooth.host
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_1400', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1400 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE).assertEqual('usual.event.bluetooth.host.STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE).assertEqual('usual.event.bluetooth.host.REQ_DISCOVERABLE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE).assertEqual('usual.event.bluetooth.host.REQ_ENABLE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE).assertEqual('usual.event.bluetooth.host.REQ_DISABLE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE).assertEqual('usual.event.bluetooth.host.SCAN_MODE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED).assertEqual('usual.event.bluetooth.host.DISCOVERY_STARTED')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED).assertEqual('usual.event.bluetooth.host.DISCOVERY_FINISHED')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE).assertEqual('usual.event.bluetooth.host.NAME_UPDATE')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1400 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_1500
     * @tc.number Sub_Notification_Ces_Publish_Support_1500
     * @tc.desc   Bluetooth.a2dp,Nfc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_1500', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1500 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE).assertEqual('usual.event.bluetooth.a2dpsink.CONNECT_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE).assertEqual('usual.event.bluetooth.a2dpsink.PLAYING_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE).assertEqual('usual.event.bluetooth.a2dpsink.AUDIO_STATE_UPDATE')
      expect(commonEventManager.Support.COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED).assertEqual('usual.event.nfc.action.ADAPTER_STATE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED).assertEqual('usual.event.nfc.action.RF_FIELD_ON_DETECTED')
      expect(commonEventManager.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED).assertEqual('usual.event.nfc.action.RF_FIELD_OFF_DETECTED')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1500 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_1600
     * @tc.number Sub_Notification_Ces_Publish_Support_1600
     * @tc.desc   charging battery,device's ,User,ability,Gps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_1600', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1600 START`)
      expect(commonEventManager.Support.COMMON_EVENT_DISCHARGING).assertEqual('usual.event.DISCHARGING')
      expect(commonEventManager.Support.COMMON_EVENT_CHARGING).assertEqual('usual.event.CHARGING')
      expect(commonEventManager.Support.COMMON_EVENT_CHARGE_IDLE_MODE_CHANGED).assertEqual('usual.event.CHARGE_IDLE_MODE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED).assertEqual('usual.event.DEVICE_IDLE_MODE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_DEVICE_IDLE_EXEMPTION_LIST_UPDATED).assertEqual('usual.event.DEVICE_IDLE_EXEMPTION_LIST_UPDATED')
      expect(commonEventManager.Support.COMMON_EVENT_POWER_SAVE_MODE_CHANGED).assertEqual('usual.event.POWER_SAVE_MODE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_ADDED).assertEqual('usual.event.USER_ADDED')
      expect(commonEventManager.Support.COMMON_EVENT_USER_REMOVED).assertEqual('usual.event.USER_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_ABILITY_ADDED).assertEqual('common.event.ABILITY_ADDED')
      expect(commonEventManager.Support.COMMON_EVENT_ABILITY_REMOVED).assertEqual('common.event.ABILITY_REMOVED')
      expect(commonEventManager.Support.COMMON_EVENT_ABILITY_UPDATED).assertEqual('common.event.ABILITY_UPDATED')
      expect(commonEventManager.Support.COMMON_EVENT_LOCATION_MODE_STATE_CHANGED).assertEqual('usual.event.location.MODE_STATE_CHANGED')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1600 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_1700
     * @tc.number Sub_Notification_Ces_Publish_Support_1700
     * @tc.desc   ivi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_1700', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1700 START`)
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
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1700 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_1800
     * @tc.number Sub_Notification_Ces_Publish_Support_1800
     * @tc.desc   USB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_1800', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1800 START`)
      expect(commonEventManager.Support.COMMON_EVENT_USB_STATE).assertEqual('usual.event.hardware.usb.action.USB_STATE')
      expect(commonEventManager.Support.COMMON_EVENT_USB_PORT_CHANGED).assertEqual('usual.event.hardware.usb.action.USB_PORT_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_USB_DEVICE_ATTACHED).assertEqual('usual.event.hardware.usb.action.USB_DEVICE_ATTACHED')
      expect(commonEventManager.Support.COMMON_EVENT_USB_DEVICE_DETACHED).assertEqual('usual.event.hardware.usb.action.USB_DEVICE_DETACHED')
      expect(commonEventManager.Support.COMMON_EVENT_USB_ACCESSORY_ATTACHED).assertEqual('usual.event.hardware.usb.action.USB_ACCESSORY_ATTACHED')
      expect(commonEventManager.Support.COMMON_EVENT_USB_ACCESSORY_DETACHED).assertEqual('usual.event.hardware.usb.action.USB_ACCESSORY_DETACHED')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1800 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_1900
     * @tc.number Sub_Notification_Ces_Publish_Support_1900
     * @tc.desc   protected common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_1900', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1900 START`)
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
      expect(commonEventManager.Support.COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED).assertEqual('usual.event.data.VISIBLE_ACCOUNTS_UPDATED')
      expect(commonEventManager.Support.COMMON_EVENT_ACCOUNT_DELETED).assertEqual('usual.event.data.ACCOUNT_DELETED')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_1900 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_2000
     * @tc.number Sub_Notification_Ces_Publish_Support_2000
     * @tc.desc   protected common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_2000', Level.LEVEL0, async function () {
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_2000 START`)
      expect(commonEventManager.Support.COMMON_EVENT_FOUNDATION_READY).assertEqual('common.event.FOUNDATION_READY')
      expect(commonEventManager.Support.COMMON_EVENT_AIRPLANE_MODE_CHANGED).assertEqual('usual.event.AIRPLANE_MODE')
      expect(commonEventManager.Support.COMMON_EVENT_SPLIT_SCREEN).assertEqual('common.event.SPLIT_SCREEN')
      expect(commonEventManager.Support.COMMON_EVENT_SLOT_CHANGE).assertEqual('usual.event.SLOT_CHANGE')
      expect(commonEventManager.Support.COMMON_EVENT_SPN_INFO_CHANGED).assertEqual('usual.event.SPN_INFO_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_QUICK_FIX_APPLY_RESULT).assertEqual('usual.event.QUICK_FIX_APPLY_RESULT')
      expect(commonEventManager.Support.COMMON_EVENT_USER_INFO_UPDATED).assertEqual('usual.event.USER_INFO_UPDATED')
      expect(commonEventManager.Support.COMMON_EVENT_HTTP_PROXY_CHANGE).assertEqual('usual.event.HTTP_PROXY_CHANGE')
      expect(commonEventManager.Support.COMMON_EVENT_DOMAIN_ACCOUNT_STATUS_CHANGED).assertEqual('usual.event.DOMAIN_ACCOUNT_STATUS_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_QUICK_FIX_REVOKE_RESULT).assertEqual('usual.event.QUICK_FIX_REVOKE_RESULT')
      console.info(`${TAG} Sub_Notification_Ces_Publish_Support_2000 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2100
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2100
     * @tc.desc   SIM common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2100', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2100 START`)
      expect(commonEventManager.Support.COMMON_EVENT_SIM_STATE_CHANGED).assertEqual('usual.event.SIM_STATE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_SIM_CARD_DEFAULT_SMS_SUBSCRIPTION_CHANGED).assertEqual('usual.event.SIM.DEFAULT_SMS_SUBSCRIPTION_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_SIM_CARD_DEFAULT_DATA_SUBSCRIPTION_CHANGED).assertEqual('usual.event.SIM.DEFAULT_DATA_SUBSCRIPTION_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_SIM_CARD_DEFAULT_MAIN_SUBSCRIPTION_CHANGED).assertEqual('usual.event.SIM.DEFAULT_MAIN_SUBSCRIPTION_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_SIM_CARD_DEFAULT_VOICE_SUBSCRIPTION_CHANGED).assertEqual('usual.event.SIM.DEFAULT_VOICE_SUBSCRIPTION_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_SMS_EMERGENCY_CB_RECEIVE_COMPLETED).assertEqual('usual.event.SMS_EMERGENCY_CB_RECEIVE_COMPLETED')
      expect(commonEventManager.Support.COMMON_EVENT_SMS_CB_RECEIVE_COMPLETED).assertEqual('usual.event.SMS_CB_RECEIVE_COMPLETED')
      expect(commonEventManager.Support.COMMON_EVENT_SMS_WAPPUSH_RECEIVE_COMPLETED).assertEqual('usual.event.SMS_WAPPUSH_RECEIVE_COMPLETED')
      expect(commonEventManager.Support.COMMON_EVENT_OPERATOR_CONFIG_CHANGED).assertEqual('usual.event.OPERATOR_CONFIG_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_CALL_STATE_CHANGED).assertEqual('usual.event.CALL_STATE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_INCOMING_CALL_MISSED).assertEqual('usual.event.INCOMING_CALL_MISSED')
      expect(commonEventManager.Support.COMMON_EVENT_CELLULAR_DATA_STATE_CHANGED).assertEqual('usual.event.CELLULAR_DATA_STATE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_NETWORK_STATE_CHANGED).assertEqual('usual.event.NETWORK_STATE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_SIGNAL_INFO_CHANGED).assertEqual('usual.event.SIGNAL_INFO_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2100 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2200
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2200
     * @tc.desc   STK common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2200', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2200 START`)
      expect(commonEventManager.Support.COMMON_EVENT_STK_COMMAND).assertEqual('usual.event.STK_COMMAND')
      expect(commonEventManager.Support.COMMON_EVENT_STK_SESSION_END).assertEqual('usual.event.STK_SESSION_END')
      expect(commonEventManager.Support.COMMON_EVENT_STK_CARD_STATE_CHANGED).assertEqual('usual.event.STK_CARD_STATE_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_STK_ALPHA_IDENTIFIER).assertEqual('usual.event.STK_ALPHA_IDENTIFIER')
      expect(commonEventManager.Support.COMMON_EVENT_RADIO_STATE_CHANGE).assertEqual('usual.event.RADIO_STATE_CHANGE')
      expect(commonEventManager.Support.COMMON_EVENT_SCREEN_UNLOCKED).assertEqual('usual.event.SCREEN_UNLOCKED')
      expect(commonEventManager.Support.COMMON_EVENT_SCREEN_LOCKED).assertEqual('usual.event.SCREEN_LOCKED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2200 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2300
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2300
     * @tc.desc   HWID common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2300', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2300 START`)
      expect(commonEventManager.Support.COMMON_EVENT_MINORSMODE_ON).assertEqual('usual.event.MINORSMODE_ON')
      expect(commonEventManager.Support.COMMON_EVENT_MINORSMODE_OFF).assertEqual('usual.event.MINORSMODE_OFF')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2300 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2400
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2400
     * @tc.desc   STK common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2400', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2400 START`)
      expect(commonEventManager.Support.COMMON_EVENT_DATA_SHARE_READY).assertEqual('usual.event.DATA_SHARE_READY')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2400 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2500
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2500
     * @tc.desc   enter/exit force sleep common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2500', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2500 START`)
      expect(commonEventManager.Support.COMMON_EVENT_ENTER_FORCE_SLEEP).assertEqual('usual.event.ENTER_FORCE_SLEEP')
      expect(commonEventManager.Support.COMMON_EVENT_EXIT_FORCE_SLEEP).assertEqual('usual.event.EXIT_FORCE_SLEEP')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2500 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2600
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2600
     * @tc.desc   start restore common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2600', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2600 START`)
      expect(commonEventManager.Support.COMMON_EVENT_RESTORE_START).assertEqual('usual.event.RESTORE_START')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2600 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2700
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2700
     * @tc.desc   managed browser policy changed common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2700', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2700 START`)
      expect(commonEventManager.Support.COMMON_EVENT_MANAGED_BROWSER_POLICY_CHANGED)
        .assertEqual('usual.event.MANAGED_BROWSER_POLICY_CHANGED')
      expect(commonEventManager.Support.COMMON_EVENT_MANAGED_BROWSER_POLICY_CHANGED)
        .assertEqual('usual.event.MANAGED_BROWSER_POLICY_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2700 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2800
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2800
     * @tc.desc   default application changed common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2800', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2800 START`)
      expect(commonEventManager.Support.COMMON_EVENT_DEFAULT_APPLICATION_CHANGED)
        .assertEqual('usual.event.DEFAULT_APPLICATION_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2800 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2900
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2900
     * @tc.desc   enter/exit kiosk mode common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2900', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2900 START`)
      expect(commonEventManager.Support.COMMON_EVENT_KIOSK_MODE_ON).assertEqual('usual.event.KIOSK_MODE_ON')
      expect(commonEventManager.Support.COMMON_EVENT_KIOSK_MODE_OFF).assertEqual('usual.event.KIOSK_MODE_OFF')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_2900 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3100
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3100
     * @tc.desc   bluetooth handsfree ag connection state change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3100', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3100 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_CHANGE)
        .assertEqual('usual.event.bluetooth.handsfree.ag.CONNECT_STATE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3100 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3200
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3200
     * @tc.desc   bluetooth a2dp source connection state change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3200', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3200 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_CHANGE)
        .assertEqual('usual.event.bluetooth.a2dpsource.CONNECT_STATE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3200 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3300
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3300
     * @tc.desc   bluetooth avrcp connection state change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3300', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3300 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_CHANGE)
        .assertEqual('usual.event.bluetooth.a2dpsource.AVRCP_CONNECT_STATE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3300 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3400
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3400
     * @tc.desc   bluetooth codec change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3400', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3400 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_CHANGE)
        .assertEqual('usual.event.bluetooth.a2dpsource.CODEC_VALUE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3400 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3500
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3500
     * @tc.desc   bluetooth remote device acl state change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3500', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3500 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_STATE_CHANGE)
        .assertEqual('usual.event.bluetooth.remotedevice.ACL_STATE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3500 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3600
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3600
     * @tc.desc   bluetooth pair state change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3600', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3600 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE_CHANGE)
        .assertEqual('usual.event.bluetooth.remotedevice.PAIR_STATE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3600 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3000
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3000
     * @tc.desc   start/stop screen capture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3000', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3000 START`)
      expect(commonEventManager.Support.COMMON_EVENT_SCREEN_SHARE).assertEqual('usual.event.SCREEN_SHARE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3000 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3700
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3700
     * @tc.desc   SECOND_MOUNTED common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3700', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3700 START`)
      expect(commonEventManager.Support.COMMON_EVENT_SECOND_MOUNTED).assertEqual('usual.event.SECOND_MOUNTED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3700 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3800
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3800
     * @tc.desc   enter/exit force sleep common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3800', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3800 START`)
      expect(commonEventManager.Support.COMMON_EVENT_ENTER_HIBERNATE).assertEqual('usual.event.ENTER_HIBERNATE')
      expect(commonEventManager.Support.COMMON_EVENT_EXIT_HIBERNATE).assertEqual('usual.event.EXIT_HIBERNATE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_3800 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4000
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4000
     * @tc.desc   restore end common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4000', Level.LEVEL0, async  function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4000 START`)
      expect(commonEventManager.Support.COMMON_EVENT_RESTORE_END).assertEqual('usual.event.RESTORE_END')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4000 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4100
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : tablet changed common event
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4100', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4100 START`)
      expect(commonEventManager.Support.COMMON_EVENT_TABLET_MODE_CHANGED).assertEqual('usual.event.TABLET_MODE_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4200
     * @tc.name      : commonEventManager.Support
     * @tc.desc      : lid state common event
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4200', Level.LEVEL0, async function () {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4200 START`)
      expect(commonEventManager.Support.COMMON_EVENT_LID_STATE_CHANGED).assertEqual('usual.event.LID_STATE_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_4200 END`)
    })
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUPPORT_ENUM_TEST END`)
  })

}
