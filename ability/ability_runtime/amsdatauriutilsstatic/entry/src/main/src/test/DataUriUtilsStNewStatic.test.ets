/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import dataUriUtils from '@ohos.app.ability.dataUriUtils';
import hilog from '@ohos.hilog';
import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';

const DOMAIN: Int = 0x0000;
const TAG: string = 'DataUriUtilsStNewStaticTest';

export default function DataUriUtilsStNewStaticTest() {
  describe('DataUriUtilsStNewStaticTest', () => {

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0100
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0100
     * @tc.desc   Obtains the ID attached to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId start1');
        let result = dataUriUtils.getId("com.ix.dataUriUtils/1221");
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI : ' + result);

        expect(typeof (result)).assertEqual("number");
        expect(`${result}`).assertEqual('1221');
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId_test start1 successful');
        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0200
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0200
     * @tc.desc   Obtains the ID attached to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId start2 ');
          let result = dataUriUtils.getId("com.ix.dataUriUtils1221");
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI catch: ' + err?.code);
          expect(err?.code).assertEqual(401);
          done();
        }
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0300
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0300
     * @tc.desc   Obtains the ID attached to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId start3 ');
        let result = dataUriUtils.getId("com.ix.dataUriUtils/11234567890");
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI : ' + result);
        expect(typeof (result)).assertEqual("number");
        expect(`${result}`).assertEqual('11234567890');
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId_test start3 successful ');
        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0400
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0400
     * @tc.desc   Obtains the ID attached to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId start4 ');
          let result = dataUriUtils.getId("com.ix.dataUriUtils");
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI catch: ' + err?.code);
          expect(err?.code).assertEqual(401);
          done();
        }
        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0500
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0500
     * @tc.desc   Obtains the ID attached to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_getId_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId start5 ');
        let result = dataUriUtils.getId("com.ix.dataUriUtils/-777");
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId URI : ' + result); //-777

        expect(typeof (result)).assertEqual("number");
        expect(`${result}`).assertEqual('-777');
        hilog.info(DOMAIN, TAG, 'dataUriUtils getId_test start5 successful ');

        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0100
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0100
     * @tc.desc   Attaches the given ID to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId start1 ');
        let idint = 1122;
        let result = dataUriUtils.attachId("com.ix.dataUriUtils", idint);
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId URI :' + result)

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/1122");
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId_test start1 successful ');

        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0200
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0200
     * @tc.desc   Attaches the given ID to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId start2 ');
        let idint = 0;
        let result = dataUriUtils.attachId("com.ix.dataUriUtils/777", idint);
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId URI :' + result)

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/777/0");
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId_test start2 successful ');

        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0300
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0300
     * @tc.desc   Attaches the given ID to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId start3 ');
        let idint = 456789;
        let result = dataUriUtils.attachId("com.ix.dataUriUtils/123", idint);
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId URI :' + result)

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/123/456789");
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId_test start3 successful ');

        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0400
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0400
     * @tc.desc   Attaches the given ID to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId start4 ');
        let idint = 123456789011;
        let result = dataUriUtils.attachId("com.ix.dataUriUtils", idint);
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId URI :' + result)

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/123456789011");
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId_test start4 successful ');

        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0500
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0500
     * @tc.desc   Attaches the given ID to the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_attachId_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId start5 ');
        let idint = -1;
        let result = dataUriUtils.attachId("com.ix.dataUriUtils", idint);
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId URI :' + result)

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/-1");
        hilog.info(DOMAIN, TAG, 'dataUriUtils attachId_test start5 successful ');

        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0100
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0100
     * @tc.desc   Deletes the ID from the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId start1 ');
          let result = dataUriUtils.deleteId("com.ix.dataUriUtils");
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI catch: ' + err?.code);
          expect(err?.code).assertEqual(401);
          done();
        }
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0200
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0200
     * @tc.desc   Deletes the ID from the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId start2 ');
        let result = dataUriUtils.deleteId("com.ix.dataUriUtils/1122");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI : ' + result);

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId_test start2 successful ');

        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0300
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0300
     * @tc.desc   Deletes the ID from the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId start3 ');
          let result = dataUriUtils.deleteId("com.ix.dataUriUtils1122");
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI catch: ' + err?.code);
          expect(`${err?.code}`).assertEqual('401');
          done();
        }
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0400
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0400
     * @tc.desc   Deletes the ID from the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId start4 ');
        let result = dataUriUtils.deleteId("com.ix.dataUriUtils/-1");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI : ' + result);

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId_test start4 successful ');

        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0500
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0500
     * @tc.desc   Deletes the ID from the end of the path component of the given URI. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_deleteId_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId start5 ');
        let result = dataUriUtils.deleteId("com.ix.dataUriUtils/1122/2211");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId URI : ' + result);

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/1122");
        hilog.info(DOMAIN, TAG, 'dataUriUtils deleteId_test start5 successful ');

        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0100
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0100
     * @tc.desc   Updates the ID in the specified dataUri. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start1 ');
        try {
          let idint = 1122;
          let result = dataUriUtils.updateId("com.ix.dataUriUtils", idint);
          hilog.info(DOMAIN, TAG, 'updateId updateId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(DOMAIN, TAG, 'updateId updateId URI catch: ' + err?.code);
          expect(`${err?.code}`).assertEqual('401');
          done();
        }
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0200
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0200
     * @tc.desc   Updates the ID in the specified dataUri. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start2 ');
        try {
          let idint = 1122;
          let result = dataUriUtils.updateId("com.ix.dataUriUtils/", idint)
          hilog.info(DOMAIN, TAG, 'updateId updateId URI : ' + result);
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(DOMAIN, TAG, 'updateId updateId URI catch: ' + err?.code);
          expect(`${err?.code}`).assertEqual('401');
          done();
        }
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0300
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0300
     * @tc.desc   Updates the ID in the specified dataUri. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start3 ');
        let idint = 3344;
        let result = dataUriUtils.updateId("com.ix.dataUriUtils/-1", idint)
        hilog.info(DOMAIN, TAG, 'updateId updateId URI : ' + result);

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/3344");
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId_test start3 successful ');

        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0400
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0400
     * @tc.desc   Updates the ID in the specified dataUri. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start4 ');
        let idint = 5566;
        let result = dataUriUtils.updateId("com.ix.dataUriUtils/123456789011", idint)
        hilog.info(DOMAIN, TAG, 'updateId updateId URI : ' + result);

        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/5566");
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId_test start4 successful ');

        done();
      })

    /**
     * @tc.name   Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0500
     * @tc.number Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0500
     * @tc.desc   Updates the ID in the specified dataUri. Check the return value of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityBase_dataUriUtils_updateId_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start5 ');

        let idint = 0;
        hilog.info(DOMAIN, TAG, 'dataUriUtils updateId start666 ');

        let result = dataUriUtils.updateId("com.ix.dataUriUtils/1122", idint)
        hilog.info(DOMAIN, TAG, 'updateId updateId URI : ' + result);
        expect(typeof (result)).assertEqual("string");
        expect(result).assertEqual("com.ix.dataUriUtils/0");
        done();
      })
  })
}
