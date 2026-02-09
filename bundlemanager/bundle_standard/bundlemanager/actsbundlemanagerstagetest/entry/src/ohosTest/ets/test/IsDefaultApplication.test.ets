/*
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
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import defaultAppMgr from '@ohos.bundle.defaultAppManager'

const PARAM_ERROR_CODE = 401;

export default function isDefaultApplicationTest() {
  describe('isDefaultApplicationTest', () => {

    /**
     * @tc.name   Sub_Bms_Framework_Status_DefaultApp_0900
     * @tc.number Sub_Bms_Framework_Status_DefaultApp_0900
     * @tc.desc   No default image application is set. Query and return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Status_DefaultApp_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      try {
        await defaultAppMgr.isDefaultApplication(defaultAppMgr.ApplicationType.IMAGE).then((data) => {
          console.info('Sub_Bms_Framework_Status_DefaultApp_0900  successfully: ' + JSON.stringify(data));
          expect(data).assertFalse();
        }).catch((error: BusinessError) => {
          console.info('Sub_Bms_Framework_Status_DefaultApp_0900 catch failed: ' + error);
          expect().assertFail();
        });
      } catch (err) {
        expect(err.code).assertEqual(801);
      }
      try {
        defaultAppMgr.isDefaultApplication(defaultAppMgr.ApplicationType.IMAGE, (err, data) => {
          console.info("Sub_Bms_Framework_Status_DefaultApp_0900 data--- " + data)
          console.info("Sub_Bms_Framework_Status_DefaultApp_0900 err--- " + err)
          expect(data).assertFalse()
          expect(err).assertEqual(null)
          done()
        })
      } catch (err) {
        expect(err.code).assertEqual(801);
        done()
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Status_DefaultApp_0650
     * @tc.number Sub_Bms_Framework_Status_DefaultApp_0650
     * @tc.desc   The parameter type is correct, the string format is incorrect, return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Status_DefaultApp_0650', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      try {
        await defaultAppMgr.isDefaultApplication("image/").then((data) => {
          console.info('Sub_Bms_Framework_Status_DefaultApp_0650  successfully: ' + JSON.stringify(data));
          expect(data).assertFalse();
          done();
        }).catch((error: BusinessError) => {
          console.info('Sub_Bms_Framework_Status_DefaultApp_0650 catch failed: ' + error);
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect(err.code).assertEqual(801);
        done();
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Status_DefaultApp_1150
     * @tc.number Sub_Bms_Framework_Status_DefaultApp_1150
     * @tc.desc   The parameter type is correct, the string format is incorrect, return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_Status_DefaultApp_1150', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      try {
        await defaultAppMgr.isDefaultApplication("abc").then((data) => {
          console.info('Sub_Bms_Framework_Status_DefaultApp_1150  successfully: ' + JSON.stringify(data));
          expect(data).assertFalse();
          done();
        }).catch((error: BusinessError) => {
          console.info('Sub_Bms_Framework_Status_DefaultApp_1150 catch failed: ' + error);
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect(err.code).assertEqual(801);
        done();
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Status_DefaultApp_1200
     * @tc.number Sub_Bms_Framework_Status_DefaultApp_1200
     * @tc.desc   ApplicationType is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Status_DefaultApp_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      expect(typeof (defaultAppMgr.ApplicationType.BROWSER)).assertEqual("string");
      expect(defaultAppMgr.ApplicationType.BROWSER).assertEqual("Web Browser");

      expect(typeof (defaultAppMgr.ApplicationType.IMAGE)).assertEqual("string");
      expect(defaultAppMgr.ApplicationType.IMAGE).assertEqual("Image Gallery");

      expect(typeof (defaultAppMgr.ApplicationType.AUDIO)).assertEqual("string");
      expect(defaultAppMgr.ApplicationType.AUDIO).assertEqual("Audio Player");

      expect(typeof (defaultAppMgr.ApplicationType.VIDEO)).assertEqual("string");
      expect(defaultAppMgr.ApplicationType.VIDEO).assertEqual("Video Player");

      expect(typeof (defaultAppMgr.ApplicationType.PDF)).assertEqual("string");
      expect(defaultAppMgr.ApplicationType.PDF).assertEqual("PDF Viewer");

      expect(typeof (defaultAppMgr.ApplicationType.WORD)).assertEqual("string");
      expect(defaultAppMgr.ApplicationType.WORD).assertEqual("Word Viewer");

      expect(typeof (defaultAppMgr.ApplicationType.EXCEL)).assertEqual("string");
      expect(defaultAppMgr.ApplicationType.EXCEL).assertEqual("Excel Viewer");

      expect(typeof (defaultAppMgr.ApplicationType.PPT)).assertEqual("string");
      expect(defaultAppMgr.ApplicationType.PPT).assertEqual("PPT Viewer");

      expect(typeof (defaultAppMgr.ApplicationType.EMAIL)).assertEqual("string");
      expect(defaultAppMgr.ApplicationType.EMAIL).assertEqual("Email");
      done()
    });

    /**
     * @tc.name   testIsDefaultApplicationNotExistedType
     * @tc.number Sub_Bms_Framework_Status_DefaultApp_2550
     * @tc.desc   The parameter type is correct, the string format is incorrect, return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDefaultApplicationNotExistedType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      try {
        let data = defaultAppMgr.isDefaultApplicationSync("abc");
        expect(data).assertFalse();
        done();
      } catch (err) {
        expect(err.code).assertEqual(801);
        done();
      }
    });

    /**
     * @tc.name   testIsDefaultApplicationNullType
     * @tc.number SUB_BMS_DEFAULTAPP_QUERY_0053
     * @tc.desc   The parameter type is null, the string format is incorrect, return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsDefaultApplicationNullType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      try {
        let data = defaultAppMgr.isDefaultApplicationSync(null);
        expect(data).assertFail();
        done();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
        } else if (err.code === 401){
          expect(err.code).assertEqual(401);
        } else {
          expect().assertFail();
        }
        done();
      }
    });

    /**
     * @tc.name   testIsDefaultApplicationUndefinedType
     * @tc.number SUB_BMS_DEFAULTAPP_QUERY_0053
     * @tc.desc   The parameter type is undefined, the string format is incorrect, return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsDefaultApplicationUndefinedType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      try {
        let data = defaultAppMgr.isDefaultApplicationSync(undefined);
        expect(data).assertFail();
        done();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
        } else if (err.code === 401){
          expect(err.code).assertEqual(401);
        } else {
          expect().assertFail();
        }
        done();
      }
    });
  })
}