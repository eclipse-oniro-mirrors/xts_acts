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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium'
import huksndk from 'libhuksndk.so'
import { CheckWifiInfo } from './utils/common/NetworkUtils';

export default function huksNdkTest() {
  describe('SecurityHuksTest', () => {

    /**
     * @tc.name   testOHHuksGetSdkVersion001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GETSDKVERSION_0100
     * @tc.desc   test OH_Huks_GetSdkVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHuksGetSdkVersion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksndk.oHHuksGetSdkVersion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksGetSdkVersion002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GETSDKVERSION_0200
     * @tc.desc   test OH_Huks_GetSdkVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHHuksGetSdkVersion002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: number = huksndk.oHHuksGetSdkVersionErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksGenerateKeyItem001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GENERATEKEYITEM_0100
     * @tc.desc   test OH_Huks_GenerateKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksGenerateKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksGenerateKeyItem();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksGenerateKeyItem002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GENERATEKEYITEM_0200
     * @tc.desc   test OH_Huks_GenerateKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksGenerateKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksGenerateKeyItemErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksExportPublicKeyItem002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_EXPORTPUBLICKEYITEM_0200
     * @tc.desc   test OH_Huks_ExportPublicKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksExportPublicKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksExportPublicKeyItemErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksImportKeyItem002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_IMPORTKEYITEM_0200
     * @tc.desc   test OH_Huks_ImportKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksImportKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksImportKeyItemErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksDeleteKeyItem001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_DELETEKEYITEM_0100
     * @tc.desc   test OH_Huks_DeleteKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksDeleteKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksDeleteKeyItem();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksDeleteKeyItem002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_DELETEKEYITEM_0200
     * @tc.desc   test OH_Huks_DeleteKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksDeleteKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksDeleteKeyItemErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksIsKeyItemExist001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ISKEYITEMEXIST_0100
     * @tc.desc   test OH_Huks_IsKeyItemExist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksIsKeyItemExist001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksIsKeyItemExist();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksIsKeyItemExist002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ISKEYITEMEXIST_0200
     * @tc.desc   test OH_Huks_IsKeyItemExist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksIsKeyItemExist002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksIsKeyItemExistErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksInitSession001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_INITSESSION_0100
     * @tc.desc   test OH_Huks_InitSession
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksInitSession001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksInitSession();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksInitSession002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_INITSESSION_0200
     * @tc.desc   test OH_Huks_InitSession
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksInitSession002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksInitSessionErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksAttestOHHuksKeyItem001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ATTESTKEYITEM_0100
     * @tc.desc   test OH_Huks_AttestKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksAttestOHHuksKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksAttestKeyItem();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksAttestOHHuksKeyItem002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ATTESTKEYITEM_0200
     * @tc.desc   test OH_Huks_AttestKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksAttestOHHuksKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksAttestKeyItemErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksInitParamSet001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_INITPARAMSET_0100
     * @tc.desc   test OH_Huks_InitParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksInitParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksInitParamSet();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksInitParamSet002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_INITPARAMSET_0200
     * @tc.desc   test OH_Huks_InitParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksInitParamSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksInitParamSetErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksAddParams001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ADDPARAMS_0100
     * @tc.desc   test OH_Huks_AddParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksAddParams001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksAddParams();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksAddParams002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ADDPARAMS_0200
     * @tc.desc   test OH_Huks_AddParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksAddParams002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksAddParamsErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksBuildParamSet001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_BUILDPARAMSET_0100
     * @tc.desc   test OH_Huks_BuildParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksBuildParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksBuildParamSet();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksBuildParamSet002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_BUILDPARAMSET_0200
     * @tc.desc   test OH_Huks_BuildParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksBuildParamSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksBuildParamSetErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksFreeParamSet001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_FREEPARAMSET_0100
     * @tc.desc   test OH_Huks_FreeParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksFreeParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksFreeParamSet();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksIsParamSetValid001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ISPARAMSETVALID_0100
     * @tc.desc   test OH_Huks_IsParamSetValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksIsParamSetValid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksIsParamSetValid();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksIsParamSetValid002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ISPARAMSETVALID_0200
     * @tc.desc   test OH_Huks_IsParamSetValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksIsParamSetValid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksIsParamSetValidErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksIsParamSetTagValid001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ISPARAMSETTAGVALID_0100
     * @tc.desc   test OH_Huks_IsParamSetTagValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksIsParamSetTagValid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksIsParamSetTagValid();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksIsParamSetTagValid002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ISPARAMSETTAGVALID_0200
     * @tc.desc   test OH_Huks_IsParamSetTagValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksIsParamSetTagValid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksIsParamSetTagValidErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksCheckParamMatch001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_CHECKPARAMMATCH_0100
     * @tc.desc   test OH_Huks_CheckParamMatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksCheckParamMatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksCheckParamMatch();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksCheckParamMatch002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_CHECKPARAMMATCH_0200
     * @tc.desc   test OH_Huks_CheckParamMatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksCheckParamMatch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksCheckParamMatchErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksFreshParamSet001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_FRESHPARAMSET_0100
     * @tc.desc   test OH_Huks_FreshParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksFreshParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksFreshParamSet();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksFreshParamSet002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_FRESHPARAMSET_0200
     * @tc.desc   test OH_Huks_FreshParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksFreshParamSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksFreshParamSetErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksGetParam001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_GETPARAM_0100
     * @tc.desc   test OH_Huks_GetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksGetParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksGetParam();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksGetParam002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_GETPARAM_0200
     * @tc.desc   test OH_Huks_GetParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksGetParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksGetParamErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksCopyParamSet001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_COPYPARAMSET_0100
     * @tc.desc   test OH_Huks_CopyParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksCopyParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksCopyParamSet();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksCopyParamSet002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_COPYPARAMSET_0200
     * @tc.desc   test OH_Huks_CopyParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksCopyParamSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksCopyParamSetErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksUpdateSession001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_UPDATESESSION_0100
     * @tc.desc   test OH_Huks_UpdateSession
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksUpdateSession001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksUpdateSession();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksUpdateSession002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_UPDATESESSION_0200
     * @tc.desc   test OH_Huks_UpdateSession
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksUpdateSession002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksUpdateSessionErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksFinishSession001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_FINISHSESSION_0100
     * @tc.desc   test OH_Huks_FinishSession
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksFinishSession001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksFinishSession();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksFinishSession002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_FINISHSESSION_0200
     * @tc.desc   test OH_Huks_FinishSession
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksFinishSession002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksFinishSessionErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksAbortSession001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ABORTSESSION_0100
     * @tc.desc   test OH_Huks_AbortSession
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksAbortSession001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksAbortSession();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksAbortSession002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ABORTSESSION_0200
     * @tc.desc   test OH_Huks_AbortSession
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksAbortSession002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksAbortSessionErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksGetKeyItemParamSet001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GETKEYITEMPARAMSET_0100
     * @tc.desc   test OH_Huks_GetKeyItemParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksGetKeyItemParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksGetKeyItemParamSet();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksGetKeyItemParamSet002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GETKEYITEMPARAMSET_0200
     * @tc.desc   test OH_Huks_GetKeyItemParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksGetKeyItemParamSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksGetKeyItemParamSetErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksImportWrappedKeyItem002
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_IMPORTWRAPPEDKEYITEM_0200
     * @tc.desc   test OH_Huks_ImportWrappedKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksImportWrappedKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksImportWrappedKeyItemErr();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksImportWrappedKeyItem001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_IMPORTWRAPPEDKEYITEM_0100
     * @tc.desc   test OH_Huks_ImportWrappedKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksImportWrappedKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksImportWrappedKeyItem();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksImportKeyItem001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_IMPORTKEYITEM_0100
     * @tc.desc   test OH_Huks_ImportKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksImportKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = await huksndk.oHHuksImportKeyItem();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksExportPublicKeyItem001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_EXPORTPUBLICKEYITEM_0100
     * @tc.desc   test OH_Huks_ExportPublicKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksExportPublicKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = await huksndk.oHHuksExportPublicKeyItem();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testOHHuksAnonAttestKeyItem001
     * @tc.number SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ANONATTESTKEYITEM_0100
     * @tc.desc   test testOHHuksAnonAttestKeyItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHHuksAnonAttestKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await CheckWifiInfo();
      let result: number = huksndk.oHHuksAnonAttestKeyItem();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_ListAliases_Native_Func_0100
     * @tc.number SUB_Security_HUKS_ListAliases_Native_Func_0100
     * @tc.desc   test ListAliases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ListAliases_Native_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksListAliases();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   SUB_Security_HUKS_ListAliases_Native_Func_0200
     * @tc.number SUB_Security_HUKS_ListAliases_Native_Func_0200
     * @tc.desc   test FreeKeyAliasSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_ListAliases_Native_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksFreeKeyAliasSet();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   SUB_Security_HUKS_WrapKey_Native_Func_0100
     * @tc.number SUB_Security_HUKS_WrapKey_Native_Func_0100
     * @tc.desc   test WrapKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_WrapKey_Native_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksWrapKey();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   SUB_Security_HUKS_UnwrapKey_Native_Func_0100
     * @tc.number SUB_Security_HUKS_UnwrapKey_Native_Func_0100
     * @tc.desc   test UnwrapKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_UnwrapKey_Native_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = huksndk.oHHuksUnwrapKey();
      expect(result).assertEqual(0);
    });
  })
}
