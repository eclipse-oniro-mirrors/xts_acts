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

import { describe, expect, it, beforeAll, Level } from '@ohos/hypium';
import { ENTINFO1, INVALID_WANT, SELFHAPNAME, SELFWANT, PIXEL_MAP, getPixelMap, getInvalidPixelMap, INVALID_PIXEL_MAP } from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import securityManager from '@ohos.enterprise.securityManager';

export default function securityManagerTest() {
  describe('securityManager_test', () => {
    testSetScreenWatermarkImage();
    testCancelScreenWatermarkImage();
  })
}

  function testSetScreenWatermarkImage() {
    beforeAll((done: Function) => {
      getPixelMap();
      getInvalidPixelMap();
      done();
    })

  /**
   * @tc.name   test_setScreenWatermarkImage_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0200
   * @tc.desc   test setScreenWatermarkImage with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setScreenWatermarkImage(SELFWANT, PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0300
   * @tc.desc   test setScreenWatermarkImage with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setScreenWatermarkImage(null, PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0400
   * @tc.desc   test setScreenWatermarkImage with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0400", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setScreenWatermarkImage(undefined, PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0500
   * @tc.desc   test setScreenWatermarkImage with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0500", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setScreenWatermarkImage(INVALID_WANT, PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0600
   * @tc.desc   test setScreenWatermarkImage with null source
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setScreenWatermarkImage(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0700
   * @tc.desc   test setScreenWatermarkImage with undefined source
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setScreenWatermarkImage(SELFWANT, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0800
   * @tc.desc   test setScreenWatermarkImage success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_setScreenWatermarkImage_0800", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = securityManager.setScreenWatermarkImage(SELFWANT, PIXEL_MAP);
      expect(ret == null).assertTrue();
      securityManager.cancelScreenWatermarkImage(SELFWANT);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0100
   * @tc.desc   test setScreenWatermarkImage without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setScreenWatermarkImage(SELFWANT, PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0900
   * @tc.desc   test setScreenWatermarkImage with invalid pixelmap size
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setScreenWatermarkImage(SELFWANT, INVALID_PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testCancelScreenWatermarkImage() {
  /**
   * @tc.name   test_cancelScreenWatermarkImage_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0100
   * @tc.desc   test cancelScreenWatermarkImage without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancelScreenWatermarkImage_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.cancelScreenWatermarkImage(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_cancelScreenWatermarkImage_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0200
   * @tc.desc   test cancelScreenWatermarkImage with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancelScreenWatermarkImage_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.cancelScreenWatermarkImage(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_cancelScreenWatermarkImage_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0300
   * @tc.desc   test cancelScreenWatermarkImage with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancelScreenWatermarkImage_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.cancelScreenWatermarkImage(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_cancelScreenWatermarkImage_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0400
   * @tc.desc   test cancelScreenWatermarkImage with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancelScreenWatermarkImage_0400", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.cancelScreenWatermarkImage(undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_cancelScreenWatermarkImage_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0500
   * @tc.desc   test cancelScreenWatermarkImage with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancelScreenWatermarkImage_0500", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.cancelScreenWatermarkImage(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_cancelScreenWatermarkImage_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0600
   * @tc.desc   test cancelScreenWatermarkImage success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_cancelScreenWatermarkImage_0600", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = securityManager.cancelScreenWatermarkImage(SELFWANT);
      expect(ret == null).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}