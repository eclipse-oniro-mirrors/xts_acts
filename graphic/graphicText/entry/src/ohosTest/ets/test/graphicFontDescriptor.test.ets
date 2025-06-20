/**
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

import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text"
import fileIo from '@ohos.file.fs';

const STYLISH_FONT_CONFIG_FILE = "/system/fonts/visibility_list.json";
const STYLISH_FONT_CONFIG_PROD_FILE = "/sys_prod/fonts/visibility_list.json";
const INSTALLED_FONT_CONFIG_FILE = "/data/service/el1/public/for-all-app/fonts/install_fontconfig.json";

export default function graphicFontDescriptorTest() {
  describe('graphicFontDescriptor_test', () => {
    beforeAll(() => {})

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testMatchingFontDescriptors001
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let msg = "testMatchingFontDescriptors001"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({})
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0);
          done();
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get all desc failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_002
     * @tc.name      : testMatchingFontDescriptors002
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let msg = "testMatchingFontDescriptors002"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({
          weight: -1,
        })
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done()
        })
      } catch (err) {
        console.error(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_003
     * @tc.name      : testMatchingFontDescriptors003
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let msg = "testMatchingFontDescriptors003"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({
          weight: null,
        });
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_004
     * @tc.name      : testMatchingFontDescriptors004
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let msg = "testMatchingFontDescriptors004"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({
          weight: undefined,
        });
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_005
     * @tc.name      : testMatchingFontDescriptors005
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let msg = "testMatchingFontDescriptors005"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors(null);
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_006
     * @tc.name      : testMatchingFontDescriptors006
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let msg = "testMatchingFontDescriptors006"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors(undefined);
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_007
     * @tc.name      : testMatchingFontDescriptors007
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let msg = "testMatchingFontDescriptors007"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({
          fontFamily: "HarmonyOS Sans"
        });
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0);
          expect(data[0].fontFamily).assertEqual("HarmonyOS Sans");
          done()
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get HarmonyOS Sans font failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_008
     * @tc.name      : testMatchingFontDescriptors008
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let msg = "testMatchingFontDescriptors008"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({
          fontFamily: "HarmonyOS Sans",
          weight: text.FontWeight.W400,
        });
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0);
          expect(data[0].fontFamily).assertEqual("HarmonyOS Sans");
          expect(data[0].weight).assertEqual(text.FontWeight.W400);
          done()
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get HarmonyOS Sans font failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_009
     * @tc.name      : testGetSystemFontFullNamesByType001
     * @tc.desc      : To test interface getSystemFontFullNamesByType of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetSystemFontFullNamesByType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function) => {
      let msg = "testGetSystemFontFullNamesByType001"
      console.info(msg + ' begin');
      try {
        let promise = text.getSystemFontFullNamesByType(text.SystemFontType.GENERIC)
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0)
          done()
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get font full names by type failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_010
     * @tc.name      : testGetSystemFontFullNamesByType002
     * @tc.desc      : To test interface getSystemFontFullNamesByType of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetSystemFontFullNamesByType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let msg = "testGetSystemFontFullNamesByType002"
      console.info(msg + ' begin');
      if (!fileIo.accessSync(STYLISH_FONT_CONFIG_FILE) && !fileIo.accessSync(STYLISH_FONT_CONFIG_PROD_FILE)) {
        done();
        return;
      }
      try {
        let promise = text.getSystemFontFullNamesByType(text.SystemFontType.STYLISH);
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0);
          done();
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get font full names by type failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_011
     * @tc.name      : testGetSystemFontFullNamesByType003
     * @tc.desc      : To test interface getSystemFontFullNamesByType of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetSystemFontFullNamesByType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function) => {
      let msg = "testGetSystemFontFullNamesByType003"
      console.info(msg + ' begin');
      if (!fileIo.accessSync(INSTALLED_FONT_CONFIG_FILE)) {
        done();
        return;
      }
      try {
        let promise = text.getSystemFontFullNamesByType(text.SystemFontType.INSTALLED)
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0)
          done()
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get font full names by type failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_012
     * @tc.name      : testGetSystemFontFullNamesByType004
     * @tc.desc      : To test interface getSystemFontFullNamesByType of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetSystemFontFullNamesByType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function) => {
      let msg = "testGetSystemFontFullNamesByType004"
      console.info(msg + ' begin');
      try {
        let promise = text.getSystemFontFullNamesByType(text.SystemFontType.ALL)
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0)
          done()
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get font full names by type failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_013
     * @tc.name      : testGetSystemFontFullNamesByType005
     * @tc.desc      : To test interface getSystemFontFullNamesByType of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetSystemFontFullNamesByType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function) => {
      let msg = "testGetSystemFontFullNamesByType005"
      console.info(msg + ' begin');
      if (!fileIo.accessSync(INSTALLED_FONT_CONFIG_FILE) &&
        !fileIo.accessSync(STYLISH_FONT_CONFIG_FILE) && !fileIo.accessSync(STYLISH_FONT_CONFIG_PROD_FILE)) {
        done();
        return;
      }
      try {
        let promise = text.getSystemFontFullNamesByType(text.SystemFontType.STYLISH | text.SystemFontType.INSTALLED)
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0)
          done()
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get font full names by type failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_014
     * @tc.name      : testGetSystemFontFullNamesByType006
     * @tc.desc      : To test interface getSystemFontFullNamesByType of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetSystemFontFullNamesByType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function) => {
      let msg = "testGetSystemFontFullNamesByType006"
      console.info(msg + ' begin');
      try {
        let promise = text.getSystemFontFullNamesByType(0b10000)
        await promise.then(async (data) => {
          expect(data.length).assertEqual(0);
          done();
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get font full names by type failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_015
     * @tc.name      : testGetSystemFontFullNamesByType007
     * @tc.desc      : To test interface getSystemFontFullNamesByType of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetSystemFontFullNamesByType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function) => {
      let msg = "testGetSystemFontFullNamesByType007"
      console.info(msg + ' begin');
      try {
        let promise = text.getSystemFontFullNamesByType(null);
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done();
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_016
     * @tc.name      : testGetSystemFontFullNamesByType008
     * @tc.desc      : To test interface getSystemFontFullNamesByType of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetSystemFontFullNamesByType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function) => {
      let msg = "testGetSystemFontFullNamesByType008"
      console.info(msg + ' begin');
      try {
        let promise = text.getSystemFontFullNamesByType(undefined);
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done();
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_017
     * @tc.name      : testGetFontDescriptorByFullName001
     * @tc.desc      : To test interface getFontDescriptorByFullName of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetFontDescriptorByFullName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function) => {
      let msg = "testGetFontDescriptorByFullName001"
      console.info(msg + ' begin');
      try {
        let promise = text.getFontDescriptorByFullName("HarmonyOS Sans", text.SystemFontType.GENERIC)
        await promise.then(async (data) => {
          expect(data).not().assertEqual(undefined)
          expect(data.fullName).assertEqual("HarmonyOS Sans");
          done()
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get font descriptor by full name failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_018
     * @tc.name      : testGetFontDescriptorByFullName002
     * @tc.desc      : To test interface getFontDescriptorByFullName of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetFontDescriptorByFullName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function) => {
      let msg = "testGetFontDescriptorByFullName002"
      console.info(msg + ' begin');
      try {
        let promise = text.getFontDescriptorByFullName("abcd", text.SystemFontType.ALL)
        await promise.then(async (data) => {
          expect(data).assertEqual(undefined);
          done();
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get font descriptor by full name failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_019
     * @tc.name      : testGetFontDescriptorByFullName003
     * @tc.desc      : To test interface getFontDescriptorByFullName of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetFontDescriptorByFullName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function) => {
      let msg = "testGetFontDescriptorByFullName003"
      console.info(msg + ' begin');
      try {
        let promise = text.getFontDescriptorByFullName(null, text.SystemFontType.ALL);
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done();
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_020
     * @tc.name      : testGetFontDescriptorByFullName004
     * @tc.desc      : To test interface getFontDescriptorByFullName of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetFontDescriptorByFullName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function) => {
      let msg = "testGetFontDescriptorByFullName004"
      console.info(msg + ' begin');
      try {
        let promise = text.getFontDescriptorByFullName(undefined, text.SystemFontType.ALL);
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done();
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

  })
}