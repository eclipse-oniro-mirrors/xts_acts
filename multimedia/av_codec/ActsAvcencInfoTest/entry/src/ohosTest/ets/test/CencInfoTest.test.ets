/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import cencTest from 'libcencinfotest.so';
import { describe, it, expect, Level } from '@ohos/hypium';
export default function otoTest() {
describe('CencInfoCapiUnitTest', () => {
/**
 * @tc.name CencInfo_Create_001
 * @tc.number TC-CencInfo-001
 * @tc.desc
 */
it('CencInfo_Create_001', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoCreate(0);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_Destroy_001
 * @tc.number TC-CencInfo-002
 * @tc.desc
 */
it('CencInfo_Destroy_001', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoDestroy(0);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_Destroy_002
 * @tc.number TC-CencInfo-003
 * @tc.desc
 */
it('CencInfo_Destroy_002', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoDestroy(1);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetAlgorithm_001
 * @tc.number TC-CencInfo-004
 * @tc.desc
 */
it('CencInfo_SetAlgorithm_001', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetAlgorithm(0);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetAlgorithm_002
 * @tc.number TC-CencInfo-005
 * @tc.desc
 */
it('CencInfo_SetAlgorithm_002', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetAlgorithm(1);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetKeyIdAndIv_001
 * @tc.number TC-CencInfo-006
 * @tc.desc
 */
it('CencInfo_SetKeyIdAndIv_001', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetKeyIdAndIv(0);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetKeyIdAndIv_002
 * @tc.number TC-CencInfo-007
 * @tc.desc
 */
it('CencInfo_SetKeyIdAndIv_002', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetKeyIdAndIv(1);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetKeyIdAndIv_003
 * @tc.number TC-CencInfo-008
 * @tc.desc
 */
it('CencInfo_SetKeyIdAndIv_003', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetKeyIdAndIv(2);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetKeyIdAndIv_004
 * @tc.number TC-CencInfo-009
 * @tc.desc
 */
it('CencInfo_SetKeyIdAndIv_004', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetKeyIdAndIv(3);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetKeyIdAndIv_005
 * @tc.number TC-CencInfo-010
 * @tc.desc
 */
it('CencInfo_SetKeyIdAndIv_005', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetKeyIdAndIv(4);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetKeyIdAndIv_006
 * @tc.number TC-CencInfo-011
 * @tc.desc
 */
it('CencInfo_SetKeyIdAndIv_006', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetKeyIdAndIv(5);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetSubsampleInfo_001
 * @tc.number TC-CencInfo-012
 * @tc.desc
 */
it('CencInfo_SetSubsampleInfo_001', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetSubsampleInfo(0);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetSubsampleInfo_002
 * @tc.number TC-CencInfo-013
 * @tc.desc
 */
it('CencInfo_SetSubsampleInfo_002', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetSubsampleInfo(1);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetSubsampleInfo_003
 * @tc.number TC-CencInfo-014
 * @tc.desc
 */
it('CencInfo_SetSubsampleInfo_003', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetSubsampleInfo(2);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetSubsampleInfo_004
 * @tc.number TC-CencInfo-015
 * @tc.desc
 */
it('CencInfo_SetSubsampleInfo_004', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetSubsampleInfo(3);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetMode_001
 * @tc.number TC-CencInfo-016
 * @tc.desc
 */
it('CencInfo_SetMode_001', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetMode(0);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetMode_002
 * @tc.number TC-CencInfo-017
 * @tc.desc
 */
it('CencInfo_SetMode_002', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetMode(1);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetAVBuffer_001
 * @tc.number TC-CencInfo-018
 * @tc.desc
 */
it('CencInfo_SetAVBuffer_001', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetAVBuffer(0);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetAVBuffer_002
 * @tc.number TC-CencInfo-019
 * @tc.desc
 */
it('CencInfo_SetAVBuffer_002', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetAVBuffer(1);
  expect(ret).assertEqual(0);
});

/**
 * @tc.name CencInfo_SetAVBuffer_003
 * @tc.number TC-CencInfo-020
 * @tc.desc
 */
it('CencInfo_SetAVBuffer_003', Level.LEVEL0, () => {
  let ret: number = cencTest.cencInfoSetAVBuffer(2);
  expect(ret).assertEqual(0);
});
});}