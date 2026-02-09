/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import commonEvent from '@ohos.commonEvent';
import batteryInfo from '@ohos.batteryInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function BatteryCommonEventTest() {
  describe('BatteryCommonEventTest', function () {
    console.log("*************Battery commonEvent Test Begin*************");

    /**
     * @tc.name   Subscribe_Battery_Changed_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0100
     * @tc.desc   battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Battery_Changed_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createBatteryChangedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Battery_Okay_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0110
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Battery_Okay_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createBatteryOkaySubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Battery_Low_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0120
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Battery_Low_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createBatteryLowSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Power_Connected_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0130
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Power_Connected_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createBatteryPowerConnectedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Power_Disconnected_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0140
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Power_Disconnected_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBatteryPowerDisconnectedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Battery_Charging_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0150
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Battery_Charging_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createBatteryChargingSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Battery_Discharging_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0160
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Battery_Discharging_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBatteryDischargingSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Boot_Completed_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0170
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Boot_Completed_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createBootCompletedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Locked_Boot_Completed_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0180
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Locked_Boot_Completed_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createLockedBootCompletedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Shutdown_Common_Event
     * @tc.number SUB_powersystem_batterymanager_jstest_0190
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Shutdown_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createShutdownSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Screen_On_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0200
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Screen_On_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createScreenOnSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_User_Present_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0210
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_User_Present_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createUserPresentSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Time_Tick_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0220
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Time_Tick_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createTimeTickSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Screen_Off_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0230
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Screen_Off_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createScreenOffSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Time_Changed_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0240
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Time_Changed_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createTimeChangedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Date_Changed_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0250
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Date_Changed_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createDateChangedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Timezone_Changed_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0260
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Timezone_Changed_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createTimezoneChangedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Close_System_Dialogs_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0270
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Close_System_Dialogs_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCloseSystemDialogsSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Package_Added_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0280
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Package_Added_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createPackageAddedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Package_Replaced_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0290
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Package_Replaced_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createPackageReplacedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_My_Package_Replaced_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0300
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_My_Package_Replaced_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createMyPackageReplacedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Package_Removed_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0310
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Package_Removed_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createPackageRemovedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Bundle_Removed_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0320
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bundle_Removed_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createBundleRemovedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Packagefullyremoved_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0330
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Packagefullyremoved_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createPackageFullyRemovedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Packagechanged_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0340
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Packagechanged_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createPackageChangedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Packagerestarted_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0350
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Packagerestarted_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createPackageRestartedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Packagedatacleared_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0360
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Packagedatacleared_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createPackageDataClearedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Packagesuspended_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0370
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Packagesuspended_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createPackageSuspendedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Packagesunsuspended_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0380
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Packagesunsuspended_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createPackagesUnsuspendedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Mypackagesuspended_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0390
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Mypackagesuspended_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createMyPackageSuspendedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Mypackageunsuspended_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0400
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Mypackageunsuspended_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createMyPackageUnsuspendedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Mypackagefirstlaunch_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0410
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Mypackagefirstlaunch_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createMyPackageFirstLaunchSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Mypackageneedsverification_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0420
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Mypackageneedsverification_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createMyPackageNeedsVerificationSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Externalapplicationsavailable_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0430
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Externalapplicationsavailable_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createExternalApplicationsAvailableSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Externalapplicationsunavailable_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0440
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Externalapplicationsunavailable_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createExternalApplicationsUnAvailableSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Configurationchanged_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0450
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Configurationchanged_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createConfigurationChangedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Locatechanged_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0460
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Locatechanged_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createLocateChangedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Managepackagestorage_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0470
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Managepackagestorage_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createManagePackageStorageSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Drivemode_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0480
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Drivemode_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createDriveModeSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Homemode_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0490
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Homemode_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createHomeModeSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Officemode_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0500
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Officemode_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createOfficeModeSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Userstarted_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0510
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Userstarted_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createUserStartedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Userbackground_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0520
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Userbackground_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createUserBackgroundSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Userforground_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0530
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Userforground_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createUserForgroundSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Userswitched_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0540
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Userswitched_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createUserSwitchedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Userstarting_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0550
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Userstarting_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createUserStartingSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Userunlocked_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0560
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Userunlocked_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createUserUnlockedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Userstopping_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0570
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Userstopping_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createUserStoppingSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Userstopped_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0580
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Userstopped_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createUserStoppedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Hwidlogin_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0590
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Hwidlogin_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createHwidLoginSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Hwidlogout_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0600
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Hwidlogout_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createHwidLogoutSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Hwidtokeninvalid_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0610
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Hwidtokeninvalid_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createHwidTokenInvalidSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Hwidlogoff_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0620
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Hwidlogoff_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createHwidLogOffSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Wifipowerstate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0630
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifipowerstate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createWifiPowerStateSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Wifiscanfinished_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0640
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifiscanfinished_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createWifiScanFinishedSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Wifirssivalue_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0650
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifirssivalue_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createWifiRssiValueSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Wificonnstate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0660
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wificonnstate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createWifiConnStateSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Wifihostpotstate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0670
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifihostpotstate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createWifiHostpotStateSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Wifiapstajoin_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0680
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifiapstajoin_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createWifiApStaJoinSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Wifiapstaleave_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0690
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifiapstaleave_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createWifiApStaLeaveSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Wifimplinkstatechange_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0700
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifimplinkstatechange_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createWifiMplinkStateChangeSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Wifip2pconnstate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0710
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifip2pconnstate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
      createWifiP2PConnStateSubscriber();
      done();
    })

    /**
     * @tc.name   Subscribe_Wifip2pstatechanged_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0720
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifip2pstatechanged_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createWifiP2PStateChangedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Wifip2ppeersstatechanged_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0730
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifip2ppeersstatechanged_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createWifiP2PPeersStateChangedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Wifip2ppeersdiscoverystatechanged_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0740
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifip2ppeersdiscoverystatechanged_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createWifiP2PPeersDiscoveryStateChangedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Wifip2pcurrentdevicestatechanged_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0750
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifip2pcurrentdevicestatechanged_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createWifiP2PCurrentDeviceStateChangedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Wifip2pgroupstatechanged_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0760
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Wifip2pgroupstatechanged_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createWifiP2PGroupStateChangedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothhandsfreeagconntectstateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0770
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothhandsfreeagconntectstateupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothHandsfreeAgConntectStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothhandsfreeagconntectdeviceupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0780
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothhandsfreeagconntectdeviceupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothHandsfreeAgConntectDeviceUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothhandsfreeagaudiostateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0790
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothhandsfreeagaudiostateupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothHandsfreeAgAudioStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetootha2dpsourceconnectstateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0800
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetootha2dpsourceconnectstateupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothA2DPsourceConnectStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetootha2dpsourcecurrentdeviceupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0810
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetootha2dpsourcecurrentdeviceupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothA2DPsourceCurrentDeviceUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetootha2dpsourceplayingstateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0820
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetootha2dpsourceplayingstateupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothA2DPsourcePlayingStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetootha2dpsourceavrcpconntectstateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0830
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetootha2dpsourceavrcpconntectstateupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothA2DPsourceAvrcpConntectStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetootha2dpsourcecodecvalueupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0840
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetootha2dpsourcecodecvalueupdate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothA2DPsourceCodecValueUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedevicediscovered_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0850
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedevicediscovered_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothRemotedeviceDiscoveredSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedeviceclassvalueupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0860
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedeviceclassvalueupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothRemotedeviceClassValueUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedeviceaclconnected_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0870
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedeviceaclconnected_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothRemotedeviceAclConnectedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedeviceacldisconnected_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0880
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedeviceacldisconnected_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothRemotedeviceAclDisconnectedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedevicenameupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0890
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedevicenameupdate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothRemotedeviceNameUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedevicepairstate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0900
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedevicepairstate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothRemotedevicePairStateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedevicebateryvalueupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0910
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedevicebateryvalueupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothRemotedeviceBateryValueUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedevicesdpresult_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0920
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedevicesdpresult_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothRemotedeviceSdpResultSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedeviceuuidvalue_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0930
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedeviceuuidvalue_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothRemotedeviceUuidValueSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothpairingreq_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0940
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothpairingreq_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothPairingReqSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedevicepairingcancel_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0950
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedevicepairingcancel_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothRemotedevicePairingCancelSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedeviceconntectreq_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0960
     * @tc.desc   Battery acquisition Kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedeviceconntectreq_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothRemotedeviceConntectReqSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedeviceconntectreply_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0970
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedeviceconntectreply_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothRemotedeviceConntectReplySubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothremotedeviceconntectcancel_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0980
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothremotedeviceconntectcancel_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothRemotedeviceConntectCancelSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothhandsfreeunitconntectstateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_0990
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothhandsfreeunitconntectstateupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothHandsfreeunitConntectStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothhandsfreeunitaudiostateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1010
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothhandsfreeunitaudiostateupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothHandsfreeunitAudioStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothhandsfreeunitagcommonevent_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1020
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothhandsfreeunitagcommonevent_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothHandsfreeunitAgCommonEventSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothhandsfreeunitagcallstateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1030
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothhandsfreeunitagcallstateupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createBluetoothHandsfreeunitAgCallStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothhoststateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1040
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothhoststateupdate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothHostStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Bluetoothhostreqdiscoverable_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1050
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Bluetoothhostreqdiscoverable_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createBluetoothHostReqDiscoverableSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventhostreqenable_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1060
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventhostreqenable_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventHostReqEnableSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventhostreqdisable_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1070
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventhostreqdisable_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventHostReqDisableSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventhostscanmodeupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1080
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventhostscanmodeupdate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventHostScanModeUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventhostdiscovetystarted_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1090
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventhostdiscovetystarted_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventHostDiscovetyStartedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventhostdiscovetyfinished_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1100
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventhostdiscovetyfinished_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventHostDiscovetyFinishedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventhostnameupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1110
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventhostnameupdate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventHostNameUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventhoststateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1120
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventhoststateupdate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventHostStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventa2dpsinkplayingstateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1130
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventa2dpsinkplayingstateupdate_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createCommonEventA2DPsinkPlayingStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventa2dpsinkaudiostateupdate_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1140
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventa2dpsinkaudiostateupdate_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventA2DPsinkAudioStateUpdateSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventnfcactionadapterstatechanged_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1150
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventnfcactionadapterstatechanged_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createCommonEventNFCActionAdapterStateChangedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventnfcactionrffieldondetected_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1160
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventnfcactionrffieldondetected_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createCommonEventNFCActionRFFieldOnDetectedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventnfcactionrffieldoffdetected_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1170
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventnfcactionrffieldoffdetected_Common_Event',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        createCommonEventNFCActionRFFieldOffDetectedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventdeviceidlemodechanged_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1180
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventdeviceidlemodechanged_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventDeviceIdleModeChangedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventpowersavemodechanged_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1190
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventpowersavemodechanged_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventPowerSaveModeChangedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventuseradded_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1200
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventuseradded_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventUserAddedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventuserremoved_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1210
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventuserremoved_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventUserRemovedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventabilityadded_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1220
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventabilityadded_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventAbilityAddedSubscriber();
        done();
      })

    /**
     * @tc.name   subscribe_CommonEventAbilityRemoved_common_event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1230
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('subscribe_CommonEventAbilityRemoved_common_event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventAbilityRemovedSubscriber();
        done();
      })

    /**
     * @tc.name   subscribe_CommonEventAbilityUpdated_common_event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1240
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('subscribe_CommonEventAbilityUpdated_common_event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventAbilityUpdatedSubscriber();
        done();
      })

    /**
     * @tc.name   subscribe_CommonEventLocationModeStateChanged_common_event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1250
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('subscribe_CommonEventLocationModeStateChanged_common_event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventLocationModeStateChangedSubscriber();
        done();
      })

    /**
     * @tc.name   subscribe_CommonEventIVISleep_common_event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1260
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('subscribe_CommonEventIVISleep_common_event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventIVISleepSubscriber();
        done();
      })

    /**
     * @tc.name   subscribe_CommonEventIVIPause_common_event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1270
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('subscribe_CommonEventIVIPause_common_event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventIVIPauseSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventivistandby_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1280
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventivistandby_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventIVIStandBySubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventivilastmodesave_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1290
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventivilastmodesave_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventIVILastmodeSaveSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventivivoltageabnormal_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1300
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventivivoltageabnormal_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventIVIVoltageAbnormalSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventivihighttemperature_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1310
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventivihighttemperature_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventIVIHightTemperatureSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventiviextremetemperature_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1320
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventiviextremetemperature_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventIVIExtremeTemperatureSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventivitemperatureabnormal_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1330
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventivitemperatureabnormal_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventIVITemperatureAbnormalSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventivivoltagerecovery_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1340
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventivivoltagerecovery_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventIVIVoltageRecoverySubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventivitempraturerecovery_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1350
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventivitempraturerecovery_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventIVITempratureRecoverySubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventiviactive_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1360
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventiviactive_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventIVIActiveSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventusbdevidceattached_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1370
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventusbdevidceattached_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventSUBDevidceAttachedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventusbdevidcedetached_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1380
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventusbdevidcedetached_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventSUBDevidceDetachedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventusbaccessoryattached_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1390
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventusbaccessoryattached_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventSUBAccessoryAttachedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventusbaccessorydetached_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1400
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventusbaccessorydetached_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventSUBAccessoryDetachedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventdickremoved_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1410
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventdickremoved_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventDickRemovedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventdickunmounted_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1420
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventdickunmounted_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventDickUnmountedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventdickmounted_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1430
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventdickmounted_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventDickMountedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventdicknadremoval_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1440
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventdicknadremoval_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventDickNadRemovalSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Commoneventdickunmoutable_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1450
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Commoneventdickunmoutable_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventDickUnmoutableSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_CommonEventDickEject_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1460
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_CommonEventDickEject_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventDickEjectSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_CommonEventVisibleAccountsUpdated_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1470
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_CommonEventVisibleAccountsUpdated_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventVisibleAccountsUpdatedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_CommonEventAccountDeleted_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1480
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_CommonEventAccountDeleted_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventAccountDeletedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_CommonEventFoundation_ReadyCommon_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1490
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_CommonEventFoundation_ReadyCommon_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventFoundationReadySubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_CommonEventAirplane_ModeChanged_CommonEvent
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1500
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_CommonEventAirplane_ModeChanged_CommonEvent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createCommonEventAirplaneModeChangedSubscriber();
        done();
      })

    /**
     * @tc.name   Subscribe_Package_Installation_Started_Common_Event
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1510
     * @tc.desc   Battery acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Subscribe_Package_Installation_Started_Common_Event', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function (done) {
        createPackageInstallationStartedSubscriber();
        done();
      })

    console.log("*************Battery commonEvent Test End*************");
  })
}

function createCommonEventAirplaneModeChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_AIRPLANE_MODE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventAirplaneModeChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect().assert();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Airplane_Mode_Changed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}


function createCommonEventFoundationReadySubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_FOUNDATION_READY],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventFoundationReadySubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Foundation_Ready begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventAccountDeletedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_ACCOUNT_DELETED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventAccountDeletedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_AccountDeleted begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventVisibleAccountsUpdatedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventVisibleAccountsUpdatedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Visible_Accounts_Updated begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventDickEjectSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_DISK_EJECT],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventDickEjectSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Dick_Eject begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventDickUnmoutableSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_DISK_UNMOUNTABLE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventDickUnmoutableSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Dick_Unmountable begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventDickNadRemovalSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_DISK_BAD_REMOVAL],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventDickNadRemovalSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Dick_Nad_Removal begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventDickMountedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_DISK_MOUNTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventDickMountedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Dick_Mounted begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventDickUnmountedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_DISK_UNMOUNTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventDickUnmountedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Dick_Unmounted begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventDickRemovedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_DISK_REMOVED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventDickRemovedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Dick_Removed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventSUBAccessoryDetachedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_SUB_ACCESSORY_DETACHED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventSUBAccessoryDetachedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_SUB_Accessory_Detached begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventSUBAccessoryAttachedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_SUB_ACCESSORY_ATTACHED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventSUBAccessoryAttachedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_SUB_Accessory_Attached begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventSUBDevidceDetachedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_SUB_DEVICE_DETACHED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventSUBDevidceDetachedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_SUB_Devidce_Detached begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventSUBDevidceAttachedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_SUB_DEVICE_ATTACHED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventSUBDevidceAttachedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_SUB_Devidce_Attached begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventIVIActiveSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_IVI_ACTIVE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventIVIActiveSubscriber success');
      var mySubscriber = subscriber;
      console.info("createSubscriber subscriber:" + JSON.stringify(subscriber));

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_IVI_Active begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventIVITempratureRecoverySubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_IVI_TEMPERATURE_RECOVERY],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventIVITempratureRecoverySubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_IVI_Temprature_Recovery begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventIVIVoltageRecoverySubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_IVI_VOLTAGE_RECOVERY],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventIVIVoltageRecoverySubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_IVI_Voltage_Recovery begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventIVITemperatureAbnormalSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventIVITemperatureAbnormalSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_IVI_Temperature_Abnormal begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventIVIExtremeTemperatureSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_IVI_EXTREME_TEMPERATURE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventIVIExtremeTemperatureSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_IVI_Extreme_Temperature begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventIVIHightTemperatureSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_IVI_HIGH_TEMPERATURE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventIVIHightTemperatureSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_IVI_Hight_Temperature begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventIVIVoltageAbnormalSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_IVI_VOLTAGE_ABNORMAL],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventIVIVoltageAbnormalSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Voltage_Abnormal begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventIVILastmodeSaveSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_IVI_LASTMODE_SAVE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventIVILastmodeSaveSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Last_modeSave begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventIVIStandBySubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_IVI_STANDBY],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventIVIStandBySubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_IVI_StandBy begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventIVIPauseSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_IVI_PAUSE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventIVIPauseSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_IVI_Pause begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventIVISleepSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_IVI_SLEEP],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventIVISleepSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_IVI_Sleep begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventLocationModeStateChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_LOCATION_MODE_STATE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventLocationModeStateChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Location_Mode_State_Changed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventAbilityUpdatedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_ABILITY_UPDATED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventAbilityUpdatedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Ability_Updated begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventAbilityRemovedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_ABILITY_REMOVED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventAbilityRemovedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Ability_Removed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventAbilityAddedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_ABILITY_ADDED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventAbilityAddedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Ability_Added begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventUserRemovedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_USER_REMOVED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventUserRemovedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_User_Removed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventUserAddedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_USER_ADDED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventUserAddedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_User_Added begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventPowerSaveModeChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_POWER_SAVE_MODE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventPowerSaveModeChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Power_Save_Mode_Changed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventDeviceIdleModeChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventDeviceIdleModeChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_DeviceIdle_Mode_Changed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventNFCActionRFFieldOffDetectedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventNFCActionRFFieldOffDetectedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_NFC_Action_RF_Field_Off_Detected begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventNFCActionRFFieldOnDetectedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventNFCActionRFFieldOnDetectedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_NFC_Action_RF_Field_On_Detected begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventNFCActionAdapterStateChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventNFCActionAdapterStateChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_NFCA_ction_Adapter_State_Changed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventA2DPsinkAudioStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventA2DPsinkAudioStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_A2DPsink_Audio_State_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventA2DPsinkPlayingStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventA2DPsinkPlayingStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_A2DPsink_Playing_State_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventHostStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventHostStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Host_State_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventHostNameUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventHostNameUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Host_Name_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventHostDiscovetyFinishedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventHostDiscovetyFinishedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_HostDiscovery_Finished begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventHostDiscovetyStartedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventHostDiscovetyStartedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_HostDiscovery_Started begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventHostScanModeUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventHostScanModeUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Host_Scan_Mode_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventHostReqDisableSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventHostReqDisableSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Host_Req_Disable begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCommonEventHostReqEnableSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCommonEventHostReqEnableSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Common_Event_Host_Req_Enable begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothHostReqDiscoverableSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothHostReqDiscoverableSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Host_Req_Discoverable begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothHostStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothHostStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_HostState_State_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothHandsfreeunitAgCallStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothHandsfreeunitAgCallStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Handsfreeunit_Ag_CallStateUpdate begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothHandsfreeunitAgCommonEventSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothHandsfreeunitAgCommonEventSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Handsfreeunit_Ag_Common_Event begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothHandsfreeunitAudioStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothHandsfreeunitAudioStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Handsfreeunit_Audio_State_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothHandsfreeunitConntectStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothHandsfreeunitConntectStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Handsfreeunit_Conntect_State_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedeviceConntectCancelSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_CANCEL],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedeviceConntectCancelSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remotedevice_Conntect_Cancel begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedeviceConntectReplySubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REPLY],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedeviceConntectReplySubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remotedevice_Conntect_Reply begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedeviceConntectReqSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REQ],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedeviceConntectReqSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remotedevice_ConntectReq begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedevicePairingCancelSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_CANCEL],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedevicePairingCancelSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remotedevice_Pairing_Cancel begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothPairingReqSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_REQ],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothPairingReqSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Pairing_Req begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedeviceUuidValueSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_UUID_VALUE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedeviceUuidValueSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remotedevice_Uuid_Value begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedeviceSdpResultSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_SDP_RESULT],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedeviceSdpResultSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remote_device_Sdp_Result begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedeviceBateryValueUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_BATTERY_VALUE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedeviceBateryValueUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Batery_Value_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedevicePairStateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedevicePairStateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remotedevice_Pair_State begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedeviceNameUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_NAME_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedeviceNameUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remotedevice_Name_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedeviceAclDisconnectedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_DISCONNECTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedeviceAclDisconnectedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remotedevice_Scl_Disconntected begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedeviceAclConnectedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_CONNECTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedeviceAclConnectedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remotedevice_Scl_Conntected begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedeviceClassValueUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CLASS_VALUE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedeviceClassValueUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remotedevice_Class_Value_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothRemotedeviceDiscoveredSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_DISCOVERED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothRemotedeviceDiscoveredSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Remotedevice_Discovered begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothA2DPsourceCodecValueUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothA2DPsourceCodecValueUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_A2DPsource_Codec_Value_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothA2DPsourceAvrcpConntectStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothA2DPsourceAvrcpConntectStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_A2DPsource_Avrcp_Connect_State_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothA2DPsourcePlayingStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_PLAYING_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothA2DPsourcePlayingStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_A2DPsource_Playing_State_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothA2DPsourceCurrentDeviceUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CURRENT_DEVICE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothA2DPsourceCurrentDeviceUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_A2DPsource_Connect_Device_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothA2DPsourceConnectStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothA2DPsourceConnectStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_A2DPsource_Connect_State_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothHandsfreeAgAudioStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothHandsfreeAgAudioStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Hands_free_Ag_Audio_State_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothHandsfreeAgConntectDeviceUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CURRENT_DEVICE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothHandsfreeAgConntectDeviceUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Hands_free_Ag_Conntect_Device_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBluetoothHandsfreeAgConntectStateUpdateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_UPDATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBluetoothHandsfreeAgConntectStateUpdateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Bluetooth_Hands_free_Ag_Conntect_State_Update begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiP2PGroupStateChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiP2PGroupStateChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_P2P_Group_State_Change begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiP2PCurrentDeviceStateChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiP2PCurrentDeviceStateChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_P2P_Current_Device_State_Change begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiP2PPeersDiscoveryStateChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiP2PPeersDiscoveryStateChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_P2P_Peers_Discovery_State_Change begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiP2PPeersStateChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiP2PPeersStateChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_P2P_—Peers—State_Change begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiP2PStateChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_STATE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiP2PStateChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_P2P_State_Change begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiP2PConnStateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_CONN_STATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiP2PConnStateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_P2P_COnn_State begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiMplinkStateChangeSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiMplinkStateChangeSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_Mplink_State_Change begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiApStaLeaveSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_AP_STA_LEAVE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiApStaLeaveSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_Ap_Sta_Leave begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiApStaJoinSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_AP_STA_JOIN],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiApStaJoinSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_Ap_Sta_Join begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiHostpotStateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_HOTSPOT_STATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiHostpotStateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_Hostpot_State begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiConnStateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_CONN_STATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiConnStateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_Conn_State begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiRssiValueSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_RSSI_VALUE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiRssiValueSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_Rssi_Value begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiScanFinishedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_SCAN_FINISHED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiScanFinishedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_Scan_Finished begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createWifiPowerStateSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_WIFI_POWER_STATE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createWifiPowerStateSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Wifi_Power_State begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createHwidLogOffSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_HWID_LOGOFF],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createHwidLogOffSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Hwid_Logoff begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createHwidTokenInvalidSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_HWID_TOKEN_INVALID],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createHwidTokenInvalidSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Hwid_Token_Invalid begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createHwidLogoutSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_HWID_LOGOUT],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createHwidLogoutSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Hwid_loguot begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createHwidLoginSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_HWID_LOGIN],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createHwidLoginSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Hwid_Login begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createUserStoppedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_USER_STOPPED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createUserStoppedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe User_Stopped begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createUserStoppingSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_USER_STOPPING],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createUserStoppingSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe User_Stopping begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createUserUnlockedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_USER_UNLOCKED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createUserUnlockedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe User_Unlocked begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createUserStartingSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_USER_STARTING],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createUserStartingSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe User_Starting begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createUserSwitchedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_USER_SWITCHED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createUserSwitchedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe User_Switched begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createUserForgroundSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_USER_FOREGROUND],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createUserForgroundSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe User_Forground begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createUserBackgroundSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_USER_BACKGROUND],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createUserBackgroundSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe User_Background begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createUserStartedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_USER_STARTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createUserStartedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe User_Started begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createOfficeModeSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_OFFICE_MODE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createOfficeModeSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Office_Mode begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createHomeModeSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_HOME_MODE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createHomeModeSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Home_Mode begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createDriveModeSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_DRIVE_MODE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createDriveModeSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Drive_Mode begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createManagePackageStorageSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_MANAGE_PACKAGE_STORAGE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createManagePackageStorageSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Manage_Package_Storage begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createLocateChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_LOCALE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createLocateChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Locate_Changed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createConfigurationChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_CONFIGURATION_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createConfigurationChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Configuration_Changed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createExternalApplicationsUnAvailableSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createExternalApplicationsUnAvailableSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe External_Applications_UnAvailable begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createExternalApplicationsAvailableSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createExternalApplicationsAvailableSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe External_Applications_Available begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createMyPackageNeedsVerificationSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createMyPackageNeedsVerificationSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Package_Needs_Verification begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createMyPackageFirstLaunchSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGE_FIRST_LAUNCH],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createMyPackageFirstLaunchSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Package_Firsh_Launch begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createMyPackageUnsuspendedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_MY_PACKAGE_SUSPENDED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createMyPackageUnsuspendedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe My_Packages_UnSuspended begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createMyPackageSuspendedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_MY_PACKAGE_SUSPENDED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createMyPackageSuspendedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe My_Packages_Suspended begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createPackagesUnsuspendedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGES_UNSUSPENDED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createPackagesUnsuspendedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Packages_Unsuspended begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createPackageSuspendedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGES_SUSPENDED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createPackageSuspendedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Package_Suspended begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createPackageDataClearedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGE_DATA_CLEARED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createPackageDataClearedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Package_Data_Cleared begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createPackageRestartedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGE_RESTARTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createPackageRestartedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Package_Restarted begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createPackageChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createPackageFullyRemovedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Package_Fully_Removed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createPackageFullyRemovedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGE_FULLY_REMOVED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createPackageFullyRemovedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Package_Fully_Removed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBundleRemovedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BUNDLE_REMOVED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBundleRemovedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe BundleRemoved begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createPackageRemovedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGE_REMOVED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createPackageRemovedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe PackageRemoved begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createMyPackageReplacedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_MY_PACKAGE_REPLACED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createMyPackageReplacedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe My_Package_Replaced begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createPackageReplacedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGE_REPLACED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createPackageReplacedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Package_Replaced begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createPackageAddedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGE_ADDED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createPackageAddedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Close_System_Dialogs begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createPackageInstallationStartedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_PACKAGE_INSTALLATION_STARTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createPackageInstallationStartedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Close_System_Dialogs begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 1000).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createCloseSystemDialogsSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_CLOSE_SYSTEM_DIALOGS],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createCloseSystemDialogsSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Close_System_Dialogs begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createTimezoneChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_TIMEZONE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createTimezoneChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Timezone_Changed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createDateChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_DATE_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createDateChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Date_Changed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createTimeChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_TIME_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createTimeChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Time_Changed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createTimeTickSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_TIME_TICK],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createTimeTickSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Time_Tick begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createUserPresentSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_USER_PRESENT],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createUserPresentSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe User_Present begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createScreenOnSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_SCREEN_ON],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createScreenOnSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Screen_On begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createScreenOffSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_SCREEN_OFF],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createScreenOffSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe Screen_Off begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createShutdownSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_SHUTDOWN],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createShutdownSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe shutdown begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createLockedBootCompletedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_LOCKED_BOOT_COMPLETED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createLockedBootCompletedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe locked_boot_completed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBootCompletedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BOOT_COMPLETED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBootCompletedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe boot_completed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBatteryChangedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BATTERY_CHANGED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBatteryChangedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe battery_changed begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        let socKey = batteryInfo.CommonEventBatteryChangedKey.EXTRA_SOC;
        console.info("commonEventData parameter: " + commonEventData.parameters[socKey]);
        var capacity = commonEventData.parameters[socKey];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBatteryOkaySubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BATTERY_OKAY],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBatteryOkaySubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe battery_okay begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBatteryLowSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_BATTERY_LOW],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBatteryLowSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe battery_low begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var capacity = commonEventData.parameters['0'];
        console.info("capacity is:" + capacity);
        expect(capacity >= 0 && capacity <= 100).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBatteryPowerConnectedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_POWER_CONNECTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBatteryPowerConnectedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe power_connected begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var pluggedType = commonEventData.parameters['4'];
        console.info("pluggedType is:" + pluggedType);
        expect(pluggedType >= 0 && pluggedType <= 4).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBatteryPowerDisconnectedSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_POWER_DISCONNECTED],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBatteryPowerDisconnectedSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe power_disconnected begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var pluggedType = commonEventData.parameters['4'];
        console.info("pluggedType is:" + pluggedType);
        expect(pluggedType >= 0 && pluggedType <= 4).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBatteryChargingSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_CHARGING],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBatteryChargingSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe charging begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var chargeState = commonEventData.parameters['7'];
        console.info("chargeState is:" + chargeState);
        expect(chargeState >= 0 && chargeState <= 10).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}

function createBatteryDischargingSubscriber() {
  var commonEventSubscribeInfo = {
    events: [commonEvent.Support.COMMON_EVENT_DISCHARGING],
  };
  commonEvent.createSubscriber(commonEventSubscribeInfo)
    .then(subscriber => {
      console.info('createBatteryDischargingSubscriber success');
      var mySubscriber = subscriber;
      console.log(subscriber);

      if (subscriber == "" || subscriber == undefined || subscriber == null) {
        console.info("createSubscriber failed");
        expect(false).assertTrue();
        return;
      }
      mySubscriber.getCode()
        .then((data) => {
          console.info('Subscriber getCode success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getCode error because: ' + JSON.stringify(error));
      })
      mySubscriber.getData()
        .then((data) => {
          console.info('Subscriber getData success : ' + JSON.stringify(data));
        }).catch((error) => {
        console.error('Subscriber getData error because: ' + JSON.stringify(error));
      })
      console.info('subscribe discharging begin ');

      commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
        console.error('err code: ' + JSON.stringify(error));
        console.info('subscribe callback: ' + JSON.stringify(commonEventData));
        console.info("commonEventData event: " + commonEventData.event);
        console.info("commonEventData bundleName: " + commonEventData.bundleName);
        console.info("commonEventData data: " + commonEventData.data);
        console.info("commonEventData parameter: " + commonEventData.parameters[0]);
        var chargeState = commonEventData.parameters['7'];
        console.info("chargeState is:" + chargeState);
        expect(chargeState >= 0 && chargeState <= 10).assertTrue();
      });
      commonEvent.unsubscribe(mySubscriber, (error) => {
        if (error.code) {
          console.error(`unsubscribe failed, code is ${err.code}`);
        } else {
          console.info("unsubscribe");
        }
      })
    }).catch((error) => {
    console.error('Operation failed. Cause: ' + JSON.stringify(error));
  });
}
