/**
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Component, Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

let bundle_name: string = "com.example.actscommoneventmanagersupport.static"
let testAbilityContext: common.UIAbilityContext;
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST ===>'

export default function ActsCommonEventManagerSupportTest() {
  describe('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST', (): void => {
    console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST START`)
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_0100
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_0100
     * @tc.desc   This commonEvent means the device state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0100 START`)
        expect(commonEventManager.Support.COMMON_EVENT_BOOT_COMPLETED as string)
          .assertEqual('usual.event.BOOT_COMPLETED')
        expect(commonEventManager.Support.COMMON_EVENT_LOCKED_BOOT_COMPLETED as string)
          .assertEqual('usual.event.LOCKED_BOOT_COMPLETED')
        expect(commonEventManager.Support.COMMON_EVENT_SHUTDOWN as string).assertEqual('usual.event.SHUTDOWN')
        expect(commonEventManager.Support.COMMON_EVENT_BATTERY_CHANGED as string)
          .assertEqual('usual.event.BATTERY_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_CONNECTIVITY_CHANGE as string)
          .assertEqual('usual.event.CONNECTIVITY_CHANGE')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0100 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_0200
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_0200
     * @tc.desc   This commonEvent means the device battery state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0200 START`)
        expect(commonEventManager.Support.COMMON_EVENT_BATTERY_LOW as string).assertEqual('usual.event.BATTERY_LOW')
        expect(commonEventManager.Support.COMMON_EVENT_BATTERY_OKAY as string).assertEqual('usual.event.BATTERY_OKAY')
        expect(commonEventManager.Support.COMMON_EVENT_POWER_CONNECTED as string)
          .assertEqual('usual.event.POWER_CONNECTED')
        expect(commonEventManager.Support.COMMON_EVENT_POWER_DISCONNECTED as string)
          .assertEqual('usual.event.POWER_DISCONNECTED')
        expect(commonEventManager.Support.COMMON_EVENT_CHARGE_TYPE_CHANGED as string)
          .assertEqual('usual.event.CHARGE_TYPE_CHANGED')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0200 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_0300
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_0300
     * @tc.desc   This commonEvent means the screen,the thermal state level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0300 START`)
        expect(commonEventManager.Support.COMMON_EVENT_SCREEN_OFF as string).assertEqual('usual.event.SCREEN_OFF')
        expect(commonEventManager.Support.COMMON_EVENT_SCREEN_ON as string).assertEqual('usual.event.SCREEN_ON')
        expect(commonEventManager.Support.COMMON_EVENT_THERMAL_LEVEL_CHANGED as string)
          .assertEqual('usual.event.THERMAL_LEVEL_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_SCREEN_UNLOCKED as string)
          .assertEqual('usual.event.SCREEN_UNLOCKED')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0300 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_0400
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_0400
     * @tc.desc   This commonEvent means the time changed , the dialog to dismiss
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0400 START`)
        expect(commonEventManager.Support.COMMON_EVENT_TIME_TICK as string).assertEqual('usual.event.TIME_TICK')
        expect(commonEventManager.Support.COMMON_EVENT_TIME_CHANGED as string).assertEqual('usual.event.TIME_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_DATE_CHANGED as string).assertEqual('usual.event.DATE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_TIMEZONE_CHANGED as string)
          .assertEqual('usual.event.TIMEZONE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_CLOSE_SYSTEM_DIALOGS as string)
          .assertEqual('usual.event.CLOSE_SYSTEM_DIALOGS')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0400 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_0500
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_0500
     * @tc.desc   This commonEvent means when a new version application package
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0500 START`)
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_ADDED as string).assertEqual('usual.event.PACKAGE_ADDED')
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_INSTALLATION_STARTED as string)
          .assertEqual('usual.event.PACKAGE_INSTALLATION_STARTED')
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_REPLACED as string)
          .assertEqual('usual.event.PACKAGE_REPLACED')
        expect(commonEventManager.Support.COMMON_EVENT_MY_PACKAGE_REPLACED as string)
          .assertEqual('usual.event.MY_PACKAGE_REPLACED')
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_REMOVED as string)
          .assertEqual('usual.event.PACKAGE_REMOVED')
        expect(commonEventManager.Support.COMMON_EVENT_BUNDLE_REMOVED as string)
          .assertEqual('usual.event.BUNDLE_REMOVED')
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_FULLY_REMOVED as string)
          .assertEqual('usual.event.PACKAGE_FULLY_REMOVED')
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_CHANGED as string)
          .assertEqual('usual.event.PACKAGE_CHANGED')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0500 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_0600
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_0600
     * @tc.desc   This commonEvent of package
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0600 START`)
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_RESTARTED as string)
          .assertEqual('usual.event.PACKAGE_RESTARTED')
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_DATA_CLEARED as string)
          .assertEqual('usual.event.PACKAGE_DATA_CLEARED')
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_CACHE_CLEARED as string)
          .assertEqual('usual.event.PACKAGE_CACHE_CLEARED')
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGES_SUSPENDED as string)
          .assertEqual('usual.event.PACKAGES_SUSPENDED')
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGES_UNSUSPENDED as string)
          .assertEqual('usual.event.PACKAGES_UNSUSPENDED')
        expect(commonEventManager.Support.COMMON_EVENT_MY_PACKAGE_SUSPENDED as string)
          .assertEqual('usual.event.MY_PACKAGE_SUSPENDED')
        expect(commonEventManager.Support.COMMON_EVENT_MY_PACKAGE_UNSUSPENDED as string)
          .assertEqual('usual.event.MY_PACKAGE_UNSUSPENDED')
        expect(commonEventManager.Support.COMMON_EVENT_UID_REMOVED as string).assertEqual('usual.event.UID_REMOVED')
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_FIRST_LAUNCH as string)
          .assertEqual('usual.event.PACKAGE_FIRST_LAUNCH')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0600 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_0700
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_0700
     * @tc.desc   Sent by system package verifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0700 START`)
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION as string)
          .assertEqual('usual.event.PACKAGE_NEEDS_VERIFICATION')
        expect(commonEventManager.Support.COMMON_EVENT_PACKAGE_VERIFIED as string)
          .assertEqual('usual.event.PACKAGE_VERIFIED')
        expect(commonEventManager.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE as string)
          .assertEqual('usual.event.EXTERNAL_APPLICATIONS_AVAILABLE')
        expect(commonEventManager.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE as string)
          .assertEqual('usual.event.EXTERNAL_APPLICATIONS_UNAVAILABLE')
        expect(commonEventManager.Support.COMMON_EVENT_CONFIGURATION_CHANGED as string)
          .assertEqual('usual.event.CONFIGURATION_CHANGED')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0700 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_0800
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_0800
     * @tc.desc   Send by the smart function when the system in mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0800 START`)
        expect(commonEventManager.Support.COMMON_EVENT_LOCALE_CHANGED as string)
          .assertEqual('usual.event.LOCALE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_MANAGE_PACKAGE_STORAGE as string)
          .assertEqual('usual.event.MANAGE_PACKAGE_STORAGE')
        expect(commonEventManager.Support.COMMON_EVENT_DRIVE_MODE as string).assertEqual('common.event.DRIVE_MODE')
        expect(commonEventManager.Support.COMMON_EVENT_HOME_MODE as string).assertEqual('common.event.HOME_MODE')
        expect(commonEventManager.Support.COMMON_EVENT_OFFICE_MODE as string).assertEqual('common.event.OFFICE_MODE')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0800 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_0900
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_0900
     * @tc.desc   Remind previous user of that the service
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0900 START`)
        expect(commonEventManager.Support.COMMON_EVENT_USER_STARTED as string).assertEqual('usual.event.USER_STARTED')
        expect(commonEventManager.Support.COMMON_EVENT_USER_BACKGROUND as string)
          .assertEqual('usual.event.USER_BACKGROUND')
        expect(commonEventManager.Support.COMMON_EVENT_USER_FOREGROUND as string)
          .assertEqual('usual.event.USER_FOREGROUND')
        expect(commonEventManager.Support.COMMON_EVENT_USER_SWITCHED as string).assertEqual('usual.event.USER_SWITCHED')
        expect(commonEventManager.Support.COMMON_EVENT_USER_STARTING as string).assertEqual('usual.event.USER_STARTING')
        expect(commonEventManager.Support.COMMON_EVENT_USER_UNLOCKED as string).assertEqual('usual.event.USER_UNLOCKED')
        expect(commonEventManager.Support.COMMON_EVENT_USER_STOPPING as string).assertEqual('usual.event.USER_STOPPING')
        expect(commonEventManager.Support.COMMON_EVENT_USER_STOPPED as string).assertEqual('usual.event.USER_STOPPED')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_0900 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_1000
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_1000
     * @tc.desc   Distributed account, privacy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1000 START`)
        expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN as string)
          .assertEqual('common.event.DISTRIBUTED_ACCOUNT_LOGIN')
        expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT as string)
          .assertEqual('common.event.DISTRIBUTED_ACCOUNT_LOGOUT')
        expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_TOKEN_INVALID as string)
          .assertEqual('common.event.DISTRIBUTED_ACCOUNT_TOKEN_INVALID')
        expect(commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOFF as string)
          .assertEqual('common.event.DISTRIBUTED_ACCOUNT_LOGOFF')
        expect(commonEventManager.Support.COMMON_EVENT_PRIVACY_STATE_CHANGED as string)
          .assertEqual('usual.event.PRIVACY_STATE_CHANGED')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1000 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_1100
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_1100
     * @tc.desc   WIFI state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1100 START`)
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_POWER_STATE as string)
          .assertEqual('usual.event.wifi.POWER_STATE')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_SCAN_FINISHED as string)
          .assertEqual('usual.event.wifi.SCAN_FINISHED')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_RSSI_VALUE as string)
          .assertEqual('usual.event.wifi.RSSI_VALUE')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_CONN_STATE as string)
          .assertEqual('usual.event.wifi.CONN_STATE')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_HOTSPOT_STATE as string)
          .assertEqual('usual.event.wifi.HOTSPOT_STATE')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_AP_STA_JOIN as string)
          .assertEqual('usual.event.wifi.WIFI_HS_STA_JOIN')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_AP_STA_LEAVE as string)
          .assertEqual('usual.event.wifi.WIFI_HS_STA_LEAVE')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE as string)
          .assertEqual('usual.event.wifi.mplink.STATE_CHANGE')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_CONN_STATE as string)
          .assertEqual('usual.event.wifi.p2p.CONN_STATE_CHANGE')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_STATE_CHANGED as string)
          .assertEqual('usual.event.wifi.p2p.STATE_CHANGE')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED as string)
          .assertEqual('usual.event.wifi.p2p.DEVICES_CHANGE')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED as string)
          .assertEqual('usual.event.wifi.p2p.PEER_DISCOVERY_STATE_CHANGE')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED as string)
          .assertEqual('usual.event.wifi.p2p.CURRENT_DEVICE_CHANGE')
        expect(commonEventManager.Support.COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED as string)
          .assertEqual('usual.event.wifi.p2p.GROUP_STATE_CHANGED')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1100 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_1500
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_1500
     * @tc.desc   Bluetooth.a2dp,Nfc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1500 START`)
        expect(commonEventManager.Support.COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED as string)
          .assertEqual('usual.event.nfc.action.ADAPTER_STATE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED as string)
          .assertEqual('usual.event.nfc.action.RF_FIELD_ON_DETECTED')
        expect(commonEventManager.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED as string)
          .assertEqual('usual.event.nfc.action.RF_FIELD_OFF_DETECTED')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1500 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_1600
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_1600
     * @tc.desc   charging battery,device's ,User,ability,Gps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1600 START`)
        expect(commonEventManager.Support.COMMON_EVENT_DISCHARGING as string).assertEqual('usual.event.DISCHARGING')
        expect(commonEventManager.Support.COMMON_EVENT_CHARGING as string).assertEqual('usual.event.CHARGING')
        expect(commonEventManager.Support.COMMON_EVENT_CHARGE_IDLE_MODE_CHANGED as string)
          .assertEqual('usual.event.CHARGE_IDLE_MODE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED as string)
          .assertEqual('usual.event.DEVICE_IDLE_MODE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_DEVICE_IDLE_EXEMPTION_LIST_UPDATED as string)
          .assertEqual('usual.event.DEVICE_IDLE_EXEMPTION_LIST_UPDATED')
        expect(commonEventManager.Support.COMMON_EVENT_POWER_SAVE_MODE_CHANGED as string)
          .assertEqual('usual.event.POWER_SAVE_MODE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_USER_ADDED as string).assertEqual('usual.event.USER_ADDED')
        expect(commonEventManager.Support.COMMON_EVENT_USER_REMOVED as string).assertEqual('usual.event.USER_REMOVED')
        expect(commonEventManager.Support.COMMON_EVENT_ABILITY_ADDED as string)
          .assertEqual('common.event.ABILITY_ADDED')
        expect(commonEventManager.Support.COMMON_EVENT_ABILITY_REMOVED as string)
          .assertEqual('common.event.ABILITY_REMOVED')
        expect(commonEventManager.Support.COMMON_EVENT_ABILITY_UPDATED as string)
          .assertEqual('common.event.ABILITY_UPDATED')
        expect(commonEventManager.Support.COMMON_EVENT_LOCATION_MODE_STATE_CHANGED as string)
          .assertEqual('usual.event.location.MODE_STATE_CHANGED')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1600 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_1700
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_1700
     * @tc.desc   ivi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1700 START`)
        expect(commonEventManager.Support.COMMON_EVENT_IVI_SLEEP as string).assertEqual('common.event.IVI_SLEEP')
        expect(commonEventManager.Support.COMMON_EVENT_IVI_PAUSE as string).assertEqual('common.event.IVI_PAUSE')
        expect(commonEventManager.Support.COMMON_EVENT_IVI_STANDBY as string).assertEqual('common.event.IVI_STANDBY')
        expect(commonEventManager.Support.COMMON_EVENT_IVI_LASTMODE_SAVE as string)
          .assertEqual('common.event.IVI_LASTMODE_SAVE')
        expect(commonEventManager.Support.COMMON_EVENT_IVI_VOLTAGE_ABNORMAL as string)
          .assertEqual('common.event.IVI_VOLTAGE_ABNORMAL')
        expect(commonEventManager.Support.COMMON_EVENT_IVI_HIGH_TEMPERATURE as string)
          .assertEqual('common.event.IVI_HIGH_TEMPERATURE')
        expect(commonEventManager.Support.COMMON_EVENT_IVI_EXTREME_TEMPERATURE as string)
          .assertEqual('common.event.IVI_EXTREME_TEMPERATURE')
        expect(commonEventManager.Support.COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL as string)
          .assertEqual('common.event.IVI_TEMPERATURE_ABNORMAL')
        expect(commonEventManager.Support.COMMON_EVENT_IVI_VOLTAGE_RECOVERY as string)
          .assertEqual('common.event.IVI_VOLTAGE_RECOVERY')
        expect(commonEventManager.Support.COMMON_EVENT_IVI_TEMPERATURE_RECOVERY as string)
          .assertEqual('common.event.IVI_TEMPERATURE_RECOVERY')
        expect(commonEventManager.Support.COMMON_EVENT_IVI_ACTIVE as string).assertEqual('common.event.IVI_ACTIVE')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1700 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_1800
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_1800
     * @tc.desc   USB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1800 START`)
        expect(commonEventManager.Support.COMMON_EVENT_USB_STATE as string)
          .assertEqual('usual.event.hardware.usb.action.USB_STATE')
        expect(commonEventManager.Support.COMMON_EVENT_USB_PORT_CHANGED as string)
          .assertEqual('usual.event.hardware.usb.action.USB_PORT_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_USB_DEVICE_ATTACHED as string)
          .assertEqual('usual.event.hardware.usb.action.USB_DEVICE_ATTACHED')
        expect(commonEventManager.Support.COMMON_EVENT_USB_DEVICE_DETACHED as string)
          .assertEqual('usual.event.hardware.usb.action.USB_DEVICE_DETACHED')
        expect(commonEventManager.Support.COMMON_EVENT_USB_ACCESSORY_ATTACHED as string)
          .assertEqual('usual.event.hardware.usb.action.USB_ACCESSORY_ATTACHED')
        expect(commonEventManager.Support.COMMON_EVENT_USB_ACCESSORY_DETACHED as string)
          .assertEqual('usual.event.hardware.usb.action.USB_ACCESSORY_DETACHED')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1800 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_1900
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_1900
     * @tc.desc   protected common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1900 START`)
        expect(commonEventManager.Support.COMMON_EVENT_DISK_REMOVED as string)
          .assertEqual('usual.event.data.DISK_REMOVED')
        expect(commonEventManager.Support.COMMON_EVENT_DISK_UNMOUNTED as string)
          .assertEqual('usual.event.data.DISK_UNMOUNTED')
        expect(commonEventManager.Support.COMMON_EVENT_DISK_MOUNTED as string)
          .assertEqual('usual.event.data.DISK_MOUNTED')
        expect(commonEventManager.Support.COMMON_EVENT_DISK_BAD_REMOVAL as string)
          .assertEqual('usual.event.data.DISK_BAD_REMOVAL')
        expect(commonEventManager.Support.COMMON_EVENT_DISK_UNMOUNTABLE as string)
          .assertEqual('usual.event.data.DISK_UNMOUNTABLE')
        expect(commonEventManager.Support.COMMON_EVENT_DISK_EJECT as string).assertEqual('usual.event.data.DISK_EJECT')
        expect(commonEventManager.Support.COMMON_EVENT_VOLUME_REMOVED as string)
          .assertEqual('usual.event.data.VOLUME_REMOVED')
        expect(commonEventManager.Support.COMMON_EVENT_VOLUME_UNMOUNTED as string)
          .assertEqual('usual.event.data.VOLUME_UNMOUNTED')
        expect(commonEventManager.Support.COMMON_EVENT_VOLUME_MOUNTED as string)
          .assertEqual('usual.event.data.VOLUME_MOUNTED')
        expect(commonEventManager.Support.COMMON_EVENT_VOLUME_BAD_REMOVAL as string)
          .assertEqual('usual.event.data.VOLUME_BAD_REMOVAL')
        expect(commonEventManager.Support.COMMON_EVENT_VOLUME_EJECT as string)
          .assertEqual('usual.event.data.VOLUME_EJECT')
        expect(commonEventManager.Support.COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED as string)
          .assertEqual('usual.event.data.VISIBLE_ACCOUNTS_UPDATED')
        expect(commonEventManager.Support.COMMON_EVENT_ACCOUNT_DELETED as string)
          .assertEqual('usual.event.data.ACCOUNT_DELETED')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_1900 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_Support_Static_2000
     * @tc.number Sub_Notification_Ces_Publish_Support_Static_2000
     * @tc.desc   protected common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Publish_Support_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_2000 START`)
        expect(commonEventManager.Support.COMMON_EVENT_FOUNDATION_READY as string)
          .assertEqual('common.event.FOUNDATION_READY')
        expect(commonEventManager.Support.COMMON_EVENT_AIRPLANE_MODE_CHANGED as string)
          .assertEqual('usual.event.AIRPLANE_MODE')
        expect(commonEventManager.Support.COMMON_EVENT_SPLIT_SCREEN as string).assertEqual('common.event.SPLIT_SCREEN')
        expect(commonEventManager.Support.COMMON_EVENT_SLOT_CHANGE as string).assertEqual('usual.event.SLOT_CHANGE')
        expect(commonEventManager.Support.COMMON_EVENT_SPN_INFO_CHANGED as string)
          .assertEqual('usual.event.SPN_INFO_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_QUICK_FIX_APPLY_RESULT as string)
          .assertEqual('usual.event.QUICK_FIX_APPLY_RESULT')
        expect(commonEventManager.Support.COMMON_EVENT_USER_INFO_UPDATED as string)
          .assertEqual('usual.event.USER_INFO_UPDATED')
        expect(commonEventManager.Support.COMMON_EVENT_HTTP_PROXY_CHANGE as string)
          .assertEqual('usual.event.HTTP_PROXY_CHANGE')
        expect(commonEventManager.Support.COMMON_EVENT_DOMAIN_ACCOUNT_STATUS_CHANGED as string)
          .assertEqual('usual.event.DOMAIN_ACCOUNT_STATUS_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_QUICK_FIX_REVOKE_RESULT as string)
          .assertEqual('usual.event.QUICK_FIX_REVOKE_RESULT')
        hilog.info(domain, TAG, `Sub_Notification_Ces_Publish_Support_Static_2000 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2100
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2100
     * @tc.desc   SIM common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2100 START`)
        expect(commonEventManager.Support.COMMON_EVENT_SIM_STATE_CHANGED as string)
          .assertEqual('usual.event.SIM_STATE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_SIM_CARD_DEFAULT_SMS_SUBSCRIPTION_CHANGED as string)
          .assertEqual('usual.event.SIM.DEFAULT_SMS_SUBSCRIPTION_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_SIM_CARD_DEFAULT_DATA_SUBSCRIPTION_CHANGED as string)
          .assertEqual('usual.event.SIM.DEFAULT_DATA_SUBSCRIPTION_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_SIM_CARD_DEFAULT_MAIN_SUBSCRIPTION_CHANGED as string)
          .assertEqual('usual.event.SIM.DEFAULT_MAIN_SUBSCRIPTION_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_SIM_CARD_DEFAULT_VOICE_SUBSCRIPTION_CHANGED as string)
          .assertEqual('usual.event.SIM.DEFAULT_VOICE_SUBSCRIPTION_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_SMS_EMERGENCY_CB_RECEIVE_COMPLETED as string)
          .assertEqual('usual.event.SMS_EMERGENCY_CB_RECEIVE_COMPLETED')
        expect(commonEventManager.Support.COMMON_EVENT_SMS_CB_RECEIVE_COMPLETED as string)
          .assertEqual('usual.event.SMS_CB_RECEIVE_COMPLETED')
        expect(commonEventManager.Support.COMMON_EVENT_SMS_WAPPUSH_RECEIVE_COMPLETED as string)
          .assertEqual('usual.event.SMS_WAPPUSH_RECEIVE_COMPLETED')
        expect(commonEventManager.Support.COMMON_EVENT_OPERATOR_CONFIG_CHANGED as string)
          .assertEqual('usual.event.OPERATOR_CONFIG_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_CALL_STATE_CHANGED as string)
          .assertEqual('usual.event.CALL_STATE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_INCOMING_CALL_MISSED as string)
          .assertEqual('usual.event.INCOMING_CALL_MISSED')
        expect(commonEventManager.Support.COMMON_EVENT_CELLULAR_DATA_STATE_CHANGED as string)
          .assertEqual('usual.event.CELLULAR_DATA_STATE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_NETWORK_STATE_CHANGED as string)
          .assertEqual('usual.event.NETWORK_STATE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_SIGNAL_INFO_CHANGED as string)
          .assertEqual('usual.event.SIGNAL_INFO_CHANGED')
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2100 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2200
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2200
     * @tc.desc   STK common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2200 START`)
        expect(commonEventManager.Support.COMMON_EVENT_STK_COMMAND as string).assertEqual('usual.event.STK_COMMAND')
        expect(commonEventManager.Support.COMMON_EVENT_STK_SESSION_END as string)
          .assertEqual('usual.event.STK_SESSION_END')
        expect(commonEventManager.Support.COMMON_EVENT_STK_CARD_STATE_CHANGED as string)
          .assertEqual('usual.event.STK_CARD_STATE_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_STK_ALPHA_IDENTIFIER as string)
          .assertEqual('usual.event.STK_ALPHA_IDENTIFIER')
        expect(commonEventManager.Support.COMMON_EVENT_RADIO_STATE_CHANGE as string)
          .assertEqual('usual.event.RADIO_STATE_CHANGE')
        expect(commonEventManager.Support.COMMON_EVENT_SCREEN_UNLOCKED as string)
          .assertEqual('usual.event.SCREEN_UNLOCKED')
        expect(commonEventManager.Support.COMMON_EVENT_SCREEN_LOCKED as string).assertEqual('usual.event.SCREEN_LOCKED')
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2200 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2300
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2300
     * @tc.desc   HWID common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2300 START`)
        expect(commonEventManager.Support.COMMON_EVENT_MINORSMODE_ON as string).assertEqual('usual.event.MINORSMODE_ON')
        expect(commonEventManager.Support.COMMON_EVENT_MINORSMODE_OFF as string)
          .assertEqual('usual.event.MINORSMODE_OFF')
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2300 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2400
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2400
     * @tc.desc   STK common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2400 START`)
        expect(commonEventManager.Support.COMMON_EVENT_DATA_SHARE_READY as string)
          .assertEqual('usual.event.DATA_SHARE_READY')
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2400 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2500
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2500
     * @tc.desc   enter/exit force sleep common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2500 START`)
        expect(commonEventManager.Support.COMMON_EVENT_ENTER_FORCE_SLEEP as string)
          .assertEqual('usual.event.ENTER_FORCE_SLEEP')
        expect(commonEventManager.Support.COMMON_EVENT_EXIT_FORCE_SLEEP as string)
          .assertEqual('usual.event.EXIT_FORCE_SLEEP')
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2500 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2600
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2600
     * @tc.desc   start restore common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2600 START`)
        expect(commonEventManager.Support.COMMON_EVENT_RESTORE_START as string).assertEqual('usual.event.RESTORE_START')
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2600 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2700
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2700
     * @tc.desc   managed browser policy changed common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2700 START`)
        expect(commonEventManager.Support.COMMON_EVENT_MANAGED_BROWSER_POLICY_CHANGED as string)
          .assertEqual('usual.event.MANAGED_BROWSER_POLICY_CHANGED')
        expect(commonEventManager.Support.COMMON_EVENT_MANAGED_BROWSER_POLICY_CHANGED as string)
          .assertEqual('usual.event.MANAGED_BROWSER_POLICY_CHANGED')
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2700 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2800
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2800
     * @tc.desc   default application changed common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2800 START`)
      expect(commonEventManager.Support.COMMON_EVENT_DEFAULT_APPLICATION_CHANGED)
        .assertEqual('usual.event.DEFAULT_APPLICATION_CHANGED')
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2800 END`)
        done()
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2900
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2900
     * @tc.desc   enter/exit kiosk mode common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2900 START`)
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2900` + JSON.stringify(commonEventManager.Support.COMMON_EVENT_KIOSK_MODE_ON))
        expect(commonEventManager.Support.COMMON_EVENT_KIOSK_MODE_ON).assertEqual('usual.event.KIOSK_MODE_ON')
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2900`+ JSON.stringify(commonEventManager.Support.COMMON_EVENT_KIOSK_MODE_OFF))
        expect(commonEventManager.Support.COMMON_EVENT_KIOSK_MODE_OFF).assertEqual('usual.event.KIOSK_MODE_OFF')
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_2900 END`)
        done()
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3100
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3100
     * @tc.desc   bluetooth handsfree ag connection state change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3100 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_CHANGE)
        .assertEqual('usual.event.bluetooth.handsfree.ag.CONNECT_STATE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3100 END`)
      done()
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3200
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3200
     * @tc.desc   bluetooth a2dp source connection state change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3200 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_CHANGE)
        .assertEqual('usual.event.bluetooth.a2dpsource.CONNECT_STATE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3200 END`)
      done()
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3300
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3300
     * @tc.desc   bluetooth avrcp connection state change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3300 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_CHANGE)
        .assertEqual('usual.event.bluetooth.a2dpsource.AVRCP_CONNECT_STATE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3300 END`)
      done()
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3400
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3400
     * @tc.desc   bluetooth codec change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3400 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_CHANGE)
        .assertEqual('usual.event.bluetooth.a2dpsource.CODEC_VALUE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3400 END`)
      done()
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3500
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3500
     * @tc.desc   bluetooth remote device acl state change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3500 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_STATE_CHANGE)
        .assertEqual('usual.event.bluetooth.remotedevice.ACL_STATE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3500 END`)
      done()
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3600
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3600
     * @tc.desc   bluetooth pair state change common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3600 START`)
      expect(commonEventManager.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE_CHANGE)
        .assertEqual('usual.event.bluetooth.remotedevice.PAIR_STATE_CHANGE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3600 END`)
      done()
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3000
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3000
     * @tc.desc   start/stop screen capture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3000 START`)
      expect(commonEventManager.Support.COMMON_EVENT_SCREEN_SHARE).assertEqual('usual.event.SCREEN_SHARE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3000 END`)
      done()
    })


    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3800
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3800
     * @tc.desc   enter/exit force sleep common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3800 START`)
      expect(commonEventManager.Support.COMMON_EVENT_ENTER_HIBERNATE).assertEqual('usual.event.ENTER_HIBERNATE')
      expect(commonEventManager.Support.COMMON_EVENT_EXIT_HIBERNATE).assertEqual('usual.event.EXIT_HIBERNATE')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_3800 END`)
      done()
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4000
     * @tc.number SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4000
     * @tc.desc   restore end common event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4000 START`)
      expect(commonEventManager.Support.COMMON_EVENT_RESTORE_END).assertEqual('usual.event.RESTORE_END')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4000 END`)
      done()
    })

    /**
     * @tc.number  SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4100
     * @tc.name    SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4100
     * @tc.desc    tablet mode changed common event
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4100 START`)
      expect(commonEventManager.Support.COMMON_EVENT_TABLET_MODE_CHANGED).assertEqual('usual.event.TABLET_MODE_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4100 END`)
      done()
    })

    /**
     * @tc.number  SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4200
     * @tc.name    SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4200
     * @tc.desc    lid state changed common event
     */
    it('SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4200 START`)
      expect(commonEventManager.Support.COMMON_EVENT_LID_STATE_CHANGED).assertEqual('usual.event.LID_STATE_CHANGED')
      console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_SUPPORT_ENUM_TEST_Static_4200 END`)
      done()
    })

  })
}
