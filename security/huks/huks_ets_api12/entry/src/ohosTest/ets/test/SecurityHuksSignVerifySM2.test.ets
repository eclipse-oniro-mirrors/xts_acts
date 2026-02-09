/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import { MergeOptions, SetParam } from './utils/huks/HuksOptionsUtils.ets';
import { BuildSignVerifyData, GetNoDigestSignOptions, SignVerify, SignVerifyData } from './utils/huks/SignVerifyUtils.ets';
import { GetSm2GenerateOptions } from './utils/huks/GenerateKeyUtils.ets';
import { Logger } from './utils/common/Logger.ets';


export default function SecurityHuksSignVerifySM2Test() {
  let genKeyOption: huks.HuksOptions;
  let signVerifyOption: huks.HuksOptions;

  describe('SecurityHuksSignVerifySM2Test', () => {
    beforeEach(() => {
      genKeyOption = GetSm2GenerateOptions(256);
      SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
      signVerifyOption = MergeOptions(GetSm2GenerateOptions(256), GetNoDigestSignOptions());
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_0100
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_0100
     * @tc.desc   test sm2-noDigest signVerify, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_0100";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([32]);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_0200
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_0200
     * @tc.desc   test sm2-noDigest signVerify with unsupported data length, process fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_0200";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([16]);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_0300
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_0300
     * @tc.desc   test sm2-noDigest signVerify with unsupported data length, process fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_0300";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([31]);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_0400
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_0400
     * @tc.desc   test sm2-noDigest signVerify with unsupported data length, process fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_0400";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([33]);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_0500
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_0500
     * @tc.desc   test sm2-noDigest signVerify with unsupported data length, process fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_0500";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([64]);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_0600
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_0600
     * @tc.desc   test sm2-noDigest signVerify, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_0600";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([32]);
      try {
        SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_0700
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_0700
     * @tc.desc   test sm2-noDigest signVerify with inconsistent key property, process fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_0700";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([32]);
      try {
        SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SM3);
        await huks.generateKeyItem(testNumber, genKeyOption);
        await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_0800
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_0800
     * @tc.desc   test sm2-sm3 signVerify with inconsistent key property, process fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_0800";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([32]);
      try {
        SetParam(genKeyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE);
        await huks.generateKeyItem(testNumber, genKeyOption);
        SetParam(signVerifyOption, huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SM3);
        await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_0900
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_0900
     * @tc.desc   test sm2-sm3 signVerify, update-finish, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_0900";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([15, 17]);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_1000
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_1000
     * @tc.desc   test sm2-sm3 signVerify, update-update-finish, process success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_1000";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([1, 15, 16]);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        let res: boolean = await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(res).assertEqual(true);
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_1100
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_1100
     * @tc.desc   test sm2-noDigest signVerify with unsupported data length, update-finish, process fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_1100";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([15, 16]);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_1200
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_1200
     * @tc.desc   test sm2-noDigest signVerify with unsupported data length, update-finish, process fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_1200";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([16, 17]);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   SUB_Security_HUKS_SignVerify_SM2_API22_Func_1300
     * @tc.number SUB_Security_HUKS_SignVerify_SM2_API22_Func_1300
     * @tc.desc   test sm2-noDigest signVerify with unsupported data length, update-update-finish, process fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_HUKS_SignVerify_SM2_API22_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let testNumber: string = "SUB_Security_HUKS_SignVerify_SM2_API22_Func_1300";
      let signVerifyData: SignVerifyData = BuildSignVerifyData([16, 16, 1]);
      try {
        await huks.generateKeyItem(testNumber, genKeyOption);
        await SignVerify(testNumber, signVerifyOption, signVerifyData);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(testNumber + `: catch error ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    })
  }
  )
}