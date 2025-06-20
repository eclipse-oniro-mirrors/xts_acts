/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from "@ohos/hypium"
import native from 'libnativendk.so'

export default function nativeNdkTest() {
  describe('AvcodecAVCapabilityTest', () => {

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0200
     * @tc.name       : testOHAvCapabilityIsHardware002
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware002', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 1);
        expect(result != null).assertTrue();
        done();
      } catch (err) {
        console.info('testOHAvCapabilityIsHardware002 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0300
     * @tc.name       : testOHAvCapabilityIsHardware003
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware003', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0400
     * @tc.name       : testOHAvCapabilityIsHardware004
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware004', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0500
     * @tc.name       : testOHAvCapabilityIsHardware005
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware005', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0600
     * @tc.name       : testOHAvCapabilityIsHardware006
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware006', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0700
     * @tc.name       : testOHAvCapabilityIsHardware007
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware007', Level.LEVEL0, async (done: Function) => {
      try{
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 1);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsHardware007 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0800
     * @tc.name       : testOHAvCapabilityIsHardware008
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware008', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0900
     * @tc.name       : testOHAvCapabilityIsHardware009
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware009', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 1, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1000
     * @tc.name       : testOHAvCapabilityIsHardware010
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware010', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1100
     * @tc.name       : testOHAvCapabilityIsHardware011
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware011', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1200
     * @tc.name       : testOHAvCapabilityIsHardware012
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware012', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1300
     * @tc.name       : testOHAvCapabilityIsHardware013
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware013', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1400
     * @tc.name       : testOHAvCapabilityIsHardware014
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware014', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 1, 0, 1, 1);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsHardware014 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1500
     * @tc.name       : testOHAvCapabilityIsHardware015
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware015', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 1, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1600
     * @tc.name       : testOHAvCapabilityIsHardware016
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware016', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1700
     * @tc.name       : testOHAvCapabilityIsHardware017
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware017', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1800
     * @tc.name       : testOHAvCapabilityIsHardware018
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware018', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_1900
     * @tc.name       : testOHAvCapabilityIsHardware019
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware019', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2000
     * @tc.name       : testOHAvCapabilityIsHardware020
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware020', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2100
     * @tc.name       : testOHAvCapabilityIsHardware021
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware021', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2200
     * @tc.name       : testOHAvCapabilityIsHardware022
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware022', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2300
     * @tc.name       : testOHAvCapabilityIsHardware023
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware023', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2400
     * @tc.name       : testOHAvCapabilityIsHardware024
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware024', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2500
     * @tc.name       : testOHAvCapabilityIsHardware025
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware025', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2600
     * @tc.name       : testOHAvCapabilityIsHardware026
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware026', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2700
     * @tc.name       : testOHAvCapabilityIsHardware027
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware027', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_2800
     * @tc.name       : testOHAvCapabilityIsHardware028
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsHardware028', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0200
     * @tc.name       : testOHAvCapabilityGetName002
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName002', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0300
     * @tc.name       : testOHAvCapabilityGetName003
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName003', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0400
     * @tc.name       : testOHAvCapabilityGetName004
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName004', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0500
     * @tc.name       : testOHAvCapabilityGetName005
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName005', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0600
     * @tc.name       : testOHAvCapabilityGetName006
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName006', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0700
     * @tc.name       : testOHAvCapabilityGetName007
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName007', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0800
     * @tc.name       : testOHAvCapabilityGetName008
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName008', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0900
     * @tc.name       : testOHAvCapabilityGetName009
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName009', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1000
     * @tc.name       : testOHAvCapabilityGetName010
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName010', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1100
     * @tc.name       : testOHAvCapabilityGetName011
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName011', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1200
     * @tc.name       : testOHAvCapabilityGetName012
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName012', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1300
     * @tc.name       : testOHAvCapabilityGetName013
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName013', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1400
     * @tc.name       : testOHAvCapabilityGetName014
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName014', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 1, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1500
     * @tc.name       : testOHAvCapabilityGetName015
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName015', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1600
     * @tc.name       : testOHAvCapabilityGetName016
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName016', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1700
     * @tc.name       : testOHAvCapabilityGetName017
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName017', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1800
     * @tc.name       : testOHAvCapabilityGetName018
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName018', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_1900
     * @tc.name       : testOHAvCapabilityGetName019
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName019', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2000
     * @tc.name       : testOHAvCapabilityGetName020
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName020', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2100
     * @tc.name       : testOHAvCapabilityGetName021
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName021', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2200
     * @tc.name       : testOHAvCapabilityGetName022
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName022', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2300
     * @tc.name       : testOHAvCapabilityGetName023
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName023', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2400
     * @tc.name       : testOHAvCapabilityGetName024
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName024', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2500
     * @tc.name       : testOHAvCapabilityGetName025
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName025', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2600
     * @tc.name       : testOHAvCapabilityGetName026
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName026', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2700
     * @tc.name       : testOHAvCapabilityGetName027
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName027', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2800
     * @tc.name       : testOHAvCapabilityGetName028
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName028', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 1, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_2900
     * @tc.name       : testOHAvCapabilityGetName029
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName029', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3000
     * @tc.name       : testOHAvCapabilityGetName030
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName030', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3100
     * @tc.name       : testOHAvCapabilityGetName031
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName031', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3200
     * @tc.name       : testOHAvCapabilityGetName032
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName032', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3300
     * @tc.name       : testOHAvCapabilityGetName033
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName033', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3400
     * @tc.name       : testOHAvCapabilityGetName034
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName034', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3500
     * @tc.name       : testOHAvCapabilityGetName035
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName035', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3600
     * @tc.name       : testOHAvCapabilityGetName036
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName036', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3700
     * @tc.name       : testOHAvCapabilityGetName037
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName037', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3800
     * @tc.name       : testOHAvCapabilityGetName038
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName038', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_3900
     * @tc.name       : testOHAvCapabilityGetName039
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName039', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_4000
     * @tc.name       : testOHAvCapabilityGetName040
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName040', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_4100
     * @tc.name       : testOHAvCapabilityGetName041
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName041', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_4200
     * @tc.name       : testOHAvCapabilityGetName042
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetName042', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 0, 0, 1, 2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0200
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances002
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances002', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0300
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances003
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances003', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0400
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances004
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances004', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0500
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances005
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances005', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0600
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances006
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances006', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0700
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances007
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances007', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0800
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances008
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances008', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0900
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances009
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances009', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1000
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances010
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances010', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1100
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances011
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances011', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1200
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances012
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances012', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1300
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances013
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances013', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1400
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances014
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances014', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 1, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1500
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances015
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances015', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1600
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances016
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances016', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1700
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances017
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances017', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1800
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances018
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances018', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_1900
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances019
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances019', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2000
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances020
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances020', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2100
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances021
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances021', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2200
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances022
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances022', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2300
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances023
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances023', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2400
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances024
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances024', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2500
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances025
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances025', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2600
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances026
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances026', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2700
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances027
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances027', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2800
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances028
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances028', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_2900
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances029
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances029', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3000
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances030
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances030', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3100
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances031
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances031', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3200
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances032
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances032', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3300
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances033
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances033', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3400
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances034
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances034', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3500
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances035
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances035', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3600
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances036
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances036', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3700
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances037
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances037', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3800
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances038
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances038', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_3900
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances039
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances039', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_4000
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances040
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances040', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_4100
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances041
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances041', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_4200
     * @tc.name       : testOHAvCapabilityGetMaxSupportedInstances042
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetMaxSupportedInstances042', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 1, 0, 1, 3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0200
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange002
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange002', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0300
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange003
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange003', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0400
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange004
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange004', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0500
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange005
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange005', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0600
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange006
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange006', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 4);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetEncoderBitrateRange006 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0700
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange007
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange007', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0800
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange008
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange008', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 4);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetEncoderBitrateRange008 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0900
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange009
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange009', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1000
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange010
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange010', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1100
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange011
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange011', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1200
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange012
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange012', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1300
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange013
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange013', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1400
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange014
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange014', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1500
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange015
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange015', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1600
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange016
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange016', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 1, 1, 4);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetEncoderBitrateRange016 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1700
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange017
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange017', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 1, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1800
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange018
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange018', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 1, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1900
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange019
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange019', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 1, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2000
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange020
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange020', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 1, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2100
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange021
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange021', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 1, 1, 4);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetEncoderBitrateRange021 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2200
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange022
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange022', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 1, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2300
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange023
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange023', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 1, 1, 5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported002
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported002', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0300
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported003
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported003', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0400
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported004
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported004', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0500
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported005
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported005', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0600
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported006
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported006', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 6);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported006 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0700
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported007
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported007', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0800
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported008
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported008', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 1, 1, 7);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported008 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0900
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported009
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported009', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 1, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1000
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported010
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported010', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 1, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1100
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported011
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported011', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 1, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported012
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported012', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 1, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1300
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported013
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported013', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 7);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported013 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1400
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported014
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported014', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1500
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported015
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported015', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 1, 1, 8);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported015 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1600
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported016
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported016', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1700
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported017
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported017', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1800
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported018
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported018', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1900
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported019
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported019', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2000
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported020
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported020', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 8);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported020 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2100
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported021
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported021', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported022
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported022', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 6);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported022 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported023
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported023', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported024
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported024', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported025
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported025', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported026
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported026', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported027
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported027', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported028
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported028', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported029
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported029', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported030
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported030', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 6);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported030 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported031
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported031', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported032
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported032', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported033
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported033', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported034
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported034', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported035
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported035', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 6);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported035 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported036
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported036', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported037
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported037', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 7);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported037 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported038
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported038', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported039
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported039', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported040
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported040', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported041
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported041', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported042
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported042', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported043
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported043', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported044
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported044', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 7);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported044 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported045
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported045', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported046
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported046', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported047
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported047', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported048
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported048', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported049
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported049', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 7);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported049 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported050
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported050', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported051
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported051', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 8);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported051 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported052
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported052', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });


    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported055
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported055', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported056
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported056', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported057
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported057', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported058
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported058', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 8);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported058 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported059
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported059', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported060
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported060', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported061
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported061', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported062
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported062', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported063
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported063', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 8);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported063 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0200
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight002
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight002', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 9);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight002 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0300
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight003
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight003', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 9);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight003 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0400
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight004
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight004', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 9);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0500
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight005
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight005', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 1, 0, 1, 9);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0600
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight006
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight006', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 1, 0, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight006 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0700
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight007
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight007', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 1, 0, 1, 9);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0800
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight008
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight008', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight008 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0900
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight009
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight009', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 9);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1000
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight010
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight010', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 9);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1100
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight011
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight011', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight011 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1200
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight012
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight012', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(7, 0, 0, 0, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight012 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1300
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight013
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight013', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 10);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1400
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight014
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight014', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 1, 1, 9);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight014 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1500
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight015
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight015', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 9);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight015 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1600
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight016
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight016', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 9);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1700
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight017
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight017', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 1, 1, 9);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1800
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight018
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight018', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 0, 1, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight018 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1900
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight019
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight019', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(7, 0, 0, 1, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight019 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_2000
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight020
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight020', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 0, 1, 1, 10);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0200
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth002
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth002', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 11);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth002 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0300
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth003
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth003', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 11);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth003 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0400
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth004
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth004', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 11);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0500
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth005
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth005', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 1, 0, 1, 11);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0600
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth006
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth006', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 1, 0, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth006 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0700
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth007
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth007', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 1, 0, 1, 11);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0800
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth008
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth008', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 0, 0, 0, 1, 11);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth008 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0900
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth009
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth009', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth009 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1000
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth010
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth010', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(7, 0, 0, 0, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth010 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1100
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth011
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth011', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth011 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1200
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth012
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth012', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 11);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1300
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth013
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth013', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 11);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1400
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth014
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth014', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 11);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth014 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1500
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth015
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth015', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 11);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1600
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth016
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth016', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 1, 1, 11);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1700
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth017
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth017', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 0, 1, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth017 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1800
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth018
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth018', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(7, 0, 0, 1, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth018 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1900
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth019
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth019', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 1, 1, 12);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_2000
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth020
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth020', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 12);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported002
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported002', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,1,0,1,1,13);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported002 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported003
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported003', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,1,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported004
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported004', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,1,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported005
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported005', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,1,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported006
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported006', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,1,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported007
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported007', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6,1,0,1,1,13);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported007 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported008
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported008', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,1,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported009
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported009', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,0,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported010
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported010', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,0,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported011
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported011', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,0,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported012
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported012', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,0,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported013
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported013', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6,0,0,1,1,13);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported013 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported014
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported014', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(7,0,0,1,1,13);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported014 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported015
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported015', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,1,0,1,1,14);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported015 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported016
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported016', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,1,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported017
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported017', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,1,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported018
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported018', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,1,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported019
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported019', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,1,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_2000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported020
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported020', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,1,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_2100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported021
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported021', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,1,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_2200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported022
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported022', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1,0,0,1,1,14);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_2300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported023
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported023', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,0,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_2400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported024
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported024', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,0,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_2500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported025
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported025', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,0,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_2600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported026
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported026', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,0,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_2700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported027
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported027', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,0,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_2800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported028
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported028', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,0,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_2900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported029
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported029', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,0,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_3000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported030
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported030', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,1,0,1,1,15);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported030 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_3100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported031
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported031', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,1,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_3200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported032
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported032', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,1,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_3300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported033
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported033', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,1,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_3400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported034
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported034', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,1,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_3500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported035
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported035', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,1,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_3600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported036
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported036', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,1,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_3700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported037
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported037', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1,0,0,1,1,15);
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_3800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported038
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported038', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,0,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_3900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported039
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported039', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,0,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_4000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported040
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported040', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,0,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_4100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported041
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported041', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,0,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_4200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported042
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported042', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,0,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_4300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported043
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported043', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,0,0,1,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_4400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported044
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported044', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,1,1,0,1,13);
        expect(result != null).assertTrue();
        done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported044 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_4500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported045
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported045', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,1,1,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_4600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported046
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported046', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,1,1,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_4700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported047
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported047', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,1,1,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_4800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported048
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported048', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,1,1,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_4900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported049
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported049', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6,1,1,0,1,13);
        expect(result != null).assertTrue();
        done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported049 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_5000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported050
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported050', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,1,1,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_5100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported051
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported051', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,1,0,0,1,13);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported051 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_5200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported052
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported052', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,1,0,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_5300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported053
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported053', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,1,0,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_5400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported054
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported054', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,1,0,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_5500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported055
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported055', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,1,0,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_5600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported056
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported056', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,1,0,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_5700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported057
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported057', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,1,0,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_5800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported058
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported058', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1,0,1,0,1,13);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_5900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported059
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported059', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,0,1,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_6000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported060
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported060', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,0,1,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_6100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported061
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported061', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,0,1,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_6200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported062
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported062', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,0,1,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_6300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported063
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported063', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6,0,1,0,1,13);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported063 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_6400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported064
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported064', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,0,1,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_6500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported065
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported065', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,0,0,0,1,13);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported065 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_6600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported066
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported066', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,0,0,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_6700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported067
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported067', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,0,0,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_6800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported068
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported068', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,0,0,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_6900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported069
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported069', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,0,0,0,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_7000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported070
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported070', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6,0,0,0,1,13);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported070 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_7100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported071
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported071', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(7,0,0,0,1,13);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported071 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_7200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported072
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported072', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,1,1,0,1,14);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported072 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_7300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported073
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported073', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,1,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_7400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported074
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported074', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,1,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_7500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported075
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported075', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,1,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_7600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported076
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported076', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,1,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_7700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported077
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported077', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,1,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_7800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported078
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported078', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,1,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_7900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported079
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported079', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1,1,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_8000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported080
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported080', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,1,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_8100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported081
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported081', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,1,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_8200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported082
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported082', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,1,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_8300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported083
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported083', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,1,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_8400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported084
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported084', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,1,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_8500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported085
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported085', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,1,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_8600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported086
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported086', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1,0,1,0,1,14);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_8700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported087
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported087', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,0,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_8800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported088
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported088', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,0,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_8900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported089
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported089', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,0,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_9000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported090
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported090', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,0,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_9100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported091
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported091', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,0,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_9200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported092
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported092', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,0,1,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_9300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported093
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported093', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,0,0,0,1,14);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported093 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_9400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported094
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported094', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,0,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_9500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported095
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported095', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,0,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_9600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported096
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported096', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,0,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_9700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported097
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported097', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,0,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_9800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported098
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported098', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,0,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_9900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported099
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported099', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,0,0,0,1,14);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_0000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported100
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported100', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,1,1,0,1,15);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported100 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_0100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported101
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported101', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,1,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_0200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported102
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported102', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,1,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_0300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported103
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported103', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,1,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_0400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported104
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported104', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,1,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_0500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported105
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported105', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,1,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_0600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported106
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported106', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,1,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_0700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported107
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported107', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,1,0,0,1,15);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported107 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_0800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported108
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported108', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,1,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_0900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported109
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported109', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,1,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_1000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported110
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported110', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,1,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_1100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported111
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported111', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,1,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_1200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported112
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported112', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,1,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_1300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported113
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported113', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,1,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_1400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported114
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported114', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1,0,1,0,1,15);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_1500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported115
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported115', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,0,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_1600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported116
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported116', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,0,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_1700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported117
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported117', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,0,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_1800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported118
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported118', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,0,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_1900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported119
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported119', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,0,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_2000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported120
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported120', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,0,1,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_2100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported121
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported121', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,0,0,0,1,15);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported121 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_2200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported122
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported122', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,0,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_2300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported123
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported123', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,0,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_2400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported124
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported124', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,0,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_2500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported125
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported125', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,0,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED100_2600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported126
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported126', Level.LEVEL0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6,0,0,0,1,15);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISHARDWARE_0100
     * @tc.name       : testOhAvCapabilityIsHardware001
     * @tc.desc       : test OH_AVCapability_IsHardware
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityIsHardware001', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.OH_AVCapability_IsHardware();
        expect(result != null).assertTrue();
        done();
      } catch (err) {
        console.info('testOhAvCapabilityIsHardware001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETNAME_0100
     * @tc.name       : testOhAvCapabilityGetName001
     * @tc.desc       : test OH_AVCapability_GetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetName001', Level.LEVEL0, async (done: Function) => {
      expect(native.OH_AVCapability_GetName()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETMAXSUPPORTEDINSTANCES_0100
     * @tc.name       : testOhAvCapabilityGetMaxSupportedInstances001
     * @tc.desc       : test OH_AVCapability_GetMaxSupportedInstances
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetMaxSupportedInstances001', Level.LEVEL0, async (done: Function) => {
      expect(native.OH_AVCapability_GetMaxSupportedInstances()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_0100
     * @tc.name       : testOhAvCapabilityGetEncoderBitrateRange001
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetEncoderBitrateRange001', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.OH_AVCapability_GetEncoderBitrateRange();
        expect(result != null).assertTrue();
        done();
      } catch (err) {
        console.info('testOhAvCapabilityGetEncoderBitrateRange001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0100
     * @tc.name       : testOhAvCapabilityIsEncoderBitrateModeSupported001
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityIsEncoderBitrateModeSupported001', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.OH_AVCapability_IsEncoderBitrateModeSupported();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityIsEncoderBitrateModeSupported001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0100
     * @tc.name       : testOhAvCapabilityGetVideoWidthRangeForHeight001
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoWidthRangeForHeight001', Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = native.OH_AVCapability_GetVideoWidthRangeForHeight();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetVideoWidthRangeForHeight001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0100
     * @tc.name       : testOhAvCapabilityGetVideoHeightRangeForWidth001
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightRangeForWidth001', Level.LEVEL0, async (done: Function) => {
      done();
      try {
        let result: number = native.OH_AVCapability_GetVideoHeightRangeForWidth();
        expect(result != null).assertTrue();
        done();
      } catch (err) {
        console.info('testOhAvCapabilityGetVideoHeightRangeForWidth001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0100
     * @tc.name       : testOhAvCapabilityAreProfileAndLevelSupported001
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityAreProfileAndLevelSupported001', Level.LEVEL0, async (done: Function) => {
      expect(native.OH_AVCapability_AreProfileAndLevelSupported()).assertEqual(0);
      done();
    });
  })
}