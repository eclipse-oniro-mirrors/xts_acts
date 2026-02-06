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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import thermal from '@ohos.thermal'

let domain: number = 0x0000;
let tag: string = 'ThermalStaticTest';

export default function ThermalTest() {

  describe("ThermalTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.number SUB_PowerSystem_ThermalManager_ETSTest_0010
     * @tc.name testThermalTest_static_0100
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testThermalTest_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testThermalTest_static_0100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          thermal.registerThermalLevelCallback((level: thermal.ThermalLevel) => {
            hilog.info(domain, tag, `${TAG} level: ${JSON.stringify(level)}`);
            expect(Number(level)).assertLargerOrEqual(thermal.ThermalLevel.COOL);
            expect(Number(level)).assertLessOrEqual(thermal.ThermalLevel.ESCAPE);
            done();
          });
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_ETSTest_0020
     * @tc.name testThermalTest_static_0200
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testThermalTest_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testThermalTest_static_0200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          thermal.unregisterThermalLevelCallback(() => {
            hilog.info(domain, tag, `${TAG} unregisterThermalLevelCallback success`);
            done();
          });
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_ETSTest_0030
     * @tc.name testThermalTest_static_0300
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testThermalTest_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testThermalTest_static_0300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let level: thermal.ThermalLevel = thermal.getLevel();
          hilog.info(domain, tag, `${TAG} level: ${JSON.stringify(level)}`);
          expect(Number(level)).assertLargerOrEqual(thermal.ThermalLevel.COOL);
          expect(Number(level)).assertLessOrEqual(thermal.ThermalLevel.ESCAPE);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_ETSTest_0040
     * @tc.name testThermalTest_static_0400
     * @tc.desc Get device thermalLevel COOL
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testThermalTest_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testThermalTest_static_0400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let level = thermal.ThermalLevel.COOL;
          hilog.info(domain, tag, `${TAG} level: ${level}`);
          expect(Number(level)).assertEqual(0);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_ETSTest_0050
     * @tc.name testThermalTest_static_0500
     * @tc.desc Get device thermalLevel NORMAL
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testThermalTest_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testThermalTest_static_0500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let level = thermal.ThermalLevel.NORMAL;
          hilog.info(domain, tag, `${TAG} level: ${level}`);
          expect(Number(level)).assertEqual(1);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_ETSTest_0060
     * @tc.name testThermalTest_static_0600
     * @tc.desc Get device thermalLevel WARM
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testThermalTest_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testThermalTest_static_0600';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let level = thermal.ThermalLevel.WARM;
          hilog.info(domain, tag, `${TAG} level: ${level}`);
          expect(Number(level)).assertEqual(2);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_ETSTest_0070
     * @tc.name testThermalTest_static_0700
     * @tc.desc Get device thermalLevel HOT
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testThermalTest_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testThermalTest_static_0700';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let level = thermal.ThermalLevel.HOT;
          hilog.info(domain, tag, `${TAG} level: ${level}`);
          expect(Number(level)).assertEqual(3);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_ETSTest_0080
     * @tc.name testThermalTest_static_0800
     * @tc.desc Get device thermalLevel OVERHEATED
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testThermalTest_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testThermalTest_static_0800';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let level = thermal.ThermalLevel.OVERHEATED;
          hilog.info(domain, tag, `${TAG} level: ${level}`);
          expect(Number(level)).assertEqual(4);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_ETSTest_0090
     * @tc.name testThermalTest_static_0900
     * @tc.desc Get device thermalLevel WARNING
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testThermalTest_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testThermalTest_static_0900';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let level = thermal.ThermalLevel.WARNING;
          hilog.info(domain, tag, `${TAG} level: ${level}`);
          expect(Number(level)).assertEqual(5);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_ETSTest_0100
     * @tc.name testThermalTest_static_1000
     * @tc.desc Get device thermalLevel EMERGENCY
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testThermalTest_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testThermalTest_static_1000';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let level = thermal.ThermalLevel.EMERGENCY;
          hilog.info(domain, tag, `${TAG} level: ${level}`);
          expect(Number(level)).assertEqual(6);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_ETSTest_0110
     * @tc.name testThermalTest_static_1100
     * @tc.desc Get device thermalLevel ESCAPE
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testThermalTest_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testThermalTest_static_1100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let level = thermal.ThermalLevel.ESCAPE;
          hilog.info(domain, tag, `${TAG} level: ${level}`);
          expect(Number(level)).assertEqual(7);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })
  })
  hilog.info(domain, tag, '%{public}s', 'ThermalStaticTest end');
}