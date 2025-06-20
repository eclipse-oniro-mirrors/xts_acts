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

import { afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium'
import huksndk from 'libhuksndk.so'
import Utils from './Utils'

export default function huksNdkTest() {
  describe('SecurityHuksTest', () => {

    afterEach(async () => {
      await Utils.sleep(1000)
    })

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GETSDKVERSION_0100
     * @tc.name       : testOHHuksGetSdkVersion001
     * @tc.desc       : test OH_Huks_GetSdkVersion
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHHuksGetSdkVersion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = huksndk.oHHuksGetSdkVersion();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GETSDKVERSION_0200
     * @tc.name       : testOHHuksGetSdkVersion002
     * @tc.desc       : test OH_Huks_GetSdkVersion
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksGetSdkVersion002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = huksndk.oHHuksGetSdkVersionErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GENERATEKEYITEM_0100
     * @tc.name       : testOHHuksGenerateKeyItem001
     * @tc.desc       : test OH_Huks_GenerateKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksGenerateKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksGenerateKeyItem();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GENERATEKEYITEM_0200
     * @tc.name       : testOHHuksGenerateKeyItem002
     * @tc.desc       : test OH_Huks_GenerateKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksGenerateKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksGenerateKeyItemErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_EXPORTPUBLICKEYITEM_0200
     * @tc.name       : testOHHuksExportPublicKeyItem002
     * @tc.desc       : test OH_Huks_ExportPublicKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksExportPublicKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksExportPublicKeyItemErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_IMPORTKEYITEM_0200
     * @tc.name       : testOHHuksImportKeyItem002
     * @tc.desc       : test OH_Huks_ImportKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksImportKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksImportKeyItemErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_DELETEKEYITEM_0100
     * @tc.name       : testOHHuksDeleteKeyItem001
     * @tc.desc       : test OH_Huks_DeleteKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksDeleteKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksDeleteKeyItem();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_DELETEKEYITEM_0200
     * @tc.name       : testOHHuksDeleteKeyItem002
     * @tc.desc       : test OH_Huks_DeleteKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksDeleteKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksDeleteKeyItemErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ISKEYITEMEXIST_0100
     * @tc.name       : testOHHuksIsKeyItemExist001
     * @tc.desc       : test OH_Huks_IsKeyItemExist
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksIsKeyItemExist001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksIsKeyItemExist();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ISKEYITEMEXIST_0200
     * @tc.name       : testOHHuksIsKeyItemExist002
     * @tc.desc       : test OH_Huks_IsKeyItemExist
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksIsKeyItemExist002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksIsKeyItemExistErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_INITSESSION_0100
     * @tc.name       : testOHHuksInitSession001
     * @tc.desc       : test OH_Huks_InitSession
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksInitSession001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksInitSession();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_INITSESSION_0200
     * @tc.name       : testOHHuksInitSession002
     * @tc.desc       : test OH_Huks_InitSession
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksInitSession002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksInitSessionErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ATTESTKEYITEM_0100
     * @tc.name       : testOHHuksAttestKeyItem001
     * @tc.desc       : test OH_Huks_AttestKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksAttestOHHuksKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksAttestKeyItem();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ATTESTKEYITEM_0200
     * @tc.name       : testOHHuksAttestKeyItem002
     * @tc.desc       : test OH_Huks_AttestKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksAttestOHHuksKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksAttestKeyItemErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_INITPARAMSET_0100
     * @tc.name       : testOHHuksInitParamSet001
     * @tc.desc       : test OH_Huks_InitParamSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksInitParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksInitParamSet();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_INITPARAMSET_0200
     * @tc.name       : testOHHuksInitParamSet002
     * @tc.desc       : test OH_Huks_InitParamSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksInitParamSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksInitParamSetErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ADDPARAMS_0100
     * @tc.name       : testOHHuksAddParams001
     * @tc.desc       : test OH_Huks_AddParams
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksAddParams001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksAddParams();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ADDPARAMS_0200
     * @tc.name       : testOHHuksAddParams002
     * @tc.desc       : test OH_Huks_AddParams
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksAddParams002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksAddParamsErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_BUILDPARAMSET_0100
     * @tc.name       : testOHHuksBuildParamSet001
     * @tc.desc       : test OH_Huks_BuildParamSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksBuildParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksBuildParamSet();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_BUILDPARAMSET_0200
     * @tc.name       : testOHHuksBuildParamSet002
     * @tc.desc       : test OH_Huks_BuildParamSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksBuildParamSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksBuildParamSetErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_FREEPARAMSET_0100
     * @tc.name       : testOHHuksFreeParamSet001
     * @tc.desc       : test OH_Huks_FreeParamSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksFreeParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksFreeParamSet();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ISPARAMSETVALID_0100
     * @tc.name       : testOHHuksIsParamSetValid001
     * @tc.desc       : test OH_Huks_IsParamSetValid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksIsParamSetValid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksIsParamSetValid();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ISPARAMSETVALID_0200
     * @tc.name       : testOHHuksIsParamSetValid002
     * @tc.desc       : test OH_Huks_IsParamSetValid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksIsParamSetValid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksIsParamSetValidErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ISPARAMSETTAGVALID_0100
     * @tc.name       : testOHHuksIsParamSetTagValid001
     * @tc.desc       : test OH_Huks_IsParamSetTagValid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksIsParamSetTagValid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksIsParamSetTagValid();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_ISPARAMSETTAGVALID_0200
     * @tc.name       : testOHHuksIsParamSetTagValid002
     * @tc.desc       : test OH_Huks_IsParamSetTagValid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksIsParamSetTagValid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksIsParamSetTagValidErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_CHECKPARAMMATCH_0100
     * @tc.name       : testOHHuksCheckParamMatch001
     * @tc.desc       : test OH_Huks_CheckParamMatch
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksCheckParamMatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksCheckParamMatch();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_CHECKPARAMMATCH_0200
     * @tc.name       : testOHHuksCheckParamMatch002
     * @tc.desc       : test OH_Huks_CheckParamMatch
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksCheckParamMatch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksCheckParamMatchErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_FRESHPARAMSET_0100
     * @tc.name       : testOHHuksFreshParamSet001
     * @tc.desc       : test OH_Huks_FreshParamSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksFreshParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksFreshParamSet();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_FRESHPARAMSET_0200
     * @tc.name       : testOHHuksFreshParamSet002
     * @tc.desc       : test OH_Huks_FreshParamSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksFreshParamSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksFreshParamSetErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_GETPARAM_0100
     * @tc.name       : testOHHuksGetParam001
     * @tc.desc       : test OH_Huks_GetParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksGetParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksGetParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_GETPARAM_0200
     * @tc.name       : testOHHuksGetParam002
     * @tc.desc       : test OH_Huks_GetParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksGetParam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksGetParamErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_COPYPARAMSET_0100
     * @tc.name       : testOHHuksCopyParamSet001
     * @tc.desc       : test OH_Huks_CopyParamSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksCopyParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksCopyParamSet();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_PARAM_OH_HUKS_COPYPARAMSET_0200
     * @tc.name       : testOHHuksCopyParamSet002
     * @tc.desc       : test OH_Huks_CopyParamSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksCopyParamSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksCopyParamSetErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_UPDATESESSION_0100
     * @tc.name       : testOHHuksUpdateSession001
     * @tc.desc       : test OH_Huks_UpdateSession
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksUpdateSession001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksUpdateSession();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_UPDATESESSION_0200
     * @tc.name       : testOHHuksUpdateSession002
     * @tc.desc       : test OH_Huks_UpdateSession
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksUpdateSession002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksUpdateSessionErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_FINISHSESSION_0100
     * @tc.name       : testOHHuksFinishSession001
     * @tc.desc       : test OH_Huks_FinishSession
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksFinishSession001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksFinishSession();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_FINISHSESSION_0200
     * @tc.name       : testOHHuksFinishSession002
     * @tc.desc       : test OH_Huks_FinishSession
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksFinishSession002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksFinishSessionErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ABORTSESSION_0100
     * @tc.name       : testOHHuksAbortSession001
     * @tc.desc       : test OH_Huks_AbortSession
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksAbortSession001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksAbortSession();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ABORTSESSION_0200
     * @tc.name       : testOHHuksAbortSession002
     * @tc.desc       : test OH_Huks_AbortSession
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksAbortSession002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksAbortSessionErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GETKEYITEMPARAMSET_0100
     * @tc.name       : testOHHuksGetKeyItemParamSet001
     * @tc.desc       : test OH_Huks_GetKeyItemParamSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksGetKeyItemParamSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksGetKeyItemParamSet();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_GETKEYITEMPARAMSET_0200
     * @tc.name       : testOHHuksGetKeyItemParamSet002
     * @tc.desc       : test OH_Huks_GetKeyItemParamSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksGetKeyItemParamSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksGetKeyItemParamSetErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_IMPORTWRAPPEDKEYITEM_0200
     * @tc.name       : testOHHuksImportWrappedKeyItem002
     * @tc.desc       : test OH_Huks_ImportWrappedKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksImportWrappedKeyItem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksImportWrappedKeyItemErr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_IMPORTWRAPPEDKEYITEM_0100
     * @tc.name       : testOHHuksImportWrappedKeyItem001
     * @tc.desc       : test OH_Huks_ImportWrappedKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksImportWrappedKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksImportWrappedKeyItem();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_IMPORTKEYITEM_0100
     * @tc.name       : testOHHuksImportKeyItem001
     * @tc.desc       : test OH_Huks_ImportKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksImportKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      huksndk.oHHuksImportKeyItem().then((result: number) => {
        expect(result).assertEqual(0);
        done();
      });
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_EXPORTPUBLICKEYITEM_0100
     * @tc.name       : testOHHuksExportPublicKeyItem001
     * @tc.desc       : test OH_Huks_ExportPublicKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksExportPublicKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      huksndk.oHHuksExportPublicKeyItem().then((result: number) => {
        expect(result).assertEqual(0);
        done();
      });
    });

    /**
     * @tc.number     : SUB_SECURITY_HUKS_NATIVE_HUKS_API_OH_HUKS_ANONATTESTKEYITEM_0100
     * @tc.name       : testOHHuksAnonAttestKeyItem001
     * @tc.desc       : test testOHHuksAnonAttestKeyItem
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHuksAnonAttestKeyItem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksAnonAttestKeyItem();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_Security_HUKS_ListAliases_Native_Func_0100
     * @tc.name     : SUB_Security_HUKS_ListAliases_Native_Func_0100
     * @tc.desc     : test ListAliases
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('SUB_Security_HUKS_ListAliases_Native_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksListAliases();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number   : SUB_Security_HUKS_ListAliases_Native_Func_0200
     * @tc.name     : SUB_Security_HUKS_ListAliases_Native_Func_0200
     * @tc.desc     : test FreeKeyAliasSet
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('SUB_Security_HUKS_ListAliases_Native_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksFreeKeyAliasSet();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number   : SUB_Security_HUKS_WrapKey_Native_Func_0100
     * @tc.name     : SUB_Security_HUKS_WrapKey_Native_Func_0100
     * @tc.desc     : test WrapKey
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('SUB_Security_HUKS_WrapKey_Native_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksWrapKey();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number   : SUB_Security_HUKS_UnwrapKey_Native_Func_0100
     * @tc.name     : SUB_Security_HUKS_UnwrapKey_Native_Func_0100
     * @tc.desc     : test UnwrapKey
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 2
     */
    it('SUB_Security_HUKS_UnwrapKey_Native_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = huksndk.oHHuksUnwrapKey();
      expect(result).assertEqual(0);
      done();
    });
  })
}
