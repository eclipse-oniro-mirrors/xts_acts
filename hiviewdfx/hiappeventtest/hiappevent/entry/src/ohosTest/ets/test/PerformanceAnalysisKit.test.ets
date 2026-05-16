/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import PerformanceAnalysisKitNdk from 'libentry.so'

export default function PerformanceAnalysisKit() {
  describe('PerformanceAnalysisKit', () => {
    /**
     * @tc.name   SetReportRouteValue001
     * @tc.number SUB_HIAPPEVENT_SETREPORTROUTEVALUE_0100
     * @tc.desc   test HIAPPEVENTSETREPORTROUTEVALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetReportRouteValue001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetReportRouteValue()
      console.error("====>SetReportRouteValue001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetReportPolicy001
     * @tc.number SUB_HIAPPEVENT_SETREPORTPOLICY_0100
     * @tc.desc   test HIAPPEVENTSETREPORTPOLICY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetReportPolicy001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetReportPolicy()
      console.error("====>SetReportPolicy001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetCustomConfig001
     * @tc.number SUB_HIAPPEVENT_SETCUSTOMCONFIG_0100
     * @tc.desc   test HIAPPEVENTSETCUSTOMCONFIG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetCustomConfig001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetCustomConfig()
      console.error("====>SetCustomConfig001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetConfigId001
     * @tc.number SUB_HIAPPEVENT_SETCONFIGID_0100
     * @tc.desc   test HIAPPEVENTSETCONFIGI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetConfigId001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetConfigId()
      console.error("====>SetConfigId001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetConfigName001
     * @tc.number SUB_HIAPPEVENT_SETCONFIGNAME_0100
     * @tc.desc   test HIAPPEVENTSETCONFIGNAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetConfigName001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetConfigName()
      console.error("====>SetConfigName001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetReportUserId001
     * @tc.number SUB_HIAPPEVENT_SETREPORTUSERID_0100
     * @tc.desc   test HIAPPEVENTSETREPORTUSERID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetReportUserId001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetReportUserId()
      console.error("====>SetReportUserId001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetReportUserProperty0001
     * @tc.number SUB_HIAPPEVENT_SETREPORTUSERPROPERTY_0100
     * @tc.desc   test HIAPPEVENTSETREPORTUSERPROPERTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetReportUserProperty0001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetReportUserProperty0()
      console.error("====>SetReportUserProperty001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetReportUserProperty002
     * @tc.number SUB_HIAPPEVENT_SETREPORTUSERPROPERTY_0200
     * @tc.desc   test HIAPPEVENTSETREPORTUSERPROPERTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetReportUserProperty002', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetReportUserProperty1()
      console.error("====>SetReportUserProperty001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetReportUserProperty003
     * @tc.number SUB_HIAPPEVENT_SETREPORTUSERPROPERTY_0300
     * @tc.desc   test HIAPPEVENTSETREPORTUSERPROPERTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetReportUserProperty003', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetReportUserProperty2()
      console.error("====>SetReportUserProperty001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetReportUserProperty004
     * @tc.number SUB_HIAPPEVENT_SETREPORTUSERPROPERTY_0400
     * @tc.desc   test HIAPPEVENTSETREPORTUSERPROPERTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetReportUserProperty004', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetReportUserProperty3()
      console.error("====>SetReportUserProperty004 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetReportUserPropertyCode001
     * @tc.number SUB_HIAPPEVENT_SETREPORTUSERPROPERTYCODE_0100
     * @tc.desc   test HIAPPEVENTSETREPORTUSERPROPERTYCODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetReportUserPropertyCode001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetReportUserPropertyCode()
      console.error("====>SetReportUserPropertyCode001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetReportUserPropertyCodeValue001
     * @tc.number SUB_HIAPPEVENT_SETREPORTUSERPROPERTYCODEVALUE_0100
     * @tc.desc   test HIAPPEVENTSETREPORTUSERPROPERTYCODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetReportUserPropertyCodeValue001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetReportUserPropertyCodeValue()
      console.error("====>SetReportUserPropertyCodeValue001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetWatcherOnReceive001
     * @tc.number SUB_HIAPPEVENT_SETWATCHERONRECEIVE_0100
     * @tc.desc   test HIAPPEVENTSETREPORTUSERPROPERTYCODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetWatcherOnReceive001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetWatcherOnReceive()
      console.error("====>SetWatcherOnReceive001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetWatcherOnReceive002
     * @tc.number SUB_HIAPPEVENT_SETWATCHERONRECEIVE_0200
     * @tc.desc   test HIAPPEVENTSETREPORTUSERPROPERTYCODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetWatcherOnReceive002', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetWatcherOnReceive()
      console.error("====>SetWatcherOnReceive002 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetWatcherOnReceive003
     * @tc.number SUB_HIAPPEVENT_SETWATCHERONRECEIVE_0300
     * @tc.desc   test HIAPPEVENTSETREPORTUSERPROPERTYCODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetWatcherOnReceive003', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetWatcherOnReceive()
      console.error("====>SetWatcherOnReceive003 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetWatcherOnReceive004
     * @tc.number SUB_HIAPPEVENT_SETWATCHERONRECEIVE_0400
     * @tc.desc   test HIAPPEVENTSETREPORTUSERPROPERTYCODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetWatcherOnReceive004', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetWatcherOnReceive()
      console.error("====>SetWatcherOnReceive001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   RemoveProcessor001
     * @tc.number SUB_HIAPPEVENT_REMOVEPROCESSOR_0100
     * @tc.desc   test HIAPPEVENTREMOVEPROCESSOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveProcessor001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.RemoveProcessor()
      console.error("====>RemoveProcessor001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetConfigItem001
     * @tc.number SUB_HIAPPEVENT_SETCONFIGITEM_0100
     * @tc.desc   test HIAPPEVENTSETCONFIGITEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetConfigItem001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetConfigItem()
      console.error("====>SetConfigItem001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetConfigItem002
     * @tc.number SUB_HIAPPEVENT_SETCONFIGITEM_0200
     * @tc.desc   test HIAPPEVENTSETCONFIGITEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetConfigItem002', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetConfigItem1()
      console.error("====>SetConfigItem002 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetEventConfig001
     * @tc.number SUB_HIAPPEVENT_SETEVENTCONFIG_0100
     * @tc.desc   test HIAPPEVENTSETSETEVENTCONFIG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetEventConfig001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetEventConfig()
      console.error("====>SetEventConfig001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   HiAppEventSetConfigItem001
     * @tc.number SUB_HIAPPEVENT_EVENTSETCONFIGITEM_0100
     * @tc.desc   test HIAPPEVENTEVENTSETCONFIGITEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HiAppEventSetConfigItem001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiAppEventSetConfigItem()
      console.error("====>HiAppEventSetConfigItem001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetEventConfigSuccess001
     * @tc.number SUB_HIAPPEVENT_SETEVENTCONFIGSUCCESS_0100
     * @tc.desc   test HIAPPEVENTSETSETEVENTCONFIGSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetEventConfigSuccess001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetEventConfigSuccess()
      console.error("====>SetEventConfigSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   HiAppEventCreateProcessor001
     * @tc.number SUB_HIAPPEVENT_CREATEPROCESSOR_0100
     * @tc.desc   test HIAPPEVENT_CREATEPROCESSOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HiAppEventCreateProcessor001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiAppEventCreateProcessor()
      console.error("====>SetEventConfigSuccess001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
  })
}
