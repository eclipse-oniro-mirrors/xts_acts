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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

export default function colorSpaceManagerTest(context, windowStage, abilityStorage) {
  describe('colorSpaceManagerTest', function () {
    console.info('describe colorSpaceManagerTest start!!!');
    beforeAll(function () {
      console.info('before all');
    })
    beforeEach(function () {
      console.info('before each');
    })
    afterEach(async function (done) {
      console.info('afterEach');
      done();
    })
    afterAll(function () {
      console.info('afterAll');
    })

    /**
     * @tc.number     SUB_GRAPHIC_ENUMCOLORSPACE_JSAPI_001
     * @tc.name       Test enumcolorspace_Test_001
     * @tc.desc       test the value of enum color space
     */
    it('SUB_GRAPHIC_ENUMCOLORSPACE_JSAPI_001', 0, async function (done) {
      console.info('test the enum value of ColorSpace Manager begin');
      try {
        expect(0).assertEqual(colorSpaceManager.ColorSpace.UNKNOWN);
        expect(1).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        expect(2).assertEqual(colorSpaceManager.ColorSpace.DCI_P3);
        expect(3).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3);
        expect(4).assertEqual(colorSpaceManager.ColorSpace.SRGB);
        expect(5).assertEqual(colorSpaceManager.ColorSpace.CUSTOM);
        expect(6).assertEqual(colorSpaceManager.ColorSpace.BT709);
        expect(7).assertEqual(colorSpaceManager.ColorSpace.BT601_EBU);
        expect(8).assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C);
        expect(9).assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG);
        expect(10).assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ);
        expect(11).assertEqual(colorSpaceManager.ColorSpace.P3_HLG);
        expect(12).assertEqual(colorSpaceManager.ColorSpace.P3_PQ);
        expect(13).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT);
        expect(14).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT);
        expect(15).assertEqual(colorSpaceManager.ColorSpace.SRGB_LIMIT);
        expect(16).assertEqual(colorSpaceManager.ColorSpace.BT709_LIMIT);
        expect(17).assertEqual(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT);
        expect(18).assertEqual(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT);
        expect(19).assertEqual(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT);
        expect(20).assertEqual(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT);
        expect(21).assertEqual(colorSpaceManager.ColorSpace.P3_HLG_LIMIT);
        expect(22).assertEqual(colorSpaceManager.ColorSpace.P3_PQ_LIMIT);
        expect(23).assertEqual(colorSpaceManager.ColorSpace.LINEAR_P3);
        expect(24).assertEqual(colorSpaceManager.ColorSpace.LINEAR_SRGB);
        expect(25).assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT2020);
        expect(24).assertEqual(colorSpaceManager.ColorSpace.LINEAR_BT709);
        expect(4).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
        expect(3).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB);
        expect(11).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG);
        expect(12).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ);
        done();
      } catch (err) {
        console.info('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_GRAPHIC_CREATE_JSAPI_002
     * @tc.name       Test createcolorspacemanager_Test_002
     * @tc.desc       test the interface of create
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_002', 0, async function (done) {
      console.info('test createcolorspacemanager begin');
      try {
            var csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
            expect(csManager!= null).assertTrue();
            var colorSpaceName = csManager.getColorSpaceName();
            console.info("the name is " + colorSpaceName);
            expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
            done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_GRAPHIC_CREATE_JSAPI_003
     * @tc.name       Test createcolorspacemanager_Test_003
     * @tc.desc       test the interface of create
    */
    it('SUB_GRAPHIC_CREATE_JSAPI_003', 0, async function (done) {
      console.info('test createcolorspacemanager begin');
      try {
        var csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.UNKNOWN);
        expect(csManager!= null).assertTrue();
        var colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.UNKNOWN);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager not support error ' + JSON.stringify(err));
        expect(err.code).assertEqual(18600001);
        done();
      }
    })

    /**
     * @tc.number     SUB_GRAPHIC_CREATE_JSAPI_004
     * @tc.name       Test createcolorspacemanager_Test_004
     * @tc.desc       test the interface of create
    */
    it('SUB_GRAPHIC_CREATE_JSAPI_004', 0, async function (done) {
      console.info('test createcolorspacemanager begin');
      try {
        var csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3);
        expect(csManager!= null).assertTrue();
        var colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.DCI_P3);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_GRAPHIC_CREATE_JSAPI_005
     * @tc.name       Test createcolorspacemanager_Test_005
     * @tc.desc       test the interface of create
    */
    it('SUB_GRAPHIC_CREATE_JSAPI_005', 0, async function (done) {
      console.info('test createcolorspacemanager begin');
      try {
        var csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3);
        expect(csManager!= null).assertTrue();
        var colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_GRAPHIC_CREATE_JSAPI_006
     * @tc.name       Test createcolorspacemanager_Test_006
     * @tc.desc       test the interface of create
     */
    it('SUB_GRAPHIC_CREATE_JSAPI_006', 0, async function (done) {
      console.info('test createcolorspacemanager begin');
      try {
        var csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
        expect(csManager!= null).assertTrue();
        var colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.SRGB);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_GRAPHIC_CREATE_JSAPI_007
     * @tc.name       Test createcolorspacemanager_Test_007
     * @tc.desc       test the interface of create colorSpaceManager.ColorSpace.CUSTOM invalid
    */
    it('SUB_GRAPHIC_CREATE_JSAPI_007', 0, async function (done) {
      console.info('test createcolorspacemanager begin');
      try {
        var csManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.CUSTOM);
        expect(csManager != null).assertTrue();
        var colorSpaceName = csManager.getColorSpaceName();
        console.info("the name is " + colorSpaceName);
        expect(colorSpaceName).assertEqual(colorSpaceManager.ColorSpace.UNKNOWN);
        done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager not support error ' + JSON.stringify(err));
        expect(err.code == 18600001).assertTrue();
        done();
      }
    })


    /**
     * @tc.number     SUB_GRAPHIC_CREATE_JSAPI_008
     * @tc.name       Test createcolorspacemanager_Test_008
     * @tc.desc       test the interface of create
    */
    it('SUB_GRAPHIC_CREATE_JSAPI_008', 0, async function (done) {
      console.info('test createcolorspacemanager08 begin');
      try {
           let primaries:colorSpaceManager.ColorSpacePrimaries = {
               redX: 0.64,
               redY: 0.33,
               greenX: 0.3,
               greenY: 0.6,
               blueX: 0.15,
               blueY: 0.06,
               whitePointX: 0.3127,
               whitePointY: 0.3290
           };
           var gamma = 2.875;
           var colorSpaceMgr = colorSpaceManager.create(primaries, gamma);
           expect(colorSpaceMgr!= null).assertTrue();
           var ga = colorSpaceMgr.getGamma();
           var gap = ga - gamma;
           var wp:number[] = colorSpaceMgr.getWhitePoint();
           expect(gap == 0).assertTrue();
           expect(Math.abs(primaries.whitePointX -wp[0] ) <= 0.00001).assertTrue();
           expect(Math.abs(primaries.whitePointY - wp[1] ) <= 0.00001).assertTrue();
           done();
      } catch (err) {
        console.log('test enum value of ColorSpace Manager error ' + JSON.stringify(err));
        expect.assertFail();
        done();
      }
    })

  })
}
